SELECT a.name AS person_name1, b.name AS person_name2, a.address AS common_address
FROM person a, person b
WHERE a.address = b.address AND a.id > b.id
ORDER BY person_name1 ASC, person_name2 ASC, common_address ASC
