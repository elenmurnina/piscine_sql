CREATE TABLE person_audit (
	created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	type_event VARCHAR(1) NOT NULL DEFAULT 'I',
	row_id BIGINT NOT NULL,
	name VARCHAR NOT NULL,
	age INTEGER NOT NULL DEFAULT 10,
	gender VARCHAR DEFAULT 'female' NOT NULL,
	address VARCHAR,

	CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'D', 'U')),
	CONSTRAINT ch_gender CHECK (gender IN ('female','male'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $trg_person_insert_audit$
	BEGIN
        IF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit SELECT now(), 'I',  NEW.*;
        END IF;
        RETURN NULL;
    END;
$trg_person_insert_audit$
LANGUAGE PLPGSQL;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
	FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();
	 
INSERT INTO person
	VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
