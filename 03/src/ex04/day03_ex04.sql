with fem as (select pizzeria.name as pizzeria_name
        from pizzeria
            join menu on pizzeria.id = menu.pizzeria_id
            join person_order on person_order.menu_id = menu.id
            join person on person.id = person_order.person_id
        where person.gender = 'female'),
    man as (select pizzeria.name as pizzeria_name
        from pizzeria
            join menu on pizzeria.id = menu.pizzeria_id
            join person_order on person_order.menu_id = menu.id
            join person on person.id = person_order.person_id
        where person.gender = 'male'),
     on_fem as (select * from fem except select * from man),
     on_man as (select * from man except select * from fem)
select *
from on_fem
union
select *
from on_man
order by pizzeria_name;