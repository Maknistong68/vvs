import React, { useState, useMemo, useCallback } from 'react';
import { View, StyleSheet, ScrollView, RefreshControl, StatusBar, TouchableOpacity, FlatList } from 'react-native';
import { Text, ActivityIndicator, Searchbar } from 'react-native-paper';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { EQUIPMENT_TYPES, VehicleEquipment, getEquipmentTypeConfig, getCategoryDisplay } from '../../lib/supabase';
import { useAuth, useIsContractor } from '../../lib/auth';
import { colors, statusColors, glass, roleColors } from '../../lib/theme';
import { useDashboardStats, useEquipmentTypeBreakdown, useVehicles } from '../../lib/hooks';
import GlassCard from '../../components/GlassCard';
import GlassBackground from '../../components/GlassBackground';
import StatCard from '../../components/StatCard';

export default function DashboardScreen() {
  const { user, company, loading: authLoading } = useAuth();
  const { isContractor, loading: contractorLoading } = useIsContractor();
  const [searchQuery, setSearchQuery] = useState('');

  // Use React Query hooks for data fetching with caching
  const companyId = isContractor ? company?.id : undefined;

  // Fetch dashboard stats - single optimized query instead of 6+ queries
  const {
    data: stats = { total: 0, verified: 0, rejected: 0, pending: 0, overdue: 0, blacklisted: 0 },
    isLoading: statsLoading,
    error: statsError,
    refetch: refetchStats,
  } = useDashboardStats(companyId);

  // Fetch equipment type breakdown (only for non-contractors)
  const {
    data: topEquipment = [],
    refetch: refetchEquipment,
  } = useEquipmentTypeBreakdown(isContractor ? undefined : companyId);

  // Fetch contractor vehicles (only for contractors)
  const {
    data: vehiclesData,
    isLoading: vehiclesLoading,
    error: vehiclesError,
    refetch: refetchVehicles,
  } = useVehicles({
    companyId: company?.id,
    pageSize: 100, // Get all for contractor view
  });

  const contractorVehicles = vehiclesData?.vehicles || [];

  // Memoized filtered vehicles for search
  const filteredVehicles = useMemo(() => {
    if (!searchQuery) return contractorVehicles;
    const q = searchQuery.toLowerCase();
    return contractorVehicles.filter((v) =>
      v.plate_number?.toLowerCase().includes(q) ||
      v.driver_name?.toLowerCase().includes(q) ||
      v.client_company?.toLowerCase().includes(q)
    );
  }, [contractorVehicles, searchQuery]);

  // Combined loading state
  const loading = authLoading || contractorLoading || statsLoading || (isContractor && vehiclesLoading);
  const error = statsError?.message || vehiclesError?.message || null;

  // Refresh handler
  const handleRefresh = useCallback(() => {
    refetchStats();
    if (isContractor) {
      refetchVehicles();
    } else {
      refetchEquipment();
    }
  }, [isContractor, refetchStats, refetchVehicles, refetchEquipment]);

  const [refreshing, setRefreshing] = useState(false);
  const onRefresh = useCallback(async () => {
    setRefreshing(true);
    await handleRefresh();
    setRefreshing(false);
  }, [handleRefresh]);

  const displayName = user?.full_name || user?.email?.split('@')[0] || 'User';
  const roleColor = roleColors[user?.role || 'inspector'];

  if (loading) {
    return (
      <GlassBackground>
        <View style={styles.loading}>
          <ActivityIndicator size="large" color={colors.primary} />
          <Text style={styles.loadingText}>
            {authLoading ? 'Authenticating...' : 'Loading dashboard...'}
          </Text>
        </View>
      </GlassBackground>
    );
  }

  const getTypeLabel = (type: string) => {
    const config = EQUIPMENT_TYPES.find(t => t.value === type);
    return config?.label || type;
  };

  const renderContractorVehicle = ({ item }: { item: VehicleEquipment }) => {
    const sc = statusColors[item.actual_status] || statusColors.pending;
    const eq = getEquipmentTypeConfig(item.equipment_type);
    const isOverdue = item.next_inspection_date && new Date(item.next_inspection_date) < new Date();

    return (
      <GlassCard style={styles.vehicleCard} padding={14}>
        <View style={styles.vehicleRow}>
          <View style={[styles.vehicleIcon, { backgroundColor: `${colors.primary}15` }]}>
            <MaterialCommunityIcons name={eq.icon} size={24} color={colors.primary} />
          </View>
          <View style={styles.vehicleInfo}>
            <Text style={styles.vehiclePlate}>{item.plate_number}</Text>
            <Text style={styles.vehicleType}>{eq.label} - {getCategoryDisplay(item.equipment_category)}</Text>
            {item.driver_name && (
              <Text style={styles.vehicleDriver}>{item.driver_name}</Text>
            )}
          </View>
          <View>
            <View style={[styles.badge, { backgroundColor: sc.bg }]}>
              <MaterialCommunityIcons name={sc.icon} size={12} color={sc.text} />
              <Text style={[styles.badgeText, { color: sc.text }]}>
                {item.actual_status.charAt(0).toUpperCase() + item.actual_status.slice(1)}
              </Text>
            </View>
            {isOverdue && (
              <View style={[styles.badge, { backgroundColor: `${colors.error}15`, marginTop: 4 }]}>
                <MaterialCommunityIcons name="calendar-alert" size={12} color={colors.error} />
                <Text style={[styles.badgeText, { color: colors.error }]}>Overdue</Text>
              </View>
            )}
          </View>
        </View>
      </GlassCard>
    );
  };

  // Contractor Dashboard
  if (isContractor) {
    return (
      <GlassBackground>
        <StatusBar barStyle="light-content" backgroundColor="transparent" translucent />
        <View style={styles.container}>
          <View style={styles.header}>
            <Text style={styles.greeting}>Welcome back,</Text>
            <Text style={styles.name}>{displayName}</Text>
            <View style={[styles.roleBadge, { backgroundColor: `${roleColor}20` }]}>
              <MaterialCommunityIcons name="briefcase-account" size={14} color={roleColor} />
              <Text style={[styles.roleText, { color: roleColor }]}>Contractor</Text>
            </View>
          </View>

          {error ? (
            <GlassCard style={styles.errorCard} padding={20}>
              <MaterialCommunityIcons name="alert-circle" size={32} color={colors.error} />
              <Text style={styles.errorText}>{error}</Text>
              <TouchableOpacity onPress={handleRefresh} style={styles.retryBtn} accessibilityRole="button" accessibilityLabel="Retry loading data">
                <Text style={styles.retryText}>Tap to Retry</Text>
              </TouchableOpacity>
            </GlassCard>
          ) : (
            <>
              {/* Contractor Stats Summary */}
              <View style={styles.statsGrid}>
                <StatCard
                  title="Total"
                  value={stats.total}
                  icon="car-multiple"
                  color={colors.primary}
                />
                <StatCard
                  title="Verified"
                  value={stats.verified}
                  icon="check-circle"
                  color={colors.success}
                />
                <StatCard
                  title="Pending"
                  value={stats.pending}
                  icon="clock-outline"
                  color={colors.warning}
                />
                <StatCard
                  title="Rejected"
                  value={stats.rejected}
                  icon="close-circle"
                  color={colors.error}
                />
              </View>

              {/* Company Info */}
              {company && (
                <GlassCard style={styles.companyCard} padding={16}>
                  <View style={styles.companyRow}>
                    <MaterialCommunityIcons name="domain" size={20} color={colors.primary} />
                    <Text style={styles.companyName}>{company.name}</Text>
                    <View style={styles.companyCode}>
                      <Text style={styles.codeText}>{company.code}</Text>
                    </View>
                  </View>
                </GlassCard>
              )}

              {/* Search Bar */}
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

              {/* Equipment List Header */}
              <View style={styles.listHeader}>
                <Text style={styles.listTitle}>Your Equipment</Text>
                <Text style={styles.listCount}>{filteredVehicles.length} items</Text>
              </View>

              {/* Equipment List */}
              <FlatList
                data={filteredVehicles}
                keyExtractor={(item) => item.id}
                renderItem={renderContractorVehicle}
                contentContainerStyle={styles.list}
                refreshControl={
                  <RefreshControl
                    refreshing={refreshing}
                    onRefresh={onRefresh}
                    tintColor={colors.primary}
                  />
                }
                // Performance optimizations
                initialNumToRender={10}
                maxToRenderPerBatch={10}
                updateCellsBatchingPeriod={50}
                windowSize={10}
                removeClippedSubviews={true}
                ListEmptyComponent={
                  <GlassCard style={styles.empty} padding={32}>
                    <MaterialCommunityIcons name="car-off" size={48} color={colors.textMuted} />
                    <Text style={styles.emptyText}>No equipment registered</Text>
                  </GlassCard>
                }
              />
            </>
          )}
        </View>
      </GlassBackground>
    );
  }

  // Admin/Owner/Inspector Dashboard
  return (
    <GlassBackground>
      <StatusBar barStyle="light-content" backgroundColor="transparent" translucent />
      <ScrollView
        contentContainerStyle={styles.scroll}
        refreshControl={
          <RefreshControl
            refreshing={refreshing}
            onRefresh={onRefresh}
            tintColor={colors.primary}
          />
        }
      >
        <View style={styles.header}>
          <Text style={styles.greeting}>Welcome back,</Text>
          <Text style={styles.name}>{displayName}</Text>
          <View style={[styles.roleBadge, { backgroundColor: `${roleColor}20` }]}>
            <MaterialCommunityIcons
              name={user?.role === 'owner' ? 'crown' : user?.role === 'admin' ? 'shield-account' : 'account-check'}
              size={14}
              color={roleColor}
            />
            <Text style={[styles.roleText, { color: roleColor }]}>
              {(user?.role || 'inspector').charAt(0).toUpperCase() + (user?.role || 'inspector').slice(1)}
            </Text>
          </View>
        </View>

        {error ? (
          <GlassCard variant="error" style={styles.errorCard} padding={20}>
            <MaterialCommunityIcons name="alert-circle" size={32} color={colors.error} />
            <Text style={styles.errorText}>{error}</Text>
            <TouchableOpacity onPress={handleRefresh} style={styles.retryBtn} accessibilityRole="button" accessibilityLabel="Retry loading data">
              <Text style={styles.retryText}>Tap to Retry</Text>
            </TouchableOpacity>
          </GlassCard>
        ) : (
          <>
            {/* Main Stats Grid */}
            <View style={styles.statsGrid}>
              <StatCard
                title="Total"
                value={stats.total}
                icon="car-multiple"
                color={colors.primary}
              />
              <StatCard
                title="Verified"
                value={stats.verified}
                icon="check-circle"
                color={colors.success}
              />
              <StatCard
                title="Rejected"
                value={stats.rejected}
                icon="close-circle"
                color={colors.error}
              />
              <StatCard
                title="Pending"
                value={stats.pending}
                icon="clock-outline"
                color={colors.warning}
              />
            </View>

            {/* Alert Cards */}
            {(stats.overdue > 0 || stats.blacklisted > 0) && (
              <View style={styles.alertsRow}>
                {stats.overdue > 0 && (
                  <GlassCard variant="warning" style={styles.alertCard} padding={12}>
                    <View style={styles.alertContent}>
                      <MaterialCommunityIcons name="calendar-alert" size={20} color={colors.warning} />
                      <Text style={styles.alertNumber}>{stats.overdue}</Text>
                      <Text style={styles.alertLabel}>Overdue</Text>
                    </View>
                  </GlassCard>
                )}
                {stats.blacklisted > 0 && (
                  <GlassCard variant="error" style={styles.alertCard} padding={12}>
                    <View style={styles.alertContent}>
                      <MaterialCommunityIcons name="cancel" size={20} color={colors.error} />
                      <Text style={styles.alertNumber}>{stats.blacklisted}</Text>
                      <Text style={styles.alertLabel}>Blacklisted</Text>
                    </View>
                  </GlassCard>
                )}
              </View>
            )}

            {/* Top Equipment Types */}
            {topEquipment.length > 0 && (
              <GlassCard style={styles.chartCard} padding={16}>
                <Text style={styles.sectionTitle}>Top Equipment Types</Text>
                {topEquipment.map((item, index) => (
                  <View key={item.type} style={styles.barRow}>
                    <Text style={styles.barLabel}>{getTypeLabel(item.type)}</Text>
                    <View style={styles.barContainer}>
                      <View
                        style={[
                          styles.bar,
                          { width: `${(item.count / stats.total) * 100}%` }
                        ]}
                      />
                    </View>
                    <Text style={styles.barCount}>{item.count}</Text>
                  </View>
                ))}
              </GlassCard>
            )}
          </>
        )}

        <View style={{ height: 100 }} />
      </ScrollView>
    </GlassBackground>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1 },
  loading: { flex: 1, justifyContent: 'center', alignItems: 'center' },
  loadingText: { color: colors.textMuted, marginTop: 12, fontSize: 14 },
  scroll: { padding: 16, paddingTop: 50 },
  header: { paddingTop: 50, paddingHorizontal: 16, paddingBottom: 12 },
  greeting: { color: colors.textSecondary, fontSize: 14 },
  name: { color: colors.textPrimary, fontSize: 26, fontWeight: 'bold', marginBottom: 8 },
  roleBadge: { flexDirection: 'row', alignItems: 'center', paddingHorizontal: 12, paddingVertical: 6, borderRadius: 16, alignSelf: 'flex-start', gap: 6 },
  roleText: { fontWeight: '600', fontSize: 13 },

  // Stats Grid
  statsGrid: { flexDirection: 'row', flexWrap: 'wrap', marginHorizontal: 10, marginBottom: 8 },

  // Alert Cards
  alertsRow: { flexDirection: 'row', marginHorizontal: 10, marginBottom: 8 },
  alertCard: { flex: 1, marginHorizontal: 6 },
  alertContent: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  alertNumber: { color: colors.textPrimary, fontSize: 20, fontWeight: 'bold' },
  alertLabel: { color: colors.textMuted, fontSize: 12 },

  // Chart Card
  chartCard: { marginHorizontal: 10, marginBottom: 16 },
  sectionTitle: { color: colors.textPrimary, fontSize: 16, fontWeight: '600', marginBottom: 12 },
  barRow: { flexDirection: 'row', alignItems: 'center', marginBottom: 10 },
  barLabel: { color: colors.textSecondary, fontSize: 11, width: 100 },
  barContainer: { flex: 1, height: 8, backgroundColor: glass.background.card, borderRadius: 4, marginHorizontal: 8 },
  bar: { height: 8, backgroundColor: colors.primary, borderRadius: 4 },
  barCount: { color: colors.textMuted, fontSize: 12, width: 40, textAlign: 'right' },

  // Error Card
  errorCard: { alignItems: 'center', marginHorizontal: 10, marginBottom: 16 },
  errorText: { color: colors.error, fontSize: 14, marginTop: 8, textAlign: 'center' },
  retryBtn: { marginTop: 12, paddingHorizontal: 16, paddingVertical: 8, backgroundColor: colors.primary, borderRadius: 8 },
  retryText: { color: colors.textPrimary, fontWeight: '600' },

  // Contractor specific
  companyCard: { marginHorizontal: 10, marginBottom: 12 },
  companyRow: { flexDirection: 'row', alignItems: 'center', gap: 10 },
  companyName: { flex: 1, color: colors.textPrimary, fontSize: 16, fontWeight: '600' },
  companyCode: { backgroundColor: `${colors.primary}20`, paddingHorizontal: 10, paddingVertical: 4, borderRadius: 8 },
  codeText: { color: colors.primary, fontSize: 12, fontWeight: '600' },

  listHeader: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', paddingHorizontal: 16, marginBottom: 8 },
  listTitle: { color: colors.textPrimary, fontSize: 18, fontWeight: '600' },
  listCount: { color: colors.textMuted, fontSize: 13 },
  list: { paddingHorizontal: 10, paddingBottom: 120 },

  // Vehicle Card
  vehicleCard: { marginBottom: 4 },
  vehicleRow: { flexDirection: 'row', alignItems: 'center' },
  vehicleIcon: { width: 44, height: 44, borderRadius: 22, justifyContent: 'center', alignItems: 'center', marginRight: 12 },
  vehicleInfo: { flex: 1 },
  vehiclePlate: { color: colors.textPrimary, fontWeight: '700', fontSize: 15 },
  vehicleType: { color: colors.textSecondary, fontSize: 12 },
  vehicleDriver: { color: colors.textMuted, fontSize: 11, marginTop: 2 },
  badge: { flexDirection: 'row', alignItems: 'center', paddingHorizontal: 8, paddingVertical: 4, borderRadius: 8, gap: 4 },
  badgeText: { fontSize: 10, fontWeight: '600' },

  empty: { alignItems: 'center', margin: 16 },
  emptyText: { color: colors.textMuted, marginTop: 12 },

  // Search
  searchContainer: { paddingHorizontal: 10, marginBottom: 12 },
  search: {
    backgroundColor: glass.background.card,
    borderRadius: glass.border.radius.md,
    borderWidth: 1,
    borderColor: glass.border.color,
  },
});
