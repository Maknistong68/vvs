import React, { useState, useEffect, useCallback, memo } from 'react';
import { View, StyleSheet, FlatList, Alert, ScrollView, StatusBar } from 'react-native';
import { Text, FAB, IconButton, Dialog, Portal, TextInput, Button, Switch, ActivityIndicator, Chip, Menu } from 'react-native-paper';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import {
  supabase,
  VehicleEquipment,
  RejectionReason,
  User,
  UserRole,
  Company,
  Project,
  Gate,
  EquipmentType,
  EquipmentCategory,
  RejectionCategory,
  AuditLog,
  EQUIPMENT_TYPES,
  REJECTION_CATEGORIES,
  getEquipmentTypeConfig,
  getCategoryDisplay,
  getStatusColor,
} from '../../lib/supabase';
import { useAuth, useIsOwner } from '../../lib/auth';
import { colors, glass, roleColors } from '../../lib/theme';
import { MENU_MAX_HEIGHT, DIALOG_MAX_HEIGHT, getErrorMessage } from '../../lib/constants';
import { useCompaniesVisibilitySettings } from '../../lib/hooks/useSettings';
import { getCompanyAuditLogs } from '../../lib/auditLogger';
import GlassCard from '../../components/GlassCard';
import GlassBackground from '../../components/GlassBackground';
import EmptyState from '../../components/EmptyState';
import { AdminListSkeleton } from '../../components/SkeletonLoader';
import { useToast } from '../../components/ToastProvider';

type TabValue = 'vehicles' | 'projects' | 'gates' | 'reasons' | 'users' | 'companies' | 'audit';

const ADMIN_PAGE_SIZE = 50;

