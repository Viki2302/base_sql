with and_vis as (
    select pizzeria.name as pizzeria_name
    from pizzeria
    join person_visits on pizzeria.id = person_visits.pizzeria_id
    join person on person.id = person_visits.person_id
    where person.name = 'Andrey'
    ),
     and_ord as (
        select pizzeria.name as pizzeria_name
        from pizzeria
        join menu on pizzeria.id = menu.pizzeria_id
        join person_order on person_order.menu_id = menu.id
        join person on person.id = person_order.person_id
        where person.name = 'Andrey'
     )
select and_vis.pizzeria_name from and_vis
except
select and_ord.pizzeria_name from and_ord
order by pizzeria_name;