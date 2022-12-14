with m as (
    select * from menu
    join pizzeria pi on menu.pizzeria_id = pi.id)
select menu.pizza_name, p.name as pizzeria_name_1, m.name as pizzeria_name_2, menu.price
from menu
join pizzeria p on menu.pizzeria_id = p.id
join m on menu.pizza_name = m.pizza_name
where menu.pizza_name = m.pizza_name and menu.price = m.price and p.name < m.name
order by pizza_name;