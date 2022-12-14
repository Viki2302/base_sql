insert into person_discounts (id, person_id, pizzeria_id, discount)
select row_number( ) over ( ) as id,
       p.id as person_id,
       m.pizzeria_id as pizzeria_id,
       case
           when count(piz.id) = 1 then 10.5
           when count(piz.id) = 2 then 22
           else 30
           end
from person p
join person_order po on p.id = po.person_id
join menu m on m.id = po.menu_id
join pizzeria piz on piz.id = m.pizzeria_id
group by p.id, m.pizzeria_id;