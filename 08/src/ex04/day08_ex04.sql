-- 1 ses
begin transaction;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- 2 ses
begin transaction;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--
-- 1 ses
select * from pizzeria where name  = 'Pizza Hut';
-- 2 ses
update pizzeria set rating = 3.0 where name = 'Pizza Hut';
-- 2 ses
commit;
-- 1 ses
select * from pizzeria where name  = 'Pizza Hut';
-- 1 ses
commit;
-- 1 ses
select * from pizzeria where name  = 'Pizza Hut';
-- 2 ses
select * from pizzeria where name  = 'Pizza Hut';