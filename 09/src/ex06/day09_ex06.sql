CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson varchar default 'Dmitriy',
IN pprice int default 500, IN pdate date default '2022-01-08'::date)

RETURNS TABLE(pizzeria varchar) AS $emp_audit$
begin
    return query (SELECT distinct pizzeria.name FROM pizzeria
    JOIN menu m on pizzeria.id = m.pizzeria_id
    JOIN person_order po on m.id = po.menu_id
    JOIN person p on p.id = po.person_id
    JOIN person_visits pv on p.id = pv.person_id
    where p.name = pperson and m.price < pprice and po.order_date = pdate and pv.visit_date = pdate);
end;
$emp_audit$
LANGUAGE plpgsql;

select * from fnc_person_visits_and_eats_on_date(pprice := 800);
select * from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
-- select * from fnc_person_visits_and_eats_on_date(pprice := 851,pdate := '2022-01-09');
