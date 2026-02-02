-- VVS Complete Schema - Run this FIRST
-- This creates all tables needed for the app

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =====================
-- ENUM TYPES
-- =====================
DO $$ BEGIN
    CREATE TYPE equipment_category AS ENUM ('A', 'B', 'C');
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
    CREATE TYPE equipment_type AS ENUM (
        'forklift', 'backhoe', 'bulldozer', 'bus_minibus_coach', 'concrete_mixer_bulker',
        'concrete_pump_truck', 'coring_drilling', 'crawler_crane', 'dump_truck_articulated',
        'dyna_mini_truck', 'excavator_tracked', 'flatbed_trailer', 'grader', 'hiab_boom_truck',
        'light_vehicle', 'mewp', 'mobile_crane_wheeled', 'roller_compactor', 'service_truck',
        'sewage_truck', 'skid_steer_loader', 'tanker_truck', 'telehandler', 'wheeled_loader',
        'ambulance', 'other'
    );
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
    CREATE TYPE vehicle_status AS ENUM ('verified', 'rejected', 'pending');
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
    CREATE TYPE expected_status AS ENUM ('verified', 'inspection_overdue', 'updated_inspection_required');
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
    CREATE TYPE certificate_status AS ENUM ('valid', 'expired', 'revoked', 'pending');
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

-- =====================
-- PROJECTS TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.projects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID REFERENCES public.companies(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    code TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- =====================
-- GATES TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.gates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID REFERENCES public.companies(id) ON DELETE CASCADE,
    project_id UUID REFERENCES public.projects(id) ON DELETE SET NULL,
    name TEXT NOT NULL,
    location TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- =====================
-- VEHICLES/EQUIPMENT TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.vehicles_equipment (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID REFERENCES public.companies(id) ON DELETE CASCADE,
    plate_number TEXT NOT NULL,
    equipment_type equipment_type NOT NULL DEFAULT 'other',
    equipment_category equipment_category NOT NULL DEFAULT 'A',
    driver_name TEXT,
    national_id_number TEXT,
    manufacturer TEXT,
    model TEXT,
    year_of_manufacture INTEGER,
    project_id UUID REFERENCES public.projects(id) ON DELETE SET NULL,
    gate_id UUID REFERENCES public.gates(id) ON DELETE SET NULL,
    actual_status vehicle_status DEFAULT 'pending',
    expected_status expected_status DEFAULT 'verified',
    is_blacklisted BOOLEAN DEFAULT FALSE,
    last_inspection_date TIMESTAMPTZ,
    next_inspection_date DATE,
    reason_for_rejection TEXT,
    owner_id UUID REFERENCES public.users(id) ON DELETE SET NULL,
    client_company TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by UUID REFERENCES public.users(id) ON DELETE SET NULL,
    modified_at TIMESTAMPTZ DEFAULT NOW(),
    -- Unique constraint: same plate number cannot exist twice within a company
    CONSTRAINT unique_plate_per_company UNIQUE (company_id, plate_number)
);

-- =====================
-- REJECTION REASONS TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.rejection_reasons (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID REFERENCES public.companies(id) ON DELETE CASCADE,
    reason_text TEXT NOT NULL,
    category TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- =====================
-- CERTIFICATES TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.certificates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID REFERENCES public.companies(id) ON DELETE CASCADE,
    certificate_number TEXT NOT NULL,
    issued_to TEXT NOT NULL,
    issued_by UUID REFERENCES public.users(id) ON DELETE SET NULL,
    issue_date DATE NOT NULL DEFAULT CURRENT_DATE,
    expiry_date DATE NOT NULL,
    status certificate_status NOT NULL DEFAULT 'valid',
    qr_code TEXT,
    pdf_url TEXT,
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    -- Unique constraint: certificate numbers must be globally unique
    CONSTRAINT unique_certificate_number UNIQUE (certificate_number)
);

-- =====================
-- INDEXES FOR PERFORMANCE
-- =====================
CREATE INDEX IF NOT EXISTS idx_vehicles_plate_number ON public.vehicles_equipment(plate_number);
CREATE INDEX IF NOT EXISTS idx_vehicles_status ON public.vehicles_equipment(actual_status);
CREATE INDEX IF NOT EXISTS idx_vehicles_company ON public.vehicles_equipment(company_id);
CREATE INDEX IF NOT EXISTS idx_vehicles_next_inspection ON public.vehicles_equipment(next_inspection_date);
CREATE INDEX IF NOT EXISTS idx_certificates_number ON public.certificates(certificate_number);
CREATE INDEX IF NOT EXISTS idx_certificates_company ON public.certificates(company_id);
CREATE INDEX IF NOT EXISTS idx_certificates_status ON public.certificates(status);

-- =====================
-- AUTO-UPDATE MODIFIED_AT TRIGGER
-- =====================
CREATE OR REPLACE FUNCTION public.update_modified_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.modified_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Apply trigger to vehicles_equipment
DROP TRIGGER IF EXISTS trigger_vehicles_modified_at ON public.vehicles_equipment;
CREATE TRIGGER trigger_vehicles_modified_at
    BEFORE UPDATE ON public.vehicles_equipment
    FOR EACH ROW
    EXECUTE FUNCTION public.update_modified_at();

-- =====================
-- ENABLE ROW LEVEL SECURITY
-- =====================
ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.gates ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.vehicles_equipment ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.rejection_reasons ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.certificates ENABLE ROW LEVEL SECURITY;

-- =====================
-- HELPER FUNCTION: Get user's company_id
-- =====================
CREATE OR REPLACE FUNCTION public.get_user_company_id()
RETURNS UUID AS $$
  SELECT company_id FROM public.users WHERE id = auth.uid();
$$ LANGUAGE SQL SECURITY DEFINER STABLE;

-- =====================
-- HELPER FUNCTION: Check if user is owner
-- =====================
CREATE OR REPLACE FUNCTION public.is_owner()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid() AND role = 'owner'
  );
