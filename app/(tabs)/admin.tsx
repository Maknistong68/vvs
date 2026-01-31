import React, { useState, useEffect, useCallback } from 'react';
import {
  View,
  StyleSheet,
  FlatList,
  Alert,
} from 'react-native';
import {
  Text,
  FAB,
  Card,
  IconButton,
  Dialog,
  Portal,
  TextInput,
  Button,
  Switch,
  ActivityIndicator,
  SegmentedButtons,
  Chip,
  Menu,
} from 'react-native-paper';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import {
  supabase,
  Vehicle,
  FailureReason,
  User,
  UserRole,
  Company,
  VehicleType,
  VEHICLE_TYPES,
  getVehicleTypeConfig,
} from '../../lib/supabase';
import { useAuth, useIsOwner, useCanManageVehicles, useCanManageFailureReasons } from '../../lib/auth';

type TabValue = 'vehicles' | 'reasons' | 'users' | 'companies';

export default function AdminScreen() {
  const { user, company } = useAuth();
  const isOwner = useIsOwner();
  const canManageVehicles = useCanManageVehicles();
  const canManageFailureReasons = useCanManageFailureReasons();

  const [activeTab, setActiveTab] = useState<TabValue>('vehicles');
  const [loading, setLoading] = useState(true);

  // Data states
  const [vehicles, setVehicles] = useState<Vehicle[]>([]);
  const [failureReasons, setFailureReasons] = useState<FailureReason[]>([]);
  const [users, setUsers] = useState<User[]>([]);
  const [companies, setCompanies] = useState<Company[]>([]);

  // Dialog states
  const [vehicleDialogVisible, setVehicleDialogVisible] = useState(false);
  const [reasonDialogVisible, setReasonDialogVisible] = useState(false);
  const [companyDialogVisible, setCompanyDialogVisible] = useState(false);
  const [editingVehicle, setEditingVehicle] = useState<Vehicle | null>(null);
  const [editingReason, setEditingReason] = useState<FailureReason | null>(null);
  const [editingCompany, setEditingCompany] = useState<Company | null>(null);

  // Form states
  const [vehicleForm, setVehicleForm] = useState({
    name: '',
    plate_number: '',
    vehicle_type: 'car' as VehicleType,
    make: '',
    model: '',
    year: '',
    vin: '',
    notes: '',
  });
  const [reasonForm, setReasonForm] = useState({ reason_text: '', category: '', is_active: true });
  const [companyForm, setCompanyForm] = useState({
    name: '',
    code: '',
    address: '',
    contact_email: '',
    contact_phone: '',
  });

  // Menu states
  const [vehicleTypeMenuVisible, setVehicleTypeMenuVisible] = useState(false);

  // Fetch all data
  const fetchData = useCallback(async () => {
    setLoading(true);
    try {
      const [vehiclesRes, reasonsRes, usersRes, companiesRes] = await Promise.all([
        supabase.from('vehicles').select('*').order('name'),
        supabase.from('failure_reasons').select('*').order('reason_text'),
        isOwner
          ? supabase.from('users').select('*, company:companies(*)').order('full_name')
          : supabase
              .from('users')
              .select('*, company:companies(*)')
              .eq('company_id', company?.id)
              .order('full_name'),
        isOwner ? supabase.from('companies').select('*').order('name') : Promise.resolve({ data: [] }),
      ]);

      if (vehiclesRes.data) setVehicles(vehiclesRes.data);
      if (reasonsRes.data) setFailureReasons(reasonsRes.data);
      if (usersRes.data) setUsers(usersRes.data);
      if (companiesRes.data) setCompanies(companiesRes.data);
    } catch (error) {
      console.error('Error fetching admin data:', error);
    } finally {
      setLoading(false);
    }
  }, [isOwner, company?.id]);

  useEffect(() => {
    fetchData();
  }, [fetchData]);

  // Vehicle CRUD
  const openVehicleDialog = (vehicle?: Vehicle) => {
    if (vehicle) {
      setEditingVehicle(vehicle);
      setVehicleForm({
        name: vehicle.name,
        plate_number: vehicle.plate_number,
        vehicle_type: vehicle.vehicle_type,
        make: vehicle.make || '',
        model: vehicle.model || '',
        year: vehicle.year?.toString() || '',
        vin: vehicle.vin || '',
        notes: vehicle.notes || '',
      });
    } else {
      setEditingVehicle(null);
      setVehicleForm({
        name: '',
        plate_number: '',
        vehicle_type: 'car',
        make: '',
        model: '',
        year: '',
        vin: '',
        notes: '',
      });
    }
    setVehicleDialogVisible(true);
  };

  const saveVehicle = async () => {
    if (!vehicleForm.name || !vehicleForm.plate_number) {
      Alert.alert('Error', 'Please fill in required fields (Name and Plate Number)');
      return;
    }

    try {
      const vehicleData = {
        name: vehicleForm.name,
        plate_number: vehicleForm.plate_number,
        vehicle_type: vehicleForm.vehicle_type,
        make: vehicleForm.make || null,
        model: vehicleForm.model || null,
        year: vehicleForm.year ? parseInt(vehicleForm.year) : null,
        vin: vehicleForm.vin || null,
        notes: vehicleForm.notes || null,
      };

      if (editingVehicle) {
        await supabase.from('vehicles').update(vehicleData).eq('id', editingVehicle.id);
      } else {
        await supabase.from('vehicles').insert({
          ...vehicleData,
          company_id: company!.id,
          created_by: user!.id,
        });
      }
      setVehicleDialogVisible(false);
      fetchData();
    } catch (error: any) {
      Alert.alert('Error', error.message || 'Failed to save vehicle');
    }
  };

  const deleteVehicle = (id: string) => {
    Alert.alert('Confirm Delete', 'Are you sure you want to delete this vehicle?', [
      { text: 'Cancel', style: 'cancel' },
      {
        text: 'Delete',
        style: 'destructive',
        onPress: async () => {
          try {
            await supabase.from('vehicles').delete().eq('id', id);
            fetchData();
          } catch (error: any) {
            Alert.alert('Error', error.message || 'Failed to delete');
          }
        },
      },
    ]);
  };

  // Failure Reason CRUD
  const openReasonDialog = (reason?: FailureReason) => {
    if (reason) {
      setEditingReason(reason);
      setReasonForm({
        reason_text: reason.reason_text,
        category: reason.category || '',
        is_active: reason.is_active,
      });
    } else {
      setEditingReason(null);
      setReasonForm({ reason_text: '', category: '', is_active: true });
    }
    setReasonDialogVisible(true);
  };

  const saveReason = async () => {
    if (!reasonForm.reason_text) {
      Alert.alert('Error', 'Please enter a reason');
      return;
    }

    try {
      const reasonData = {
        reason_text: reasonForm.reason_text,
        category: reasonForm.category || null,
        is_active: reasonForm.is_active,
      };

      if (editingReason) {
        await supabase.from('failure_reasons').update(reasonData).eq('id', editingReason.id);
      } else {
        await supabase.from('failure_reasons').insert({
          ...reasonData,
          company_id: company!.id,
          created_by: user!.id,
        });
      }
      setReasonDialogVisible(false);
      fetchData();
    } catch (error: any) {
      Alert.alert('Error', error.message || 'Failed to save reason');
    }
  };

  const deleteReason = (id: string) => {
    Alert.alert('Confirm Delete', 'Are you sure you want to delete this failure reason?', [
      { text: 'Cancel', style: 'cancel' },
      {
        text: 'Delete',
        style: 'destructive',
        onPress: async () => {
          try {
            await supabase.from('failure_reasons').delete().eq('id', id);
            fetchData();
          } catch (error: any) {
            Alert.alert('Error', error.message || 'Failed to delete');
          }
        },
      },
    ]);
  };

  // Company CRUD (Owner only)
  const openCompanyDialog = (companyData?: Company) => {
    if (companyData) {
      setEditingCompany(companyData);
      setCompanyForm({
        name: companyData.name,
        code: companyData.code,
        address: companyData.address || '',
        contact_email: companyData.contact_email || '',
        contact_phone: companyData.contact_phone || '',
      });
    } else {
      setEditingCompany(null);
      setCompanyForm({
        name: '',
        code: '',
        address: '',
        contact_email: '',
        contact_phone: '',
      });
    }
    setCompanyDialogVisible(true);
  };

  const saveCompany = async () => {
    if (!companyForm.name || !companyForm.code) {
      Alert.alert('Error', 'Please fill in company name and code');
      return;
    }

    try {
      const companyData = {
        name: companyForm.name,
        code: companyForm.code.toUpperCase(),
        address: companyForm.address || null,
        contact_email: companyForm.contact_email || null,
        contact_phone: companyForm.contact_phone || null,
      };

      if (editingCompany) {
        await supabase.from('companies').update(companyData).eq('id', editingCompany.id);
      } else {
        await supabase.from('companies').insert(companyData);
      }
      setCompanyDialogVisible(false);
      fetchData();
    } catch (error: any) {
      Alert.alert('Error', error.message || 'Failed to save company');
    }
  };

  // User Role Management
  const toggleUserRole = async (targetUser: User, newRole: UserRole) => {
    if (targetUser.id === user?.id) {
      Alert.alert('Error', 'You cannot change your own role');
      return;
    }

    if (targetUser.role === 'owner') {
      Alert.alert('Error', 'Cannot modify owner role');
      return;
    }

    try {
      await supabase.from('users').update({ role: newRole }).eq('id', targetUser.id);
      fetchData();
      Alert.alert('Success', `User role updated to ${newRole}`);
    } catch (error: any) {
      Alert.alert('Error', error.message || 'Failed to update role');
    }
  };

  // Render vehicle item
  const renderVehicleItem = ({ item }: { item: Vehicle }) => {
    const typeConfig = getVehicleTypeConfig(item.vehicle_type);
    return (
      <Card style={styles.card}>
        <Card.Content style={styles.cardContent}>
          <MaterialCommunityIcons name={typeConfig.icon as any} size={32} color="#6200EE" />
          <View style={styles.cardInfo}>
            <Text variant="titleMedium">{item.name}</Text>
            <Text variant="bodySmall" style={styles.subText}>
              {item.plate_number} | {typeConfig.label}
            </Text>
            {item.make && (
              <Text variant="bodySmall" style={styles.subText}>
                {item.make} {item.model} {item.year ? `(${item.year})` : ''}
              </Text>
            )}
          </View>
          <View style={styles.cardActions}>
            <IconButton icon="pencil" size={20} onPress={() => openVehicleDialog(item)} />
            <IconButton
              icon="delete"
              size={20}
              iconColor="#F44336"
              onPress={() => deleteVehicle(item.id)}
            />
          </View>
        </Card.Content>
      </Card>
    );
  };

  // Render failure reason item
  const renderReasonItem = ({ item }: { item: FailureReason }) => (
    <Card style={styles.card}>
      <Card.Content style={styles.cardContent}>
        <MaterialCommunityIcons
          name="alert-circle"
          size={32}
          color={item.is_active ? '#F44336' : '#999'}
        />
        <View style={styles.cardInfo}>
          <Text variant="titleMedium">{item.reason_text}</Text>
          {item.category && (
            <Text variant="bodySmall" style={styles.subText}>
              Category: {item.category}
            </Text>
          )}
          <Chip
            mode="flat"
            style={{ backgroundColor: item.is_active ? '#E8F5E9' : '#FFEBEE', marginTop: 4 }}
            textStyle={{ fontSize: 10 }}
          >
            {item.is_active ? 'Active' : 'Inactive'}
          </Chip>
        </View>
        <View style={styles.cardActions}>
          <IconButton icon="pencil" size={20} onPress={() => openReasonDialog(item)} />
          <IconButton
            icon="delete"
            size={20}
            iconColor="#F44336"
            onPress={() => deleteReason(item.id)}
          />
        </View>
      </Card.Content>
    </Card>
  );

  // Render user item
  const renderUserItem = ({ item }: { item: User }) => (
    <Card style={styles.card}>
      <Card.Content style={styles.cardContent}>
        <MaterialCommunityIcons
          name="account"
          size={32}
          color={item.role === 'owner' ? '#FF9800' : item.role === 'admin' ? '#6200EE' : '#666'}
        />
        <View style={styles.cardInfo}>
          <Text variant="titleMedium">{item.full_name}</Text>
          <Text variant="bodySmall" style={styles.subText}>
            {item.email}
          </Text>
          {isOwner && item.company && (
            <Text variant="bodySmall" style={styles.subText}>
              Company: {item.company.name}
            </Text>
          )}
          <Chip
            mode="flat"
            style={{
              backgroundColor:
                item.role === 'owner' ? '#FFF3E0' : item.role === 'admin' ? '#EDE7F6' : '#E0E0E0',
              marginTop: 4,
            }}
            textStyle={{ fontSize: 10 }}
          >
            {item.role.charAt(0).toUpperCase() + item.role.slice(1)}
          </Chip>
        </View>
        {item.role !== 'owner' && item.id !== user?.id && (
          <View style={styles.cardActions}>
            {item.role === 'inspector' ? (
              <Button mode="outlined" compact onPress={() => toggleUserRole(item, 'admin')}>
                Make Admin
              </Button>
            ) : (
              <Button mode="outlined" compact onPress={() => toggleUserRole(item, 'inspector')}>
                Remove Admin
              </Button>
            )}
          </View>
        )}
      </Card.Content>
    </Card>
  );

  // Render company item (Owner only)
  const renderCompanyItem = ({ item }: { item: Company }) => (
    <Card style={styles.card}>
      <Card.Content style={styles.cardContent}>
        <MaterialCommunityIcons name="domain" size={32} color="#6200EE" />
        <View style={styles.cardInfo}>
          <Text variant="titleMedium">{item.name}</Text>
          <Text variant="bodySmall" style={styles.subText}>
            Code: {item.code}
          </Text>
          {item.contact_email && (
            <Text variant="bodySmall" style={styles.subText}>
              {item.contact_email}
            </Text>
          )}
          <Chip
            mode="flat"
            style={{ backgroundColor: item.is_active ? '#E8F5E9' : '#FFEBEE', marginTop: 4 }}
            textStyle={{ fontSize: 10 }}
          >
            {item.is_active ? 'Active' : 'Inactive'}
          </Chip>
        </View>
        <View style={styles.cardActions}>
          <IconButton icon="pencil" size={20} onPress={() => openCompanyDialog(item)} />
        </View>
      </Card.Content>
    </Card>
  );

  if (loading) {
    return (
      <View style={styles.loadingContainer}>
        <ActivityIndicator size="large" color="#6200EE" />
      </View>
    );
  }

  const tabButtons = [
    { value: 'vehicles' as TabValue, label: 'Vehicles', icon: 'car' },
    { value: 'reasons' as TabValue, label: 'Reasons', icon: 'alert-circle' },
    { value: 'users' as TabValue, label: 'Users', icon: 'account-group' },
    ...(isOwner ? [{ value: 'companies' as TabValue, label: 'Companies', icon: 'domain' }] : []),
  ];

  return (
    <View style={styles.container}>
      {/* Tab Selector */}
      <SegmentedButtons
        value={activeTab}
        onValueChange={(value) => setActiveTab(value as TabValue)}
        buttons={tabButtons}
        style={styles.tabs}
        density="small"
      />

      {/* Content */}
      {activeTab === 'vehicles' && (
        <FlatList
          data={vehicles}
          keyExtractor={(item) => item.id}
          renderItem={renderVehicleItem}
          contentContainerStyle={styles.listContent}
          ListEmptyComponent={
            <View style={styles.emptyContainer}>
              <MaterialCommunityIcons name="car-off" size={64} color="#ccc" />
              <Text style={styles.emptyText}>No vehicles yet</Text>
            </View>
          }
        />
      )}

      {activeTab === 'reasons' && (
        <FlatList
          data={failureReasons}
          keyExtractor={(item) => item.id}
          renderItem={renderReasonItem}
          contentContainerStyle={styles.listContent}
          ListEmptyComponent={
            <View style={styles.emptyContainer}>
              <MaterialCommunityIcons name="alert-circle-outline" size={64} color="#ccc" />
              <Text style={styles.emptyText}>No failure reasons yet</Text>
            </View>
          }
        />
      )}

      {activeTab === 'users' && (
        <FlatList
          data={users}
          keyExtractor={(item) => item.id}
          renderItem={renderUserItem}
          contentContainerStyle={styles.listContent}
          ListEmptyComponent={
            <View style={styles.emptyContainer}>
              <MaterialCommunityIcons name="account-off" size={64} color="#ccc" />
              <Text style={styles.emptyText}>No users found</Text>
            </View>
          }
        />
      )}

      {activeTab === 'companies' && isOwner && (
        <FlatList
          data={companies}
          keyExtractor={(item) => item.id}
          renderItem={renderCompanyItem}
          contentContainerStyle={styles.listContent}
          ListEmptyComponent={
            <View style={styles.emptyContainer}>
              <MaterialCommunityIcons name="domain" size={64} color="#ccc" />
              <Text style={styles.emptyText}>No companies yet</Text>
            </View>
          }
        />
      )}

      {/* FAB */}
      {(activeTab === 'vehicles' || activeTab === 'reasons' || activeTab === 'companies') && (
        <FAB
          icon="plus"
          style={styles.fab}
          color="#FFFFFF"
          onPress={() => {
            if (activeTab === 'vehicles') openVehicleDialog();
            else if (activeTab === 'reasons') openReasonDialog();
            else if (activeTab === 'companies') openCompanyDialog();
          }}
        />
      )}

      {/* Vehicle Dialog */}
      <Portal>
        <Dialog
          visible={vehicleDialogVisible}
          onDismiss={() => setVehicleDialogVisible(false)}
          style={styles.dialog}
        >
          <Dialog.Title>{editingVehicle ? 'Edit Vehicle' : 'Add Vehicle'}</Dialog.Title>
          <Dialog.ScrollArea style={styles.dialogScrollArea}>
            <View style={styles.dialogContent}>
              <TextInput
                label="Vehicle Name *"
                value={vehicleForm.name}
                onChangeText={(text) => setVehicleForm({ ...vehicleForm, name: text })}
                mode="outlined"
                style={styles.dialogInput}
              />
              <TextInput
                label="Plate Number *"
                value={vehicleForm.plate_number}
                onChangeText={(text) => setVehicleForm({ ...vehicleForm, plate_number: text })}
                mode="outlined"
                style={styles.dialogInput}
              />

              <Text variant="labelMedium" style={styles.inputLabel}>
                Vehicle Type
              </Text>
              <Menu
                visible={vehicleTypeMenuVisible}
                onDismiss={() => setVehicleTypeMenuVisible(false)}
                anchor={
                  <Button
                    mode="outlined"
                    onPress={() => setVehicleTypeMenuVisible(true)}
                    style={styles.dialogInput}
                    icon={getVehicleTypeConfig(vehicleForm.vehicle_type).icon}
                  >
                    {getVehicleTypeConfig(vehicleForm.vehicle_type).label}
                  </Button>
                }
                contentStyle={styles.menuContent}
              >
                {VEHICLE_TYPES.map((type) => (
                  <Menu.Item
                    key={type.value}
                    onPress={() => {
                      setVehicleForm({ ...vehicleForm, vehicle_type: type.value });
                      setVehicleTypeMenuVisible(false);
                    }}
                    title={type.label}
                    leadingIcon={type.icon}
                  />
                ))}
              </Menu>

              <TextInput
                label="Make (e.g., Toyota)"
                value={vehicleForm.make}
                onChangeText={(text) => setVehicleForm({ ...vehicleForm, make: text })}
                mode="outlined"
                style={styles.dialogInput}
              />
              <TextInput
                label="Model (e.g., Hilux)"
                value={vehicleForm.model}
                onChangeText={(text) => setVehicleForm({ ...vehicleForm, model: text })}
                mode="outlined"
                style={styles.dialogInput}
              />
              <TextInput
                label="Year"
                value={vehicleForm.year}
                onChangeText={(text) => setVehicleForm({ ...vehicleForm, year: text })}
                mode="outlined"
                keyboardType="numeric"
                style={styles.dialogInput}
              />
              <TextInput
                label="VIN (Vehicle ID Number)"
                value={vehicleForm.vin}
                onChangeText={(text) => setVehicleForm({ ...vehicleForm, vin: text })}
                mode="outlined"
                style={styles.dialogInput}
              />
              <TextInput
                label="Notes"
                value={vehicleForm.notes}
                onChangeText={(text) => setVehicleForm({ ...vehicleForm, notes: text })}
                mode="outlined"
                multiline
                style={styles.dialogInput}
              />
            </View>
          </Dialog.ScrollArea>
          <Dialog.Actions>
            <Button onPress={() => setVehicleDialogVisible(false)}>Cancel</Button>
            <Button onPress={saveVehicle}>Save</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>

      {/* Failure Reason Dialog */}
      <Portal>
        <Dialog visible={reasonDialogVisible} onDismiss={() => setReasonDialogVisible(false)}>
          <Dialog.Title>{editingReason ? 'Edit Failure Reason' : 'Add Failure Reason'}</Dialog.Title>
          <Dialog.Content>
            <TextInput
              label="Reason *"
              value={reasonForm.reason_text}
              onChangeText={(text) => setReasonForm({ ...reasonForm, reason_text: text })}
              mode="outlined"
              style={styles.dialogInput}
            />
            <TextInput
              label="Category (e.g., Brakes, Tires)"
              value={reasonForm.category}
              onChangeText={(text) => setReasonForm({ ...reasonForm, category: text })}
              mode="outlined"
              style={styles.dialogInput}
            />
            <View style={styles.switchRow}>
              <Text>Active</Text>
              <Switch
                value={reasonForm.is_active}
                onValueChange={(value) => setReasonForm({ ...reasonForm, is_active: value })}
              />
            </View>
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={() => setReasonDialogVisible(false)}>Cancel</Button>
            <Button onPress={saveReason}>Save</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>

      {/* Company Dialog (Owner only) */}
      <Portal>
        <Dialog visible={companyDialogVisible} onDismiss={() => setCompanyDialogVisible(false)}>
          <Dialog.Title>{editingCompany ? 'Edit Company' : 'Add Company'}</Dialog.Title>
          <Dialog.Content>
            <TextInput
              label="Company Name *"
              value={companyForm.name}
              onChangeText={(text) => setCompanyForm({ ...companyForm, name: text })}
              mode="outlined"
              style={styles.dialogInput}
            />
            <TextInput
              label="Company Code *"
              value={companyForm.code}
              onChangeText={(text) => setCompanyForm({ ...companyForm, code: text.toUpperCase() })}
              mode="outlined"
              autoCapitalize="characters"
              placeholder="e.g., ACME"
              style={styles.dialogInput}
            />
            <TextInput
              label="Address"
              value={companyForm.address}
              onChangeText={(text) => setCompanyForm({ ...companyForm, address: text })}
              mode="outlined"
              style={styles.dialogInput}
            />
            <TextInput
              label="Contact Email"
              value={companyForm.contact_email}
              onChangeText={(text) => setCompanyForm({ ...companyForm, contact_email: text })}
              mode="outlined"
              keyboardType="email-address"
              style={styles.dialogInput}
            />
            <TextInput
              label="Contact Phone"
              value={companyForm.contact_phone}
              onChangeText={(text) => setCompanyForm({ ...companyForm, contact_phone: text })}
              mode="outlined"
              keyboardType="phone-pad"
              style={styles.dialogInput}
            />
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={() => setCompanyDialogVisible(false)}>Cancel</Button>
            <Button onPress={saveCompany}>Save</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  tabs: {
    margin: 12,
  },
  listContent: {
    padding: 8,
    paddingBottom: 80,
  },
  card: {
    marginHorizontal: 8,
    marginVertical: 4,
    backgroundColor: '#FFFFFF',
  },
  cardContent: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  cardInfo: {
    flex: 1,
    marginLeft: 12,
  },
  cardActions: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  subText: {
    color: '#666',
  },
  emptyContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingVertical: 64,
  },
  emptyText: {
    color: '#999',
    marginTop: 16,
  },
  fab: {
    position: 'absolute',
    margin: 16,
    right: 0,
    bottom: 0,
    backgroundColor: '#6200EE',
  },
  dialog: {
    maxHeight: '80%',
  },
  dialogScrollArea: {
    maxHeight: 400,
    paddingHorizontal: 0,
  },
  dialogContent: {
    paddingHorizontal: 24,
  },
  dialogInput: {
    marginBottom: 12,
  },
  inputLabel: {
    marginBottom: 4,
    color: '#666',
  },
  menuContent: {
    backgroundColor: '#FFFFFF',
    maxHeight: 300,
  },
  switchRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    marginTop: 8,
  },
});
