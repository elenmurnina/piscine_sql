((SELECT pizzeria.name, COUNT(*) AS count, 'order' AS action_type
	  FROM pizzeria
	  JOIN menu ON menu.pizzeria_id = pizzeria.id
	  JOIN person_order ON person_order.menu_id = menu.id
	  GROUP BY pizzeria.name
	  ORDER BY count DESC
	  LIMIT 3)
 UNION
 (SELECT pizzeria.name, COUNT(*) AS count, 'visit' AS action_type
	  FROM pizzeria
	  JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
	  GROUP BY pizzeria.name
	  ORDER BY count DESC
	  LIMIT 3))
 ORDER BY action_type ASC, count DESC;
