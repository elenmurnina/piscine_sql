INSERT INTO person_order VALUES
	((SELECT MAX(id) FROM person_order) + 1,
	 (SELECT person.id FROM person WHERE person.name = 'Denis'),
	 (SELECT menu.id FROM menu WHERE pizza_name = 'sicilian pizza'),
	 '2022-02-24');
INSERT INTO person_order VALUES
	((SELECT MAX(id) FROM person_order) + 1,
	 (SELECT person.id FROM person WHERE person.name = 'Irina'),
	 (SELECT menu.id FROM menu WHERE pizza_name = 'sicilian pizza'),
	 '2022-02-24');
