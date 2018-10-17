/*mise en majuscule de la table */
update tabcli set col1=UPPER(col1);
update tabcli set col2=UPPER(col2);
update tabcli set col3=UPPER(col3);
update tabcli set col4=UPPER(col4);
update tabcli set col5=UPPER(col5);
/*mise en majuscule de la table */
/* correction colonne 2 partielle */
create or replace view test(f,s,d,c) as select first, second, UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second)  as distance, c from (select col2 as first,count(*) as c from tabcli group by col2 order by count(*) desc),(select col2 as second from tabcli group by col2 order by count(*) desc) where first != second and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second) >= 50 and (select count(*) from TABCLI where col2=first)>=(select count(*) from TABCLI where col2=second) order by c desc;

update TABCLI set col2=(select f from test where s=col2 and ROWNUM <=1) where col2=ANY(select s from test);
update TABCLI set col2='MADEMOISELLE' where col2='MLLE';
update TABCLI set col2='MONSIEUR' where col2='MR';
update TABCLI set col2='MADAME' where col2='MME';
/* correction colonne 2 partielle */


/* correction colonne 1 */
create or replace view test(c1,c2,c3,c4,c5,count,conc,conc4,conc3,conc4b) as select col1,col2,col3,col4,col5,count(*),concat(concat(concat(col1,col2),concat(col3,col4)),col5) as conc , concat(concat(col2,col3),concat(col4,col5)) as conc4, concat(concat(col2,col4),col5) as conc3, concat(concat(col2,col3),col5) as conc4b from tabcli group by col1,col2,col3,col4,col5 order by count(*) desc;

update tabcli set col1=(select c1 from test where (concat(concat(col2,col3),concat(col4,col5))=conc4 or (concat(concat(col2,col4),col5)=conc3 and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(col3, c3)>=50) or(concat(concat(col2,col3),col5)=conc4b and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(col4, c4)>=50)) and ROWNUM <=1) ;
/* correction colonne 1 */


/* correction colonne 2 */
create or replace view test(c1,c2,c3,c4,c5,count,conc,conc4,conc3,conc4b) as select col1,col2,col3,col4,col5,count(*),concat(concat(concat(col1,col2),concat(col3,col4)),col5) as conc , concat(concat(col1,col3),concat(col4,col5)) as conc4, concat(concat(col1,col4),col5) as conc3, concat(concat(col1,col3),col5) as conc4b from tabcli group by col1,col2,col3,col4,col5 order by count(*) desc;

update tabcli set col2=(select c2 from test where (concat(concat(col1,col3),concat(col4,col5))=conc4 or (concat(concat(col1,col4),col5)=conc3 and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(col3, c3)>=50) or(concat(concat(col1,col3),col5)=conc4b and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(col4, c4)>=50)) and ROWNUM <=1) ;
/* correction colonne 2 */


/* correction colonne 3 */
create or replace view test(c1,c2,c3,c4,c5,count,conc,conc4,conc4b) as select col1,col2,col3,col4,col5,count(*),concat(concat(concat(col1,col2),concat(col3,col4)),col5) as conc , concat(concat(col1,col2),concat(col4,col5)) as conc4, concat(concat(col1,col2),col5) as conc4b from tabcli group by col1,col2,col3,col4,col5 order by count(*) desc;

update tabcli set col3=(select c3 from test where (concat(concat(col1,col2),concat(col4,col5))=conc4 or (concat(concat(col1,col2),col5)=conc4b and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(col4, c4)>=50)) and ROWNUM <=1) ;
/* correction colonne 3 */


/* correction colonne 4 */
create or replace view test(c1,c2,c3,c4,c5,count,conc,conc4,conc3) as select col1,col2,col3,col4,col5,count(*),concat(concat(concat(col1,col2),concat(col3,col4)),col5) as conc , concat(concat(col1,col2),concat(col3,col5)) as conc4, concat(concat(col1,col2),col5) as conc3 from tabcli group by col1,col2,col3,col4,col5 order by count(*) desc;

update tabcli set col4=(select c4 from test where (concat(concat(col1,col2),concat(col3,col5))=conc4 or (concat(concat(col1,col2),col5)=conc3 and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(col3, c3)>=50)) and ROWNUM <=1) ;
/* correction colonne 4 */


/* correction colonne 5 */
create or replace view test(c1,c2,c3,c4,c5,count,conc,conc4,conc3,conc4b) as select col1,col2,col3,col4,col5,count(*),concat(concat(concat(col1,col2),concat(col3,col4)),col5) as conc , concat(concat(col1,col2),concat(col3,col4)) as conc4, concat(concat(col1,col2),col4) as conc3, concat(concat(col1,col2),col3) as conc4b from tabcli group by col1,col2,col3,col4,col5 order by count(*) desc;

update tabcli set col5=(select c5 from test where (concat(concat(col1,col2),concat(col3,col4))=conc4 or (concat(concat(col1,col2),col4)=conc3 and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(col3, c3)>=50) or(concat(concat(col1,col2),col3)=conc4b and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(col4, c4)>=50)) and ROWNUM <=1) ;
/* correction colonne 5 */


/* suppressions des lignes doublÃ©s*/
DELETE FROM TABCLI
                WHERE ROWID IN (
                            SELECT ROWID
                            FROM   ( SELECT ROWID,COL1, ROW_NUMBER ( ) OVER ( PARTITION BY (col1 || col2 || col3 || col4 || col5) ORDER BY col1 || col2 ) num_ligne
                                    FROM   TABCLI ) t2
                            WHERE  num_ligne >1 );
/* suppressions des lignes doublÃ©s*/
