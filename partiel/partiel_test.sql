
CREATE OR REPLACE PROCEDURE corrsexe(nomtablee in varchar,nomcoll in varchar)
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
	requete:='select REGEXPR from DDRE where CATEGORY=''PEOPLE'' and SUBCATEGORY=''MEN'' ';
	execute immediate requete into requete_stock; 
	requete:='select REGEXPR from DDRE where CATEGORY=''PEOPLE'' and SUBCATEGORY=''WOMEN'' ';
	execute immediate requete into requete_stock2;
	if(REGEXP_LIKE(upper(maVariable), '^(MR|M|MALE|MÂLE|MEN|HOMME|H|MONSIEUR)$')) then
	
		requete:= 'update '||nomtable||' set '||nomcol||'=''M'' where '||nomcol||'='''||maVariable||''' ';
		execute immediate requete ;
	elsif(REGEXP_LIKE(upper(maVariable),'^(MLLE|MME|F|FEMALE|FEMELLE|WOMEN|FEMME|MADAME|MADEMOISELLE)$')) then
		requete:= 'update ' ||nomtable||' set '||nomcol||'=''F'' where '||nomcol||'='''||maVariable||''' ';
		execute immediate requete ;
	else 
		requete:= 'update '||nomtable||' set '||nomcol||'='''' where '||nomcol||'='''||maVariable||''' ';
		execute immediate requete ;
	end if;
      	EXIT WHEN vCursor%NOTFOUND;
	END LOOP;
	CLOSE vCursor;
END;
/

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
	requete:='select REGEXPR from DDRE where CATEGORY=''LENGHT'' and SUBCATEGORY=''MEN'' ';
	execute immediate requete into requete_stock; 
	requete:='select REGEXPR from DDRE where CATEGORY=''PEOPLE'' and SUBCATEGORY=''WOMEN'' ';
	execute immediate requete into requete_stock2;
	if(REGEXP_LIKE(upper(maVariable), '^(MR|M|MALE|MÂLE|MEN|HOMME|H|MONSIEUR)$')) then
	
		requete:= 'update '||nomtable||' set '||nomcol||'=''M'' where '||nomcol||'='''||maVariable||''' ';
		execute immediate requete ;
	elsif(REGEXP_LIKE(upper(maVariable),'^(MLLE|MME|F|FEMALE|FEMELLE|WOMEN|FEMME|MADAME|MADEMOISELLE)$')) then
		requete:= 'update ' ||nomtable||' set '||nomcol||'=''F'' where '||nomcol||'='''||maVariable||''' ';
		execute immediate requete ;
	else 
		requete:= 'update '||nomtable||' set '||nomcol||'='''' where '||nomcol||'='''||maVariable||''' ';
		execute immediate requete ;
	end if;
      	EXIT WHEN vCursor%NOTFOUND;
	END LOOP;
	CLOSE vCursor;
END;
/
