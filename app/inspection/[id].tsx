import React, { useState, useEffect, useCallback } from 'react';
import { View, StyleSheet, ScrollView, Alert, Platform } from 'react-native';
import {
  Text,
  TextInput,
  Button,
  ActivityIndicator,
  SegmentedButtons,
  Surface,
  Menu,
  Divider,
} from 'react-native-paper';
import { useLocalSearchParams, useRouter, Stack } from 'expo-router';
import DateTimePicker from '@react-native-community/datetimepicker';
import {
  supabase,
  Vehicle,
  FailureReason,
  Inspection,
  InspectionStatus,
  getVehicleTypeConfig,
} from '../../lib/supabase';
import { useAuth, useCanManageInspections } from '../../lib/auth';

export default function InspectionDetailScreen() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const router = useRouter();
  const { user, company } = useAuth();
  const canManageAll = useCanManageInspections();

  const isNew = id === 'new';

  const [loading, setLoading] = useState(!isNew);
  const [saving, setSaving] = useState(false);
  const [vehicles, setVehicles] = useState<Vehicle[]>([]);
  const [failureReasons, setFailureReasons] = useState<FailureReason[]>([]);

  // Form state
  const [selectedVehicle, setSelectedVehicle] = useState<Vehicle | null>(null);
  const [scheduledDate, setScheduledDate] = useState(new Date());
  const [status, setStatus] = useState<InspectionStatus>('pending');
  const [selectedFailureReason, setSelectedFailureReason] = useState<FailureReason | null>(null);
  const [odometerReading, setOdometerReading] = useState('');
  const [notes, setNotes] = useState('');

  // Dropdown menus
  const [vehicleMenuVisible, setVehicleMenuVisible] = useState(false);
  const [failureMenuVisible, setFailureMenuVisible] = useState(false);
  const [showDatePicker, setShowDatePicker] = useState(false);

  // Original inspection data for edit mode
  const [originalInspection, setOriginalInspection] = useState<Inspection | null>(null);

  const fetchDropdownData = useCallback(async () => {
    try {
      const [vehiclesRes, reasonsRes] = await Promise.all([
        supabase.from('vehicles').select('*').eq('is_active', true).order('name'),
        supabase.from('failure_reasons').select('*').eq('is_active', true).order('reason_text'),
      ]);

      if (vehiclesRes.data) setVehicles(vehiclesRes.data);
      if (reasonsRes.data) setFailureReasons(reasonsRes.data);
    } catch (error) {
      console.error('Error fetching dropdown data:', error);
    }
  }, []);

  const fetchInspection = useCallback(async () => {
    if (isNew) return;

    try {
      const { data, error } = await supabase
        .from('inspections')
        .select(
          `
          *,
          vehicle:vehicles(*),
          failure_reason:failure_reasons(*)
        `
        )
        .eq('id', id)
        .single();

      if (error) throw error;

      if (data) {
        setOriginalInspection(data);
        setSelectedVehicle(data.vehicle || null);
        setScheduledDate(new Date(data.scheduled_date));
        setStatus(data.status);
        setSelectedFailureReason(data.failure_reason || null);
        setOdometerReading(data.odometer_reading?.toString() || '');
        setNotes(data.notes || '');
      }
    } catch (error) {
      console.error('Error fetching inspection:', error);
      Alert.alert('Error', 'Failed to load inspection');
      router.back();
    } finally {
      setLoading(false);
    }
  }, [id, isNew, router]);

  useEffect(() => {
    fetchDropdownData();
    fetchInspection();
  }, [fetchDropdownData, fetchInspection]);

  const canEdit = () => {
    if (canManageAll) return true;
    if (isNew) return true;
    if (originalInspection?.inspector_id === user?.id) return true;
    return false;
  };

  const validateForm = () => {
    if (!selectedVehicle) {
      Alert.alert('Validation Error', 'Please select a vehicle');
      return false;
    }
    if (status === 'fail' && !selectedFailureReason) {
      Alert.alert('Validation Error', 'Please select a failure reason');
      return false;
    }
    return true;
  };

  const handleSave = async () => {
    if (!validateForm()) return;
    if (!canEdit()) {
      Alert.alert('Permission Denied', 'You do not have permission to edit this inspection');
      return;
    }

    setSaving(true);

    try {
      const inspectionData = {
        vehicle_id: selectedVehicle!.id,
        scheduled_date: scheduledDate.toISOString().split('T')[0],
        status,
        failure_reason_id: status === 'fail' ? selectedFailureReason?.id : null,
        odometer_reading: odometerReading ? parseInt(odometerReading) : null,
        notes: notes || null,
        completed_at: status !== 'pending' ? new Date().toISOString() : null,
      };

      if (isNew) {
        const { error } = await supabase.from('inspections').insert({
          ...inspectionData,
          company_id: company!.id,
          inspector_id: user!.id,
        });

        if (error) throw error;
        Alert.alert('Success', 'Inspection created successfully');
      } else {
        const { error } = await supabase.from('inspections').update(inspectionData).eq('id', id);

        if (error) throw error;
        Alert.alert('Success', 'Inspection updated successfully');
      }

      router.back();
    } catch (error: any) {
      console.error('Error saving inspection:', error);
      Alert.alert('Error', error.message || 'Failed to save inspection');
    } finally {
      setSaving(false);
    }
  };

  const handleDelete = async () => {
    if (!canManageAll) {
      Alert.alert('Permission Denied', 'Only admins can delete inspections');
      return;
    }

    Alert.alert('Confirm Delete', 'Are you sure you want to delete this inspection?', [
      { text: 'Cancel', style: 'cancel' },
      {
        text: 'Delete',
        style: 'destructive',
        onPress: async () => {
          try {
            const { error } = await supabase.from('inspections').delete().eq('id', id);

            if (error) throw error;
            Alert.alert('Success', 'Inspection deleted');
            router.back();
          } catch (error: any) {
            Alert.alert('Error', error.message || 'Failed to delete');
          }
        },
      },
    ]);
  };

  const onDateChange = (event: any, selectedDate?: Date) => {
    setShowDatePicker(Platform.OS === 'ios');
    if (selectedDate) {
      setScheduledDate(selectedDate);
    }
  };

  if (loading) {
    return (
      <View style={styles.loadingContainer}>
        <ActivityIndicator size="large" color="#6200EE" />
      </View>
    );
  }

  return (
    <>
      <Stack.Screen
        options={{
          title: isNew ? 'New Inspection' : 'Edit Inspection',
          headerShown: true,
        }}
      />
      <ScrollView style={styles.container}>
        <Surface style={styles.surface} elevation={1}>
          {/* Vehicle Selector */}
          <Text variant="labelLarge" style={styles.label}>
            Vehicle *
          </Text>
          <Menu
            visible={vehicleMenuVisible}
            onDismiss={() => setVehicleMenuVisible(false)}
            anchor={
              <Button
                mode="outlined"
                onPress={() => setVehicleMenuVisible(true)}
                style={styles.dropdown}
                contentStyle={styles.dropdownContent}
                disabled={!canEdit()}
                icon={selectedVehicle ? getVehicleTypeConfig(selectedVehicle.vehicle_type).icon : 'car'}
              >
                {selectedVehicle
                  ? `${selectedVehicle.name} (${selectedVehicle.plate_number})`
                  : 'Select Vehicle'}
              </Button>
            }
            contentStyle={styles.menuContent}
          >
            {vehicles.map((vehicle) => (
              <Menu.Item
                key={vehicle.id}
                onPress={() => {
                  setSelectedVehicle(vehicle);
                  setVehicleMenuVisible(false);
                }}
                title={`${vehicle.name} (${vehicle.plate_number})`}
                description={getVehicleTypeConfig(vehicle.vehicle_type).label}
                leadingIcon={getVehicleTypeConfig(vehicle.vehicle_type).icon}
              />
            ))}
          </Menu>

          {/* Scheduled Date */}
          <Text variant="labelLarge" style={styles.label}>
            Scheduled Date *
          </Text>
          <Button
            mode="outlined"
            onPress={() => setShowDatePicker(true)}
            style={styles.dropdown}
            icon="calendar"
            disabled={!canEdit()}
          >
            {scheduledDate.toLocaleDateString()}
          </Button>
          {showDatePicker && (
            <DateTimePicker value={scheduledDate} mode="date" display="default" onChange={onDateChange} />
          )}

          {/* Status */}
          <Text variant="labelLarge" style={styles.label}>
            Status *
          </Text>
          <SegmentedButtons
            value={status}
            onValueChange={(value) => {
              setStatus(value as InspectionStatus);
              if (value !== 'fail') {
                setSelectedFailureReason(null);
              }
            }}
            buttons={[
              { value: 'pending', label: 'Pending', icon: 'clock-outline' },
              { value: 'pass', label: 'Pass', icon: 'check-circle' },
              { value: 'fail', label: 'Fail', icon: 'close-circle' },
            ]}
            style={styles.statusButtons}
            disabled={!canEdit()}
          />

          {/* Failure Reason (only if status is 'fail') */}
          {status === 'fail' && (
            <>
              <Text variant="labelLarge" style={styles.label}>
                Failure Reason *
              </Text>
              <Menu
                visible={failureMenuVisible}
                onDismiss={() => setFailureMenuVisible(false)}
                anchor={
                  <Button
                    mode="outlined"
                    onPress={() => setFailureMenuVisible(true)}
                    style={styles.dropdown}
                    contentStyle={styles.dropdownContent}
                    disabled={!canEdit()}
                  >
                    {selectedFailureReason?.reason_text || 'Select Failure Reason'}
                  </Button>
                }
                contentStyle={styles.menuContent}
              >
                {failureReasons.map((reason) => (
                  <Menu.Item
                    key={reason.id}
                    onPress={() => {
                      setSelectedFailureReason(reason);
                      setFailureMenuVisible(false);
                    }}
                    title={reason.reason_text}
                    description={reason.category || undefined}
                  />
                ))}
              </Menu>
            </>
          )}

          {/* Odometer Reading */}
          <Text variant="labelLarge" style={styles.label}>
            Odometer Reading (km/mi)
          </Text>
          <TextInput
            mode="outlined"
            value={odometerReading}
            onChangeText={setOdometerReading}
            placeholder="e.g., 50000"
            keyboardType="numeric"
            style={styles.input}
            disabled={!canEdit()}
            left={<TextInput.Icon icon="speedometer" />}
          />

          {/* Notes */}
          <Text variant="labelLarge" style={styles.label}>
            Notes
          </Text>
          <TextInput
            mode="outlined"
            value={notes}
            onChangeText={setNotes}
            placeholder="Add any additional notes..."
            multiline
            numberOfLines={4}
            style={styles.notesInput}
            disabled={!canEdit()}
          />

          <Divider style={styles.divider} />

          {/* Action Buttons */}
          {canEdit() && (
            <Button
              mode="contained"
              onPress={handleSave}
              loading={saving}
              disabled={saving}
              style={styles.saveButton}
            >
              {isNew ? 'Create Inspection' : 'Save Changes'}
            </Button>
          )}

          {!isNew && canManageAll && (
            <Button mode="outlined" onPress={handleDelete} textColor="#F44336" style={styles.deleteButton}>
              Delete Inspection
            </Button>
          )}

          <Button mode="text" onPress={() => router.back()} style={styles.cancelButton}>
            Cancel
          </Button>
        </Surface>
      </ScrollView>
    </>
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
  surface: {
    margin: 16,
    padding: 16,
    borderRadius: 12,
    backgroundColor: '#FFFFFF',
  },
  label: {
    marginTop: 16,
    marginBottom: 8,
    color: '#333',
  },
  dropdown: {
    justifyContent: 'flex-start',
  },
  dropdownContent: {
    justifyContent: 'flex-start',
  },
  menuContent: {
    backgroundColor: '#FFFFFF',
    maxHeight: 300,
  },
  statusButtons: {
    marginTop: 4,
  },
  input: {
    backgroundColor: '#FFFFFF',
  },
  notesInput: {
    backgroundColor: '#FFFFFF',
  },
  divider: {
    marginTop: 24,
    marginBottom: 16,
  },
  saveButton: {
    marginTop: 8,
    paddingVertical: 4,
    backgroundColor: '#6200EE',
  },
  deleteButton: {
    marginTop: 12,
    borderColor: '#F44336',
  },
  cancelButton: {
    marginTop: 8,
  },
});
