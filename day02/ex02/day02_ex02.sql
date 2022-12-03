(SELECT COALESCE(ex02_2.name, '-') AS person_name, visit_date, COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM pizzeria
FULL JOIN
	(SELECT * FROM person
	LEFT JOIN
	(SELECT * FROM person_visits
	WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') ex02_1 
	ON ex02_1.person_id = person.id) ex02_2
ON ex02_2.pizzeria_id = pizzeria.id)
ORDER BY person_name ASC, visit_date ASC, pizzeria_name ASC
