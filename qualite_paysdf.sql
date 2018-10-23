--Procedure pour tester si il y a df de la premiere colonne vers la deuxieme

CREATE OR REPLACE PROCEDURE TESTDF(colonne1 in varchar,colonne2 in varchar,tabledf in varchar)
AS

	homogen varchar(1000):= '';
	homogen2 varchar(1000):= '';
	view1 varchar(1000) := '';
	view2 varchar(1000) := '';
	max1 varchar(1000) := '';
	max2 integer;
BEGIN
	homogen:='UPDATE ' || tabledf || ' SET ' || colonne1 ||'=UPPER(' || colonne1 || ')';
	execute immediate homogen;
	homogen2:='UPDATE ' || tabledf || ' SET '|| colonne2 ||'=UPPER(' || colonne2 || ' )';
	execute immediate homogen2;
	view1:='CREATE OR REPLACE VIEW LISTAVERIFIER_VP ('||colonne1||', '||colonne2||') AS
	SELECT DISTINCT * FROM '||tabledf||'';
	execute immediate view1;

	view2:='CREATE OR REPLACE VIEW VERIFDF_VP ('||colonne1||', NBR) AS
	SELECT '||colonne1||', COUNT(*) AS NBR FROM LISTAVERIFIER_VP GROUP BY '||colonne1||' ORDER BY '||colonne1||'';
	execute immediate view2;

	max1:='SELECT MAX(NBR) AS MAXOCCUR FROM VERIFDF_VP';
	execute immediate max1 into max2;
	IF max2>1 THEN 
		dbms_output.put_line('Il n y a pas de df de '|| colonne1 ||' vers '|| colonne2||'.');
	Else
		dbms_output.put_line('Il y a une df de '|| colonne1 ||' vers '|| colonne2||'.');
	End if;

	
END;
/

--procedure pour corriger 2 colonne d'une table pour avoir une df de la premiere colonne vers la deuxieme
CREATE OR REPLACE PROCEDURE TESTCORR(colonne1 in varchar,colonne2 in varchar,tabledf in varchar)
AS

	homogen varchar(1000):= '';
	homogen2 varchar(1000):= '';
	view1 varchar(1000) := '';
	upda1 varchar(1000) := '';
	view2 varchar(1000) := '';
	upda2 varchar(1000) := '';
	view3 varchar(1000) := '';
	upda3 varchar(1000) := '';
	
BEGIN
	homogen:='UPDATE ' || tabledf || ' SET ' || colonne1 ||'=UPPER(' || colonne1 || ')';
	execute immediate homogen;
	homogen2:='UPDATE ' || tabledf || ' SET '|| colonne2 ||'=UPPER(' || colonne2 || ' )';
	execute immediate homogen2;


	--correction col1
	view1:='create or replace view test(f,s,d) as select first, second, UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second)  as distance from (select '||colonne1||' as first from ' || tabledf || ' group by '||colonne1||' order by count(*) desc),(select '||colonne1||' as second from ' || tabledf || ' group by '||colonne1||' order by count(*) desc) where first != second and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second) >= 60 and (SOUNDEX(first)=SOUNDEX(second)) and (select count(*) from ' || tabledf || ' where '||colonne1||'=first)>=(select count(*) from ' || tabledf || ' where '||colonne1||'=second)';
	execute immediate view1;

	upda1:='update ' || tabledf || ' set ' || colonne1 ||'=(select f from test where s=' || colonne1 ||' and ROWNUM <=1) where ' || colonne1 ||'=ANY(select s from test)';
	execute immediate upda1;

	--correction col2
	view2:='create or replace view test(f,s,d,c) as select first, second, UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second)  as distance,c from (select ' || colonne2 || ' as first,count(*) as c from ' || tabledf || ' group by ' || colonne2 || ' order by count(*) desc),(select ' || colonne2 || ' as second from ' || tabledf || ' group by ' || colonne2 || ' order by count(*) desc) where first != second and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second) >= 50 and (SOUNDEX(first)=SOUNDEX(second)) and (select count(*) from ' || tabledf || ' where ' || colonne2 || '=first)>=(select count(*) from ' || tabledf || ' where ' || colonne2 || '=second) order by c desc';
	execute immediate view2;

	upda2:='update ' || tabledf || ' set ' || colonne2 || '=(select f from test where s=' || colonne2 || ' and ROWNUM <=1) where ' || colonne2 || '=ANY(select s from test)';
	execute immediate upda2;

	--correction col2 car df
	view3:='create or replace view test(c1,c2,conc,count) as select '||colonne1||',' || colonne2 || ',concat('||colonne1||',' || colonne2 || '),count(*) as conc from ' || tabledf || ' group by '||colonne1||',' || colonne2 || ',concat('||colonne1||',' || colonne2 || ') order by conc desc';
	execute immediate view3;
	
	upda3:='update ' || tabledf || ' set ' || colonne2 || '=(select c2 from test where c1='||colonne1||' and ROWNUM <=1)';
	execute immediate upda3;

	
END;
/





