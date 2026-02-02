-- Fix: Link your user to the company that has the vehicles

-- First, let's see what we have
SELECT 'Your user' as info, id, email, company_id FROM public.users;

-- Update your user to use the company that has vehicles
UPDATE public.users
SET company_id = (SELECT company_id FROM public.vehicles_equipment LIMIT 1)
WHERE company_id IS NULL OR company_id != (SELECT company_id FROM public.vehicles_equipment LIMIT 1);

-- Verify the fix
SELECT 'After fix' as info, id, email, company_id FROM public.users;
