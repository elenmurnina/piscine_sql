SELECT
	person.name,
	menu.pizza_name,
	menu.price,
	ROUND((menu.price / 100 * (100 - person_discounts.discount))) AS discount_price,
	pizzeria.name AS pizzeria_name
FROM
	person_order
JOIN
	menu ON menu.id = person_order.menu_id
JOIN
	person_discounts ON person_discounts.person_id = person_order.person_id
						AND person_discounts.pizzeria_id = menu.pizzeria_id
JOIN
	person ON person.id = person_order.person_id
JOIN
	pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE person_order.id IS NOT NULL
ORDER BY person.name, pizza_name;
