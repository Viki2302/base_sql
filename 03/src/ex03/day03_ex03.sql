with fem as (select pizzeria.name as pizzeria_name
        from pizzeria
            join person_visits on person_visits.pizzeria_id = pizzeria.id
            join person on person.id = person_visits.person_id
        where person.gender = 'female'),
    man as (select pizzeria.name as pizzeria_name
        from pizzeria
            join person_visits on person_visits.pizzeria_id = pizzeria.id
            join person on person.id = person_visits.person_id
        where person.gender = 'male'),
     on_fem as (select * from fem except all select * from man),
     on_man as (select * from man except all select * from fem)
select *
from on_fem
union all
select *
from on_man
order by pizzeria_name;