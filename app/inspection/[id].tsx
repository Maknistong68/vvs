import React, { useState, useEffect, useCallback } from 'react';
import { View, StyleSheet, ScrollView, StatusBar } from 'react-native';
import { Text, Button, ActivityIndicator, RadioButton, Menu } from 'react-native-paper';
import { useLocalSearchParams, useRouter, Stack } from 'expo-router';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { supabase, VehicleEquipment, RejectionReason, getEquipmentTypeConfig, getCategoryDisplay } from '../../lib/supabase';
import { useAuth, useIsContractor } from '../../lib/auth';
import { colors, statusColors, glass } from '../../lib/theme';
import { INSPECTION_PERIOD_MONTHS, MENU_MAX_HEIGHT, getErrorMessage } from '../../lib/constants';
import GlassCard from '../../components/GlassCard';
import GlassBackground from '../../components/GlassBackground';
import StatusBadge from '../../components/StatusBadge';
import { useToast } from '../../components/ToastProvider';

export default function VehicleDetailScreen() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const router = useRouter();
  const { user } = useAuth();
  const { isContractor } = useIsContractor();
  const toast = useToast();

  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [vehicle, setVehicle] = useState<VehicleEquipment | null>(null);
  const [rejectionReasons, setRejectionReasons] = useState<RejectionReason[]>([]);

  const [inspectionResult, setInspectionResult] = useState<'verified' | 'rejected'>('verified');
  const [selectedReason, setSelectedReason] = useState('');
  const [reasonMenu, setReasonMenu] = useState(false);

  const fetchData = useCallback(async () => {
    try {
      const [vehicleRes, reasonsRes] = await Promise.all([
        supabase.from('vehicles_equipment').select('*').eq('id', id).single(),
        supabase.from('rejection_reasons').select('*').eq('is_active', true).order('reason_text'),
      ]);

      if (vehicleRes.data) {
        setVehicle(vehicleRes.data);
        setInspectionResult(vehicleRes.data.actual_status === 'rejected' ? 'rejected' : 'verified');
        setSelectedReason(vehicleRes.data.reason_for_rejection || '');
      }
      if (reasonsRes.data) setRejectionReasons(reasonsRes.data);
    } catch {
      toast.showError('Failed to load vehicle');
      router.back();
    } finally {
      setLoading(false);
    }
  }, [id, router]);

  useEffect(() => { fetchData(); }, [fetchData]);

  const submitInspection = async () => {
    if (!vehicle) return;
    if (inspectionResult === 'rejected' && !selectedReason) {
      toast.showError('Please select a rejection reason');
      return;
    }

    setSaving(true);
    try {
      const now = new Date();
      const updateData: Partial<VehicleEquipment> = {
        actual_status: inspectionResult,
        last_inspection_date: now.toISOString(),
        reason_for_rejection: inspectionResult === 'rejected' ? selectedReason : null,
      };

      if (inspectionResult === 'verified') {
        const nextDate = new Date();
        nextDate.setMonth(nextDate.getMonth() + INSPECTION_PERIOD_MONTHS);
        updateData.next_inspection_date = nextDate.toISOString().split('T')[0];
        updateData.expected_status = 'verified';
      } else {
        updateData.expected_status = 'updated_inspection_required';
      }

      const { error } = await supabase.from('vehicles_equipment').update(updateData).eq('id', vehicle.id);
      if (error) throw error;

      toast.showSuccess(`Vehicle ${inspectionResult === 'verified' ? 'verified' : 'rejected'} successfully`);
      router.back();
    } catch (err) {
      toast.showError(getErrorMessage(err, 'Failed to submit inspection'));
    } finally {
      setSaving(false);
    }
  };

  if (loading) {
    return (
      <GlassBackground>
        <View style={styles.loading}>
          <ActivityIndicator size="large" color={colors.primary} />
        </View>
      </GlassBackground>
    );
  }

  if (!vehicle) {
    return (
      <GlassBackground>
        <View style={styles.loading}>
          <Text style={{ color: colors.textMuted }}>Vehicle not found</Text>
        </View>
      </GlassBackground>
    );
  }

  const eq = getEquipmentTypeConfig(vehicle.equipment_type);
  const sc = statusColors[vehicle.actual_status] || statusColors.pending;
  const isOverdue = vehicle.next_inspection_date && new Date(vehicle.next_inspection_date) < new Date();

  return (
    <GlassBackground>
      <StatusBar barStyle="light-content" backgroundColor="transparent" translucent />
      <Stack.Screen
        options={{
          title: 'Vehicle Details',
          headerShown: true,
          headerStyle: { backgroundColor: colors.background },
          headerTintColor: colors.textPrimary,
          headerTransparent: true,
        }}
      />
      <ScrollView style={styles.container} contentContainerStyle={styles.content}>
        {/* Vehicle Info Card */}
        <GlassCard elevated style={styles.card} padding={20}>
          <View style={styles.headerRow}>
            <View style={[styles.iconLarge, { backgroundColor: `${colors.primary}15` }]}>
              <MaterialCommunityIcons name={eq.icon} size={40} color={colors.primary} />
            </View>
            <View style={styles.headerInfo}>
              <Text style={styles.plateNumber}>{vehicle.plate_number}</Text>
              <Text style={styles.equipmentType}>{eq.label} - {getCategoryDisplay(vehicle.equipment_category)}</Text>
              <StatusBadge status={vehicle.actual_status} />
            </View>
          </View>

          <View style={styles.divider} />

          <View style={styles.infoGrid}>
            <View style={styles.infoItem}>
              <View style={styles.infoRow}>
                <MaterialCommunityIcons name="account" size={16} color={colors.primary} />
                <Text style={styles.infoLabel}>Driver</Text>
              </View>
              <Text style={styles.infoValue}>{vehicle.driver_name || 'N/A'}</Text>
            </View>
            <View style={styles.infoItem}>
              <View style={styles.infoRow}>
                <MaterialCommunityIcons name="card-account-details" size={16} color={colors.primary} />
                <Text style={styles.infoLabel}>National ID</Text>
              </View>
              <Text style={styles.infoValue}>{vehicle.national_id_number || 'N/A'}</Text>
            </View>
            <View style={styles.infoItem}>
              <View style={styles.infoRow}>
                <MaterialCommunityIcons name="calendar" size={16} color={colors.primary} />
                <Text style={styles.infoLabel}>Year</Text>
              </View>
              <Text style={styles.infoValue}>{vehicle.year_of_manufacture || 'N/A'}</Text>
            </View>
            <View style={styles.infoItem}>
              <View style={styles.infoRow}>
                <MaterialCommunityIcons name="domain" size={16} color={colors.primary} />
                <Text style={styles.infoLabel}>Company</Text>
              </View>
              <Text style={styles.infoValue} numberOfLines={2}>{vehicle.client_company || 'N/A'}</Text>
            </View>
          </View>

          {vehicle.last_inspection_date && (
            <View style={styles.inspectionInfo}>
              <MaterialCommunityIcons name="clipboard-check" size={16} color={colors.textMuted} />
              <Text style={styles.inspectionText}>
                Last inspected: {new Date(vehicle.last_inspection_date).toLocaleDateString()}
              </Text>
            </View>
          )}

          {vehicle.next_inspection_date && (
            <View style={[styles.dateRow, isOverdue && styles.overdueRow]}>
              <MaterialCommunityIcons
                name={isOverdue ? 'calendar-alert' : 'calendar-check'}
                size={18}
                color={isOverdue ? colors.error : colors.success}
              />
              <Text style={[styles.dateText, isOverdue && { color: colors.error }]}>
                Next Inspection: {new Date(vehicle.next_inspection_date).toLocaleDateString()}
                {isOverdue && ' (OVERDUE)'}
              </Text>
            </View>
          )}

          {vehicle.actual_status === 'rejected' && vehicle.reason_for_rejection && (
            <GlassCard variant="error" style={styles.rejectBox} padding={12}>
              <View style={styles.rejectRow}>
                <MaterialCommunityIcons name="alert-circle" size={18} color={colors.error} />
                <Text style={styles.rejectReason}>{vehicle.reason_for_rejection}</Text>
              </View>
            </GlassCard>
          )}
        </GlassCard>

        {/* Inspection Form - Only show for non-contractors */}
        {!isContractor && (
          <GlassCard style={styles.card} padding={20}>
            <Text style={styles.sectionTitle}>Record Inspection</Text>

            <Text style={styles.label}>Result</Text>
            <RadioButton.Group onValueChange={(v) => setInspectionResult(v as 'verified' | 'rejected')} value={inspectionResult}>
              <View style={styles.radioOption}>
                <RadioButton.Item
                  label="Verified (Pass)"
                  value="verified"
                  labelStyle={{ color: colors.success }}
                  color={colors.success}
                />
              </View>
              <View style={styles.radioOption}>
                <RadioButton.Item
                  label="Rejected (Fail)"
                  value="rejected"
                  labelStyle={{ color: colors.error }}
                  color={colors.error}
                />
              </View>
            </RadioButton.Group>

            {inspectionResult === 'rejected' && (
              <>
                <Text style={styles.label}>Rejection Reason *</Text>
                <Menu
                  visible={reasonMenu}
                  onDismiss={() => setReasonMenu(false)}
                  anchor={
                    <Button
                      mode="outlined"
                      onPress={() => setReasonMenu(true)}
                      style={styles.menuButton}
                      textColor={colors.textPrimary}
                    >
                      {selectedReason || 'Select reason...'}
                    </Button>
                  }
                >
                  <ScrollView style={{ maxHeight: 300 }}>
                    {rejectionReasons.length > 0 ? (
                      rejectionReasons.map((r) => (
                        <Menu.Item
                          key={r.id}
                          onPress={() => { setSelectedReason(r.reason_text); setReasonMenu(false); }}
                          title={r.reason_text}
                        />
                      ))
                    ) : (
                      <Menu.Item title="No rejection reasons available" disabled />
                    )}
                  </ScrollView>
                </Menu>
              </>
            )}

            <Button
              mode="contained"
              onPress={submitInspection}
              loading={saving}
              disabled={saving}
              style={styles.submitButton}
              buttonColor={inspectionResult === 'verified' ? colors.success : colors.error}
            >
              {inspectionResult === 'verified' ? 'Verify Vehicle' : 'Reject Vehicle'}
            </Button>
          </GlassCard>
        )}

        {/* Contractor view-only message */}
        {isContractor && (
          <GlassCard variant="accent" style={styles.card} padding={16}>
            <View style={styles.contractorNote}>
              <MaterialCommunityIcons name="information" size={20} color={colors.accent} />
              <Text style={styles.contractorText}>
                You are viewing as a contractor. Inspection actions are not available.
              </Text>
            </View>
          </GlassCard>
        )}

        <View style={{ height: 40 }} />
      </ScrollView>
    </GlassBackground>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1 },
  content: { padding: 16, paddingTop: 100 },
  loading: { flex: 1, justifyContent: 'center', alignItems: 'center' },
  card: { marginBottom: 16 },
  headerRow: { flexDirection: 'row', alignItems: 'center' },
  iconLarge: {
    width: 70,
    height: 70,
    borderRadius: 35,
    justifyContent: 'center',
    alignItems: 'center'
  },
  headerInfo: { flex: 1, marginLeft: 16 },
  plateNumber: { color: colors.textPrimary, fontSize: 24, fontWeight: 'bold' },
  equipmentType: { color: colors.textSecondary, fontSize: 14, marginTop: 2 },
  divider: { height: 1, backgroundColor: glass.border.color, marginVertical: 16 },
  infoGrid: { flexDirection: 'row', flexWrap: 'wrap' },
  infoItem: { width: '50%', marginBottom: 16 },
  infoRow: { flexDirection: 'row', alignItems: 'center', gap: 6, marginBottom: 4 },
  infoLabel: { color: colors.textMuted, fontSize: 12 },
  infoValue: { color: colors.textPrimary, fontSize: 15, fontWeight: '500' },
  inspectionInfo: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    marginTop: 8,
    paddingTop: 12,
    borderTopWidth: 1,
    borderTopColor: glass.border.color,
  },
  inspectionText: { color: colors.textMuted, fontSize: 13 },
  dateRow: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: `${colors.success}15`,
    padding: 12,
    borderRadius: glass.border.radius.sm,
    marginTop: 12,
    gap: 8
  },
  overdueRow: { backgroundColor: `${colors.error}15` },
  dateText: { color: colors.success, fontSize: 13, fontWeight: '500' },
  rejectBox: { marginTop: 12 },
  rejectRow: { flexDirection: 'row', alignItems: 'flex-start', gap: 8 },
  rejectReason: { color: colors.error, fontSize: 13, flex: 1 },
  sectionTitle: { color: colors.textPrimary, fontSize: 18, fontWeight: '600', marginBottom: 16 },
  label: { color: colors.textPrimary, fontSize: 14, fontWeight: '500', marginTop: 12, marginBottom: 8 },
  radioOption: {
    backgroundColor: glass.background.card,
    borderRadius: 8,
    marginBottom: 4,
    borderWidth: 1,
    borderColor: glass.border.color,
  },
  menuButton: { borderColor: colors.inputBorder },
  submitButton: { marginTop: 20, borderRadius: glass.border.radius.md },
  contractorNote: { flexDirection: 'row', alignItems: 'center', gap: 12 },
  contractorText: { color: colors.accent, fontSize: 14, flex: 1 },
});
