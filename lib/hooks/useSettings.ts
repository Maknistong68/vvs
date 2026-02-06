// App Settings Hooks with React Query
// Provides hooks for fetching and updating app-wide settings

import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import {
  supabase,
  AppSettings,
  SettingKey,
  KpiType,
  DEFAULT_DASHBOARD_KPIS,
} from '../supabase';
import { logger } from '../logger';

// Query keys for settings
export const settingsQueryKeys = {
  all: ['settings'] as const,
  byKey: (key: SettingKey, companyId?: string) => [...settingsQueryKeys.all, key, companyId] as const,
  dashboard: (companyId?: string) => [...settingsQueryKeys.all, 'dashboard', companyId] as const,
};

// Fetch a single setting by key
async function fetchSetting<T>(
  key: SettingKey,
  companyId?: string
): Promise<T | null> {
  let query = supabase
    .from('app_settings')
    .select('*')
    .eq('setting_key', key);

  if (companyId) {
    query = query.eq('company_id', companyId);
  } else {
    query = query.is('company_id', null);
  }

  const { data, error } = await query.maybeSingle();

  if (error) {
    logger.error('Failed to fetch setting', error, { key, companyId });
    throw error;
  }

  return data?.setting_value as T | null;
}

// Fetch all settings for a company (or global)
async function fetchAllSettings(companyId?: string): Promise<Record<SettingKey, unknown>> {
  let query = supabase
    .from('app_settings')
    .select('*');

  if (companyId) {
    query = query.eq('company_id', companyId);
  } else {
    query = query.is('company_id', null);
  }

  const { data, error } = await query;

  if (error) {
    logger.error('Failed to fetch all settings', error, { companyId });
    throw error;
  }

  const settings: Record<string, unknown> = {};
  data?.forEach((item: AppSettings) => {
    settings[item.setting_key] = item.setting_value;
  });

  return settings as Record<SettingKey, unknown>;
}

// Update or create a setting
async function upsertSetting<T>(
  key: SettingKey,
  value: T,
  userId: string,
  companyId?: string
): Promise<AppSettings> {
  // First check if setting exists
  let existingQuery = supabase
    .from('app_settings')
    .select('id')
    .eq('setting_key', key);

  if (companyId) {
    existingQuery = existingQuery.eq('company_id', companyId);
  } else {
    existingQuery = existingQuery.is('company_id', null);
  }

  const { data: existing } = await existingQuery.maybeSingle();

  let result;
  if (existing) {
    // Update existing
    result = await supabase
      .from('app_settings')
      .update({
        setting_value: value as Record<string, unknown>,
        updated_by: userId,
        updated_at: new Date().toISOString(),
      })
      .eq('id', existing.id)
      .select()
      .single();
  } else {
    // Insert new
    result = await supabase
      .from('app_settings')
      .insert({
        setting_key: key,
        setting_value: value as Record<string, unknown>,
        company_id: companyId || null,
        updated_by: userId,
      })
      .select()
      .single();
  }

  if (result.error) {
    logger.error('Failed to upsert setting', result.error, { key, companyId });
    throw result.error;
  }

  logger.logUserAction('setting_updated', { key, companyId });
  return result.data;
}

// === HOOKS ===

/**
 * Hook to fetch dashboard KPI settings
 */
// W18: Settings change rarely - use 30min staleTime
const SETTINGS_STALE_TIME = 30 * 60 * 1000;

export function useDashboardKpiSettings(companyId?: string) {
  return useQuery({
    queryKey: settingsQueryKeys.byKey('dashboard_kpis', companyId),
    queryFn: async () => {
      const result = await fetchSetting<KpiType[]>('dashboard_kpis', companyId);
      return result || DEFAULT_DASHBOARD_KPIS;
    },
    staleTime: SETTINGS_STALE_TIME,
  });
}

/**
 * Hook to fetch companies visibility settings
 */
export function useCompaniesVisibilitySettings(companyId?: string) {
  return useQuery({
    queryKey: settingsQueryKeys.byKey('companies_visible_to', companyId),
    queryFn: async () => {
      const result = await fetchSetting<string[]>('companies_visible_to', companyId);
      return result || ['owner']; // Default: only owner can see companies
    },
    staleTime: SETTINGS_STALE_TIME,
  });
}

/**
 * Hook to fetch audit settings
 */
export function useAuditSettings(companyId?: string) {
  return useQuery({
    queryKey: settingsQueryKeys.byKey('audit_enabled', companyId),
    queryFn: async () => {
      const result = await fetchSetting<boolean>('audit_enabled', companyId);
      return result ?? true; // Default: audit enabled
    },
    staleTime: SETTINGS_STALE_TIME,
  });
}

/**
 * Hook to fetch all app settings
 */
export function useAppSettings(companyId?: string) {
  return useQuery({
    queryKey: settingsQueryKeys.dashboard(companyId),
    queryFn: () => fetchAllSettings(companyId),
  });
}

/**
 * Hook to update a setting
 */
export function useUpdateSetting() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async ({
      key,
      value,
      userId,
      companyId,
    }: {
      key: SettingKey;
      value: unknown;
      userId: string;
      companyId?: string;
    }) => upsertSetting(key, value, userId, companyId),
    onSuccess: (_, variables) => {
      // Invalidate related queries
      queryClient.invalidateQueries({ queryKey: settingsQueryKeys.all });
      queryClient.invalidateQueries({
        queryKey: settingsQueryKeys.byKey(variables.key, variables.companyId),
      });
    },
    onError: (error) => {
      logger.error('Update setting mutation failed', error);
    },
  });
}

/**
 * Hook to update dashboard KPI settings
 */
export function useUpdateDashboardKpis() {
  const updateSetting = useUpdateSetting();

  return {
    ...updateSetting,
    mutate: (kpis: KpiType[], userId: string, companyId?: string) => {
      updateSetting.mutate({
        key: 'dashboard_kpis',
        value: kpis,
        userId,
        companyId,
      });
    },
    mutateAsync: (kpis: KpiType[], userId: string, companyId?: string) => {
      return updateSetting.mutateAsync({
        key: 'dashboard_kpis',
        value: kpis,
        userId,
        companyId,
      });
    },
  };
}

/**
 * Hook to update companies visibility settings
 */
export function useUpdateCompaniesVisibility() {
  const updateSetting = useUpdateSetting();

  return {
    ...updateSetting,
    mutate: (roles: string[], userId: string, companyId?: string) => {
      updateSetting.mutate({
        key: 'companies_visible_to',
        value: roles,
        userId,
        companyId,
      });
    },
    mutateAsync: (roles: string[], userId: string, companyId?: string) => {
      return updateSetting.mutateAsync({
        key: 'companies_visible_to',
        value: roles,
        userId,
        companyId,
      });
    },
  };
}

/**
 * Hook to update audit settings
 */
export function useUpdateAuditSettings() {
  const updateSetting = useUpdateSetting();

  return {
    ...updateSetting,
    mutate: (enabled: boolean, userId: string, companyId?: string) => {
      updateSetting.mutate({
        key: 'audit_enabled',
        value: enabled,
        userId,
        companyId,
      });
    },
    mutateAsync: (enabled: boolean, userId: string, companyId?: string) => {
      return updateSetting.mutateAsync({
        key: 'audit_enabled',
        value: enabled,
        userId,
        companyId,
      });
    },
  };
}
