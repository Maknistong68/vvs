// Re-export types from supabase for convenience
export type {
  User,
  UserRole,
  Vehicle,
  VehicleType,
  FailureReason,
  Inspection,
  InspectionStatus,
  InspectionStats,
  FailureReasonStat,
  Company,
} from '../lib/supabase';

export { VEHICLE_TYPES, getVehicleTypeConfig } from '../lib/supabase';

// Navigation types
export type RootStackParamList = {
  '(auth)/login': undefined;
  '(tabs)': undefined;
  'inspection/[id]': { id: string };
};

// Form types
export interface LoginForm {
  email: string;
  password: string;
}

export interface SignUpForm {
  email: string;
  password: string;
  fullName: string;
  companyCode: string;
}

export interface InspectionForm {
  vehicle_id: string;
  scheduled_date: Date;
  status: 'pending' | 'pass' | 'fail';
  failure_reason_id?: string;
  odometer_reading?: number;
  notes?: string;
}

export interface VehicleForm {
  name: string;
  plate_number: string;
  vehicle_type: string;
  make?: string;
  model?: string;
  year?: number;
  vin?: string;
  notes?: string;
}

export interface FailureReasonForm {
  reason_text: string;
  category?: string;
  is_active: boolean;
}

export interface CompanyForm {
  name: string;
  code: string;
  address?: string;
  contact_email?: string;
  contact_phone?: string;
}

// Component props
export interface StatCardProps {
  title: string;
  value: number | string;
  icon: string;
  color: string;
}

export interface InspectionCardProps {
  inspection: {
    id: string;
    vehicle?: {
      name: string;
      plate_number: string;
      vehicle_type?: string;
    };
    scheduled_date: string;
    status: 'pending' | 'pass' | 'fail';
    inspector?: { full_name: string };
  };
  onPress: () => void;
}
