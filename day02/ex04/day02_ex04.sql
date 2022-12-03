SELECT pizza_name, pizzeria.name AS pizzeria_name, price FROM menu
LEFT JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name ASC, pizzeria_name ASC
