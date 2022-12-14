with foo as (
    select name, address, id
    from person
)
select p.name as person_name1, foo.name as person_name2, p.address as common_address
from person p
LEFT JOIN foo on p.address = foo.address
WHERE p.id > foo.id;