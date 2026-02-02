// Admin Data Hooks with React Query
// Provides cached data fetching for admin panel (projects, gates, users, companies, rejection reasons)

import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import {
  supabase,
  Project,
  Gate,
  User,
  Company,
  RejectionReason,
  UserRole,
} from '../supabase';
import { queryKeys } from '../queryClient';
import { logger } from '../logger';

// === FETCH FUNCTIONS ===

async function fetchProjects(companyId?: string): Promise<Project[]> {
  let query = supabase.from('projects').select('*').order('name');

  if (companyId) {
    query = query.eq('company_id', companyId);
  }

  const { data, error } = await query;

  if (error) {
    logger.error('Failed to fetch projects', error);
    throw error;
  }

  return data || [];
}

async function fetchGates(companyId?: string): Promise<Gate[]> {
  let query = supabase.from('gates').select('*, project:projects(*)').order('name');

  if (companyId) {
    query = query.eq('company_id', companyId);
  }

  const { data, error } = await query;

  if (error) {
    logger.error('Failed to fetch gates', error);
    throw error;
  }

  return data || [];
}

async function fetchUsers(companyId?: string, isOwner?: boolean): Promise<User[]> {
  let query = supabase.from('users').select('*, company:companies(*)').order('full_name');

  // If not owner, only fetch users from same company
  if (!isOwner && companyId) {
    query = query.eq('company_id', companyId);
  }

  const { data, error } = await query;

  if (error) {
    logger.error('Failed to fetch users', error);
    throw error;
  }

  return data || [];
}

async function fetchCompanies(): Promise<Company[]> {
  const { data, error } = await supabase
    .from('companies')
    .select('*')
    .order('name');

  if (error) {
    logger.error('Failed to fetch companies', error);
    throw error;
  }

  return data || [];
}

async function fetchRejectionReasons(companyId?: string): Promise<RejectionReason[]> {
  let query = supabase
    .from('rejection_reasons')
    .select('*')
    .eq('is_active', true)
    .order('reason_text');

  if (companyId) {
    query = query.or(`company_id.eq.${companyId},company_id.is.null`);
  }

  const { data, error } = await query;

  if (error) {
    logger.error('Failed to fetch rejection reasons', error);
    throw error;
  }

  return data || [];
}

// === MUTATION FUNCTIONS ===

// Projects
async function createProject(project: Omit<Project, 'id' | 'created_at'>): Promise<Project> {
  const { data, error } = await supabase
    .from('projects')
    .insert(project)
    .select()
    .single();

  if (error) throw error;
  logger.logUserAction('project_created', { name: project.name });
  return data;
}

async function updateProject(id: string, updates: Partial<Project>): Promise<Project> {
  const { data, error } = await supabase
    .from('projects')
    .update(updates)
    .eq('id', id)
    .select()
    .single();

  if (error) throw error;
  return data;
}

async function deleteProject(id: string): Promise<void> {
  const { error } = await supabase.from('projects').delete().eq('id', id);
  if (error) throw error;
  logger.logUserAction('project_deleted', { projectId: id });
}

// Gates
async function createGate(gate: Omit<Gate, 'id' | 'created_at'>): Promise<Gate> {
  const { data, error } = await supabase
    .from('gates')
    .insert(gate)
    .select('*, project:projects(*)')
    .single();

  if (error) throw error;
  logger.logUserAction('gate_created', { name: gate.name });
  return data;
}

async function updateGate(id: string, updates: Partial<Gate>): Promise<Gate> {
  const { data, error } = await supabase
    .from('gates')
    .update(updates)
    .eq('id', id)
    .select('*, project:projects(*)')
    .single();

  if (error) throw error;
  return data;
}

async function deleteGate(id: string): Promise<void> {
  const { error } = await supabase.from('gates').delete().eq('id', id);
  if (error) throw error;
  logger.logUserAction('gate_deleted', { gateId: id });
}

// Rejection Reasons
async function createRejectionReason(reason: Omit<RejectionReason, 'id' | 'created_at'>): Promise<RejectionReason> {
  const { data, error } = await supabase
    .from('rejection_reasons')
    .insert(reason)
    .select()
    .single();

  if (error) throw error;
  logger.logUserAction('rejection_reason_created', { text: reason.reason_text });
  return data;
}

