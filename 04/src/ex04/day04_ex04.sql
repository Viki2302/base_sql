create view v_symmetric_union as
with R as (
    select person_id
    from person_visits
    join person on person.id = person_visits.person_id
    where visit_date = '2022-01-02'
    ),
     S as (
    select person_id
    from person_visits
    join person on person.id = person_visits.person_id
    where visit_date = '2022-01-06'
    )
select * from R
union
select * from S
order by person_id;