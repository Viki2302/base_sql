CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE(id bigint,
  name varchar,
  age integer,
  gender varchar,
  address varchar) AS $emp_audit$
 SELECT * FROM person where gender = 'male';
$emp_audit$
LANGUAGE sql;

CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE(id bigint,
  name varchar,
  age integer,
  gender varchar,
  address varchar) AS $emp_audit$
 SELECT * FROM person where gender = 'female';
$emp_audit$
LANGUAGE sql;

select * from fnc_persons_male();
select * from fnc_persons_female();

-- CREATE OR REPLACE FUNCTION fnc_persons_male()
-- RETURNS TABLE(name varchar) AS $emp_audit$
--  SELECT name FROM person where gender = 'male';
-- $emp_audit$
-- LANGUAGE sql;
--
-- CREATE OR REPLACE FUNCTION fnc_persons_female()
-- RETURNS TABLE(name varchar) AS $emp_audit$
--  SELECT name FROM person where gender = 'female';
-- $emp_audit$
-- LANGUAGE sql;
--
-- select * from fnc_persons_male();
-- select * from fnc_persons_female();
