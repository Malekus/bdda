-- Vue a cree (voir cours)
CREATE OR REPLACE VIEW DDVSP AS select CATEGORY, ENGLISH AS NAME, PRIMARYKEY FROM DDVS
UNION
select CATEGORY, FRENCH AS NAME, PRIMARYKEY FROM DDVS
UNION
select CATEGORY, ABR AS NAME, PRIMARYKEY FROM DDVS WHERE ABR IS NOT NULL AND CATEGORY != 'CITY' ;

-- Procedure qui donne la categorie et la sous-categorie qui poss�de le plus grande nombre d'occurence !
CREATE OR REPLACE PROCEDURE findCol(maTable IN VARCHAR, maColonne IN VARCHAR, findCat OUT VARCHAR, findSubCat OUT VARCHAR)
AS
  v_Category VARCHAR(120) := '';
  v_Subcategory VARCHAR(120) := '';
  v_Number NUMBER;
  v_test NUMBER;
  v_NumCol NUMBER;
BEGIN
  EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW TEMP_CATE_SUBCAT AS SELECT category, SUBCATEGORY, NUMBEROCC  from (select CATEGORY, SUBCATEGORY, regValideCol(''' 
  || UPPER(maTable) || ''', ''' 
  || UPPER(maColonne) || ''', REGEXPR) AS NUMBEROCC from DDRE) group by category, SUBCATEGORY, NUMBEROCC HAVING NUMBEROCC = (select max(regValideCol(''' 
  || UPPER(maTable) || ''', ''' 
  || UPPER(maColonne) || ''', REGEXPR)) from DDRE)';


END;
/

-- Fonction qui compte le nombre de valeur qui correspond a l'expression régulière
CREATE OR REPLACE FUNCTION regValideCol(maTable IN VARCHAR, maColonne IN VARCHAR, regex IN VARCHAR)
RETURN NUMBER
AS
	Type curseurType IS REF CURSOR;
  monCurseur curseurType;
  maVariable VARCHAR(200);
  res NUMBER := 0;
BEGIN
	OPEN monCurseur FOR ('SELECT ' || UPPER(maColonne) || ' FROM ' || UPPER(maTable));
        LOOP
            FETCH monCurseur INTO maVariable;
              IF REGEXP_LIKE(UPPER(maVariable), regex) THEN
                res := res + 1;
              END IF;
            EXIT WHEN monCurseur%NOTFOUND;
        END LOOP;
    CLOSE monCurseur;
    RETURN res;
END;
/

-- Function qui retourne toute les lignes d'une colonne
CREATE OR REPLACE FUNCTION getAllColumn(maTable IN VARCHAR)
  RETURN SYS_REFCURSOR
AS
  mesColonnes SYS_REFCURSOR;
BEGIN
  OPEN mesColonnes FOR select column_name from user_Tab_Cols where Table_Name = UPPER(maTable);
  RETURN mesColonnes;
END;
/
set serveroutput on
CREATE OR REPLACE FUNCTION takeColName(maTable IN VARCHAR, maColonne IN VARCHAR)
RETURN VARCHAR
IS
	TYPE curType IS REF CURSOR;
	vCursor curType;
	maVariable_CAT VARCHAR(255);
	maVariable_REG VARCHAR(255);
	res VARCHAR(20) := '';
	v_Number_AV NUMBER := 0;
	v_Number_AP NUMBER := 0;
