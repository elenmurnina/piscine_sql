SELECT action_date, name AS person_name
FROM 
	(SELECT order_date AS action_date, person_id FROM person_order
	INTERSECT
	SELECT visit_date AS action_date, person_id FROM person_visits) ex06
JOIN person ON person_id = person.id
ORDER BY action_date ASC, person_name DESC
