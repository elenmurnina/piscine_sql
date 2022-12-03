WITH
	female_pizzeria_ids (pizzeria_id) AS
		(SELECT pizzeria_id FROM person_visits WHERE person_id IN (
			SELECT id FROM person WHERE gender = 'female')),
	male_pizzeria_ids (pizzeria_id) AS
		(SELECT pizzeria_id FROM person_visits WHERE person_id IN (
			SELECT id FROM person WHERE gender = 'male'))
SELECT
	name AS pizzeria_name
FROM
	pizzeria
WHERE
	id IN (SELECT pizzeria_id FROM female_pizzeria_ids
		   EXCEPT ALL
		   SELECT pizzeria_id FROM male_pizzeria_ids)
UNION ALL
SELECT
	name AS pizzeria_name
FROM
	pizzeria
WHERE
	id IN (SELECT pizzeria_id FROM male_pizzeria_ids
		   EXCEPT ALL
		   SELECT pizzeria_id FROM female_pizzeria_ids)
ORDER BY pizzeria_name;
