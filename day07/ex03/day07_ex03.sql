WITH count_visits_and_orders AS (
((SELECT pizzeria.name, COUNT(*) AS count, 'order' AS action_type
	  FROM pizzeria
	  JOIN menu ON menu.pizzeria_id = pizzeria.id
	  JOIN person_order ON person_order.menu_id = menu.id
	  GROUP BY pizzeria.name
	  ORDER BY count DESC)
 UNION
 (SELECT pizzeria.name, COUNT(*) AS count, 'visit' AS action_type
	  FROM pizzeria
	  JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
	  GROUP BY pizzeria.name
	  ORDER BY count DESC))
 ORDER BY action_type ASC, count DESC
)

SELECT name, sum(count) AS total_count
FROM count_visits_and_orders
GROUP BY name
ORDER BY total_count DESC;
