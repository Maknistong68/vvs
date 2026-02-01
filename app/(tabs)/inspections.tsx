import React, { useState, useEffect, useCallback } from 'react';
import { View, StyleSheet, FlatList, RefreshControl, StatusBar } from 'react-native';
import { Text, FAB, Searchbar, ActivityIndicator, SegmentedButtons } from 'react-native-paper';
import { useRouter } from 'expo-router';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { supabase, Inspection, getVehicleTypeConfig } from '../../lib/supabase';
import { colors, statusColors } from '../../lib/theme';
import GlassCard from '../../components/GlassCard';

export default function InspectionsScreen() {
  const router = useRouter();
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);
  const [inspections, setInspections] = useState<Inspection[]>([]);
  const [filteredInspections, setFilteredInspections] = useState<Inspection[]>([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [statusFilter, setStatusFilter] = useState<string>('all');

  const fetchInspections = useCallback(async () => {
    try {
      const { data, error } = await supabase
        .from('inspections')
        .select('*, vehicle:vehicles(*), inspector:users!inspections_inspector_id_fkey(*), failure_reason:failure_reasons(*)')
        .order('scheduled_date', { ascending: false });
      if (error) throw error;
      setInspections(data || []);
      setFilteredInspections(data || []);
    } catch (error) {
      console.error('Error:', error);
    } finally {
      setLoading(false);
      setRefreshing(false);
    }
  }, []);

  useEffect(() => { fetchInspections(); }, [fetchInspections]);

  useEffect(() => {
    let filtered = inspections;
    if (statusFilter !== 'all') filtered = filtered.filter((i) => i.status === statusFilter);
    if (searchQuery) {
      const q = searchQuery.toLowerCase();
      filtered = filtered.filter((i) => i.vehicle?.name?.toLowerCase().includes(q) || i.vehicle?.plate_number?.toLowerCase().includes(q));
    }
    setFilteredInspections(filtered);
  }, [inspections, statusFilter, searchQuery]);

  const renderItem = ({ item }: { item: Inspection }) => {
    const sc = statusColors[item.status] || statusColors.pending;
    const date = new Date(item.scheduled_date).toLocaleDateString();
    const typeConfig = item.vehicle ? getVehicleTypeConfig(item.vehicle.vehicle_type) : null;

    return (
      <GlassCard style={styles.card} padding={14} onPress={() => router.push(`/inspection/${item.id}`)}>
        <View style={styles.row}>
          <View style={styles.icon}>
            <MaterialCommunityIcons name={typeConfig?.icon || 'car'} size={24} color={colors.primary} />
          </View>
          <View style={styles.info}>
            <Text style={styles.name}>{item.vehicle?.name || 'Unknown'}</Text>
            <Text style={styles.plate}>{item.vehicle?.plate_number || 'N/A'}</Text>
            <Text style={styles.meta}>{date}</Text>
          </View>
          <View style={[styles.badge, { backgroundColor: sc.bg }]}>
            <MaterialCommunityIcons name={sc.icon} size={12} color={sc.text} />
            <Text style={[styles.badgeText, { color: sc.text }]}>{item.status.charAt(0).toUpperCase() + item.status.slice(1)}</Text>
          </View>
        </View>
        {item.status === 'fail' && item.failure_reason && (
          <View style={styles.failRow}>
            <MaterialCommunityIcons name="alert-circle" size={12} color={colors.error} />
            <Text style={styles.failText}>{item.failure_reason.reason_text}</Text>
          </View>
        )}
      </GlassCard>
    );
  };

  if (loading) return <View style={styles.loading}><ActivityIndicator size="large" color={colors.primary} /></View>;

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor={colors.background} />
      <View style={styles.header}>
        <Text style={styles.title}>Inspections</Text>
      </View>

      <Searchbar
        placeholder="Search..."
        onChangeText={setSearchQuery}
        value={searchQuery}
        style={styles.search}
        iconColor={colors.textMuted}
        inputStyle={{ color: colors.textPrimary }}
        placeholderTextColor={colors.textMuted}
      />

      <SegmentedButtons
        value={statusFilter}
        onValueChange={setStatusFilter}
        buttons={[
          { value: 'all', label: 'All' },
          { value: 'pending', label: 'Pending' },
          { value: 'pass', label: 'Pass' },
          { value: 'fail', label: 'Fail' },
        ]}
        style={styles.filters}
      />

      <FlatList
        data={filteredInspections}
        keyExtractor={(item) => item.id}
        renderItem={renderItem}
        contentContainerStyle={styles.list}
        refreshControl={<RefreshControl refreshing={refreshing} onRefresh={() => { setRefreshing(true); fetchInspections(); }} tintColor={colors.primary} />}
        ListEmptyComponent={
          <GlassCard style={styles.empty} padding={32}>
            <MaterialCommunityIcons name="clipboard-text-off" size={48} color={colors.textMuted} />
            <Text style={styles.emptyText}>No inspections found</Text>
          </GlassCard>
        }
      />

      <FAB icon="plus" style={styles.fab} color={colors.white} onPress={() => router.push('/inspection/new')} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background },
  loading: { flex: 1, justifyContent: 'center', alignItems: 'center', backgroundColor: colors.background },
  header: { paddingTop: 50, paddingHorizontal: 16, paddingBottom: 12 },
  title: { color: colors.textPrimary, fontSize: 24, fontWeight: 'bold' },
  search: { marginHorizontal: 16, marginBottom: 10, backgroundColor: colors.card, borderRadius: 12 },
  filters: { marginHorizontal: 16, marginBottom: 10 },
  list: { padding: 8, paddingBottom: 100 },
  card: { marginHorizontal: 8, marginVertical: 4 },
  row: { flexDirection: 'row', alignItems: 'center' },
  icon: { width: 44, height: 44, borderRadius: 22, backgroundColor: `${colors.primary}15`, justifyContent: 'center', alignItems: 'center', marginRight: 12 },
  info: { flex: 1 },
  name: { color: colors.textPrimary, fontWeight: '600', fontSize: 14 },
  plate: { color: colors.textSecondary, fontSize: 12 },
  meta: { color: colors.textMuted, fontSize: 11 },
  badge: { flexDirection: 'row', alignItems: 'center', paddingHorizontal: 8, paddingVertical: 4, borderRadius: 8, gap: 4 },
  badgeText: { fontSize: 11, fontWeight: '600' },
  failRow: { flexDirection: 'row', alignItems: 'center', marginTop: 10, paddingTop: 10, borderTopWidth: 1, borderTopColor: colors.cardBorder, gap: 6 },
  failText: { color: colors.error, fontSize: 12, flex: 1 },
  empty: { alignItems: 'center', margin: 16 },
  emptyText: { color: colors.textMuted, marginTop: 12 },
  fab: { position: 'absolute', right: 16, bottom: 80, backgroundColor: colors.primary },
});
