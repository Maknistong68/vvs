// Re-export types from supabase for convenience
export type {
  User,
  UserRole,
  VehicleEquipment,
  EquipmentType,
  EquipmentCategory,
  VehicleStatus,
  ExpectedStatus,
  RejectionReason,
  RejectionCategory,
  Inspection,
  DashboardStats,
  Company,
  Project,
  Gate,
} from '../lib/supabase';

export { EQUIPMENT_TYPES, getEquipmentTypeConfig, REJECTION_REASONS, REJECTION_CATEGORIES } from '../lib/supabase';

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
  vehicle_equipment_id: string;
  scheduled_date: Date;
  status: 'pending' | 'verified' | 'rejected';
  reason_for_rejection?: string;
  notes?: string;
}

export interface VehicleEquipmentForm {
  plate_number: string;
  equipment_type: string;
  equipment_category: string;
  driver_name?: string;
  national_id_number?: string;
  year_of_manufacture?: number;
  client_company?: string;
}

export interface RejectionReasonForm {
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

export interface ProjectForm {
  name: string;
  code?: string;
}

export interface GateForm {
  name: string;
  location?: string;
  project_id?: string;
}

// Component props
export interface StatCardProps {
  title: string;
  value: number | string;
  icon: string;
  color: string;
  gradient?: string[];
}
