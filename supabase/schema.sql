-- VVS Vehicle Inspection App - Database Schema (Multi-Company)
-- Run this in Supabase SQL Editor
-- Supports multiple companies with isolated data

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create custom types
CREATE TYPE user_role AS ENUM ('owner', 'admin', 'inspector');
CREATE TYPE inspection_status AS ENUM ('pending', 'pass', 'fail');
CREATE TYPE vehicle_type AS ENUM (
    'car',
    'truck',
    'bus',
    'van',
    'motorcycle',
    'trailer',
    'heavy_equipment',
    'forklift',
    'ambulance',
    'fire_truck',
    'other'
);

-- =====================
-- COMPANIES TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.companies (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    code TEXT NOT NULL UNIQUE, -- Short unique code for company (e.g., "ACME")
    address TEXT,
    contact_email TEXT,
    contact_phone TEXT,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- =====================
-- USERS TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.users (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT NOT NULL,
    full_name TEXT NOT NULL,
    role user_role NOT NULL DEFAULT 'inspector',
    company_id UUID REFERENCES public.companies(id) ON DELETE SET NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- =====================
-- VEHICLES TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.vehicles (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID NOT NULL REFERENCES public.companies(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    plate_number TEXT NOT NULL,
    vehicle_type vehicle_type NOT NULL DEFAULT 'other',
    make TEXT, -- e.g., Toyota, Ford
    model TEXT, -- e.g., Hilux, F-150
    year INTEGER,
    vin TEXT, -- Vehicle Identification Number
    notes TEXT,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by UUID REFERENCES public.users(id) ON DELETE SET NULL,
    UNIQUE(company_id, plate_number) -- Plate number unique per company
);

-- =====================
-- FAILURE REASONS TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.failure_reasons (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID NOT NULL REFERENCES public.companies(id) ON DELETE CASCADE,
    reason_text TEXT NOT NULL,
    category TEXT, -- e.g., "Brakes", "Tires", "Lights", "Engine"
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_by UUID REFERENCES public.users(id) ON DELETE SET NULL
);

-- =====================
-- INSPECTIONS TABLE
-- =====================
CREATE TABLE IF NOT EXISTS public.inspections (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID NOT NULL REFERENCES public.companies(id) ON DELETE CASCADE,
    vehicle_id UUID NOT NULL REFERENCES public.vehicles(id) ON DELETE CASCADE,
    inspector_id UUID NOT NULL REFERENCES public.users(id) ON DELETE SET NULL,
    scheduled_date DATE NOT NULL,
    status inspection_status NOT NULL DEFAULT 'pending',
    failure_reason_id UUID REFERENCES public.failure_reasons(id) ON DELETE SET NULL,
    odometer_reading INTEGER, -- Current mileage/km
    notes TEXT,
    completed_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- =====================
-- INDEXES
-- =====================
CREATE INDEX IF NOT EXISTS idx_users_company_id ON public.users(company_id);
CREATE INDEX IF NOT EXISTS idx_vehicles_company_id ON public.vehicles(company_id);
CREATE INDEX IF NOT EXISTS idx_failure_reasons_company_id ON public.failure_reasons(company_id);
CREATE INDEX IF NOT EXISTS idx_inspections_company_id ON public.inspections(company_id);
CREATE INDEX IF NOT EXISTS idx_inspections_vehicle_id ON public.inspections(vehicle_id);
CREATE INDEX IF NOT EXISTS idx_inspections_inspector_id ON public.inspections(inspector_id);
CREATE INDEX IF NOT EXISTS idx_inspections_status ON public.inspections(status);
CREATE INDEX IF NOT EXISTS idx_inspections_scheduled_date ON public.inspections(scheduled_date);

-- =====================
-- ENABLE RLS
-- =====================
ALTER TABLE public.companies ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.vehicles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.failure_reasons ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.inspections ENABLE ROW LEVEL SECURITY;

-- =====================
-- HELPER FUNCTIONS
-- =====================

-- Get current user's role
CREATE OR REPLACE FUNCTION public.get_user_role()
RETURNS user_role AS $$
    SELECT role FROM public.users WHERE id = auth.uid();
$$ LANGUAGE SQL SECURITY DEFINER;

-- Get current user's company_id
CREATE OR REPLACE FUNCTION public.get_user_company_id()
RETURNS UUID AS $$
    SELECT company_id FROM public.users WHERE id = auth.uid();
$$ LANGUAGE SQL SECURITY DEFINER;

-- Check if user is owner
CREATE OR REPLACE FUNCTION public.is_owner()
RETURNS BOOLEAN AS $$
    SELECT EXISTS (SELECT 1 FROM public.users WHERE id = auth.uid() AND role = 'owner');
$$ LANGUAGE SQL SECURITY DEFINER;

-- =====================
-- RLS POLICIES - COMPANIES
-- =====================

-- Owner can manage all companies
CREATE POLICY "Owner full access to companies" ON public.companies
    FOR ALL TO authenticated
    USING (public.is_owner())
    WITH CHECK (public.is_owner());

-- Users can read their own company
CREATE POLICY "Users read own company" ON public.companies
    FOR SELECT TO authenticated
    USING (id = public.get_user_company_id());

-- =====================
-- RLS POLICIES - USERS
-- =====================

-- Owner can manage all users
CREATE POLICY "Owner full access to users" ON public.users
    FOR ALL TO authenticated
    USING (public.is_owner())
    WITH CHECK (public.is_owner());

-- Admin can read all users in their company
CREATE POLICY "Admin read company users" ON public.users
    FOR SELECT TO authenticated
    USING (
        public.get_user_role() = 'admin'
        AND company_id = public.get_user_company_id()
    );

-- Admin can update inspectors in their company
CREATE POLICY "Admin update company inspectors" ON public.users
    FOR UPDATE TO authenticated
    USING (
        public.get_user_role() = 'admin'
        AND company_id = public.get_user_company_id()
        AND role = 'inspector'
    )
    WITH CHECK (
        public.get_user_role() = 'admin'
        AND company_id = public.get_user_company_id()
        AND role = 'inspector'
    );

-- Inspector can read own profile
CREATE POLICY "Inspector read own profile" ON public.users
    FOR SELECT TO authenticated
    USING (id = auth.uid());

-- =====================
-- RLS POLICIES - VEHICLES
-- =====================

-- Owner full access to all vehicles
CREATE POLICY "Owner full access to vehicles" ON public.vehicles
    FOR ALL TO authenticated
    USING (public.is_owner())
    WITH CHECK (public.is_owner());

-- Admin full CRUD for company vehicles
CREATE POLICY "Admin manage company vehicles" ON public.vehicles
    FOR ALL TO authenticated
    USING (
        public.get_user_role() = 'admin'
        AND company_id = public.get_user_company_id()
    )
    WITH CHECK (
        public.get_user_role() = 'admin'
        AND company_id = public.get_user_company_id()
    );

-- Inspector read company vehicles
CREATE POLICY "Inspector read company vehicles" ON public.vehicles
    FOR SELECT TO authenticated
    USING (company_id = public.get_user_company_id());

-- =====================
-- RLS POLICIES - FAILURE REASONS
-- =====================

-- Owner full access
CREATE POLICY "Owner full access to failure_reasons" ON public.failure_reasons
    FOR ALL TO authenticated
    USING (public.is_owner())
    WITH CHECK (public.is_owner());

-- Admin manage company failure reasons
CREATE POLICY "Admin manage company failure_reasons" ON public.failure_reasons
    FOR ALL TO authenticated
    USING (
        public.get_user_role() = 'admin'
        AND company_id = public.get_user_company_id()
    )
    WITH CHECK (
        public.get_user_role() = 'admin'
        AND company_id = public.get_user_company_id()
    );

-- Inspector read active company failure reasons
CREATE POLICY "Inspector read company failure_reasons" ON public.failure_reasons
    FOR SELECT TO authenticated
    USING (
        company_id = public.get_user_company_id()
        AND is_active = TRUE
    );

-- =====================
-- RLS POLICIES - INSPECTIONS
-- =====================

-- Owner full access
CREATE POLICY "Owner full access to inspections" ON public.inspections
    FOR ALL TO authenticated
    USING (public.is_owner())
    WITH CHECK (public.is_owner());

-- Admin manage company inspections
CREATE POLICY "Admin manage company inspections" ON public.inspections
    FOR ALL TO authenticated
    USING (
        public.get_user_role() = 'admin'
        AND company_id = public.get_user_company_id()
    )
    WITH CHECK (
        public.get_user_role() = 'admin'
        AND company_id = public.get_user_company_id()
    );

-- Inspector read company inspections
CREATE POLICY "Inspector read company inspections" ON public.inspections
    FOR SELECT TO authenticated
    USING (company_id = public.get_user_company_id());

-- Inspector create company inspections
CREATE POLICY "Inspector create company inspections" ON public.inspections
    FOR INSERT TO authenticated
    WITH CHECK (
        public.get_user_role() = 'inspector'
        AND company_id = public.get_user_company_id()
        AND inspector_id = auth.uid()
    );

-- Inspector update own inspections
CREATE POLICY "Inspector update own inspections" ON public.inspections
    FOR UPDATE TO authenticated
    USING (
        public.get_user_role() = 'inspector'
        AND company_id = public.get_user_company_id()
        AND inspector_id = auth.uid()
    )
    WITH CHECK (
        public.get_user_role() = 'inspector'
        AND company_id = public.get_user_company_id()
        AND inspector_id = auth.uid()
    );

-- =====================
-- DATABASE FUNCTIONS
-- =====================

-- Get inspection statistics for dashboard (company filtered)
CREATE OR REPLACE FUNCTION public.get_inspection_stats()
RETURNS JSON AS $$
DECLARE
    result JSON;
    user_company UUID;
BEGIN
    SELECT company_id INTO user_company FROM public.users WHERE id = auth.uid();

    SELECT json_build_object(
        'total', COUNT(*),
        'pending', COUNT(*) FILTER (WHERE status = 'pending'),
        'pass', COUNT(*) FILTER (WHERE status = 'pass'),
        'fail', COUNT(*) FILTER (WHERE status = 'fail')
    ) INTO result
    FROM public.inspections
    WHERE company_id = user_company OR public.is_owner();

    RETURN result;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Get failure reason statistics (company filtered)
CREATE OR REPLACE FUNCTION public.get_failure_reason_stats()
RETURNS JSON AS $$
DECLARE
    result JSON;
    user_company UUID;
BEGIN
    SELECT company_id INTO user_company FROM public.users WHERE id = auth.uid();

    SELECT json_agg(row_to_json(t))
    INTO result
    FROM (
        SELECT
            fr.reason_text,
            COUNT(i.id) as count
        FROM public.failure_reasons fr
        LEFT JOIN public.inspections i ON i.failure_reason_id = fr.id
        WHERE fr.is_active = TRUE
          AND (fr.company_id = user_company OR public.is_owner())
        GROUP BY fr.id, fr.reason_text
        ORDER BY count DESC
        LIMIT 5
    ) t;

    RETURN COALESCE(result, '[]'::json);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Get all companies (owner only)
CREATE OR REPLACE FUNCTION public.get_all_companies()
RETURNS SETOF public.companies AS $$
BEGIN
    IF public.is_owner() THEN
        RETURN QUERY SELECT * FROM public.companies ORDER BY name;
    ELSE
        RETURN QUERY SELECT * FROM public.companies WHERE id = public.get_user_company_id();
    END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger to handle new user signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.users (id, email, full_name, role, company_id)
    VALUES (
        NEW.id,
        NEW.email,
        COALESCE(NEW.raw_user_meta_data->>'full_name', NEW.email),
        'inspector',
        (NEW.raw_user_meta_data->>'company_id')::UUID
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create trigger for new user signup
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- =====================
-- INITIAL SETUP INSTRUCTIONS
-- =====================
/*
After running this schema:

1. Create a company first:
   INSERT INTO public.companies (name, code, contact_email)
   VALUES ('Your Company Name', 'COMPANY1', 'admin@company.com');

   -- Note the company ID returned

2. Go to Authentication > Users in Supabase dashboard and create owner account

3. Copy the user's UUID from auth.users table

4. Set them as owner with company:
   UPDATE public.users
   SET role = 'owner', company_id = 'YOUR-COMPANY-UUID'
   WHERE id = 'YOUR-USER-UUID';

5. Or for system-wide owner (can see all companies):
   UPDATE public.users
   SET role = 'owner', company_id = NULL
   WHERE id = 'YOUR-USER-UUID';

VEHICLE TYPES SUPPORTED:
- car: Standard passenger car
- truck: Commercial truck, pickup
- bus: Passenger bus, shuttle
- van: Cargo van, minivan
- motorcycle: Motorcycle, scooter
- trailer: Attached trailer
- heavy_equipment: Construction equipment, bulldozer
- forklift: Warehouse forklift
- ambulance: Emergency medical vehicle
- fire_truck: Fire emergency vehicle
- other: Any other vehicle type
*/
