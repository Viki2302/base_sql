select menu.pizza_name as pizza_name, menu.price as price, pizzeria.name as pizzeria_name, person_visits.visit_date as visit_date from
    (select * from person where person.name = 'Kate') as person
join person_visits on person_visits.person_id = person.id
join pizzeria on pizzeria.id = person_visits.pizzeria_id
join menu on pizzeria.id = menu.pizzeria_id
where (menu.price >= 800 and menu.price <= 1000)
order by pizza_name, price, pizzeria_name;