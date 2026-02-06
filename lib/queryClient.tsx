// React Query Configuration for VVS App
// Provides centralized data fetching with caching, deduplication, and error handling

import React, { ReactNode } from 'react';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { logger } from './logger';

// W18: Tuned staleTime and refetch settings per data type
export const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      // Cache vehicle data for 5 minutes (changes frequently)
      staleTime: 5 * 60 * 1000,
      // Keep data in cache for 30 minutes
      gcTime: 30 * 60 * 1000,
      // Retry failed requests up to 3 times
      retry: 3,
      retryDelay: (attemptIndex) => Math.min(1000 * 2 ** attemptIndex, 30000),
      // W18: Disable refetchOnWindowFocus for mobile (not useful on mobile)
      refetchOnWindowFocus: false,
      // Refetch on reconnect for fresh data after being offline
      refetchOnReconnect: 'always',
      // Network mode
      networkMode: 'online',
    },
    mutations: {
      // Retry mutations once
      retry: 1,
      // Network mode
      networkMode: 'online',
      onError: (error) => {
        logger.error('Mutation error', error);
      },
    },
  },
});

// Query keys factory for consistent cache keys
export const queryKeys = {
  // Vehicles
  vehicles: {
    all: ['vehicles'] as const,
    list: (companyId?: string) => [...queryKeys.vehicles.all, 'list', companyId] as const,
    detail: (id: string) => [...queryKeys.vehicles.all, 'detail', id] as const,
    stats: (companyId?: string) => [...queryKeys.vehicles.all, 'stats', companyId] as const,
    typeBreakdown: (companyId?: string) => [...queryKeys.vehicles.all, 'typeBreakdown', companyId] as const,
  },
  // Users
  users: {
    all: ['users'] as const,
    list: (companyId?: string) => [...queryKeys.users.all, 'list', companyId] as const,
    detail: (id: string) => [...queryKeys.users.all, 'detail', id] as const,
    current: ['users', 'current'] as const,
  },
  // Companies
  companies: {
    all: ['companies'] as const,
    list: () => [...queryKeys.companies.all, 'list'] as const,
    detail: (id: string) => [...queryKeys.companies.all, 'detail', id] as const,
  },
  // Projects
  projects: {
    all: ['projects'] as const,
    list: (companyId?: string) => [...queryKeys.projects.all, 'list', companyId] as const,
    detail: (id: string) => [...queryKeys.projects.all, 'detail', id] as const,
  },
  // Gates
  gates: {
    all: ['gates'] as const,
    list: (companyId?: string) => [...queryKeys.gates.all, 'list', companyId] as const,
    detail: (id: string) => [...queryKeys.gates.all, 'detail', id] as const,
  },
  // Rejection Reasons
  rejectionReasons: {
    all: ['rejectionReasons'] as const,
    list: (companyId?: string) => [...queryKeys.rejectionReasons.all, 'list', companyId] as const,
  },
  // Inspections
  inspections: {
    all: ['inspections'] as const,
    list: (companyId?: string) => [...queryKeys.inspections.all, 'list', companyId] as const,
    detail: (id: string) => [...queryKeys.inspections.all, 'detail', id] as const,
  },
};

// Provider component
interface QueryProviderProps {
  children: ReactNode;
}

export function QueryProvider({ children }: QueryProviderProps) {
  return (
    <QueryClientProvider client={queryClient}>
      {children}
    </QueryClientProvider>
  );
}

// W12: Targeted cache invalidation instead of blanket invalidation
export function invalidateVehicleQueries(companyId?: string) {
  // Only invalidate vehicle lists and stats, not individual vehicle details
  queryClient.invalidateQueries({ queryKey: queryKeys.vehicles.list() });
  queryClient.invalidateQueries({ queryKey: queryKeys.vehicles.stats() });
  queryClient.invalidateQueries({ queryKey: queryKeys.vehicles.typeBreakdown() });
  if (companyId) {
    queryClient.invalidateQueries({ queryKey: queryKeys.vehicles.list(companyId) });
    queryClient.invalidateQueries({ queryKey: queryKeys.vehicles.stats(companyId) });
    queryClient.invalidateQueries({ queryKey: queryKeys.vehicles.typeBreakdown(companyId) });
  }
}

// W12: Targeted invalidation for a specific vehicle detail
export function invalidateVehicleDetail(id: string) {
  queryClient.invalidateQueries({ queryKey: queryKeys.vehicles.detail(id) });
}

// W12: Invalidate vehicle lists for a specific company
export function invalidateVehicleLists(companyId?: string) {
  queryClient.invalidateQueries({ queryKey: queryKeys.vehicles.list(companyId) });
  queryClient.invalidateQueries({ queryKey: queryKeys.vehicles.stats(companyId) });
}

export function invalidateUserQueries(companyId?: string) {
  queryClient.invalidateQueries({ queryKey: queryKeys.users.all });
}

export function invalidateAllQueries() {
  queryClient.invalidateQueries();
}

export default QueryProvider;
