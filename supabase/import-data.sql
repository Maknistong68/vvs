-- Import data from Active Vehicles Excel
-- Run this AFTER running schema-v3.sql

-- Create OXAGON project
INSERT INTO public.projects (company_id, name, code, is_active)
SELECT id, 'OXAGON', 'OXAGON', true FROM public.companies LIMIT 1
ON CONFLICT (company_id, name) DO NOTHING;

-- Create Oxagon Gate
INSERT INTO public.gates (company_id, name, location, is_active)
SELECT id, 'Oxagon Gate', 'NEOM', true FROM public.companies LIMIT 1
ON CONFLICT (company_id, name) DO NOTHING;

-- Insert vehicles/equipment (500 records)
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '00043H34523', 'forklift'::equipment_type, 'A'::equipment_category, 'SAYD MOHAMAD', '2485369785', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-25'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '00B33G18412', 'telehandler'::equipment_type, 'A'::equipment_category, 'Om Prakash', '2381048152', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-17'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '010503L4973', 'forklift'::equipment_type, 'A'::equipment_category, 'DIPENDRA ADHIKARI', '2622994313', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '0160122007', 'telehandler'::equipment_type, 'A'::equipment_category, 'Dalip Kumar', '2323834743', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-29'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '0216BEPWK05005', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'RAHAMA HASAN', '2463222931', 2021, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '05839237', 'forklift'::equipment_type, 'A'::equipment_category, 'Hakeep Khan Rasool', '2555614888', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-17'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '0771400001R000096', 'mewp'::equipment_type, 'A'::equipment_category, 'Ali Raza', '2586024685', 2024, 'rejected'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-10-24'::date, 'Expired'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '0771400001R000097', 'mewp'::equipment_type, 'A'::equipment_category, 'Shamim Reza', '2577468685', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-11-24'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '0771400001R000100', 'mewp'::equipment_type, 'A'::equipment_category, 'Ozain Hassan Islam', '2581487929', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-11-26'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '0771400001R000105', 'mewp'::equipment_type, 'A'::equipment_category, 'Bashar Fajor', '2483893562', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-11-26'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '0771400001R000106', 'mewp'::equipment_type, 'A'::equipment_category, 'Muhammad Bajsh', '2337338475', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-11-24'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '0771400001R000107', 'mewp'::equipment_type, 'A'::equipment_category, 'Md raseel hussien', '2558808776', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-11-25'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '0771400001R000111', 'mewp'::equipment_type, 'A'::equipment_category, 'Rana Bilal', '2578956787', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-11-24'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '0771400001R000112', 'mewp'::equipment_type, 'A'::equipment_category, 'Ehab Said Ali', '2553526415', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-11-24'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '0771400001R000113', 'mewp'::equipment_type, 'A'::equipment_category, 'Zain Nazir', '2573970411', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-11-24'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '08CC15130168', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, NULL, NULL, 2008, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '0E1110200R3P10440', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'DINSH KUMAR', '2536740034', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '0E1110213N3LC0432', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Zain Ullah', '2594166734', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-20'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '0F5110483N3LB8191', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'UMESH YADAV', '2553881331', 2022, 'verified'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2025-04-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '10000381LPC013075', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Shanwaz Alam', '2574340432', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-11-23'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '10000381VLC010202', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Tahir abbas', '2579276649', 2020, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-10-23'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1000131940E002802', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Ubad Ullah', '2305934024', 2011, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-01-14'::date, 'Fail, TUV expired, oil leak'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '100013781EPC013077', 'roller_compactor'::equipment_type, 'B'::equipment_category, NULL, NULL, 2019, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1000USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'muhammed salim mushtaq', '2591193434', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-08-13'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1001ZXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Jishan Jabbar', '2594608958', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-10-20'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1003ZXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Danish Khan', '259667169', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-10-20'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1004ZXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Saad Saeed', '2594033199', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-04'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '101573481787', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Zulfuqar Alam', '2590428070', 2013, 'pending'::vehicle_status, false, 'Oxagon/RPCO (SR1)', '2026-03-20'::date, 'Pass/ NDT'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '101582432204', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Abdullh Abdelbagi', '2284524622', 2010, 'verified'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2026-05-02'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1016ZSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Waheed Abdul Waheed Khan', '2506324777', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-15'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '101880381061', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'AHMED ALI', '2621826029', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-20'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1022EER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ramiz Alalwan', '549966990', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '10300180JPE013199', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'LAKSHMI KUMAR', '2576440164', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '10300180JPE01322', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Md Maynue Islam', '2531747828', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-10-28'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '10300180KPE013671', 'roller_compactor'::equipment_type, 'B'::equipment_category, 'Muhammad Irfan', '2507887988', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-27'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1037JKJ', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2015, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-10-25'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1043GXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Aqil Ahmed', '2282041165', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-05-20'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1045RDA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'TBA', 'TBA', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-28'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1056AHR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Sabir Abdul', '2596229559', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-06-16'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1063NAA', 'crawler_crane'::equipment_type, 'A'::equipment_category, 'Mohammad Kalamuddin', '2567454562', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2025-11-19'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1069EGA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Muhammad Usman', '2531921654', 2011, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-06-10'::date, 'Failed - old model'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1078430070W2J', 'forklift'::equipment_type, 'A'::equipment_category, 'RAEES TALIB', '2580827042', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1082KEA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Muhammad Shakoor', '2594274744', 2010, 'verified'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2026-04-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1085JER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Omar Dormosh', '2286312141', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-10-24'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1085KGB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Teddin Jose', '2317474027', 2010, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1088HRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MUTADHA ABDULLAH', '2563040753', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-12-03'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1090HRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Muhammad Ahmed', '2455193124', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-12-05'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1096KDA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mirsz Late', '2555223003', 2016, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-07-02'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1112NTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'NAEEM Alam', '2518225996', 2023, 'pending'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2025-12-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1113NTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Saeed', '2557650971', 2023, 'pending'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2025-12-01'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1120VZR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mahmoud Yaseen', '2563251293', 2024, 'pending'::vehicle_status, false, 'Oxagon/Araner (4800001137)-(SR3)', '2025-10-20'::date, 'ok'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1123VZR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Gonzalo Garcia', '2594804771', 2024, 'pending'::vehicle_status, false, 'Oxagon/Araner (4800001137)-(SR3)', '2025-12-31'::date, 'ok'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1127HJJ', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-07'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1131ZRA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Muhammad Usman Shoukat Ali', '2583563339', 2020, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2024-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1161USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'SAID ALI SHAH', '2582206047', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1166USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'SUKMAN BAMJAN', '2578761989', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1170USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'BASHEER AHMED', '2554673810', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1171USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MOHAMMED TANVEER', '2588725065', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1175USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'malik khalid sharif', '2591193251', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-08-12'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1176USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'SHYAMBABA BHUJEL', '2607886633', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1178USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'BADSHAH MALIK', '2403607886', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1186USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'AZMAT ULLAH', '2615946205', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2025-04-09'::date, 'Failed Freelance'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1190USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'PRAKASH NEPALI', '2603490497', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1191USA', 'sewage_truck'::equipment_type, 'B'::equipment_category, 'Rudra Bahadur Pulami', '2578761351', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-10-07'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1193USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'SNADIP KUMAR', '2536191907', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1195ZXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Dupreez Lawrence', '8647G', 2022, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-11-09'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1198ZSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'ABDUL NAZIR', '2337662635', 2014, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-04-20'::date, 'Pass With NDT'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1199ZSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'HIDAYAT SHAH', '2535216788', 2014, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-04-20'::date, 'Pass With NDT'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1200USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'RABIN MAHATO', '2593028083', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1201USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MUTASIM HAROUN', '2505964134', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1202ZSA', 'service_truck'::equipment_type, 'B'::equipment_category, 'Bakht Khan', '2541745366', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-12-29'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1206HJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Moatasem Ehab', '2562164463', 2022, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2024-05-14'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1217USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'SAIF UR REHMAN', '2591193822', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1220LLA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Akbar Shah', '2420711737', 2012, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-06-10'::date, 'Failed - Old model'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1220VXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mahmoud Saad', '2289363547', 2023, 'pending'::vehicle_status, false, NULL, '2026-04-07'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1223VXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Andreas Christou', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2025-07-15'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1226NJA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'Pushpendra Singh', '2521620118', 2005, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-10-05'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1238DGB', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'MUHAMMAD TANVEER', '2581343486', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1252USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Muhammad Shoukat Dawood', '2591193608', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-08-12'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1253USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'BASHEER AHMED', '2554673810', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1254USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Aqibjaven Muhammad', '25927822011', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-08-12'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1256USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'SAJAD HUSSAIN', '2532455694', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2025-04-09'::date, 'Failed Freelance'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1257NAA', 'mewp'::equipment_type, 'A'::equipment_category, 'Subash BK', '2572596522', 20241, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-17'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1260USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'KRISHNA ANWAR', '2578953602', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1262USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MD IMRAN HANEEF', '2591626045', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1264USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MAEEN ABDULLAH', '2451510404', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1270ZKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Azhar Shakil Khan', '2553398757', 2024, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2026-07-14'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1280TTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Arafat Abd Alfadel', '2207907011', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-06-04'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1289EEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Stewart Munoz', '2565881261', 2024, 'pending'::vehicle_status, false, 'Oxagon/DSV (PMC) - (B)', '2026-12-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1311JXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2013, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-04-28'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1314JXA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, NULL, NULL, 2010, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-01-15'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1340RXA', 'tanker_truck'::equipment_type, 'A'::equipment_category, NULL, NULL, 2013, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-06-17'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1375LAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Asad Ullah Khan', '2561131885', 2024, 'pending'::vehicle_status, false, NULL, '2024-06-15'::date, 'Fail, freelancer'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1376LAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Hadire Ali', '2578146512', 2024, 'pending'::vehicle_status, false, NULL, '2024-06-15'::date, 'Fail not equipped PWAS'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1384TNA', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ibrahim Mansor', '2563003645', 2013, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-06-16'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1394SXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'RASHED MOHAMMED', '2591774498', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1419LTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Shafiq Abdul Latif', '22044158281', 2020, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-12-22'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1420LTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammed Ahmed Ibrahim', '2234741888', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-12-19'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1421URA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Sajid Ahmad', '2586916039', 2016, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1421XSA', 'dyna_mini_truck'::equipment_type, 'A'::equipment_category, 'Muhammad Amin Boota', '2215474640', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2026-03-25'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1467BSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Nazer El Dn', '2378570549', 2022, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-12-27'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1477BSA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Salam Khan', '2386111534', 2022, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-27'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1526GXA', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'INAM ULLAH', '2552630689', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-06-27'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1530465', 'telehandler'::equipment_type, 'A'::equipment_category, 'Kahlan Khalid', '2501413252', 2022, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-23'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1532ZXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Husain Khan Dulli', '2596658258', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-10-20'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1536ZXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Kasim Deenu', '2596658498', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-22'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1540JEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdul Mounm Ramay', '2514950993', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2026-08-06'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1541JEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Hammad Ahmed', '2361742014', 2022, 'rejected'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2025-09-09'::date, 'Expired'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1543JEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Md Samirul Haque', '2387145317', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-09-01'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1544JEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Rafique', '2476324237', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-10-07'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1545JEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Khuram Muhammad Qayyum', '1545JEB', 2020, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1547JEB', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Nader Turayhib Al Otaibi', '1115151498', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-01-07'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1548SXB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Rab Nawaz Khan', '2527830976', 2022, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-09-15'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1550JBB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Mukesh Kumar', '2558632283', 2015, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-06-10'::date, 'Failed - old model'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1554ZXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Pradeep Jangir', '2594608701', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-10-20'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1555ZXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Sahil Aslup', '2596661047', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-04'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1556ZXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Khaleed Khan', '2596658670', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-10-20'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1558ZXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Salim Lsab', '2594607448', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-04'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1562ZTB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Abdulaziz Ahmed', '2592247197', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-11-11'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1574BBR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Wiljoy Layug Delos Reyes', '2475179848', 2023, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1597HJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-07-15'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1598BAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Hamza Rafique', '2527688549', 2014, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-03-03'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1614NTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamad aeish', '2464088684', 2024, 'pending'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2026-07-09'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1615NTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammad Ayesh Saleh', '2464088984', 2023, 'pending'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2025-12-16'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1616NTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Adel Kamel', '2544695998', 2023, 'pending'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2025-12-16'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1617NTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Saqib Khalid Madni', '2596994646', 2023, 'pending'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2025-12-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1625JZR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1625SKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ali Roubaie', '20006125', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1637BSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Hussain Ullah', '2555540745', 2014, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-08-11'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1649DTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Md Bellal Hossain Abdul', '2256967908', 2022, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-10-07'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1664XSA', 'dyna_mini_truck'::equipment_type, 'A'::equipment_category, 'ABDUL HASHEM', '2174329454', 2023, 'verified'::vehicle_status, false, 'Oxagon/AL FAHD (4800000823)-(SR2)', '2026-05-27'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1667ESA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Hatim Atieq', '2462466158', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-08'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1668ESA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Subhi Hadi Moqbel', '2516107154', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-12-08'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1683SXA', 'service_truck'::equipment_type, 'B'::equipment_category, 'Taher Khan', '2516233554', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-10'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1684XSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Sharookh fajlur rahman', '2483258121', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-09-23'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1686DTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Qais Adnan', '2350236747', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2026-07-27'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1688RDA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ericson Realin', '2441330509', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-12'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1694XSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Amirul abdo', '2568053520', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2026-03-24'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1696EDR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ibrahim Ali Saleem Alatawi', '542126308', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1696XSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mohammed elghadban', '2575532367', 2023, 'verified'::vehicle_status, false, 'Oxagon/AL FAHD (4800000823)-(SR2)', '2026-04-15'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1697XSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ahmed Maher', '2533267064', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-12-27'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1699XSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'NABI AHMED', '2464704218', 2023, 'verified'::vehicle_status, false, 'Oxagon/AL FAHD (4800000823)-(SR2)', '2026-04-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1699ZTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1704ZTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Alaa', '2564819072', 2022, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-07-28'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1706ZTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdelwahed Mostafa', '2571840533', 2022, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-07-17'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1707XSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Anshol Paplo', '2568050898', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-08-24'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1712XSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Waqas jamal', '2558902447', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-09-17'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1721ZXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Arif Khan Mustak', '2594607448', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-27'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1729XSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Surajpal rajpal', '2558198947', 2022, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-08-26'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1731XSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Mohd Usman', '2568052589', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2026-05-28'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1733AXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Ali Ahmed Mohsen', '2558474553', 2012, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-06-01'::date, 'FAILED- Old Model'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1738XSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Erfan Ahmed', '2486254069', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2026-05-28'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1742XSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Shavel Javen', '2558197493', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2026-05-28'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1744XSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Aslam Yabuk', '2567048869', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-08-26'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1745XSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Ilyas Khan', '2567228297', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2026-05-28'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1748XSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Irfan Ali Sukur', '2558256224', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-12-29'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1749KTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mahmud Ali Chohan', '2165192416', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-02-23'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1750BSA', 'dyna_mini_truck'::equipment_type, 'A'::equipment_category, 'Mohamed Wazir', '2485134288', 2016, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-20'::date, 'Passed with NDT'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1810GTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Hani Mahrous', '2527630020', 2023, 'pending'::vehicle_status, false, NULL, '2026-09-28'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1812TTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-12-23'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1821GTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Utban Mushtaq', '2574385064', 2023, 'pending'::vehicle_status, false, NULL, '2026-09-28'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1823LXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Hamdoun Harqas Janqam', '2385576059', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-12-19'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1823RTB6', 'mewp'::equipment_type, 'A'::equipment_category, 'Faruk Islam', '2486179431', 2022, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2025-03-05'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1841DEA', 'dyna_mini_truck'::equipment_type, 'A'::equipment_category, 'Shahid Khan yaqoob', '2493077073', 2010, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-01-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '185111935S3E09016', 'forklift'::equipment_type, 'A'::equipment_category, 'MUHAMMAD SHAHID', '2582495095', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1855KEA', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2010, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-10-04'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1858JUA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'QUDRAT ULLAH', '2546672045', 2014, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-04-20'::date, 'Pass With NDT'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1859TEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohyul Islam', 'TBA', 2024, 'pending'::vehicle_status, false, NULL, '2025-10-14'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1873EER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Binod Koumar B. K.', '2510984673', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-10'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1874EER', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-04'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1887RXA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'ISMAIL KHAN', '2532414576', 2024, 'pending'::vehicle_status, false, 'Oxagon/RPCO (SR1)', '2025-02-13'::date, 'FAILED; FREELANCE& NO CAM'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1898RXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Kaiyom Matubbar', '2495062214', 2024, 'pending'::vehicle_status, false, 'Oxagon/RPCO (SR1)', '2025-06-17'::date, 'Fail - Freelance'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1924DEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Thomas Quinn', '550658149', 2024, 'pending'::vehicle_status, false, 'Oxagon/DSV (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1937JSR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mostfa Hamed', '2252001322', 2023, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2026-06-16'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1937LDA', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Asanka Rohana G Kirale Gedara', '2539895413', 2020, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2024-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1944NXA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'JOHAR KHAN', '2583079105', 2024, 'pending'::vehicle_status, false, 'Oxagon/RPCO (SR1)', '2026-06-24'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1970TXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Anas Tawfiq Altahama', '2346237627', 2023, 'pending'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2025-12-15'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '1992BBD', 'ambulance'::equipment_type, 'B'::equipment_category, NULL, NULL, 2012, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-09-16'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2011JTB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Sadaqat Shah', '2410668129', 2020, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-06-30'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2015DRR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Hadi Abdulaha', '1082969740', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-29'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2031LSB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, NULL, NULL, 2021, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-01-10'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2047TXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Haji Saleem', '2442777831', 2022, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-07-20'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2061924', 'mewp'::equipment_type, 'A'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-14'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2063XDR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Ayub', '2252129651', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-05-18'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2098DDA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Daharmendra', '2584741264', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-05'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2118JTB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Mohamed Naved', '2579100658', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2026-03-17'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2132VRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Sur man bajman', '2578761989', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-17'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2174DXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'M Younis', '2247438472', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-10-27'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2186GXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Umar Muhammad Zamas', '2488729159', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-09-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2188SXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Umair Mohamed', '2488729159', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-06-01'::date, 'Failed - Freelance'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2213NSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Saudi Ready-Mix Concrete - (A)', '2025-02-06'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2217NSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Saudi Ready-Mix Concrete - (A)', '2025-02-07'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2223RTB15', 'mewp'::equipment_type, 'A'::equipment_category, 'Abey Kawsar Abul kashem', '2475023418', 2022, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2025-03-05'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2223RTB19', 'mewp'::equipment_type, 'A'::equipment_category, 'Idris Ali Mahmoud Musa', '2502077395', 2020, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2024-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2236NSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Saudi Ready-Mix Concrete - (A)', '2025-02-07'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2260DDA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Abulkhashem Miah', '2555970082', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-01-15'::date, 'Fail, Unsafe condition'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2289LXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Eddy Lebbos', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2024-06-14'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2290LXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'David Lorse', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2291LXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Fouad', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '230603004', 'coring_drilling'::equipment_type, 'A'::equipment_category, 'Al Amin', '2478802560', 2023, 'pending'::vehicle_status, false, NULL, '2025-12-29'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2306JEB', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'Irfan', '2542748054', 2013, 'pending'::vehicle_status, false, NULL, '2025-04-09'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2306LHR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'salvaudin thambi', '2542768953', 2025, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2026-07-28'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2310942', 'forklift'::equipment_type, 'A'::equipment_category, 'Zubair Shahzad', '2547714994', 2024, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-06-02'::date, 'Failed - freelance, no camera'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2316UEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Brian Depecker', '2570156394', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2329GTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Shah Faisal', '2290806567', 2023, 'rejected'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2025-12-31'::date, 'Expired'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2334UEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Franki Smat', '2571377841', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2337RAS', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Fatai Adeekunle', '2514212840', 2025, 'pending'::vehicle_status, false, NULL, '2026-09-28'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2393VVJ', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2017, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-12-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2398KTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Islam Farag', '2405436235', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2399GAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Md Tariq fazl', '2517790925', 2024, 'pending'::vehicle_status, false, 'Oxagon/RPCO (SR1)', '2026-02-17'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2437JAA', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Ahmed Mohammad', '2275444715', 1989, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-11'::date, 'Pass W/NDT'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2467HEB', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Ebrahim Abdullah', '2530396510', 2025, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-06-02'::date, 'Failed - freelance, no camera'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2474BLA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Muhammad Tahir', '2445275064', 2011, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-06-10'::date, 'Failed - old model'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2475HBB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, NULL, NULL, 2016, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-01-01'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2502LZR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammed Alfar', '6125117414', 2025, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-09-29'::date, 'No - No Iqama-Visa Holder only - 3 months approval only'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2505EDA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Ansar Rafeq', '2318194194', 2015, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-06-01'::date, 'Failed- Old Model'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2539TAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-07-14'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2551100020R000062', 'mewp'::equipment_type, 'A'::equipment_category, 'AWAIS KHAN', '2592563254', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2551100020R000097', 'mewp'::equipment_type, 'A'::equipment_category, 'MD RONY MIAH', '0509707101', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2551700020R000275', 'mewp'::equipment_type, 'A'::equipment_category, 'MOHAMMAD RUBEL', '2509706960', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2556SUA', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'seikh ali imam', '2236348393', 2015, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-12-28'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2560HEB', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'AHMED Omar Salim', '2498728142', 2025, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-10'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2564ALR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'MUHAMMAD ABEED', '2533217416', 2024, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2026-09-03'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2599LXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Zaheer abbas', '2602752426', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-17'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2600LXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Nasser Abdullah', '2525691594', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-08-12'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2603LXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Naeem Afzal', '2601360734', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-18'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2604LXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'MOHAMMAD ALI AHMED', '2586730844', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2605LXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Sujita Bista', '2603490364', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-17'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2606LXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Dhiran Kumar Tamang', '2595581628', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-17'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2608LXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Ajay Kumar', '2597625801', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-08-12'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2609LXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Mustafa Mohammad', '2510334218', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-08-12'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2610LXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Nemichand Bijaraniya', '2596462883', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-08-12'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2618HRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Majeeb Jan Ahmed', '2488739521', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-12-05'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2619HRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Misal Khan', '2585395904', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-12-05'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2620HRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'khalid Ahmed', '2170378240', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-12-05'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2621HRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Abdullah Saleh', '2488373361', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-12-05'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2622HRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Ebrahim Alabdali', '2355236205', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-12-05'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2623HRA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Taha Abdullah', '2596145280', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-12-05'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2627GSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Sitaram Mahato', '25789531180', 2022, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-06-01'::date, 'Failed - no camera'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2629LXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-09-22'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2638NXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Riast Ali', '2300720840', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-08-05'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2657TXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sharwan Chaudhary', '2502115310', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2662GRA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Abdullah Mohammad', '2547031720', 2022, 'verified'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2026-03-26'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2666KAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'ISMAIL MOHAMAD', '2485369785', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-24'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2667KAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Esmail Mohammad', '2594834901', 2024, 'pending'::vehicle_status, false, 'Oxagon/RPCO (SR1)', '2026-02-09'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2680TBB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mahmoud Mostafa', '2556178644', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2680TTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mahmoud Mostafa', '2556178644', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-04-01'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2681TTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Saud Khan', '2536480441', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-06-01'::date, 'Failed - No logo'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2682TBB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Moahmed Abubark', '2413639994', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2682TTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Moahmed Abu Bakr', '2413639994', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-04-01'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2684TTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sapel Shah', '2568926634', 2020, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-04-21'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2686TTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Osama Abu Alabbas', '2442839193', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2693TTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ayman Osman', '2538764446', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-04-02'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2694TTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Rady', '2331495065', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-10-07'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2709HBJ', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-04-04'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2726KLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2748XED', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'TBA', 'TBA', 2018, 'pending'::vehicle_status, false, 'Oxagon/DSV (PMC) - (B)', '2025-10-21'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2754EXD', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2017, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-10-30'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2762EXD', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohd Haris Ram', '2337111286', 2017, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-07-20'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2787EXD', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Faheem Khan', '2253030858', 2017, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2026-03-17'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2824VJA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Mohammed Arshad', '2583358466', 2011, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-05'::date, 'Pass With NDT'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2826KSR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-11-04'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2890JTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammad shahel', '2517937351', 2024, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2026-09-21'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2894JSR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Gilmore Bautista', '252497419', 2023, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-12-30'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2900BXA', 'service_truck'::equipment_type, 'B'::equipment_category, 'Jamshed Khan', '2550676627', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-06-09'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2906JTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mahrsh Kumar', '2608699860', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-06-02'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2907JTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Arun Khan', '2606721682', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-06-02'::date, 'Failed - old model'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2916ZBB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Shahul Hameed', '2253938498', 2016, 'pending'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2025-12-16'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2923JTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'surty das ram', '2610130441', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-07'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2925RTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Indika Prasad', '2537391621', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-08-09'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2926RTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Khalid Muhammad', '2560777464', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-08-10'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2931DTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Ashry', '2590503062', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-08-10'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2946DKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Manuel Berdonado', '2150732481', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-07-23'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2948DKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-10'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2960TDB', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'MOHAMMAD MUSTAFA', '2483218760', 2017, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-31'::date, 'PASS WITH NDT'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2965XXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'HAYAT UD DIN MUHAMMAD', '2540412885', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-05-12'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2968XXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Jalaluddin', '2422424511', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-05-19'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2976HXB', 'ambulance'::equipment_type, 'B'::equipment_category, 'Hizam Ali Muhammad', '2447966942', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-07'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2980VXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Tarik Enhas', '20003357', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2986JTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Shiv Kumar', '2608699274', 2015, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-08'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2994KRB', 'ambulance'::equipment_type, 'B'::equipment_category, 'Ahmed Salah', '2562902730', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '2995KRB', 'ambulance'::equipment_type, 'B'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3023BXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-03-01'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3030NSA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-06-02'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3032JAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Marlon Oswa', '2333430219', 2013, 'pending'::vehicle_status, false, NULL, '2025-09-11'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3040JRB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Dan K', '2589831938', 2019, 'pending'::vehicle_status, false, 'Oxagon/Expertise - (C)', '2025-06-02'::date, 'Failed - no camera'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3061BXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-07-16'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3065KAA', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Nasar Ali', '2564021448', 2016, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-03-15'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3068DHR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Hasan', '6122015937', 2025, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-09-29'::date, 'No Iqama - Visa holder only - 3 months approval'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3069ASA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'GHULAM SHABBIR', '2541536914', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-28'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3081DXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Diaa El-Din Khair El-Din', '2365179304', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-12-19'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3097TNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Makram Sufyan', '2332758768', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-05-11'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3100AEB', 'dyna_mini_truck'::equipment_type, 'A'::equipment_category, 'ALI ABDULLAH', '2491159774', 2023, 'pending'::vehicle_status, false, 'Oxagon/RPCO (SR1)', '2025-02-13'::date, 'FAILED; FREELANCE'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3104HRA', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Hail Hamood', '2534104662', 2022, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-06-03'::date, 'Failed - Freelance'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3106SEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Barry Forster', '2570075404', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-05-13'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3107BEB', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3107TNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mubashar Riaz', '2452113109', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-02-16'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3108TNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3109TNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Bilal Alshagnhoubi', '2224215260', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-05-19'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3115ZXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-04'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3124DXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Khaled', '2560459725', 2022, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-08-18'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3151USA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Zafar Iqbal', '2493740019', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-26'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3152DXA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Ram niwas Ray', '2516138282', 2025, 'pending'::vehicle_status, false, NULL, '2025-12-29'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3153GXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammed Faheemuddin Tipoo', '530632748', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3161DJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Montser Ghonim', '2295421198', 2022, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2026-05-11'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3162SAB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Anuska P', '2545363364', 2015, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-01-04'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3173KAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Mo kaif khan', '2544877356', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-11-20'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3178DXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-08-26'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3179AAA', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Rajat Salaria', '2575075409', 2020, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-17'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3179ZUA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'FARHAD ALI', '2522561576', 2014, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-04-20'::date, 'Pass With NDT'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3185EKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Fareed', '2437001338', 2024, 'rejected'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2025-12-31'::date, 'Expired'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3187JRB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Sajith Veppancherry Sathyan', '2562779807', 2018, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2025-06-18'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3189TUA', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Mohamed Khan', '2407472733', 2014, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-06-22'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3194JUA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'TAHIR HAMEED', '2541745309', 2014, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-04-20'::date, 'Pass With NDT'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3201NTB', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Atef Taj', '2542028408', 2018, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-01-01'::date, 'Fail freelance& old model'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3226JAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'M. Nawaz', '2418536048', 2011, 'pending'::vehicle_status, false, NULL, '2025-04-21'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3229DXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Nurul Ansari', '2490307226', 2022, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2026-05-13'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3246UTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Matty McQuillan Waters', '538227705', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3260HDA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Chandrakumara Mudiyanselage', '2528180744', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-11'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3271DXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mohammad Otman', '2498072947', 2025, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800000796)-(SR1)', '2025-06-02'::date, 'Failed - freelance'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3386GRJ', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2014, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-12-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3389UXA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'NISAR AHMED', '2480558960', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3401SXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/Saudi Ready-Mix Concrete - (A)', '2025-02-06'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3407TDB', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'IMRAN NAZIR', '2401677204', 2017, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, 'PASS WITH NDT'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3410BSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Mutadha Abdullah', '2563040753', 2019, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-01-06'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3411LRA', 'service_truck'::equipment_type, 'B'::equipment_category, 'Multala Muhammad', '2459299620', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-30'::date, 'Pass With NDT'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3413ZTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Shaikh Ibrahim', 'TBA', 2024, 'pending'::vehicle_status, false, NULL, '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3424SXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/Saudi Ready-Mix Concrete - (A)', '2025-02-07'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3441TTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Johan Van Der Mescht', '2566363749', 2023, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3446KKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Abd El Hafez', '2547359998', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3447KKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmad Abdu', '2429662956', 2023, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2026-05-20'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3458AAR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ashraf Saja', '1846H', 2021, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-28'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3461UTR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Alexis Jeronimo', '553928157', 2023, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3473JTA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'SHABAN ABDUL RAZIQ', '2543772947', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-06-18'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3476HDA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Amod Dahal', '2563391495', 2022, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-18'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3480AZR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mike Crandell', '966539705082', 2024, 'pending'::vehicle_status, false, 'Oxagon/Jacobs (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3500ZAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'MOHAMMAD IRSHAD', '2606986921', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-20'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3515ALR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'WEAL WAGDY', 'A41585262', 2024, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2026-09-03'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3518ALR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'OSAMA FAROUK', 'A33456263', 2025, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2026-09-03'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3521ALR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Faroq', '6121717526', 2024, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-09-29'::date, 'No Iqama - Visa holder only - 3 months approval'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3535ASA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'KULDEEP SINGH', '2536155407', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3553KSB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, NULL, '2026-02-24'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3567BXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'abdul rehman', '2240233417', 2020, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-08-17'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3579HJD', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Robert Morgan', '7107H', 2017, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2025-01-15'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3594HJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Rahman Ullah', '2330270055', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3598LUA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Bashar Esam', '2532687262', 2006, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-06-01'::date, 'Failed - Old model, freelancer'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3598ZSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Saudi Ready-Mix Concrete - (A)', '2025-02-06'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3630EAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'MUZAFFAR IQBAL', '2516222607', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3631EAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'INDIKA PRASAD', '2560021350', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3632EAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'FADUL ABDULLAH', '2505236519', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3633EAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'NESARAJA NAGAMANY', '2533966038', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3634EAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'ARUN KUMAR', '2537134807', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3635EAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'NAIK REHMAN', '2514862396', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3635ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Hamed Shihdeh Aldara Wish', '2125459780', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-06-04'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3636EAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'TEHSEEN NASIR', '2582095051', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-28'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3637EAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'TALWINDER SINGH', '2594116002', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3638EAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'RAVINDER SINGH', '2594114965', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3641EAA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'AFTAB AHMED', '2533482556', 2022, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3641ZSB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Shakibul Alam', '2550879023', 2021, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3653NLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Farooq Lagahit', '2294069749', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3680GRA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Muhammad Ahmed Saleh', '2352912204', 2021, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-05'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3697DSA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Najim Dain', '256176654', 2015, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-06-01'::date, 'Failed-Old Model & Freelance'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3708VXB', 'service_truck'::equipment_type, 'B'::equipment_category, 'Kahlan Mohamed', '2555936992', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-29'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3714ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/PUBLIC SAFETY NEOM - (B)', '2025-10-27'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3721VHR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Muhammad Tipoo', '2554428108', 2025, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2027-01-19'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3725VXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Zaherul Hasan', '2546081569', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-29'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3727DEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'TBA', 'TBA', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3728DEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'TBA', 'TBA', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-06'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3728ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/PUBLIC SAFETY NEOM - (B)', '2025-10-29'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3729DEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'TBA', 'TBA', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-04'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3746STV', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2019, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3760RLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Omar', '2429933712', 2022, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2026-05-11'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3769TSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Taher Hameed', '2541745309', 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-01-15'::date, 'Failed l, Tires damage'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3777SBB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mahmood Abdulrauf', '2409123870', 2016, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3778SBB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mahmoud Rauf', '2409123870', 2016, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-11-27'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3814ZAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Ashishek Yadav', '259730589', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-10-28'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3819DXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'ABID HUSSAIN', '2580270128', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3820DXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Mohammad Qashash', '2539182564', 2024, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-27'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3821LKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Kristoffer Medberg', '2552867067', 2023, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2024-06-16'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3822LKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Syed Zubair Haque', '2130797075', 2022, 'pending'::vehicle_status, false, 'Oxagon/SIBS - (4800000838)-(SR1)', '2025-07-17'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3852GAR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2005, 'pending'::vehicle_status, false, 'Oxagon/PUBLIC SAFETY NEOM - (B)', '2025-07-03'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3854NEB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Mehtab Hamad', '2596580684', 2024, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-03-03'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3871KTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Sani Kumar', '2510171560', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-07'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3874KTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammad Nawaz Ansari', '2278782483', 2020, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3876KTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mutaz Habeeb Fayiz Mousa', '2296552249', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-02-24'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3879KAD', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Syednasiruddin Jaffar', '2258062732', 2016, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2026-04-06'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3883RER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ioannis Papanikolaou', '2579770849', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-02'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3887KTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdul Majeed Rahim', '2568071241', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-02-24'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3890RER', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ivan Jovanovic', '2576954438', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3896ZSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Saudi Ready-Mix Concrete - (A)', '2025-02-06'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3904HJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Jakir Hussain Khan', '2485764456', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-05-21'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3904SSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Raqib Javid', '2595443561', 2016, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-02-18'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3913NSA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Sukhvir singh', '2564113831', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800000796)-(SR1)', '2026-02-18'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3914THR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Oleh Karbovnik', '6124771607', 2025, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-09-29'::date, 'No Iqama - Visa holder only - 3 months approval'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3934ASA', 'tanker_truck'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-19'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3935GSR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Michael Quinones', '2340836192', 2023, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2026-07-03'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3944ZLR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Faisal Ali Alshehri', '1095447593', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-06-04'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3952LSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'HUSSEM AL BURAIKI', '2590804593', 2024, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-12-03'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3956KGB', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'HAMZI MOHAMED', '2503097400', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-27'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3958JSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2019, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3967BAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Abdulla Mohammad', '2544425891', 2021, 'pending'::vehicle_status, false, 'Oxagon/RPCO (SR1)', '2026-02-09'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3967DGR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdulrahman Aed Saleh Albalawi', '595522061', 2024, 'pending'::vehicle_status, false, 'Oxagon/Supplemental Manpower (SMP)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3970SNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Midhun Ravindra', '2559408758', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-05-11'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3971ZSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Saudi Ready-Mix Concrete - (A)', '2025-02-06'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3974ZSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Saudi Ready-Mix Concrete - (A)', '2025-02-06'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3975ZSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Saudi Ready-Mix Concrete - (A)', '2025-02-06'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3976TDB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Amarat Hunga', '2561682168', 2011, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-03-08'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3979SNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Javen Sayyed', '97455982804', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3984SNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Maqbul Majeed', '2498090592', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3985SNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Usman Khurshid', '2561096609', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2026-05-11'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '3HK01053', 'wheeled_loader'::equipment_type, 'A'::equipment_category, 'Jamil Ali', '2526135773', 1989, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-11-20'::date, 'Pass W/NDT'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4016DXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Ibrahem Afridi Akbar', '2579099124', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800001272)-(SR2)', '2025-11-17'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4017DXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Bilal Zafar', '2426991119', 2024, 'pending'::vehicle_status, false, 'Oxagon/AL FAHD (4800000882)-(SR1)', '2025-08-26'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4041TAA', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Muhammad Nabi Bakri', '2532146822', 2020, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-11-17'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4048ZNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Yahya Sughayyir', '20006137', 2024, 'pending'::vehicle_status, false, 'Oxagon Projects', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4059NSR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/PUBLIC SAFETY NEOM - (B)', '2025-10-28'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4061DHA', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Walter', '2547656013', 2013, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-12-30'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4061NSR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'TBA', 'TBA', 2023, 'pending'::vehicle_status, false, 'Oxagon/DSV (PMC) - (B)', '2025-10-27'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4069KEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'John Connolly', '502458823', 2024, 'pending'::vehicle_status, false, 'Oxagon/DSV (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4077BKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2025, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2025-12-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4078KEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Darren Smylie', '553606487', 2024, 'pending'::vehicle_status, false, 'Oxagon/DSV (PMC) - (B)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4090DKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-12-26'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4096UJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-09-02'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4099UJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-10-27'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4100JJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-03-01'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4102UJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-07-15'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4106ZXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Sabol', '2529551190', 2023, 'pending'::vehicle_status, false, 'Oxagon/SAMA (4800001272)-(SR1)', '2026-05-26'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4158BKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed Mohamed Abdelraheem Ahmed', '2537320232', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-09'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4166TRA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'Kiran Karki', '2482395494', 2011, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2025-10-22'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4180EEB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Tanka Bahadur', '2508985427', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-27'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4191GTA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'AHMED MOAWAD', '2263660082', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-28'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4194RXA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Mazhar Ali', '2338869825', 2021, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-09-29'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4195RXA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Ambar Bahadur', '2512561446', 2021, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2024-06-15'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4196SJA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Sanjeewa Age', '2545640050', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-07-02'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4197GTA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'MOHAMMAD NAQEEB', '2567541947', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-05-28'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4208BTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Riaz', '2375970816', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2026-08-06'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4221GEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Arif Ullah Khan', '2478526029', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-05-11'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4235EEB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Adil Mehmadi', '1052637384', 2024, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4238BKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Samy Ahmed Arafat Elsaadawi', '2567822206', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-07-17'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4241GDA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Mahipal Singh', '2410583278', 2007, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-10-05'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4242GDA', 'tanker_truck'::equipment_type, 'A'::equipment_category, NULL, NULL, 2008, 'pending'::vehicle_status, false, 'Oxagon/Shapoorji (4100001496)-(SR1)', '2025-01-01'::date, 'Fail, Old model'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4249SUA', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Gilbert Magtibay', '2370283406', 2014, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-11-11'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4251LXB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Masb Ullah', '2520390150', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-10-06'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4262KAA', 'backhoe'::equipment_type, 'A'::equipment_category, 'Othman Mughait Hussain', '2555631742', 2014, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-06-01'::date, 'Failed- Old Model & Freelance'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4342BSA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Farid Yahya', '24748226654', 2021, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-12-08'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4351LUJ', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Salavudeen Thambi', '2542768953', 2016, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2026-07-03'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4357URA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Abdulmajid Muhammad Sabir', '2371072790', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-01-15'::date, 'Failed, Insurance expired'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4358DJR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2020, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2024-05-19'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4358URA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Muhammad Qasim', '2548968631', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-08'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4359URA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Wahid Tuhayar', '2517820474', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-08'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4360URA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Ghindanda Sharma Upendra', '2484623836', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-12'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4361URA', 'concrete_mixer_bulker'::equipment_type, 'B'::equipment_category, 'Muhammad Akram', '2389462355', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-03-11'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4372BDD', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Paul Barour', '8073H', 2017, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-10'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4382ZTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Irfan Haider Israr', '233663972', 2024, 'pending'::vehicle_status, false, 'Oxagon/SAMA (WO-029)-(SR1)', '2026-07-06'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4393GHR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2025, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2025-12-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4394GEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdul majeed', '2387898394', 2023, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-05-19'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4403BAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'GULJAR SHEKH', '2533580292', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-04-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4411RXA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'ELNOUR AWAD', '2475021750', 2024, 'pending'::vehicle_status, false, 'Oxagon/NBC (4200000029-026)-(HW55)', '2026-03-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4415RXA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, 'Qmar Arshad', '2384353872', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-08-12'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4417RXA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Mutasim Haroun Sharaf', '2505964136', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-10-28'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4419RXA', 'tanker_truck'::equipment_type, 'A'::equipment_category, 'Sumit daiya', '2593028976', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-26'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4426BKR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Jose Thankachan', '2136179336', 2023, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-12-31'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4432ZGR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Malik Alenzi', '110515212532', 2022, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2026-07-03'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4435ZGR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohammed al-qahtani', '1096020969', 2024, 'pending'::vehicle_status, false, 'Oxagon/Imtiaz Concrete  Ready-Mix (Service Provider) - (A)', '2026-07-03'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4484SRR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Ahmed alwadadih', '2362988145', 2023, 'pending'::vehicle_status, false, 'Oxagon/TDP (4800000892)-(SR1)', '2025-12-16'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4496EDB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Muhammad Abdul Rauf', '2409123870', 2018, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2026-03-08'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4499ZAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Asif Ali', '2520673589', 2025, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-10-07'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4501EAA', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'Ahmad Tirak', '2555877980', 2022, 'pending'::vehicle_status, false, NULL, '2025-04-02'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4502EAA', 'excavator_tracked'::equipment_type, 'A'::equipment_category, 'M Rabia', '2555886452', 2022, 'pending'::vehicle_status, false, NULL, '2025-04-01'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4529TRA', 'flatbed_trailer'::equipment_type, 'A'::equipment_category, 'Thire Iqbal', '2369467143', 2011, 'pending'::vehicle_status, false, NULL, '2024-06-15'::date, 'Fail, freelancer'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4532THD', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Shafeer Ahammad', '1847H', 2021, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-10-30'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4535GDA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'muhammad khamis baqatmi', '2454085024', 2011, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-06-09'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4604SJA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Sandeep Kumar', '2555224118', 2012, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-06-01'::date, 'Failed- Old Model'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4618SJA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Olintan Hewage', '2532729189', 2013, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-12'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4669DTA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'BASHAR ALI', '2567030420', 2025, 'verified'::vehicle_status, false, 'Oxagon/JV-ECH-T1 (Al_Saif_China Harbor_Hassan Alam) (4800001131)-(SR2)', '2026-02-10'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4674NBR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-10-07'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4675KAA', 'mobile_crane_wheeled'::equipment_type, 'A'::equipment_category, 'Ahmed Abdullah', '2558589509', 2013, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-12-05'::date, 'Pass with NDT'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4684TTB', 'bus_minibus_coach'::equipment_type, 'B'::equipment_category, 'Zaker ullah', '2257160735', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abduallah A. Albriki -AAB (4800000901)-(SR1)', '2025-06-03'::date, 'Failed - have no camera'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4724ZZR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Yousif', '2312673169', 2025, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2026-10-06'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4734BEB', 'ambulance'::equipment_type, 'B'::equipment_category, 'Sabtar Ali', '2511795235', 2023, 'pending'::vehicle_status, false, 'Oxagon/Abdul Mohsen Al-Tamimi (4800001405)-(SR1)', '2025-11-19'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4738STB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Tuseef Iqbal', '2478137991', 2024, 'rejected'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2025-03-01'::date, 'Expired'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4739STB', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001134)-(SR1)', '2025-03-01'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4748XTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Fyzar Khan', '2528924232', 2024, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4758XXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-07-15'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4775UTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Arther Jhonson', 'TBA', 2023, 'pending'::vehicle_status, false, NULL, '2025-08-25'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4776UTB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Nousahd', 'TBA', 2024, 'pending'::vehicle_status, false, NULL, '2024-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4778XXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2024, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-09-08'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4784XXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-10-10'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4789XXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2023, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-07-16'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4792XXR', 'light_vehicle'::equipment_type, 'B'::equipment_category, NULL, NULL, 2022, 'pending'::vehicle_status, false, 'Oxagon/Beaureau Veritas - (B)', '2025-07-15'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4796BAA', 'crawler_crane'::equipment_type, 'A'::equipment_category, 'Muhammad Arif', '2560888774', 2024, 'verified'::vehicle_status, false, 'Oxagon/Abyatona Development Contracting Co. (4800001112)-(SR3)', '2026-03-25'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4867UDR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Omar Alotaibi', '8924G', 2023, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-20'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4868UDR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Paul Postgate', '9603G', 2023, 'pending'::vehicle_status, false, 'Oxagon/Parsons - (B)', '2024-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4876SJA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Amod Dahal', '2563391495', 2012, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-07-02'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4878SJA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Chaminda Uduwelage', '2554225835', 2012, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-16'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4884SJA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'TBA', 'TBA', 2012, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-04-09'::date, 'No'
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4904EAA', 'hiab_boom_truck'::equipment_type, 'A'::equipment_category, NULL, NULL, 2010, 'pending'::vehicle_status, false, 'Oxagon/PPCO - (C)', '2025-05-13'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4904ZNR', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Abdul Waheed', '597256202', 2024, 'pending'::vehicle_status, false, 'Oxagon/Applus Velosi (PMC) - (B)', '2025-12-31'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4906SJA', 'dump_truck_articulated'::equipment_type, 'A'::equipment_category, 'Milan Palliyaguruge', '2531464176', 2012, 'pending'::vehicle_status, false, 'Oxagon/JV-(Sarco Disa_DEME_Archirodon) (4800000876) -(SR2)', '2025-08-06'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
INSERT INTO public.vehicles_equipment (company_id, plate_number, equipment_type, equipment_category, driver_name, national_id_number, year_of_manufacture, actual_status, is_blacklisted, client_company, next_inspection_date, reason_for_rejection)
SELECT id, '4928TEB', 'light_vehicle'::equipment_type, 'B'::equipment_category, 'Mohamed Balla', '2561405206', 2025, 'pending'::vehicle_status, false, 'Oxagon/Thyssenkrupp/TK-SAC (4800000731)-(SR1)', '2026-04-08'::date, NULL
FROM public.companies LIMIT 1
ON CONFLICT (company_id, plate_number) DO NOTHING;
