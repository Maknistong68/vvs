import React, { useState, useEffect, useCallback, useRef, useMemo } from 'react';
import { View, StyleSheet, FlatList, RefreshControl, StatusBar, ScrollView, TouchableOpacity } from 'react-native';
import { Text, Searchbar, ActivityIndicator, SegmentedButtons, Dialog, Portal, Button, TextInput, Menu, RadioButton, FAB } from 'react-native-paper';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { supabase, VehicleEquipment, RejectionReason, VehicleStatus, EquipmentType, EQUIPMENT_TYPES, getEquipmentTypeConfig, getCategoryDisplay } from '../../lib/supabase';
import { useAuth, useCanAddVehicles } from '../../lib/auth';
import { colors, statusColors, glass } from '../../lib/theme';
import { INSPECTION_PERIOD_MONTHS, MENU_MAX_HEIGHT, getErrorMessage } from '../../lib/constants';
import { useVehicles, useRejectionReasons, VehicleSortField } from '../../lib/hooks';
import GlassCard from '../../components/GlassCard';
import GlassBackground from '../../components/GlassBackground';
import StatusBadge from '../../components/StatusBadge';
import EmptyState from '../../components/EmptyState';
import ErrorDisplay from '../../components/ErrorDisplay';
import { VehicleListSkeleton } from '../../components/SkeletonLoader';
import { useToast } from '../../components/ToastProvider';

