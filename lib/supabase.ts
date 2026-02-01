import 'react-native-url-polyfill/auto';
import { createClient } from '@supabase/supabase-js';
import { Platform } from 'react-native';

// Supabase configuration - Use environment variables in production
// Set EXPO_PUBLIC_SUPABASE_URL and EXPO_PUBLIC_SUPABASE_ANON_KEY in your .env file
// Or configure in app.json under "extra" for Expo
const SUPABASE_URL = process.env.EXPO_PUBLIC_SUPABASE_URL || 'https://uilphshemrrzeuyxzjml.supabase.co';
const SUPABASE_ANON_KEY = process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVpbHBoc2hlbXJyemV1eXh6am1sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk4NTU0NzUsImV4cCI6MjA4NTQzMTQ3NX0.rDx7Hv1CwEZ6GvAFZvIEYi-2YICWpOIYxTF99jzIOUA';

// Validate configuration
if (!SUPABASE_URL || !SUPABASE_ANON_KEY) {
  throw new Error('Missing Supabase configuration. Set EXPO_PUBLIC_SUPABASE_URL and EXPO_PUBLIC_SUPABASE_ANON_KEY environment variables.');
}

// Check if we're running on server (SSR) or client
const isServer = typeof window === 'undefined';

// Custom storage adapter that handles web, native, and SSR
const StorageAdapter = {
  getItem: async (key: string): Promise<string | null> => {
    // Server-side: no storage available
    if (isServer) return null;

    if (Platform.OS === 'web') {
      // Web client: use localStorage
      try {
        return localStorage.getItem(key);
      } catch {
        return null;
      }
    }
    // Native: use SecureStore
    const SecureStore = require('expo-secure-store');
    return SecureStore.getItemAsync(key);
  },
  setItem: async (key: string, value: string): Promise<void> => {
    if (isServer) return;

    if (Platform.OS === 'web') {
      try {
        localStorage.setItem(key, value);
      } catch {}
      return;
    }
    const SecureStore = require('expo-secure-store');
    await SecureStore.setItemAsync(key, value);
  },
  removeItem: async (key: string): Promise<void> => {
    if (isServer) return;

    if (Platform.OS === 'web') {
      try {
        localStorage.removeItem(key);
      } catch {}
      return;
    }
    const SecureStore = require('expo-secure-store');
    await SecureStore.deleteItemAsync(key);
  },
};

export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
  auth: {
    storage: StorageAdapter,
    autoRefreshToken: true,
    persistSession: !isServer,
    detectSessionInUrl: false,
  },
});

// Database types - Based on NEOM Active Vehicles Excel
export type UserRole = 'owner' | 'admin' | 'inspector' | 'contractor';

// Status types matching Excel columns
export type VehicleStatus = 'verified' | 'rejected' | 'pending';
export type ExpectedStatus = 'verified' | 'inspection_overdue' | 'updated_inspection_required';
export type EquipmentCategory = 'A' | 'B' | 'C';

// Equipment types from Excel (25 types)
export type EquipmentType =
  | 'forklift'
  | 'backhoe'
  | 'bulldozer'
  | 'bus_minibus_coach'
  | 'concrete_mixer_bulker'
  | 'concrete_pump_truck'
  | 'coring_drilling'
  | 'crawler_crane'
  | 'dump_truck_articulated'
  | 'dyna_mini_truck'
  | 'excavator_tracked'
  | 'flatbed_trailer'
  | 'grader'
  | 'hiab_boom_truck'
  | 'light_vehicle'
  | 'mewp'
  | 'mobile_crane_wheeled'
  | 'roller_compactor'
  | 'service_truck'
  | 'sewage_truck'
  | 'skid_steer_loader'
  | 'tanker_truck'
  | 'telehandler'
  | 'wheeled_loader'
  | 'ambulance'
  | 'other';


// Rejection reason categories from Excel
export type RejectionCategory = 'freelance' | 'old_model' | 'safety' | 'documentation' | 'mechanical';

