import React, { useState, useEffect, useCallback } from 'react';
import {
  View,
  StyleSheet,
  ScrollView,
  RefreshControl,
  Dimensions,
  FlatList,
} from 'react-native';
import { Text, ActivityIndicator, Chip } from 'react-native-paper';
import { useRouter } from 'expo-router';
import { BarChart } from 'react-native-chart-kit';
import {
  supabase,
  InspectionStats,
  FailureReasonStat,
  Inspection,
  getVehicleTypeConfig,
} from '../../lib/supabase';
import { useAuth } from '../../lib/auth';
import StatCard from '../../components/StatCard';
import InspectionCard from '../../components/InspectionCard';

const screenWidth = Dimensions.get('window').width;

export default function DashboardScreen() {
  const router = useRouter();
  const { user, company } = useAuth();
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);
  const [stats, setStats] = useState<InspectionStats>({
    total: 0,
    pending: 0,
    pass: 0,
    fail: 0,
  });
  const [recentInspections, setRecentInspections] = useState<Inspection[]>([]);
  const [failureStats, setFailureStats] = useState<FailureReasonStat[]>([]);

  const fetchData = useCallback(async () => {
    try {
      // Fetch inspection stats
      const { data: statsData } = await supabase.rpc('get_inspection_stats');
      if (statsData) {
        setStats(statsData);
      }

      // Fetch failure reason stats
      const { data: failureData } = await supabase.rpc('get_failure_reason_stats');
      if (failureData) {
        setFailureStats(failureData);
      }

      // Fetch recent inspections
      const { data: inspectionsData } = await supabase
        .from('inspections')
        .select(
          `
          *,
          vehicle:vehicles(*),
          inspector:users!inspections_inspector_id_fkey(*)
        `
        )
        .order('created_at', { ascending: false })
        .limit(10);

      if (inspectionsData) {
        setRecentInspections(inspectionsData);
      }
    } catch (error) {
      console.error('Error fetching dashboard data:', error);
    } finally {
      setLoading(false);
      setRefreshing(false);
    }
  }, []);

  useEffect(() => {
    fetchData();
  }, [fetchData]);

  const onRefresh = useCallback(() => {
    setRefreshing(true);
    fetchData();
  }, [fetchData]);

  const handleInspectionPress = (id: string) => {
    router.push(`/inspection/${id}`);
  };

  // Prepare chart data
  const chartData = {
    labels: failureStats.slice(0, 5).map((item) =>
      item.reason_text.length > 10 ? item.reason_text.substring(0, 10) + '...' : item.reason_text
    ),
    datasets: [
      {
        data:
          failureStats.length > 0
            ? failureStats.slice(0, 5).map((item) => item.count || 0)
            : [0],
      },
    ],
  };

  if (loading) {
    return (
      <View style={styles.loadingContainer}>
        <ActivityIndicator size="large" color="#6200EE" />
      </View>
    );
  }

  return (
    <ScrollView
      style={styles.container}
      refreshControl={<RefreshControl refreshing={refreshing} onRefresh={onRefresh} />}
    >
      {/* Welcome Message */}
      <View style={styles.welcomeContainer}>
        <Text variant="headlineSmall" style={styles.welcomeText}>
          Welcome, {user?.full_name || 'User'}!
        </Text>
        <View style={styles.metaRow}>
          <Chip
            mode="flat"
            style={styles.roleChip}
            textStyle={styles.chipText}
            icon={
              user?.role === 'owner'
                ? 'crown'
                : user?.role === 'admin'
                ? 'shield-account'
                : 'clipboard-check'
            }
          >
            {(user?.role || 'inspector').charAt(0).toUpperCase() + (user?.role || 'inspector').slice(1)}
          </Chip>
          {company && (
            <Chip mode="flat" style={styles.companyChip} textStyle={styles.chipText} icon="domain">
              {company.name}
            </Chip>
          )}
        </View>
      </View>

      {/* Stats Cards */}
      <Text variant="titleMedium" style={styles.sectionTitle}>
        Inspection Summary
      </Text>
      <View style={styles.statsContainer}>
        <View style={styles.statsRow}>
          <StatCard title="Total" value={stats.total} icon="clipboard-list" color="#6200EE" />
          <StatCard title="Pending" value={stats.pending} icon="clock-outline" color="#FF9800" />
        </View>
        <View style={styles.statsRow}>
          <StatCard title="Passed" value={stats.pass} icon="check-circle" color="#4CAF50" />
          <StatCard title="Failed" value={stats.fail} icon="close-circle" color="#F44336" />
        </View>
      </View>

      {/* Failure Reasons Chart */}
      {failureStats.length > 0 && (
        <>
          <Text variant="titleMedium" style={styles.sectionTitle}>
            Top Failure Reasons
          </Text>
          <View style={styles.chartContainer}>
            <BarChart
              data={chartData}
              width={screenWidth - 32}
              height={220}
              yAxisLabel=""
              yAxisSuffix=""
              chartConfig={{
                backgroundColor: '#FFFFFF',
                backgroundGradientFrom: '#FFFFFF',
                backgroundGradientTo: '#FFFFFF',
                decimalPlaces: 0,
                color: (opacity = 1) => `rgba(98, 0, 238, ${opacity})`,
                labelColor: (opacity = 1) => `rgba(0, 0, 0, ${opacity})`,
                style: {
                  borderRadius: 16,
                },
                barPercentage: 0.7,
              }}
              style={styles.chart}
              showValuesOnTopOfBars
              fromZero
            />
          </View>
        </>
      )}

      {/* Recent Inspections */}
      <Text variant="titleMedium" style={styles.sectionTitle}>
        Recent Inspections
      </Text>
      {recentInspections.length > 0 ? (
        <FlatList
          data={recentInspections}
          horizontal
          showsHorizontalScrollIndicator={false}
          keyExtractor={(item) => item.id}
          renderItem={({ item }) => (
            <InspectionCard inspection={item} onPress={() => handleInspectionPress(item.id)} />
          )}
          contentContainerStyle={styles.inspectionsList}
          scrollEnabled={false}
        />
      ) : (
        <View style={styles.emptyContainer}>
          <Text variant="bodyMedium" style={styles.emptyText}>
            No inspections yet
          </Text>
        </View>
      )}

      <View style={styles.bottomPadding} />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f5f5f5',
  },
  welcomeContainer: {
    padding: 16,
    backgroundColor: '#6200EE',
  },
  welcomeText: {
    color: '#FFFFFF',
    fontWeight: 'bold',
  },
  metaRow: {
    flexDirection: 'row',
    marginTop: 8,
    flexWrap: 'wrap',
    gap: 8,
  },
  roleChip: {
    backgroundColor: 'rgba(255,255,255,0.2)',
  },
  companyChip: {
    backgroundColor: 'rgba(255,255,255,0.2)',
  },
  chipText: {
    color: '#FFFFFF',
    fontSize: 12,
  },
  sectionTitle: {
    marginHorizontal: 16,
    marginTop: 20,
    marginBottom: 12,
    fontWeight: 'bold',
    color: '#333',
  },
  statsContainer: {
    paddingHorizontal: 12,
  },
  statsRow: {
    flexDirection: 'row',
  },
  chartContainer: {
    marginHorizontal: 16,
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 8,
    elevation: 2,
  },
  chart: {
    borderRadius: 12,
  },
  inspectionsList: {
    paddingHorizontal: 8,
  },
  emptyContainer: {
    padding: 32,
    alignItems: 'center',
  },
  emptyText: {
    color: '#999',
  },
  bottomPadding: {
    height: 20,
  },
});