export default function InspectionsScreen() {
  const { user, company } = useAuth();
  const { canAddVehicles } = useCanAddVehicles();
  const insets = useSafeAreaInsets();
  const toast = useToast();

  // Search with debounce
  const [searchQuery, setSearchQuery] = useState('');
  const [debouncedSearch, setDebouncedSearch] = useState('');
  const [statusFilter, setStatusFilter] = useState<string>('all');
  const [sortBy, setSortBy] = useState<'plate_number' | 'last_inspection_date' | 'actual_status'>('plate_number');
  const [sortMenu, setSortMenu] = useState(false);
  const debounceRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  useEffect(() => {
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => {
      setDebouncedSearch(searchQuery.trim().toLowerCase());
    }, 300);
    return () => { if (debounceRef.current) clearTimeout(debounceRef.current); };
  }, [searchQuery]);

  // W5: Use useVehicles hook with server-side filtering instead of unbounded fetch
  const {
    data: vehiclesData,
    isLoading: loading,
    error: vehiclesError,
    refetch: refetchVehicles,
  } = useVehicles({
    status: statusFilter !== 'all' ? statusFilter as VehicleStatus : undefined,
    search: debouncedSearch || undefined,
    pageSize: 50,
    sortBy,
  });

  const filteredVehicles = vehiclesData?.vehicles || [];

  // W5: Use hook for rejection reasons instead of manual fetch
  const { data: rejectionReasons = [] } = useRejectionReasons(company?.id);

  const [refreshing, setRefreshing] = useState(false);

  // Inspection dialog
  const [inspectDialog, setInspectDialog] = useState(false);
  const [selectedVehicle, setSelectedVehicle] = useState<VehicleEquipment | null>(null);
  const [inspectionResult, setInspectionResult] = useState<'verified' | 'rejected'>('verified');
  const [selectedReason, setSelectedReason] = useState('');
  const [inspectionNotes, setInspectionNotes] = useState('');
  const [reasonMenu, setReasonMenu] = useState(false);
  const [submitting, setSubmitting] = useState(false);

  // Add vehicle dialog
  const [addVehicleDialog, setAddVehicleDialog] = useState(false);
  const [vehicleForm, setVehicleForm] = useState({
    plate_number: '',
    equipment_type: 'light_vehicle' as EquipmentType,
    driver_name: '',
  });
  const [equipmentTypeMenu, setEquipmentTypeMenu] = useState(false);
  const [savingVehicle, setSavingVehicle] = useState(false);

  const onRefresh = useCallback(async () => {
    setRefreshing(true);
    await refetchVehicles();
    setRefreshing(false);
  }, [refetchVehicles]);

  const openInspection = (vehicle: VehicleEquipment) => {
    setSelectedVehicle(vehicle);
    setInspectionResult('verified');
    setSelectedReason('');
    setInspectionNotes('');
    setInspectDialog(true);
  };

  const submitInspection = async () => {
    if (!selectedVehicle) return;
    if (inspectionResult === 'rejected' && !selectedReason) {
      toast.showError('Please select a rejection reason');
      return;
    }

    setSubmitting(true);
    try {
      const now = new Date();
      const rejectionText = inspectionResult === 'rejected'
        ? (inspectionNotes ? `${selectedReason} - Notes: ${inspectionNotes}` : selectedReason)
        : null;
      const updateData: Partial<VehicleEquipment> & { modified_at?: string } = {
        actual_status: inspectionResult,
        last_inspection_date: now.toISOString(),
        reason_for_rejection: rejectionText,
      };

      if (inspectionResult === 'verified') {
        const nextDate = new Date();
        nextDate.setMonth(nextDate.getMonth() + INSPECTION_PERIOD_MONTHS);
        updateData.next_inspection_date = nextDate.toISOString().split('T')[0];
        updateData.expected_status = 'verified';
      } else {
        updateData.expected_status = 'updated_inspection_required';
      }

      const { error } = await supabase
        .from('vehicles_equipment')
        .update(updateData)
        .eq('id', selectedVehicle.id);

      if (error) throw error;

      toast.showSuccess(`Vehicle ${inspectionResult === 'verified' ? 'verified' : 'rejected'} successfully`);
      setInspectDialog(false);
      refetchVehicles();
    } catch (err) {
      toast.showError(getErrorMessage(err, 'Failed to submit inspection'));
    } finally {
      setSubmitting(false);
    }
  };

  const openAddVehicle = () => {
    setVehicleForm({
      plate_number: '',
      equipment_type: 'light_vehicle',
      driver_name: '',
    });
    setAddVehicleDialog(true);
  };

  const saveVehicle = async (openInspectionAfter: boolean = false) => {
    if (!vehicleForm.plate_number.trim()) {
      toast.showError('Plate number is required');
      return;
    }
    if (!company?.id || !user?.id) {
      toast.showError('Session expired. Please log in again.');
      return;
    }

    setSavingVehicle(true);
    try {
      // Get the equipment category from the selected type
      const typeConfig = EQUIPMENT_TYPES.find(t => t.value === vehicleForm.equipment_type);
      const equipmentCategory = typeConfig?.category || 'B';

      const { data: newVehicle, error } = await supabase
        .from('vehicles_equipment')
        .insert({
          plate_number: vehicleForm.plate_number.toUpperCase().trim(),
          equipment_type: vehicleForm.equipment_type,
          equipment_category: equipmentCategory,
          driver_name: vehicleForm.driver_name.trim() || null,
          company_id: company.id,
          created_by: user.id,
          actual_status: 'pending',
          expected_status: 'verified',
        })
        .select()
        .single();

      if (error) throw error;

      toast.showSuccess('Vehicle added successfully');
      setAddVehicleDialog(false);
      refetchVehicles();

      // Optionally open inspection dialog for the new vehicle
      if (openInspectionAfter && newVehicle) {
        setTimeout(() => openInspection(newVehicle), 300);
      }
    } catch (err) {
      toast.showError(getErrorMessage(err, 'Failed to add vehicle'));
    } finally {
      setSavingVehicle(false);
    }
  };

  const renderItem = ({ item }: { item: VehicleEquipment }) => {
    const sc = statusColors[item.actual_status] || statusColors.pending;
    const eq = getEquipmentTypeConfig(item.equipment_type);
    const isOverdue = item.next_inspection_date && new Date(item.next_inspection_date) < new Date();
    const lastInspected = item.last_inspection_date
      ? new Date(item.last_inspection_date).toLocaleDateString()
      : null;

    return (
      <GlassCard style={styles.card} padding={14} onPress={() => openInspection(item)}>
        <View style={styles.row}>
          <View style={[styles.icon, { backgroundColor: `${colors.primary}15` }]}>
            <MaterialCommunityIcons name={eq.icon} size={24} color={colors.primary} />
          </View>
          <View style={styles.info}>
            <Text style={styles.plate}>{item.plate_number}</Text>
            <Text style={styles.type}>{eq.label} - {getCategoryDisplay(item.equipment_category)}</Text>
            {item.driver_name && (
              <View style={styles.driverRow}>
                <MaterialCommunityIcons name="account" size={12} color={colors.textMuted} />
                <Text style={styles.driver}>{item.driver_name}</Text>
              </View>
            )}
            {lastInspected && (
              <View style={styles.driverRow}>
                <MaterialCommunityIcons name="calendar-check" size={12} color={colors.textMuted} />
                <Text style={styles.driver}>Last: {lastInspected}</Text>
              </View>
            )}
          </View>
          <View>
            <StatusBadge status={item.actual_status} />
            {isOverdue && (
              <StatusBadge status="inspection_overdue" label="Overdue" style={{ marginTop: 4 }} />
            )}
          </View>
        </View>
        {item.actual_status === 'rejected' && item.reason_for_rejection && (
          <View style={styles.rejectRow}>
            <MaterialCommunityIcons name="alert-circle" size={12} color={colors.error} />
            <Text style={styles.rejectText} numberOfLines={1}>{item.reason_for_rejection}</Text>
          </View>
        )}
      </GlassCard>
    );
  };

  if (loading) {
    return (
      <GlassBackground>
        <View style={{ paddingTop: insets.top + 16 }}>
          <VehicleListSkeleton count={6} />
        </View>
      </GlassBackground>
    );
  }

  return (
    <GlassBackground>
      <StatusBar barStyle="light-content" backgroundColor="transparent" translucent />
      <View style={[styles.header, { paddingTop: insets.top + 16 }]}>
        <Text style={styles.title}>Inspections</Text>
        <Text style={styles.subtitle}>{filteredVehicles.length} vehicles</Text>
      </View>

      {/* W5: Show error display instead of silently swallowing errors */}
      {vehiclesError && (
        <ErrorDisplay
          error={vehiclesError}
          onRetry={() => refetchVehicles()}
          compact
        />
      )}

      <View style={styles.searchContainer}>
        <Searchbar
          placeholder="Search plate, driver, company..."
          onChangeText={setSearchQuery}
          value={searchQuery}
          style={styles.search}
          iconColor={colors.textMuted}
          inputStyle={{ color: colors.textPrimary }}
          placeholderTextColor={colors.textMuted}
        />
      </View>

      <View style={styles.filterContainer}>
        <SegmentedButtons
          value={statusFilter}
          onValueChange={setStatusFilter}
          buttons={[
            { value: 'all', label: 'All' },
            { value: 'pending', label: 'Pending' },
            { value: 'verified', label: 'Verified' },
            { value: 'rejected', label: 'Rejected' },
          ]}
          style={styles.filters}
        />
      </View>

      {/* W26: Sort selector */}
      <View style={styles.sortRow}>
        <Menu
          visible={sortMenu}
          onDismiss={() => setSortMenu(false)}
          anchor={
            <TouchableOpacity onPress={() => setSortMenu(true)} style={styles.sortButton}>
              <MaterialCommunityIcons name="sort" size={16} color={colors.textMuted} />
              <Text style={styles.sortText}>
                {sortBy === 'plate_number' ? 'Plate' : sortBy === 'last_inspection_date' ? 'Last Inspected' : 'Status'}
              </Text>
              <MaterialCommunityIcons name="chevron-down" size={14} color={colors.textMuted} />
            </TouchableOpacity>
          }
        >
          <Menu.Item
            onPress={() => { setSortBy('plate_number'); setSortMenu(false); }}
            title="Plate Number"
            leadingIcon="sort-alphabetical-ascending"
          />
          <Menu.Item
            onPress={() => { setSortBy('last_inspection_date'); setSortMenu(false); }}
            title="Last Inspected"
            leadingIcon="calendar-clock"
          />
          <Menu.Item
            onPress={() => { setSortBy('actual_status'); setSortMenu(false); }}
            title="Status"
            leadingIcon="tag"
          />
        </Menu>
      </View>

      <FlatList
        data={filteredVehicles}
        keyExtractor={(item) => item.id}
        renderItem={renderItem}
        contentContainerStyle={styles.list}
        refreshControl={<RefreshControl refreshing={refreshing} onRefresh={onRefresh} tintColor={colors.primary} />}
        initialNumToRender={15}
        maxToRenderPerBatch={10}
        windowSize={5}
        removeClippedSubviews={true}
        ListEmptyComponent={
          <EmptyState
            icon="clipboard-search-outline"
            title="No vehicles found"
            subtitle={debouncedSearch ? 'Try a different search term' : 'Vehicles will appear here for inspection'}
          />
        }
      />

      {/* Inspection Dialog */}
      <Portal>
        <Dialog visible={inspectDialog} onDismiss={() => setInspectDialog(false)} style={styles.dialog}>
          <Dialog.Title style={styles.dialogTitle}>Record Inspection</Dialog.Title>
          <Dialog.ScrollArea style={{ maxHeight: 400 }}>
            <View style={{ padding: 16 }}>
              {selectedVehicle && (
                <GlassCard style={{ marginBottom: 16 }} padding={12}>
                  <Text style={styles.vehicleTitle}>{selectedVehicle.plate_number}</Text>
                  <Text style={styles.vehicleSub}>{getEquipmentTypeConfig(selectedVehicle.equipment_type).label}</Text>
                  {selectedVehicle.driver_name && (
                    <View style={styles.detailRow}>
                      <MaterialCommunityIcons name="account" size={14} color={colors.textMuted} />
                      <Text style={styles.vehicleSub}>Driver: {selectedVehicle.driver_name}</Text>
                    </View>
                  )}
                  {selectedVehicle.client_company && (
                    <View style={styles.detailRow}>
                      <MaterialCommunityIcons name="domain" size={14} color={colors.textMuted} />
                      <Text style={styles.vehicleSub}>Company: {selectedVehicle.client_company}</Text>
                    </View>
                  )}
                </GlassCard>
              )}

              <Text style={styles.label}>Inspection Result</Text>
              <RadioButton.Group onValueChange={(v) => setInspectionResult(v as 'verified' | 'rejected')} value={inspectionResult}>
                <View style={styles.radioRow}>
                  <RadioButton.Item label="Verified (Pass)" value="verified" labelStyle={{ color: colors.success }} color={colors.success} />
                </View>
                <View style={styles.radioRow}>
                  <RadioButton.Item label="Rejected (Fail)" value="rejected" labelStyle={{ color: colors.error }} color={colors.error} />
                </View>
              </RadioButton.Group>

              {inspectionResult === 'rejected' && (
                <>
                  <Text style={styles.label}>Rejection Reason *</Text>
                  <Menu
                    visible={reasonMenu}
                    onDismiss={() => setReasonMenu(false)}
                    anchor={
                      <Button mode="outlined" onPress={() => setReasonMenu(true)} style={styles.menuButton} textColor={colors.textPrimary}>
                        {selectedReason || 'Select reason...'}
                      </Button>
                    }
                  >
                    <ScrollView style={{ maxHeight: 250 }}>
                      {rejectionReasons.length > 0 ? (
                        rejectionReasons.map((r) => (
                          <Menu.Item key={r.id} onPress={() => { setSelectedReason(r.reason_text); setReasonMenu(false); }} title={r.reason_text} />
                        ))
                      ) : (
                        <Menu.Item title="No rejection reasons available" disabled />
                      )}
                    </ScrollView>
                  </Menu>
                </>
              )}

              <Text style={styles.label}>Notes (Optional)</Text>
              <TextInput
                value={inspectionNotes}
                onChangeText={setInspectionNotes}
                mode="outlined"
                multiline
                numberOfLines={3}
                style={styles.input}
                outlineColor={colors.inputBorder}
                activeOutlineColor={colors.primary}
                textColor={colors.textPrimary}
              />
            </View>
          </Dialog.ScrollArea>
          <Dialog.Actions>
            <Button onPress={() => setInspectDialog(false)} textColor={colors.textMuted}>Cancel</Button>
            <Button onPress={submitInspection} loading={submitting} disabled={submitting} textColor={inspectionResult === 'verified' ? colors.success : colors.error}>
              {inspectionResult === 'verified' ? 'Verify' : 'Reject'}
            </Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>

      {/* Add Vehicle Dialog */}
      <Portal>
        <Dialog visible={addVehicleDialog} onDismiss={() => setAddVehicleDialog(false)} style={styles.dialog}>
          <Dialog.Title style={styles.dialogTitle}>Add Vehicle</Dialog.Title>
          <Dialog.ScrollArea style={{ maxHeight: 400 }}>
            <View style={{ padding: 16 }}>
              <Text style={styles.label}>Plate Number *</Text>
              <TextInput
                value={vehicleForm.plate_number}
                onChangeText={(t) => setVehicleForm({ ...vehicleForm, plate_number: t.toUpperCase() })}
                mode="outlined"
                placeholder="Enter plate number"
                style={styles.input}
                outlineColor={colors.inputBorder}
                activeOutlineColor={colors.primary}
                textColor={colors.textPrimary}
              />

              <Text style={styles.label}>Equipment Type *</Text>
              <Menu
                visible={equipmentTypeMenu}
                onDismiss={() => setEquipmentTypeMenu(false)}
                anchor={
                  <Button mode="outlined" onPress={() => setEquipmentTypeMenu(true)} style={styles.menuButton} textColor={colors.textPrimary}>
                    {getEquipmentTypeConfig(vehicleForm.equipment_type).label}
                  </Button>
                }
              >
                <ScrollView style={{ maxHeight: 300 }}>
                  {EQUIPMENT_TYPES.map((t) => (
                    <Menu.Item
                      key={t.value}
                      onPress={() => { setVehicleForm({ ...vehicleForm, equipment_type: t.value }); setEquipmentTypeMenu(false); }}
                      title={`${t.label} - ${getCategoryDisplay(t.category)}`}
                    />
                  ))}
                </ScrollView>
              </Menu>

              <Text style={styles.label}>Driver Name (Optional)</Text>
              <TextInput
                value={vehicleForm.driver_name}
                onChangeText={(t) => setVehicleForm({ ...vehicleForm, driver_name: t })}
                mode="outlined"
                placeholder="Enter driver name"
                style={styles.input}
                outlineColor={colors.inputBorder}
                activeOutlineColor={colors.primary}
                textColor={colors.textPrimary}
              />
            </View>
          </Dialog.ScrollArea>
          <Dialog.Actions>
            <Button onPress={() => setAddVehicleDialog(false)} textColor={colors.textMuted} disabled={savingVehicle}>Cancel</Button>
            <Button onPress={() => saveVehicle(false)} loading={savingVehicle} disabled={savingVehicle} textColor={colors.primary}>Save</Button>
            <Button onPress={() => saveVehicle(true)} loading={savingVehicle} disabled={savingVehicle} textColor={colors.success}>Save & Inspect</Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>

      {/* FAB for adding vehicles - only visible to inspectors/admins/owners */}
      {canAddVehicles && (
        <FAB
          icon="plus"
          style={styles.fab}
          color={colors.white}
          onPress={openAddVehicle}
          label="Add Vehicle"
        />
      )}
    </GlassBackground>
  );
}

