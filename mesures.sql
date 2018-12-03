drop table  DS2_mesures;
drop table Clients_mesures;
drop table t2_mesures;
CREATE OR REPLACE FUNCTION Get_type (nom_col in varchar, NOM_TAB IN VARCHAR )
   RETURN VARCHAR 
   IS typee VARCHAR(50);
	query varchar(1000);
   BEGIN 
	DBMS_OUTPUT.PUT_LINE('select coltype from col where tname='''||NOM_TAB||''' and cname='''||nom_col||''' ');
	query := 'select coltype from col where tname='''||NOM_TAB||''' and cname='''||nom_col||''' ';
     	execute immediate query into typee  ;
      RETURN(typee); 
    END;
/

CREATE OR REPLACE FUNCTION Fun_min_numerique2 (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS max_num  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select min('||nom_col||') from '||NOM_TAB||' ';
     	execute immediate query into max_num ;
--dbms_output.put_line(query) ;
        RETURN(max_num); 
    END;
/

CREATE OR REPLACE FUNCTION Fun_max_numerique2 (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS max_num  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select max('||nom_col||') from '||NOM_TAB||' ';
     	execute immediate query into max_num ;
--dbms_output.put_line(query) ;
        RETURN(max_num); 
    END;
/

CREATE OR REPLACE FUNCTION Fun_avg_numerique2 (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS max_num  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select avg('||nom_col||') from '||NOM_TAB||' ';
     	execute immediate query into max_num ;
--dbms_output.put_line(query) ;
        RETURN(max_num); 
    END;
/

CREATE OR REPLACE FUNCTION Fun_median_numerique2 (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS max_num  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select median('||nom_col||') from '||NOM_TAB||' ';
     	execute immediate query into max_num ;
--dbms_output.put_line(query) ;
        RETURN(max_num); 
    END;
/


CREATE OR REPLACE FUNCTION Fun_ecartType_numerique2 (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS max_num  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select STDDEV('||nom_col||') from '||NOM_TAB||' ';
     	execute immediate query into max_num ;
--dbms_output.put_line(query) ;
        RETURN(max_num); 
    END;
/

CREATE OR REPLACE FUNCTION Fun_mindate_numerique2 (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN VARCHAR
   IS max_num VARCHAR(10);
	query varchar(500);
   BEGIN 
	query := 'select min('||nom_col||') from '||NOM_TAB||' ';
     	execute immediate query into max_num ;

        RETURN max_num;
    END;
/

CREATE OR REPLACE FUNCTION Fun_maxdate_numerique2 (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN VARCHAR
   IS max_num VARCHAR(10);
	query varchar(500);
   BEGIN 
	query := 'select max('||nom_col||') from '||NOM_TAB||' ';
     	execute immediate query into max_num ;

        RETURN max_num;
    END;
/




CREATE OR REPLACE PROCEDURE test1(nomtablee in varchar) IS
	counteur varchar(1000):= '';
	nomtable varchar(1000):= UPPER(nomtablee);
	counteur2 varchar(1000):= '';
	counteur3 varchar(1000):= '';
	nbligne number(10);
	nbeltnul number(10);
	nbeltparcol number(10);
	nbminchainechar number(10);
	nbmaxchainechar number(10);
	nbavgchainechar number(10);
	nbminnum number(10);
	nbmaxnum number(10);
	nbavgnum number(10);
	nbmednum number(10);
	nbectynum number(10);
	nbmindate varchar(10);
	nbmaxdate varchar(10);
	typee varchar(10);
	testExiste NUMBER;
	CURSOR curseur IS
	SELECT column_name FROM user_tab_columns WHERE table_name = nomtable;
BEGIN
	select count(*) into testExiste from user_tables where table_name = UPPER(nomtable || '_mesures');
	IF testExiste != 0 THEN
		EXECUTE IMMEDIATE 'DROP TABLE ' || nomtable || '_mesures';
	END IF;
	counteur2:='SELECT column_name FROM user_tab_columns WHERE table_name =''|| nomtable ||'' ';
	EXECUTE IMMEDIATE counteur2;

	counteur:='create table '||nomtable||'_mesures (nom_colonne varchar(10), nblignecol number(10), nbeltnulcol number(10),nbminchainechar number(10),nbmaxchainechar number(10),nbavgchainechar number(10),typecol varchar(10),nbminnum number(10),nbmaxnum number(10),nbavgnum number(10),nbmednum number(10),nbectynum number(10),nbmindate varchar(10),nbmaxdate varchar(10))';
	EXECUTE IMMEDIATE counteur;
	
	FOR i IN curseur LOOP
		typee := Get_type(i.column_name,''||nomtable||'');
		nbligne := fun_numLigne(i.column_name,''||nomtable||'');
		nbeltnul := Fun_nbEltNull(i.column_name,''||nomtable||'');

		if typee='VARCHAR2' then 
		nbminchainechar := Fun_min_chaine_car(i.column_name,''||nomtable||'');
		nbmaxchainechar := Fun_max_chaine_car(i.column_name,''||nomtable||'');
		nbavgchainechar := Fun_avg_chaine_car(i.column_name,''||nomtable||'');
		
		counteur3:='INSERT INTO '||nomtable||'_mesures values ('''||i.column_name||''','||nbligne||','||nbeltnul||','||nbminchainechar||' ,'||nbmaxchainechar||','||nbavgchainechar||','''||typee||''',null,null,null,null,null,null,null)';
		elsif typee = 'NUMBER' then 
		nbminnum := Fun_min_numerique2(i.column_name,''||nomtable||'');
		nbmaxnum := Fun_max_numerique2(i.column_name,''||nomtable||'');
		nbavgnum := Fun_avg_numerique2(i.column_name,''||nomtable||'');
		nbmednum := Fun_median_numerique2(i.column_name,''||nomtable||'');
		nbectynum := Fun_ecartType_numerique2(i.column_name,''||nomtable||'');

		
		counteur3:='INSERT INTO '||nomtable||'_mesures values ('''||i.column_name||''','||nbligne||','||nbeltnul||',null ,null,null,'''||typee||''','||nbminnum||','||nbmaxnum||','||nbavgnum||','||nbmednum||','||nbectynum||',null,null)';
		elsif typee ='DATE' then
		nbmindate := Fun_mindate_numerique2(i.column_name,''||nomtable||'');
		nbmaxdate := Fun_maxdate_numerique2(i.column_name,''||nomtable||'');
		
		counteur3:='INSERT INTO '||nomtable||'_mesures values ('''||i.column_name||''','||nbligne||','||nbeltnul||',null ,null,null,'''||typee||''',null,null,null,null,null,'''||nbmindate||''','''||nbmaxdate||''')';
		end if;
		execute immediate counteur3;

		DBMS_OUTPUT.PUT_LINE('Nouvelle Table ' || nomtable || '_mesures');

	END LOOP;
END;
/
