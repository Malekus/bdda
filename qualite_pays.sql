--correction ville
create or replace view test(f,s,d) as select first, second, UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second)  as distance from (select col1 as first from vilpays group by col1 order by count(*) desc),(select col1 as second from vilpays group by col1 order by count(*) desc) where first != second and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second) > 60 and (select count(*) from vilpays where col1=first)>=(select count(*) from vilpays where col1=second);

update vilpays set col1=(select f from test where s=col1 and ROWNUM <=1) where col1=ANY(select s from test);

select col1,count(*) from vilpays group by col1 order by col1;

--- Nous avons choisi de ne pas faire de choix lorsque 2 pays se ressemblant ont le meme nombre d'entrÃ©es car on ne peut pas faire un choix juste parmis ces 2 pays. Nous attendrons donc d'autres insertion pour relancer ce script  



---correction pays
create or replace view test(f,s,d,c) as select first, second, UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second)  as distance,c from (select col2 as first,count(*) as c from vilpays group by col2 order by count(*) desc),(select col2 as second from vilpays group by col2 order by count(*) desc) where first != second and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second) >= 50 and (SOUNDEX(first)=SOUNDEX(second))and (select count(*) from vilpays where col2=first)>=(select count(*) from vilpays where col2=second) order by c desc;

update vilpays set col2=(select f from test where s=col2 and ROWNUM <=1) where col2=ANY(select s from test);

select col2,count(*) from vilpays group by col2 order by col2;




--- correction pays grace au ville

create or replace view test(c1,c2,conc,count) as select col1,col2,concat(col1,col2),count(*) as conc from vilpays group by col1,col2,concat(col1,col2) order by conc desc;

update vilpays set col2=(select c2 from test where c1=col1 and ROWNUM <=1) ;
