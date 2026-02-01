-- VVS Vehicle Inspection App - Enhanced Schema v2
-- Multi-Company with Equipment, Certificates, Contracts, Ajir, Stickers
-- Run this in Supabase SQL Editor (AFTER running the original schema)

-- =====================
-- NEW ENUM TYPES
-- =====================
-- Moving Equipment Types Only (vehicles that move/transport)
CREATE TYPE equipment_type AS ENUM (
    'forklift',
    'mobile_crane',
    'excavator',
    'loader',
    'bulldozer',
    'backhoe',
    'grader',
    'scissor_lift',
    'boom_lift',
    'pallet_jack',
    'reach_stacker',
    'telehandler',
    'skid_steer',
    'dump_truck',
    'concrete_mixer',
    'roller_compactor',
    'other'
);

CREATE TYPE certificate_status AS ENUM ('valid', 'expired', 'revoked', 'pending');
CREATE TYPE contract_type AS ENUM ('employment', 'freelance', 'ajir', 'service', 'rental');
CREATE TYPE contract_status AS ENUM ('draft', 'active', 'expired', 'terminated', 'pending_renewal');
CREATE TYPE sticker_status AS ENUM ('issued', 'expired', 'revoked', 'lost');
CREATE TYPE worker_status AS ENUM ('active', 'inactive', 'suspended', 'terminated');

CREATE TYPE failure_category AS ENUM (
    'brakes',
    'engine',
    'transmission',
    'tires_wheels',
    'steering',
    'suspension',
    'electrical',
    'lights_signals',
    'body_frame',
    'exhaust',
    'fuel_system',
    'cooling_system',
    'safety_equipment',
    'documentation',
    'emissions',
    'hydraulics',
    'pneumatics',
    'other'
);

-- =====================
-- EQUIPMENT TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.equipment (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID NOT NULL REFERENCES public.companies(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    serial_number TEXT NOT NULL,
    equipment_type equipment_type NOT NULL DEFAULT 'other',
    manufacturer TEXT,
    model TEXT,
    year_manufactured INTEGER,
    purchase_date DATE,
    last_service_date DATE,
    next_service_date DATE,
    location TEXT,
    notes TEXT,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by UUID REFERENCES public.users(id) ON DELETE SET NULL,
    UNIQUE(company_id, serial_number)
);

-- =====================
-- EQUIPMENT INSPECTIONS
-- =====================
CREATE TABLE IF NOT EXISTS public.equipment_inspections (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID NOT NULL REFERENCES public.companies(id) ON DELETE CASCADE,
    equipment_id UUID NOT NULL REFERENCES public.equipment(id) ON DELETE CASCADE,
    inspector_id UUID NOT NULL REFERENCES public.users(id) ON DELETE SET NULL,
    scheduled_date DATE NOT NULL,
    status inspection_status NOT NULL DEFAULT 'pending',
    failure_reason_id UUID REFERENCES public.failure_reasons(id) ON DELETE SET NULL,
    hours_reading INTEGER, -- Operating hours
    notes TEXT,
    completed_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- =====================
-- ENHANCED FAILURE REASONS (add category)
-- =====================
ALTER TABLE public.failure_reasons
ADD COLUMN IF NOT EXISTS failure_category failure_category DEFAULT 'other';

-- =====================
-- CERTIFICATES TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.certificates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID NOT NULL REFERENCES public.companies(id) ON DELETE CASCADE,
    certificate_number TEXT NOT NULL UNIQUE,
    -- Can be linked to vehicle or equipment inspection
    vehicle_inspection_id UUID REFERENCES public.inspections(id) ON DELETE SET NULL,
    equipment_inspection_id UUID REFERENCES public.equipment_inspections(id) ON DELETE SET NULL,
    issued_to TEXT NOT NULL, -- Name of vehicle/equipment owner
    issued_by UUID NOT NULL REFERENCES public.users(id) ON DELETE SET NULL,
    issue_date DATE NOT NULL DEFAULT CURRENT_DATE,
    expiry_date DATE NOT NULL,
    status certificate_status NOT NULL DEFAULT 'valid',
    qr_code TEXT, -- QR code data for verification
    pdf_url TEXT, -- URL to stored PDF
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- =====================
-- COMPANY STICKERS TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.company_stickers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID NOT NULL REFERENCES public.companies(id) ON DELETE CASCADE,
    sticker_number TEXT NOT NULL,
    -- Can be linked to vehicle or equipment
    vehicle_id UUID REFERENCES public.vehicles(id) ON DELETE SET NULL,
    equipment_id UUID REFERENCES public.equipment(id) ON DELETE SET NULL,
    certificate_id UUID REFERENCES public.certificates(id) ON DELETE SET NULL,
    issue_date DATE NOT NULL DEFAULT CURRENT_DATE,
    expiry_date DATE NOT NULL,
    status sticker_status NOT NULL DEFAULT 'issued',
    color TEXT, -- Sticker color code
    issued_by UUID REFERENCES public.users(id) ON DELETE SET NULL,
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(company_id, sticker_number)
);

-- =====================
-- CONTRACTS TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.contracts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID NOT NULL REFERENCES public.companies(id) ON DELETE CASCADE,
    contract_number TEXT NOT NULL,
    contract_type contract_type NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    -- Parties
    party_name TEXT NOT NULL, -- Employee/Freelancer/Company name
    party_email TEXT,
    party_phone TEXT,
    party_id_number TEXT, -- National ID or Iqama
    -- Dates
    start_date DATE NOT NULL,
    end_date DATE,
    -- Financial
    contract_value DECIMAL(12,2),
    currency TEXT DEFAULT 'SAR',
    payment_terms TEXT,
    -- Status
    status contract_status NOT NULL DEFAULT 'draft',
    -- Documents
    document_url TEXT,
    -- Metadata
    created_by UUID REFERENCES public.users(id) ON DELETE SET NULL,
    approved_by UUID REFERENCES public.users(id) ON DELETE SET NULL,
    approved_at TIMESTAMPTZ,
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(company_id, contract_number)
);

