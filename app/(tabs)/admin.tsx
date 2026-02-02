import React, { useState, useEffect, useCallback } from 'react';
import { View, StyleSheet, FlatList, Alert, ScrollView, StatusBar } from 'react-native';
import { Text, FAB, IconButton, Dialog, Portal, TextInput, Button, Switch, ActivityIndicator, Chip, Menu } from 'react-native-paper';
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
  EQUIPMENT_TYPES,
  REJECTION_CATEGORIES,
  getEquipmentTypeConfig,
  getCategoryDisplay,
  getStatusColor,
} from '../../lib/supabase';
import { useAuth, useIsOwner } from '../../lib/auth';
import { colors, glass, roleColors } from '../../lib/theme';
import { MENU_MAX_HEIGHT, DIALOG_MAX_HEIGHT, getErrorMessage } from '../../lib/constants';
import GlassCard from '../../components/GlassCard';
import GlassBackground from '../../components/GlassBackground';

type TabValue = 'vehicles' | 'projects' | 'gates' | 'reasons' | 'users' | 'companies';

export default function AdminScreen() {
  const { user, company } = useAuth();
  const { isOwner } = useIsOwner();
  const [activeTab, setActiveTab] = useState<TabValue>('vehicles');
  const [loading, setLoading] = useState(true);
  const [vehicles, setVehicles] = useState<VehicleEquipment[]>([]);
  const [projects, setProjects] = useState<Project[]>([]);
  const [gates, setGates] = useState<Gate[]>([]);
  const [rejectionReasons, setRejectionReasons] = useState<RejectionReason[]>([]);
  const [users, setUsers] = useState<User[]>([]);
  const [companies, setCompanies] = useState<Company[]>([]);

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

  const fetchData = useCallback(async () => {
    setLoading(true);
    try {
      const [v, p, g, r, u, c] = await Promise.all([
        supabase.from('vehicles_equipment').select('*').order('plate_number'),
        supabase.from('projects').select('*').order('name'),
        supabase.from('gates').select('*, project:projects(*)').order('name'),
        supabase.from('rejection_reasons').select('*').order('reason_text'),
        isOwner
          ? supabase.from('users').select('*, company:companies(*)').order('full_name')
          : supabase.from('users').select('*, company:companies(*)').eq('company_id', company?.id).order('full_name'),
        isOwner ? supabase.from('companies').select('*').order('name') : Promise.resolve({ data: [] }),
      ]);
      if (v.data) setVehicles(v.data);
      if (p.data) setProjects(p.data);
      if (g.data) setGates(g.data);
      if (r.data) setRejectionReasons(r.data);
      if (u.data) setUsers(u.data);
      if (c.data) setCompanies(c.data);
    } catch {
      // Silently handle fetch errors - user can navigate away and back to retry
    } finally {
      setLoading(false);
    }
  }, [isOwner, company?.id]);

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
    if (!vForm.plate_number) { Alert.alert('Error', 'Plate number is required'); return; }
    if (!company?.id || !user?.id) { Alert.alert('Error', 'Session expired'); return; }
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
    } catch (err) { Alert.alert('Error', getErrorMessage(err, 'Failed to save')); }
    finally { setSaving(false); }
  };

  const deleteVehicle = (id: string) => Alert.alert('Delete?', 'This will permanently delete this vehicle/equipment', [
    { text: 'Cancel' },
    { text: 'Delete', style: 'destructive', onPress: async () => {
      setDeleting(id);
      try {
        const { error } = await supabase.from('vehicles_equipment').delete().eq('id', id);
        if (error) throw error;
        fetchData();
      } catch (err) { Alert.alert('Error', getErrorMessage(err)); }
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
    if (!pForm.name) { Alert.alert('Error', 'Name required'); return; }
    if (!company?.id) { Alert.alert('Error', 'Session expired'); return; }
    setSaving(true);
    try {
      const data = { name: pForm.name, code: pForm.code || null };
      let error;
      if (editingProject) ({ error } = await supabase.from('projects').update(data).eq('id', editingProject.id));
      else ({ error } = await supabase.from('projects').insert({ ...data, company_id: company.id }));
      if (error) throw error;
      setProjectDialog(false);
      fetchData();
    } catch (err) { Alert.alert('Error', getErrorMessage(err)); }
    finally { setSaving(false); }
  };

  const deleteProject = (id: string) => Alert.alert('Delete?', '', [
    { text: 'Cancel' },
    { text: 'Delete', style: 'destructive', onPress: async () => {
      setDeleting(id);
      try {
        const { error } = await supabase.from('projects').delete().eq('id', id);
        if (error) throw error;
        fetchData();
      } catch (err) { Alert.alert('Error', getErrorMessage(err)); }
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
    if (!gForm.name) { Alert.alert('Error', 'Name required'); return; }
    if (!company?.id) { Alert.alert('Error', 'Session expired'); return; }
    setSaving(true);
    try {
      const data = { name: gForm.name, location: gForm.location || null, project_id: gForm.project_id || null };
      let error;
      if (editingGate) ({ error } = await supabase.from('gates').update(data).eq('id', editingGate.id));
      else ({ error } = await supabase.from('gates').insert({ ...data, company_id: company.id }));
      if (error) throw error;
      setGateDialog(false);
      fetchData();
    } catch (err) { Alert.alert('Error', getErrorMessage(err)); }
    finally { setSaving(false); }
  };

  const deleteGate = (id: string) => Alert.alert('Delete?', '', [
    { text: 'Cancel' },
    { text: 'Delete', style: 'destructive', onPress: async () => {
      setDeleting(id);
      try {
        const { error } = await supabase.from('gates').delete().eq('id', id);
        if (error) throw error;
        fetchData();
      } catch (err) { Alert.alert('Error', getErrorMessage(err)); }
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
    if (!rForm.reason_text) { Alert.alert('Error', 'Reason required'); return; }
    if (!company?.id) { Alert.alert('Error', 'Session expired'); return; }
    setSaving(true);
    try {
      const data = { reason_text: rForm.reason_text, category: rForm.category, is_active: rForm.is_active };
      let error;
      if (editingReason) ({ error } = await supabase.from('rejection_reasons').update(data).eq('id', editingReason.id));
      else ({ error } = await supabase.from('rejection_reasons').insert({ ...data, company_id: company.id }));
      if (error) throw error;
      setReasonDialog(false);
      fetchData();
    } catch (err) { Alert.alert('Error', getErrorMessage(err)); }
    finally { setSaving(false); }
  };

  const deleteReason = (id: string) => Alert.alert('Delete?', '', [
    { text: 'Cancel' },
    { text: 'Delete', style: 'destructive', onPress: async () => {
      setDeleting(id);
      try {
        const { error } = await supabase.from('rejection_reasons').delete().eq('id', id);
        if (error) throw error;
        fetchData();
      } catch (err) { Alert.alert('Error', getErrorMessage(err)); }
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
    if (!cForm.name || !cForm.code) { Alert.alert('Error', 'Name and code required'); return; }
    setSaving(true);
    try {
      const data = { name: cForm.name, code: cForm.code.toUpperCase(), contact_email: cForm.contact_email || null };
      let error;
      if (editingCompany) ({ error } = await supabase.from('companies').update(data).eq('id', editingCompany.id));
      else ({ error } = await supabase.from('companies').insert(data));
      if (error) throw error;
      setCompanyDialog(false);
      fetchData();
    } catch (err) { Alert.alert('Error', getErrorMessage(err)); }
    finally { setSaving(false); }
  };

  // User role toggle - now includes contractor
  const toggleRole = async (u: User, newRole: UserRole) => {
    if (u.id === user?.id || u.role === 'owner') return;
    try {
      const { error } = await supabase.from('users').update({ role: newRole }).eq('id', u.id);
      if (error) throw error;
      fetchData();
    } catch (err) { Alert.alert('Error', getErrorMessage(err)); }
  };

  // Tab component
  const Tab = ({ value, label, icon }: { value: TabValue; label: string; icon: string }) => {
    const isActive = activeTab === value;
    return (
      <GlassCard
        onPress={() => setActiveTab(value)}
        style={isActive ? { ...styles.tab, ...styles.tabActive } : styles.tab}
        padding={10}
        accessibilityRole="tab"
        accessibilityLabel={label}
      >
        <MaterialCommunityIcons name={icon as any} size={18} color={isActive ? colors.primary : colors.textMuted} />
        <Text style={isActive ? { ...styles.tabText, ...styles.tabTextActive } : styles.tabText}>{label}</Text>
      </GlassCard>
    );
  };

  // List items
  const VehicleItem = ({ item }: { item: VehicleEquipment }) => {
    const tc = getEquipmentTypeConfig(item.equipment_type);
    const statusColor = getStatusColor(item.actual_status);
    return (
      <GlassCard style={styles.card} padding={12}>
        <View style={styles.row}>
          <View style={[styles.icon, { backgroundColor: `${colors.primary}15` }]}>
            <MaterialCommunityIcons name={tc.icon as any} size={22} color={colors.primary} />
          </View>
          <View style={styles.info}>
            <Text style={styles.name}>{item.plate_number}</Text>
            <Text style={styles.sub}>{tc.label} - {getCategoryDisplay(item.equipment_category)}</Text>
            {item.driver_name && (
              <View style={styles.detailRow}>
                <MaterialCommunityIcons name="account" size={12} color={colors.textMuted} />
                <Text style={styles.sub}>{item.driver_name}</Text>
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
          <IconButton icon="pencil" size={18} iconColor={colors.textMuted} onPress={() => openVehicle(item)} disabled={deleting === item.id} />
          <IconButton icon={deleting === item.id ? 'loading' : 'delete'} size={18} iconColor={colors.error} onPress={() => deleteVehicle(item.id)} disabled={deleting === item.id} />
        </View>
      </GlassCard>
    );
  };

  const ProjectItem = ({ item }: { item: Project }) => (
    <GlassCard style={styles.card} padding={12}>
      <View style={styles.row}>
        <View style={[styles.icon, { backgroundColor: `${colors.secondary}15` }]}>
          <MaterialCommunityIcons name="clipboard-text" size={22} color={colors.secondary} />
        </View>
        <View style={styles.info}>
          <Text style={styles.name}>{item.name}</Text>
          {item.code && <Text style={styles.sub}>Code: {item.code}</Text>}
          <Chip mode="flat" style={[styles.chipSmall, { backgroundColor: item.is_active ? `${colors.success}15` : `${colors.error}15`, marginTop: 4 }]} textStyle={[styles.chipSmallText, { color: item.is_active ? colors.success : colors.error }]}>
            {item.is_active ? 'Active' : 'Inactive'}
          </Chip>
        </View>
        <IconButton icon="pencil" size={18} iconColor={colors.textMuted} onPress={() => openProject(item)} disabled={deleting === item.id} />
        <IconButton icon={deleting === item.id ? 'loading' : 'delete'} size={18} iconColor={colors.error} onPress={() => deleteProject(item.id)} disabled={deleting === item.id} />
      </View>
    </GlassCard>
  );

  const GateItem = ({ item }: { item: Gate }) => (
    <GlassCard style={styles.card} padding={12}>
      <View style={styles.row}>
        <View style={[styles.icon, { backgroundColor: `${colors.warning}15` }]}>
          <MaterialCommunityIcons name="gate" size={22} color={colors.warning} />
        </View>
        <View style={styles.info}>
          <Text style={styles.name}>{item.name}</Text>
          {item.location && <Text style={styles.sub}>{item.location}</Text>}
          {item.project && <Text style={styles.sub}>Project: {item.project.name}</Text>}
        </View>
        <IconButton icon="pencil" size={18} iconColor={colors.textMuted} onPress={() => openGate(item)} disabled={deleting === item.id} />
        <IconButton icon={deleting === item.id ? 'loading' : 'delete'} size={18} iconColor={colors.error} onPress={() => deleteGate(item.id)} disabled={deleting === item.id} />
      </View>
    </GlassCard>
  );

  const ReasonItem = ({ item }: { item: RejectionReason }) => {
    const cat = REJECTION_CATEGORIES.find((c) => c.value === item.category) || REJECTION_CATEGORIES[0];
    return (
      <GlassCard style={styles.card} padding={12}>
        <View style={styles.row}>
          <View style={[styles.icon, { backgroundColor: `${cat.color}15` }]}>
            <MaterialCommunityIcons name={cat.icon as any} size={22} color={cat.color} />
          </View>
          <View style={styles.info}>
            <Text style={styles.name}>{item.reason_text}</Text>
            <View style={styles.chipRow}>
              <Chip mode="flat" style={[styles.chipSmall, { backgroundColor: `${cat.color}15` }]} textStyle={[styles.chipSmallText, { color: cat.color }]}>
                {cat.label}
              </Chip>
              <Chip mode="flat" style={[styles.chipSmall, { backgroundColor: item.is_active ? `${colors.success}15` : `${colors.error}15` }]} textStyle={[styles.chipSmallText, { color: item.is_active ? colors.success : colors.error }]}>
                {item.is_active ? 'Active' : 'Inactive'}
              </Chip>
            </View>
          </View>
          <IconButton icon="pencil" size={18} iconColor={colors.textMuted} onPress={() => openReason(item)} disabled={deleting === item.id} />
          <IconButton icon={deleting === item.id ? 'loading' : 'delete'} size={18} iconColor={colors.error} onPress={() => deleteReason(item.id)} disabled={deleting === item.id} />
        </View>
      </GlassCard>
    );
  };

  const UserItem = ({ item }: { item: User }) => {
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
            <Text style={styles.name}>{item.full_name}</Text>
            <Text style={styles.sub}>{item.email}</Text>
            {item.company && (
              <View style={styles.detailRow}>
                <MaterialCommunityIcons name="domain" size={12} color={colors.textMuted} />
                <Text style={styles.sub}>{item.company.name}</Text>
              </View>
            )}
            <Chip mode="flat" style={[styles.chipSmall, { backgroundColor: `${rc}15`, marginTop: 4 }]} textStyle={[styles.chipSmallText, { color: rc }]}>
              {item.role.charAt(0).toUpperCase() + item.role.slice(1)}
            </Chip>
          </View>
          {item.role !== 'owner' && item.id !== user?.id && (
            <Button mode="text" compact onPress={() => toggleRole(item, getNextRole(item.role))} textColor={colors.primary}>
              {getRoleButtonLabel(item.role)}
            </Button>
          )}
        </View>
      </GlassCard>
    );
  };

  const CompanyItem = ({ item }: { item: Company }) => (
    <GlassCard style={styles.card} padding={12}>
      <View style={styles.row}>
        <View style={[styles.icon, { backgroundColor: `${colors.primary}15` }]}>
          <MaterialCommunityIcons name="domain" size={22} color={colors.primary} />
        </View>
        <View style={styles.info}>
          <Text style={styles.name}>{item.name}</Text>
          <Text style={styles.sub}>Code: {item.code}</Text>
          <Chip mode="flat" style={[styles.chipSmall, { backgroundColor: item.is_active ? `${colors.success}15` : `${colors.error}15`, marginTop: 4 }]} textStyle={[styles.chipSmallText, { color: item.is_active ? colors.success : colors.error }]}>
            {item.is_active ? 'Active' : 'Inactive'}
          </Chip>
        </View>
        <IconButton icon="pencil" size={18} iconColor={colors.textMuted} onPress={() => openCompany(item)} />
      </View>
    </GlassCard>
  );

  const Empty = ({ icon, text }: { icon: string; text: string }) => (
    <GlassCard style={styles.empty} padding={32}>
      <MaterialCommunityIcons name={icon as any} size={48} color={colors.textMuted} />
      <Text style={styles.emptyText}>{text}</Text>
    </GlassCard>
  );

  if (loading) {
    return (
      <GlassBackground>
        <View style={styles.loading}>
          <ActivityIndicator size="large" color={colors.primary} />
        </View>
      </GlassBackground>
    );
  }

  return (
    <GlassBackground>
      <StatusBar barStyle="light-content" backgroundColor="transparent" translucent />
      <View style={styles.header}>
        <Text style={styles.title}>Management</Text>
      </View>

      <ScrollView horizontal showsHorizontalScrollIndicator={false} style={styles.tabs}>
        <Tab value="vehicles" label="Vehicles" icon="car" />
        <Tab value="projects" label="Projects" icon="clipboard-text" />
        <Tab value="gates" label="Gates" icon="gate" />
        <Tab value="reasons" label="Reasons" icon="alert-circle" />
        <Tab value="users" label="Users" icon="account-group" />
        {isOwner && <Tab value="companies" label="Companies" icon="domain" />}
      </ScrollView>

      {activeTab === 'vehicles' && <FlatList data={vehicles} keyExtractor={(i) => i.id} renderItem={({ item }) => <VehicleItem item={item} />} contentContainerStyle={styles.list} ListEmptyComponent={<Empty icon="car-off" text="No vehicles/equipment" />} />}
      {activeTab === 'projects' && <FlatList data={projects} keyExtractor={(i) => i.id} renderItem={({ item }) => <ProjectItem item={item} />} contentContainerStyle={styles.list} ListEmptyComponent={<Empty icon="clipboard-off" text="No projects" />} />}
      {activeTab === 'gates' && <FlatList data={gates} keyExtractor={(i) => i.id} renderItem={({ item }) => <GateItem item={item} />} contentContainerStyle={styles.list} ListEmptyComponent={<Empty icon="gate" text="No gates" />} />}
      {activeTab === 'reasons' && <FlatList data={rejectionReasons} keyExtractor={(i) => i.id} renderItem={({ item }) => <ReasonItem item={item} />} contentContainerStyle={styles.list} ListEmptyComponent={<Empty icon="alert-circle-outline" text="No rejection reasons" />} />}
      {activeTab === 'users' && <FlatList data={users} keyExtractor={(i) => i.id} renderItem={({ item }) => <UserItem item={item} />} contentContainerStyle={styles.list} ListEmptyComponent={<Empty icon="account-off" text="No users" />} />}
      {activeTab === 'companies' && isOwner && <FlatList data={companies} keyExtractor={(i) => i.id} renderItem={({ item }) => <CompanyItem item={item} />} contentContainerStyle={styles.list} ListEmptyComponent={<Empty icon="domain" text="No companies" />} />}

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
              <TextInput label="Plate Number *" value={vForm.plate_number} onChangeText={(t) => setVForm({ ...vForm, plate_number: t.toUpperCase() })} mode="outlined" style={styles.input} outlineColor={colors.inputBorder} activeOutlineColor={colors.primary} textColor={colors.textPrimary} />
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
  header: { paddingTop: 50, paddingHorizontal: 16, paddingBottom: 12 },
  title: { color: colors.textPrimary, fontSize: 26, fontWeight: 'bold' },
  tabs: { paddingHorizontal: 8, marginBottom: 8, maxHeight: 50 },
  tab: { flexDirection: 'row', alignItems: 'center', marginHorizontal: 4, gap: 6 },
  tabActive: { borderWidth: 1, borderColor: colors.primary },
  tabText: { color: colors.textMuted, fontSize: 12, fontWeight: '500' },
  tabTextActive: { color: colors.primary },
  list: { padding: 8, paddingBottom: 100 },
  card: { marginHorizontal: 8, marginVertical: 3 },
  row: { flexDirection: 'row', alignItems: 'center' },
  icon: { width: 40, height: 40, borderRadius: 20, justifyContent: 'center', alignItems: 'center', marginRight: 10 },
  info: { flex: 1 },
  name: { color: colors.textPrimary, fontWeight: '600', fontSize: 14 },
  sub: { color: colors.textSecondary, fontSize: 12 },
  detailRow: { flexDirection: 'row', alignItems: 'center', gap: 4, marginTop: 2 },
  chipRow: { flexDirection: 'row', gap: 6, marginTop: 4 },
  chipSmall: { height: 22 },
  chipSmallText: { fontSize: 10 },
  empty: { alignItems: 'center', margin: 16 },
  emptyText: { color: colors.textMuted, marginTop: 12 },
  fab: { position: 'absolute', right: 16, bottom: 80, backgroundColor: colors.primary },
  dialog: { backgroundColor: colors.cardSolid, borderRadius: glass.border.radius.lg },
  dialogTitle: { color: colors.textPrimary },
  input: { marginBottom: 10, backgroundColor: colors.inputBackground },
  switchRow: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', marginTop: 8 },
});
