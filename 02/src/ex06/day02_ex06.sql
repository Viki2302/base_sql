select pizza_name, pizzeria.name as pizzeria_name
from menu
join person_order po on menu.id = po.menu_id
join pizzeria on pizzeria.id = menu.pizzeria_id
where po.person_id = 1 or po.person_id = 4
order by pizza_name, pizzeria_name;