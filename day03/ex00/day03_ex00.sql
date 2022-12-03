SELECT pizza_name, price, pizzeria.name AS pizzeria_name, visit_date
FROM menu
JOIN person_visits ON person_visits.pizzeria_id = menu.pizzeria_id
JOIN person ON person.id = person_visits.person_id AND person.name = 'Kate'
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE price BETWEEN 800 AND 1000
ORDER BY pizza_name ASC, price ASC, pizzeria_name ASC;
