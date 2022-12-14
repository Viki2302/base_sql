with tmp as (select name, count(pizzeria_id) as count_of_visits  from person
    join person_visits pv on person.id = pv.person_id
    group by name)
select tmp.name, tmp.count_of_visits from person
join tmp on person.name = tmp.name and tmp.count_of_visits > 3;