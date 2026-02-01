-- VVS Vehicle Inspection App - Schema v3
-- Based on NEOM Active Vehicles Excel data structure
-- Run this in Supabase SQL Editor

-- =====================
-- DROP OLD ENUMS IF EXIST (for clean reinstall)
-- =====================
DROP TYPE IF EXISTS equipment_type CASCADE;
DROP TYPE IF EXISTS vehicle_status CASCADE;
DROP TYPE IF EXISTS expected_status CASCADE;

-- =====================
-- EQUIPMENT TYPES (from Excel - 25 types with A/B categories)
-- =====================
CREATE TYPE equipment_category AS ENUM ('A', 'B', 'C');

CREATE TYPE equipment_type AS ENUM (
    'forklift',
    'backhoe',
    'bulldozer',
    'bus_minibus_coach',
    'concrete_mixer_bulker',
    'concrete_pump_truck',
    'coring_drilling',
    'crawler_crane',
    'dump_truck_articulated',
    'dyna_mini_truck',
    'excavator_tracked',
    'flatbed_trailer',
    'grader',
    'hiab_boom_truck',
    'light_vehicle',
    'mewp',
    'mobile_crane_wheeled',
    'roller_compactor',
    'service_truck',
    'sewage_truck',
    'skid_steer_loader',
    'tanker_truck',
    'telehandler',
    'wheeled_loader',
    'ambulance',
    'other'
);

-- =====================
-- STATUS ENUMS
-- =====================
CREATE TYPE vehicle_status AS ENUM ('verified', 'rejected', 'pending');
CREATE TYPE expected_status AS ENUM ('verified', 'inspection_overdue', 'updated_inspection_required');

-- =====================
-- PROJECTS TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.projects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID NOT NULL REFERENCES public.companies(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    code TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(company_id, name)
);

-- =====================
-- GATES TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.gates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID NOT NULL REFERENCES public.companies(id) ON DELETE CASCADE,
    project_id UUID REFERENCES public.projects(id) ON DELETE SET NULL,
    name TEXT NOT NULL,
    location TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(company_id, name)
);

-- =====================
-- VEHICLES/EQUIPMENT TABLE (unified)
-- Matches Excel columns exactly
-- =====================
CREATE TABLE IF NOT EXISTS public.vehicles_equipment (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID NOT NULL REFERENCES public.companies(id) ON DELETE CASCADE,

    -- Core identification
    plate_number TEXT NOT NULL,
    equipment_type equipment_type NOT NULL DEFAULT 'other',
    equipment_category equipment_category NOT NULL DEFAULT 'A',

    -- Driver/Operator info
    driver_name TEXT,
    national_id_number TEXT,

    -- Equipment details
    manufacturer TEXT,
    model TEXT,
    year_of_manufacture INTEGER,

    -- Location tracking
    project_id UUID REFERENCES public.projects(id) ON DELETE SET NULL,
    gate_id UUID REFERENCES public.gates(id) ON DELETE SET NULL,

    -- Status tracking
    actual_status vehicle_status DEFAULT 'pending',
    expected_status expected_status DEFAULT 'verified',
    is_blacklisted BOOLEAN DEFAULT FALSE,

    -- Inspection tracking
    last_inspection_date TIMESTAMPTZ,
    next_inspection_date DATE,
    reason_for_rejection TEXT,

    -- Ownership
    owner_id UUID REFERENCES public.users(id) ON DELETE SET NULL,
    client_company TEXT, -- Company/Client field from Excel

    -- Timestamps
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by UUID REFERENCES public.users(id) ON DELETE SET NULL,
    modified_at TIMESTAMPTZ DEFAULT NOW(),

    UNIQUE(company_id, plate_number)
);

