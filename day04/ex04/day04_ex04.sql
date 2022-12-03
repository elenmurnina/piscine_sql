CREATE VIEW visit_r AS
SELECT person_id FROM person_visits WHERE visit_date = '2022-01-02';
CREATE VIEW visit_s AS
SELECT person_id FROM person_visits WHERE visit_date = '2022-01-06';

CREATE VIEW v_symmetric_union AS
SELECT * FROM visit_s
UNION
SELECT * FROM visit_r
ORDER BY person_id ASC;
