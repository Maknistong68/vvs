-- Add contractor role to the user_role enum
-- Run this in your Supabase SQL editor

-- Add contractor to user role enum (if using enum type)
-- Note: If you're not using an enum, the role is stored as text and this isn't needed
DO $$
BEGIN
  -- Check if the enum type exists
  IF EXISTS (SELECT 1 FROM pg_type WHERE typname = 'user_role') THEN
    -- Add 'contractor' value if it doesn't exist
    IF NOT EXISTS (
      SELECT 1 FROM pg_enum
      WHERE enumtypid = 'user_role'::regtype AND enumlabel = 'contractor'
    ) THEN
      ALTER TYPE user_role ADD VALUE IF NOT EXISTS 'contractor';
    END IF;
  END IF;
END
$$;

-- Create helper function to check if user is contractor
CREATE OR REPLACE FUNCTION public.is_contractor()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid() AND role = 'contractor'
  );
$$ LANGUAGE SQL SECURITY DEFINER STABLE;

-- Grant execute permission
GRANT EXECUTE ON FUNCTION public.is_contractor() TO authenticated;

-- Update RLS policies to handle contractor role
-- Contractors can only view their company's equipment (no write access)

-- Example: If you have RLS on vehicles_equipment table
-- You may need to update your policies:

-- DROP POLICY IF EXISTS "contractors_view_company_vehicles" ON vehicles_equipment;
-- CREATE POLICY "contractors_view_company_vehicles" ON vehicles_equipment
--   FOR SELECT
--   TO authenticated
--   USING (
--     company_id = (SELECT company_id FROM users WHERE id = auth.uid())
--     OR NOT is_contractor()
--   );

-- Note: Adjust the policies based on your current RLS setup
-- The app-level restrictions in the code provide the main access control
