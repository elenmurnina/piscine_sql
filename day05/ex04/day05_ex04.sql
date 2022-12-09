CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET enable_seqscan = OFF;

-- INSERT INTO
-- 	menu
-- VALUES
-- 	(55, 1, 'sausage pizza', 1202);

EXPLAIN ANALYZE
SELECT
	pizza_name,
	pizzeria.name
FROM
	menu
JOIN
	pizzeria ON pizzeria.id = menu.pizzeria_id;
