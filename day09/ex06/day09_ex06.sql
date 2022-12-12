CREATE OR REPLACE FUNCTION
	fnc_person_visits_and_eats_on_date(pperson VARCHAR = 'Dmitriy',
									   pprice NUMERIC = 500,
									   pdate DATE = '2022-01-08')
RETURNS TABLE (pizzeria_name VARCHAR) AS $$
BEGIN
	RETURN QUERY
		SELECT DISTINCT pizzeria.name AS pizzeria_name
		FROM person_visits
		LEFT JOIN person ON person.id = person_visits.person_id
		LEFT JOIN person_order ON person_order.person_id = person.id
		LEFT JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
		LEFT JOIN menu ON menu.id = person_order.menu_id
		WHERE
			person.name = pperson
		AND menu.price < pprice
		AND person_visits.visit_date = pdate
		AND person_order.order_date = pdate;
END;
$$
LANGUAGE PLPGSQL;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Kate', pprice := 900, pdate := '2022-01-04');

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');

-- SELECT * FROM person_visits WHERE person_id = 1;
-- SELECT * FROM person_order WHERE person_id = 1;
-- SELECT * FROM menu WHERE id = 1 OR id = 2;
