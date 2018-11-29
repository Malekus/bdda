
Create function EstNumerique(Chaine Varchar2) Return Boolean Is Valeur Number;
Begin
	Valeur := To_Number(Chaine);
	Return True;
Exception
	When Value_Error Then return False;
End;


DROP PROCEDURE test1;

CREATE OR REPLACE PROCEDURE test1(nomtable in varchar) IS
	counteur varchar(1000):= '';
	counteur2 varchar(1000):= '';
	CURSOR curseur IS
	SELECT column_name FROM user_tab_columns WHERE table_name = nomtable;
BEGIN
	counteur2:='SELECT column_name FROM user_tab_columns WHERE table_name =''|| nomtable ||'' ';
		execute immediate counteur2;

	DBMS_OUTPUT.PUT_LINE('Le(s) numero(s) de commande vide(s) sont :');
	counteur:='create table '||nomtable||'_mesures (nom_table varchar(1000),nom_colonne varchar(1000),quali_quanti varchar(30), min varchar(1000) ,max varchar(1000), mediane varchar(1000), moyenne varchar(1000), ecart_type varchar(1000), nbcasenull number(10), nbcasenotnull number(10))';
		execute immediate counteur;
	FOR i IN curseur LOOP
		DBMS_OUTPUT.PUT_LINE('-  ' || i.column_name || ' fin ');
		if not exists (Select nomtable from 
		counteur2:='INSERT INTO '||nomtable||'_mesures values (''||nomtable||'', ''||i.column_name||'', 'qualiiiquantii', 'miiin', 'maaax', 'medianeee', 'moyennne', 'ecty', 'nbcasenull', 'nbnotnull')'
		execute immediate counteur2;
	END LOOP;
END;
/