export default function AdminScreen() {
  const { user, company } = useAuth();
  const { isOwner } = useIsOwner();
  const insets = useSafeAreaInsets();
  const toast = useToast();
  const [activeTab, setActiveTab] = useState<TabValue>('vehicles');

  // Fetch companies visibility settings
  const { data: companiesVisibility = ['owner'] } = useCompaniesVisibilitySettings(company?.id);
  const canViewCompanies = user?.role ? companiesVisibility.includes(user.role) : false;
  const [loading, setLoading] = useState(true);
  const [vehicles, setVehicles] = useState<VehicleEquipment[]>([]);
  const [projects, setProjects] = useState<Project[]>([]);
  const [gates, setGates] = useState<Gate[]>([]);
  const [rejectionReasons, setRejectionReasons] = useState<RejectionReason[]>([]);
  const [users, setUsers] = useState<User[]>([]);
  const [companies, setCompanies] = useState<Company[]>([]);
  const [auditLogs, setAuditLogs] = useState<AuditLog[]>([]);
  const [auditLogsTotal, setAuditLogsTotal] = useState(0);

  // Dialogs
  const [vehicleDialog, setVehicleDialog] = useState(false);
  const [projectDialog, setProjectDialog] = useState(false);
  const [gateDialog, setGateDialog] = useState(false);
  const [reasonDialog, setReasonDialog] = useState(false);
  const [companyDialog, setCompanyDialog] = useState(false);
  const [editingVehicle, setEditingVehicle] = useState<VehicleEquipment | null>(null);
  const [editingProject, setEditingProject] = useState<Project | null>(null);
  const [editingGate, setEditingGate] = useState<Gate | null>(null);
  const [editingReason, setEditingReason] = useState<RejectionReason | null>(null);
  const [editingCompany, setEditingCompany] = useState<Company | null>(null);

  // Forms
  const [vForm, setVForm] = useState({
    plate_number: '',
    equipment_type: 'forklift' as EquipmentType,
    equipment_category: 'A' as EquipmentCategory,
    driver_name: '',
    national_id_number: '',
    year_of_manufacture: '',
    client_company: '',
  });
  const [pForm, setPForm] = useState({ name: '', code: '' });
  const [gForm, setGForm] = useState({ name: '', location: '', project_id: '' });
  const [rForm, setRForm] = useState({ reason_text: '', category: 'safety' as RejectionCategory, is_active: true });
  const [cForm, setCForm] = useState({ name: '', code: '', contact_email: '' });

  // Menus
  const [eTypeMenu, setETypeMenu] = useState(false);
  const [projectMenu, setProjectMenu] = useState(false);
  const [catMenu, setCatMenu] = useState(false);

  // Loading states
  const [saving, setSaving] = useState(false);
  const [deleting, setDeleting] = useState<string | null>(null);

  // W1: Paginated fetch with .range() to prevent OOM on large datasets
  const fetchData = useCallback(async () => {
    setLoading(true);
    try {
      const [v, p, g, r, u, c] = await Promise.all([
        supabase.from('vehicles_equipment').select('*').order('plate_number').range(0, ADMIN_PAGE_SIZE - 1),
        supabase.from('projects').select('*').order('name').range(0, ADMIN_PAGE_SIZE - 1),
        supabase.from('gates').select('*, project:projects(*)').order('name').range(0, ADMIN_PAGE_SIZE - 1),
        supabase.from('rejection_reasons').select('*').order('reason_text').range(0, ADMIN_PAGE_SIZE - 1),
        isOwner
          ? supabase.from('users').select('*, company:companies(*)').order('full_name').range(0, ADMIN_PAGE_SIZE - 1)
          : supabase.from('users').select('*, company:companies(*)').eq('company_id', company?.id).order('full_name').range(0, ADMIN_PAGE_SIZE - 1),
        canViewCompanies ? supabase.from('companies').select('*').order('name').range(0, ADMIN_PAGE_SIZE - 1) : Promise.resolve({ data: [] }),
      ]);
      if (v.data) setVehicles(v.data);
      if (p.data) setProjects(p.data);
      if (g.data) setGates(g.data);
      if (r.data) setRejectionReasons(r.data);
      if (u.data) setUsers(u.data);
      if (c.data) setCompanies(c.data);

      // Fetch audit logs for owners
      if (isOwner && company?.id) {
        try {
          const auditResult = await getCompanyAuditLogs(company.id, { limit: ADMIN_PAGE_SIZE });
          setAuditLogs(auditResult.logs);
          setAuditLogsTotal(auditResult.total);
        } catch {
          // Silently handle audit logs fetch errors
        }
      }
    } catch (err) {
      toast.showError(getErrorMessage(err, 'Failed to load data'));
    } finally {
      setLoading(false);
    }
  }, [isOwner, company?.id, canViewCompanies, toast]);

  useEffect(() => { fetchData(); }, [fetchData]);

  // Vehicle CRUD
  const openVehicle = (v?: VehicleEquipment) => {
    setEditingVehicle(v || null);
    setVForm(v ? {
      plate_number: v.plate_number,
      equipment_type: v.equipment_type,
      equipment_category: v.equipment_category,
      driver_name: v.driver_name || '',
      national_id_number: v.national_id_number || '',
      year_of_manufacture: v.year_of_manufacture?.toString() || '',
      client_company: v.client_company || '',
    } : {
      plate_number: '', equipment_type: 'forklift', equipment_category: 'A',
      driver_name: '', national_id_number: '', year_of_manufacture: '', client_company: '',
    });
    setVehicleDialog(true);
  };

  const saveVehicle = async () => {
    if (!vForm.plate_number) { toast.showError('Plate number is required'); return; }
    if (!company?.id || !user?.id) { toast.showError('Session expired'); return; }
    setSaving(true);
    try {
      const data = {
        plate_number: vForm.plate_number.toUpperCase(),
        equipment_type: vForm.equipment_type,
        equipment_category: vForm.equipment_category,
        driver_name: vForm.driver_name || null,
        national_id_number: vForm.national_id_number || null,
        year_of_manufacture: vForm.year_of_manufacture ? parseInt(vForm.year_of_manufacture) : null,
        client_company: vForm.client_company || null,
      };
      let error;
      if (editingVehicle) {
        ({ error } = await supabase.from('vehicles_equipment').update(data).eq('id', editingVehicle.id));
      } else {
        ({ error } = await supabase.from('vehicles_equipment').insert({
          ...data, company_id: company.id, created_by: user.id, actual_status: 'pending', expected_status: 'verified',
        }));
      }
      if (error) throw error;
      setVehicleDialog(false);
      fetchData();
    } catch (err) { toast.showError(getErrorMessage(err, 'Failed to save')); }
    finally { setSaving(false); }
  };

  const deleteVehicle = (id: string) => Alert.alert('Delete?', 'This will permanently delete this vehicle/equipment', [
    { text: 'Cancel' },
    { text: 'Delete', style: 'destructive', onPress: async () => {
      setDeleting(id);
      try {
        const { error } = await supabase.from('vehicles_equipment').delete().eq('id', id);
        if (error) throw error;
        toast.showSuccess('Vehicle deleted');
        fetchData();
      } catch (err) { toast.showError(getErrorMessage(err)); }
      finally { setDeleting(null); }
    }},
  ]);

  // Project CRUD
  const openProject = (p?: Project) => {
    setEditingProject(p || null);
    setPForm(p ? { name: p.name, code: p.code || '' } : { name: '', code: '' });
    setProjectDialog(true);
  };

  const saveProject = async () => {
    if (!pForm.name) { toast.showError('Name required'); return; }
    if (!company?.id) { toast.showError('Session expired'); return; }
    setSaving(true);
    try {
      const data = { name: pForm.name, code: pForm.code || null };
      let error;
      if (editingProject) ({ error } = await supabase.from('projects').update(data).eq('id', editingProject.id));
      else ({ error } = await supabase.from('projects').insert({ ...data, company_id: company.id }));
      if (error) throw error;
      setProjectDialog(false);
      fetchData();
    } catch (err) { toast.showError(getErrorMessage(err)); }
    finally { setSaving(false); }
  };

  const deleteProject = (id: string) => Alert.alert('Delete?', 'This will permanently delete this project', [
    { text: 'Cancel' },
    { text: 'Delete', style: 'destructive', onPress: async () => {
      setDeleting(id);
      try {
        const { error } = await supabase.from('projects').delete().eq('id', id);
        if (error) throw error;
        toast.showSuccess('Project deleted');
        fetchData();
      } catch (err) { toast.showError(getErrorMessage(err)); }
      finally { setDeleting(null); }
    }},
  ]);

  // Gate CRUD
  const openGate = (g?: Gate) => {
    setEditingGate(g || null);
    setGForm(g ? { name: g.name, location: g.location || '', project_id: g.project_id || '' } : { name: '', location: '', project_id: '' });
    setGateDialog(true);
  };

  const saveGate = async () => {
    if (!gForm.name) { toast.showError('Name required'); return; }
    if (!company?.id) { toast.showError('Session expired'); return; }
    setSaving(true);
    try {
      const data = { name: gForm.name, location: gForm.location || null, project_id: gForm.project_id || null };
      let error;
      if (editingGate) ({ error } = await supabase.from('gates').update(data).eq('id', editingGate.id));
      else ({ error } = await supabase.from('gates').insert({ ...data, company_id: company.id }));
      if (error) throw error;
      setGateDialog(false);
      fetchData();
    } catch (err) { toast.showError(getErrorMessage(err)); }
    finally { setSaving(false); }
  };

  const deleteGate = (id: string) => Alert.alert('Delete?', 'This will permanently delete this gate', [
    { text: 'Cancel' },
    { text: 'Delete', style: 'destructive', onPress: async () => {
      setDeleting(id);
      try {
        const { error } = await supabase.from('gates').delete().eq('id', id);
        if (error) throw error;
        toast.showSuccess('Gate deleted');
        fetchData();
      } catch (err) { toast.showError(getErrorMessage(err)); }
      finally { setDeleting(null); }
    }},
  ]);

  // Reason CRUD
  const openReason = (r?: RejectionReason) => {
    setEditingReason(r || null);
    setRForm(r ? { reason_text: r.reason_text, category: (r.category as RejectionCategory) || 'safety', is_active: r.is_active } : { reason_text: '', category: 'safety', is_active: true });
    setReasonDialog(true);
  };

  const saveReason = async () => {
    if (!rForm.reason_text) { toast.showError('Reason required'); return; }
    if (!company?.id) { toast.showError('Session expired'); return; }
    setSaving(true);
    try {
      const data = { reason_text: rForm.reason_text, category: rForm.category, is_active: rForm.is_active };
      let error;
      if (editingReason) ({ error } = await supabase.from('rejection_reasons').update(data).eq('id', editingReason.id));
      else ({ error } = await supabase.from('rejection_reasons').insert({ ...data, company_id: company.id }));
      if (error) throw error;
      setReasonDialog(false);
      fetchData();
    } catch (err) { toast.showError(getErrorMessage(err)); }
    finally { setSaving(false); }
  };

  const deleteReason = (id: string) => Alert.alert('Delete?', 'This will permanently delete this reason', [
    { text: 'Cancel' },
    { text: 'Delete', style: 'destructive', onPress: async () => {
      setDeleting(id);
      try {
        const { error } = await supabase.from('rejection_reasons').delete().eq('id', id);
        if (error) throw error;
        toast.showSuccess('Reason deleted');
        fetchData();
      } catch (err) { toast.showError(getErrorMessage(err)); }
      finally { setDeleting(null); }
    }},
  ]);

  // Company CRUD
  const openCompany = (c?: Company) => {
    setEditingCompany(c || null);
    setCForm(c ? { name: c.name, code: c.code, contact_email: c.contact_email || '' } : { name: '', code: '', contact_email: '' });
    setCompanyDialog(true);
  };

  const saveCompany = async () => {
    if (!cForm.name || !cForm.code) { toast.showError('Name and code required'); return; }
    setSaving(true);
    try {
      const data = { name: cForm.name, code: cForm.code.toUpperCase(), contact_email: cForm.contact_email || null };
      let error;
      if (editingCompany) ({ error } = await supabase.from('companies').update(data).eq('id', editingCompany.id));
      else ({ error } = await supabase.from('companies').insert(data));
      if (error) throw error;
      setCompanyDialog(false);
      fetchData();
    } catch (err) { toast.showError(getErrorMessage(err)); }
    finally { setSaving(false); }
  };

  // User role toggle - now includes contractor
  const toggleRole = async (u: User, newRole: UserRole) => {
    if (u.id === user?.id || u.role === 'owner') return;
    try {
      const { error } = await supabase.from('users').update({ role: newRole }).eq('id', u.id);
      if (error) throw error;
      fetchData();
    } catch (err) { toast.showError(getErrorMessage(err)); }
  };

  // Tab component - memoized to prevent unnecessary re-renders
  const Tab = memo(({ value, label, icon, isActive, onPress }: { value: TabValue; label: string; icon: string; isActive: boolean; onPress: () => void }) => (
    <GlassCard
      onPress={onPress}
      style={isActive ? { ...styles.tab, ...styles.tabActive } : styles.tab}
      padding={10}
      accessibilityRole="tab"
      accessibilityLabel={label}
    >
      <MaterialCommunityIcons name={icon as any} size={18} color={isActive ? colors.primary : colors.textMuted} />
      <Text style={isActive ? { ...styles.tabText, ...styles.tabTextActive } : styles.tabText}>{label}</Text>
    </GlassCard>
  ));

  // Memoized tab press handlers to prevent re-creating functions on every render
  const handleTabPress = useCallback((tab: TabValue) => setActiveTab(tab), []);

  // List items - memoized to prevent unnecessary re-renders
  const VehicleItem = memo(({ item, onEdit, onDelete, isDeleting }: { item: VehicleEquipment; onEdit: (v: VehicleEquipment) => void; onDelete: (id: string) => void; isDeleting: boolean }) => {
    const tc = getEquipmentTypeConfig(item.equipment_type);
    const statusColor = getStatusColor(item.actual_status);
    return (
      <GlassCard style={styles.card} padding={12}>
        <View style={styles.row}>
          <View style={[styles.icon, { backgroundColor: `${colors.primary}15` }]}>
            <MaterialCommunityIcons name={tc.icon as any} size={22} color={colors.primary} />
          </View>
          <View style={styles.info}>
            <Text style={styles.name} numberOfLines={1}>{item.plate_number}</Text>
            <Text style={styles.sub} numberOfLines={1}>{tc.label} - {getCategoryDisplay(item.equipment_category)}</Text>
            {item.driver_name && (
              <View style={styles.detailRow}>
                <MaterialCommunityIcons name="account" size={12} color={colors.textMuted} />
                <Text style={styles.sub} numberOfLines={1}>{item.driver_name}</Text>
              </View>
            )}
            <View style={styles.chipRow}>
              <Chip mode="flat" style={[styles.chipSmall, { backgroundColor: `${statusColor}15` }]} textStyle={[styles.chipSmallText, { color: statusColor }]}>
                {item.actual_status.charAt(0).toUpperCase() + item.actual_status.slice(1)}
              </Chip>
              {item.is_blacklisted && (
                <Chip mode="flat" style={[styles.chipSmall, { backgroundColor: `${colors.error}15` }]} textStyle={[styles.chipSmallText, { color: colors.error }]}>
                  Blacklisted
                </Chip>
              )}
            </View>
          </View>
          <View style={styles.actions}>
            <IconButton icon="pencil" size={22} iconColor={colors.textMuted} onPress={() => onEdit(item)} disabled={isDeleting} style={styles.actionBtn} />
            <IconButton icon={isDeleting ? 'loading' : 'delete'} size={22} iconColor={colors.error} onPress={() => onDelete(item.id)} disabled={isDeleting} style={styles.actionBtn} />
          </View>
        </View>
      </GlassCard>
    );
  });

  const ProjectItem = memo(({ item, onEdit, onDelete, isDeleting }: { item: Project; onEdit: (p: Project) => void; onDelete: (id: string) => void; isDeleting: boolean }) => (
    <GlassCard style={styles.card} padding={12}>
      <View style={styles.row}>
        <View style={[styles.icon, { backgroundColor: `${colors.secondary}15` }]}>
          <MaterialCommunityIcons name="clipboard-text" size={22} color={colors.secondary} />
        </View>
        <View style={styles.info}>
          <Text style={styles.name} numberOfLines={1}>{item.name}</Text>
          {item.code && <Text style={styles.sub} numberOfLines={1}>Code: {item.code}</Text>}
          <Chip mode="flat" style={[styles.chipSmall, { backgroundColor: item.is_active ? `${colors.success}15` : `${colors.error}15`, marginTop: 4 }]} textStyle={[styles.chipSmallText, { color: item.is_active ? colors.success : colors.error }]}>
            {item.is_active ? 'Active' : 'Inactive'}
          </Chip>
        </View>
        <View style={styles.actions}>
          <IconButton icon="pencil" size={22} iconColor={colors.textMuted} onPress={() => onEdit(item)} disabled={isDeleting} style={styles.actionBtn} />
          <IconButton icon={isDeleting ? 'loading' : 'delete'} size={22} iconColor={colors.error} onPress={() => onDelete(item.id)} disabled={isDeleting} style={styles.actionBtn} />
        </View>
      </View>
    </GlassCard>
  ));

  const GateItem = memo(({ item, onEdit, onDelete, isDeleting }: { item: Gate; onEdit: (g: Gate) => void; onDelete: (id: string) => void; isDeleting: boolean }) => (
    <GlassCard style={styles.card} padding={12}>
      <View style={styles.row}>
        <View style={[styles.icon, { backgroundColor: `${colors.warning}15` }]}>
          <MaterialCommunityIcons name="gate" size={22} color={colors.warning} />
        </View>
        <View style={styles.info}>
          <Text style={styles.name} numberOfLines={1}>{item.name}</Text>
          {item.location && <Text style={styles.sub} numberOfLines={1}>{item.location}</Text>}
          {item.project && <Text style={styles.sub} numberOfLines={1}>Project: {item.project.name}</Text>}
        </View>
        <View style={styles.actions}>
          <IconButton icon="pencil" size={22} iconColor={colors.textMuted} onPress={() => onEdit(item)} disabled={isDeleting} style={styles.actionBtn} />
          <IconButton icon={isDeleting ? 'loading' : 'delete'} size={22} iconColor={colors.error} onPress={() => onDelete(item.id)} disabled={isDeleting} style={styles.actionBtn} />
        </View>
      </View>
    </GlassCard>
  ));

  const ReasonItem = memo(({ item, onEdit, onDelete, isDeleting }: { item: RejectionReason; onEdit: (r: RejectionReason) => void; onDelete: (id: string) => void; isDeleting: boolean }) => {
    const cat = REJECTION_CATEGORIES.find((c) => c.value === item.category) || REJECTION_CATEGORIES[0];
    return (
      <GlassCard style={styles.card} padding={12}>
        <View style={styles.row}>
          <View style={[styles.icon, { backgroundColor: `${cat.color}15` }]}>
            <MaterialCommunityIcons name={cat.icon as any} size={22} color={cat.color} />
          </View>
          <View style={styles.info}>
            <Text style={styles.name} numberOfLines={2}>{item.reason_text}</Text>
            <View style={styles.chipRow}>
              <Chip mode="flat" style={[styles.chipSmall, { backgroundColor: `${cat.color}15` }]} textStyle={[styles.chipSmallText, { color: cat.color }]}>
                {cat.label}
              </Chip>
              <Chip mode="flat" style={[styles.chipSmall, { backgroundColor: item.is_active ? `${colors.success}15` : `${colors.error}15` }]} textStyle={[styles.chipSmallText, { color: item.is_active ? colors.success : colors.error }]}>
                {item.is_active ? 'Active' : 'Inactive'}
              </Chip>
            </View>
          </View>
          <View style={styles.actions}>
            <IconButton icon="pencil" size={22} iconColor={colors.textMuted} onPress={() => onEdit(item)} disabled={isDeleting} style={styles.actionBtn} />
            <IconButton icon={isDeleting ? 'loading' : 'delete'} size={22} iconColor={colors.error} onPress={() => onDelete(item.id)} disabled={isDeleting} style={styles.actionBtn} />
          </View>
        </View>
      </GlassCard>
    );
  });

  const UserItem = memo(({ item, currentUserId, onToggleRole }: { item: User; currentUserId?: string; onToggleRole: (u: User, newRole: UserRole) => void }) => {
    const rc = roleColors[item.role] || colors.textMuted;
    const roleIcon = item.role === 'owner' ? 'crown' : item.role === 'admin' ? 'shield-account' : item.role === 'contractor' ? 'briefcase-account' : 'account-check';

    // Role cycle: inspector -> admin -> contractor -> inspector
    const getNextRole = (currentRole: UserRole): UserRole => {
      switch (currentRole) {
        case 'inspector': return 'admin';
        case 'admin': return 'contractor';
        case 'contractor': return 'inspector';
        default: return 'inspector';
      }
    };

    const getRoleButtonLabel = (currentRole: UserRole): string => {
      const nextRole = getNextRole(currentRole);
      return nextRole.charAt(0).toUpperCase() + nextRole.slice(1);
    };

    return (
      <GlassCard style={styles.card} padding={12}>
        <View style={styles.row}>
          <View style={[styles.icon, { backgroundColor: `${rc}15` }]}>
            <MaterialCommunityIcons name={roleIcon} size={22} color={rc} />
          </View>
          <View style={styles.info}>
            <Text style={styles.name} numberOfLines={1}>{item.full_name}</Text>
            <Text style={styles.sub} numberOfLines={1}>{item.email}</Text>
            {item.company && (
              <View style={styles.detailRow}>
                <MaterialCommunityIcons name="domain" size={12} color={colors.textMuted} />
                <Text style={styles.sub} numberOfLines={1}>{item.company.name}</Text>
              </View>
            )}
            <Chip mode="flat" style={[styles.chipSmall, { backgroundColor: `${rc}15`, marginTop: 4 }]} textStyle={[styles.chipSmallText, { color: rc }]}>
              {item.role.charAt(0).toUpperCase() + item.role.slice(1)}
            </Chip>
          </View>
          {item.role !== 'owner' && item.id !== currentUserId && (
            <View style={styles.actions}>
              <Button mode="text" compact onPress={() => onToggleRole(item, getNextRole(item.role))} textColor={colors.primary}>
                {getRoleButtonLabel(item.role)}
              </Button>
            </View>
          )}
        </View>
      </GlassCard>
    );
  });

  const CompanyItem = memo(({ item, onEdit }: { item: Company; onEdit: (c: Company) => void }) => (
    <GlassCard style={styles.card} padding={12}>
      <View style={styles.row}>
        <View style={[styles.icon, { backgroundColor: `${colors.primary}15` }]}>
          <MaterialCommunityIcons name="domain" size={22} color={colors.primary} />
        </View>
        <View style={styles.info}>
          <Text style={styles.name} numberOfLines={1}>{item.name}</Text>
          <Text style={styles.sub} numberOfLines={1}>Code: {item.code}</Text>
          <Chip mode="flat" style={[styles.chipSmall, { backgroundColor: item.is_active ? `${colors.success}15` : `${colors.error}15`, marginTop: 4 }]} textStyle={[styles.chipSmallText, { color: item.is_active ? colors.success : colors.error }]}>
            {item.is_active ? 'Active' : 'Inactive'}
          </Chip>
        </View>
        <View style={styles.actions}>
          <IconButton icon="pencil" size={22} iconColor={colors.textMuted} onPress={() => onEdit(item)} style={styles.actionBtn} />
        </View>
      </View>
    </GlassCard>
  ));

  // Audit Log Item Component - memoized
  const AuditLogItem = memo(({ item }: { item: AuditLog }) => {
    const getActionColor = (action: string) => {
      switch (action) {
        case 'create': return colors.success;
        case 'delete': return colors.error;
        case 'status_change': return colors.warning;
        case 'update': return colors.primary;
        default: return colors.textMuted;
      }
    };

    const getActionIcon = (action: string) => {
      switch (action) {
        case 'create': return 'plus-circle';
        case 'delete': return 'delete-circle';
        case 'status_change': return 'swap-horizontal-circle';
        case 'update': return 'pencil-circle';
        default: return 'information';
      }
    };

    const formatDate = (dateStr: string) => {
      const date = new Date(dateStr);
      return date.toLocaleDateString() + ' ' + date.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
    };

    const actionColor = getActionColor(item.action);

    return (
      <GlassCard style={styles.card} padding={12}>
        <View style={styles.row}>
          <View style={[styles.icon, { backgroundColor: `${actionColor}15` }]}>
            <MaterialCommunityIcons name={getActionIcon(item.action) as any} size={22} color={actionColor} />
          </View>
          <View style={styles.info}>
            <Text style={styles.name} numberOfLines={1}>
              {item.entity_type.charAt(0).toUpperCase() + item.entity_type.slice(1)} - {item.action.replace('_', ' ')}
            </Text>
            {item.field_name && (
              <Text style={styles.sub} numberOfLines={1}>
                Field: {item.field_name}
              </Text>
            )}
            {(item.old_value || item.new_value) && (
              <View style={styles.detailRow}>
                <MaterialCommunityIcons name="arrow-right" size={12} color={colors.textMuted} />
                <Text style={styles.sub} numberOfLines={1}>
                  {item.old_value || '(none)'} → {item.new_value || '(none)'}
                </Text>
              </View>
            )}
            <View style={styles.chipRow}>
              <Chip mode="flat" style={[styles.chipSmall, { backgroundColor: `${actionColor}15` }]} textStyle={[styles.chipSmallText, { color: actionColor }]}>
                {item.action.replace('_', ' ')}
              </Chip>
              <Text style={[styles.sub, { marginLeft: 8 }]}>{formatDate(item.changed_at)}</Text>
            </View>
          </View>
        </View>
      </GlassCard>
    );
  });

  if (loading) {
    return (
      <GlassBackground>
        <View style={[styles.loading, { paddingTop: insets.top }]}>
          <AdminListSkeleton />
        </View>
      </GlassBackground>
    );
  }

  return (
    <GlassBackground>
      <StatusBar barStyle="light-content" backgroundColor="transparent" translucent />
      <View style={[styles.header, { paddingTop: insets.top + 16 }]}>
        <Text style={styles.title}>Management</Text>
      </View>

      {/* W25: Grouped tabs for better scannability */}
      <ScrollView horizontal showsHorizontalScrollIndicator={false} style={styles.tabs} contentContainerStyle={styles.tabsContent}>
        {/* Core operations */}
        <Tab value="vehicles" label="Vehicles" icon="car" isActive={activeTab === 'vehicles'} onPress={() => handleTabPress('vehicles')} />
        <Tab value="projects" label="Projects" icon="clipboard-text" isActive={activeTab === 'projects'} onPress={() => handleTabPress('projects')} />
        <Tab value="gates" label="Gates" icon="gate" isActive={activeTab === 'gates'} onPress={() => handleTabPress('gates')} />
        <View style={styles.tabDivider} />
        {/* Configuration */}
        <Tab value="reasons" label="Reasons" icon="alert-circle" isActive={activeTab === 'reasons'} onPress={() => handleTabPress('reasons')} />
        <Tab value="users" label="Users" icon="account-group" isActive={activeTab === 'users'} onPress={() => handleTabPress('users')} />
        {canViewCompanies && <Tab value="companies" label="Companies" icon="domain" isActive={activeTab === 'companies'} onPress={() => handleTabPress('companies')} />}
        {isOwner && (
          <>
            <View style={styles.tabDivider} />
            <Tab value="audit" label="Audit" icon="history" isActive={activeTab === 'audit'} onPress={() => handleTabPress('audit')} />
          </>
        )}
      </ScrollView>

      {/* W1: Added virtualization props to all FlatLists */}
      {activeTab === 'vehicles' && <FlatList data={vehicles} keyExtractor={(i) => i.id} renderItem={({ item }) => <VehicleItem item={item} onEdit={openVehicle} onDelete={deleteVehicle} isDeleting={deleting === item.id} />} contentContainerStyle={styles.list} initialNumToRender={15} maxToRenderPerBatch={10} windowSize={5} removeClippedSubviews={true} ListEmptyComponent={<EmptyState icon="car-off" title="No vehicles/equipment" subtitle="Add your first vehicle to get started" />} />}
      {activeTab === 'projects' && <FlatList data={projects} keyExtractor={(i) => i.id} renderItem={({ item }) => <ProjectItem item={item} onEdit={openProject} onDelete={deleteProject} isDeleting={deleting === item.id} />} contentContainerStyle={styles.list} initialNumToRender={15} maxToRenderPerBatch={10} windowSize={5} removeClippedSubviews={true} ListEmptyComponent={<EmptyState icon="clipboard-off" title="No projects" subtitle="Create a project to organize inspections" />} />}
      {activeTab === 'gates' && <FlatList data={gates} keyExtractor={(i) => i.id} renderItem={({ item }) => <GateItem item={item} onEdit={openGate} onDelete={deleteGate} isDeleting={deleting === item.id} />} contentContainerStyle={styles.list} initialNumToRender={15} maxToRenderPerBatch={10} windowSize={5} removeClippedSubviews={true} ListEmptyComponent={<EmptyState icon="gate" title="No gates" subtitle="Add gates to track vehicle entry points" />} />}
      {activeTab === 'reasons' && <FlatList data={rejectionReasons} keyExtractor={(i) => i.id} renderItem={({ item }) => <ReasonItem item={item} onEdit={openReason} onDelete={deleteReason} isDeleting={deleting === item.id} />} contentContainerStyle={styles.list} initialNumToRender={15} maxToRenderPerBatch={10} windowSize={5} removeClippedSubviews={true} ListEmptyComponent={<EmptyState icon="alert-circle-outline" title="No rejection reasons" subtitle="Define reasons for vehicle inspection failures" />} />}
      {activeTab === 'users' && <FlatList data={users} keyExtractor={(i) => i.id} renderItem={({ item }) => <UserItem item={item} currentUserId={user?.id} onToggleRole={toggleRole} />} contentContainerStyle={styles.list} initialNumToRender={15} maxToRenderPerBatch={10} windowSize={5} removeClippedSubviews={true} ListEmptyComponent={<EmptyState icon="account-off" title="No users" subtitle="Users will appear once they sign up" />} />}
      {activeTab === 'companies' && canViewCompanies && <FlatList data={companies} keyExtractor={(i) => i.id} renderItem={({ item }) => <CompanyItem item={item} onEdit={openCompany} />} contentContainerStyle={styles.list} initialNumToRender={15} maxToRenderPerBatch={10} windowSize={5} removeClippedSubviews={true} ListEmptyComponent={<EmptyState icon="domain" title="No companies" subtitle="Companies will appear here" />} />}
      {activeTab === 'audit' && isOwner && <FlatList data={auditLogs} keyExtractor={(i) => i.id} renderItem={({ item }) => <AuditLogItem item={item} />} contentContainerStyle={styles.list} initialNumToRender={15} maxToRenderPerBatch={10} windowSize={5} removeClippedSubviews={true} ListEmptyComponent={<EmptyState icon="history" title="No audit logs" subtitle="Activity logs will appear here" />} ListHeaderComponent={auditLogsTotal > 0 ? <Text style={styles.auditHeader}>Showing {auditLogs.length} of {auditLogsTotal} entries</Text> : null} />}

      {['vehicles', 'projects', 'gates', 'reasons', 'companies'].includes(activeTab) && (
        <FAB
          icon="plus"
          style={styles.fab}
          color={colors.white}
          onPress={() => {
            if (activeTab === 'vehicles') openVehicle();
            else if (activeTab === 'projects') openProject();
            else if (activeTab === 'gates') openGate();
            else if (activeTab === 'reasons') openReason();
            else if (activeTab === 'companies') openCompany();
          }}
        />
      )}

      {/* Vehicle Dialog */}
      <Portal>
        <Dialog visible={vehicleDialog} onDismiss={() => setVehicleDialog(false)} style={styles.dialog}>
          <Dialog.Title style={styles.dialogTitle}>{editingVehicle ? 'Edit' : 'Add'} Vehicle/Equipment</Dialog.Title>
          <Dialog.ScrollArea style={{ maxHeight: 400 }}>
            <View style={{ padding: 16 }}>
              <TextInput label="Plate Number *" value={vForm.plate_number} onChangeText={(t) => setVForm({ ...vForm, plate_number: t.toUpperCase() })} mode="outlined" style={styles.input} outlineColor={!vForm.plate_number && saving ? colors.error : colors.inputBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} error={!vForm.plate_number && saving} />
              <Menu visible={eTypeMenu} onDismiss={() => setETypeMenu(false)} anchor={<Button mode="outlined" onPress={() => setETypeMenu(true)} style={styles.input}>{getEquipmentTypeConfig(vForm.equipment_type).label}</Button>}>
                <ScrollView style={{ maxHeight: 300 }}>
                  {EQUIPMENT_TYPES.map((t) => (
                    <Menu.Item key={t.value} onPress={() => { setVForm({ ...vForm, equipment_type: t.value, equipment_category: t.category }); setETypeMenu(false); }} title={`${t.label} (${t.category})`} />
                  ))}
                </ScrollView>
              </Menu>
              <TextInput label="Driver Name" value={vForm.driver_name} onChangeText={(t) => setVForm({ ...vForm, driver_name: t })} mode="outlined" style={styles.input} outlineColor={colors.inputBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} />
              <TextInput label="National ID Number" value={vForm.national_id_number} onChangeText={(t) => setVForm({ ...vForm, national_id_number: t })} mode="outlined" style={styles.input} outlineColor={colors.inputBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} keyboardType="numeric" />
              <TextInput label="Year of Manufacture" value={vForm.year_of_manufacture} onChangeText={(t) => setVForm({ ...vForm, year_of_manufacture: t })} mode="outlined" style={styles.input} outlineColor={colors.inputBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} keyboardType="numeric" />
              <TextInput label="Client/Company" value={vForm.client_company} onChangeText={(t) => setVForm({ ...vForm, client_company: t })} mode="outlined" style={styles.input} outlineColor={colors.inputBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} />
            </View>
          </Dialog.ScrollArea>
          <Dialog.Actions>
            <Button onPress={() => setVehicleDialog(false)} textColor={colors.textMuted} disabled={saving}>Cancel</Button>
            <Button onPress={saveVehicle} textColor={colors.primary} loading={saving} disabled={saving}>Save</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>

      {/* Project Dialog */}
      <Portal>
        <Dialog visible={projectDialog} onDismiss={() => setProjectDialog(false)} style={styles.dialog}>
          <Dialog.Title style={styles.dialogTitle}>{editingProject ? 'Edit' : 'Add'} Project</Dialog.Title>
          <Dialog.Content>
            <TextInput label="Project Name *" value={pForm.name} onChangeText={(t) => setPForm({ ...pForm, name: t })} mode="outlined" style={styles.input} outlineColor={colors.inputBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} />
            <TextInput label="Code" value={pForm.code} onChangeText={(t) => setPForm({ ...pForm, code: t.toUpperCase() })} mode="outlined" style={styles.input} outlineColor={colors.inputBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} />
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={() => setProjectDialog(false)} textColor={colors.textMuted} disabled={saving}>Cancel</Button>
            <Button onPress={saveProject} textColor={colors.primary} loading={saving} disabled={saving}>Save</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>

      {/* Gate Dialog */}
      <Portal>
        <Dialog visible={gateDialog} onDismiss={() => setGateDialog(false)} style={styles.dialog}>
          <Dialog.Title style={styles.dialogTitle}>{editingGate ? 'Edit' : 'Add'} Gate</Dialog.Title>
          <Dialog.Content>
            <TextInput label="Gate Name *" value={gForm.name} onChangeText={(t) => setGForm({ ...gForm, name: t })} mode="outlined" style={styles.input} outlineColor={colors.inputBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} />
            <TextInput label="Location" value={gForm.location} onChangeText={(t) => setGForm({ ...gForm, location: t })} mode="outlined" style={styles.input} outlineColor={colors.inputBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} />
            <Menu visible={projectMenu} onDismiss={() => setProjectMenu(false)} anchor={<Button mode="outlined" onPress={() => setProjectMenu(true)} style={styles.input}>{projects.find((p) => p.id === gForm.project_id)?.name || 'Select Project'}</Button>}>
              <Menu.Item onPress={() => { setGForm({ ...gForm, project_id: '' }); setProjectMenu(false); }} title="None" />
              {projects.map((p) => (<Menu.Item key={p.id} onPress={() => { setGForm({ ...gForm, project_id: p.id }); setProjectMenu(false); }} title={p.name} />))}
            </Menu>
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={() => setGateDialog(false)} textColor={colors.textMuted} disabled={saving}>Cancel</Button>
            <Button onPress={saveGate} textColor={colors.primary} loading={saving} disabled={saving}>Save</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>

      {/* Reason Dialog */}
      <Portal>
        <Dialog visible={reasonDialog} onDismiss={() => setReasonDialog(false)} style={styles.dialog}>
          <Dialog.Title style={styles.dialogTitle}>{editingReason ? 'Edit' : 'Add'} Rejection Reason</Dialog.Title>
          <Dialog.Content>
            <TextInput label="Reason *" value={rForm.reason_text} onChangeText={(t) => setRForm({ ...rForm, reason_text: t })} mode="outlined" style={styles.input} outlineColor={colors.inputBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} multiline />
            <Menu visible={catMenu} onDismiss={() => setCatMenu(false)} anchor={<Button mode="outlined" onPress={() => setCatMenu(true)} style={styles.input}>{REJECTION_CATEGORIES.find((c) => c.value === rForm.category)?.label}</Button>}>
              {REJECTION_CATEGORIES.map((c) => (<Menu.Item key={c.value} onPress={() => { setRForm({ ...rForm, category: c.value }); setCatMenu(false); }} title={c.label} />))}
            </Menu>
            <View style={styles.switchRow}>
              <Text style={{ color: colors.textPrimary }}>Active</Text>
              <Switch value={rForm.is_active} onValueChange={(v) => setRForm({ ...rForm, is_active: v })} color={colors.primary} />
            </View>
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={() => setReasonDialog(false)} textColor={colors.textMuted} disabled={saving}>Cancel</Button>
            <Button onPress={saveReason} textColor={colors.primary} loading={saving} disabled={saving}>Save</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>

      {/* Company Dialog */}
      <Portal>
        <Dialog visible={companyDialog} onDismiss={() => setCompanyDialog(false)} style={styles.dialog}>
          <Dialog.Title style={styles.dialogTitle}>{editingCompany ? 'Edit' : 'Add'} Company</Dialog.Title>
          <Dialog.Content>
            <TextInput label="Name *" value={cForm.name} onChangeText={(t) => setCForm({ ...cForm, name: t })} mode="outlined" style={styles.input} outlineColor={colors.inputBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} />
            <TextInput label="Code *" value={cForm.code} onChangeText={(t) => setCForm({ ...cForm, code: t.toUpperCase() })} mode="outlined" style={styles.input} outlineColor={colors.inputBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} />
            <TextInput label="Contact Email" value={cForm.contact_email} onChangeText={(t) => setCForm({ ...cForm, contact_email: t })} mode="outlined" style={styles.input} outlineColor={colors.inputBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} keyboardType="email-address" />
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={() => setCompanyDialog(false)} textColor={colors.textMuted} disabled={saving}>Cancel</Button>
            <Button onPress={saveCompany} textColor={colors.primary} loading={saving} disabled={saving}>Save</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
    </GlassBackground>
  );
}

