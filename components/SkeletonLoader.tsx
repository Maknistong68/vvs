// Skeleton Loader Components
// Provides placeholder loading UI for better perceived performance

import React, { memo, useEffect, useRef } from 'react';
import { View, StyleSheet, Animated, ViewStyle, Dimensions, DimensionValue } from 'react-native';
import { colors, glass } from '../lib/theme';

const { width: SCREEN_WIDTH } = Dimensions.get('window');

interface SkeletonProps {
  width?: DimensionValue;
  height?: number;
  borderRadius?: number;
  style?: ViewStyle;
}

// Base skeleton element with shimmer animation
function SkeletonBase({ width = '100%', height = 20, borderRadius = 4, style }: SkeletonProps) {
  const shimmerAnim = useRef(new Animated.Value(0)).current;

  useEffect(() => {
    const animation = Animated.loop(
      Animated.sequence([
        Animated.timing(shimmerAnim, {
          toValue: 1,
          duration: 1000,
          useNativeDriver: true,
        }),
        Animated.timing(shimmerAnim, {
          toValue: 0,
          duration: 1000,
          useNativeDriver: true,
        }),
      ])
    );
    animation.start();
    return () => animation.stop();
  }, [shimmerAnim]);

  const opacity = shimmerAnim.interpolate({
    inputRange: [0, 1],
    outputRange: [0.3, 0.7],
  });

  return (
    <Animated.View
      style={[
        styles.skeleton,
        {
          width,
          height,
          borderRadius,
          opacity,
        } as ViewStyle,
        style,
      ]}
    />
  );
}

export const Skeleton = memo(SkeletonBase);

// Skeleton for stat cards (dashboard)
function StatCardSkeletonBase() {
  return (
    <View style={styles.statCard}>
      <View style={styles.statCardInner}>
        <Skeleton width={48} height={48} borderRadius={24} style={styles.statIcon} />
        <Skeleton width={60} height={28} style={styles.statValue} />
        <Skeleton width={50} height={12} style={styles.statTitle} />
      </View>
    </View>
  );
}

export const StatCardSkeleton = memo(StatCardSkeletonBase);

// Skeleton for vehicle list item
function VehicleCardSkeletonBase() {
  return (
    <View style={styles.vehicleCard}>
      <View style={styles.vehicleRow}>
        <Skeleton width={44} height={44} borderRadius={22} />
        <View style={styles.vehicleInfo}>
          <Skeleton width={100} height={16} style={styles.mb4} />
          <Skeleton width={150} height={12} style={styles.mb4} />
          <Skeleton width={80} height={10} />
        </View>
        <View>
          <Skeleton width={70} height={24} borderRadius={8} />
        </View>
      </View>
    </View>
  );
}

export const VehicleCardSkeleton = memo(VehicleCardSkeletonBase);

// Skeleton for dashboard stats grid
function DashboardStatsSkeletonBase() {
  return (
    <View style={styles.statsGrid}>
      <StatCardSkeleton />
      <StatCardSkeleton />
      <StatCardSkeleton />
      <StatCardSkeleton />
    </View>
  );
}

export const DashboardStatsSkeleton = memo(DashboardStatsSkeletonBase);

// Skeleton for vehicle list
interface VehicleListSkeletonProps {
  count?: number;
}

function VehicleListSkeletonBase({ count = 5 }: VehicleListSkeletonProps) {
  return (
    <View style={styles.vehicleList}>
      {Array.from({ length: count }).map((_, index) => (
        <VehicleCardSkeleton key={index} />
      ))}
    </View>
  );
}

export const VehicleListSkeleton = memo(VehicleListSkeletonBase);

// Full dashboard skeleton
function DashboardSkeletonBase() {
  return (
    <View style={styles.dashboard}>
      {/* Header skeleton */}
      <View style={styles.header}>
        <Skeleton width={120} height={14} style={styles.mb4} />
        <Skeleton width={180} height={26} style={styles.mb8} />
        <Skeleton width={100} height={28} borderRadius={14} />
      </View>

      {/* Stats grid skeleton */}
      <DashboardStatsSkeleton />

      {/* Search bar skeleton */}
      <View style={styles.searchContainer}>
        <Skeleton width="100%" height={48} borderRadius={12} />
      </View>

      {/* List header skeleton */}
      <View style={styles.listHeader}>
        <Skeleton width={120} height={18} />
        <Skeleton width={60} height={13} />
      </View>

      {/* Vehicle list skeleton */}
      <VehicleListSkeleton count={4} />
    </View>
  );
}

