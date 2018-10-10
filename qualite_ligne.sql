update tabcli set col2=UPPER(col2);


create or replace view test(f,s,d) as select first, second, UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second)  as distance from (select col2 as first from tabcli group by col2 order by col2),(select col2 as second from tabcli group by col2 order by col2) where first != second and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second) >= 50 and (select count(*) from TABCLI where col2=first)>=(select count(*) from TABCLI where col2=second);

update TABCLI set col2=(select f from test where s=col2) where col2=ANY(select s from test);
update TABCLI set col2='MADEMOISELLE' where col2='MLLE';
update TABCLI set col2='MONSIEUR' where col2='MR';
update TABCLI set col2='MADAME' where col2='MME';

DELETE FROM TABCLI
               WHERE ROWID IN (
                            SELECT ROWID
                            FROM   ( SELECT ROWID,COL1, ROW_NUMBER ( ) OVER ( PARTITION BY (col1 || col2 || col3 || col4) ORDER BY col1 || col2 ) num_ligne
                                    FROM   TABCLI ) t2
                            WHERE  num_ligne >1 );

SELECT ROWID,COL1, ROW_NUMBER ( ) OVER ( PARTITION BY (col1 || col2 || col3 || col4) ORDER BY col1 || col2 ) num_ligne FROM TABCLI;




/*
create or replace view test2() as 


create or replace view test(f,s,d) as select  first, second, UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second)  as distance from (select col4 as first from tabcli group by col4 order by col4),(select  col4 as second from tabcli group by col4 order by col4) where first != second and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second) >= 50 and (select count(*) from TABCLI where col4=first)>=(select count(*) from TABCLI where col4=second) ;


select col4 from tabcli where col4=(select f from test); 


create view test3(col1,col2,col3,col4,count) as 
select col5 from tabcli intersect select col1,col2,col3,col4,count(*) from tabcli group by col1,col2,col3,col4 having count(*)>1 order by col1 ;

select c from tabcli where col1,col2,col3,col4 in test3;

select c from tabcli group by col1,col2,col3,col4;
	select * from tabcli 
		intersect 
	select * from test3;*/

