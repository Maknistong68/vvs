import React, { useState, useEffect, useCallback } from 'react';
import { View, StyleSheet, FlatList, RefreshControl, StatusBar } from 'react-native';
import { Text, FAB, Searchbar, SegmentedButtons } from 'react-native-paper';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { supabase } from '../../lib/supabase';
import { colors, statusColors } from '../../lib/theme';
import GlassCard from '../../components/GlassCard';
import { useIsAdmin } from '../../lib/auth';

interface Certificate {
  id: string;
  certificate_number: string;
  issued_to: string;
  issue_date: string;
  expiry_date: string;
  status: 'valid' | 'expired' | 'revoked' | 'pending';
}

export default function CertificatesScreen() {
  const isAdmin = useIsAdmin();
  const [refreshing, setRefreshing] = useState(false);
  const [certificates, setCertificates] = useState<Certificate[]>([]);
  const [filtered, setFiltered] = useState<Certificate[]>([]);
  const [search, setSearch] = useState('');
  const [filter, setFilter] = useState<string>('all');

  const fetch = useCallback(async () => {
    try {
      const { data } = await supabase.from('certificates').select('*').order('issue_date', { ascending: false });
      setCertificates(data || []);
      setFiltered(data || []);
    } catch (e) {
      console.error(e);
    } finally {
      setRefreshing(false);
    }
  }, []);

  useEffect(() => { fetch(); }, [fetch]);

  useEffect(() => {
    let f = certificates;
    if (filter !== 'all') f = f.filter((c) => c.status === filter);
    if (search) {
      const q = search.toLowerCase();
      f = f.filter((c) => c.certificate_number?.toLowerCase().includes(q) || c.issued_to?.toLowerCase().includes(q));
    }
    setFiltered(f);
  }, [certificates, filter, search]);

  const renderItem = ({ item }: { item: Certificate }) => {
    const sc = statusColors[item.status] || statusColors.pending;
    const expired = new Date(item.expiry_date) < new Date();

    return (
      <GlassCard style={styles.card} padding={14}>
        <View style={styles.row}>
          <View style={styles.icon}>
            <MaterialCommunityIcons name="certificate" size={24} color={colors.primary} />
          </View>
          <View style={styles.info}>
            <Text style={styles.number}>{item.certificate_number}</Text>
            <Text style={styles.issued}>{item.issued_to}</Text>
          </View>
          <View style={[styles.badge, { backgroundColor: sc.bg }]}>
            <MaterialCommunityIcons name={sc.icon} size={12} color={sc.text} />
            <Text style={[styles.badgeText, { color: sc.text }]}>{item.status.charAt(0).toUpperCase() + item.status.slice(1)}</Text>
          </View>
        </View>
        <View style={styles.dates}>
          <View style={styles.dateItem}>
            <MaterialCommunityIcons name="calendar-check" size={14} color={colors.textMuted} />
            <Text style={styles.dateText}>Issued: {new Date(item.issue_date).toLocaleDateString()}</Text>
          </View>
          <View style={styles.dateItem}>
            <MaterialCommunityIcons name="calendar-remove" size={14} color={expired ? colors.error : colors.textMuted} />
            <Text style={[styles.dateText, expired && { color: colors.error }]}>Expires: {new Date(item.expiry_date).toLocaleDateString()}</Text>
          </View>
        </View>
      </GlassCard>
    );
  };

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor={colors.background} />
      <View style={styles.header}>
        <Text style={styles.title}>Certificates</Text>
      </View>

      <Searchbar
        placeholder="Search..."
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
          { value: 'pending', label: 'Pending' },
        ]}
        style={styles.filters}
      />

      <FlatList
        data={filtered}
        keyExtractor={(item) => item.id}
        renderItem={renderItem}
        contentContainerStyle={styles.list}
        refreshControl={<RefreshControl refreshing={refreshing} onRefresh={() => { setRefreshing(true); fetch(); }} tintColor={colors.primary} />}
        ListEmptyComponent={
          <GlassCard style={styles.empty} padding={32}>
            <MaterialCommunityIcons name="certificate" size={48} color={colors.textMuted} />
            <Text style={styles.emptyTitle}>No certificates found</Text>
            <Text style={styles.emptyText}>Certificates are generated when inspections pass</Text>
          </GlassCard>
        }
      />

      {isAdmin && <FAB icon="plus" style={styles.fab} color={colors.white} onPress={() => {}} />}
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background },
  header: { paddingTop: 50, paddingHorizontal: 16, paddingBottom: 12 },
  title: { color: colors.textPrimary, fontSize: 24, fontWeight: 'bold' },
  search: { marginHorizontal: 16, marginBottom: 10, backgroundColor: colors.card, borderRadius: 12 },
  filters: { marginHorizontal: 16, marginBottom: 10 },
  list: { padding: 8, paddingBottom: 100 },
  card: { marginHorizontal: 8, marginVertical: 4 },
  row: { flexDirection: 'row', alignItems: 'center' },
  icon: { width: 44, height: 44, borderRadius: 22, backgroundColor: `${colors.primary}15`, justifyContent: 'center', alignItems: 'center', marginRight: 12 },
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
});
