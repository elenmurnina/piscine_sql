SELECT name
FROM
	(SELECT * FROM v_persons_female
	UNION
	SELECT * FROM v_persons_male) names_persons
ORDER BY name ASC;
