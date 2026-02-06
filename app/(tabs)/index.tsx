import React, { useState, useCallback, useEffect, useRef, useMemo } from 'react';
import { View, StyleSheet, RefreshControl, StatusBar, TouchableOpacity, FlatList, ScrollView } from 'react-native';
import { Text, ActivityIndicator, Searchbar } from 'react-native-paper';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { EQUIPMENT_TYPES, VehicleEquipment, getEquipmentTypeConfig, getCategoryDisplay, KPI_CONFIG, KpiType, DEFAULT_DASHBOARD_KPIS, DashboardStats } from '../../lib/supabase';
import { useAuth, useIsContractor } from '../../lib/auth';
import { colors, statusColors, glass, roleColors } from '../../lib/theme';
import { useDashboardStats, useEquipmentTypeBreakdown, useVehicles, useDashboardKpiSettings } from '../../lib/hooks';
import GlassCard from '../../components/GlassCard';
import GlassBackground from '../../components/GlassBackground';
import StatCard from '../../components/StatCard';
import StatusBadge from '../../components/StatusBadge';
import EmptyState from '../../components/EmptyState';
import { DashboardSkeleton } from '../../components/SkeletonLoader';

export default function DashboardScreen() {
  const { user, company, loading: authLoading } = useAuth();
  const { isContractor, loading: contractorLoading } = useIsContractor();
  const insets = useSafeAreaInsets();

  // Search state with debouncing
  const [searchQuery, setSearchQuery] = useState('');
  const [debouncedQuery, setDebouncedQuery] = useState('');
  const debounceRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  // Debounce search input - only search after user stops typing for 300ms
  useEffect(() => {
    if (debounceRef.current) {
      clearTimeout(debounceRef.current);
    }
    debounceRef.current = setTimeout(() => {
      setDebouncedQuery(searchQuery.trim().toLowerCase());
    }, 300);
    return () => {
      if (debounceRef.current) clearTimeout(debounceRef.current);
    };
  }, [searchQuery]);

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

  // Fetch dashboard KPI settings
  const { data: kpiSettings = DEFAULT_DASHBOARD_KPIS } = useDashboardKpiSettings(companyId);

  // Helper to get KPI value from stats
  const getKpiValue = useCallback((kpi: KpiType, statsData: DashboardStats): number => {
    switch (kpi) {
      case 'verified': return statsData.verified;
      case 'pending': return statsData.pending;
      case 'rejected': return statsData.rejected;
      case 'total': return statsData.total;
      case 'blacklisted': return statsData.blacklisted;
      case 'overdue': return statsData.overdue;
      case 'expired': return statsData.overdue; // expired uses overdue count
      default: return 0;
    }
  }, []);

  // W3: Server-side search for admin dashboard instead of fetching 100 records client-side
  const {
    data: searchData,
    isLoading: searchLoading,
    refetch: refetchSearch,
  } = useVehicles({
    companyId: isContractor ? company?.id : undefined,
    search: !isContractor && debouncedQuery ? debouncedQuery : undefined,
    pageSize: !isContractor && debouncedQuery ? 5 : undefined,
  });

  // Fetch vehicles for contractor list with reduced page size + infinite scroll ready
  const {
    data: vehiclesData,
    isLoading: vehiclesLoading,
    refetch: refetchVehicles,
  } = useVehicles({
    companyId: isContractor ? company?.id : undefined,
    pageSize: isContractor ? 25 : undefined,
  });

  const vehicles = isContractor ? (vehiclesData?.vehicles || []) : [];

  // W3: Use server-side search results directly
  const searchResult = useMemo(() => {
    if (!debouncedQuery || isContractor) return null;
    const results = searchData?.vehicles || [];
    return results.length > 0 ? results[0] : null;
  }, [debouncedQuery, searchData, isContractor]);

  // Combined loading state
  const loading = authLoading || contractorLoading || statsLoading;
  const error = statsError?.message || null;

  // Refresh handler
  const handleRefresh = useCallback(() => {
    refetchStats();
    refetchVehicles();
    if (!isContractor) {
      refetchEquipment();
      if (debouncedQuery) refetchSearch();
    }
  }, [isContractor, refetchStats, refetchVehicles, refetchEquipment, debouncedQuery, refetchSearch]);

  const [refreshing, setRefreshing] = useState(false);
  const onRefresh = useCallback(async () => {
    setRefreshing(true);
    await handleRefresh();
    setRefreshing(false);
  }, [handleRefresh]);

  const displayName = user?.full_name || user?.email?.split('@')[0] || 'User';
  const roleColor = roleColors[user?.role || 'inspector'];

  // Memoize today's date to avoid creating new Date objects on every render
  const today = useMemo(() => new Date(), []);

  if (loading) {
    return (
      <GlassBackground>
        <DashboardSkeleton />
      </GlassBackground>
    );
  }

  const getTypeLabel = (type: string) => {
    const config = EQUIPMENT_TYPES.find(t => t.value === type);
    return config?.label || type;
  };

  // Memoized render function for contractor vehicle list items
  const renderContractorVehicle = useCallback(({ item }: { item: VehicleEquipment }) => {
    const sc = statusColors[item.actual_status] || statusColors.pending;
    const eq = getEquipmentTypeConfig(item.equipment_type);
    const isOverdue = item.next_inspection_date && new Date(item.next_inspection_date) < today;

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
            <StatusBadge status={item.actual_status} />
            {isOverdue && (
              <StatusBadge
                status="inspection_overdue"
                label="Overdue"
                style={{ marginTop: 4 }}
              />
            )}
          </View>
        </View>
      </GlassCard>
    );
  }, [today]);

  // Contractor Dashboard
  if (isContractor) {
    return (
      <GlassBackground>
        <StatusBar barStyle="light-content" backgroundColor="transparent" translucent />
        <View style={styles.container}>
          <View style={[styles.header, { paddingTop: insets.top + 16 }]}>
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

              {/* Equipment List Header */}
              <View style={styles.listHeader}>
                <Text style={styles.listTitle}>Your Equipment</Text>
                <Text style={styles.listCount}>{vehicles.length} items</Text>
              </View>

              {/* Equipment List */}
              <FlatList
                data={vehicles}
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
                  <EmptyState
                    icon="car-off"
                    title="No equipment registered"
                    subtitle="Your company's vehicles and equipment will appear here once added."
                  />
                }
              />
            </>
          )}
        </View>
      </GlassBackground>
    );
  }

  // Get status display config - memoized
  const getStatusDisplay = useCallback((status: string, isBlacklisted: boolean) => {
    if (isBlacklisted) {
      return {
        label: 'BLACKLISTED',
        color: colors.error,
        bgColor: `${colors.error}20`,
        icon: 'cancel',
      };
    }
    switch (status) {
      case 'verified':
        return {
          label: 'VERIFIED',
          color: colors.success,
          bgColor: `${colors.success}20`,
          icon: 'check-circle',
        };
      case 'rejected':
        return {
          label: 'REJECTED',
          color: colors.error,
          bgColor: `${colors.error}20`,
          icon: 'close-circle',
        };
      case 'pending':
      default:
        return {
          label: 'PENDING',
          color: colors.warning,
          bgColor: `${colors.warning}20`,
          icon: 'clock-outline',
        };
    }
  }, []);

  // Admin/Owner/Inspector Dashboard
  return (
    <GlassBackground>
      <StatusBar barStyle="light-content" backgroundColor="transparent" translucent />
      <ScrollView
        contentContainerStyle={[styles.adminList, { paddingTop: insets.top + 16 }]}
        refreshControl={
          <RefreshControl
            refreshing={refreshing}
            onRefresh={onRefresh}
            tintColor={colors.primary}
          />
        }
        showsVerticalScrollIndicator={false}
        keyboardShouldPersistTaps="handled"
      >
        <View style={styles.headerContent}>
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

        {/* Search Bar */}
        <View style={styles.searchContainer}>
          <Searchbar
            placeholder="Search plate number or driver..."
            onChangeText={setSearchQuery}
            value={searchQuery}
            style={styles.search}
            iconColor={colors.textMuted}
            inputStyle={styles.searchInput}
            placeholderTextColor={colors.textMuted}
          />
        </View>

        {/* Search Result - Big Status Card */}
        {debouncedQuery && (
          <View style={styles.searchResultContainer}>
            {searchLoading ? (
              <GlassCard style={styles.statusCard} padding={24}>
                <ActivityIndicator size="large" color={colors.primary} />
                <Text style={styles.searchingText}>Searching...</Text>
              </GlassCard>
            ) : searchResult ? (
              <GlassCard style={styles.statusCard} padding={24}>
                {(() => {
                  const statusDisplay = getStatusDisplay(searchResult.actual_status, searchResult.is_blacklisted);
                  const eq = getEquipmentTypeConfig(searchResult.equipment_type);
                  const isOverdue = searchResult.next_inspection_date && new Date(searchResult.next_inspection_date) < today;
                  return (
                    <>
                      {/* Big Status Icon */}
                      <View style={[styles.bigStatusIcon, { backgroundColor: statusDisplay.bgColor }]}>
                        <MaterialCommunityIcons name={statusDisplay.icon} size={64} color={statusDisplay.color} />
                      </View>

                      {/* Status Label */}
                      <Text style={[styles.bigStatusLabel, { color: statusDisplay.color }]}>
                        {statusDisplay.label}
                      </Text>

                      {/* Vehicle Info */}
                      <View style={styles.vehicleInfoCard}>
                        <Text style={styles.plateNumber}>{searchResult.plate_number}</Text>
                        <View style={styles.vehicleDetails}>
                          <MaterialCommunityIcons name={eq.icon} size={16} color={colors.textMuted} />
                          <Text style={styles.vehicleDetailText}>
                            {eq.label} - {getCategoryDisplay(searchResult.equipment_category)}
                          </Text>
                        </View>
                        {searchResult.driver_name && (
                          <View style={styles.vehicleDetails}>
                            <MaterialCommunityIcons name="account" size={16} color={colors.textMuted} />
                            <Text style={styles.vehicleDetailText}>{searchResult.driver_name}</Text>
                          </View>
                        )}
                        {searchResult.client_company && (
                          <View style={styles.vehicleDetails}>
                            <MaterialCommunityIcons name="domain" size={16} color={colors.textMuted} />
                            <Text style={styles.vehicleDetailText}>{searchResult.client_company}</Text>
                          </View>
                        )}
                      </View>

                      {/* Additional Status Indicators */}
                      {isOverdue && (
                        <View style={[styles.warningBadge, { backgroundColor: `${colors.error}15` }]}>
                          <MaterialCommunityIcons name="calendar-alert" size={16} color={colors.error} />
                          <Text style={[styles.warningText, { color: colors.error }]}>Inspection Overdue</Text>
                        </View>
                      )}

                      {searchResult.reason_for_rejection && searchResult.actual_status === 'rejected' && (
                        <View style={styles.rejectionReason}>
                          <Text style={styles.rejectionLabel}>Rejection Reason:</Text>
                          <Text style={styles.rejectionText}>{searchResult.reason_for_rejection}</Text>
                        </View>
                      )}
                    </>
                  );
                })()}
              </GlassCard>
            ) : (
              <GlassCard style={styles.statusCard} padding={24}>
                <MaterialCommunityIcons name="car-off" size={48} color={colors.textMuted} />
                <Text style={styles.notFoundText}>No vehicle found</Text>
                <Text style={styles.notFoundHint}>Try searching by plate number or driver name</Text>
              </GlassCard>
            )}
          </View>
        )}

        {error ? (
          <GlassCard variant="error" style={styles.errorCard} padding={20}>
            <MaterialCommunityIcons name="alert-circle" size={32} color={colors.error} />
            <Text style={styles.errorText}>{error}</Text>
            <TouchableOpacity onPress={handleRefresh} style={styles.retryBtn} accessibilityRole="button" accessibilityLabel="Retry loading data">
              <Text style={styles.retryText}>Tap to Retry</Text>
            </TouchableOpacity>
          </GlassCard>
        ) : !debouncedQuery && (
          <>
            {/* Main Stats Grid - 2x2 configurable KPIs */}
            <View style={styles.statsGrid}>
              {kpiSettings.slice(0, 4).map((kpi) => {
                const config = KPI_CONFIG[kpi];
                return (
                  <StatCard
                    key={kpi}
                    title={config.label}
                    value={getKpiValue(kpi, stats)}
                    icon={config.icon}
                    color={config.color}
                  />
                );
              })}
            </View>

            {/* Top Equipment Types */}
            {topEquipment.length > 0 && (
              <GlassCard style={styles.chartCard} padding={16}>
                <Text style={styles.sectionTitle}>Top Equipment Types</Text>
                {topEquipment.map((item) => (
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
      </ScrollView>
    </GlassBackground>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1 },
  loading: { flex: 1, justifyContent: 'center', alignItems: 'center' },
  loadingText: { color: colors.textMuted, marginTop: 12, fontSize: 14 },
  header: { paddingHorizontal: 16, paddingBottom: 12 },
  headerContent: { paddingHorizontal: 0, paddingBottom: 12 },
  greeting: { color: colors.textSecondary, fontSize: 14 },
  name: { color: colors.textPrimary, fontSize: 26, fontWeight: 'bold', marginBottom: 8 },
  roleBadge: { flexDirection: 'row', alignItems: 'center', paddingHorizontal: 12, paddingVertical: 6, borderRadius: 16, alignSelf: 'flex-start', gap: 6 },
  roleText: { fontWeight: '600', fontSize: 13 },

  // Search Bar
  searchContainer: { marginBottom: 16 },
  search: {
    backgroundColor: glass.background.card,
    borderRadius: glass.border.radius.md,
    borderWidth: 1,
    borderColor: glass.border.color,
  },
  searchInput: { color: colors.textPrimary },

  // Search Result - Big Status Card
  searchResultContainer: { marginBottom: 16 },
  statusCard: { alignItems: 'center' },
  bigStatusIcon: {
    width: 120,
    height: 120,
    borderRadius: 60,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 16,
  },
  bigStatusLabel: {
    fontSize: 28,
    fontWeight: 'bold',
    letterSpacing: 2,
    marginBottom: 20,
  },
  vehicleInfoCard: {
    width: '100%',
    backgroundColor: glass.background.card,
    borderRadius: glass.border.radius.md,
    padding: 16,
    alignItems: 'center',
  },
  plateNumber: {
    color: colors.textPrimary,
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 12,
  },
  vehicleDetails: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    marginTop: 6,
  },
  vehicleDetailText: {
    color: colors.textSecondary,
    fontSize: 14,
  },
  warningBadge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    paddingHorizontal: 16,
    paddingVertical: 10,
    borderRadius: 12,
    marginTop: 16,
  },
  warningText: {
    fontSize: 14,
    fontWeight: '600',
  },
  rejectionReason: {
    marginTop: 16,
    padding: 12,
    backgroundColor: `${colors.error}10`,
    borderRadius: 8,
    width: '100%',
  },
  rejectionLabel: {
    color: colors.error,
    fontSize: 12,
    fontWeight: '600',
    marginBottom: 4,
  },
  rejectionText: {
    color: colors.textSecondary,
    fontSize: 13,
  },
  searchingText: {
    color: colors.textMuted,
    marginTop: 12,
    fontSize: 14,
  },
  notFoundText: {
    color: colors.textPrimary,
    fontSize: 18,
    fontWeight: '600',
    marginTop: 12,
  },
  notFoundHint: {
    color: colors.textMuted,
    fontSize: 13,
    marginTop: 4,
  },

  // Stats Grid
  statsGrid: { flexDirection: 'row', flexWrap: 'wrap', marginHorizontal: 10, marginBottom: 8 },

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
  adminList: { padding: 16, paddingBottom: 120 },

  // Vehicle Card (for contractor view)
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
});
