create index idx_person_name
on person(upper(name));

set enable_seqscan = off;
set enable_bitmapscan = off;
explain analyze select name from person where upper(name) is not null;