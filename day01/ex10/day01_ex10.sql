SELECT person.name AS person_name, menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM person_order
LEFT JOIN person ON person.id = person_order.person_id
LEFT JOIN menu ON menu.id = person_order.menu_id
LEFT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY person_name ASC, pizza_name ASC, pizzeria_name ASC
