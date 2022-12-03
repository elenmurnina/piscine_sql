(SELECT person.name FROM person_order
JOIN person ON person.id = person_order.person_id
JOIN menu ON menu.id = person_order.menu_id
WHERE person.gender = 'female' AND menu.pizza_name = 'pepperoni pizza'
INTERSECT
SELECT person.name FROM person_order
JOIN person ON person.id = person_order.person_id
JOIN menu ON menu.id = person_order.menu_id
WHERE person.gender = 'female' AND menu.pizza_name = 'cheese pizza')
ORDER BY name ASC