// Equipment types config matching Excel exactly (25 types with A/B categories)
export const EQUIPMENT_TYPES: { value: EquipmentType; label: string; icon: string; category: EquipmentCategory }[] = [
  { value: 'forklift', label: 'Forklifts', icon: 'forklift', category: 'A' },
  { value: 'backhoe', label: 'Backhoes', icon: 'excavator', category: 'A' },
  { value: 'bulldozer', label: 'Bulldozer', icon: 'bulldozer', category: 'A' },
  { value: 'bus_minibus_coach', label: 'Bus/Mini-Bus/Coach/Coaster', icon: 'bus', category: 'B' },
  { value: 'concrete_mixer_bulker', label: 'Concrete Mixer/Bulker', icon: 'truck-delivery', category: 'B' },
  { value: 'concrete_pump_truck', label: 'Concrete Pump Truck', icon: 'truck', category: 'B' },
  { value: 'coring_drilling', label: 'Coring/Drilling', icon: 'hammer', category: 'A' },
  { value: 'crawler_crane', label: 'Crawler Cranes', icon: 'crane', category: 'A' },
  { value: 'dump_truck_articulated', label: 'Dump Truck (Articulated)', icon: 'dump-truck', category: 'A' },
  { value: 'dyna_mini_truck', label: 'Dyna (Mini Truck)', icon: 'truck', category: 'A' },
  { value: 'excavator_tracked', label: 'Excavator (360° Tracked)', icon: 'excavator', category: 'A' },
  { value: 'flatbed_trailer', label: 'Flatbed Trailer', icon: 'truck-trailer', category: 'A' },
  { value: 'grader', label: 'Graders', icon: 'road-variant', category: 'A' },
  { value: 'hiab_boom_truck', label: 'HIAB (Boom Trucks)', icon: 'crane', category: 'A' },
  { value: 'light_vehicle', label: 'Light Vehicle (Car/SUV/Pickup)', icon: 'car', category: 'B' },
  { value: 'mewp', label: 'MEWPs', icon: 'elevator-up', category: 'A' },
  { value: 'mobile_crane_wheeled', label: 'Mobile Cranes (Wheeled)', icon: 'crane', category: 'A' },
  { value: 'roller_compactor', label: 'Roller Compactor', icon: 'road-variant', category: 'B' },
  { value: 'service_truck', label: 'Service Truck (Mechanic/Food)', icon: 'truck', category: 'B' },
  { value: 'sewage_truck', label: 'Sewage Truck', icon: 'tanker-truck', category: 'B' },
  { value: 'skid_steer_loader', label: 'Skid Steer Loader (Bobcat)', icon: 'tractor-variant', category: 'A' },
  { value: 'tanker_truck', label: 'Tanker Trucks (Water/Fuel)', icon: 'tanker-truck', category: 'A' },
  { value: 'telehandler', label: 'Telehandler', icon: 'forklift', category: 'A' },
  { value: 'wheeled_loader', label: 'Wheeled Loader', icon: 'tractor', category: 'A' },
  { value: 'ambulance', label: 'Ambulance', icon: 'ambulance', category: 'B' },
  { value: 'other', label: 'Other', icon: 'cog', category: 'A' },
];

// Common rejection reasons from Excel data
export const REJECTION_REASONS: { value: string; label: string; category: RejectionCategory }[] = [
  { value: 'freelance', label: 'Freelance - No proper employment', category: 'freelance' },
  { value: 'old_model', label: 'Old Model - Vehicle too old', category: 'old_model' },
  { value: 'no_360_camera', label: 'No 360 Vision/Camera', category: 'safety' },
  { value: 'no_reverse_alarm', label: 'No Reverse Alarm', category: 'safety' },
  { value: 'no_reverse_light', label: 'No Reverse Light', category: 'safety' },
  { value: 'no_pwas', label: 'No PWAS (Proximity Warning System)', category: 'safety' },
  { value: 'oil_leak', label: 'Oil/Hydraulic Leakage', category: 'mechanical' },
  { value: 'tire_damage', label: 'Tires Damage', category: 'mechanical' },
  { value: 'windshield_damage', label: 'Windshield Damage', category: 'mechanical' },
  { value: 'insurance_expired', label: 'Insurance Expired', category: 'documentation' },
  { value: 'tuv_expired', label: 'TUV Expired', category: 'documentation' },
  { value: 'iqama_expired', label: 'Iqama Expired', category: 'documentation' },
  { value: 'operator_tuv_expired', label: 'Operator TUV Expired', category: 'documentation' },
  { value: 'no_iqama', label: 'No Iqama - Visa Holder Only', category: 'documentation' },
  { value: 'pti_expired', label: 'PTI Expired', category: 'documentation' },
  { value: 'license_not_relevant', label: 'License Not Relevant', category: 'documentation' },
  { value: 'no_driving_license', label: 'No Driving License', category: 'documentation' },
  { value: 'no_logo_sticker', label: 'No Logo/Sticker', category: 'safety' },
  { value: 'no_lmi', label: 'No LMI (Load Moment Indicator)', category: 'safety' },
  { value: 'no_movement_alarm', label: 'No Movement Alarm', category: 'safety' },
  { value: 'unsafe_condition', label: 'Unsafe Condition', category: 'safety' },
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
  company?: Company;
}

