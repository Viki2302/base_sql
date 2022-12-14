set enable_seqscan = off;
set enable_bitmapscan = off;
explain analyze select pizza_name, name from menu
left join pizzeria p on menu.pizzeria_id = p.id
where menu.pizzeria_id = p.id is not null;