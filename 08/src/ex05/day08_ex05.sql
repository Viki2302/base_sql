-- 1 ses
begin transaction;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- 2 ses
begin transaction;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--
-- 1 ses
select sum(rating) from pizzeria;
-- 2 ses
update pizzeria set rating = 1.0 where name = 'Pizza Hut';
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