SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM person_visits
LEFT JOIN person ON person.id = person_visits.person_id
LEFT JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
LEFT JOIN menu ON menu.pizzeria_id = person_visits.pizzeria_id
WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08' AND menu.price < 800
ORDER BY pizzeria_name ASC
