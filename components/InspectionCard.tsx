import React from 'react';
import { StyleSheet } from 'react-native';
import { Card, Text, Chip } from 'react-native-paper';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import { getVehicleTypeConfig, VehicleType } from '../lib/supabase';

interface InspectionCardProps {
  inspection: {
    id: string;
    vehicle?: {
      name: string;
      plate_number: string;
      vehicle_type?: VehicleType;
    };
    scheduled_date: string;
    status: 'pending' | 'pass' | 'fail';
    inspector?: { full_name: string };
  };
  onPress: () => void;
}

const statusConfig = {
  pending: { color: '#FF9800', icon: 'clock-outline', label: 'Pending' },
  pass: { color: '#4CAF50', icon: 'check-circle', label: 'Pass' },
  fail: { color: '#F44336', icon: 'close-circle', label: 'Fail' },
};

export default function InspectionCard({ inspection, onPress }: InspectionCardProps) {
  const config = statusConfig[inspection.status];
  const formattedDate = new Date(inspection.scheduled_date).toLocaleDateString();
  const vehicleTypeConfig = getVehicleTypeConfig(inspection.vehicle?.vehicle_type || 'other');

  return (
    <Card style={styles.card} onPress={onPress}>
      <Card.Content style={styles.content}>
        <MaterialCommunityIcons
          name={vehicleTypeConfig.icon as any}
          size={40}
          color="#6200EE"
          style={styles.icon}
        />
        <Text variant="titleMedium" style={styles.vehicleName} numberOfLines={1}>
          {inspection.vehicle?.name || 'Unknown Vehicle'}
        </Text>
        <Text variant="bodySmall" style={styles.plateNumber}>
          {inspection.vehicle?.plate_number || 'N/A'}
        </Text>
        <Text variant="bodySmall" style={styles.vehicleType}>
          {vehicleTypeConfig.label}
        </Text>
        <Text variant="bodySmall" style={styles.date}>
          {formattedDate}
        </Text>
        <Chip
          mode="flat"
          style={[styles.chip, { backgroundColor: `${config.color}20` }]}
          textStyle={{ color: config.color, fontSize: 12 }}
          icon={() => (
            <MaterialCommunityIcons name={config.icon as any} size={16} color={config.color} />
          )}
        >
          {config.label}
        </Chip>
        {inspection.inspector && (
          <Text variant="bodySmall" style={styles.inspector} numberOfLines={1}>
            By: {inspection.inspector.full_name}
          </Text>
        )}
      </Card.Content>
    </Card>
  );
}

const styles = StyleSheet.create({
  card: {
    margin: 8,
    backgroundColor: '#FFFFFF',
    width: 160,
  },
  content: {
    alignItems: 'center',
    paddingVertical: 12,
  },
  icon: {
    marginBottom: 8,
  },
  vehicleName: {
    fontWeight: 'bold',
    textAlign: 'center',
  },
  plateNumber: {
    color: '#666',
    marginTop: 2,
  },
  vehicleType: {
    color: '#6200EE',
    fontSize: 10,
    marginTop: 2,
  },
  date: {
    color: '#999',
    marginTop: 4,
  },
  chip: {
    marginTop: 8,
  },
  inspector: {
    color: '#999',
    marginTop: 8,
    fontSize: 10,
  },
});
