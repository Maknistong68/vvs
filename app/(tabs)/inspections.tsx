import React, { useState, useEffect, useCallback } from 'react';
import {
  View,
  StyleSheet,
  FlatList,
  RefreshControl,
} from 'react-native';
import {
  Text,
  FAB,
  Chip,
  Searchbar,
  ActivityIndicator,
  Card,
  SegmentedButtons,
} from 'react-native-paper';
import { useRouter } from 'expo-router';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { supabase, Inspection, InspectionStatus } from '../../lib/supabase';

const statusConfig = {
  pending: { color: '#FF9800', icon: 'clock-outline', label: 'Pending' },
  pass: { color: '#4CAF50', icon: 'check-circle', label: 'Pass' },
  fail: { color: '#F44336', icon: 'close-circle', label: 'Fail' },
};

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
        .select(`
          *,
          vehicle:vehicles(*),
          inspector:users!inspections_inspector_id_fkey(*),
          failure_reason:failure_reasons(*)
        `)
        .order('scheduled_date', { ascending: false });

      if (error) throw error;
      setInspections(data || []);
      setFilteredInspections(data || []);
    } catch (error) {
      console.error('Error fetching inspections:', error);
    } finally {
      setLoading(false);
      setRefreshing(false);
    }
  }, []);

  useEffect(() => {
    fetchInspections();
  }, [fetchInspections]);

  useEffect(() => {
    let filtered = inspections;

    // Apply status filter
    if (statusFilter !== 'all') {
      filtered = filtered.filter((i) => i.status === statusFilter);
    }

    // Apply search filter
    if (searchQuery) {
      const query = searchQuery.toLowerCase();
      filtered = filtered.filter(
        (i) =>
          i.vehicle?.name?.toLowerCase().includes(query) ||
          i.vehicle?.plate_number?.toLowerCase().includes(query) ||
          i.inspector?.full_name?.toLowerCase().includes(query)
      );
    }

    setFilteredInspections(filtered);
  }, [inspections, statusFilter, searchQuery]);

  const onRefresh = useCallback(() => {
    setRefreshing(true);
    fetchInspections();
  }, [fetchInspections]);

  const handleInspectionPress = (id: string) => {
    router.push(`/inspection/${id}`);
  };

  const handleAddInspection = () => {
    router.push('/inspection/new');
  };

  const renderInspectionItem = ({ item }: { item: Inspection }) => {
    const config = statusConfig[item.status];
    const formattedDate = new Date(item.scheduled_date).toLocaleDateString();

    return (
      <Card
        style={styles.card}
        onPress={() => handleInspectionPress(item.id)}
      >
        <Card.Content style={styles.cardContent}>
          <View style={styles.cardLeft}>
            <MaterialCommunityIcons name="car" size={32} color="#6200EE" />
          </View>
          <View style={styles.cardCenter}>
            <Text variant="titleMedium" style={styles.vehicleName}>
              {item.vehicle?.name || 'Unknown Vehicle'}
            </Text>
            <Text variant="bodySmall" style={styles.plateNumber}>
              {item.vehicle?.plate_number || 'N/A'}
            </Text>
            <Text variant="bodySmall" style={styles.date}>
              Scheduled: {formattedDate}
            </Text>
            <Text variant="bodySmall" style={styles.inspector}>
              Inspector: {item.inspector?.full_name || 'N/A'}
            </Text>
          </View>
          <View style={styles.cardRight}>
            <Chip
              mode="flat"
              style={[styles.statusChip, { backgroundColor: `${config.color}20` }]}
              textStyle={{ color: config.color, fontSize: 11 }}
              icon={() => (
                <MaterialCommunityIcons
                  name={config.icon}
                  size={14}
                  color={config.color}
                />
              )}
            >
              {config.label}
            </Chip>
          </View>
        </Card.Content>
        {item.status === 'fail' && item.failure_reason && (
          <Card.Content style={styles.failureContent}>
            <Text variant="bodySmall" style={styles.failureText}>
              Reason: {item.failure_reason.reason_text}
            </Text>
          </Card.Content>
        )}
      </Card>
    );
  };

  if (loading) {
    return (
      <View style={styles.loadingContainer}>
        <ActivityIndicator size="large" color="#6200EE" />
      </View>
    );
  }

  return (
    <View style={styles.container}>
      {/* Search Bar */}
      <Searchbar
        placeholder="Search by vehicle or inspector..."
        onChangeText={setSearchQuery}
        value={searchQuery}
        style={styles.searchbar}
      />

      {/* Status Filter */}
      <SegmentedButtons
        value={statusFilter}
        onValueChange={setStatusFilter}
        buttons={[
          { value: 'all', label: 'All' },
          { value: 'pending', label: 'Pending' },
          { value: 'pass', label: 'Pass' },
          { value: 'fail', label: 'Fail' },
        ]}
        style={styles.filterButtons}
      />

      {/* Inspections List */}
      <FlatList
        data={filteredInspections}
        keyExtractor={(item) => item.id}
        renderItem={renderInspectionItem}
        contentContainerStyle={styles.listContent}
        refreshControl={
          <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
        }
        ListEmptyComponent={
          <View style={styles.emptyContainer}>
            <MaterialCommunityIcons
              name="clipboard-text-off"
              size={64}
              color="#ccc"
            />
            <Text variant="bodyLarge" style={styles.emptyText}>
              No inspections found
            </Text>
          </View>
        }
      />

      {/* FAB to add new inspection */}
      <FAB
        icon="plus"
        style={styles.fab}
        onPress={handleAddInspection}
        color="#FFFFFF"
      />
    </View>
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
  },
  searchbar: {
    margin: 16,
    marginBottom: 8,
    elevation: 2,
  },
  filterButtons: {
    marginHorizontal: 16,
    marginBottom: 8,
  },
  listContent: {
    padding: 8,
    paddingBottom: 80,
  },
  card: {
    marginHorizontal: 8,
    marginVertical: 4,
    backgroundColor: '#FFFFFF',
  },
  cardContent: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  cardLeft: {
    marginRight: 12,
  },
  cardCenter: {
    flex: 1,
  },
  cardRight: {
    marginLeft: 8,
  },
  vehicleName: {
    fontWeight: 'bold',
  },
  plateNumber: {
    color: '#666',
    marginTop: 2,
  },
  date: {
    color: '#999',
    marginTop: 2,
  },
  inspector: {
    color: '#999',
    marginTop: 2,
  },
  statusChip: {
    height: 28,
  },
  failureContent: {
    paddingTop: 0,
    borderTopWidth: 1,
    borderTopColor: '#f0f0f0',
    marginTop: 8,
  },
  failureText: {
    color: '#F44336',
    fontStyle: 'italic',
  },
  emptyContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingVertical: 64,
  },
  emptyText: {
    color: '#999',
    marginTop: 16,
  },
  fab: {
    position: 'absolute',
    margin: 16,
    right: 0,
    bottom: 0,
    backgroundColor: '#6200EE',
  },
});