const styles = StyleSheet.create({
  loading: { flex: 1, justifyContent: 'center', alignItems: 'center' },
  header: { paddingHorizontal: 16, paddingBottom: 12 },
  title: { color: colors.textPrimary, fontSize: 26, fontWeight: 'bold' },
  tabs: { marginBottom: 8 },
  tabsContent: { paddingHorizontal: 8 },
  tab: { flexDirection: 'row', alignItems: 'center', marginHorizontal: 2, gap: 6, marginVertical: 0 },
  tabActive: { borderWidth: 1, borderColor: colors.primary },
  tabText: { color: colors.textMuted, fontSize: 12, fontWeight: '500' },
  tabTextActive: { color: colors.primary },
  tabDivider: { width: 1, height: 24, backgroundColor: glass.border.color, marginHorizontal: 4, alignSelf: 'center' },
  list: { padding: 8, paddingBottom: 100 },
  card: { marginHorizontal: 8, marginVertical: 4 },
  row: { flexDirection: 'row', alignItems: 'center' },
  icon: { width: 40, height: 40, borderRadius: 20, justifyContent: 'center', alignItems: 'center', marginRight: 10, flexShrink: 0 },
  info: { flex: 1, marginRight: 8 },
  name: { color: colors.textPrimary, fontWeight: '600', fontSize: 14 },
  sub: { color: colors.textSecondary, fontSize: 12 },
  detailRow: { flexDirection: 'row', alignItems: 'center', gap: 4, marginTop: 2 },
  chipRow: { flexDirection: 'row', gap: 6, marginTop: 4, flexWrap: 'wrap' },
  actions: { flexDirection: 'row', alignItems: 'center', flexShrink: 0 },
  actionBtn: { margin: 0, minWidth: 44, minHeight: 44 },
  chipSmall: { height: 22 },
  chipSmallText: { fontSize: 10 },
  fab: { position: 'absolute', right: 16, bottom: 80, backgroundColor: colors.primary },
  dialog: { backgroundColor: colors.cardSolid, borderRadius: glass.border.radius.lg },
  dialogTitle: { color: colors.textPrimary },
  input: { marginBottom: 10, backgroundColor: colors.inputBackground },
  switchRow: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', marginTop: 8 },
  auditHeader: { color: colors.textMuted, fontSize: 12, paddingHorizontal: 16, paddingVertical: 8, fontStyle: 'italic' },
});
