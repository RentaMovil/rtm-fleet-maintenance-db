DELETE vm
FROM fleet.vehicle_model vm
JOIN fleet.brand b ON b.brand_id = vm.brand_id
WHERE (b.name = 'Chevrolet' AND vm.name IN ('Onix', 'Tracker'))
   OR (b.name = 'Renault'   AND vm.name IN ('Logan', 'Duster'))
   OR (b.name = 'Kia'       AND vm.name IN ('Picanto', 'Sportage'))
   OR (b.name = 'Mazda'     AND vm.name IN ('Mazda 3', 'CX-5'))
   OR (b.name = 'Toyota'    AND vm.name IN ('Corolla', 'Hilux', 'Prado'))
   OR (b.name = 'Nissan'    AND vm.name IN ('Kicks', 'Urvan'));
