create sequence seq_person_discounts
    start with 1
    increment by 1;
select setval('seq_person_discounts', max(id)) from person_discounts;
alter table person_discounts
alter column id SET default nextval('seq_person_discounts');
