INSERT INTO person_discounts
SELECT
	ROW_NUMBER() OVER() AS id,
	person.id,
	pizzeria_id,
	CASE
	WHEN COUNT(*) = 1 THEN 10.5
	WHEN COUNT(*) = 2 THEN 22
	ELSE 30
	END discount
FROM person_order
JOIN person ON person.id = person_order.person_id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY person.id, pizzeria_id;
