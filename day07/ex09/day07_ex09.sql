WITH f_a AS (
SELECT
	person.address,
	round(MAX(person.age) - CAST(MIN(person.age) AS DEC(6, 2)) / MAX(person.age), 2) AS formula,
	round(AVG(person.age), 2) AS average
FROM person
GROUP BY person.address
ORDER BY person.address ASC)

SELECT address, formula, average, formula > average AS comparison
FROM f_a
