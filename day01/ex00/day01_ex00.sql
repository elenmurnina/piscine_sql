SELECT * FROM
	(SELECT id AS object_id, pizza_name AS object_name
	FROM menu
UNION
	SELECT id AS object_id, name AS object_name
	FROM person) ex00
ORDER BY object_id ASC, object_name ASC
