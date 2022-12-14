(select pizza_name as object_name from menu)
union
(select pizza_name as object_name from menu)
order by object_name desc;