create view v_price_with_discount as
select person.name, m.pizza_name, m.price , round(m.price - price*0.1) as discount_price  from person
join person_order po on person.id = po.person_id
join menu m on m.id = po.menu_id
order by person.name, m.pizza_name;