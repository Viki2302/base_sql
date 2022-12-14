select order_date as order_date, format('%s (age:%s)', name, age) as person_information from person
natural join (select order_date, person_id as id from person_order) as pc
order by order_date asc, person_information;