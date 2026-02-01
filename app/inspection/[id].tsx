import React, { useState, useEffect, useCallback } from 'react';
import { View, StyleSheet, ScrollView, Alert } from 'react-native';
import { Text, Button, ActivityIndicator, RadioButton, Menu } from 'react-native-paper';
import { useLocalSearchParams, useRouter, Stack } from 'expo-router';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { supabase, VehicleEquipment, RejectionReason, getEquipmentTypeConfig, REJECTION_REASONS } from '../../lib/supabase';
import { useAuth, useIsAdmin } from '../../lib/auth';
import { colors, statusColors } from '../../lib/theme';
import GlassCard from '../../components/GlassCard';

export default function VehicleDetailScreen() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const router = useRouter();
  const { user } = useAuth();
  const isAdmin = useIsAdmin();

  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [vehicle, setVehicle] = useState<VehicleEquipment | null>(null);
  const [rejectionReasons, setRejectionReasons] = useState<RejectionReason[]>([]);

  // Inspection form
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
    } catch (error) {
      console.error('Error:', error);
      Alert.alert('Error', 'Failed to load vehicle');
      router.back();
    } finally {
      setLoading(false);
    }
  }, [id, router]);

  useEffect(() => { fetchData(); }, [fetchData]);

  const submitInspection = async () => {
    if (!vehicle) return;
    if (inspectionResult === 'rejected' && !selectedReason) {
      Alert.alert('Error', 'Please select a rejection reason');
      return;
    }

    setSaving(true);
    try {
      const updateData: any = {
        actual_status: inspectionResult,
        last_inspection_date: new Date().toISOString(),
        reason_for_rejection: inspectionResult === 'rejected' ? selectedReason : null,
        modified_at: new Date().toISOString(),
      };

      if (inspectionResult === 'verified') {
        const nextDate = new Date();
        nextDate.setMonth(nextDate.getMonth() + 3);
        updateData.next_inspection_date = nextDate.toISOString().split('T')[0];
        updateData.expected_status = 'verified';
      } else {
        updateData.expected_status = 'updated_inspection_required';
      }

      const { error } = await supabase.from('vehicles_equipment').update(updateData).eq('id', vehicle.id);
      if (error) throw error;

      Alert.alert('Success', `Vehicle ${inspectionResult === 'verified' ? 'verified' : 'rejected'} successfully`);
      router.back();
    } catch (err: any) {
      Alert.alert('Error', err.message || 'Failed to submit inspection');
    } finally {
      setSaving(false);
    }
  };

  if (loading) {
    return (
      <View style={styles.loading}>
        <ActivityIndicator size="large" color={colors.primary} />
      </View>
    );
  }

  if (!vehicle) {
    return (
      <View style={styles.loading}>
        <Text style={{ color: colors.textMuted }}>Vehicle not found</Text>
      </View>
    );
  }

  const eq = getEquipmentTypeConfig(vehicle.equipment_type);
  const sc = statusColors[vehicle.actual_status] || statusColors.pending;
  const isOverdue = vehicle.next_inspection_date && new Date(vehicle.next_inspection_date) < new Date();

  return (
    <>
      <Stack.Screen
        options={{
          title: 'Vehicle Details',
          headerShown: true,
          headerStyle: { backgroundColor: colors.card },
          headerTintColor: colors.textPrimary,
        }}
      />
      <ScrollView style={styles.container} contentContainerStyle={styles.content}>
        {/* Vehicle Info Card */}
        <GlassCard style={styles.card} padding={20}>
          <View style={styles.headerRow}>
            <View style={[styles.iconLarge, { backgroundColor: `${colors.primary}15` }]}>
              <MaterialCommunityIcons name={eq.icon} size={40} color={colors.primary} />
            </View>
            <View style={styles.headerInfo}>
              <Text style={styles.plateNumber}>{vehicle.plate_number}</Text>
              <Text style={styles.equipmentType}>{eq.label} ({vehicle.equipment_category})</Text>
              <View style={[styles.statusBadge, { backgroundColor: sc.bg }]}>
                <MaterialCommunityIcons name={sc.icon} size={14} color={sc.text} />
                <Text style={[styles.statusText, { color: sc.text }]}>
                  {vehicle.actual_status.charAt(0).toUpperCase() + vehicle.actual_status.slice(1)}
                </Text>
              </View>
            </View>
          </View>

          <View style={styles.divider} />

          <View style={styles.infoGrid}>
            <View style={styles.infoItem}>
              <Text style={styles.infoLabel}>Driver</Text>
              <Text style={styles.infoValue}>{vehicle.driver_name || 'N/A'}</Text>
            </View>
            <View style={styles.infoItem}>
              <Text style={styles.infoLabel}>National ID</Text>
              <Text style={styles.infoValue}>{vehicle.national_id_number || 'N/A'}</Text>
            </View>
            <View style={styles.infoItem}>
              <Text style={styles.infoLabel}>Year</Text>
              <Text style={styles.infoValue}>{vehicle.year_of_manufacture || 'N/A'}</Text>
            </View>
            <View style={styles.infoItem}>
              <Text style={styles.infoLabel}>Company</Text>
              <Text style={styles.infoValue} numberOfLines={2}>{vehicle.client_company || 'N/A'}</Text>
            </View>
          </View>

          {vehicle.next_inspection_date && (
            <View style={[styles.dateRow, isOverdue && styles.overdueRow]}>
              <MaterialCommunityIcons name={isOverdue ? 'calendar-alert' : 'calendar-check'} size={18} color={isOverdue ? colors.error : colors.success} />
              <Text style={[styles.dateText, isOverdue && { color: colors.error }]}>
                Next Inspection: {new Date(vehicle.next_inspection_date).toLocaleDateString()}
                {isOverdue && ' (OVERDUE)'}
              </Text>
            </View>
          )}

          {vehicle.actual_status === 'rejected' && vehicle.reason_for_rejection && (
            <View style={styles.rejectBox}>
              <MaterialCommunityIcons name="alert-circle" size={18} color={colors.error} />
              <Text style={styles.rejectReason}>{vehicle.reason_for_rejection}</Text>
            </View>
          )}
        </GlassCard>

        {/* Inspection Form */}
        <GlassCard style={styles.card} padding={20}>
          <Text style={styles.sectionTitle}>Record Inspection</Text>

          <Text style={styles.label}>Result</Text>
          <RadioButton.Group onValueChange={(v) => setInspectionResult(v as 'verified' | 'rejected')} value={inspectionResult}>
            <View style={styles.radioOption}>
              <RadioButton.Item label="Verified (Pass)" value="verified" labelStyle={{ color: colors.success }} color={colors.success} />
            </View>
            <View style={styles.radioOption}>
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
                <ScrollView style={{ maxHeight: 300 }}>
                  {REJECTION_REASONS.map((r) => (
                    <Menu.Item key={r.value} onPress={() => { setSelectedReason(r.label); setReasonMenu(false); }} title={r.label} />
                  ))}
                  {rejectionReasons.map((r) => (
                    <Menu.Item key={r.id} onPress={() => { setSelectedReason(r.reason_text); setReasonMenu(false); }} title={r.reason_text} />
                  ))}
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

        <View style={{ height: 40 }} />
      </ScrollView>
    </>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background },
  content: { padding: 16 },
  loading: { flex: 1, justifyContent: 'center', alignItems: 'center', backgroundColor: colors.background },
  card: { marginBottom: 16 },
  headerRow: { flexDirection: 'row', alignItems: 'center' },
  iconLarge: { width: 70, height: 70, borderRadius: 35, justifyContent: 'center', alignItems: 'center' },
  headerInfo: { flex: 1, marginLeft: 16 },
  plateNumber: { color: colors.textPrimary, fontSize: 22, fontWeight: 'bold' },
  equipmentType: { color: colors.textSecondary, fontSize: 14, marginTop: 2 },
  statusBadge: { flexDirection: 'row', alignItems: 'center', paddingHorizontal: 10, paddingVertical: 4, borderRadius: 12, marginTop: 8, alignSelf: 'flex-start', gap: 4 },
  statusText: { fontSize: 12, fontWeight: '600' },
  divider: { height: 1, backgroundColor: colors.cardBorder, marginVertical: 16 },
  infoGrid: { flexDirection: 'row', flexWrap: 'wrap' },
  infoItem: { width: '50%', marginBottom: 12 },
  infoLabel: { color: colors.textMuted, fontSize: 12 },
  infoValue: { color: colors.textPrimary, fontSize: 14, fontWeight: '500', marginTop: 2 },
  dateRow: { flexDirection: 'row', alignItems: 'center', backgroundColor: `${colors.success}15`, padding: 12, borderRadius: 8, marginTop: 8, gap: 8 },
  overdueRow: { backgroundColor: `${colors.error}15` },
  dateText: { color: colors.success, fontSize: 13, fontWeight: '500' },
  rejectBox: { flexDirection: 'row', alignItems: 'flex-start', backgroundColor: `${colors.error}15`, padding: 12, borderRadius: 8, marginTop: 12, gap: 8 },
  rejectReason: { color: colors.error, fontSize: 13, flex: 1 },
  sectionTitle: { color: colors.textPrimary, fontSize: 18, fontWeight: '600', marginBottom: 16 },
  label: { color: colors.textPrimary, fontSize: 14, fontWeight: '500', marginTop: 12, marginBottom: 8 },
  radioOption: { backgroundColor: colors.surfaceLight, borderRadius: 8, marginBottom: 4 },
  menuButton: { borderColor: colors.cardBorder },
  submitButton: { marginTop: 20 },
});