$$ LANGUAGE SQL SECURITY DEFINER STABLE;

-- =====================
-- RLS POLICIES FOR PROJECTS
-- =====================
-- Users can view projects in their company
CREATE POLICY "Users can view own company projects" ON public.projects
  FOR SELECT USING (company_id = public.get_user_company_id());

-- Admins/Owners can insert projects in their company
CREATE POLICY "Admins can insert projects" ON public.projects
  FOR INSERT WITH CHECK (
    company_id = public.get_user_company_id() AND
    EXISTS (SELECT 1 FROM public.users WHERE id = auth.uid() AND role IN ('owner', 'admin'))
  );

-- Admins/Owners can update projects in their company
CREATE POLICY "Admins can update projects" ON public.projects
  FOR UPDATE USING (
    company_id = public.get_user_company_id() AND
    EXISTS (SELECT 1 FROM public.users WHERE id = auth.uid() AND role IN ('owner', 'admin'))
  );

-- Admins/Owners can delete projects in their company
CREATE POLICY "Admins can delete projects" ON public.projects
  FOR DELETE USING (
    company_id = public.get_user_company_id() AND
    EXISTS (SELECT 1 FROM public.users WHERE id = auth.uid() AND role IN ('owner', 'admin'))
  );

-- =====================
-- RLS POLICIES FOR GATES
-- =====================
CREATE POLICY "Users can view own company gates" ON public.gates
  FOR SELECT USING (company_id = public.get_user_company_id());

CREATE POLICY "Admins can insert gates" ON public.gates
  FOR INSERT WITH CHECK (
    company_id = public.get_user_company_id() AND
    EXISTS (SELECT 1 FROM public.users WHERE id = auth.uid() AND role IN ('owner', 'admin'))
  );

CREATE POLICY "Admins can update gates" ON public.gates
  FOR UPDATE USING (
    company_id = public.get_user_company_id() AND
    EXISTS (SELECT 1 FROM public.users WHERE id = auth.uid() AND role IN ('owner', 'admin'))
  );

CREATE POLICY "Admins can delete gates" ON public.gates
  FOR DELETE USING (
    company_id = public.get_user_company_id() AND
    EXISTS (SELECT 1 FROM public.users WHERE id = auth.uid() AND role IN ('owner', 'admin'))
  );

-- =====================
-- RLS POLICIES FOR VEHICLES_EQUIPMENT
-- =====================
CREATE POLICY "Users can view own company vehicles" ON public.vehicles_equipment
  FOR SELECT USING (company_id = public.get_user_company_id());

CREATE POLICY "Admins can insert vehicles" ON public.vehicles_equipment
  FOR INSERT WITH CHECK (
    company_id = public.get_user_company_id() AND
    EXISTS (SELECT 1 FROM public.users WHERE id = auth.uid() AND role IN ('owner', 'admin'))
  );

