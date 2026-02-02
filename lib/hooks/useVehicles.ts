// Vehicle Data Hooks with React Query
// Provides cached, deduplicated data fetching for vehicles

import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { supabase, VehicleEquipment, DashboardStats, VehicleStatus } from '../supabase';
import { queryKeys, invalidateVehicleQueries } from '../queryClient';
import { logger } from '../logger';
import { DEFAULT_PAGE_SIZE } from '../constants';

// Fetch dashboard stats - optimized to single query
async function fetchDashboardStats(companyId?: string): Promise<DashboardStats> {
  const startTime = Date.now();
  logger.debug('Fetching dashboard stats', { companyId });

  // Build base query
  let query = supabase.from('vehicles_equipment').select('actual_status, is_blacklisted, next_inspection_date');

  if (companyId) {
    query = query.eq('company_id', companyId);
  }

  const { data, error } = await query;

  if (error) {
    logger.error('Failed to fetch dashboard stats', error);
    throw error;
  }

  const today = new Date().toISOString().split('T')[0];

  // Calculate all stats from single query result
  const stats: DashboardStats = {
    total: data?.length || 0,
    verified: data?.filter(v => v.actual_status === 'verified').length || 0,
    rejected: data?.filter(v => v.actual_status === 'rejected').length || 0,
    pending: data?.filter(v => v.actual_status === 'pending').length || 0,
    overdue: data?.filter(v => v.next_inspection_date && v.next_inspection_date < today).length || 0,
    blacklisted: data?.filter(v => v.is_blacklisted).length || 0,
  };

  logger.logPerformance('fetchDashboardStats', Date.now() - startTime, { companyId });
  return stats;
}

// Fetch equipment type breakdown
async function fetchEquipmentTypeBreakdown(companyId?: string): Promise<{ type: string; count: number }[]> {
  let query = supabase.from('vehicles_equipment').select('equipment_type');

  if (companyId) {
    query = query.eq('company_id', companyId);
  }

  const { data, error } = await query;

  if (error) {
    logger.error('Failed to fetch equipment breakdown', error);
    throw error;
  }

  const typeCounts: Record<string, number> = {};
  data?.forEach(v => {
    typeCounts[v.equipment_type] = (typeCounts[v.equipment_type] || 0) + 1;
  });

  return Object.entries(typeCounts)
    .sort((a, b) => b[1] - a[1])
    .slice(0, 5)
    .map(([type, count]) => ({ type, count }));
}

// Fetch vehicles list with pagination
interface FetchVehiclesParams {
  companyId?: string;
  page?: number;
  pageSize?: number;
  status?: VehicleStatus | 'all';
  search?: string;
}

async function fetchVehicles({
  companyId,
  page = 1,
  pageSize = DEFAULT_PAGE_SIZE,
  status,
  search,
}: FetchVehiclesParams): Promise<{ vehicles: VehicleEquipment[]; total: number }> {
  const startTime = Date.now();
  logger.debug('Fetching vehicles', { companyId, page, pageSize, status, search });

  let query = supabase
    .from('vehicles_equipment')
    .select('*', { count: 'exact' })
    .order('plate_number');

  if (companyId) {
    query = query.eq('company_id', companyId);
  }

  if (status && status !== 'all') {
    query = query.eq('actual_status', status);
  }

  if (search) {
    const searchLower = search.toLowerCase();
    query = query.or(
      `plate_number.ilike.%${searchLower}%,driver_name.ilike.%${searchLower}%,client_company.ilike.%${searchLower}%`
    );
  }

  // Pagination
  const from = (page - 1) * pageSize;
  const to = from + pageSize - 1;
  query = query.range(from, to);

  const { data, error, count } = await query;

  if (error) {
    logger.error('Failed to fetch vehicles', error);
    throw error;
  }

  logger.logPerformance('fetchVehicles', Date.now() - startTime, { count: data?.length });
  return {
    vehicles: data || [],
    total: count || 0,
  };
}

// Fetch single vehicle
async function fetchVehicle(id: string): Promise<VehicleEquipment> {
  const { data, error } = await supabase
    .from('vehicles_equipment')
    .select('*, project:projects(*), gate:gates(*)')
    .eq('id', id)
    .single();

  if (error) {
    logger.error('Failed to fetch vehicle', error, { vehicleId: id });
    throw error;
  }

  return data;
}

