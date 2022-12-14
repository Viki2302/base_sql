select person.name from
    (select * from person where (person.address = 'Moscow' or person.address = 'Samara') and person.gender = 'male') as person
join person_order on person_order.person_id = person.id
join menu on menu.id = person_order.menu_id
where (menu.pizza_name = 'pepperoni pizza' or menu.pizza_name = 'mushroom pizza')
order by name desc;