async function updateRejectionReason(id: string, updates: Partial<RejectionReason>): Promise<RejectionReason> {
  const { data, error } = await supabase
    .from('rejection_reasons')
    .update(updates)
    .eq('id', id)
    .select()
    .single();

  if (error) throw error;
  return data;
}

async function deleteRejectionReason(id: string): Promise<void> {
  const { error } = await supabase.from('rejection_reasons').delete().eq('id', id);
  if (error) throw error;
  logger.logUserAction('rejection_reason_deleted', { reasonId: id });
}

// Users
async function updateUserRole(userId: string, newRole: UserRole): Promise<User> {
  const { data, error } = await supabase
    .from('users')
    .update({ role: newRole })
    .eq('id', userId)
    .select('*, company:companies(*)')
    .single();

  if (error) throw error;
  logger.logUserAction('user_role_updated', { userId, newRole });
  return data;
}

// Companies
async function createCompany(company: Omit<Company, 'id' | 'created_at'>): Promise<Company> {
  const { data, error } = await supabase
    .from('companies')
    .insert(company)
    .select()
    .single();

  if (error) throw error;
  logger.logUserAction('company_created', { name: company.name });
  return data;
}

async function updateCompany(id: string, updates: Partial<Company>): Promise<Company> {
  const { data, error } = await supabase
    .from('companies')
    .update(updates)
    .eq('id', id)
    .select()
    .single();

  if (error) throw error;
  return data;
}

// === HOOKS ===

export function useProjects(companyId?: string) {
  return useQuery({
    queryKey: queryKeys.projects.list(companyId),
    queryFn: () => fetchProjects(companyId),
  });
}

export function useGates(companyId?: string) {
  return useQuery({
    queryKey: queryKeys.gates.list(companyId),
    queryFn: () => fetchGates(companyId),
  });
}

export function useUsers(companyId?: string, isOwner?: boolean) {
  return useQuery({
    queryKey: [...queryKeys.users.list(companyId), { isOwner }],
    queryFn: () => fetchUsers(companyId, isOwner),
  });
}

export function useCompanies(enabled: boolean = true) {
  return useQuery({
    queryKey: queryKeys.companies.list(),
    queryFn: fetchCompanies,
    enabled,
  });
}

export function useRejectionReasons(companyId?: string) {
  return useQuery({
    queryKey: queryKeys.rejectionReasons.list(companyId),
    queryFn: () => fetchRejectionReasons(companyId),
  });
}

// === MUTATION HOOKS ===

export function useCreateProject() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: createProject,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.projects.all });
    },
  });
}

export function useUpdateProject() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: ({ id, updates }: { id: string; updates: Partial<Project> }) =>
      updateProject(id, updates),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.projects.all });
    },
  });
}

export function useDeleteProject() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: deleteProject,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.projects.all });
    },
  });
}

export function useCreateGate() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: createGate,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.gates.all });
    },
  });
}

export function useUpdateGate() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: ({ id, updates }: { id: string; updates: Partial<Gate> }) =>
      updateGate(id, updates),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.gates.all });
    },
  });
}

export function useDeleteGate() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: deleteGate,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.gates.all });
    },
  });
}

export function useCreateRejectionReason() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: createRejectionReason,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.rejectionReasons.all });
    },
  });
}

export function useUpdateRejectionReason() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: ({ id, updates }: { id: string; updates: Partial<RejectionReason> }) =>
      updateRejectionReason(id, updates),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.rejectionReasons.all });
    },
  });
}

export function useDeleteRejectionReason() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: deleteRejectionReason,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.rejectionReasons.all });
    },
  });
}

export function useUpdateUserRole() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: ({ userId, newRole }: { userId: string; newRole: UserRole }) =>
      updateUserRole(userId, newRole),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.users.all });
    },
  });
}

export function useCreateCompany() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: createCompany,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.companies.all });
    },
  });
}

export function useUpdateCompany() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: ({ id, updates }: { id: string; updates: Partial<Company> }) =>
      updateCompany(id, updates),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.companies.all });
    },
  });
}
