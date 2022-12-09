DROP TABLE IF EXISTS graph_edges;

CREATE TABLE IF NOT EXISTS graph_edges (
	point1 VARCHAR,
	point2 VARCHAR,
	cost INTEGER
);

INSERT INTO graph_edges (point1, point2, cost)
VALUES
('a', 'b', 10),
('b', 'a', 10),
('a', 'c', 15),
('c', 'a', 15),
('a', 'd', 20),
('d', 'a', 20),
('b', 'd', 25),
('d', 'b', 25),
('b', 'c', 35),
('c', 'b', 35),
('c', 'd', 30),
('d', 'c', 30);

SELECT res.total_cost, res.tour FROM (WITH RECURSIVE track_builder AS
(
	SELECT point1 AS tour_point, point1, point2, cost, cost as sum
		FROM graph_edges
		WHERE point1 = 'a'

	UNION ALL
	SELECT
		parent.tour_point || ',' || child.point1 AS tour_point,
		child.point1,
		child.point2,
		child.cost,
		parent.sum + child.cost AS sum
	FROM graph_edges as child
		JOIN track_builder as parent ON child.point1 = parent.point2
		WHERE tour_point NOT LIKE '%' || child.point1 || '%'
)
SELECT sum as total_cost, '{' || tour_point || ',' || point2 || '}' as tour
FROM track_builder
WHERE length(tour_point) = 7
AND sum = (SELECT min(sum) FROM track_builder WHERE length(tour_point) = 7)
ORDER BY total_cost, tour) AS res(total_cost, tour)
WHERE tour lIKE '%a}';
