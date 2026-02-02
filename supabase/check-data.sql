-- Run this to check your data
-- Check vehicles count
SELECT 'vehicles_equipment' as table_name, COUNT(*) as count FROM public.vehicles_equipment
UNION ALL
SELECT 'users' as table_name, COUNT(*) as count FROM public.users
UNION ALL
SELECT 'companies' as table_name, COUNT(*) as count FROM public.companies;

-- Check if user has company_id
SELECT id, email, full_name, company_id, role FROM public.users;

-- Check company
SELECT id, name, code FROM public.companies;

-- Check first few vehicles
SELECT id, plate_number, equipment_type, company_id FROM public.vehicles_equipment LIMIT 5;
