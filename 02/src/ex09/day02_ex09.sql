select person.name from
    (select * from person where person.gender = 'female') as person
join person_order on person_order.person_id = person.id
join menu on menu.id = person_order.menu_id
where (menu.pizza_name in ('pepperoni pizza', 'cheese pizza'))
group by person.name
having count (*) > 1
order by name asc;