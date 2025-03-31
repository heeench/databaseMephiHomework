SELECT v.maker, m.model 
FROM motorcycle m
JOIN vehicle v on m.model = v.model
WHERE m.horsepower > 150 AND m.price < 20000 AND m.type = 'Sport'