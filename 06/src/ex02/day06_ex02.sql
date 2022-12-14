-- select p.name,
--        m.pizza_name,
--        m.price,
--        m.price - (m.price / 100 * person_discounts.discount) as discount_price,
--        p2.name as pizzeria_name
-- from person_discounts
-- join person p on person_discounts.person_id = p.id
-- join menu m on person_discounts.pizzeria_id = m.pizzeria_id
-- join pizzeria p2 on m.pizzeria_id = p2.id
-- order by 1, 2;

select p.name as name, 
    m.pizza_name, m.price, 
    (m.price - m.price * pd.discount / 100) as discount_price, 
    piz.name as pizzeria_name
from person p
join person_discounts pd on p.id = pd.person_id
join pizzeria piz on pd.pizzeria_id = piz.id
join menu m on piz.id = m.pizzeria_id
join person_order po on m.id = po.menu_id
where p.id = po.person_id
order by p.name, pizza_name