BEGIN
	OPEN vCursor FOR ('SELECT CATEGORY,  REGEXPR FROM DDRE');
		LOOP
			FETCH vCursor INTO maVariable_CAT, maVariable_REG;			
			EXECUTE IMMEDIATE 'select regValideCol('''|| UPPER(maTable) || ''', ''' || UPPER(maColonne) || ''', ''' || maVariable_REG || ''') from dual'
				INTO v_Number_AV;
				IF v_Number_AP < v_Number_AV THEN
					res := maVariable_CAT;
					v_Number_AP := v_Number_AV;
				END IF;
					v_Number_AP := v_Number_AV;
			EXIT WHEN vCursor%NOTFOUND;
	    	END LOOP;
	CLOSE vCursor;
  dbms_output.put_line('J4ai trouve ' || res || ' pour ' || macolonne);
	RETURN res;
END;
/


CREATE OR REPLACE FUNCTION takeColNameVS(maTable IN VARCHAR, maColonne IN VARCHAR)
RETURN VARCHAR
AS 
  TYPE curType IS REF CURSOR;
	vCursor curType;
	maVariable_CAT VARCHAR(255);
	v_NUMBER NUMBER(10);
	res VARCHAR(20) := '';
	v_Number_AV NUMBER := 0;
	v_Number_AP NUMBER := 0;
BEGIN
  EXECUTE IMMEDIATE 'SELECT CATEGORY, COUNT(*) FROM DDVSP WHERE UPPER(NAME) in (select UPPER(' || maColonne || ') FROM ' || UPPER(maTable) || ') GROUP BY CATEGORY HAVING COUNT(*) >= (SELECT MAX(COUNT(*)) from DDVSP WHERE UPPER(NAME) in (select UPPER(' || maColonne || ') FROM ' || UPPER(maTable) || ') GROUP BY CATEGORY)'
  INTO maVariable_CAT, v_NUMBER;
  RETURN maVariable_CAT;
END;
/

-- Fonction qui trouve le type de colonne 
CREATE OR REPLACE PROCEDURE detectionColonne(maTable IN VARCHAR)
AS
   monCurseur SYS_REFCURSOR;
   ligne VARCHAR(200);
   v_Category VARCHAR(50) := '';
BEGIN
  FOR maLigne IN (select column_name from user_Tab_Cols where Table_Name = UPPER(maTable)) LOOP
    EXECUTE IMMEDIATE 'SELECT takeColName(''' || UPPER(maTable) || ''', ''' || UPPER(maLigne.column_name) || ''') FROM DUAL'
    INTO v_Category;
    IF v_Category IS NOT NULL THEN
      EXECUTE IMMEDIATE 'INSERT INTO tabPreCorr'|| UPPER(matable) ||' VALUES (''' || maLigne.column_name || ''', ''' || v_Category || ''' , ''REGEXP'', ''No'')';
    END IF;
  END LOOP;  
END;
/

CREATE OR REPLACE PROCEDURE detectionColonneVS(maTable IN VARCHAR)
AS
  v_Category VARCHAR(255) := '';
BEGIN
  FOR maLigne IN (select column_name from user_Tab_Cols where Table_Name = UPPER(maTable)) LOOP
    EXECUTE IMMEDIATE 'SELECT takeColNameVS(''' || UPPER(maTable) || ''', ''' || UPPER(maLigne.column_name) || ''') FROM DUAL'
    INTO v_Category;
    IF v_Category IS NOT NULL THEN
      EXECUTE IMMEDIATE 'INSERT INTO tabPreCorr'|| UPPER(matable) ||' VALUES (''' || maLigne.column_name || ''', ''' || v_Category || ''' , ''DD'', ''No'' )';
    END IF;
  END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE createTableRef(maTable IN VARCHAR)
AS
  v_test NUMBER := 0;
BEGIN
  EXECUTE IMMEDIATE 'select count(*) from user_Tab_Cols where Table_Name = UPPER(''tabPreCorr' || maTable || ''')'
  INTO v_test;
  IF v_test != 0 THEN
    EXECUTE IMMEDIATE 'DROP TABLE tabPreCorr'|| INITCAP(maTable);
  END IF;
  EXECUTE IMMEDIATE 'CREATE TABLE tabPreCorr' || INITCAP(maTable) || ' (colum_tab VARCHAR(255), corr_Prop VARCHAR(255), corr_TECH VARCHAR(255), FIX VARCHAR(10) DEFAULT ''No'')';
  detectionColonne(maTable);
  detectionColonneVS(maTable);
  DBMS_OUTPUT.PUT_LINE('La table tabPreCorr' || INITCAP(maTable) || ' a ete creee');
END;
/

CREATE OR REPLACE PROCEDURE runCorrectionExp(maTable IN VARCHAR2)
AS
  TYPE curType IS REF CURSOR;
	vCursor curType;
	maVariable_COL VARCHAR(255);
	maVariable_PROP VARCHAR(255);
BEGIN
  DBMS_OUTPUT.PUT_LINE('Correction avec expression r�guli�re');
  OPEN vCursor FOR ('SELECT colum_tab, corr_prop FROM ' || UPPER(maTable) || ' WHERE FIX = ''No'' AND CORR_PROP != ''NOT FOUND'' AND CORR_TECH = ''REGEXP''');
        LOOP
            FETCH vCursor INTO maVariable_COL, maVariable_PROP;
              EXECUTE IMMEDIATE 'CALL CorretionCol'|| maVariable_PROP ||'(''' || REGEXP_REPLACE(maTable, 'tabPreCorr', '') || ''', ''' || maVariable_COL || ''')';
              EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET FIX = ''Yes'' WHERE COLUM_TAB = ''' || UPPER(maVariable_COL) || ''' AND CORR_PROP = ''' || UPPER(maVariable_PROP) || ''' AND CORR_TECH = ''REGEXP''';
            EXIT WHEN vCursor%NOTFOUND;
    END LOOP;
  CLOSE vCursor;
END;
/

CREATE OR REPLACE PROCEDURE runCorrectionDD(maTable IN VARCHAR)
AS
  TYPE curType IS REF CURSOR;
	vCursor curType;
	maVariable_COL VARCHAR(255);
	maVariable_PROP VARCHAR(255);
BEGIN
  DBMS_OUTPUT.PUT_LINE('Correction avec data dictionary');  
  OPEN vCursor FOR ('SELECT colum_tab, corr_prop FROM ' || UPPER(maTable) || ' WHERE FIX = ''No'' AND CORR_TECH = ''DD''');
        LOOP
            FETCH vCursor INTO maVariable_COL, maVariable_PROP;
              CorretionColByPkDD(REGEXP_REPLACE(maTable, 'tabPreCorr', ''), maVariable_COL, maVariable_PROP);
              EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET FIX = ''Yes'' WHERE COLUM_TAB = ''' || UPPER(maVariable_COL) || ''' AND CORR_PROP = ''' || UPPER(maVariable_PROP) || ''' AND CORR_TECH = ''DD''';
            EXIT WHEN vCursor%NOTFOUND;
    END LOOP;
  CLOSE vCursor;
END;
/

-- Procedure qui lance les deux corrections
CREATE OR REPLACE PROCEDURE runAllCorrection(maTable IN VARCHAR)
AS
BEGIN
  DBMS_OUTPUT.PUT_LINE('Coorection par expression r�guli�re');
  runCorrectionExp('tabPreCorr' || maTable);
  DBMS_OUTPUT.PUT_LINE('Correction par dictionnaire');
  runCorrectionDD('tabPreCorr' || maTable);
END;
/

select * from DATASOURCE;
exec createTableRef('datasource');
select * from tabPreCorrDatasource;
exec runAllCorrection('datasource');
select * from DATASOURCE;
