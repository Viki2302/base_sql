with foo as (select cast(week as date) from generate_series('2022-01-01', '2022-01-10','1 day'::interval ) as week)
select week
from foo 
left join (select * from person_visits where person_visits.person_id = 1 or person_visits.person_id = 2) as days
on days.visit_date = week
where days.visit_date is null
order by week asc;