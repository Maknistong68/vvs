import React, { useState, useEffect, useCallback } from 'react';
import {
  View,
  StyleSheet,
  ScrollView,
  RefreshControl,
  Dimensions,
  StatusBar,
} from 'react-native';
import { Text, Avatar, Chip } from 'react-native-paper';
import { useRouter } from 'expo-router';
import { BarChart } from 'react-native-chart-kit';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { supabase, InspectionStats, FailureReasonStat, Inspection } from '../../lib/supabase';
import { useAuth } from '../../lib/auth';
import { colors, statusColors } from '../../lib/theme';
import StatCard from '../../components/StatCard';
import GlassCard from '../../components/GlassCard';

const screenWidth = Dimensions.get('window').width;

export default function DashboardScreen() {
  const router = useRouter();
  const { user, company } = useAuth();
  const [refreshing, setRefreshing] = useState(false);
  const [stats, setStats] = useState<InspectionStats>({ total: 0, pending: 0, pass: 0, fail: 0 });
  const [recentInspections, setRecentInspections] = useState<Inspection[]>([]);
  const [failureStats, setFailureStats] = useState<FailureReasonStat[]>([]);

  const fetchData = useCallback(async () => {
    try {
      const [statsRes, failureRes, inspectionsRes] = await Promise.all([
        supabase.rpc('get_inspection_stats'),
        supabase.rpc('get_failure_reason_stats'),
        supabase.from('inspections').select('*, vehicle:vehicles(*), inspector:users!inspections_inspector_id_fkey(*)').order('created_at', { ascending: false }).limit(5),
      ]);
      if (statsRes.data) setStats(statsRes.data);
      if (failureRes.data) setFailureStats(failureRes.data);
      if (inspectionsRes.data) setRecentInspections(inspectionsRes.data);
    } catch (error) {
      console.error('Error:', error);
    } finally {
      setRefreshing(false);
    }
  }, []);

  useEffect(() => { fetchData(); }, [fetchData]);

  const onRefresh = useCallback(() => { setRefreshing(true); fetchData(); }, [fetchData]);

  const chartData = {
    labels: failureStats.length > 0 ? failureStats.slice(0, 4).map((item) => item.reason_text.length > 6 ? item.reason_text.substring(0, 6) + '..' : item.reason_text) : ['None'],
    datasets: [{ data: failureStats.length > 0 ? failureStats.slice(0, 4).map((item) => item.count || 0) : [0] }],
  };

  const getRoleColor = (role: string) => {
    switch (role) {
      case 'owner': return colors.warning;
      case 'admin': return colors.primary;
      default: return colors.success;
    }
  };

  // Get display name - use full_name if available, otherwise extract from email
  const displayName = user?.full_name && !user.full_name.includes('@')
    ? user.full_name
    : user?.email?.split('@')[0] || 'User';

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor={colors.background} />
      <ScrollView
        contentContainerStyle={styles.content}
        refreshControl={<RefreshControl refreshing={refreshing} onRefresh={onRefresh} tintColor={colors.primary} />}
        showsVerticalScrollIndicator={false}
      >
        {/* Header */}
        <View style={styles.header}>
          <View style={styles.headerLeft}>
            <Text style={styles.greeting}>Welcome back,</Text>
            <Text style={styles.userName}>{displayName}</Text>
            <View style={styles.badges}>
              <Chip
                mode="flat"
                style={[styles.chip, { backgroundColor: `${getRoleColor(user?.role || 'inspector')}20` }]}
                textStyle={[styles.chipText, { color: getRoleColor(user?.role || 'inspector') }]}
              >
                {(user?.role || 'inspector').charAt(0).toUpperCase() + (user?.role || 'inspector').slice(1)}
              </Chip>
              {company && (
                <Chip mode="flat" style={styles.chipOutline} textStyle={styles.chipText}>
                  {company.name}
                </Chip>
              )}
            </View>
          </View>
          <Avatar.Icon size={52} icon="account" style={styles.avatar} color={colors.white} />
        </View>

        {/* Stats */}
        <Text style={styles.sectionTitle}>Overview</Text>
        <View style={styles.statsRow}>
          <StatCard title="Total" value={stats.total} icon="clipboard-list" color={colors.primary} />
          <StatCard title="Pending" value={stats.pending} icon="clock-outline" color={colors.warning} />
        </View>
        <View style={styles.statsRow}>
          <StatCard title="Passed" value={stats.pass} icon="check-circle" color={colors.success} />
          <StatCard title="Failed" value={stats.fail} icon="close-circle" color={colors.error} />
        </View>

        {/* Quick Actions */}
        <Text style={styles.sectionTitle}>Quick Actions</Text>
        <ScrollView horizontal showsHorizontalScrollIndicator={false} style={styles.actionsScroll}>
          <GlassCard onPress={() => router.push('/inspection/new')} style={styles.actionCard} padding={14}>
            <View style={[styles.actionIcon, { backgroundColor: `${colors.primary}20` }]}>
              <MaterialCommunityIcons name="plus" size={24} color={colors.primary} />
            </View>
            <Text style={styles.actionText}>New</Text>
          </GlassCard>
          <GlassCard onPress={() => router.push('/(tabs)/inspections')} style={styles.actionCard} padding={14}>
            <View style={[styles.actionIcon, { backgroundColor: `${colors.secondary}20` }]}>
              <MaterialCommunityIcons name="format-list-checks" size={24} color={colors.secondary} />
            </View>
            <Text style={styles.actionText}>All</Text>
          </GlassCard>
          <GlassCard onPress={() => router.push('/(tabs)/certificates')} style={styles.actionCard} padding={14}>
            <View style={[styles.actionIcon, { backgroundColor: `${colors.success}20` }]}>
              <MaterialCommunityIcons name="certificate" size={24} color={colors.success} />
            </View>
            <Text style={styles.actionText}>Certs</Text>
          </GlassCard>
          <GlassCard onPress={() => router.push('/(tabs)/admin')} style={styles.actionCard} padding={14}>
            <View style={[styles.actionIcon, { backgroundColor: `${colors.warning}20` }]}>
              <MaterialCommunityIcons name="cog" size={24} color={colors.warning} />
            </View>
            <Text style={styles.actionText}>Manage</Text>
          </GlassCard>
        </ScrollView>

        {/* Chart */}
        {failureStats.length > 0 && (
          <>
            <Text style={styles.sectionTitle}>Top Failures</Text>
            <GlassCard style={styles.chartCard} padding={12}>
              <BarChart
                data={chartData}
                width={screenWidth - 72}
                height={160}
                yAxisLabel=""
                yAxisSuffix=""
                chartConfig={{
                  backgroundColor: colors.card,
                  backgroundGradientFrom: colors.card,
                  backgroundGradientTo: colors.card,
                  decimalPlaces: 0,
                  color: (opacity = 1) => `rgba(59, 130, 246, ${opacity})`,
                  labelColor: () => colors.textSecondary,
                  barPercentage: 0.7,
                  propsForBackgroundLines: { stroke: colors.cardBorder, strokeDasharray: '4,4' },
                }}
                showValuesOnTopOfBars
                fromZero
                withInnerLines={false}
              />
            </GlassCard>
          </>
        )}

        {/* Recent */}
        <Text style={styles.sectionTitle}>Recent Inspections</Text>
        {recentInspections.length > 0 ? (
          recentInspections.map((inspection) => {
            const sc = statusColors[inspection.status] || statusColors.pending;
            return (
              <GlassCard key={inspection.id} onPress={() => router.push(`/inspection/${inspection.id}`)} style={styles.inspectionCard} padding={14}>
                <View style={styles.inspectionRow}>
                  <View style={styles.inspectionIcon}>
                    <MaterialCommunityIcons name="car" size={22} color={colors.primary} />
                  </View>
                  <View style={styles.inspectionInfo}>
                    <Text style={styles.vehicleName}>{inspection.vehicle?.name || 'Unknown'}</Text>
                    <Text style={styles.vehiclePlate}>{inspection.vehicle?.plate_number || 'N/A'}</Text>
                  </View>
                  <View style={[styles.statusBadge, { backgroundColor: sc.bg }]}>
                    <MaterialCommunityIcons name={sc.icon} size={12} color={sc.text} />
                    <Text style={[styles.statusText, { color: sc.text }]}>
                      {inspection.status.charAt(0).toUpperCase() + inspection.status.slice(1)}
                    </Text>
                  </View>
                </View>
              </GlassCard>
            );
          })
        ) : (
          <GlassCard style={styles.emptyCard} padding={24}>
            <MaterialCommunityIcons name="clipboard-text-off" size={40} color={colors.textMuted} />
            <Text style={styles.emptyText}>No inspections yet</Text>
          </GlassCard>
        )}

        <View style={{ height: 90 }} />
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background },
  content: { paddingTop: 50, paddingHorizontal: 16 },
  header: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: 20 },
  headerLeft: { flex: 1 },
  greeting: { color: colors.textSecondary, fontSize: 14 },
  userName: { color: colors.textPrimary, fontSize: 22, fontWeight: 'bold', marginBottom: 8 },
  badges: { flexDirection: 'row', gap: 8 },
  chip: { height: 28 },
  chipOutline: { height: 28, backgroundColor: colors.card, borderWidth: 1, borderColor: colors.cardBorder },
  chipText: { color: colors.textPrimary, fontSize: 11 },
  avatar: { backgroundColor: colors.primary },
  sectionTitle: { color: colors.textPrimary, fontSize: 16, fontWeight: '600', marginTop: 16, marginBottom: 10 },
  statsRow: { flexDirection: 'row', marginHorizontal: -6 },
  actionsScroll: { marginHorizontal: -8 },
  actionCard: { width: 80, alignItems: 'center', marginHorizontal: 4 },
  actionIcon: { width: 44, height: 44, borderRadius: 22, justifyContent: 'center', alignItems: 'center', marginBottom: 6 },
  actionText: { color: colors.textPrimary, fontSize: 12 },
  chartCard: { marginHorizontal: 0 },
  inspectionCard: { marginHorizontal: 0, marginVertical: 4 },
  inspectionRow: { flexDirection: 'row', alignItems: 'center' },
  inspectionIcon: { width: 40, height: 40, borderRadius: 20, backgroundColor: `${colors.primary}15`, justifyContent: 'center', alignItems: 'center', marginRight: 12 },
  inspectionInfo: { flex: 1 },
  vehicleName: { color: colors.textPrimary, fontWeight: '600', fontSize: 14 },
  vehiclePlate: { color: colors.textSecondary, fontSize: 12 },
  statusBadge: { flexDirection: 'row', alignItems: 'center', paddingHorizontal: 8, paddingVertical: 4, borderRadius: 8, gap: 4 },
  statusText: { fontSize: 11, fontWeight: '600' },
  emptyCard: { alignItems: 'center', marginHorizontal: 0 },
  emptyText: { color: colors.textMuted, marginTop: 8 },
});
