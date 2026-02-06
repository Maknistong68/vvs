// Audit Logger Service
// Provides functions for logging and retrieving audit trail entries

import { supabase, AuditLog } from './supabase';
import { logger } from './logger';

export type EntityType = 'vehicle' | 'user' | 'company' | 'settings';
export type AuditAction = 'status_change' | 'create' | 'update' | 'delete';

interface LogEntryParams {
  entityType: EntityType;
  entityId: string;
  action: AuditAction;
  fieldName?: string;
  oldValue?: string | null;
  newValue?: string | null;
  changedBy: string;
  companyId?: string;
  metadata?: Record<string, unknown>;
}

/**
 * Log a single audit entry
 */
export async function logAuditEntry({
  entityType,
  entityId,
  action,
  fieldName,
  oldValue,
  newValue,
  changedBy,
  companyId,
  metadata,
}: LogEntryParams): Promise<void> {
  try {
    const { error } = await supabase.from('audit_logs').insert({
      entity_type: entityType,
      entity_id: entityId,
      action,
      field_name: fieldName || null,
      old_value: oldValue || null,
      new_value: newValue || null,
      changed_by: changedBy,
      company_id: companyId || null,
      metadata: metadata || null,
    });

    if (error) {
      logger.error('Failed to log audit entry', error, { entityType, entityId, action });
    } else {
      logger.debug('Audit entry logged', { entityType, entityId, action });
    }
  } catch (err) {
    // Don't throw - audit logging should not break the main operation
    logger.error('Audit logging failed silently', err);
  }
}

/**
 * Log a vehicle status change
 */
export async function logStatusChange(
  vehicleId: string,
  oldStatus: string,
  newStatus: string,
  userId: string,
  companyId?: string,
  metadata?: { reason?: string; notes?: string }
): Promise<void> {
  await logAuditEntry({
    entityType: 'vehicle',
    entityId: vehicleId,
    action: 'status_change',
    fieldName: 'actual_status',
    oldValue: oldStatus,
    newValue: newStatus,
    changedBy: userId,
    companyId,
    metadata,
  });
}

/**
 * Log a blacklist status change
 */
export async function logBlacklistChange(
  vehicleId: string,
  oldValue: boolean,
  newValue: boolean,
  userId: string,
  companyId?: string,
  metadata?: { reason?: string }
): Promise<void> {
  await logAuditEntry({
    entityType: 'vehicle',
    entityId: vehicleId,
    action: 'status_change',
    fieldName: 'is_blacklisted',
    oldValue: oldValue ? 'true' : 'false',
    newValue: newValue ? 'true' : 'false',
    changedBy: userId,
    companyId,
    metadata,
  });
}

/**
 * Log a vehicle creation
 */
export async function logVehicleCreation(
  vehicleId: string,
  plateNumber: string,
  userId: string,
  companyId?: string
): Promise<void> {
  await logAuditEntry({
    entityType: 'vehicle',
    entityId: vehicleId,
    action: 'create',
    newValue: plateNumber,
    changedBy: userId,
    companyId,
    metadata: { plate_number: plateNumber },
  });
}

/**
 * Log a vehicle deletion
 */
export async function logVehicleDeletion(
  vehicleId: string,
  plateNumber: string,
  userId: string,
  companyId?: string
): Promise<void> {
  await logAuditEntry({
    entityType: 'vehicle',
    entityId: vehicleId,
    action: 'delete',
    oldValue: plateNumber,
    changedBy: userId,
    companyId,
    metadata: { plate_number: plateNumber },
  });
}

/**
 * Log a setting change
 */
export async function logSettingChange(
  settingKey: string,
  oldValue: unknown,
  newValue: unknown,
  userId: string,
  companyId?: string
): Promise<void> {
  await logAuditEntry({
    entityType: 'settings',
    entityId: settingKey,
    action: 'update',
    fieldName: settingKey,
    oldValue: JSON.stringify(oldValue),
    newValue: JSON.stringify(newValue),
    changedBy: userId,
    companyId,
  });
}

/**
 * Get audit logs for a specific entity
 */
export async function getAuditLogs(
  entityType: EntityType,
  entityId: string,
  limit = 50
): Promise<AuditLog[]> {
  const { data, error } = await supabase
    .from('audit_logs')
    .select('*')
    .eq('entity_type', entityType)
    .eq('entity_id', entityId)
    .order('changed_at', { ascending: false })
    .limit(limit);

  if (error) {
    logger.error('Failed to fetch audit logs', error, { entityType, entityId });
    throw error;
  }

  return data || [];
}

/**
 * Get all audit logs for a company
 */
export async function getCompanyAuditLogs(
  companyId: string,
  options?: {
    entityType?: EntityType;
    action?: AuditAction;
    limit?: number;
    offset?: number;
  }
): Promise<{ logs: AuditLog[]; total: number }> {
  let query = supabase
    .from('audit_logs')
    .select('*', { count: 'exact' })
    .eq('company_id', companyId)
    .order('changed_at', { ascending: false });

  if (options?.entityType) {
    query = query.eq('entity_type', options.entityType);
  }

  if (options?.action) {
    query = query.eq('action', options.action);
  }

  const limit = options?.limit || 50;
  const offset = options?.offset || 0;
  query = query.range(offset, offset + limit - 1);

  const { data, error, count } = await query;

  if (error) {
    logger.error('Failed to fetch company audit logs', error, { companyId });
    throw error;
  }

  return {
    logs: data || [],
    total: count || 0,
  };
}

/**
 * Get recent audit logs (for dashboard)
 */
export async function getRecentAuditLogs(
  companyId?: string,
  limit = 10
): Promise<AuditLog[]> {
  let query = supabase
    .from('audit_logs')
    .select('*')
    .order('changed_at', { ascending: false })
    .limit(limit);

  if (companyId) {
    query = query.eq('company_id', companyId);
  }

  const { data, error } = await query;

  if (error) {
    logger.error('Failed to fetch recent audit logs', error);
    throw error;
  }

  return data || [];
}
