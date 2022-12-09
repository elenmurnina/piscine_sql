WITH RECURSIVE track_builder AS
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
AND point2 = 'a'
UNION
SELECT sum as total_cost, '{' || tour_point || ',' || point2 || '}' as tour
FROM track_builder
WHERE length(tour_point) = 7
AND point2 = 'a'
ORDER BY total_cost, tour;
