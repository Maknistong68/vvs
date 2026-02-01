import React, { useState, useEffect, useCallback } from 'react';
import { View, StyleSheet, FlatList, RefreshControl, StatusBar, Alert, ScrollView } from 'react-native';
import { Text, FAB, Searchbar, SegmentedButtons, Dialog, Portal, Button, ActivityIndicator, Menu } from 'react-native-paper';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { supabase, VehicleEquipment, Certificate, getEquipmentTypeConfig } from '../../lib/supabase';
import { useAuth, useIsAdmin } from '../../lib/auth';
import { colors, statusColors } from '../../lib/theme';
import GlassCard from '../../components/GlassCard';

export default function CertificatesScreen() {
  const { user, company } = useAuth();
  const isAdmin = useIsAdmin();
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);
  const [certificates, setCertificates] = useState<Certificate[]>([]);
  const [filtered, setFiltered] = useState<Certificate[]>([]);
  const [search, setSearch] = useState('');
  const [filter, setFilter] = useState<string>('all');

  // Issue certificate dialog
  const [issueDialog, setIssueDialog] = useState(false);
  const [verifiedVehicles, setVerifiedVehicles] = useState<VehicleEquipment[]>([]);
  const [selectedVehicle, setSelectedVehicle] = useState<VehicleEquipment | null>(null);
  const [vehicleMenu, setVehicleMenu] = useState(false);
  const [issuing, setIssuing] = useState(false);

  const fetchData = useCallback(async () => {
    try {
      const [certsRes, vehiclesRes] = await Promise.all([
        supabase.from('certificates').select('*').order('issue_date', { ascending: false }),
        supabase.from('vehicles_equipment').select('*').eq('actual_status', 'verified').order('plate_number'),
      ]);
      if (certsRes.data) {
        setCertificates(certsRes.data);
        setFiltered(certsRes.data);
      }
      if (vehiclesRes.data) setVerifiedVehicles(vehiclesRes.data);
    } catch (e) {
      console.error(e);
    } finally {
      setLoading(false);
      setRefreshing(false);
    }
  }, []);

  useEffect(() => { fetchData(); }, [fetchData]);

  useEffect(() => {
    let f = certificates;
    if (filter !== 'all') f = f.filter((c) => c.status === filter);
    if (search) {
      const q = search.toLowerCase();
      f = f.filter((c) => c.certificate_number?.toLowerCase().includes(q) || c.issued_to?.toLowerCase().includes(q));
    }
    setFiltered(f);
  }, [certificates, filter, search]);

  const generateCertNumber = () => {
    const date = new Date();
    const dateStr = `${date.getFullYear()}${String(date.getMonth() + 1).padStart(2, '0')}${String(date.getDate()).padStart(2, '0')}`;
    const random = Math.floor(Math.random() * 10000).toString().padStart(4, '0');
    return `CERT-${dateStr}-${random}`;
  };

  const openIssueDialog = () => {
    setSelectedVehicle(null);
    setIssueDialog(true);
  };

  const issueCertificate = async () => {
    if (!selectedVehicle) {
      Alert.alert('Error', 'Please select a vehicle');
      return;
    }

    setIssuing(true);
    try {
      const issueDate = new Date();
      const expiryDate = new Date();
      expiryDate.setFullYear(expiryDate.getFullYear() + 1); // Valid for 1 year

      const certData = {
        company_id: company!.id,
        certificate_number: generateCertNumber(),
        issued_to: `${selectedVehicle.plate_number} - ${selectedVehicle.driver_name || 'N/A'}`,
        issued_by: user!.id,
        issue_date: issueDate.toISOString().split('T')[0],
        expiry_date: expiryDate.toISOString().split('T')[0],
        status: 'valid',
        notes: `Certificate for ${getEquipmentTypeConfig(selectedVehicle.equipment_type).label}`,
      };

      const { error } = await supabase.from('certificates').insert(certData);
      if (error) throw error;

      Alert.alert('Success', `Certificate issued for ${selectedVehicle.plate_number}`);
      setIssueDialog(false);
      fetchData();
    } catch (err: any) {
      Alert.alert('Error', err.message || 'Failed to issue certificate');
    } finally {
      setIssuing(false);
    }
  };

  const revokeCertificate = (cert: Certificate) => {
    Alert.alert('Revoke Certificate?', `This will revoke certificate ${cert.certificate_number}`, [
      { text: 'Cancel' },
      {
        text: 'Revoke',
        style: 'destructive',
        onPress: async () => {
          await supabase.from('certificates').update({ status: 'revoked' }).eq('id', cert.id);
          fetchData();
        },
      },
    ]);
  };

  const renderItem = ({ item }: { item: Certificate }) => {
    const sc = statusColors[item.status] || statusColors.pending;
    const expired = new Date(item.expiry_date) < new Date();
    const actualStatus = expired && item.status === 'valid' ? 'expired' : item.status;
    const actualSc = statusColors[actualStatus] || sc;

    return (
      <GlassCard style={styles.card} padding={14} onPress={() => isAdmin && item.status === 'valid' ? revokeCertificate(item) : null}>
        <View style={styles.row}>
          <View style={[styles.icon, { backgroundColor: `${actualSc.text}15` }]}>
            <MaterialCommunityIcons name="certificate" size={24} color={actualSc.text} />
          </View>
          <View style={styles.info}>
            <Text style={styles.number}>{item.certificate_number}</Text>
            <Text style={styles.issued}>{item.issued_to}</Text>
          </View>
          <View style={[styles.badge, { backgroundColor: actualSc.bg }]}>
            <MaterialCommunityIcons name={actualSc.icon} size={12} color={actualSc.text} />
            <Text style={[styles.badgeText, { color: actualSc.text }]}>
              {actualStatus.charAt(0).toUpperCase() + actualStatus.slice(1)}
            </Text>
          </View>
        </View>
        <View style={styles.dates}>
          <View style={styles.dateItem}>
            <MaterialCommunityIcons name="calendar-check" size={14} color={colors.success} />
            <Text style={styles.dateText}>Issued: {new Date(item.issue_date).toLocaleDateString()}</Text>
          </View>
          <View style={styles.dateItem}>
            <MaterialCommunityIcons name="calendar-remove" size={14} color={expired ? colors.error : colors.textMuted} />
            <Text style={[styles.dateText, expired && { color: colors.error }]}>
              Expires: {new Date(item.expiry_date).toLocaleDateString()}
            </Text>
          </View>
        </View>
      </GlassCard>
    );
  };

  if (loading) return <View style={styles.loading}><ActivityIndicator size="large" color={colors.primary} /></View>;

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor={colors.background} />
      <View style={styles.header}>
        <Text style={styles.title}>Certificates</Text>
        <Text style={styles.subtitle}>{certificates.length} total, {certificates.filter(c => c.status === 'valid').length} valid</Text>
      </View>

      <Searchbar
        placeholder="Search certificate or vehicle..."
        onChangeText={setSearch}
        value={search}
        style={styles.search}
        iconColor={colors.textMuted}
        inputStyle={{ color: colors.textPrimary }}
        placeholderTextColor={colors.textMuted}
      />

      <SegmentedButtons
        value={filter}
        onValueChange={setFilter}
        buttons={[
          { value: 'all', label: 'All' },
          { value: 'valid', label: 'Valid' },
          { value: 'expired', label: 'Expired' },
          { value: 'revoked', label: 'Revoked' },
        ]}
        style={styles.filters}
      />

      <FlatList
        data={filtered}
        keyExtractor={(item) => item.id}
        renderItem={renderItem}
        contentContainerStyle={styles.list}
        refreshControl={<RefreshControl refreshing={refreshing} onRefresh={() => { setRefreshing(true); fetchData(); }} tintColor={colors.primary} />}
        ListEmptyComponent={
          <GlassCard style={styles.empty} padding={32}>
            <MaterialCommunityIcons name="certificate" size={48} color={colors.textMuted} />
            <Text style={styles.emptyTitle}>No certificates found</Text>
            <Text style={styles.emptyText}>Issue certificates for verified vehicles</Text>
          </GlassCard>
        }
      />

      {isAdmin && <FAB icon="plus" style={styles.fab} color={colors.white} onPress={openIssueDialog} />}

      {/* Issue Certificate Dialog */}
      <Portal>
        <Dialog visible={issueDialog} onDismiss={() => setIssueDialog(false)} style={styles.dialog}>
          <Dialog.Title style={styles.dialogTitle}>Issue Certificate</Dialog.Title>
          <Dialog.Content>
            <Text style={styles.label}>Select Verified Vehicle</Text>
            <Menu
              visible={vehicleMenu}
              onDismiss={() => setVehicleMenu(false)}
              anchor={
                <Button mode="outlined" onPress={() => setVehicleMenu(true)} style={styles.menuButton} textColor={colors.textPrimary}>
                  {selectedVehicle ? `${selectedVehicle.plate_number} - ${getEquipmentTypeConfig(selectedVehicle.equipment_type).label}` : 'Select vehicle...'}
                </Button>
              }
            >
              <ScrollView style={{ maxHeight: 300 }}>
                {verifiedVehicles.length > 0 ? verifiedVehicles.map((v) => (
                  <Menu.Item
                    key={v.id}
                    onPress={() => { setSelectedVehicle(v); setVehicleMenu(false); }}
                    title={`${v.plate_number} - ${getEquipmentTypeConfig(v.equipment_type).label}`}
                  />
                )) : (
                  <Menu.Item title="No verified vehicles" disabled />
                )}
              </ScrollView>
            </Menu>

            {selectedVehicle && (
              <GlassCard style={{ marginTop: 16 }} padding={12}>
                <Text style={styles.previewTitle}>Certificate Preview</Text>
                <View style={styles.previewRow}>
                  <Text style={styles.previewLabel}>Vehicle:</Text>
                  <Text style={styles.previewValue}>{selectedVehicle.plate_number}</Text>
                </View>
                <View style={styles.previewRow}>
                  <Text style={styles.previewLabel}>Type:</Text>
                  <Text style={styles.previewValue}>{getEquipmentTypeConfig(selectedVehicle.equipment_type).label}</Text>
                </View>
                <View style={styles.previewRow}>
                  <Text style={styles.previewLabel}>Driver:</Text>
                  <Text style={styles.previewValue}>{selectedVehicle.driver_name || 'N/A'}</Text>
                </View>
                <View style={styles.previewRow}>
                  <Text style={styles.previewLabel}>Valid For:</Text>
                  <Text style={styles.previewValue}>1 Year</Text>
                </View>
              </GlassCard>
            )}
          </Dialog.Content>
          <Dialog.Actions>
            <Button onPress={() => setIssueDialog(false)} textColor={colors.textMuted}>Cancel</Button>
            <Button onPress={issueCertificate} loading={issuing} disabled={issuing || !selectedVehicle} textColor={colors.success}>
              Issue Certificate
            </Button>
          </Dialog.Actions>
        </Dialog>
      </Portal>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background },
  loading: { flex: 1, justifyContent: 'center', alignItems: 'center', backgroundColor: colors.background },
  header: { paddingTop: 50, paddingHorizontal: 16, paddingBottom: 8 },
  title: { color: colors.textPrimary, fontSize: 24, fontWeight: 'bold' },
  subtitle: { color: colors.textMuted, fontSize: 13 },
  search: { marginHorizontal: 16, marginBottom: 10, backgroundColor: colors.card, borderRadius: 12 },
  filters: { marginHorizontal: 16, marginBottom: 10 },
  list: { padding: 8, paddingBottom: 100 },
  card: { marginHorizontal: 8, marginVertical: 4 },
  row: { flexDirection: 'row', alignItems: 'center' },
  icon: { width: 44, height: 44, borderRadius: 22, justifyContent: 'center', alignItems: 'center', marginRight: 12 },
  info: { flex: 1 },
  number: { color: colors.textPrimary, fontWeight: '600', fontSize: 14 },
  issued: { color: colors.textSecondary, fontSize: 12 },
  badge: { flexDirection: 'row', alignItems: 'center', paddingHorizontal: 8, paddingVertical: 4, borderRadius: 8, gap: 4 },
  badgeText: { fontSize: 11, fontWeight: '600' },
  dates: { flexDirection: 'row', justifyContent: 'space-between', marginTop: 10, paddingTop: 10, borderTopWidth: 1, borderTopColor: colors.cardBorder },
  dateItem: { flexDirection: 'row', alignItems: 'center', gap: 4 },
  dateText: { color: colors.textMuted, fontSize: 11 },
  empty: { alignItems: 'center', margin: 16 },
  emptyTitle: { color: colors.textPrimary, fontSize: 16, fontWeight: '600', marginTop: 12 },
  emptyText: { color: colors.textMuted, fontSize: 13, marginTop: 4, textAlign: 'center' },
  fab: { position: 'absolute', right: 16, bottom: 80, backgroundColor: colors.primary },
  dialog: { backgroundColor: colors.card },
  dialogTitle: { color: colors.textPrimary },
  label: { color: colors.textPrimary, fontSize: 14, fontWeight: '600', marginBottom: 8 },
  menuButton: { borderColor: colors.cardBorder },
  previewTitle: { color: colors.textPrimary, fontSize: 14, fontWeight: '600', marginBottom: 8 },
  previewRow: { flexDirection: 'row', justifyContent: 'space-between', paddingVertical: 4 },
  previewLabel: { color: colors.textMuted, fontSize: 13 },
  previewValue: { color: colors.textPrimary, fontSize: 13, fontWeight: '500' },
});
