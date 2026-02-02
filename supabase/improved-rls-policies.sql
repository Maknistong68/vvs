-- VVS Improved RLS Policies
-- Run this AFTER complete-schema.sql to update vehicle policies
-- This fixes the overly permissive vehicle update policy

-- =====================
-- HELPER FUNCTION: Get user's role
-- =====================
CREATE OR REPLACE FUNCTION public.get_user_role()
RETURNS TEXT AS $$
  SELECT role::TEXT FROM public.users WHERE id = auth.uid();
$$ LANGUAGE SQL SECURITY DEFINER STABLE;

-- =====================
-- HELPER FUNCTION: Check if user is admin or higher
-- =====================
CREATE OR REPLACE FUNCTION public.is_admin_or_higher()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid() AND role IN ('owner', 'admin')
  );
$$ LANGUAGE SQL SECURITY DEFINER STABLE;

-- =====================
-- HELPER FUNCTION: Check if user is inspector or higher
-- =====================
CREATE OR REPLACE FUNCTION public.is_inspector_or_higher()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid() AND role IN ('owner', 'admin', 'inspector')
  );
$$ LANGUAGE SQL SECURITY DEFINER STABLE;

-- =====================
-- DROP OLD OVERLY PERMISSIVE POLICY
-- =====================
DROP POLICY IF EXISTS "Users can update vehicles" ON public.vehicles_equipment;

-- =====================
-- NEW ROLE-BASED UPDATE POLICIES FOR VEHICLES
-- =====================

-- Admins and Owners can update ALL fields
CREATE POLICY "Admins can update vehicles fully" ON public.vehicles_equipment
  FOR UPDATE USING (
    company_id = public.get_user_company_id() AND
    public.is_admin_or_higher()
  );

-- Inspectors can ONLY update inspection-related fields
-- This is enforced through a trigger since RLS can't limit columns
CREATE POLICY "Inspectors can update vehicles for inspection" ON public.vehicles_equipment
  FOR UPDATE USING (
    company_id = public.get_user_company_id() AND
    public.is_inspector_or_higher()
  );

-- Note: Contractors should NOT be able to update vehicles
-- They only have read access through the SELECT policy

-- =====================
-- TRIGGER TO ENFORCE INSPECTOR FIELD RESTRICTIONS
-- =====================
CREATE OR REPLACE FUNCTION public.check_vehicle_update_permissions()
RETURNS TRIGGER AS $$
DECLARE
  user_role TEXT;
BEGIN
  -- Get the current user's role
  SELECT role::TEXT INTO user_role FROM public.users WHERE id = auth.uid();

  -- If user is admin or owner, allow all updates
  IF user_role IN ('owner', 'admin') THEN
    RETURN NEW;
  END IF;

  -- If user is inspector, only allow inspection-related field updates
  IF user_role = 'inspector' THEN
    -- Check if any non-inspection fields were changed
    IF (
      OLD.plate_number IS DISTINCT FROM NEW.plate_number OR
      OLD.equipment_type IS DISTINCT FROM NEW.equipment_type OR
      OLD.equipment_category IS DISTINCT FROM NEW.equipment_category OR
      OLD.manufacturer IS DISTINCT FROM NEW.manufacturer OR
      OLD.model IS DISTINCT FROM NEW.model OR
      OLD.year_of_manufacture IS DISTINCT FROM NEW.year_of_manufacture OR
      OLD.project_id IS DISTINCT FROM NEW.project_id OR
      OLD.gate_id IS DISTINCT FROM NEW.gate_id OR
      OLD.owner_id IS DISTINCT FROM NEW.owner_id OR
      OLD.client_company IS DISTINCT FROM NEW.client_company OR
      OLD.created_by IS DISTINCT FROM NEW.created_by
    ) THEN
      RAISE EXCEPTION 'Inspectors can only update inspection-related fields (status, dates, rejection reason, blacklist)';
    END IF;
    RETURN NEW;
  END IF;

  -- If user is contractor, deny update
  IF user_role = 'contractor' THEN
    RAISE EXCEPTION 'Contractors do not have permission to update vehicle records';
  END IF;

  -- Default deny
  RAISE EXCEPTION 'You do not have permission to update vehicle records';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Apply the trigger
DROP TRIGGER IF EXISTS trigger_check_vehicle_update ON public.vehicles_equipment;
CREATE TRIGGER trigger_check_vehicle_update
  BEFORE UPDATE ON public.vehicles_equipment
  FOR EACH ROW
  EXECUTE FUNCTION public.check_vehicle_update_permissions();

-- =====================
-- RLS POLICIES FOR USERS TABLE
-- (Assuming users table exists)
-- =====================
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

-- Users can view themselves and colleagues in their company
DROP POLICY IF EXISTS "Users can view own company members" ON public.users;
CREATE POLICY "Users can view own company members" ON public.users
  FOR SELECT USING (
    id = auth.uid() OR
    company_id = public.get_user_company_id()
  );

-- Owners can update user roles within their company
DROP POLICY IF EXISTS "Owners can update users in their company" ON public.users;
CREATE POLICY "Owners can update users in their company" ON public.users
  FOR UPDATE USING (
    public.is_owner() AND
    company_id = public.get_user_company_id()
  );

-- Admins can view users in their company
DROP POLICY IF EXISTS "Admins can view company users" ON public.users;
CREATE POLICY "Admins can view company users" ON public.users
  FOR SELECT USING (
    company_id = public.get_user_company_id()
  );

-- =====================
-- RLS POLICIES FOR COMPANIES TABLE
-- (Assuming companies table exists)
-- =====================
ALTER TABLE public.companies ENABLE ROW LEVEL SECURITY;

-- Users can view their own company
DROP POLICY IF EXISTS "Users can view own company" ON public.companies;
CREATE POLICY "Users can view own company" ON public.companies
  FOR SELECT USING (
    id = public.get_user_company_id() OR
    public.is_owner()
  );

-- Only owners can update companies
DROP POLICY IF EXISTS "Owners can update companies" ON public.companies;
CREATE POLICY "Owners can update companies" ON public.companies
  FOR UPDATE USING (public.is_owner());

-- Only owners can insert companies
DROP POLICY IF EXISTS "Owners can insert companies" ON public.companies;
CREATE POLICY "Owners can insert companies" ON public.companies
  FOR INSERT WITH CHECK (public.is_owner());

-- Grant access to new functions
GRANT EXECUTE ON FUNCTION public.get_user_role() TO authenticated;
GRANT EXECUTE ON FUNCTION public.is_admin_or_higher() TO authenticated;
GRANT EXECUTE ON FUNCTION public.is_inspector_or_higher() TO authenticated;

SELECT 'Improved RLS policies applied successfully!' AS status;
