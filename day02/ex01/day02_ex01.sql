SELECT gs AS missing_date
FROM
	(SELECT gs::date
	 FROM generate_series('2022-01-01', '2022-01-10', '1 day'::interval) AS gs) ex01_1
	 LEFT JOIN (SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) ex01_2
	 ON gs = visit_date
WHERE visit_date IS NULL
