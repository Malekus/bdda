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
		dbms_output.put_line('la table '|| tabledf ||' n est pas df car il n y a pas de df de '|| colonne1 ||' vers '|| colonne2||'.');
	Else
		dbms_output.put_line('la table '|| tabledf ||' est df car il n y a une df de '|| colonne1 ||' vers '|| colonne2||'.');
	End if;

	
END;
/





SELECT COLUMN_NAME FROM USER_TAB_COLUMNS WHERE TABLE_NAME='VILPAYSDF' and ROWNUM=2;
