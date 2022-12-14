(select p.name, count(p.name) as count, 'order' as action_type
from person_order
inner join menu m on m.id = person_order.menu_id
inner join pizzeria p on p.id = m.pizzeria_id
group by p.name, action_type
order by count desc, p.name
limit 3)
union all
(select p.name, count(person_id) as count, 'visit' as action_type
from person_visits
inner join pizzeria p on p.id = person_visits.pizzeria_id
group by p.name
order by count desc limit 3);