-- All authenticated users can update vehicles (for inspections)
CREATE POLICY "Users can update vehicles" ON public.vehicles_equipment
  FOR UPDATE USING (company_id = public.get_user_company_id());

CREATE POLICY "Admins can delete vehicles" ON public.vehicles_equipment
  FOR DELETE USING (
    company_id = public.get_user_company_id() AND
    EXISTS (SELECT 1 FROM public.users WHERE id = auth.uid() AND role IN ('owner', 'admin'))
  );

-- =====================
-- RLS POLICIES FOR REJECTION_REASONS
-- =====================
-- Allow viewing global reasons (null company_id) OR own company reasons
CREATE POLICY "Users can view rejection reasons" ON public.rejection_reasons
  FOR SELECT USING (company_id IS NULL OR company_id = public.get_user_company_id());

CREATE POLICY "Admins can insert rejection reasons" ON public.rejection_reasons
  FOR INSERT WITH CHECK (
    company_id = public.get_user_company_id() AND
    EXISTS (SELECT 1 FROM public.users WHERE id = auth.uid() AND role IN ('owner', 'admin'))
  );

CREATE POLICY "Admins can update rejection reasons" ON public.rejection_reasons
  FOR UPDATE USING (
    company_id = public.get_user_company_id() AND
    EXISTS (SELECT 1 FROM public.users WHERE id = auth.uid() AND role IN ('owner', 'admin'))
  );

CREATE POLICY "Admins can delete rejection reasons" ON public.rejection_reasons
  FOR DELETE USING (
    company_id = public.get_user_company_id() AND
    EXISTS (SELECT 1 FROM public.users WHERE id = auth.uid() AND role IN ('owner', 'admin'))
  );

-- =====================
-- RLS POLICIES FOR CERTIFICATES
-- =====================
CREATE POLICY "Users can view own company certificates" ON public.certificates
  FOR SELECT USING (company_id = public.get_user_company_id());

CREATE POLICY "Admins can insert certificates" ON public.certificates
  FOR INSERT WITH CHECK (
    company_id = public.get_user_company_id() AND
    EXISTS (SELECT 1 FROM public.users WHERE id = auth.uid() AND role IN ('owner', 'admin'))
  );

CREATE POLICY "Admins can update certificates" ON public.certificates
  FOR UPDATE USING (
    company_id = public.get_user_company_id() AND
    EXISTS (SELECT 1 FROM public.users WHERE id = auth.uid() AND role IN ('owner', 'admin'))
  );

CREATE POLICY "Admins can delete certificates" ON public.certificates
  FOR DELETE USING (
    company_id = public.get_user_company_id() AND
    EXISTS (SELECT 1 FROM public.users WHERE id = auth.uid() AND role IN ('owner', 'admin'))
  );

-- =====================
-- GRANT ACCESS
-- =====================
GRANT ALL ON public.projects TO authenticated;
GRANT ALL ON public.gates TO authenticated;
GRANT ALL ON public.vehicles_equipment TO authenticated;
GRANT ALL ON public.rejection_reasons TO authenticated;
GRANT ALL ON public.certificates TO authenticated;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO authenticated;
GRANT EXECUTE ON FUNCTION public.get_user_company_id() TO authenticated;
GRANT EXECUTE ON FUNCTION public.is_owner() TO authenticated;

-- =====================
-- INSERT DEFAULT REJECTION REASONS
-- =====================
INSERT INTO public.rejection_reasons (company_id, reason_text, category, is_active)
SELECT c.id, r.reason_text, r.category, true
FROM public.companies c,
(VALUES
    ('Freelance - No proper employment', 'freelance'),
    ('Old Model - Vehicle too old', 'old_model'),
    ('No 360 Vision/Camera', 'safety'),
    ('No Reverse Alarm', 'safety'),
    ('No PWAS (Proximity Warning System)', 'safety'),
    ('Oil/Hydraulic Leakage', 'mechanical'),
    ('Tires Damage', 'mechanical'),
    ('Insurance Expired', 'documentation'),
    ('TUV Expired', 'documentation'),
    ('Iqama Expired', 'documentation'),
    ('No Driving License', 'documentation'),
    ('Unsafe Condition', 'safety')
) AS r(reason_text, category)
WHERE NOT EXISTS (SELECT 1 FROM public.rejection_reasons WHERE reason_text = r.reason_text)
LIMIT 12;

-- Done! Now run import-data.sql to add your vehicles
SELECT 'Schema created successfully!' AS status;
