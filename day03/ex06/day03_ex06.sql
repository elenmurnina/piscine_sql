SELECT 
	a.pizza_name, 
	(SELECT pizzeria.name FROM pizzeria WHERE pizzeria.id = a.pizzeria_id) AS pizzeria_name_1,
	(SELECT pizzeria.name FROM pizzeria WHERE pizzeria.id = b.pizzeria_id) AS pizzeria_name_2,
	a.price
FROM menu a, menu b
WHERE
	a.pizza_name = b.pizza_name
	AND a.price = b.price
	AND a.id > b.id
ORDER BY pizza_name ASC;