const styles = StyleSheet.create({
  loading: { flex: 1, justifyContent: 'center', alignItems: 'center' },
  header: { paddingHorizontal: 16, paddingBottom: 8 },
  title: { color: colors.textPrimary, fontSize: 26, fontWeight: 'bold' },
  subtitle: { color: colors.textMuted, fontSize: 13 },
  searchContainer: { paddingHorizontal: 16, marginBottom: 10 },
  search: {
    backgroundColor: glass.background.card,
    borderRadius: glass.border.radius.md,
    borderWidth: 1,
    borderColor: glass.border.color,
  },
  filterContainer: { paddingHorizontal: 16, marginBottom: 10 },
  filters: {},
  sortRow: { flexDirection: 'row', justifyContent: 'flex-end', paddingHorizontal: 16, marginBottom: 8 },
  sortButton: { flexDirection: 'row', alignItems: 'center', gap: 4, paddingHorizontal: 10, paddingVertical: 6, backgroundColor: glass.background.card, borderRadius: 8, borderWidth: 1, borderColor: glass.border.color },
  sortText: { color: colors.textMuted, fontSize: 12, fontWeight: '500' },
  list: { padding: 8, paddingBottom: 100 },
  card: { marginHorizontal: 8, marginVertical: 4 },
  row: { flexDirection: 'row', alignItems: 'center' },
  icon: { width: 44, height: 44, borderRadius: 22, justifyContent: 'center', alignItems: 'center', marginRight: 12 },
  info: { flex: 1 },
  plate: { color: colors.textPrimary, fontWeight: '700', fontSize: 15 },
  type: { color: colors.textSecondary, fontSize: 12 },
  driverRow: { flexDirection: 'row', alignItems: 'center', gap: 4, marginTop: 2 },
  driver: { color: colors.textMuted, fontSize: 11 },
  badge: { flexDirection: 'row', alignItems: 'center', paddingHorizontal: 8, paddingVertical: 4, borderRadius: 8, gap: 4 },
  badgeText: { fontSize: 10, fontWeight: '600' },
  rejectRow: { flexDirection: 'row', alignItems: 'center', marginTop: 10, paddingTop: 10, borderTopWidth: 1, borderTopColor: glass.border.color, gap: 6 },
  rejectText: { color: colors.error, fontSize: 12, flex: 1 },
  empty: { alignItems: 'center', margin: 16 },
  emptyText: { color: colors.textMuted, marginTop: 12 },
  dialog: { backgroundColor: colors.cardSolid, borderRadius: glass.border.radius.lg },
  dialogTitle: { color: colors.textPrimary },
  vehicleTitle: { color: colors.textPrimary, fontSize: 18, fontWeight: 'bold' },
  vehicleSub: { color: colors.textSecondary, fontSize: 13 },
  detailRow: { flexDirection: 'row', alignItems: 'center', gap: 6, marginTop: 4 },
  label: { color: colors.textPrimary, fontSize: 14, fontWeight: '600', marginTop: 12, marginBottom: 8 },
  radioRow: { backgroundColor: colors.surfaceLight, borderRadius: 8, marginBottom: 4 },
  menuButton: { marginBottom: 8, borderColor: colors.inputBorder },
  input: { backgroundColor: colors.inputBackground },
  fab: { position: 'absolute', right: 16, bottom: 80, backgroundColor: colors.primary },
});
