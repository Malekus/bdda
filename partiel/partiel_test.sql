


CREATE OR REPLACE PROCEDURE corrtaille(nomtablee in varchar,nomcoll in varchar)
is
	TYPE curType IS REF CURSOR;
	vCursor curType;
	nomtable varchar(1000):= UPPER(nomtablee);
	nomcol varchar(1000):= UPPER(nomcoll);  maVariable VARCHAR(255);
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	requete_stock2 VARCHAR(255);
  
BEGIN
	requete := 'SELECT ' || nomcol || ' FROM ' || nomtable;
	OPEN vCursor FOR requete;
	LOOP
	FETCH vCursor INTO maVariable;
	DBMS_OUTPUT.PUT_LINE(maVariable);
	requete:='select REGEXPR from DDRE where CATEGORY=''LENGTH'' and SUBCATEGORY=''LENGTH-M'' ';
	execute immediate requete into requete_stock; 
	
	if(REGEXP_LIKE(maVariable, requete_stock)) then
			DBMS_OUTPUT.PUT_LINE('c''est un nombre dans la regex');
		
	else 
		requete:= 'update '||nomtable||' set '||nomcol||'='''' where '||nomcol||'='''||maVariable||''' ';
		--execute immediate requete ;
			DBMS_OUTPUT.PUT_LINE('ce n''est pas un nombre dans la regex');
	end if;
      	EXIT WHEN vCursor%NOTFOUND;
	END LOOP;
	CLOSE vCursor;
END;
/

--CREATE TABLE DDCAT( TYPE VARCHAR2(100), FCT varchar2(100));
--INSERT INTO DDCAT VALUES ('SEXE','CORRSEXE');

CREATE OR REPLACE FUNCTION corrtaille(taille in VARCHAR)
  return VARCHAR
as
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	requete_stock2 VARCHAR(255);
	requete_stock3 VARCHAR(255);
BEGIN
	requete:='select REGEXPR from DDRE where CATEGORY=''SIZE'' and SUBCATEGORY=''SIZE-M'' ';
	execute immediate requete into requete_stock; 
	requete:='select REGEXPR from DDRE where CATEGORY=''SIZE'' and SUBCATEGORY=''SIZE-CM'' ';
	execute immediate requete into requete_stock2; 
	requete:='select REGEXPR from DDRE where CATEGORY=''SIZE'' and SUBCATEGORY=''SIZE-MM'' ';
	execute immediate requete into requete_stock3; 
	IF(REGEXP_LIKE(upper(sexe),requete_stock)) THEN
		return 'M';
	ELSIF(REGEXP_LIKE(upper(sexe),requete_stock2)) then
		return 'F';
	else
		return '';
  END IF;
END;
/

CREATE OR REPLACE FUNCTION corrsexe(sexe in VARCHAR)
  return VARCHAR
as
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	requete_stock2 VARCHAR(255);
BEGIN
	requete:='select REGEXPR from DDRE where CATEGORY=''PEOPLE'' and SUBCATEGORY=''MEN'' ';
	execute immediate requete into requete_stock; 
	requete:='select REGEXPR from DDRE where CATEGORY=''PEOPLE'' and SUBCATEGORY=''WOMEN'' ';
	execute immediate requete into requete_stock2;
	IF(REGEXP_LIKE(upper(sexe),requete_stock)) THEN
		return 'M';
	ELSIF(REGEXP_LIKE(upper(sexe),requete_stock2)) then
		return 'F';
	else
		return '';
  END IF;
END;
/