-- =====================
-- AJIR WORKERS TABLE (Saudi Labor System)
-- =====================
CREATE TABLE IF NOT EXISTS public.ajir_workers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID NOT NULL REFERENCES public.companies(id) ON DELETE CASCADE,
    contract_id UUID REFERENCES public.contracts(id) ON DELETE SET NULL,
    -- Worker Info
    full_name TEXT NOT NULL,
    nationality TEXT,
    id_number TEXT NOT NULL, -- Iqama or National ID
    id_expiry_date DATE,
    passport_number TEXT,
    passport_expiry_date DATE,
    -- Contact
    phone TEXT,
    email TEXT,
    address TEXT,
    -- Employment
    job_title TEXT,
    department TEXT,
    hire_date DATE,
    -- Ajir Specific
    ajir_number TEXT, -- Ajir system reference
    work_permit_number TEXT,
    work_permit_expiry DATE,
    sponsor_transfer_date DATE,
    -- Status
    status worker_status NOT NULL DEFAULT 'active',
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by UUID REFERENCES public.users(id) ON DELETE SET NULL,
    UNIQUE(company_id, id_number)
);

-- =====================
-- FREELANCE INSPECTORS TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.freelance_inspectors (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    contract_id UUID REFERENCES public.contracts(id) ON DELETE SET NULL,
    -- Certification
    license_number TEXT,
    license_expiry DATE,
    certifications TEXT[], -- Array of certifications
    specializations TEXT[], -- Array of specializations
    -- Availability
    is_available BOOLEAN DEFAULT TRUE,
    hourly_rate DECIMAL(10,2),
    currency TEXT DEFAULT 'SAR',
    -- Ratings
    total_inspections INTEGER DEFAULT 0,
    rating DECIMAL(3,2) DEFAULT 0,
    -- Status
    status worker_status NOT NULL DEFAULT 'active',
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- =====================
-- PRE-BUILT FAILURE REASONS
-- =====================
-- Insert common mechanical failure reasons (run once)
INSERT INTO public.failure_reasons (company_id, reason_text, failure_category, is_active, created_by)
SELECT
    c.id,
    reason.text,
    reason.category::failure_category,
    TRUE,
    NULL
FROM public.companies c
CROSS JOIN (VALUES
    ('Brake pads worn below minimum thickness', 'brakes'),
    ('Brake fluid leak detected', 'brakes'),
    ('ABS warning light active', 'brakes'),
    ('Parking brake not holding', 'brakes'),
    ('Engine oil leak', 'engine'),
    ('Engine overheating', 'engine'),
    ('Check engine light active', 'engine'),
    ('Abnormal engine noise', 'engine'),
    ('Transmission slipping', 'transmission'),
    ('Gear shift malfunction', 'transmission'),
    ('Clutch worn', 'transmission'),
    ('Tire tread below legal limit', 'tires_wheels'),
    ('Tire sidewall damage', 'tires_wheels'),
    ('Wheel bearing noise', 'tires_wheels'),
    ('Uneven tire wear', 'tires_wheels'),
    ('Power steering fluid leak', 'steering'),
    ('Steering wheel play excessive', 'steering'),
    ('Steering response delayed', 'steering'),
    ('Shock absorbers leaking', 'suspension'),
    ('Suspension noise over bumps', 'suspension'),
    ('Vehicle sagging on one side', 'suspension'),
    ('Battery not holding charge', 'electrical'),
    ('Alternator malfunction', 'electrical'),
    ('Wiring damage visible', 'electrical'),
    ('Headlights not working', 'lights_signals'),
    ('Brake lights not working', 'lights_signals'),
    ('Turn signals malfunction', 'lights_signals'),
    ('Rust damage to frame', 'body_frame'),
    ('Windshield crack in driver view', 'body_frame'),
    ('Door not closing properly', 'body_frame'),
    ('Exhaust leak detected', 'exhaust'),
    ('Catalytic converter damaged', 'exhaust'),
    ('Excessive exhaust smoke', 'exhaust'),
    ('Fuel leak detected', 'fuel_system'),
    ('Fuel pump malfunction', 'fuel_system'),
    ('Coolant leak', 'cooling_system'),
    ('Radiator damage', 'cooling_system'),
    ('Thermostat malfunction', 'cooling_system'),
    ('Seatbelts not functioning', 'safety_equipment'),
    ('Airbag warning light active', 'safety_equipment'),
    ('Fire extinguisher missing/expired', 'safety_equipment'),
    ('First aid kit missing', 'safety_equipment'),
    ('Registration expired', 'documentation'),
    ('Insurance expired', 'documentation'),
    ('Missing vehicle documents', 'documentation'),
    ('Failed emissions test', 'emissions'),
    ('Hydraulic fluid leak', 'hydraulics'),
    ('Hydraulic pump failure', 'hydraulics'),
    ('Air compressor malfunction', 'pneumatics'),
    ('Air brake system leak', 'pneumatics')
) AS reason(text, category)
ON CONFLICT DO NOTHING;

-- =====================
-- INDEXES
-- =====================
CREATE INDEX IF NOT EXISTS idx_equipment_company_id ON public.equipment(company_id);
CREATE INDEX IF NOT EXISTS idx_equipment_inspections_company_id ON public.equipment_inspections(company_id);
CREATE INDEX IF NOT EXISTS idx_equipment_inspections_equipment_id ON public.equipment_inspections(equipment_id);
CREATE INDEX IF NOT EXISTS idx_certificates_company_id ON public.certificates(company_id);
CREATE INDEX IF NOT EXISTS idx_certificates_status ON public.certificates(status);
CREATE INDEX IF NOT EXISTS idx_company_stickers_company_id ON public.company_stickers(company_id);
CREATE INDEX IF NOT EXISTS idx_contracts_company_id ON public.contracts(company_id);
CREATE INDEX IF NOT EXISTS idx_contracts_status ON public.contracts(status);
CREATE INDEX IF NOT EXISTS idx_ajir_workers_company_id ON public.ajir_workers(company_id);
CREATE INDEX IF NOT EXISTS idx_freelance_inspectors_user_id ON public.freelance_inspectors(user_id);

-- =====================
-- ENABLE RLS ON NEW TABLES
-- =====================
ALTER TABLE public.equipment ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.equipment_inspections ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.certificates ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.company_stickers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.contracts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ajir_workers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.freelance_inspectors ENABLE ROW LEVEL SECURITY;

-- =====================
-- RLS POLICIES - EQUIPMENT
-- =====================
CREATE POLICY "Owner full access to equipment" ON public.equipment
    FOR ALL TO authenticated USING (public.is_owner()) WITH CHECK (public.is_owner());

CREATE POLICY "Admin manage company equipment" ON public.equipment
    FOR ALL TO authenticated
    USING (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id())
    WITH CHECK (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id());

CREATE POLICY "Inspector read company equipment" ON public.equipment
    FOR SELECT TO authenticated USING (company_id = public.get_user_company_id());

-- =====================
-- RLS POLICIES - EQUIPMENT INSPECTIONS
-- =====================
CREATE POLICY "Owner full access to equipment_inspections" ON public.equipment_inspections
    FOR ALL TO authenticated USING (public.is_owner()) WITH CHECK (public.is_owner());

CREATE POLICY "Admin manage company equipment_inspections" ON public.equipment_inspections
    FOR ALL TO authenticated
    USING (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id())
    WITH CHECK (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id());

CREATE POLICY "Inspector read company equipment_inspections" ON public.equipment_inspections
    FOR SELECT TO authenticated USING (company_id = public.get_user_company_id());

CREATE POLICY "Inspector create company equipment_inspections" ON public.equipment_inspections
    FOR INSERT TO authenticated
    WITH CHECK (company_id = public.get_user_company_id() AND inspector_id = auth.uid());

CREATE POLICY "Inspector update own equipment_inspections" ON public.equipment_inspections
    FOR UPDATE TO authenticated
    USING (company_id = public.get_user_company_id() AND inspector_id = auth.uid())
    WITH CHECK (company_id = public.get_user_company_id() AND inspector_id = auth.uid());

-- =====================
-- RLS POLICIES - CERTIFICATES
-- =====================
CREATE POLICY "Owner full access to certificates" ON public.certificates
    FOR ALL TO authenticated USING (public.is_owner()) WITH CHECK (public.is_owner());

CREATE POLICY "Admin manage company certificates" ON public.certificates
    FOR ALL TO authenticated
    USING (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id())
    WITH CHECK (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id());

CREATE POLICY "Inspector read company certificates" ON public.certificates
    FOR SELECT TO authenticated USING (company_id = public.get_user_company_id());

-- =====================
-- RLS POLICIES - COMPANY STICKERS
-- =====================
CREATE POLICY "Owner full access to company_stickers" ON public.company_stickers
    FOR ALL TO authenticated USING (public.is_owner()) WITH CHECK (public.is_owner());

CREATE POLICY "Admin manage company stickers" ON public.company_stickers
    FOR ALL TO authenticated
    USING (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id())
    WITH CHECK (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id());

CREATE POLICY "Inspector read company stickers" ON public.company_stickers
    FOR SELECT TO authenticated USING (company_id = public.get_user_company_id());

-- =====================
-- RLS POLICIES - CONTRACTS
-- =====================
CREATE POLICY "Owner full access to contracts" ON public.contracts
    FOR ALL TO authenticated USING (public.is_owner()) WITH CHECK (public.is_owner());

CREATE POLICY "Admin manage company contracts" ON public.contracts
    FOR ALL TO authenticated
    USING (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id())
    WITH CHECK (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id());

CREATE POLICY "Inspector read own contracts" ON public.contracts
    FOR SELECT TO authenticated
    USING (company_id = public.get_user_company_id());

-- =====================
-- RLS POLICIES - AJIR WORKERS
-- =====================
CREATE POLICY "Owner full access to ajir_workers" ON public.ajir_workers
    FOR ALL TO authenticated USING (public.is_owner()) WITH CHECK (public.is_owner());

CREATE POLICY "Admin manage company ajir_workers" ON public.ajir_workers
    FOR ALL TO authenticated
    USING (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id())
    WITH CHECK (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id());

-- =====================
-- RLS POLICIES - FREELANCE INSPECTORS
-- =====================
CREATE POLICY "Owner full access to freelance_inspectors" ON public.freelance_inspectors
    FOR ALL TO authenticated USING (public.is_owner()) WITH CHECK (public.is_owner());

CREATE POLICY "Admin read freelance_inspectors" ON public.freelance_inspectors
    FOR SELECT TO authenticated USING (public.get_user_role() = 'admin');

CREATE POLICY "Users manage own freelance profile" ON public.freelance_inspectors
    FOR ALL TO authenticated
    USING (user_id = auth.uid())
    WITH CHECK (user_id = auth.uid());

-- =====================
-- HELPER FUNCTIONS
-- =====================

-- Generate certificate number
CREATE OR REPLACE FUNCTION public.generate_certificate_number()
RETURNS TEXT AS $$
DECLARE
    new_number TEXT;
BEGIN
    new_number := 'CERT-' || TO_CHAR(NOW(), 'YYYYMMDD') || '-' || LPAD(FLOOR(RANDOM() * 10000)::TEXT, 4, '0');
    RETURN new_number;
END;
$$ LANGUAGE plpgsql;

-- Generate sticker number
CREATE OR REPLACE FUNCTION public.generate_sticker_number()
RETURNS TEXT AS $$
DECLARE
    new_number TEXT;
BEGIN
    new_number := 'STK-' || TO_CHAR(NOW(), 'YYYYMMDD') || '-' || LPAD(FLOOR(RANDOM() * 10000)::TEXT, 4, '0');
    RETURN new_number;
END;
$$ LANGUAGE plpgsql;

-- Get equipment stats
CREATE OR REPLACE FUNCTION public.get_equipment_stats()
RETURNS JSON AS $$
DECLARE
    result JSON;
    user_company UUID;
BEGIN
    SELECT company_id INTO user_company FROM public.users WHERE id = auth.uid();

    SELECT json_build_object(
        'total', COUNT(*),
        'active', COUNT(*) FILTER (WHERE is_active = TRUE),
        'inactive', COUNT(*) FILTER (WHERE is_active = FALSE)
    ) INTO result
    FROM public.equipment
    WHERE company_id = user_company OR public.is_owner();

    RETURN result;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Get certificate stats
CREATE OR REPLACE FUNCTION public.get_certificate_stats()
RETURNS JSON AS $$
DECLARE
    result JSON;
    user_company UUID;
BEGIN
    SELECT company_id INTO user_company FROM public.users WHERE id = auth.uid();

    SELECT json_build_object(
        'total', COUNT(*),
        'valid', COUNT(*) FILTER (WHERE status = 'valid'),
        'expired', COUNT(*) FILTER (WHERE status = 'expired'),
        'pending', COUNT(*) FILTER (WHERE status = 'pending')
    ) INTO result
    FROM public.certificates
    WHERE company_id = user_company OR public.is_owner();

    RETURN result;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Get contracts stats
CREATE OR REPLACE FUNCTION public.get_contract_stats()
RETURNS JSON AS $$
DECLARE
    result JSON;
    user_company UUID;
BEGIN
    SELECT company_id INTO user_company FROM public.users WHERE id = auth.uid();

    SELECT json_build_object(
        'total', COUNT(*),
        'active', COUNT(*) FILTER (WHERE status = 'active'),
        'expired', COUNT(*) FILTER (WHERE status = 'expired'),
        'pending_renewal', COUNT(*) FILTER (WHERE status = 'pending_renewal')
    ) INTO result
    FROM public.contracts
    WHERE company_id = user_company OR public.is_owner();

    RETURN result;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
