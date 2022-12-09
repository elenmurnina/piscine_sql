CREATE UNIQUE INDEX idx_person_order_order_date ON person_order (person_id, menu_id)
	WHERE order_date = '2022-01-01';
	
-- INSERT INTO person_order VALUES (118,4, 18, '2022-01-08');
-- INSERT INTO person_order VALUES (119,4, 18, '2022-01-08');
-- DELETE FROM person_order WHERE id = 118 OR id = 119;

-- INSERT INTO person_order VALUES (113,2, 8, '2022-01-01');

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT
	person_id, menu_id
FROM
	person_order
WHERE
	order_date = '2022-01-01';