export interface Project {
  id: string;
  company_id: string;
  name: string;
  code: string | null;
  is_active: boolean;
  created_at: string;
}

export interface Gate {
  id: string;
  company_id: string;
  project_id: string | null;
  name: string;
  location: string | null;
  is_active: boolean;
  created_at: string;
  project?: Project;
}

// Main Vehicle/Equipment interface - matches Excel columns
export interface VehicleEquipment {
  id: string;
  company_id: string;
  plate_number: string;
  equipment_type: EquipmentType;
  equipment_category: EquipmentCategory;
  driver_name: string | null;
  national_id_number: string | null;
  manufacturer: string | null;
  model: string | null;
  year_of_manufacture: number | null;
  project_id: string | null;
  gate_id: string | null;
  actual_status: VehicleStatus;
  expected_status: ExpectedStatus;
  is_blacklisted: boolean;
  last_inspection_date: string | null;
  next_inspection_date: string | null;
  reason_for_rejection: string | null;
  owner_id: string | null;
  client_company: string | null;
  created_at: string;
  created_by: string | null;
  modified_at: string | null;
  // Joined
  project?: Project;
  gate?: Gate;
  owner?: User;
  company?: Company;
}

export interface RejectionReason {
  id: string;
  company_id: string | null;
  reason_text: string;
  category: RejectionCategory | null;
  is_active: boolean;
  created_at: string;
}

export interface Inspection {
  id: string;
  company_id: string;
  vehicle_equipment_id: string;
  inspector_id: string;
  inspection_date: string;
  scheduled_date: string | null;
  status: VehicleStatus;
  reason_for_rejection: string | null;
  passed_with_ndt: boolean;
  gate_id: string | null;
  notes: string | null;
  completed_at: string | null;
  created_at: string;
  // Joined
  vehicle_equipment?: VehicleEquipment;
  inspector?: User;
  gate?: Gate;
  company?: Company;
}

export interface DashboardStats {
  total: number;
  verified: number;
  rejected: number;
  pending: number;
  overdue: number;
  blacklisted: number;
}

// Helper function to get equipment type config
export function getEquipmentTypeConfig(type: EquipmentType) {
  return EQUIPMENT_TYPES.find((t) => t.value === type) || EQUIPMENT_TYPES[EQUIPMENT_TYPES.length - 1];
}

// Helper function to get equipment category display
export function getCategoryDisplay(category: EquipmentCategory): string {
  switch (category) {
    case 'A': return 'Heavy Equipment';
    case 'B': return 'Vehicles';
    case 'C': return 'Special';
    default: return 'Unknown';
  }
}

// Helper to parse equipment type from Excel string like "Forklifts - (A)"
export function parseEquipmentFromExcel(excelValue: string): { type: EquipmentType; category: EquipmentCategory } {
  const match = excelValue.match(/^(.+?)\s*-\s*\(([ABC])\)$/);
  if (!match) return { type: 'other', category: 'A' };

  const label = match[1].trim().toLowerCase();
  const category = match[2] as EquipmentCategory;

  const found = EQUIPMENT_TYPES.find(t =>
    t.label.toLowerCase().includes(label) || label.includes(t.label.toLowerCase().split(' ')[0])
  );

  return { type: found?.value || 'other', category };
}

// Rejection reason category config
export const REJECTION_CATEGORIES: { value: RejectionCategory; label: string; icon: string; color: string }[] = [
  { value: 'freelance', label: 'Freelance', icon: 'account-off', color: '#F59E0B' },
  { value: 'old_model', label: 'Old Model', icon: 'car-clock', color: '#8B5CF6' },
  { value: 'safety', label: 'Safety', icon: 'shield-alert', color: '#EF4444' },
  { value: 'documentation', label: 'Documentation', icon: 'file-alert', color: '#3B82F6' },
  { value: 'mechanical', label: 'Mechanical', icon: 'wrench', color: '#6B7280' },
];


// Helper to get rejection category config
export function getRejectionCategoryConfig(category: RejectionCategory) {
  return REJECTION_CATEGORIES.find((c) => c.value === category) || REJECTION_CATEGORIES[REJECTION_CATEGORIES.length - 1];
}

// Status color helpers
export function getStatusColor(status: VehicleStatus): string {
  switch (status) {
    case 'verified': return '#10B981';
    case 'rejected': return '#EF4444';
    case 'pending': return '#F59E0B';
    default: return '#6B7280';
  }
}

export function getExpectedStatusColor(status: ExpectedStatus): string {
  switch (status) {
    case 'verified': return '#10B981';
    case 'inspection_overdue': return '#EF4444';
    case 'updated_inspection_required': return '#F59E0B';
    default: return '#6B7280';
  }
}
