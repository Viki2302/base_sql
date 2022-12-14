-- 1 ses
begin transaction;
-- 2 ses
begin transaction;
--
-- 1 ses
update pizzeria set rating = 1.0 where name = 'Dominos';
-- 2 ses
update pizzeria set rating = 2.0 where name = 'Pizza Hut';
-- 1 ses
update pizzeria set rating = 1.0 where name = 'Pizza Hut';
-- 2 ses
update pizzeria set rating = 2.0 where name = 'Dominos';
-- 1 ses
commit;
-- 2 ses
commit;