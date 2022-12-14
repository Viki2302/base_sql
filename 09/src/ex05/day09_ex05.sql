drop function fnc_persons_female();
drop function fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(IN pgender varchar default 'female')
RETURNS TABLE(id bigint,
  name varchar,
  age integer,
  gender varchar,
  address varchar) AS $emp_audit$
 SELECT * FROM person where gender = pgender;
$emp_audit$
LANGUAGE sql;

select * from fnc_persons(pgender := 'male');
select * from fnc_persons();

-- CREATE OR REPLACE FUNCTION fnc_persons(IN pgender varchar default 'female')
-- RETURNS TABLE(name varchar) AS $emp_audit$
--  SELECT name FROM person where gender = pgender;
-- $emp_audit$
-- LANGUAGE sql;
--
-- select * from fnc_persons(pgender := 'male');
-- select * from fnc_persons();