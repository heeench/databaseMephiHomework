SELECT v.maker, c.model, c.horsepower,
       c.engine_capacity, v.type as vehicle_type,
       (c.horsepower IS NULL) as is_null_horsepower
FROM car c
JOIN vehicle v ON c.model = v.model
WHERE c.horsepower > 150 AND c.engine_capacity < 3
      AND c.price < 35000
UNION ALL
SELECT v.maker, m.model, m.horsepower,
       m.engine_capacity, v.type as vehicle_type,
       (m.horsepower IS NULL) as is_null_horsepower
FROM motorcycle m
JOIN vehicle v ON m.model = v.model
WHERE m.horsepower > 150 AND m.engine_capacity < 1.5
      AND m.price < 20000
UNION ALL
SELECT v.maker, b.model, NULL AS horsepower,
       NULL AS engine_capacity, v.type AS vehicle_type,
       (NULL IS NULL) as is_null_horsepower
FROM bicycle b
JOIN vehicle v ON b.model = v.model
WHERE gear_count > 18 AND price < 4000
ORDER BY is_null_horsepower, horsepower DESC;