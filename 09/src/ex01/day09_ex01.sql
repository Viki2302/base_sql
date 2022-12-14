CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
RETURNS TRIGGER AS $person_audit$
    BEGIN
        IF (TG_OP = 'UPDATE') THEN
            INSERT INTO person_audit SELECT  now(), 'U', OLD.*;
            RETURN OLD;
        END IF;
    RETURN NULL;
    END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit
AFTER UPDATE ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_update_audit();

update person set name = 'Bulat' where id = 10;
update person set name = 'Danil' where id = 10;