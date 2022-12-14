select visit_date as order_date, format('%s (age:%s)', name, age) as person_information from person
join person_visits on person.id = person_visits.person_id
order by order_date, person_information;