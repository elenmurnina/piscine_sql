INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
	(SELECT COUNT(*) FROM person_order) + nid,
	(SELECT id FROM person ORDER BY id OFFSET nid-1 LIMIT 1),
	(SELECT menu.id FROM menu WHERE pizza_name = 'greek pizza'),
	'2022-02-25'
FROM generate_series(1, (SELECT COUNT(*) FROM person)) as nid;
