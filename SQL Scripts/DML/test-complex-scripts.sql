USE aerobooking;

-- Data
SELECT * FROM country c;
SELECT * FROM user;
SELECT * FROM passport;
SELECT * FROM ticket ORDER BY flight_id;
SELECT * FROM plane;
SELECT * FROM flight;
SELECT * FROM city c;


SELECT * FROM ticket t
INNER JOIN flight f ON t.flight_id = f.id
INNER JOIN airport a ON f.airport_id = a.id
INNER JOIN city c ON a.city_id = c.id;

-- SOME WHERE 
SELECT * FROM ticket t
INNER JOIN flight f ON t.flight_id = f.id
INNER JOIN airport a ON f.airport_id = a.id
INNER JOIN city c ON a.city_id = c.id
WHERE price > 500 AND code_IATA = 'MSQ';

-- INNER (OUTER), LEFT, RIGHT, CROSS, SELF
SELECT model FROM plane; 

SELECT f.flight_number, p.model FROM flight f
INNER JOIN plane p ON f.plane_id = p.id;

SELECT f.flight_number, p.model FROM flight f
LEFT OUTER JOIN plane p ON f.plane_id = p.id;

SELECT f.flight_number, p.model FROM flight f
RIGHT OUTER JOIN plane p ON f.plane_id = p.id;

SELECT f.flight_number, p.model FROM flight f
CROSS JOIN plane p ON f.plane_id = p.id;

SELECT * FROM flight f1
JOIN flight f2 ON f1.flight_number = f2.flight_number;





-- SOME SELECT 
SELECT u.username, u.email, 
( SELECT p.first_name 
FROM passport p 
WHERE u.id = p.user_id
) as real_name,
( SELECT c.name 
FROM country c
INNER JOIN passport p ON p.country_id = c.id 
WHERE u.id = p.user_id
) as real_country
FROM user u;

-- AGREGATE FUNC: SUM, COUNT, MIN, MAX, AVG
SELECT flight_number, price 
FROM ticket t
INNER JOIN flight f ON t.flight_id = f.id;

SELECT flight_number, 
sum(price) as sum, 
count(t.id) as count, 
min(price) as min, 
max(price) as max, 
avg(price) as a 
FROM ticket t
INNER JOIN flight f ON t.flight_id = f.id
GROUP BY flight_number;

-- All sum of tickets for flight 
SELECT flight_number, sum(price) FROM ticket t
INNER JOIN flight f ON t.flight_id = f.id
INNER JOIN airport a ON f.airport_id = a.id
INNER JOIN city c ON a.city_id = c.id
GROUP BY flight_number;

-- OVER 
-- ROW_NUMBER(), RANK(), DENSE_RANK()
SELECT flight_number, price, 
row_number() over (order by price) as `row_number`,
rank() over (order by price) as `rank`,
dense_rank() over (order by price) as `dense_rank`
FROM ticket t
INNER JOIN flight f ON t.flight_id = f.id;

-- ROW_NUMBER(), RANK(), DENSE_RANK() + PARTITION BY
SELECT flight_number, price, 
row_number() over (partition by flight_number order by price) as `row_number`,
rank() over (partition by flight_number order by price) as `rank`,
dense_rank() over (partition by flight_number order by price) as `dense_rank`
FROM ticket t
INNER JOIN flight f ON t.flight_id = f.id;

-- LEAD(), LAG(), FIRST_VALUE(), LAST_VALUE()
SELECT flight_number, price, 
LEAD(price) over () as `lead+1`,
LEAD(price, 3) over () as `lead+3`,
LAG(price) over () as `lag-1`,
LAG(price, 2) over () as `lag-2`,
FIRST_VALUE(price) over () as `first`,
LAST_VALUE(price) over () as `last`
FROM ticket t
INNER JOIN flight f ON t.flight_id = f.id;

-- LEAD(), LAG(), FIRST_VALUE(), LAST_VALUE() + PARTITION BY
SELECT flight_number, price, 
LEAD(price) over (partition by flight_number) as `lead+1`,
LEAD(price, 3) over (partition by flight_number) as `lead+3`,
LAG(price) over (partition by flight_number) as `lag-1`,
LAG(price, 2) over (partition by flight_number) as `lag-2`,
FIRST_VALUE(price) over (partition by flight_number) as `first`,
LAST_VALUE(price) over (partition by flight_number) as `last`
FROM ticket t
INNER JOIN flight f ON t.flight_id = f.id;