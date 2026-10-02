-- Models resolved by name (IDs come from IDENTITY and are never hardcoded).
-- Each model carries its category and engine type (models.md, vehicle_model).
INSERT INTO fleet.vehicle_model (brand_id, name, category_id, engine_type_id)
SELECT b.brand_id, m.model_name, c.category_id, e.engine_type_id
FROM (VALUES
    ('Chevrolet', 'Onix',     'Economy', 'Gasoline'),
    ('Chevrolet', 'Tracker',  'SUV',     'Gasoline'),
    ('Renault',   'Logan',    'Sedan',   'Gasoline'),
    ('Renault',   'Duster',   'SUV',     'Gasoline'),
    ('Kia',       'Picanto',  'Economy', 'Gasoline'),
    ('Kia',       'Sportage', 'SUV',     'Gasoline'),
    ('Mazda',     'Mazda 3',  'Sedan',   'Gasoline'),
    ('Mazda',     'CX-5',     'SUV',     'Gasoline'),
    ('Toyota',    'Corolla',  'Sedan',   'Hybrid'),
    ('Toyota',    'Hilux',    'Pickup',  'Diesel'),
    ('Toyota',    'Prado',    'Luxury',  'Diesel'),
    ('Nissan',    'Kicks',    'SUV',     'Gasoline'),
    ('Nissan',    'Urvan',    'Van',     'Diesel')
) AS m (brand_name, model_name, category_name, engine_type_name)
JOIN fleet.brand b       ON b.name = m.brand_name
JOIN fleet.category c    ON c.name = m.category_name
JOIN fleet.engine_type e ON e.name = m.engine_type_name;
