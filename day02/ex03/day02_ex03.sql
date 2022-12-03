WITH ex03 (missing_date) AS
	(SELECT gs AS missing_date
	FROM (SELECT gs::date
		  FROM generate_series('2022-01-01', '2022-01-10', '1 day'::interval) AS gs) ex03_1)
SELECT missing_date FROM ex03
LEFT JOIN
(SELECT * FROM person_visits WHERE person_id = 1 OR person_id = 2) ex03_2
ON missing_date = visit_date WHERE visit_date IS NULL