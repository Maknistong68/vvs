import React, { useState, useEffect, useCallback } from 'react';
import { View, StyleSheet, ScrollView, RefreshControl, StatusBar } from 'react-native';
import { Text, ActivityIndicator, Chip } from 'react-native-paper';
import { useRouter } from 'expo-router';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { supabase, VehicleEquipment, EQUIPMENT_TYPES } from '../../lib/supabase';
import { useAuth } from '../../lib/auth';
import { colors } from '../../lib/theme';
import StatCard from '../../components/StatCard';
import GlassCard from '../../components/GlassCard';

interface DashboardStats {
  total: number;
  verified: number;
  rejected: number;
  pending: number;
  overdue: number;
  blacklisted: number;
}

export default function DashboardScreen() {
  const router = useRouter();
  const { user, company } = useAuth();
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);
  const [stats, setStats] = useState<DashboardStats>({ total: 0, verified: 0, rejected: 0, pending: 0, overdue: 0, blacklisted: 0 });
  const [recentVehicles, setRecentVehicles] = useState<VehicleEquipment[]>([]);
  const [equipmentBreakdown, setEquipmentBreakdown] = useState<{ type: string; count: number; label: string }[]>([]);

  const fetchData = useCallback(async () => {
    try {
      const { data: vehicles } = await supabase.from('vehicles_equipment').select('*');

      if (vehicles) {
        const now = new Date();
        const newStats: DashboardStats = {
          total: vehicles.length,
          verified: vehicles.filter(v => v.actual_status === 'verified').length,
          rejected: vehicles.filter(v => v.actual_status === 'rejected').length,
          pending: vehicles.filter(v => v.actual_status === 'pending').length,
          overdue: vehicles.filter(v => v.next_inspection_date && new Date(v.next_inspection_date) < now).length,
          blacklisted: vehicles.filter(v => v.is_blacklisted).length,
        };
        setStats(newStats);

        // Equipment breakdown
        const breakdown: Record<string, number> = {};
        vehicles.forEach(v => {
          breakdown[v.equipment_type] = (breakdown[v.equipment_type] || 0) + 1;
        });

        const sorted = Object.entries(breakdown)
          .map(([type, count]) => ({
            type,
            count,
            label: EQUIPMENT_TYPES.find(t => t.value === type)?.label || type
          }))
          .sort((a, b) => b.count - a.count)
          .slice(0, 8);

        setEquipmentBreakdown(sorted);

        // Recent vehicles
        const recent = [...vehicles]
          .sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())
          .slice(0, 5);
        setRecentVehicles(recent);
      }
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
      setRefreshing(false);
    }
  }, []);

  useEffect(() => { fetchData(); }, [fetchData]);

  const onRefresh = () => { setRefreshing(true); fetchData(); };

  const displayName = user?.full_name && !user.full_name.includes('@')
    ? user.full_name
    : user?.email?.split('@')[0] || 'User';

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'verified': return colors.success;
      case 'rejected': return colors.error;
      default: return colors.warning;
    }
  };

  const getRoleColor = (role: string) => {
    switch (role) {
      case 'owner': return colors.warning;
      case 'admin': return colors.primary;
      default: return colors.success;
    }
  };

  if (loading) {
    return (
      <View style={styles.loading}>
        <ActivityIndicator size="large" color={colors.primary} />
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor={colors.background} />
      <ScrollView
        contentContainerStyle={styles.scroll}
        refreshControl={<RefreshControl refreshing={refreshing} onRefresh={onRefresh} tintColor={colors.primary} />}
        showsVerticalScrollIndicator={false}
      >
        {/* Header */}
        <View style={styles.header}>
          <View style={styles.headerLeft}>
            <Text style={styles.greeting}>Welcome back,</Text>
            <Text style={styles.name}>{displayName}</Text>
            <View style={styles.badges}>
              <Chip mode="flat" style={[styles.chip, { backgroundColor: `${getRoleColor(user?.role || 'inspector')}20` }]} textStyle={[styles.chipText, { color: getRoleColor(user?.role || 'inspector') }]}>
                {(user?.role || 'inspector').charAt(0).toUpperCase() + (user?.role || 'inspector').slice(1)}
              </Chip>
              {company && (
                <Chip mode="flat" style={styles.chipOutline} textStyle={styles.chipText}>{company.name}</Chip>
              )}
            </View>
          </View>
          <View style={styles.avatar}>
            <MaterialCommunityIcons name="account" size={28} color={colors.primary} />
          </View>
        </View>

        {/* Stats Grid */}
        <Text style={styles.sectionTitle}>Overview</Text>
        <View style={styles.statsGrid}>
          <StatCard title="Total" value={stats.total} icon="car-multiple" color={colors.primary} />
          <StatCard title="Verified" value={stats.verified} icon="check-circle" color={colors.success} />
          <StatCard title="Rejected" value={stats.rejected} icon="close-circle" color={colors.error} />
          <StatCard title="Pending" value={stats.pending} icon="clock-outline" color={colors.warning} />
        </View>

        {/* Additional Stats */}
        <View style={styles.statsRow}>
          <GlassCard style={styles.miniStat} padding={16}>
            <View style={styles.miniStatRow}>
              <MaterialCommunityIcons name="calendar-alert" size={24} color={colors.error} />
              <View style={styles.miniStatInfo}>
                <Text style={styles.miniStatValue}>{stats.overdue}</Text>
                <Text style={styles.miniStatLabel}>Overdue</Text>
              </View>
            </View>
          </GlassCard>
          <GlassCard style={styles.miniStat} padding={16}>
            <View style={styles.miniStatRow}>
              <MaterialCommunityIcons name="cancel" size={24} color={colors.textMuted} />
              <View style={styles.miniStatInfo}>
                <Text style={styles.miniStatValue}>{stats.blacklisted}</Text>
                <Text style={styles.miniStatLabel}>Blacklisted</Text>
              </View>
            </View>
          </GlassCard>
        </View>

        {/* Quick Actions */}
        <Text style={styles.sectionTitle}>Quick Actions</Text>
        <ScrollView horizontal showsHorizontalScrollIndicator={false} style={styles.actionsScroll}>
          <GlassCard onPress={() => router.push('/(tabs)/inspections')} style={styles.actionCard} padding={14}>
            <View style={[styles.actionIcon, { backgroundColor: `${colors.primary}20` }]}>
              <MaterialCommunityIcons name="clipboard-check" size={24} color={colors.primary} />
            </View>
            <Text style={styles.actionText}>Inspect</Text>
          </GlassCard>
          <GlassCard onPress={() => router.push('/(tabs)/admin')} style={styles.actionCard} padding={14}>
            <View style={[styles.actionIcon, { backgroundColor: `${colors.secondary}20` }]}>
              <MaterialCommunityIcons name="car-multiple" size={24} color={colors.secondary} />
            </View>
            <Text style={styles.actionText}>Vehicles</Text>
          </GlassCard>
          <GlassCard onPress={() => router.push('/(tabs)/certificates')} style={styles.actionCard} padding={14}>
            <View style={[styles.actionIcon, { backgroundColor: `${colors.success}20` }]}>
              <MaterialCommunityIcons name="certificate" size={24} color={colors.success} />
            </View>
            <Text style={styles.actionText}>Certs</Text>
          </GlassCard>
          <GlassCard onPress={() => router.push('/(tabs)/settings')} style={styles.actionCard} padding={14}>
            <View style={[styles.actionIcon, { backgroundColor: `${colors.warning}20` }]}>
              <MaterialCommunityIcons name="cog" size={24} color={colors.warning} />
            </View>
            <Text style={styles.actionText}>Settings</Text>
          </GlassCard>
        </ScrollView>

        {/* Equipment Breakdown */}
        <Text style={styles.sectionTitle}>Equipment Breakdown</Text>
        <GlassCard style={styles.section} padding={16}>
          {equipmentBreakdown.map((item, idx) => (
            <View key={item.type} style={styles.breakdownRow}>
              <View style={styles.breakdownLabel}>
                <Text style={styles.breakdownRank}>#{idx + 1}</Text>
                <Text style={styles.breakdownText} numberOfLines={1}>{item.label}</Text>
              </View>
              <View style={styles.breakdownBar}>
                <View style={[styles.breakdownFill, { width: `${Math.min((item.count / stats.total) * 100, 100)}%` }]} />
              </View>
              <Text style={styles.breakdownCount}>{item.count}</Text>
            </View>
          ))}
        </GlassCard>

        {/* Recent Vehicles */}
        <Text style={styles.sectionTitle}>Recent Vehicles</Text>
        <GlassCard style={styles.section} padding={16}>
          {recentVehicles.length > 0 ? recentVehicles.map((v) => {
            const eq = EQUIPMENT_TYPES.find(t => t.value === v.equipment_type);
            return (
              <View key={v.id} style={styles.recentItem}>
                <View style={[styles.recentIcon, { backgroundColor: `${colors.primary}15` }]}>
                  <MaterialCommunityIcons name={eq?.icon || 'car'} size={20} color={colors.primary} />
                </View>
                <View style={styles.recentInfo}>
                  <Text style={styles.recentPlate}>{v.plate_number}</Text>
                  <Text style={styles.recentType}>{eq?.label || v.equipment_type}</Text>
                </View>
                <View style={[styles.statusDot, { backgroundColor: getStatusColor(v.actual_status) }]} />
              </View>
            );
          }) : (
            <Text style={styles.emptyText}>No vehicles yet</Text>
          )}
        </GlassCard>

        <View style={{ height: 100 }} />
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background },
  loading: { flex: 1, justifyContent: 'center', alignItems: 'center', backgroundColor: colors.background },
  scroll: { padding: 16, paddingTop: 50 },
  header: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: 20 },
  headerLeft: { flex: 1 },
  greeting: { color: colors.textSecondary, fontSize: 14 },
  name: { color: colors.textPrimary, fontSize: 24, fontWeight: 'bold', marginBottom: 8 },
  badges: { flexDirection: 'row', gap: 8 },
  chip: { height: 28 },
  chipOutline: { height: 28, backgroundColor: colors.card, borderWidth: 1, borderColor: colors.cardBorder },
  chipText: { color: colors.textPrimary, fontSize: 11 },
  avatar: { width: 52, height: 52, borderRadius: 26, backgroundColor: `${colors.primary}15`, justifyContent: 'center', alignItems: 'center' },
  sectionTitle: { color: colors.textPrimary, fontSize: 16, fontWeight: '600', marginTop: 16, marginBottom: 10 },
  statsGrid: { flexDirection: 'row', flexWrap: 'wrap', marginHorizontal: -6 },
  statsRow: { flexDirection: 'row', marginTop: 8, marginHorizontal: -6 },
  miniStat: { flex: 1, marginHorizontal: 6 },
  miniStatRow: { flexDirection: 'row', alignItems: 'center' },
  miniStatInfo: { marginLeft: 12 },
  miniStatValue: { color: colors.textPrimary, fontSize: 20, fontWeight: 'bold' },
  miniStatLabel: { color: colors.textMuted, fontSize: 12 },
  actionsScroll: { marginHorizontal: -8 },
  actionCard: { width: 80, alignItems: 'center', marginHorizontal: 4 },
  actionIcon: { width: 44, height: 44, borderRadius: 22, justifyContent: 'center', alignItems: 'center', marginBottom: 6 },
  actionText: { color: colors.textPrimary, fontSize: 12 },
  section: { marginHorizontal: 0 },
  breakdownRow: { flexDirection: 'row', alignItems: 'center', marginBottom: 12 },
  breakdownLabel: { width: 130, flexDirection: 'row', alignItems: 'center' },
  breakdownRank: { color: colors.textMuted, fontSize: 12, width: 24 },
  breakdownText: { color: colors.textSecondary, fontSize: 12, flex: 1 },
  breakdownBar: { flex: 1, height: 8, backgroundColor: colors.surfaceLight, borderRadius: 4, marginHorizontal: 8 },
  breakdownFill: { height: '100%', backgroundColor: colors.primary, borderRadius: 4 },
  breakdownCount: { color: colors.textPrimary, fontSize: 13, fontWeight: '600', width: 36, textAlign: 'right' },
  recentItem: { flexDirection: 'row', alignItems: 'center', paddingVertical: 10, borderBottomWidth: 1, borderBottomColor: colors.cardBorder },
  recentIcon: { width: 36, height: 36, borderRadius: 18, justifyContent: 'center', alignItems: 'center' },
  recentInfo: { flex: 1, marginLeft: 12 },
  recentPlate: { color: colors.textPrimary, fontSize: 14, fontWeight: '600' },
  recentType: { color: colors.textMuted, fontSize: 12 },
  statusDot: { width: 10, height: 10, borderRadius: 5 },
  emptyText: { color: colors.textMuted, textAlign: 'center', paddingVertical: 20 },
});
