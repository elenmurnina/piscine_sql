WITH
	Andrey_ordered_pizzeria_ids (pizzeria_id) AS
		(SELECT DISTINCT(pizzeria_id) FROM menu WHERE menu.id IN
		 (SELECT person_order.menu_id FROM person_order WHERE person_id IN (
			SELECT id FROM person WHERE name = 'Andrey'))),
	Andrey_visited_pizzeria_ids (pizzeria_id) AS
		(SELECT DISTINCT(pizzeria_id) FROM person_visits WHERE person_id IN (
			SELECT id FROM person WHERE name = 'Andrey'))
SELECT
	name AS pizzeria_name
FROM
	pizzeria
WHERE
	id IN (SELECT pizzeria_id FROM Andrey_visited_pizzeria_ids)
	AND
	id NOT IN (SELECT pizzeria_id FROM Andrey_ordered_pizzeria_ids)
ORDER BY pizzeria_name ASC;
