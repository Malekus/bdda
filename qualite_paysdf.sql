CREATE OR REPLACE PROCEDURE TESTDF(col1 in varchar,col2 in varchar,tabledf in varchar)
AS
BEGIN
	REM VISUALISATION DES DONNEES
	SELECT * FROM tabledf;
/*



	-- Algorithme pour vérifier la DF entre 2 colonnes :
	CREATE OR REPLACE VIEW LISTAVERIFIER_VP (col1, col2) AS
	SELECT DISTINCT * FROM tabledf;

	SELECT * FROM LISTAVERIFIER_VP ;

	CREATE OR REPLACE VIEW VERIFDF_VP (col1, NBR) AS
	SELECT col1, COUNT(*) AS NBR FROM LISTAVERIFIER_VP GROUP BY col1 ORDER BY col1;
	SELECT * FROM VERIFDF_VP ;

	SELECT MAX(NBR) AS MAXOCCUR FROM VERIFDF_VP;
	-- REM Si MAXOCCUR > 1 Alors la DF n'est pas vérifiée !
*/

END;
/

CREATE OR REPLACE PROCEDURE TESTDF(colonne1 in varchar,colonne2 in varchar,tabledf in varchar)
AS
	stock varchar(1000) := '';
	homogen varchar(1000):= '';
	homogen2 varchar(1000):= '';
	view1 varchar(1000):= '';

BEGIN

	
	homogen:='UPDATE ' || tabledf || ' SET ' || colonne1 ||'  = upper( ' || colonne1 || ' )';
	execute immediate homogen;
	homogen2:='UPDATE ' || tabledf || ' SET '|| colonne2 ||'  = lower( ' || colonne2 || ' )';
	execute immediate homogen2;
	
	view1:='CREATE OR REPLACE VIEW LISTAVERIFIER_VP ('||col1||', '||col2||') AS
	SELECT DISTINCT * FROM '||tabledf;

	
END;
/

for toto in (SELECT colonne1 FROM tabledf)LOOP
	dbms_output.put_line(toto.colonne1);
END LOOP;


--correction ville
create or replace view test(f,s,d) as select first, second, UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second)  as distance from (select col1 as first from vilpaysdf group by col1 order by count(*) desc),(select col1 as second from vilpaysdf group by col1 order by count(*) desc) where first != second and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second) > 60 and (select count(*) from vilpaysdf where col1=first)>=(select count(*) from vilpaysdf where col1=second);

update vilpaysdf set col1=(select f from test where s=col1 and ROWNUM <=1) where col1=ANY(select s from test);

select col1,count(*) from vilpaysdf group by col1 order by col1;

--- Nous avons choisi de ne pas faire de choix lorsque 2 pays se ressemblant ont le meme nombre d'entrÃ©es car on ne peut pas faire un choix juste parmis ces 2 pays. Nous attendrons donc d'autres insertion pour relancer ce script  



---correction pays
create or replace view test(f,s,d,c) as select first, second, UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second)  as distance,c from (select col2 as first,count(*) as c from vilpaysdf group by col2 order by count(*) desc),(select col2 as second from vilpaysdf group by col2 order by count(*) desc) where first != second and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second) >= 50 and (SOUNDEX(first)=SOUNDEX(second))and (select count(*) from vilpaysdf where col2=first)>=(select count(*) from vilpaysdf where col2=second) order by c desc;

update vilpaysdf set col2=(select f from test where s=col2 and ROWNUM <=1) where col2=ANY(select s from test);

select col2,count(*) from vilpaysdf group by col2 order by col2;




--- correction pays grace au ville

create or replace view test(c1,c2,conc,count) as select col1,col2,concat(col1,col2),count(*) as conc from vilpaysdf group by col1,col2,concat(col1,col2) order by conc desc;

update vilpaysdf set col2=(select c2 from test where c1=col1 and ROWNUM <=1) ;


