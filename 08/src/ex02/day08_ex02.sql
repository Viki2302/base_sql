-- 1 ses
begin transaction;
set transaction isolation level repeatable read;
-- 2 ses
begin transaction;
set transaction isolation level repeatable read;
--
-- 1 ses
select * from pizzeria where name  = 'Pizza Hut';
-- 2 ses
select * from pizzeria where name  = 'Pizza Hut';
-- 1 ses
update pizzeria set rating = 4 where name = 'Pizza Hut';
-- 2 ses
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
-- 1 ses
commit;
-- 2 ses
commit;
-- 1 ses
select * from pizzeria where name  = 'Pizza Hut';
-- 2 ses
select * from pizzeria where name  = 'Pizza Hut';