// Update vehicle
async function updateVehicle(
  id: string,
  updates: Partial<VehicleEquipment>
): Promise<VehicleEquipment> {
  const { data, error } = await supabase
    .from('vehicles_equipment')
    .update({ ...updates, modified_at: new Date().toISOString() })
    .eq('id', id)
    .select()
    .single();

  if (error) {
    logger.error('Failed to update vehicle', error, { vehicleId: id });
    throw error;
  }

  logger.logUserAction('vehicle_updated', { vehicleId: id });
  return data;
}

// Create vehicle
async function createVehicle(
  vehicle: Omit<VehicleEquipment, 'id' | 'created_at' | 'modified_at'>
): Promise<VehicleEquipment> {
  const { data, error } = await supabase
    .from('vehicles_equipment')
    .insert(vehicle)
    .select()
    .single();

  if (error) {
    logger.error('Failed to create vehicle', error);
    throw error;
  }

  logger.logUserAction('vehicle_created', { plateNumber: vehicle.plate_number });
  return data;
}

// Delete vehicle
async function deleteVehicle(id: string): Promise<void> {
  const { error } = await supabase
    .from('vehicles_equipment')
    .delete()
    .eq('id', id);

  if (error) {
    logger.error('Failed to delete vehicle', error, { vehicleId: id });
    throw error;
  }

  logger.logUserAction('vehicle_deleted', { vehicleId: id });
}

// === HOOKS ===

/**
 * Hook to fetch dashboard statistics
 * Uses single optimized query instead of 6+ separate queries
 */
export function useDashboardStats(companyId?: string) {
  return useQuery({
    queryKey: queryKeys.vehicles.stats(companyId),
    queryFn: () => fetchDashboardStats(companyId),
    enabled: true,
  });
}

/**
 * Hook to fetch equipment type breakdown
 */
export function useEquipmentTypeBreakdown(companyId?: string) {
  return useQuery({
    queryKey: queryKeys.vehicles.typeBreakdown(companyId),
    queryFn: () => fetchEquipmentTypeBreakdown(companyId),
    enabled: true,
  });
}

/**
 * Hook to fetch vehicles list with filters
 */
export function useVehicles(params: FetchVehiclesParams = {}) {
  return useQuery({
    queryKey: [...queryKeys.vehicles.list(params.companyId), params],
    queryFn: () => fetchVehicles(params),
  });
}

/**
 * Hook to fetch single vehicle
 */
export function useVehicle(id: string) {
  return useQuery({
    queryKey: queryKeys.vehicles.detail(id),
    queryFn: () => fetchVehicle(id),
    enabled: !!id,
  });
}

/**
 * Hook to update a vehicle
 */
export function useUpdateVehicle() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, updates }: { id: string; updates: Partial<VehicleEquipment> }) =>
      updateVehicle(id, updates),
    onSuccess: (data, variables) => {
      // Update the cache
      queryClient.setQueryData(queryKeys.vehicles.detail(variables.id), data);
      // Invalidate lists
      invalidateVehicleQueries();
    },
    onError: (error) => {
      logger.error('Update vehicle mutation failed', error);
    },
  });
}

/**
 * Hook to create a vehicle
 */
export function useCreateVehicle() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (vehicle: Omit<VehicleEquipment, 'id' | 'created_at' | 'modified_at'>) =>
      createVehicle(vehicle),
    onSuccess: () => {
      invalidateVehicleQueries();
    },
  });
}

/**
 * Hook to delete a vehicle
 */
export function useDeleteVehicle() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (id: string) => deleteVehicle(id),
    onSuccess: (_, id) => {
      // Remove from cache
      queryClient.removeQueries({ queryKey: queryKeys.vehicles.detail(id) });
      invalidateVehicleQueries();
    },
  });
}

/**
 * Hook to record an inspection (updates vehicle status)
 */
export function useRecordInspection() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async ({
      vehicleId,
      status,
      rejectionReason,
      notes,
      inspectorId,
    }: {
      vehicleId: string;
      status: VehicleStatus;
      rejectionReason?: string;
      notes?: string;
      inspectorId: string;
    }) => {
      const today = new Date();
      const nextInspection = new Date(today);
      nextInspection.setMonth(nextInspection.getMonth() + 3);

      const updates: Partial<VehicleEquipment> = {
        actual_status: status,
        expected_status: 'verified',
        last_inspection_date: today.toISOString().split('T')[0],
        next_inspection_date: nextInspection.toISOString().split('T')[0],
        reason_for_rejection: status === 'rejected'
          ? (notes ? `${rejectionReason} - Notes: ${notes}` : rejectionReason)
          : null,
      };

      return updateVehicle(vehicleId, updates);
    },
    onSuccess: () => {
      invalidateVehicleQueries();
    },
  });
}
