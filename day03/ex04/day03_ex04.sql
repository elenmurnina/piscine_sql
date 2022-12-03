WITH
	female_pizzeria_ids (pizzeria_id) AS
		(SELECT DISTINCT(pizzeria_id) FROM menu WHERE menu.id IN
		 (SELECT person_order.menu_id FROM person_order WHERE person_id IN (
			SELECT id FROM person WHERE gender = 'female'))),
	male_pizzeria_ids (pizzeria_id) AS
		(SELECT DISTINCT(pizzeria_id) FROM menu WHERE menu.id IN
		 (SELECT person_order.menu_id FROM person_order WHERE person_id IN (
			SELECT id FROM person WHERE gender = 'male')))
SELECT
	name AS pizzeria_name
FROM
	pizzeria
WHERE
	id IN (SELECT pizzeria_id FROM male_pizzeria_ids)
	AND
	id NOT IN (SELECT pizzeria_id FROM female_pizzeria_ids)
UNION
SELECT
	name AS pizzeria_name
FROM
	pizzeria
WHERE
	id IN (SELECT pizzeria_id FROM female_pizzeria_ids)
	AND
	id NOT IN (SELECT pizzeria_id FROM male_pizzeria_ids)
ORDER BY pizzeria_name ASC;
