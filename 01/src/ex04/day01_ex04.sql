(select order_date as action_date, person_id as person_id from person_order where order_date = '2022-01-07')
except all
(select visit_date as action_date, person_id as person_id  from person_visits where visit_date = '2022-01-07');