export const DashboardSkeleton = memo(DashboardSkeletonBase);

// Admin tab list skeleton
function AdminListSkeletonBase({ count = 6 }: { count?: number }) {
  return (
    <View style={styles.adminList}>
      {Array.from({ length: count }).map((_, index) => (
        <View key={index} style={styles.adminItem}>
          <Skeleton width={40} height={40} borderRadius={8} />
          <View style={styles.adminItemText}>
            <Skeleton width={150} height={16} style={styles.mb4} />
            <Skeleton width={100} height={12} />
          </View>
          <Skeleton width={24} height={24} borderRadius={12} />
        </View>
      ))}
    </View>
  );
}

export const AdminListSkeleton = memo(AdminListSkeletonBase);

// Profile/Settings skeleton
function ProfileSkeletonBase() {
  return (
    <View style={styles.profile}>
      {/* Avatar */}
      <View style={styles.profileHeader}>
        <Skeleton width={100} height={100} borderRadius={50} />
        <Skeleton width={150} height={24} style={styles.mt16mb4} />
        <Skeleton width={200} height={14} />
      </View>

      {/* Info cards */}
      <View style={styles.profileCard}>
        <Skeleton width={120} height={18} style={styles.mb12} />
        <Skeleton width="100%" height={16} style={styles.mb8} />
        <Skeleton width="80%" height={16} style={styles.mb8} />
        <Skeleton width="60%" height={16} />
      </View>

      <View style={styles.profileCard}>
        <Skeleton width={120} height={18} style={styles.mb12} />
        <Skeleton width="100%" height={16} style={styles.mb8} />
        <Skeleton width="70%" height={16} />
      </View>
    </View>
  );
}

export const ProfileSkeleton = memo(ProfileSkeletonBase);

const styles = StyleSheet.create({
  skeleton: {
    backgroundColor: 'rgba(255, 255, 255, 0.1)',
  },

  // Stat Card
  statCard: {
    flex: 1,
    margin: 6,
    minHeight: 110,
    borderRadius: glass.border.radius.md,
    borderWidth: glass.border.width,
    borderColor: glass.border.color,
    backgroundColor: glass.background.card,
    overflow: 'hidden',
  },
  statCardInner: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    padding: 14,
  },
  statIcon: {
    marginBottom: 8,
  },
  statValue: {
    marginBottom: 4,
  },
  statTitle: {},

  // Vehicle Card
  vehicleCard: {
    margin: 6,
    padding: 14,
    borderRadius: glass.border.radius.md,
    borderWidth: glass.border.width,
    borderColor: glass.border.color,
    backgroundColor: glass.background.card,
  },
  vehicleRow: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  vehicleInfo: {
    flex: 1,
    marginLeft: 12,
  },

  // Stats Grid
  statsGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    marginHorizontal: 10,
    marginBottom: 8,
  },

  // Vehicle List
  vehicleList: {
    paddingHorizontal: 10,
  },

  // Dashboard
  dashboard: {
    flex: 1,
    paddingTop: 50,
  },
  header: {
    paddingHorizontal: 16,
    paddingBottom: 12,
  },
  searchContainer: {
    paddingHorizontal: 16,
    marginBottom: 12,
  },
  listHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: 16,
    marginBottom: 8,
  },

  // Admin List
  adminList: {
    paddingHorizontal: 10,
  },
  adminItem: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: 12,
    margin: 6,
    borderRadius: glass.border.radius.md,
    borderWidth: glass.border.width,
    borderColor: glass.border.color,
    backgroundColor: glass.background.card,
  },
  adminItemText: {
    flex: 1,
    marginLeft: 12,
  },

  // Profile
  profile: {
    padding: 16,
    paddingTop: 50,
  },
  profileHeader: {
    alignItems: 'center',
    marginBottom: 24,
  },
  profileCard: {
    padding: 16,
    marginBottom: 16,
    borderRadius: glass.border.radius.md,
    borderWidth: glass.border.width,
    borderColor: glass.border.color,
    backgroundColor: glass.background.card,
  },

  // Spacing helpers
  mb4: { marginBottom: 4 },
  mb8: { marginBottom: 8 },
  mb12: { marginBottom: 12 },
  mt16: { marginTop: 16 },
  mt16mb4: { marginTop: 16, marginBottom: 4 },
});

export default {
  Skeleton,
  StatCardSkeleton,
  VehicleCardSkeleton,
  DashboardStatsSkeleton,
  VehicleListSkeleton,
  DashboardSkeleton,
  AdminListSkeleton,
  ProfileSkeleton,
};
