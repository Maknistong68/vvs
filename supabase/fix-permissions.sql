-- Fix permissions for VVS app
-- Run this in Supabase SQL Editor if app keeps spinning

-- Temporarily disable RLS on vehicles_equipment to test
ALTER TABLE public.vehicles_equipment DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.projects DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.gates DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.rejection_reasons DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.certificates DISABLE ROW LEVEL SECURITY;

-- Grant full access to authenticated users
GRANT ALL ON public.vehicles_equipment TO authenticated;
GRANT ALL ON public.projects TO authenticated;
GRANT ALL ON public.gates TO authenticated;
GRANT ALL ON public.rejection_reasons TO authenticated;
GRANT ALL ON public.certificates TO authenticated;

-- Also grant access to the sequences
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO authenticated;

-- If tables don't exist, this will show an error but that's OK
-- Just means you need to run schema-v3.sql first