-- =====================
-- INSPECTIONS TABLE (simplified)
-- =====================
CREATE TABLE IF NOT EXISTS public.inspections_v2 (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID NOT NULL REFERENCES public.companies(id) ON DELETE CASCADE,
    vehicle_equipment_id UUID NOT NULL REFERENCES public.vehicles_equipment(id) ON DELETE CASCADE,

    -- Inspector
    inspector_id UUID NOT NULL REFERENCES public.users(id) ON DELETE SET NULL,

    -- Inspection details
    inspection_date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    scheduled_date DATE,

    -- Result
    status vehicle_status NOT NULL DEFAULT 'pending',
    reason_for_rejection TEXT,

    -- NDT (Non-Destructive Testing) info
    passed_with_ndt BOOLEAN DEFAULT FALSE,

    -- Gate/Location at inspection
    gate_id UUID REFERENCES public.gates(id) ON DELETE SET NULL,

    -- Notes
    notes TEXT,

    -- Timestamps
    completed_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- =====================
-- EQUIPMENT TYPE LOOKUP (for display names)
-- =====================
CREATE TABLE IF NOT EXISTS public.equipment_type_lookup (
    type_key equipment_type PRIMARY KEY,
    display_name TEXT NOT NULL,
    category equipment_category NOT NULL
);

INSERT INTO public.equipment_type_lookup (type_key, display_name, category) VALUES
    ('forklift', 'Forklifts', 'A'),
    ('backhoe', 'Backhoes', 'A'),
    ('bulldozer', 'Bulldozer', 'A'),
    ('bus_minibus_coach', 'Bus/Mini-Bus/Coach/Coaster', 'B'),
    ('concrete_mixer_bulker', 'Concrete Mixer/Bulker', 'B'),
    ('concrete_pump_truck', 'Concrete Pump Truck', 'B'),
    ('coring_drilling', 'Corring/Drilling', 'A'),
    ('crawler_crane', 'Crawler Cranes', 'A'),
    ('dump_truck_articulated', 'Dump Truck (Articulated)', 'A'),
    ('dyna_mini_truck', 'Dyna (Mini Truck)', 'A'),
    ('excavator_tracked', 'Excavator (360 degree Tracked)', 'A'),
    ('flatbed_trailer', 'Flatbed Trailer', 'A'),
    ('grader', 'Graders', 'A'),
    ('hiab_boom_truck', 'HIAB (Boom Trucks)', 'A'),
    ('light_vehicle', 'Light Vehicle (Car,SUV,Sedan,Pick Up)', 'B'),
    ('mewp', 'MEWPs', 'A'),
    ('mobile_crane_wheeled', 'Mobile Cranes (Wheeled)', 'A'),
    ('roller_compactor', 'Roller Compactor', 'B'),
    ('service_truck', 'Service Truck (Mechanic Truck/Food Truck)', 'B'),
    ('sewage_truck', 'Sewage Truck', 'B'),
    ('skid_steer_loader', 'Skid Steer Loader (Bobcat)', 'A'),
    ('tanker_truck', 'Tanker Trucks (Water/Fuel)', 'A'),
    ('telehandler', 'Telehandler', 'A'),
    ('wheeled_loader', 'Wheeled Loader', 'A'),
    ('ambulance', 'Ambulance', 'B'),
    ('other', 'Other', 'A')
ON CONFLICT (type_key) DO UPDATE SET display_name = EXCLUDED.display_name, category = EXCLUDED.category;

-- =====================
-- COMMON REJECTION REASONS (from Excel data)
-- =====================
CREATE TABLE IF NOT EXISTS public.rejection_reasons (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID REFERENCES public.companies(id) ON DELETE CASCADE,
    reason_text TEXT NOT NULL,
    category TEXT, -- freelance, old_model, safety, documentation, mechanical
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Insert common reasons from your Excel
INSERT INTO public.rejection_reasons (company_id, reason_text, category) VALUES
    (NULL, 'Freelance - No proper employment', 'freelance'),
    (NULL, 'Old Model - Vehicle too old', 'old_model'),
    (NULL, 'No 360 Vision/Camera', 'safety'),
    (NULL, 'No Reverse Alarm', 'safety'),
    (NULL, 'No Reverse Light', 'safety'),
    (NULL, 'No PWAS (Proximity Warning Alarm System)', 'safety'),
    (NULL, 'Oil/Hydraulic Leakage', 'mechanical'),
    (NULL, 'Tires Damage', 'mechanical'),
    (NULL, 'Windshield Damage', 'mechanical'),
    (NULL, 'Insurance Expired', 'documentation'),
    (NULL, 'TUV Expired', 'documentation'),
    (NULL, 'Iqama Expired', 'documentation'),
    (NULL, 'Operator TUV Expired', 'documentation'),
    (NULL, 'No Iqama - Visa Holder Only', 'documentation'),
    (NULL, 'PTI Expired', 'documentation'),
    (NULL, 'License Not Relevant', 'documentation'),
    (NULL, 'No Driving License', 'documentation'),
    (NULL, 'No Logo/Sticker', 'safety'),
    (NULL, 'Movement Alarm Manual', 'safety'),
    (NULL, 'Improper Pin Fitted', 'mechanical'),
    (NULL, 'No LMI (Load Moment Indicator)', 'safety'),
    (NULL, 'No Movement Alarm', 'safety'),
    (NULL, 'No Back Light', 'safety'),
    (NULL, 'Cracks on Windshield', 'mechanical'),
    (NULL, 'Unsafe Condition', 'safety')
ON CONFLICT DO NOTHING;

-- =====================
-- INDEXES
-- =====================
CREATE INDEX IF NOT EXISTS idx_vehicles_equipment_company ON public.vehicles_equipment(company_id);
CREATE INDEX IF NOT EXISTS idx_vehicles_equipment_plate ON public.vehicles_equipment(plate_number);
CREATE INDEX IF NOT EXISTS idx_vehicles_equipment_status ON public.vehicles_equipment(actual_status);
CREATE INDEX IF NOT EXISTS idx_vehicles_equipment_project ON public.vehicles_equipment(project_id);
CREATE INDEX IF NOT EXISTS idx_inspections_v2_company ON public.inspections_v2(company_id);
CREATE INDEX IF NOT EXISTS idx_inspections_v2_vehicle ON public.inspections_v2(vehicle_equipment_id);
CREATE INDEX IF NOT EXISTS idx_inspections_v2_date ON public.inspections_v2(inspection_date);

-- =====================
-- ENABLE RLS
-- =====================
ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.gates ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.vehicles_equipment ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.inspections_v2 ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.rejection_reasons ENABLE ROW LEVEL SECURITY;

-- =====================
-- RLS POLICIES - PROJECTS
-- =====================
CREATE POLICY "Owner full access projects" ON public.projects
    FOR ALL TO authenticated USING (public.is_owner()) WITH CHECK (public.is_owner());

CREATE POLICY "Admin manage company projects" ON public.projects
    FOR ALL TO authenticated
    USING (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id())
    WITH CHECK (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id());

CREATE POLICY "Users read company projects" ON public.projects
    FOR SELECT TO authenticated USING (company_id = public.get_user_company_id());

-- =====================
-- RLS POLICIES - GATES
-- =====================
CREATE POLICY "Owner full access gates" ON public.gates
    FOR ALL TO authenticated USING (public.is_owner()) WITH CHECK (public.is_owner());

CREATE POLICY "Admin manage company gates" ON public.gates
    FOR ALL TO authenticated
    USING (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id())
    WITH CHECK (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id());

CREATE POLICY "Users read company gates" ON public.gates
    FOR SELECT TO authenticated USING (company_id = public.get_user_company_id());

-- =====================
-- RLS POLICIES - VEHICLES/EQUIPMENT
-- =====================
CREATE POLICY "Owner full access vehicles_equipment" ON public.vehicles_equipment
    FOR ALL TO authenticated USING (public.is_owner()) WITH CHECK (public.is_owner());

CREATE POLICY "Admin manage company vehicles_equipment" ON public.vehicles_equipment
    FOR ALL TO authenticated
    USING (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id())
    WITH CHECK (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id());

CREATE POLICY "Inspector read company vehicles_equipment" ON public.vehicles_equipment
    FOR SELECT TO authenticated USING (company_id = public.get_user_company_id());

CREATE POLICY "Inspector update own vehicles_equipment" ON public.vehicles_equipment
    FOR UPDATE TO authenticated
    USING (company_id = public.get_user_company_id() AND owner_id = auth.uid());

-- =====================
-- RLS POLICIES - INSPECTIONS
-- =====================
CREATE POLICY "Owner full access inspections_v2" ON public.inspections_v2
    FOR ALL TO authenticated USING (public.is_owner()) WITH CHECK (public.is_owner());

CREATE POLICY "Admin manage company inspections_v2" ON public.inspections_v2
    FOR ALL TO authenticated
    USING (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id())
    WITH CHECK (public.get_user_role() = 'admin' AND company_id = public.get_user_company_id());

CREATE POLICY "Inspector read company inspections_v2" ON public.inspections_v2
    FOR SELECT TO authenticated USING (company_id = public.get_user_company_id());

CREATE POLICY "Inspector create company inspections_v2" ON public.inspections_v2
    FOR INSERT TO authenticated
    WITH CHECK (company_id = public.get_user_company_id() AND inspector_id = auth.uid());

CREATE POLICY "Inspector update own inspections_v2" ON public.inspections_v2
    FOR UPDATE TO authenticated
    USING (company_id = public.get_user_company_id() AND inspector_id = auth.uid());

-- =====================
-- RLS POLICIES - REJECTION REASONS
-- =====================
CREATE POLICY "Anyone read rejection_reasons" ON public.rejection_reasons
    FOR SELECT TO authenticated USING (company_id IS NULL OR company_id = public.get_user_company_id());

CREATE POLICY "Admin manage company rejection_reasons" ON public.rejection_reasons
    FOR ALL TO authenticated
    USING (public.get_user_role() IN ('admin', 'owner') AND (company_id IS NULL OR company_id = public.get_user_company_id()))
    WITH CHECK (public.get_user_role() IN ('admin', 'owner'));

-- =====================
-- HELPER FUNCTION: Get dashboard stats
-- =====================
CREATE OR REPLACE FUNCTION public.get_dashboard_stats_v2()
RETURNS JSON AS $$
DECLARE
    result JSON;
    user_company UUID;
BEGIN
    SELECT company_id INTO user_company FROM public.users WHERE id = auth.uid();

    SELECT json_build_object(
        'total', COUNT(*),
        'verified', COUNT(*) FILTER (WHERE actual_status = 'verified'),
        'rejected', COUNT(*) FILTER (WHERE actual_status = 'rejected'),
        'pending', COUNT(*) FILTER (WHERE actual_status = 'pending'),
        'overdue', COUNT(*) FILTER (WHERE next_inspection_date < CURRENT_DATE),
        'blacklisted', COUNT(*) FILTER (WHERE is_blacklisted = TRUE)
    ) INTO result
    FROM public.vehicles_equipment
    WHERE company_id = user_company OR public.is_owner();

    RETURN result;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =====================
-- HELPER FUNCTION: Update vehicle status after inspection
-- =====================
CREATE OR REPLACE FUNCTION public.update_vehicle_after_inspection()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE public.vehicles_equipment
    SET
        actual_status = NEW.status,
        last_inspection_date = NEW.inspection_date,
        reason_for_rejection = NEW.reason_for_rejection,
        modified_at = NOW()
    WHERE id = NEW.vehicle_equipment_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_vehicle_status
    AFTER INSERT OR UPDATE ON public.inspections_v2
    FOR EACH ROW
    EXECUTE FUNCTION public.update_vehicle_after_inspection();
