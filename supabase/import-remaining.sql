-- Import remaining records (501-1649)

INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4947GEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Dihraj Singh', '2483159915', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4970GEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Jojy Varghesse', '2483160731', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4972GTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdul Razzaq', '2568043141', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4972XTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammed Sohail', '2534182825', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-29'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4973EXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Saqib', '2565819436', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-10-27'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4974GTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Edwin Broer', '2592360149', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4974LAA', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Sohail Muhammad', '2548939814', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-06-01'::date, 'Failed - Operator TUV expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4978JSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Md Sujan', '2555222906', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-08'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4979BAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-02-06'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4981LAA', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Gulam Ansari', '2565313711', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-21'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4982GEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamad sajed', '2407320130', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-06-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4982GER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdu sattar', '2443577008', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-09-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4982GTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Richard Elores', '2577716661', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4984GTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Fawad Gull', '2569114682', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4984JSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mayaratne Bandara', '2544988732', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-08'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4995DBJ', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4995GTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Antony Xavier', '25666298093', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4998GTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Noel Gozum', '2454073004', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5001EEB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Saeed Mohammed', '1087932677', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5002EEB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Ishwor Darji', '2505868360', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-27'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5002LXB', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Al Hawiti', '1100014438', 2020, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5003EEB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Najm uddin', '2328317470', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-30'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5008JXA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'MUHAMMAD NAWAZ', '2444841890', 2012, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-09'::date, 'Pass With NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5011TXA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'Silas Mulusa', '2504967486', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-06-05'::date, 'Failed No 360 Vision'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5011XAA', 'backhoe'::equipment_type, 'A'::equipment_category, 'Papoo chauhan', '2557444599', 2020, 'pending'::vehicle_status, false, NULL, '2025-12-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5024TXA', 'sewage_truck'::equipment_type, 'B'::equipment_category, 'Namraj Shrestha', '2513278784', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-05'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5032ZXA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Haithm Mohammad', '2571150362', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-12-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5038VBR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, NULL, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-04-21'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5079TSA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'Yaser Al farawi', '2613422340', 2023, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5091DXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Joseph Baakliny', '7155H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5092SNA', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Amarathunga Gedara', '2561682168', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5101ZTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmad Amar', '2431350251', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-10-24'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5105XJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-07-14'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5107DXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdallah Abughazaleh', '2505G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5107XJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-01-27'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5107XXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mohamed Saleem', '2530557202', 2014, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-08-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5108DXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ehab Aly Mohamed', '2520H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-01-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5109DXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Khalaf', '4845G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-13'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5120DXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Steve Hale', '4754G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-02-10'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5124AXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Elsharqawi', '4533G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-03'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5125DXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Alaaeldeen Hassan', '6370H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5126DXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Tamboli, AbdulGafoor', '9611D', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-09'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5127DXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Feras Al Deqah', '5941G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-09'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5129DXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mahmoud Doadoa', '7348H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-12-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5138EXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Arun Titus Titus', '2320937903', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5145EXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mark Ronnel Morete Nieva', '2457509301', 2023, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5164NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Asif Iqbal Khan', '2383131006', 2010, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-01-29'::date, 'Fail, old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5185LAA', 'crawler_crane'::equipment_type, 'A'::equipment_category, 'Monh Sing', '2525248627', 2017, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-03-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5187JDB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abo Al Hassan Ismail', '2353693829', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-03-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5198DTB', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Bilal Hezam', '2449913868', 2005, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800000796)-(SR1)', '2024-12-31'::date, 'Failed old model & Freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5214JTA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Rasool Saidam Zar', '2558002131', 2026, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-09'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5215JTA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Muhammad Qayyum', '2537415701', 2026, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-09'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5217LSA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'Taslim khan', '2541745788', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-06-13'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5220LSA', 'concrete_pump_truck'::equipment_type, 'B'::equipment_category, 'Janat Gul', '2222279586', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-24'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5221LSA', 'concrete_pump_truck'::equipment_type, 'B'::equipment_category, 'Raju Sunar', '2372712741', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-10-20'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5248ZER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Paul Atkinson', '535295048', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5262LSA', 'concrete_pump_truck'::equipment_type, 'B'::equipment_category, 'Hussein Mohammed', '2288117969', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5264ZGR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Johnny Kutty Joseph', '2533913915', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-03-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5274GDA', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Rahman Shah', '2569058080', 2012, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-06-01'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5277ESA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Tanwir', '2301082851', 2020, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-19'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5278ESA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Abdullah Khan', '2531688394', 2020, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-22'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5280ESA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Nour Yash', '2580461248', 2020, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5282ESA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Muhammad Khan Khan Muhammad', '2550483917', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-15'::date, 'FAIL no back light'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5283ESA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Sajjad Anwar Muhammad Noor', '2547200135', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-10'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5284ESA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Noor Muhammad Khan', '2535040741', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-15'::date, 'FAIL 2 TYERS DAMAGE'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5303SAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Harman medez', '2466995632', 2019, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-06-01'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5305AAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'SAGAR SUNAR', '2607886443', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5306AAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'LUCKY SALARIA', '2534596495', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5307AAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'JAMAL UD DIN', '2541355745', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5316RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Joseph Kenick', '1899G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5317AAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'NIRAJ SELVARASA', '2533968257', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5317RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Kaliraj Esakkimuthi', '4581C', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-09'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5318BLA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Abdullah Al Ambari', '2599556004', 2011, 'rejected'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-01-02'::date, 'Fail, Oil leakage'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5318RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Joel Apoliner', '5538F', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-07-14'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5319AAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'AYUB WAKEEL', '2300413537', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5319RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mujib Ahmed Baloch', '8817G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-08'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5320RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Keith Shanahan', '6344G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-04-11'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5321RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Maria Anastasakou', '7215H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-24'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5322RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdalaziz Al Anazi', '5467G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5323RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Talal Elmasri', '7349H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-09'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5324BLA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Muhammad Ullah gupy', '2568635086', 2013, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-01-15'::date, 'Fail, old model, have no TUV'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5324RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'David Forgan', '5557H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5326RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Waseem', 'TBA', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-03-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5327RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Faisal Al Saheel', '8131H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-07-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5328RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Shasindren', '6068H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-03-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5329RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Usman Anjum', '4105F', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-01-15'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5330RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Renjith Janardhanan', '2854F', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-02-18'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5335RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Cameron McIntyre', '1106G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-02-19'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5336RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sheraz  Khan Durrani', '1842G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5337RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Zubair Khan', '6083G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-02-15'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5338RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Elgayli', '4759G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-24'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5341RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Alrwaili, Sajr', '5244G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-12-30'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5342RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Leo Martin', '1485F', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5344RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Khalid Hussain Panwar', '3743B', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-24'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5345RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Kamran Yousaf', '7386G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5346RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Irfan Shaukat Malik', '4349G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-22'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5347RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Nikcklas Parssas', '2530954862', 2023, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2026-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5348RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Christophe Amoussou', '8956G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-04-28'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5349RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ismail Sarip', '8587H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-21'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5364RTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mahtab Ishaq', '590192699', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5368ESA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Naeem Aktar Abdul Ghafoor Khan', '2378800250', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-11'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5370KVA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'TBA', 'TBA', 2019, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5374ATB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Muhammad Nasir Khan', '2561242518', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-06-01'::date, 'Failed- Cracks on the Windshield'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5375UNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sarfaraz Khan', '2543014639', 2025, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5378ATB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Gurindra Singh', '2563346812', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5389ZKD', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Midhun Karepparambil Ravindran', '2559408758', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5395LRA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Ajmal Khan', '2558275778', 2021, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-26'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5402EXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ahmad Awadh', '2592238410', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5403EXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Bablu Jivan Rag', '2594608248', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-27'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5403GER', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-07-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5405EXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Gurpreet Singh Tarlok', '2594033199', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-27'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5405ZKD', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Waqas Ashraf Ashraf Khan', '2522157300', 2020, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5406EXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Naseem Khan Ala', '259665987', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-27'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5406GER', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-10-27'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5410GER', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-07-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5411GER', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-09-02'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5451GER', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-10-19'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5453JTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Qasim Khan Adam', '2576732784', 2026, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5454JTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ahmad Ibrahem', '2557829310', 2026, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5462KRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Abdul rasheed', '2408668834', 2017, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-06-10'::date, 'Failed - old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5470LSA', 'concrete_pump_truck'::equipment_type, 'B'::equipment_category, 'Mohammed Kasif', '2398689477', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-23'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5471LSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-19'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5471NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Murad Ali', '2595857117', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5474AAA', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'M Eldessouki', '2559579327', 2023, 'pending'::vehicle_status, false, NULL, '2025-03-22'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5476RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Saad Mamdouh Abdelwahed', '5622H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-24'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5478RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Saber Abouelinin', '9567G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5479RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Adeeb Alwassel', '4527G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-09-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5480RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Shafeer Peer Mohammad', '1996H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5482RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Suresh Kumar', '6983G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-06-11'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5483RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mahmoud Hussain', '2320H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-04-10'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5485RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohanan Nisanth', '2242C', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-11-30'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5486RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammed Farooq', '9233B', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5488RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'David Sharp', '2568329086', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5490RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Amer Alsharari', '8774G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-09-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5491RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Akhtar Ali Haroon', '8131H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-10-22'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5493RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammed Shaban', '8700H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5494RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Hazim Eidi', '8803G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-07-30'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5495RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ossama Mohamed', '6359H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-09'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5496RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Amir Khan', '4553G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-02-15'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5497RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Osama Sharaf', '8846G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-04-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5498RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ashwin Rabadia', '5818G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-06'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5499RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdulrahim Alsharari', '7860H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5501KXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mohammad Ayedh', '2516223233', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5501RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mehmood, Sarmad', '3327C', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5502KXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Hamzaa Abdul raqib', '2501803684', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5503KXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ahmad Shah Saz', '2515072573', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5503RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mazhar Hussain', '7388G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-10-07'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5504KXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'AZZAM ABRO SALEM', '2509618845', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5504RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammed Aljahdaly', '4863G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-12-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5506', 'coring_drilling'::equipment_type, 'A'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5506RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Khan, Hussain Ahmad', '8079H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-10-07'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5507RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Muhammad', '8971H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-07'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5508RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Jabbar Qayyum', '3794B', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-10-07'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5509RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Khalid Hussain', '3385F', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-10-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5510RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Syed Wasim Shah', '1840G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5511RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Nadeem Ahmed', '2026G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-01-27'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5514KXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mohammed Sadiq', '2347292175', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5515KXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'mohammad ameen', '2586837730', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5516KXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Osamah Zaid', '2575504465', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-05'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5526ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Diego Hernandez', '20004019', 2023, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5528RSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'WAHAB NOOR', '2583433210', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5532RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Saaid Mohamed Saaid', '8217G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5534', 'coring_drilling'::equipment_type, 'A'::equipment_category, NULL, NULL, 2021, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5534BKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Bilal Eid', '2525287468', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5535ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Timothy James', '20004545', 2020, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5536RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Khalidsorkatti Belail', '5375G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5537RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Taher Azzam', '4208G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5538RSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'HARUNA EROMOSELE', '2502644376', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5539RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Bilal Abbasi', '6173G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-09'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5539ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammad  Alobaidan', '559024342', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5540RSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Hozifa Khan', '2583722596', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-06-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5540ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammad Alashhab', '20004066', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5542RSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Sana Ahmed', '2566936775', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5543BKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Fawad Ali', '2336194325', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5543ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Spyridon Gerontopoulos', '20002427', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5545RSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MOHAMMED USMAN', '2541539017', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5547RSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MOHAMMAD AKHTAR', '2541536682', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5549RSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Jabbar Ali', '2532712078', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-07-05'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5563RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Bajee Shaikh', '3748B', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-12-30'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5573KSB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Rakan Alghanmi', '552464481', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5579DTB', 'service_truck'::equipment_type, 'B'::equipment_category, 'Balwinder Singh', '2564932180', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-05'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5581UTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-10-28'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5581VSR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Robert Ruse', '10000350', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5591UTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-11-03'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5594DTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammed Khan', '2571685110', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-05-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5596ZER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdullah Alghareeb', '20002180', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5598LSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Noor Muhammad Khan', '2535040741', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-01-15'::date, 'Fail, windshield damage'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5598NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5603UTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-11-02'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5604UTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-07-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5634EAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Hamza Rafique', '2527688549', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5641VAB', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2024-12-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5659LEA', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Munawar Hussain', '2227680440', 2010, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-06-01'::date, 'FAILED- Old Model, 360-degree not achieved'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5672END', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Faseel', '2353204734', 2020, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2026-04-14'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5674ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'TBA', 'TBA', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5688URA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Sudais Khan', '2575748187', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-12-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5691SLD', 'ambulance'::equipment_type, 'B'::equipment_category, 'Mustafa Muhammad', '2432178909', 2020, 'pending'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2025-12-18'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5694EGR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Allah', '2486248356', 2024, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2026-05-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5716RAA', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, NULL, NULL, 2021, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2024-05-08'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5721KXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Ashfaq', '256597398', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5767ZER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Alan Capis', '531492047', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5770ZER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Rajeesh Abraham', '591959961', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5774SXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Hamada Faroq', '2184638803', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5776ZER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Frank Smolders', '2570703559', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5779BAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-04'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5789XXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-07-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5790EAD', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'ANDREY TSARIKOVSKIY', '774303607', 2024, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2026-09-04'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5820ZGR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdel Fattah', '2557518301', 2024, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2024-06-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5868ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Vinod Kumar', '20002259', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5872ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Yaser Aldosari', '20004707', 2023, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5883EJJ', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-07-21'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5887ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ron Van Wijk', '20003370', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5895GDA', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Rahman shah', '2569058080', 2018, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-06-01'::date, 'Failed - old model , freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5896AGB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mansour Mohamed Sharara', '2234893655', 2024, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-12-31'::date, 'No Iqama - Visa holder only - 3 months approval'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5896ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Stefan Van Der Boom', '10000532', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5897ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Dimitrios Varsamidis', '20003887', 2022, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5898AGB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Ahmed', '253460339', 2024, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5898ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Alan Hobbs', '20003892', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5901ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Adam Barber', '20004050', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5905DTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Suliman Ali', '2544742360', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-09-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5907ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'David Holburn', '20002980', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5912TXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'HUSSEIN MOHAMMED', '2510676428', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-07'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5927ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Bsam Ali Alboq', '508388030', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5933ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdul Aziz AlHujairy', '1079963391', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2026-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5934ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Lawrence Moller', '20002109', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5936ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Rakan Alkhan', '20005390', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5942BXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Anzar', '2520435569', 2021, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2026-05-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5949DAT', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Md Osama Mustafa', '2439698495', 2017, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-12-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5952BSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Om Prakash Ram', '2505361416', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5958LSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-15'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5958NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Muhammad Othman Ali', '2539057287', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5961BSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'talwinder singh', '2594116002', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5961ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Domingo Marchan', '553680471', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5962BSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Suk Man', '2578761989', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5963BSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mohammad Imran', '2591626045', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5969BSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Louky singh', '2534596495', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5971ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Philip Eiszele', '20001521', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5973ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdulrahman Albluwi', '20001499', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5974BSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Suraj Kumar', '2596352225', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5977BSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Suranga Sanayaka', '2533969420', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-10-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5978BSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Muhammad Jhangeer', '2588725065', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-10-23'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5979BSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Krishna Sunar', '2578953602', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5982ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmad Abdullah Alqessuer', '564687797', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5987BSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Prakash Nibali', '2603490497', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-08-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5992RTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mitch Hawkins', '532968876', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5993BSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ravinder singh', '2594114965', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5995BSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Munil Kumar', '2602373496', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '5996RTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Nicolaas Dyzel', '20000940', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6008ZER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Irshad Magod', '596613509', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6010RTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Erkan Bozkurt', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2025-07-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6011RTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Tushar', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2024-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6012RTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Osama Saleem', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2024-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6014ZER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammed Dirar', '537865801', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6029JTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Samuel Borelli', '20002936', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6030NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Ali Reda', '2571562392', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-15'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6032NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Saklayn', '2571562798', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-03-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6033NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Muhammad Asif', '2571562699', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-19'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6035NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Muhammad Anas', '2517820409', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-10'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6036NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Nazakat Hussein Mohammed', '2338519891', 2021, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-04-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6037NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Altaf Mad Ain', '2549039325', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6038NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Shir Hussein Dorman', '2541744617', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-05'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6039NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Abdul Hamid Mahboob', '2500888215', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-19'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6045ZER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Shihab Meppukkudy', '2569119833', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6046ZER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Erwin Vasquez', '550427475', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6048NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Muhammad Taj Khan', '2066573912', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-01-15'::date, 'Failed, insurance expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6049LTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Roopesh Haridas', '2596059853', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6049NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Aineam Allah', '2571562616', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-15'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6057VLA', 'concrete_pump_truck'::equipment_type, 'B'::equipment_category, 'Roshan Ali', '2222279859', 2012, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6062ZER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Samar Khan', '500259283', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6082GKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Jay Zekaj', '531879530', 2024, 'pending'::vehicle_status, false, 'Oxagon/DSV (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6085NRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'RUK BAHADUR RANA', '2601360171', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6096SSA', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Faheem Uddin Firoz', '2253030585', 2021, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-02-03'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6102BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Sudais Khan', '2575748187', 2015, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-02-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6110AZR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Walter Navarro', '2559616863', 2024, 'pending'::vehicle_status, false, 'Oxagon/DSV (PMC) - (B)', '2026-08-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6110ERB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'AbdElrahman Essam', '2584242545', 2020, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-07'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6117LTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ali Nabil', '530769782', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6119LTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Nauman Khan', '2568229518', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6121LTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-07-15'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6123LTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammad Abutaleb', '534907612', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6134LTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Jalil Muhammad', '2478400431', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6142LTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Riaz Khan', '536228043', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6150BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Abu Sufiyan Ijaz', '258990289', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-06-01'::date, 'Failed-Old Model & Freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6157KSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Asim Hamood', '2499458090', 2007, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-06-01'::date, 'Failed-Old Model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6158ZER', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-11-04'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6160NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Asrar Khan', '2544563006', 2020, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-04'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6180BXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'KHAILI MUHAMMAD', '2370155117', 2014, 'rejected'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2025-08-07'::date, 'FAIL NO LMI'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6182BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Dilshad Khan', '2578059111', 2015, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2026-03-24'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6184BXA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Abdul Khaleq Ali', '2558553679', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-04-23'::date, 'Fail, freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6185BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Shauqat Ghulam', '2590001117', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2026-02-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6190BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mudassar Ahmad', '2587252343', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-12-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6201ERB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sameh Mostafa', '2248254456', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2024-11-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6204BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Surya Man', '2606430631', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6206BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Amrit Lama Gole', '2580128383', 2020, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6207BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Karmjit Singh', '2572916076', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6213KEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'TBA', 'TBA', 2024, 'pending'::vehicle_status, false, 'Oxagon/DSV (PMC) - (B)', '2025-11-20'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6214BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mohammad Hussain', '2563859467', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-13'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6214KEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sean Gerald Lennon', '562820053', 2024, 'pending'::vehicle_status, false, 'Oxagon/DSV (PMC) - (B)', '2026-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6215BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mubashir Jalil', '2564483424', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6215KEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Rainer Manuel', '506695800', 2024, 'pending'::vehicle_status, false, 'Oxagon/DSV (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6227ERB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Nasser', '2320927110', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2026-10-13'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6241ERB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Abdulhameed', '2143281935', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2026-05-12'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6251KSB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Rab Nawaz', '2353806405', 2021, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-06-24'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6266BXA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'Mamdouh Ali Sedik', '2316642657', 2020, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-03'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6279NZR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Joachim Kauffeld', '2561160157', 2023, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-12-05'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6280ZSB', 'concrete_pump_truck'::equipment_type, 'B'::equipment_category, 'Vikram Singh Bhanwar', '2548968227', 2021, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6284TLA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'Mahire', '2122482603', 2012, 'pending'::vehicle_status, false, NULL, '2025-04-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6285LTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-10-27'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6286TLA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'Monir', '2525980583', 2012, 'pending'::vehicle_status, false, NULL, '2025-04-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6289XER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Aljabr', '1076884459', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6292GKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Gerhardus Du Plessis', '20006179', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6299KTB', 'service_truck'::equipment_type, 'B'::equipment_category, 'TBA', 'TBA', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-07-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6301TLA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'Nasire', '2430271888', 2013, 'pending'::vehicle_status, false, NULL, '2025-04-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6333SSA', 'dyna_mini_truck'::equipment_type, 'A'::equipment_category, 'Tahir Khan', '2516233554', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-03-05'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6342LTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Cafui Ouensou', '2571374400', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6364BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mushtaq Ahmed', '2588355129', 2015, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-03-24'::date, 'PASS WITH NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6367BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Farid Ullah Hazrat', '2576377630', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-06-01'::date, 'Failed-Old Model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6374NAA', 'forklift'::equipment_type, 'A'::equipment_category, 'RAHID ALLAH', '2527320234', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6384JTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdul Rahman Altqiqi', '533186910', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6393AZR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sohil Arshad', '2477296061', 2024, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2026-05-26'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6426BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mohammad Nazim', '2552421824', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6427BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Jog Raj', '2564922843', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6428BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mema Tamang', '2581040173', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6429KHR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Tassawar Hussain', '2477694901', 2025, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-08-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6434LRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Gangaram', '2563391156', 2020, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6437LRA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'Samantha', '2287720177', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6439BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ahmed Raza', '2592738146', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6439LRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mahmood Abdulrauf', '2409123870', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6440BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Amrit Lama', '2580128383', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6441LRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Rakesh Kushwaha', '2535589234', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6442BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ashok lal', '2603052842', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6442LRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Firoj Ansari', '2576871459', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-12'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6443BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'AZAD GULL', '2574647356', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6445BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Kuldeep Singh', '2551071802', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6445LRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Santa Kumar', '2563391362', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6446LRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Abali indika', '2533113706', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-28'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6454BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Muhammad ullah gul', '2568635086', 2015, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-03-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6457BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'AHMED RAZZA', '2592738146', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6457XRR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-09-08'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6458BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'TALAK BAHADUR', '2605704358', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-27'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6459BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MUHAMMAD ZAHID', '2513142279', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6460BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'AMANDEEP SINGH', '2569527894', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6461BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Jaspreet singh', '2579068731', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6463BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Onkar singh', '2571148077', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6467DTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'NABI RAHEEM', '2543364653', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6467XRR', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-11-25'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6468DTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MAGED ABDO', '2590770125', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6470DTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'ABDUBASIT BASRULAH', '2266160114', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6470LRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Gurjeet Singh', '2551071257', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6471DTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MOHAMMED AMIN', '2586837730', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6472TAA', 'concrete_pump_truck'::equipment_type, 'B'::equipment_category, 'Dawood Ali', '2122497981', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-19'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6472XRR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-12-30'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6475XRR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-03-01'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6476KXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Osama Samih', '2579332111', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6486BGR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Assem Omar', '2561970621', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-03-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6486BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ishtiaq Zaman', '2466755861', 2015, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-02-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6490BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Raj Kumar', '2571148101', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6491DTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MARZOQ NASEER', '2267611990', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6493DTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'BILAL ALI', '2502317783', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6494DTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MOHAMMED MOHAMMED', '2362928414', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6495DTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'ALI AHMED', '2206381515', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6496DTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MOHAMMED KHAN', '2613063573', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6497DTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'ALI ABDULLAH', '2499422257', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6498DTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'SALEH AHMED', '2548538863', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6498ZER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Tamer Ebrahem', '2431788849', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6499DTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'ALI ALI', '2590966400', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6500DTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'KHALED SALEH', '2197735341', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6501KXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Omar Ahmed', '2606185409', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6501RTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Didar Singh', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2024-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6502RTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammed El Nagar', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2024-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6503VRA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Hussain Khan', '2555540745', 2013, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-06-01'::date, 'Failed - old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6504RTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Medhat Ahamed', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2025-07-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6506RTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sohail', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2024-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6543VNA', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Anushka Nishantha', '2545363364', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-03-08'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6558HRA', 'tanker_truck'::equipment_type, 'A'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-01-04'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6562NRB', 'service_truck'::equipment_type, 'B'::equipment_category, 'Mohsen Ali Alburaiki', '2590620015', 2020, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6570NKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammaed Aamir Sohail', '2558478257', 2024, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2024-06-27'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6576KXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Osama Samih', '2579332111', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6577JJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Hassan', '5084H', 2023, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-01-20'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6578JJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abo Elanan Adel', '2001G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-06-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6579JJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mudaliyar  Vijaykumar', '5075H', 2023, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2026-02-24'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6580JJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed, Jesnafarshera', '8649G', 2023, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-01-06'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6581JJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Otty Msuku', '6039G', 2023, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6582DSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Haider Ali Mir Aman', '2596237954', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-20'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6582JJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Junald Cabaluna', '7798H', 2023, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-09-11'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6583JJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Manik Budida', '4126H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6588DSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Muhammad imran haneef', '2591626045', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-06-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6590DSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Suraj Kumar Baniya', '2596352225', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6591DSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Shyam Prasad', '2603489424', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-10-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6592DSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Shyam Kumar', '2603489622', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6595DSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Niraj selvarasa', '2533968257', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6596DSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Sharukh khan', '2593514413', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6598KXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Salman Hadi', '2554039137', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6604JJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Barry Mclean', '1947H', 2021, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-07'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6610EDA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mohammad Ansari', '2574231474', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6610GKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Halah Alsayed', '20003346', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6620KXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Salem Omar Ali', '2582751406', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6622GAA', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Afsar Ahmed Shekh', '2566924086', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6637JJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Iftikhar', '2171G', 2023, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6647BZA', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2012, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-07'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6648KXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Hazim Qaid', '2574402026', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6649KXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Asem Ahmad', '2516492440', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-02-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6650KXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Saief Odhah', '2513109518', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6654JTA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'FAISAL MEHMOOD', '2608798811', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-05'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6671KSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Imran Ali', '2571562558', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-03-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6672KJA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Usman Ali Muhammad', '2481812549', 2017, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-01-15'::date, 'Fail, old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6672KSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6673KJA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Ishtiaq Haroon', '2538248523', 2013, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-03-24'::date, 'PASS WITH NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6673KSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Thourseef Saghir', '2558354557', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6674KSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Muhammad Taj', '2066573912', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-10'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6675KSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Nozish Khan Farhad', '2531619415', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-15'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6676KSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Inayat Alam', '2490748718', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-19'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6677KSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Muhammad Shahzad Iqbal', '2568314336', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-03-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6678KSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Khaled Khan Khan', '2584954875', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-03-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6679KSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Muhammad Luqman Nithar Ahmed', '2521012837', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-22'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6680KSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Anwar Ali', '2549423537', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-19'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6681KSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Abdul Majeed', '2371072790', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6681SEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammed Asif', '2551773621', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6683KSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Muhammad Arif Akram', '2551447523', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-15'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6685KSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Rajinder Chaursia', '2388157329', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6694NZR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Vinesh Unni', '2559731563', 2024, 'pending'::vehicle_status, false, 'Oxagon/Araner (4800001137)-(SR3)', '2025-03-09'::date, 'ok'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6719VDB', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Alaa mahmoud', '2299596623', 2020, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-06-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6720AZR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Nigel Wooding', '597200194', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6748TXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'MUHAMMAD NASIR', '2226275440', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6749TXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'MUHAMMAD IKRAM', '2608341794', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6752EDB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'FAZAL RAHIM', '2576663237', 2018, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-05-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6754AXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Christopher  Harris', '6921G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-09'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6759AXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sujit Jose', '91071', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-01-27'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6764TXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Arif Ibrahim', '2238653857', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-03-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6771GKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Patrick Kolodychuk', '20003352', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6776SAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, NULL, NULL, 2012, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2024-06-15'::date, 'FAILED not equipped with PWAS'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6782GKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Anas Alaysuy', '20002775', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6789JEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Aravind Mohanen', '2586376622', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6790JEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Salah Mohamed Abdel Latif', '2570987624', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-02'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6791AXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Haithem Guezguez', '8689G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-01-25'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6791JEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Subeg Kumar', '2537557338', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-02-25'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6791SBR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ericson Alipio De Borja', '2396981488', 2022, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-12-30'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6827AXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Dimetreous', '2418347858', 2024, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2026-03-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6827ZTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6832DXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'ZABITA KHAN', '2618585836', 2020, 'pending'::vehicle_status, false, 'Oxagon/RPCO (SR1)', '2026-04-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6869EDA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mahmoud Rauf', '2409123870', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6870AXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmad Ashfaq', '5162G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-14'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6871AXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Joan De Vletter', '1798H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-02-15'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6871EDA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Joseph Luxman', '2517902223', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6875EDA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Moduy Raman', '2545306660', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-18'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6878EDA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'TBA', 'TBA', 2020, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-12-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6903TSA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Mohamed elamin', '252290416', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-09-03'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6911LTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Gabriel Felecan', '20006161', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6925AXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sibghat Ullah khan', '1384G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6926AXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Shahzad', '3090G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-09-22'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6938NXA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'Talal Muhammad', '2232976510', 2021, 'pending'::vehicle_status, false, NULL, '2025-06-02'::date, 'Failed - No camera'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6944NRA', 'sewage_truck'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/KAMETC - (B)', '2025-05-05'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6965DAA', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Muhammed Hussain', '2488882966', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-03'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6965DSA', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Saeed Sajaad', '2334644438', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-10-23'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6971DAA', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Awad Gad', '2241426192', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6977UTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Yiannis Constanti', '20008314', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6978UTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Biraju Kumar', '2381048871', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6983DAA', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Abdou Hassan Ali', '2558630584', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-04'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6995EXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-05-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '6999DAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Rajeev Kuma Yadav', '2539556874', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-21'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7004TEB', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Mohammad saleh mohsen', '2599636194', 2014, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-06-01'::date, 'Failed - freelancer, No camera , old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7046NTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ali Ibrahem Mahmoud', '2587690468', 2023, 'pending'::vehicle_status, false, NULL, '2026-09-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7051BSB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Zeeshan Ahmed', '2508235856', 2012, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2024-06-15'::date, 'Fail, No camera'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7094ZDB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Palani Chamy Sannasi', '2566000895', 2020, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2025-09-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7098NXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Faheem Khan', '2253030858', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2026-05-26'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7137GRR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Grigoris Christofides', '20004428', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7139XBR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Nora Al Balawai', '7858G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-08-27'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7140XBR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Prasanth Mecheri', '1626H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7141XBR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Ibrahim Kamel', '9084G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7150EER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'TBA', 'TBA', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7203BTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sani kumar sah', '2510171560', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-03-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7214TTB', 'ambulance'::equipment_type, 'B'::equipment_category, 'Zahid Hussain', '2587992500', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-22'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7219BTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-21'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7225AEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Rudy Pomperada', '2308301346', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7233AEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Jihad Mohammad', '2545419521', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7239AEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sikandar Ali', '2237990425', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-01'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7243AEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'TBA', 'TBA', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7248KAA', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'ABDUMAJEED HUSSEIN', '2553100419', 2023, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7256AEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Saied Taher Mahmoud', '2563733738', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-01'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7264AEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdel Majed Basim Fayiz Nember', '2218858849', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-01'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7292BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Zakir khan', '2341048300', 2013, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-06-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7298NXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Khan', '2325921407', 2023, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2026-02-03'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7315EER', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-10-27'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7328RDB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Usman Ud Din', '2546801503', 2018, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7330EER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Zyad al amri', '1100662657', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2027-01-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7337DSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Amjad Latif', '2545095347', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7338DSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'NAZID ULLAH', '2593121797', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7339DSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'AMJAD LATIF', '2541536682', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7341DSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'JAMSHID ALI', '2549021844', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7343HKA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ejaj Ahmed', '2596657912', 2011, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-07'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7345HKA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Parvij Ahmad', '2596659769', 2011, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-10'::date, 'Pass W/NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7346HKA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Haithm Mohammad Saleh Ba Makhshab', '2571150362', 2020, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2024-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7349SSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Saleh Ibrahim', '2651627371', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-04-09'::date, 'Fail Iqama expire'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7350DSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MOHAMMADWAQAR', '2549024749', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7350SSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Haitham Barakat', '2591548900', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-06-01'::date, 'Failed- No Camera and Sticker'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7351DSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Abdul Salam', '2520768546', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7351SSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Hussain Abdelazim', '2591548736', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-06-11'::date, 'Failed iqama expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7352SSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Khurram Shahzad', '2534932765', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-01-28'::date, 'Failed iqama expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7353SSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ahmed Mansour Abdou', '2594234094', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-06-01'::date, 'Failed- No Camera & Sticker'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7354SSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Meharban Khan', '2551273770', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-03-05'::date, 'Failed Iqama Expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7358SSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mahmoud Elkhiat', '2591500604', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-06-01'::date, 'Failed- No Camera & Sticker'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7358TXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Moshiur Rahman', '2529007441', 2023, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-11-30'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7360BAA', 'forklift'::equipment_type, 'A'::equipment_category, 'Abdul Aahid Alashwal', '2278587452', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-01-15'::date, 'fail, freelance , Old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7365LSR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Denis Bondarenko', '508141913', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7378BER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Bader Robhi Al-Aradi', '592128830', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7398AXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Momin', '2521595245', 2021, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7403HXA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'SHAHAB KHAN', '2606284186', 2025, 'rejected'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7445EER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Nezar Battan', '20001929', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7445KDR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-11-03'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7446KDR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-09-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7450KLB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Alhawiti', '1120180722', 2012, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7457RRD', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammad Moin', '2407472733', 2015, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2026-06-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7467JSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Saeed ali', '2571272182', 2020, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-11-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7502', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-04-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7506JSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-01-28'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7506KJB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Saleh Ali', '2340993993', 2020, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-05-13'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7507JSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Hassan ali saeed', '2383090087', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-06-12'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7523ZZA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'HOMEL GUL', '2528872985', 2013, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-04-24'::date, 'PASS WITH NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7526BAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Dil Nawaz Habib', '2295235010', 2008, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-03-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7534HEJ', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Mohamed Sobhi Shaalan', '2356724878', 2015, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7544ATA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'ALI MOHAMMAD', '24996555930', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7549VXB', 'dyna_mini_truck'::equipment_type, 'A'::equipment_category, 'Sikandar Nawaz', '2327706038', 2013, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-20'::date, 'PASS WITH NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7559ERA', 'sewage_truck'::equipment_type, 'B'::equipment_category, 'TBA', 'TBA', 2013, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7567SJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Haiat alatawi', '1086155932', 2023, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-05-28'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7568NSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Muhammad Zeeshan', '2535750135', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-12-05'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7572EER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Halim Rashid', '507132906', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7573EER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sharique Khan', '508733517', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7578UXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-13'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7584UXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Hesham Alsharfi', '2580386066', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7589UXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Fawaz Dilshad', '2588058064', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-09-15'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7619VBR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-13'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7640VRR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Maged Naguib', '2565666738', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-07'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7656XER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Randy B. Dupaya', '2325036925', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-07-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7680XER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Julian Bylykbashi', '2560851327', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-07'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7708TXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Qasid', '2394109744', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-05-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7709TXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Adnan Khalq', '2506295142', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7713TXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Mohammed', '2533806291', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-29'::date, 'Failed - Freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7716XER', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-06-12'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7731GSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Naik Rahman', '2514862396', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7734GSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'shamsher singh', '2570354189', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-02-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7735GSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mohammed riza', '2592781955', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7735XER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Yasser Mohsen Abdalla Mohamed Abdalla', '2570153359', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-07-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7736GSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Dungar Ramja Khan', '2593028828', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7747TXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Omar Mokthar', '2446314722', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7751NXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-10-23'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7752JJB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Tuseef Gondal', '2526590795', 2023, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2026-05-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7756NXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-10-23'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7757NXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-10-22'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7757VTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Chutta Laghari', '2520529567', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-03-01'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7775NSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ebrahim Ali', '2545982437', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2024-12-29'::date, 'Failed Freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7782LUR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammed Bassam', '2536189075', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7787VTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mahmoud Ali', '2551647940', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2026-08-06'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7792NXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-09-22'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7795NXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Amir Jawaid', '2531558100', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2026-05-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7798VTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Jamil', '2551045061', 2024, 'rejected'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2025-03-11'::date, 'Expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7798ZAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Rahman Khan', '2587571643', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-12-08'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7800VTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdo Ali Qaid Al-Matri', '2265644290', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2026-08-06'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7803VTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Waqif Khan Azeem', '2545755502', 2024, 'rejected'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2025-11-03'::date, 'Expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7804VTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Imtiaz Ahmad Gondal', '2391704943', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-12-22'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7809KDR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-07-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7821UTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Masoud Qadeer', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2025-08-25'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7833ATA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Ali ahmad mohsen', '2558474553', 2024, 'pending'::vehicle_status, false, 'Oxagon/RPCO (SR1)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7837GSB', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'FAIZ ULLAH', '2531105290', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7855BXA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Muhammad Waseem', '2544043298', 2014, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-06-01'::date, 'Failed-Old Model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7883EER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Jeffrey Bernal', '2470792728', 2023, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2026-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7890EER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ernesto Leiva', '536543286', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7897UGR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Zyad Abdulelah Alamri', '559912316', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7902EER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Aseel Melibari', '555074730', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7917SBR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammad ashlar', '2538797388', 2022, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2026-05-06'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7946JTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-07-28'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7956XER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Suresh Rayudu Veera Venkata', '2513524278', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-02'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7980ESR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sander Keersmaekers', '2603814274', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '7WJ00494', 'grader'::equipment_type, 'A'::equipment_category, 'Mohamed Waqas', '2363494226', 2010, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-03-01'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8052RAA', 'forklift'::equipment_type, 'A'::equipment_category, 'Fayyaz Hassan', '2558785800', 2012, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2024-12-29'::date, 'FAILED-Freelance-No Issurance-No TUV'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8053GSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Masrullah saif', '2489349230', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-10-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8064RHR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Usama Qadri', '2525179657', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-08-09'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8067GBR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Shiraz Uddin', '3863G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-09-07'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8067RHR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Carlo Banadero', '2603100260', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8068GBR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Anup Kumar', '7735H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-01-29'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8069GBR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Omer Eltigani', '9481G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8071GBR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Riad Bleibel', '3285E', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8082RHR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Dennis Abraham', '590341603', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8083RXB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Sirajul Islam', '2552231314', 2022, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-09-15'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8090JEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Imran', '2534715699', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-10-07'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8129HRA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Tah Ahmed', '2571150131', 2013, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-10'::date, 'Pass W/NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8146DJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Khalid Saad', '8657H', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-11-19'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8148DJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ricardo Ferreira', '7121G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8151ZRA', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Jehan Said Jehan', '2426490542', 2021, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-12-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8153ZEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Younes', '2288619493', 2025, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2026-07-13'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8155ZEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'MOHAMMED ASLAM', '2562842498', 2025, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2026-06-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8192UXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-01'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8193GNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohd Javed Iqbal Ansari', '2490823933', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8194GNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Liam Connor Visser', '2560383602', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8197GNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sultan Khan Ateek Ahmad', '2510845247', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8198GNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Waqas Ahmed', '2523105746', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8199GNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'John Michael Oriola Artienda', '2449470737', 2023, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8202GNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Waqas Asharaf', '2522157300', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8203GNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdul Rehman', '2470458395', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-05-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8204GNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Fawaz', '2591484288', 2024, 'verified'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-05-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8207GNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Irfan Hussain', '2294697608', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8208GNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Luisito Layzal C. Operio', '2450040874', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8210GNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Kamal Soeker', '508600425', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8210SNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Kamaal Soeker', '2557418882', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-05-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8219GER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Koen Adriaensen', '2569646520', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8234GER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Danny Van Dommelen', '2570871653', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8245UGR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Ashraf', '2567504671', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8247VXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, NULL, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-04-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8249GER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ridwan Willes', '2569205913', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8253LDB', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Muhammad Zeeshan', '2542517038', 2010, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-06-15'::date, 'Failed - Old model, camera & freelancer'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8254VXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Conor Byrne', '20002373', 2023, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8266ATR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Shahbaz alam mohammad', '2431846514', 2023, 'pending'::vehicle_status, false, 'Oxagon/PUBLIC SAFETY NEOM - (B)', '2026-05-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8270ATR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/PUBLIC SAFETY NEOM - (B)', '2025-10-14'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8280BTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Emad Ghandourah', '20001926', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8303BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'SAEED ANWER', '2560912681', 2014, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-04-20'::date, 'Pass With NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8305BXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2013, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-02-04'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8306BXA', 'tanker_truck'::equipment_type, 'A'::equipment_category, NULL, NULL, 2013, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-06-19'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8311ASA', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Ajith Kumarak', '2531571558', 2016, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-03-08'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8312LDA', 'service_truck'::equipment_type, 'B'::equipment_category, NULL, NULL, 2010, 'pending'::vehicle_status, false, 'Oxagon/KAMETC - (B)', '2025-05-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8317NXB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'MUHAMMAD ASLAM', '2549022107', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-05-27'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8317RHR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2025, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8347LTB', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Ranjit Kumar', '2576352625', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8354STR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdulaziz Sahala', '547118342', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8369XBR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'M. Khawar Ijaz', '2472939236', 2022, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8384NTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mahmoud Attia Abu Elela Ali', '2558110603', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-03-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8387NTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Mounir Mohamed Abd Elmotleb', '2574229015', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-02'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8388NTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Dileep Kumar Kushwaha', '2349645727', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-10-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8389NTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mena Melad Farag Banob', '2574763427', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-07'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8391RXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Sushant Pakhrin', '2564862809', 2024, 'pending'::vehicle_status, false, NULL, '2025-08-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8395NTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sakhir Khan', '2574951550', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-07'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8395RXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Shamsu Islam', '2255259485', 2024, 'pending'::vehicle_status, false, NULL, '2025-03-19'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8397STR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Saleh Suliman Alatawi', '564069559', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8400NTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8403DXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'AZIZ URAHMAN', '2595348067', 2020, 'pending'::vehicle_status, false, 'Oxagon/RPCO (SR1)', '2026-04-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8416JVR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdullah Elshazly', '2529121036', 2025, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-08-05'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8431RHR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mazin Mohamed', '6123652519', 2025, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-09-29'::date, 'No Iqama - Visa holder only - 3 months approval'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8433STR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhannad Abusaydah', '560885800', 2023, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2026-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8435XZR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammed Almuwailhi', '20000771', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8437XZD', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Omar Mohammed Bashammakh', '599113885', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8438STR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Albara Osama Abdalkader Alhamdi', '556152102', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8440XZR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Bakr Azzam Alruhaymi', '548070038', 2023, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8448GTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdul Aziz', '2346231000', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-10-27'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8449RXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-10-27'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8469AGB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Azim Mudaikodi', '2552420420', 2024, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8472ZAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Qamrul Zama', '2549859888', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8499ZAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Muhammad Hassan', '2493285007', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-10-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8505XSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'ABDULLAH MOHAMMAD', '2550040659', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-06-09'::date, 'Failed - Freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8512ADA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Muhammad Abdul Rauf', '2409123870', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-06-01'::date, 'Failed-Old Model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8561KSB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Brij Mohan Vrma', '2395651330', 2021, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-06-06'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8569ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Niraj Kumar', '2560404200', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-18'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8572ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Andrew Don', '2367690860', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8573ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Nimal Arachchg', '2560449734', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-13'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8589ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mahesh Kumar', '2557796147', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-13'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8590ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Gurpreet Jandu', '2574231375', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8591ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Yadav Pratap', '2554863007', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8593ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Sandeep Singh', '2555224118', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-27'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8594ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Jalil Ali', '2555970736', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8595ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Amirullah ansari', '2574231474', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8597ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Irshad Ali', '2551071018', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-18'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8598ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Madi Raman', '2545306660', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8599ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ericson Realin', '2441330509', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-10'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8615ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Canadana R', '2529080505', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-18'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8616KSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Om Parakash', '2505361416', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8619KSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Rabbani para', '2577541218', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-08-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8620KSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Khanaz Gul', '2524019409', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-10-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8624ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'olintan de silva', '2532729189', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8625ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Dharmakreme', '2534595000', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-12'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8627ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Sandeep Singh', '2555224118', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8628ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Multala Muhammad', '2459299620', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-12'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8632KSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'khan Mumtaz', '2584703363', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-09-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8632ZRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Kasun Pathirana', '2535587592', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-13'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8634RHR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2026-02-27'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8643RTB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Ahsan Allah Mohamed', '2558844250', 2019, 'rejected'::vehicle_status, false, 'Oxagon/AL FAHD (4800000823)-(SR2)', '2025-06-01'::date, 'Failed- No Reverse Alarm and Defective Reverse Light& NO PWAS'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8673UTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Abdullah Alobaidan', '555370232', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8697DAR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ulyssis Cruda', '551490582', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8697VEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Abdelbaki', '2480272729', 2025, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2026-05-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8701TRB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Arbab Husain Jafar', '2445985928', 2019, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-12-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8726VRA', 'dyna_mini_truck'::equipment_type, 'A'::equipment_category, 'NOOR GJULAM', '2553946811', 2023, 'pending'::vehicle_status, false, 'Oxagon/RPCO (SR1)', '2026-06-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8782LDB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, NULL, NULL, 2016, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8793DSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'SHAHAAB GUL', '2602356012', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8794UTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Bader Alaradi', '1049980467', 2023, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2026-06-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8795RTB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Rana Abid', '2395857705', 2011, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2026-02-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8795TRB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Nasim Khan', '2555539275', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-06-01'::date, 'Failed- 360 degree not achieved'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8796SSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MUHAMMED IRSHAD', '2541537185', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8797SSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'AQEEL UR REHMAN', '2549026595', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8798SSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'DEEPAK KUMAR', '2541537300', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8800SSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MEHMOOD HUSSAIN', '2549022396', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8801SSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'AFZAL AHMED', '2549025738', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8802VKA', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'HAYAT ALI', '2610514735', 2012, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-01-24'::date, 'Failed - No 360 Vision'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8803RNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2025, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8804NJR', 'ambulance'::equipment_type, 'B'::equipment_category, 'Mohammad Yaqoob', '2544548890', 2021, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-11-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8808', 'backhoe'::equipment_type, 'A'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8814HKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abd EL Satar Khan', '2560441608', 2021, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-07-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8821HKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Zu Alqarnin Farhan', '2546960481', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-23'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8831KAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Asif', '2342620405', 2023, 'pending'::vehicle_status, false, NULL, '2024-06-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8865VKD', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Yasser AbdAlla', '2272560182', 2025, 'pending'::vehicle_status, false, NULL, '2026-09-22'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8875USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'GUL ZADA', '2538215209', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8877DXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Guru Timsina', '2553297447', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-27'::date, 'Failed - Old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8877USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MEHMOOD ALI', '2526180878', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8878USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'AKHTAR MUHAMMAD NOOR', '2567848631', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8890TUA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Adnan Hanif', '2559788951', 2012, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-01-07'::date, 'Old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '88914', 'bulldozer'::equipment_type, 'A'::equipment_category, 'ABDULLAH SAIF', '2570273173', 2022, 'verified'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8901DXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Gopal Prasad', '2553298189', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-27'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8923VTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Aamir Farooq Janjua', '2254829001', 2023, 'pending'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2025-12-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8924VTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Faisal Muhammad', '2404437986', 2024, 'pending'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2025-12-15'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8966ADA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mid Khan', '2555222906', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-13'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8970GNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Faisal Shah Said', '2539429445', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8975GNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Venkateswarlu Chakka', '2560851129', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8976KRR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-11'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8989AEB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Mohamed Qader', '2559740713', 2019, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-06-01'::date, 'Failed- No Reverse Alarm and Defective Reverse Light'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8994RAA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'TBA', 'TBA', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8CJ00773', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Ali Ahmed Yahya', '2275444715', 1993, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-06-01'::date, 'Failed- Old Model, Hydrolic leaking, 360-degree not achieved'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '8PC00611', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Kasim Ansar', '2560023398', 2010, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-01-27'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9009UTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Osama Bernawi', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2024-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9018ZTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Al-Sayed Ahmed', '2485971515', 2020, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-12-22'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '90190', 'forklift'::equipment_type, 'A'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9027HAS', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Sanwar Raam', '2565175417', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9027HSA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Sanwara Ram', '2565175417', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9030HSA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Shoib Ahmed Taukeer', '2568052217', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-11-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9035ZAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Ansar Rafiq', '2318194194', 2025, 'verified'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2026-05-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9043DSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Dev Gurung', '2602450864', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9048ZEB', 'ambulance'::equipment_type, 'B'::equipment_category, 'Ahmed Mohammed Fadal Attia', '2557307374', 2025, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-11-06'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9065UXA', 'dyna_mini_truck'::equipment_type, 'A'::equipment_category, 'Muhammad Ramzan', '2324214655', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9066EAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Ahmed Ali', '2562446050', 2025, 'pending'::vehicle_status, false, NULL, '2024-06-15'::date, 'Fail, freelancer'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9084EXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Maeem Ashraf', '2309831119', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9085EAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Gulam Qadire', '2237339045', 2025, 'pending'::vehicle_status, false, NULL, '2024-06-15'::date, 'Fail, freelancer'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9104TSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Mohammed Suleman', '2555609847', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-08-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9106TSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Shakeel Akhtar', '2555615976', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-12-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9106XSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Mohamed Shakeel', '2555615976', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9107TSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'TUASEER AHMED', '2487640287', 2023, 'verified'::vehicle_status, false, 'Oxagon/AL FAHD (4800000823)-(SR2)', '2026-06-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9108TSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Javed Khan', '2556178073', 2022, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-12-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9118TSA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Muhammad Zaman', '2555613641', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-08-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9151GAA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, NULL, NULL, 2010, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-05-13'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9152GAA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Kasim Ansari', '2560023398', 2010, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-06-01'::date, 'Failed - old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9188HAB', 'concrete_pump_truck'::equipment_type, 'B'::equipment_category, 'Mohamed Imran', '2382916126', 2015, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9192GAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Ravinder Singh', '2572163968', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9193ESA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'IMRAN KHAN', '2541539801', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9221HDR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Gouse Darur', '2507076145', 2020, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2026-03-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9240XBR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Awadh Saleh Jaber', '566326699', 2023, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9249XXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Mubashar Ali', '2584011577', 2016, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2026-02-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9260AEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Sajed', '2407320130', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9262ZSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, NULL, NULL, 2014, 'pending'::vehicle_status, false, 'Oxagon/KAMETC - (B)', '2025-05-02'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9311ESA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Rahumin Ber', '2554904603', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9314ESA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'ELSAID ABDULLAH', '2554675252', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9324SJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-10-27'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9326ASA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Haitham Atta', '2591548900', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2026-02-09'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9329SJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-10-21'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9348504', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Zafra Miz Aman', '2306186723', 2011, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-01-15'::date, 'Fail, Expired Operator TUV'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9348ZTB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Muawia Hasan', '2487317626', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-06-01'::date, 'Failed- No Reverse Alarm and Defective Reverse Light'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9349ZTB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Jasmail Singh Mohinder', '2558197378', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2026-02-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9370EGB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Prathees Arulraja', '2603661386', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-06-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9376STB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'shek monir', '2550495069', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-06-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9384VTB', 'dyna_mini_truck'::equipment_type, 'A'::equipment_category, 'Sulman Hussain', '2581720310', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9388SAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'GARY EPELIPCIA', '2524267438', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-24'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9407AEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-12-22'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9410AEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Md Kmal', '2429662956', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2026-05-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9423XXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Mohazam Shahzad', '2534768946', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9459HLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Mashour', '2115982288', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2026-08-05'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9461HLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9482SBJ', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Samir Niyaz', '2283364343', 2014, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9498NTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Tafhim', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2025-06-18'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9511XHR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Osama Farouk', '6121717526', 2025, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2026-04-13'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9512TSA', 'service_truck'::equipment_type, 'B'::equipment_category, 'Sahabjan Ahmad', '2568772970', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-12-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9543KSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Najam Hassan', '2607303282', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800000796)-(SR1)', '2026-02-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9581GTD', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-04-20'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9600XSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ebrahim Ali', '2545982437', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-12-08'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '961884311078', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Gamal Mohamad', '2602359040', 2021, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9619ZRA', 'dyna_mini_truck'::equipment_type, 'A'::equipment_category, 'Sohil Khan', '2600673996', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800000796)-(SR1)', '2025-12-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9620XHR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Izhar Namdar Khan', 'TBA', 2025, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-12-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9628ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Alruwaili', '596565866', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9633XHR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'George Hana', '6125117243', 2025, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-09-29'::date, 'No Iqama - Visa holder only - 3 months approval'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9640SSR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-10-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9656BEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'SediMahdi', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2025-09-01'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9684SXA', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Yahiya Tamim', '2388115764', 2010, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-06-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9685SER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Nikolaos Gklotsos', '20007308', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9685SSR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-03-01'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9688VSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Muhammad Waqas', '2575937269', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9689VSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Kurram Khan', '2538236825', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-13'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9690VSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mukesh Kumar', '2579591518', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9691VSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'TBA', 'TBA', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-01-07'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9693ARA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-07-22'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9697USA', 'concrete_pump_truck'::equipment_type, 'B'::equipment_category, 'Gul Nawaz Gul', '2392120107', 2009, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-15'::date, 'Fail, Old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9699VSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Muhammad Afzal', '2519956821', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '96U04771', 'grader'::equipment_type, 'A'::equipment_category, 'MUSTAFA AHMED', '232397222', 2015, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-05-26'::date, 'PASS WITH NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '96U09301', 'grader'::equipment_type, 'A'::equipment_category, 'FARIS MOHAMMED', '2591615956', 2021, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9704AEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Adnan Khaliq', '2506295142', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-05-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9727AEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-05-09'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9741VSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Akbar Ansari', '2540304934', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-27'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9742VSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Charanjit Mahey', '2574242752', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9743VSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Muhammad Afzal', '2519956821', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9744VSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Madhukar', '251132624', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9745VSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Tej Bahadur', '2580128201', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9746VSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ram Kumar', '2531930655', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9747VSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Bhupinder singh', '2572915581', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9748VSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Shoaib Ahmed', '2467991333', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9756ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammad Ali', '501536422', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9757ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Musleh Abdullah Alahmari', '556766630', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9758ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Romulo Gaba', '556284765', 2023, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9760ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Jonathan Meale', '554362076', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9768LSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Gulistan Zirma', '2529002376', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-26'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9769NSA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'MOHAMMED NADEEM', '2534399858', 2023, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9772VSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'MUHAMMAD ZOHAIB', '2581844020', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-05-02'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9778HLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Carmelo Gonzalez', '20004075', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9782HLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammed Alahmadi', '20004563', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9785HLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Alhaddad', '20005049', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2026-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9789HLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Akram El Nassar', '20004184', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9790SJA', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ronaldo Ardena', '2145282899', 2002, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-01-14'::date, 'Fail, Old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9792HLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Anthony Cartwright', '20005748', 2023, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9799HLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Arif Kamal', '20004879', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2026-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9811RAR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Wajid Ali Najabat Ali', '2530893110', 2021, 'verified'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9843NAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'JALAL TALIB', '2282270855', 2021, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9845KSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Junaid Khan', '2556603542', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2026-02-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9845VSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Gulam jilani', '2334992381', 2020, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9850VSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Dilshad Afzal', '2557607195', 2020, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9851UNA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Ajmal Khan Faza', '2558275778', 2005, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-06-01'::date, 'Failed - Freelancer, old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9868GSA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'MOHAMMAD ALI AHMED', '2545187979', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9870GSA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'MOHAMMED ABOUELWAFA', '2545182327', 2021, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9876SJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-10-01'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9897SJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-10-30'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9899SJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-11-03'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9904SJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-07-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9906XXA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'TARIQ SALAM', '2579948270', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-12-03'::date, 'PASS WITH NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9907XXA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'RAZ GUL', '2588131637', 2015, 'rejected'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2025-12-03'::date, 'Expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9925LXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Faisal Ali Eid Alatawi', '556017768', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9932NAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Saddam Husain', '2576756593', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '99406523', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Abdullah Saeed Hussein', '2608699974', 1989, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-06-01'::date, 'Failed- Old Model, Hydrolic leaking'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9941SJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-10-15'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9943ESA', 'concrete_pump_truck'::equipment_type, 'B'::equipment_category, 'Muhammad Akram', '2316221809', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9944KAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Ashaf', '2554018669', 2024, 'pending'::vehicle_status, false, NULL, '2024-06-15'::date, 'Fail, PWAS & freelancer'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9945ESA', 'concrete_pump_truck'::equipment_type, 'B'::equipment_category, 'Tahir khan', '2366452049', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9946ESA', 'concrete_pump_truck'::equipment_type, 'B'::equipment_category, 'Muzaffar hussain', '2237816877', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-03'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9946SSR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Hammam Sulaiman M Albalawi', '1107612994', 2023, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9973ALR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mahesh Kalavakuri H Kalavakuri', '2486696525', 2023, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2025-06-04'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9976HLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Stefano Laghi', '20004548', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9983HLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muammar Albalawi', '20004011', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9983SSJ', 'ambulance'::equipment_type, 'B'::equipment_category, 'Radwan soliman', '2433294184', 2015, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-06-01'::date, 'Failed - PTI expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9984HLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Gabriel Ruiz De Gordejuela', '20004914', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '9985HLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Hassan Althunayan', '20000407', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '99Y06523', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Abdullah Saeed', '2408499977', 1989, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-04'::date, 'Pass w/NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'ABCD1234', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Jeffrey', 'Bernal', 2025, 'pending'::vehicle_status, false, 'Oxagon/ - (B)', '2026-01-25'::date, 'Expired Inspection'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'B1B6G6P30025', 'coring_drilling'::equipment_type, 'A'::equipment_category, 'MD Maruf Alom', '2510232982', 2023, 'pending'::vehicle_status, false, NULL, '2025-12-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'B1E611731', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'B1E619676', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'HAMAD KHAN', '2601612530', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-26'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'B1E61969', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'AHMED ZISHAN', '2574605099', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-26'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'B1E623401', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'HAMZAH ADIL', '2518913211', 2023, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'B300022703', 'mewp'::equipment_type, 'A'::equipment_category, 'Hector Sancho', '2578748531', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'B33G18412', 'forklift'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-14'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'B33G18413', 'forklift'::equipment_type, 'A'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'B33G18419', 'forklift'::equipment_type, 'A'::equipment_category, 'Laxmi Shahi', '2336400953', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-10-27'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'BCEHH100PBHL01455', 'backhoe'::equipment_type, 'A'::equipment_category, NULL, NULL, 2018, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-05-11'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'BCEHH100PBLO1455', 'backhoe'::equipment_type, 'A'::equipment_category, 'Loai Mishab Elkenawi Ghawen', '2545231370', 2019, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-08-09'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'BCES5LKUHA2400680', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'Tajmir Khan Amir', '2318196751', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'BCESSLKUHG2400915', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'Zaman Haidar', '2574337057', 2025, 'rejected'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-10-24'::date, 'Expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'BCESSLKUJG2400910', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'Amir Afzal', '2574336778', 2025, 'verified'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2026-03-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'BCHH100HBHL01921', 'backhoe'::equipment_type, 'A'::equipment_category, 'mohammad Alam', '2240559746', 2023, 'rejected'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-01-14'::date, 'Fail, revers light'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'BECHH100EBHL01921', 'backhoe'::equipment_type, 'A'::equipment_category, 'Mohammad Soaib', '2240559746', 2023, 'rejected'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-10-22'::date, 'Expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'BPN1877', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'Ashraf Mohamed', '2495931988', 2018, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-03-03'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'BPS0169', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'Maaz Sadiq', '2581234834', 2022, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-11-23'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'BPS0181', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'Tagmeel Khan', '2318196751', 2022, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-02-25'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'BPU0109', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'Irfan Ali', '2560210565', 2022, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-11-23'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'BTRC025D00050', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Badran Ahmed', 'A41566061', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00140JW9F00331', 'grader'::equipment_type, 'A'::equipment_category, 'Muhammad Waqas', '2558237596', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00140KW9201949', 'grader'::equipment_type, 'A'::equipment_category, 'Amarjet yadav', '2557500192', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00140KW9F00330', 'grader'::equipment_type, 'A'::equipment_category, 'Ikram uddin', '2545290146', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0014HTASE0866', 'grader'::equipment_type, 'A'::equipment_category, 'Saludin Maji Bullah', '2590620346', 2006, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-10-15'::date, 'FAILED- Old Model, Insurance Expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0014HVASE01518', 'grader'::equipment_type, 'A'::equipment_category, 'MOHAMMED ADIL', '2488882669', 2006, 'verified'::vehicle_status, false, 'Oxagon/AL FAHD (4800000823)-(SR2)', '2026-04-15'::date, 'PASS WITH NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00350HWDP00363', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Joseph jr', '2596926028', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-14'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00350VWDP00326', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'sampath mothuselvam', '2602570091', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-14'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00352CHLW10028', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Abdulatif', '2513898961', 2023, 'rejected'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-11-02'::date, 'Expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00352CHLW10059', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Kalam Khan', '2552136000', 2023, 'verified'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2026-02-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00352VHLW01046', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Kalam Khan', '2552136000', 2022, 'rejected'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-11-13'::date, 'Expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00395JSGD10261', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Muhammad Yaseen', '2410989384', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-08'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00426TJZ400854', 'backhoe'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-04-08'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00980EMK900717', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Muhammad Rafiq', '2307289237', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00D6RHPPP00401', 'bulldozer'::equipment_type, 'A'::equipment_category, 'Muhammad Imran', '2555575303', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-14'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00D6RJPPP00441', 'bulldozer'::equipment_type, 'A'::equipment_category, 'ROLAND QUIAMBAO', '2590928491', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00D8RE9EM07000', 'bulldozer'::equipment_type, 'A'::equipment_category, 'Hazaea Ahmed al abkash', '256013407', 2014, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-04'::date, 'Pass w/NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00D8RN9EM06993', 'bulldozer'::equipment_type, 'A'::equipment_category, 'Mohammed Ahmed', '2280477866', 2011, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-10'::date, 'Pass W/NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT00D9REWDDM04498', 'bulldozer'::equipment_type, 'A'::equipment_category, 'FAISEL IMRAN', '2519031906', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0120KCJAP01842', 'grader'::equipment_type, 'A'::equipment_category, NULL, NULL, 2012, 'pending'::vehicle_status, false, NULL, '2024-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0160MCB9E00382', 'grader'::equipment_type, 'A'::equipment_category, 'Ameen Salem', '2510958214', 2010, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-03-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0160MJB9E00453', 'grader'::equipment_type, 'A'::equipment_category, 'Yaser Hasan', '2496957750', 2010, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-02-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0160MPB9E00384', 'grader'::equipment_type, 'A'::equipment_category, 'Ameen Mohammad', '2510958214', 2010, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2024-06-14'::date, 'FAILED - Freelance, Old Model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0160MVB9E01041', 'grader'::equipment_type, 'A'::equipment_category, 'RAMAWDHESH KUMAR', '2389556636', 2014, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-24'::date, 'PASS WITH NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0216BCPWK04275', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'SAEED ABDULLAH', '2593639061', 2021, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-24'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0216BEPWK04551', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'Raju Rahamt', '2506893177', 2021, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-11-10'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0216BEPWK05005', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'MOHAMMED NASEER', '2535239665', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0216BHPWK05861', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'Muhammad Akmal', '2570179222', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0216BJDSN00826', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'Ripon Miah Dhanu', '2214502086', 2018, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-20'::date, 'Passed- with NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0216BJPWK00734', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'Waleed roiss Al Awlaqi', '2546084340', 2015, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-02-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0320DCKGF06451', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Mohammad Istyak', '255368276', 2010, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-06-01'::date, 'FAILED- Freelance, Old Model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0320DCZCS01479', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Mohamad ishtyaq', '255368276', 2014, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2026-01-13'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0320DCZCS01488', 'excavator_tracked'::equipment_type, 'A'::equipment_category, NULL, NULL, 2014, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-02-12'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0320DJKGF06352', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Munna Chaudari', '2554114807', 2010, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-12-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0320DJZC501481', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Mohammad Istyak', '2553686276', 2014, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-12-23'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0320DKKGF06348', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Nahid Khan', '2555176193', 2010, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-06-02'::date, 'Failed - Old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0320DLKGF06390', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Muhammad Imran', '2483544819', 2010, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-01-06'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0320DLKGF06399', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Muhammad Ashraf', '2483544819', 2010, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-02-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0320DPZCS01476', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Mohammad Ishtyaq', '2553686276', 2014, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-03-26'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0320DVZCS01483', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Munna Chaudhari', '2554114807', 2014, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-03-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0426FCEJ405369', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Aziz Hak', '2589628391', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800000796)-(SR1)', '2025-06-02'::date, 'Failed - freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0428FPLBH05187', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Sarfaraz Sarwar Khan', '2598838338', 2010, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-06-01'::date, 'FAILED- Freelance, Old Model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0950HAMXL01315', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Shamsher Khan', '2554114393', 2014, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-02-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0950HCMXL01319', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Shamsher Khan', '2554114393', 2010, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-03-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0950HVMXL01314', 'wheeled_loader'::equipment_type, 'A'::equipment_category, NULL, NULL, 2015, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0966HCTAL00368', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Ahmed mubarak', '2564162457', 2010, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-06-01'::date, 'Fail, freelance, Old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0966HTBJ600209', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Muhammad Saeed', '2496084555', 2013, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-05-01'::date, 'Failed old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0966KJTF01322', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'TBA', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2024-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0966LJFSL10612', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Ayesh Mohammad', '2451453563', 2018, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-06-01'::date, 'Failed- Old Model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0980LJD8Z10335', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Said Muhammad', '2403101435', 2017, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0CS10CT8F00995', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Afaq Ali', '2548692066', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-12-31'::date, 'Failed - license not relevant'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0CS10VT8F00996', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Saif Ullah', '2330840279', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0D8R9EM06454', 'bulldozer'::equipment_type, 'A'::equipment_category, NULL, NULL, 2010, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-02-12'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT0D8R9EM06461', 'bulldozer'::equipment_type, 'A'::equipment_category, 'Riyadh Saeed', '2453578615', 2010, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-03-24'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CAT950HCMXL01319', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Ali Hussein', '2336422031', 2014, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2024-12-31'::date, 'FAILED - Freelance, Old Model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CATCB24BH46700398', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'MD Hafizur rahman', '2526839622', 2014, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-02-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CATCS533ATHL04086', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Mohamed Ramadan', '2425671845', 2014, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-02-27'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CATCS533ATJL04086', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Muhammad Ramadan', '2425671845', 2014, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-02-24'::date, 'Failed old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CATCS533CTJL04126', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'FIROJ AHMED', '2552138501', 2014, 'verified'::vehicle_status, false, 'Oxagon/AL FAHD (4800000823)-(SR2)', '2026-04-15'::date, 'PASS WITH NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CATCS533KTJL04602', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Vinod Kumar', '2489868501', 2009, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-12-05'::date, 'Pass with NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CATCS533VTJL04667', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Ahsan Majeed', '2562653192', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2026-02-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CATM320DCEN800617', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Mohammad Ibrahim', '2602533115', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CC0060CB5082', 'crawler_crane'::equipment_type, 'A'::equipment_category, NULL, NULL, 2021, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CC0100CB5180', 'crawler_crane'::equipment_type, 'A'::equipment_category, NULL, NULL, 2021, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CC0100CB5535', 'crawler_crane'::equipment_type, 'A'::equipment_category, NULL, NULL, 2021, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CC0135CB3706', 'crawler_crane'::equipment_type, 'A'::equipment_category, NULL, NULL, 2021, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CLG856HZINL783875', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Hussein Fahmy Morsy Elsherif', '2602533370', 2023, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CLG856I1501729', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Muhammad Javed', '2478046200', 2015, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-01-15'::date, 'Fail, old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CLW009LGERU003242', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Akramul Ali Ansari', '2320926963', 2024, 'verified'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2026-03-24'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CLW009LGJRX003375', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'MOHAMMAD SHAUKAT', '2291489587', 2024, 'verified'::vehicle_status, false, 'Oxagon/AL FAHD (4800000823)-(SR2)', '2026-04-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'CT19D80457', 'forklift'::equipment_type, 'A'::equipment_category, NULL, NULL, 2018, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-05-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DC00271828', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Shashi Prasad', '2517820060', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-06-01'::date, 'Failed- No TUV'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DDXCCWLCDJR0021291', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Sohail Muhammad', '2548939814', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEAAALF6006280', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'MOHAMMAD NASEER', '2531720137', 2021, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEAAHG6006446', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'SAEED SALEH', '2208239133', 2021, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBDXAM0003089', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Mohammad Jasiuddin', '2536631365', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-26'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBDXHK0001214', 'excavator_tracked'::equipment_type, 'A'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-02-14'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBDXHM0003093', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Afsar Ahmad Shaikh', '2566924086', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-01-06'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBDXHM0003094', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'ALAM KHAN', '2568544502', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBDXHM00P309', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Tariq Khan', '2529282275', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-01-06'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBDXJL0001353', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'JAGAT BAHADUR RAI', '2468868027', 2020, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBDXVM0003091', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Sarafat Hawari', '2565313620', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBEECP0003172', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'FAWAZ QASIM', '2451640268', 2022, 'verified'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBEEHN0002364', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'HAMADA SHAABAN', '2608573545', 2023, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBEEJN002440', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'ABDO AHMED', '2460159938', 2023, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBEEKP0003184', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Naeem Jan Muhammad', '2559130352', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-19'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBEELN0002363', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'NISAR ABBAS', '2414567798', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBEFAN0001138', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Mazen Manea', '2572095384', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-06-01'::date, 'Failed - Freelancer, have no iqama'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBEFAN0001141', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'EBRAHIM MAHYOUB', '2602594737', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2025-07-18'::date, 'FAILED; FREELANCE'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBEFKM0001049', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Binod bk', '2513277612', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-01-06'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBEFKN0001084', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Vinod Kumar', '2486207505', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-24'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEBEFVM0001024', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Bakht Munier', '2557879646', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCECFKAM0001009', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'RASHED QAID', '2498138326', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2025-02-28'::date, 'FAILED; FREELANCE'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCEFYB0001037', 'excavator_tracked'::equipment_type, 'A'::equipment_category, NULL, NULL, 2013, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCFBDXCK000146', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Sahadat Hussain', '2565314883', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-01-06'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKCFBDXK0001214', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Rajat Salama', '257075409', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-01-07'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DHKEBDXVM0003060', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'MOHAMMAD WARISH ALI', '2556079768', 2021, 'verified'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DJ00232896', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Marwan saeed', '2549764799', 2022, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-09-12'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DWGCECFXAN1010109', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'LOVEPREET SINGH', '2526654203', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DWGCECFXCN1010116', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'RAJPAL RAM', '2526654252', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DWGCECFXHN1010257', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'SAID AHMED IZHAN', '2537149060', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DWGCECFXJN1010123', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'FAWAZ ABDULLAH', '2311645366', 2023, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DWGCECFXKN1010394', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'HARENDRA SHARMA', '2526596149', 2023, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DWGCWLBBTL1011482', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Sanjiv Kumar', '2562037396', 2020, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800000796)-(SR1)', '2026-02-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCEBDGAM0020905', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'SHAIL ESH SINGH', '2561258332', 2022, 'verified'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCEBDGCN0021227', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'FAYED ZAIDA', '2562488862', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2025-01-24'::date, 'FAILED; FREELANCE'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCEBDGCN0021230', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'NAJIB SHAMLAN', '2570791893', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2025-11-24'::date, 'FAILED; FREELANCE'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCEBDGN021228', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Hardeep Singh', '2562196901', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-06-01'::date, 'Failed - No 360 vision'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCEBDGPM0020847', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'FAWAZ QASIM', '2451640628', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-26'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCEBGVB0021765', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'DHYAH AHMED', '2563544010', 2023, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-24'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCECFJEN0020679', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'CHATRA BAHADUR', '2536997444', 2023, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCECFJJM0020591', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'SHEEBA YADAV', '2566126021', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCECFJJM0020672', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'FAWAD ABDULLAH', '2311645366', 2023, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCECFJPM0020667', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'RASHID KHAN', '2532101744', 2023, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCECFJTM0020666', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'BOM BAHADUR', '2536979590', 2023, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCWLCDJR00212888', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Sohail Yousaf', '2548939814', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-01-06'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCWLCDR0021320', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Khattab Qasem', '2532541865', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-06-01'::date, 'Failed - freelancer'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCWLCDVR0021326', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'ABDUL JABBAR', '2551459296', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCWLDEHP0010464', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'MOHMOUD MOHAMMAD', '2526317850', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCWLDEKN0010421', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Mohammad Nabi', '2512949823', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800000796)-(SR1)', '2025-06-02'::date, 'Failed - freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCWLDEKN0010422', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Halal Mohammad', '2555242573', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800000796)-(SR1)', '2025-06-02'::date, 'Failed - freelance, 2 tires damage'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'DXCCWLDEPP0010521', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'JUGAL KISHOR', '2594116846', 2023, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2025-07-02'::date, 'FAILED INSURANCE EXPIRED&OIL LEAKAGE'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'E111CL217N3L90603', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'DEYAH HAZAE', '2563544010', 2023, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'ERE014719', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Sanjeeb Kumar', '2383445158', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'FDA23124002599', 'forklift'::equipment_type, 'A'::equipment_category, 'Ahmed Antar', '2608701286', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'GHKCEBEFAN0001138', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'NAWAF HASAN', '2605573571', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'GS53570', 'mewp'::equipment_type, 'A'::equipment_category, 'Sandeep Patel', '2561486602', 2016, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2025-03-05'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'H2005498', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Ali muhammad', '2288953926', 2014, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-06-01'::date, 'Failed - freelancer, old model, oil leakage'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HACMKAA90L00007508', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Tariq Hussain', '2385616293', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-08'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HAR3CXPMCR3366764', 'backhoe'::equipment_type, 'A'::equipment_category, 'Ram Milan Aasrey', '2368132854', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-08-09'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HAR3CXPMCR3463575', 'backhoe'::equipment_type, 'A'::equipment_category, 'Taimur Ali', '2541352536', 2025, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HAR3CXPMKR3463752', 'backhoe'::equipment_type, 'A'::equipment_category, 'Omar Hefzy Abdelhafiz Hassan', '2604723748', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HAR3CXPMPR3366792', 'backhoe'::equipment_type, 'A'::equipment_category, 'Rustam Manzoor', '2313575785', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HAR3CXTTAK2801617', 'backhoe'::equipment_type, 'A'::equipment_category, 'Muhammad Shaukat', '2291489597', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-04'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HAR3CXTTAL2896083', 'backhoe'::equipment_type, 'A'::equipment_category, 'MD Dasud Alaam', '2557251846', 2019, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-21'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HAR3DXSULS3493500', 'backhoe'::equipment_type, 'A'::equipment_category, 'RAJAN RAMAKANT', '2623960883', 2026, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HCMJAC91V00051795', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'ABHAY ASHOK', '2570520698', 2020, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HCMJBE93000051295', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'M riaz naseem', '2285401903', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HCMJBE93C0051272', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Fareed Iqbal', '2513910667', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HCMJBE93V00051273', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Antony Sureesh', '2604042115', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HCMKAA90100007170', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'AZIZ UR REHMAN', '2542609298', 2021, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HCMKAA90H00007493', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Yousaf Khan', '2533448706', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-08'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HCMKAA90H00007509', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Muhammad Abrar', '2458524788', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-08'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HCMKAA90J00007485', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Stany Prakash', '2604042370', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-08'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HCMKAA90L00007508', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'TBA', 'TBA', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HCMNH990H00020316', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'TBA', 'TBA', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-14'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HCMZFF92J00051269', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Anwar Zaid', '2535674861', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-08'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HCMZFF9ZC00051136', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Yam Prasad Sapkota', '2570076410', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HCMZFF9ZC00051287', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Edwin Jaya', '2603373511', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-17'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HCMZFF9ZJ00051269', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'TBA', 'TBA', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-08'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HHKHK606VE0002391', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Satpal singh', '2447279411', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-04'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HHKHZ614CF0008281', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Salamat Shah', '2551190891', 2019, 'verified'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2026-04-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'HHKHZ614EF0008725', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Muhammad Asim', '2541197279', 2015, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-01-15'::date, 'Fail, old model, freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'JCB5AFKGH02337013', 'telehandler'::equipment_type, 'A'::equipment_category, 'ALI SALEH AHMED', '2597439864', 2021, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'JCB5AFKGHK2788532', 'backhoe'::equipment_type, 'A'::equipment_category, 'Hassan Sayed Mohamed', '2246488395', 2022, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-08-09'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'JCB5AFKGHK2788543', 'forklift'::equipment_type, 'A'::equipment_category, 'Sarafat Ali', '2558261083', 2019, 'rejected'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-06-01'::date, 'Failed - Old model, Improper pin fitted'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'JCB5AFKGKK2788551', 'forklift'::equipment_type, 'A'::equipment_category, 'Gultaj Mohamed', '2356226676', 2019, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2024-06-15'::date, 'Failed - Old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'JCB5AFKGT02337825', 'telehandler'::equipment_type, 'A'::equipment_category, 'RAAD HAMOOD', '2621653878', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'JCB5AFKGT02344726', 'forklift'::equipment_type, 'A'::equipment_category, 'Zarshad Khan', '2302430562', 2019, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-06-01'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'JCB5AFKGTK2788532', 'forklift'::equipment_type, 'A'::equipment_category, 'Hassan Sayed', '2246488395', 2019, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-21'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'JCB5AFKGTS3471070', 'telehandler'::equipment_type, 'A'::equipment_category, 'Dalip Kumar', '2323834743', 2025, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-06'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'JCB5AFSGK01534602', 'telehandler'::equipment_type, 'A'::equipment_category, 'Arsad Alam', '2573625742', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'JCB5AFXGC02351473', 'telehandler'::equipment_type, 'A'::equipment_category, 'TAJUDDIN RAFIUDIN', '2579397866', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'JCB5ALJGP014838', 'telehandler'::equipment_type, 'A'::equipment_category, 'MUHAMMAD YASEEN', '2139802660', 2013, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-31'::date, 'PASS WITH NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'JCB5APTGC01527357', 'telehandler'::equipment_type, 'A'::equipment_category, 'SAID AMIN', '2467884199', 2021, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'JCBSAFSGPO1526708', 'telehandler'::equipment_type, 'A'::equipment_category, 'SAYED AHMED', '2450259359', 2021, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'JHT17120165', 'crawler_crane'::equipment_type, 'A'::equipment_category, 'Amjad Ali Afzal', '2535741629', 2018, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2024-12-31'::date, 'FAILED - Hydraulic Leakage'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KGF06352', 'excavator_tracked'::equipment_type, 'A'::equipment_category, NULL, NULL, 2018, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMT0D040E02057844', 'bulldozer'::equipment_type, 'A'::equipment_category, 'Daif allah mansoor', '2595082575', 2003, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-20'::date, 'Pass W/NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMT0D103KNC045867', 'bulldozer'::equipment_type, 'A'::equipment_category, 'AHMED MAHYOUB', '2519555052', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMT0D103TNC045820', 'bulldozer'::equipment_type, 'A'::equipment_category, NULL, NULL, 2019, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMT0D105EPC089088', 'bulldozer'::equipment_type, 'A'::equipment_category, 'Malik Zulqarnain', '2411116219', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-06'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMT0D105EPC089091', 'bulldozer'::equipment_type, 'A'::equipment_category, 'Muhammad Siraj', '2612735429', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMT0D105JPC088952', 'bulldozer'::equipment_type, 'A'::equipment_category, 'Zahid Pervaiz', '2241712393', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-06'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMT0D105LNC088792', 'bulldozer'::equipment_type, 'A'::equipment_category, 'Mani Kandan', '2602448967', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-06'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMT0D105TNC088913', 'bulldozer'::equipment_type, 'A'::equipment_category, 'ARAFAT ABDULQAWI', '2541356479', 2022, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMT0D105VNC088840', 'bulldozer'::equipment_type, 'A'::equipment_category, 'Irfan Akhtar', '2601558444', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMT0D105VPC089036', 'bulldozer'::equipment_type, 'A'::equipment_category, 'Abid Hussain', '2546427598', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMT0D105VPC089053', 'bulldozer'::equipment_type, 'A'::equipment_category, 'Mani Kandan', '2602448967', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-24'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTG029AMA010286', 'grader'::equipment_type, 'A'::equipment_category, 'Ali ghonim', '2603321809', 2021, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC196CNC077481', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Shuzain Khan', '2562037396', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800000796)-(SR1)', '2026-02-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC244KFC400497', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Ebrahim Mohammed Esmael', '2318705551', 2016, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-03'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC244LFC400566', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Ebrahim Abdulwahab', '2342071699', 2006, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-20'::date, 'Pass W/NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC244LFC400568', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Abdullah Mohammed', '2285261885', 2016, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-04'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC244LFC400569', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Wadah Ali', '2263280758', 2016, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-20'::date, 'Pass W/NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC244PFC400563', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Abdul nasser hussain', '2346535855', 2016, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-04'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC244TFC400514', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Haider Ali', '2340130901', 2016, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC244VFC400', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Khalid muhammed alsufyani', '2344963521', 2016, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-09-13'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC244VFC400567', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Khalid Mohammed', '2344963521', 2019, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC283ANSAW1027', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Muhammad Ishaq', '2532794555', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC283ANSAW1030', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Badshah Zada', '2544149491', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC283JNSAW1010', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Sajid Mehmood', '2480259668', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC283LNSAW1059', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Sakhi Bahadar', '2557213986', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC283TNSAW1018', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Anwar Zaib', '2535674861', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC283TNSAW1049', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'M Raiz', '2285401903', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KMTPC283VNSAW1012', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Sultan Zarin', '2519566141', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'KZJ024J0436', 'crawler_crane'::equipment_type, 'A'::equipment_category, 'Abdulmajed Aljohani', '2535741629', 2020, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-11-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'L5E6H5D4XPA006573', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Asif Ali Awan', '2520673589', 2024, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-07-14'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'LCL722HOJK2000183', 'grader'::equipment_type, 'A'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, NULL, '2024-06-15'::date, 'Fail, freelancer'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'LFCNNF5P1D2001301', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Omar Alkhadher', '2503532521', 2013, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2024-12-31'::date, 'FAILED - Freelance, Old Model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'LGC9035FESC369203', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'FAYZ KHAN', '2601628403', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'LLFCNNF5P0D2000415', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Arbab Khan', '2526690579', 2013, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-01-15'::date, 'Fail, Old model, freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'LSL503DGCRA100362', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Asif Khan', '2555608781', 2024, 'rejected'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-11-13'::date, 'Expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'LSW0240DVK0055338', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Ahmad Hamad', '2512659190', 2020, 'verified'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2026-02-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'LXGCPA423LA018598', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Dil Nawaz', '2295235010', 2023, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2024-12-31'::date, 'FAILED-Freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'LXGCPA444MA007855', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Ahmed Abdulrahman', '2239905421', 2021, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-11-08'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'LXGDPA558SA003380', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Samal Ali', '2556316517', 2025, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-11-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'MAN00000J01059983', 'forklift'::equipment_type, 'A'::equipment_category, 'Rana Muhammad', '2536734144', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'MAN00000L01022017', 'telehandler'::equipment_type, 'A'::equipment_category, 'Muhammad Hasnaat', '2374334247', 2019, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'MDZCL4BEAS6080709', 'backhoe'::equipment_type, 'A'::equipment_category, 'KISHAN PASWAN', '2535714071', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'NKJB80BETMKH24985', 'backhoe'::equipment_type, 'A'::equipment_category, 'Saipan Mahabub', '2567110404', 2021, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'NKJSR130ASKG01732', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'MOHAMMED MOBIN', '2621753298', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'NKJSR130KRKJ00908', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'MISHRI LAL RAY', '2603549433', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'PPP00390', 'bulldozer'::equipment_type, 'A'::equipment_category, 'VIJAYAKUMAR RAMALINGAM', '2571798004', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-16'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'PY5826CF0703', 'grader'::equipment_type, 'A'::equipment_category, 'MOHAMMED SHAKOOR', '2310365024', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'R000105244', 'mewp'::equipment_type, 'A'::equipment_category, 'Bashar Fakir', '2483893562', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-06-22'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'R000106245', 'mewp'::equipment_type, 'A'::equipment_category, 'Mir Sozib Ali', '2540154719', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-06-22'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'R07447W', 'forklift'::equipment_type, 'A'::equipment_category, 'Arslan Khan', '2584288993', 2024, 'rejected'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-11-18'::date, 'Expired'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'RAJ135WSKS3582903', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'ABDULLAH SALEH', '2479772960', 2026, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-24'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'RAJ135WSPS3582902', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'MOHAMMAD ANTAR', '2590328411', 2026, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-24'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'RAJ135WSTS3582896', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'AHMED MUHAMMAD', '2545599165', 2026, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'RAJ3DX4E03491727', 'telehandler'::equipment_type, 'A'::equipment_category, 'ZEYAD ABDELHAMID', '2593604032', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'RAJ3DXS4H03491628', 'telehandler'::equipment_type, 'A'::equipment_category, 'NASEER MOHAMMAD', '2533564395', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'RC961884302370', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Rohan singh', '2552366912', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-09-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'RLD20241206', 'coring_drilling'::equipment_type, 'A'::equipment_category, 'Alfatih Ahmed', '2481075204', 2024, 'pending'::vehicle_status, false, NULL, '2025-12-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'RLD20241208', 'coring_drilling'::equipment_type, 'A'::equipment_category, 'NEETO Singh', '2600546283', 2024, 'pending'::vehicle_status, false, NULL, '2025-12-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'RZJ040JJ0183', 'crawler_crane'::equipment_type, 'A'::equipment_category, 'Masud Rana Md', '2488214507', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'S10507501', 'mewp'::equipment_type, 'A'::equipment_category, 'GUL HUSSAIN', '2566581530', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'S851411270', 'mewp'::equipment_type, 'A'::equipment_category, 'Mohd Tarique', '2424513261', 2014, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-06-01'::date, 'Failed- Old model, Expired Operator TUV'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'S851411610174', 'mewp'::equipment_type, 'A'::equipment_category, 'MD Safiqul Islam', '2574081085', 2015, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-06-22'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'SANLU79055H000061', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'ABDULA BASRULAH', '2266160114', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-27'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'SEM00655ES5511809', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Balvir Singh', '2321980639', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, 'Failed - operator have no driving license'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'SHAJS20ALN2867892', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Ahmed Imbaby ahmed', '2472198213', 2022, 'verified'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2026-03-17'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'SY021NCBC3198', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Mohammad Imran', '2548387709', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-10-27'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'SY021NCCT8598', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'GAFFAR MIA LATE', '2248692978', 2022, 'rejected'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2025-12-31'::date, 'FAIL NO MOVEMENT ALARM'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'SY021NCCT8838', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Nahid Khan', '2555176193', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-06-01'::date, 'Failed- No camera'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'SY021NCCT8878', 'excavator_tracked'::equipment_type, 'A'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-02-16'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'SY048DCC31198', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Abdelmoneim Osman', '2466006158', 2022, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-01-14'::date, 'Fail, hydraulic leaking'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'SY048DCC31268', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Burhan Uddin Aziz', '2566329242', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'SY055BCC39198', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Imran khan muhammad', '2527577940', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-09-13'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'T19D80457', 'forklift'::equipment_type, 'A'::equipment_category, 'Shakibul Hassan', '2511907525', 2020, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2024-12-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'T20C65075', 'forklift'::equipment_type, 'A'::equipment_category, 'Majharul Hoque', '2560226452', 2013, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-11-06'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'THEDCRD0C00000845', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'MUHAMMAD ASIF', '2571687926', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'UCEC480DC00285203', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'SAMIM AKHTAR', '2549870505', 2022, 'verified'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VCDEC220DH00271902', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Rakesh Karnali', '2552148856', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-10-27'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VCE0A40GC00325012', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ricky Garcia', '2590717217', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-06'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VCE0C37FE00037239', 'excavator_tracked'::equipment_type, 'A'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VCE0C37FH00037238', 'excavator_tracked'::equipment_type, 'A'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-14'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VCEBL61BT01203708', 'backhoe'::equipment_type, 'A'::equipment_category, 'Mohammed Khan', '2506759378', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-06-02'::date, 'Failed - old model, freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VCEC210BT00084012', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Maksood Akhtar', '2567058363', 2015, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-01-15'::date, 'Fail, old model, movement alarm manual'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VCEC220DC00271828', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Shash Bhushan', '2517820060', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2026-01-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VCEC220DJ00271696', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'MUHAMMAD JAVED', '2528591312', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VCEC220DL00271820', 'excavator_tracked'::equipment_type, 'A'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-02-12'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VCEC220DP00271906', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Mohammad Arman', '2551628080', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-12-23'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VCEC220DV00232897', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Kavindra singh', '2552369684', 2022, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-09-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VCEC220DV00232898', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Ibrahim gamal elsayed', '2551113596', 2022, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-09-12'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VCEC220DV00271829', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'RASIB ALI', '2579074531', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VCEC480DT00274686', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Kousar Pervez', '2352601666', 2017, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-06-02'::date, 'Failed - Old model, freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VCEL350HE00001037', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Marais Ferdinand', '2550622324', 2018, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-05'::date, 'Pass with NDT'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VLGG922FHN0600608', 'grader'::equipment_type, 'A'::equipment_category, 'Abdul Razaq', '2570838082', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-06-01'::date, 'Failed - Freelancer, tires damage'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VLGG922FHN0600611', 'grader'::equipment_type, 'A'::equipment_category, 'NAVEED ASHRAF', '2477610105', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VLGL956FJP0625398', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Gamal Al Maklos', '2382380794', 2023, 'verified'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2026-05-02'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VLGL958FAR0621128', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'JANAS KHAN', '2593866128', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VLGL958FCM0620463', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'SURESH KUMAR', '2541725160', 2023, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VLGL958FCP0620698', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'WAHID HUSSAIN', '2565591555', 2023, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VLGL958FCR0621099', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'MUHAMMAD RASHED', '2560250082', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VLGL958FEM0620476', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'SABHAN ALI', '2581206873', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VLGL958FHP0620805', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'QAIS ALI', '2502020585', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VLGL958FLP0620639', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'MUHAMMAD ALI', '2533258535', 2023, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-18'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VLGL958FLR0621096', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'EMAD SAAD', '2558765380', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VLGL958FLS0621234', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Abdula Sami', '2589642400', 2025, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-01-01'::date, 'Fail Freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VLGL958FVP0620699', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'MUHAMMED ALI', '2534023052', 2023, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'VLGL95FCP0620693', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'JAHIED HUSSAIN', '2526856233', 2023, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-24'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'WDM02124', 'bulldozer'::equipment_type, 'A'::equipment_category, NULL, NULL, 2015, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'XUG0383SESRL00407', 'mewp'::equipment_type, 'A'::equipment_category, 'MUHAMMAD ISMAIL', '2613150123', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-06-20'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'XUG0421SCRRL28143', 'mewp'::equipment_type, 'A'::equipment_category, 'MOHAMMAD HAMDY', '2579138617', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-28'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'XUG0SR07CSCB00966', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'MOHAMMAD ALI', '2533696593', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'XUG0SR07GSCB00956', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'JAMAL ABDNASER', '2404094753', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-25'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'YC5000000TBW00154', 'telehandler'::equipment_type, 'A'::equipment_category, 'Mahesh Kumar', '2568073213', 2010, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-06-01'::date, 'FAILED-Hydraulic leakage & Old model'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'YZ1212CF1005', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'SHAH ZAHID', '2592436469', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'YZ1212CF2770', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'FUAD AHMED', '2549069843', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'YZ1212CF2786', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'ABDU GONI', '2450842030', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-29'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'Z80290', 'mewp'::equipment_type, 'A'::equipment_category, 'Muhammad Yasin Muhammad Rahim', '2513075875', 2017, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2025-03-05'::date, 'No'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'ZLHZE117LR06485', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Muhammad Ismail', '2561864105', 2024, 'pending'::vehicle_status, false, 'Oxagon/RPCO (SR1)', '2025-06-11'::date, 'Fail - TUV, PWAS, Freelance'
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'ZLHZE173PP1C05326', 'excavator_tracked'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-14'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'ZLHZE173TP1C05325', 'excavator_tracked'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'ZLHZE245CP0B05399', 'excavator_tracked'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'ZLHZS080CP0D02004', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'ABDULLAH NAWAZ', '2612872370', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'ZLHZS080VP0001688', 'skid_steer_loader'::equipment_type, 'A'::equipment_category, 'Shahrukh Akbar', '2571504923', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'ZMTZE173HM0005078', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'MD JULHASH MIA', '2257683041', 2022, 'verified'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, 'ZMTZE173KN0005072', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'ABDUL SHAKOOR', '2560532588', 2022, 'verified'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1 ON CONFLICT (company_id, plate_number) DO NOTHING;
