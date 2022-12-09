SELECT person.name AS person_id, COUNT(*) AS count_of_visits
FROM person
JOIN person_visits ON person_visits.person_id = person.id
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
GROUP BY person.name
ORDER BY count_of_visits DESC, person_id ASC
LIMIT 4;
