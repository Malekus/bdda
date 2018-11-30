drop table  DS2_mesures;

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
CREATE OR REPLACE PROCEDURE test1(nomtable in varchar) IS
	counteur varchar(1000):= '';

	counteur2 varchar(1000):= '';
	counteur3 varchar(1000):= '';
	nbligne number(10);
	nbeltnul number(10);
	nbeltparcol number(10);
	nbminchainechar number(10);
	nbmaxchainechar number(10);
	nbavgchainechar number(10);
	typee varchar(50);
	CURSOR curseur IS
	SELECT column_name FROM user_tab_columns WHERE table_name = nomtable;
BEGIN
	counteur2:='SELECT column_name FROM user_tab_columns WHERE table_name =''|| nomtable ||'' ';
		execute immediate counteur2;
	DBMS_OUTPUT.PUT_LINE('SELECT column_name FROM user_tab_columns WHERE table_name = '''||nomtable||''' ');
	DBMS_OUTPUT.PUT_LINE('nom table:' ||nomtable);
	
	counteur:='create table '||nomtable||'_mesures (nom_colonne varchar(10), nblignecol number(10), nbeltnulcol number(10),nbminchainechar number(10),nbmaxchainechar number(10),nbavgchainechar number(10),typecol varchar(50))';
		execute immediate counteur;
	FOR i IN curseur LOOP
		DBMS_OUTPUT.PUT_LINE( i.column_name || ''||nomtable||'');
		typee := Get_type(i.column_name,''||nomtable||'');
		
		nbligne := fun_numLigne(i.column_name,''||nomtable||'');
		nbeltnul := Fun_nbEltNull(i.column_name,''||nomtable||'');
		nbeltparcol := Fun_nbEltNull(i.column_name,''||nomtable||'');
		nbminchainechar := Fun_min_chaine_car(i.column_name,''||nomtable||'');
		nbmaxchainechar := Fun_max_chaine_car(i.column_name,''||nomtable||'');
		nbavgchainechar := Fun_avg_chaine_car(i.column_name,''||nomtable||'');
		
		DBMS_OUTPUT.PUT_LINE('INSERT INTO '||nomtable||'_mesures values ('''||i.column_name||''','||nbligne||','||nbeltnul||','||nbminchainechar||' ,'||nbmaxchainechar||','||nbavgchainechar||','''||typee||''')');
		counteur3:='INSERT INTO '||nomtable||'_mesures values ('''||i.column_name||''','||nbligne||','||nbeltnul||','||nbminchainechar||' ,'||nbmaxchainechar||','||nbavgchainechar||','''||typee||''')';
		execute immediate counteur3;



	END LOOP;
END;
/
