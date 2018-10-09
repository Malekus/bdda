create or replace view test(f,s,d) as select first, second, UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second)  as distance from (select col1 as first from vilpays group by col1 order by col1),(select col1 as second from vilpays group by col1 order by col1) where first != second and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second) > 60 and (select count(*) from vilpays where col1=first)>=(select count(*) from vilpays where col1=second);

update vilpays set col1=(select f from test where s=col1) where col1=ANY(select s from test);

select col1,count(*) from vilpays group by col1 order by col1;
