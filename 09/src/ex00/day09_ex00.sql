create table person_audit
(
    created timestamp with time zone default now() not null,
    type_event char(1) not null default 'I',
    row_id bigint not null,
    name varchar not null,
    age integer not null default 10,
    gender varchar default 'female' not null ,
    address varchar,
    constraint ch_type_event check (type_event = 'I'or type_event = 'U'or type_event = 'D')
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $person_audit$
    BEGIN
        IF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit SELECT  now(), 'I', NEW.*;
            RETURN NEW;
        END IF;
    RETURN NULL;
    END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

insert into person(id, name, age, gender, address) values (10, 'Danil', 22, 'male', 'Irkutsk');