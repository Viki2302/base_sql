-- 1 ses
begin transaction;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- 2 ses
begin transaction;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--
-- 1 ses
select sum(rating) from pizzeria;
-- 2 ses
update pizzeria set rating = 5.0 where name = 'Pizza Hut';
-- 2 ses
commit;
-- 1 ses
select sum(rating) from pizzeria;
-- 1 ses
commit;
-- 1 ses
select sum(rating) from pizzeria;
-- 2 ses
select sum(rating) from pizzeria;