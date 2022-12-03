CREATE VIEW v_generated_dates AS
	SELECT gs AS generated_date
	FROM
	(SELECT gs::date FROM generate_series('2022-01-01', '2022-01-31', '1 day'::interval) AS gs) dates
	ORDER BY generated_date ASC;
