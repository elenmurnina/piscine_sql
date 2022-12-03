INSERT INTO person_visits VALUES
	((SELECT MAX(id) FROM person_visits) + 1,
	 (SELECT person.id FROM person WHERE name = 'Dmitriy'),
	 (SELECT pizzeria.id FROM pizzeria WHERE name = 'DoDo Pizza'),
	 '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
