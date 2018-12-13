

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
            	res := res + regValide(UPPER(maVariable), regex);
            EXIT WHEN monCurseur%NOTFOUND;
        END LOOP;
    CLOSE monCurseur;
	IF res = 0 THEN
		RETURN -1;
	END IF;
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
  EXECUTE IMMEDIATE 'SELECT CATEGORY, COUNT(*) FROM DDVSP WHERE UPPER(NAME) in (select UPPER(' || maColonne || ') FROM ' || UPPER(maTable) || ') GROUP BY CATEGORY'
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
      EXECUTE IMMEDIATE 'INSERT INTO tabPreCorr'|| UPPER(matable) ||' VALUES (''' || maLigne.column_name || ''', ''' || v_Category || ''' , ''REGEXP'')';
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
      EXECUTE IMMEDIATE 'INSERT INTO tabPreCorr'|| UPPER(matable) ||' VALUES (''' || maLigne.column_name || ''', ''' || v_Category || ''' , ''DD'')';
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
  EXECUTE IMMEDIATE 'CREATE TABLE tabPreCorr' || INITCAP(maTable) || ' (colum_tab VARCHAR(255), corr_Prop VARCHAR(255), corr_TECH VARCHAR(255))';
  detectionColonne(maTable);
  detectionColonneVS(maTable);
END;
/

exec CREATETABLEREF('datasource');
exec detectionColonne('datasource');
exec detectionColonneVS('datasource');
select * from tabPreCorrdatasource;

DROP TABLE tabPreCorrdatasource;
show error;

/*
DROP TABLE DDRE;

CREATE TABLE DDRE 
(
CATEGORY    VARCHAR(50), 
SUBCATEGORY  VARCHAR(50),
REGEXPR     VARCHAR(1000),  
PRIMARYKEY  VARCHAR(20),  
FOREIGNKEY  VARCHAR(20),
CONSTRAINT  PKDDRE PRIMARY KEY (PRIMARYKEY)
);

INSERT INTO DDRE VALUES ('WEIGHT','WEIGHT-KG','^([1-9]([0-9])*(,[1-9])?)( )?([kK][gG]|[kK][gG]( )?[0-9]+)$','WEIGHT001',''); 
INSERT INTO DDRE VALUES ('SIZE','SIZE-MM','^([1-9]([0-9])*(,[1-9])?)( )?([mM]{2})$','SIZE001',''); 
INSERT INTO DDRE VALUES ('SIZE','SIZE-CM','^([1-9]([0-9])*(,[1-9])?)( )?([cC][mM])$','SIZE002',''); 
INSERT INTO DDRE VALUES ('SIZE','SIZE-M','^([1-9]([0-9])*(,[1-9])?)( )?([mM])$','SIZE003',''); 
INSERT INTO DDRE VALUES ('GS','GRSANG','^(A|B|O|AB)(\+|\-)$','GR001',''); 

-- longueur: exemple 3m50 3,5m, cm, dam
INSERT INTO DDRE VALUES ('LENGTH','LENGTH-M','^[0-9]+[[:space:]]?([dDcCkKhHmMnNÂµ]m|m|dam)[0-9]*$','LENGTH001','');

-- longueur: exemple 45 pouce
INSERT INTO DDRE VALUES ('LENGTH','LENGTH-POUCE','^[0-9]+[[:space:]]?(inch|pouce|pouces|foot|pied|yard|mille|mi)[0-9]*$','LENGTH002','');

INSERT INTO DDRE VALUES ('EMAIL','','^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$','EMAIL001', '') ;

INSERT INTO DDRE VALUES ('DATE','DATEDDMMYYYY','^(0?[1-9]|[12][0-9]|3[01])[\/\-\.](0?[1-9]|1[012])[\/\-\.]\d{4}$','DATE001','');

INSERT INTO DDRE VALUES ('DATE','DATEMMDDYYYY','^(0?[1-9]|1[012])[\/\-\.](0?[1-9]|[12][0-9]|3[01])[\/\-\.]\d{4}$','DATE002',''); 

INSERT INTO DDRE VALUES ('DATE','DATEYYYYMMDD','^(\d{4})[\/\-\.](0?[1-9]|1[012])[\/\-\.](0?[1-9]|[12][0-9]|3[01])$','DATE003','');

INSERT INTO DDRE VALUES ('MONEY','EURO','^([0-9]+)(.[0-9]{1,2})? (\€)$','MONEY001','');

INSERT INTO DDRE VALUES ('MONEY','DOLLAR','^([0-9]+)(.[0-9]{1,2})? (\$)$','MONEY002','');

INSERT INTO DDRE VALUES ('MONEY','LIVRE','^([0-9]+)(.[0-9]{1,2})? (\£)$','MONEY003','');

INSERT INTO DDRE VALUES ('MONEY','DINARTUNISIEN','^([0-9]+)(.[0-9]{1,2})? (D[tT])$','MONEY004','');

INSERT INTO DDRE VALUES ('PEOPLE','MEN','^(M|MALE|MÂLE|MEN|HOMME|H|MONSIEUR)$','PEOPLE001','');

INSERT INTO DDRE VALUES ('PEOPLE','WOMEN','^(F|FEMALE|FEMELLE|WOMEN|FEMME|MADAME|MADEMOISELLE)$','PEOPLE002','');

INSERT INTO DDRE VALUES ('ADRESSE','ALL','^([0-9])+( BIS| bis)?, ([a-zA-Z .]+)$','ADRESSE001','');

INSERT INTO DDRE VALUES ('IDENTITY', 'ID', '^([0-9a-zA-Z]\1){2}([a-zA-Z0-9.])*([0-9])$', 'IDENTITY001','');

INSERT INTO DDRE VALUES ('TEL', 'TELINDI', '^(\+[1-9])([0-9]{1,2})?([0-9]{9})$', 'TELINDICATEUR001','');

COMMIT;
*/