CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop integer default 10)
RETURNS SETOF integer LANGUAGE SQL AS $$
    WITH RECURSIVE t(a,b) AS (
            VALUES(0,1)
        UNION ALL
            SELECT b, a + b as a from t
            WHERE b < pstop
       )
    SELECT a FROM t;
$$;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();