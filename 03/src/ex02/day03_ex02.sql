with foo as ( select menu.id as menu_id
    from menu
    except
    select person_order.menu_id
    from person_order
    order by menu_id )

select menu.pizza_name, menu.price, pizzeria.name as pizzeria_name
from menu
         join pizzeria on pizzeria.id = menu.pizzeria_id
         join foo on foo.menu_id = menu.id
order by menu.pizza_name, menu.price;