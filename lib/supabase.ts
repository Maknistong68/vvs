import 'react-native-url-polyfill/dist/polyfill';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { createClient } from '@supabase/supabase-js';
import * as SecureStore from 'expo-secure-store';
import { Platform } from 'react-native';

// Supabase configuration
// Replace these with your actual Supabase project credentials
const SUPABASE_URL = 'https://uilphshemrrzeuyxzjml.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVpbHBoc2hlbXJyemV1eXh6am1sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk4NTU0NzUsImV4cCI6MjA4NTQzMTQ3NX0.rDx7Hv1CwEZ6GvAFZvIEYi-2YICWpOIYxTF99jzIOUA';

// Custom storage adapter that uses SecureStore on native and AsyncStorage on web
const ExpoSecureStoreAdapter = {
  getItem: async (key: string): Promise<string | null> => {
    if (Platform.OS === 'web') {
      return AsyncStorage.getItem(key);
    }
    return SecureStore.getItemAsync(key);
  },
  setItem: async (key: string, value: string): Promise<void> => {
    if (Platform.OS === 'web') {
      await AsyncStorage.setItem(key, value);
      return;
    }
    await SecureStore.setItemAsync(key, value);
  },
  removeItem: async (key: string): Promise<void> => {
    if (Platform.OS === 'web') {
      await AsyncStorage.removeItem(key);
      return;
    }
    await SecureStore.deleteItemAsync(key);
  },
};

export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
  auth: {
    storage: ExpoSecureStoreAdapter,
    autoRefreshToken: true,
    persistSession: true,
    detectSessionInUrl: false,
  },
});

// Database types
export type UserRole = 'owner' | 'admin' | 'inspector';
export type InspectionStatus = 'pending' | 'pass' | 'fail';
export type VehicleType =
  | 'car'
  | 'truck'
  | 'bus'
  | 'van'
  | 'motorcycle'
  | 'trailer'
  | 'heavy_equipment'
  | 'forklift'
  | 'ambulance'
  | 'fire_truck'
  | 'other';

export const VEHICLE_TYPES: { value: VehicleType; label: string; icon: string }[] = [
  { value: 'car', label: 'Car', icon: 'car' },
  { value: 'truck', label: 'Truck', icon: 'truck' },
  { value: 'bus', label: 'Bus', icon: 'bus' },
  { value: 'van', label: 'Van', icon: 'van-utility' },
  { value: 'motorcycle', label: 'Motorcycle', icon: 'motorbike' },
  { value: 'trailer', label: 'Trailer', icon: 'truck-trailer' },
  { value: 'heavy_equipment', label: 'Heavy Equipment', icon: 'bulldozer' },
  { value: 'forklift', label: 'Forklift', icon: 'forklift' },
  { value: 'ambulance', label: 'Ambulance', icon: 'ambulance' },
  { value: 'fire_truck', label: 'Fire Truck', icon: 'fire-truck' },
  { value: 'other', label: 'Other', icon: 'car-multiple' },
];

export interface Company {
  id: string;
  name: string;
  code: string;
  address: string | null;
  contact_email: string | null;
  contact_phone: string | null;
  is_active: boolean;
  created_at: string;
}

export interface User {
  id: string;
  email: string;
  full_name: string;
  role: UserRole;
  company_id: string | null;
  is_active: boolean;
  created_at: string;
  // Joined
  company?: Company;
}

export interface Vehicle {
  id: string;
  company_id: string;
  name: string;
  plate_number: string;
  vehicle_type: VehicleType;
  make: string | null;
  model: string | null;
  year: number | null;
  vin: string | null;
  notes: string | null;
  is_active: boolean;
  created_at: string;
  created_by: string | null;
  // Joined
  company?: Company;
}

export interface FailureReason {
  id: string;
  company_id: string;
  reason_text: string;
  category: string | null;
  is_active: boolean;
  created_at: string;
  created_by: string | null;
}

export interface Inspection {
  id: string;
  company_id: string;
  vehicle_id: string;
  inspector_id: string;
  scheduled_date: string;
  status: InspectionStatus;
  failure_reason_id: string | null;
  odometer_reading: number | null;
  notes: string | null;
  completed_at: string | null;
  created_at: string;
  // Joined fields
  vehicle?: Vehicle;
  inspector?: User;
  failure_reason?: FailureReason;
  company?: Company;
}

export interface InspectionStats {
  total: number;
  pending: number;
  pass: number;
  fail: number;
}

export interface FailureReasonStat {
  reason_text: string;
  count: number;
}

// Helper function to get vehicle type config
export function getVehicleTypeConfig(type: VehicleType) {
  return VEHICLE_TYPES.find((t) => t.value === type) || VEHICLE_TYPES[VEHICLE_TYPES.length - 1];
}
