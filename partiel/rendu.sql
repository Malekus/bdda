

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

CREATE OR REPLACE PROCEDURE findCol2(maTable IN VARCHAR, maColonne IN VARCHAR, findCat OUT VARCHAR)
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

EXECUTE IMMEDIATE 'select count(*) from (select category, sum(numberocc) from TEMP_CATE_SUBCAT group by category having count(*) >= (select max(nbOCC) from (select category, sum(numberocc) as nbOcc from TEMP_CATE_SUBCAT group by category)))'
INTO v_test;
IF v_test = 1 THEN
EXECUTE IMMEDIATE 'select category, sum(numberocc) from TEMP_CATE_SUBCAT group by category having count(*) >= (select max(nbOCC) from (select category, sum(numberocc) as nbOcc from TEMP_CATE_SUBCAT group by category))'
INTO v_Category, v_Number;
	findCat := v_Category;
ELSE
	findCat := 'NO FOUND';
END IF;


END;
/
-- select category, sum(numberocc) from TEMP_CATE_SUBCAT group by category having count(*) >= (select max(nbOCC) from (select category, sum(numberocc) as nbOcc from TEMP_CATE_SUBCAT group by category))

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
-- Fonction qui trouve le type de colonne 
CREATE OR REPLACE PROCEDURE detectionColonne(maTable IN VARCHAR)
AS
   monCurseur SYS_REFCURSOR;
   ligne VARCHAR(200);
   v_Category VARCHAR(50) := '';
   v_SubCategory VARCHAR(50) := '';
BEGIN
  monCurseur := getAllColumn(maTable);
  LOOP
    FETCH monCurseur into ligne;
      v_Category := '';
      v_SubCategory := '';
      findCol2(maTable, ligne, v_Category);
      DBMS_OUTPUT.PUT_LINE(ligne || ' ' || v_Category);
    EXIT WHEN  monCurseur%NOTFOUND;
  END LOOP;  
END;
/


create or replace function monTest(maTable IN VARCHAR, maColonne IN VARCHAR)
return varchar
as
	res VARCHAR(255) := '';
	v_Number NUMBER := 0;
BEGIN
	EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW TEMP_CATE_SUBCAT AS SELECT category, SUBCATEGORY, NUMBEROCC  from (select CATEGORY, SUBCATEGORY, regValideCol(''' 
	  || UPPER(maTable) || ''', ''' 
	  || UPPER(maColonne) || ''', REGEXPR) AS NUMBEROCC from DDRE) group by category, SUBCATEGORY, NUMBEROCC HAVING NUMBEROCC = (select max(regValideCol(''' 
	  || UPPER(maTable) || ''', ''' 
	  || UPPER(maColonne) || ''', REGEXPR)) from DDRE)';
	EXECUTE IMMEDIATE 'select category, sum(numberocc) from TEMP_CATE_SUBCAT group by category having count(*) >= (select max(nbOCC) from (select category, sum(numberocc) as nbOcc from TEMP_CATE_SUBCAT group by category))'
	INTO res, v_Number;
	RETURN res;
END;
/

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

 -- poids: exemple 3lb, tonne, once, pounds
INSERT INTO DDRE VALUES ('WEIGHT','WEIGHT-TONNE','^[0-9]+[[:space:]]?(lb|oz|livre|once|tonne|t|pounds)$','WEIGHT002','');

-- longueur: exemple 3m50 3,5m, cm, dam
INSERT INTO DDRE VALUES ('LENGTH','LENGTH-M','^[0-9]+[[:space:]]?([dDcCkKhHmMnNÂµ]m|m|dam)[0-9]*$','LENGTH001','');

-- longueur: exemple 45 pouce
INSERT INTO DDRE VALUES ('LENGTH','LENGTH-POUCE','^[0-9]+[[:space:]]?(inch|pouce|pouces|foot|pied|yard|mille|mi)[0-9]*$','LENGTH002','');

-- vitesse: exemple 150 m/s
INSERT INTO DDRE VALUES ('SPEED','SPEED-M/s','^[0-9]+[[:space:]]?(cm|m|ft|p)\/s$','SPEED001','');
 
-- vitesse: exemple 150 km/h
INSERT INTO DDRE VALUES ('SPEED','SPEED-KM/H','^[0-9]+[[:space:]]?(km|mille|mi)\/h$','SPEED002',''); 

-- vitesse: exemple 150 noeuds
INSERT INTO DDRE VALUES ('SPEED','SPEED-NOEUDS','^[0-9]+[[:space:]]?(noeud|noeuds|nd|kt|kn|kts)$','SPEED003','');

INSERT INTO DDRE VALUES ('TEMPERATURE','TEMPERATURE-Celsius', '[0-9]+[[:space:]]?(°C|Celsius)$','TEMPERATURE001','');

INSERT INTO DDRE VALUES ('TEMPERATURE','TEMPERATURE-Fahrenheit', '[0-9]+[[:space:]]?(°F|Fahrenheit)$','TEMPERATURE002','');

INSERT INTO DDRE VALUES ('TEMPERATURE','TEMPERATURE-Kelvin', '[0-9]+[[:space:]]?(K|Kelvin)$','TEMPERATURE003','');

INSERT INTO DDRE VALUES ('VOLUME','','^[0-9]+[[:space:]]?([dcmhknÂµ]l|litre|gallon|gal)[0-9]*$','VOLUME001','');

INSERT INTO DDRE VALUES ('URL', '','^((http|https):\/\/)?(www[.])?([a-zA-Z0-9]|-)+([.][a-zA-Z(-|\/|=|?)?]+)+$', 'URL001', '') ;

INSERT INTO DDRE VALUES ('EMAIL','','^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$','EMAIL001', '') ;

INSERT INTO DDRE VALUES ('DATE','DATEDDMMYYYY','^(0?[1-9]|[12][0-9]|3[01])[\/\-\.](0?[1-9]|1[012])[\/\-\.]\d{4}$','DATE001','');

INSERT INTO DDRE VALUES ('DATE','DATEMMDDYYYY','^(0?[1-9]|1[012])[\/\-\.](0?[1-9]|[12][0-9]|3[01])[\/\-\.]\d{4}$','DATE002',''); 

INSERT INTO DDRE VALUES ('DATE','DATEYYYYMMDD','^(\d{4})[\/\-\.](0?[1-9]|1[012])[\/\-\.](0?[1-9]|[12][0-9]|3[01])$','DATE003','');

INSERT INTO DDRE VALUES ('INTEGER','','^[[:digit:]]+$','INTEGER001','');

INSERT INTO DDRE VALUES ('MONEY','EURO','^([0-9]+)(.[0-9]{1,2})? (\€)$','MONEY001','');

INSERT INTO DDRE VALUES ('MONEY','DOLLAR','^([0-9]+)(.[0-9]{1,2})? (\$)$','MONEY002','');

INSERT INTO DDRE VALUES ('MONEY','LIVRE','^([0-9]+)(.[0-9]{1,2})? (\£)$','MONEY003','');

INSERT INTO DDRE VALUES ('MONEY','DINARTUNISIEN','^([0-9]+)(.[0-9]{1,2})? (D[tT])$','MONEY004','');

INSERT INTO DDRE VALUES ('PEOPLE','MEN','^(M|MALE|MÂLE|MEN|HOMME|H|MONSIEUR)$','PEOPLE001','');

INSERT INTO DDRE VALUES ('PEOPLE','WOMEN','^(F|FEMALE|FEMELLE|WOMEN|FEMME|MADAME|MADEMOISELLE)$','PEOPLE002','');

INSERT INTO DDRE VALUES ('ADRESSE','ALL','^([0-9])+( BIS| bis)?, ([a-zA-Z .]+)$','ADRESSE001','');

INSERT INTO DDRE VALUES ('IDENTITY', 'ID', '^([0-9a-zA-Z]\1){2}([a-zA-Z0-9.])*([0-9])$', 'IDENTITY001','');

INSERT INTO DDRE VALUES ('TEL', 'TELINDI', '^(\+[1-9])([0-9]{1,2})?([0-9]{9})$', 'TELINDICATEUR001','');

INSERT INTO DDRE VALUES ('CP', 'CPFR', '^([0-9]){5}$', 'CP001','');

INSERT INTO DDRE VALUES ('CP', 'CPUK', '^([a-zA-Z])([0-9] |[0-9][0-9] |[0-9][a-zA-Z] |[a-zA-Z][0-9] |[a-zA-Z][0-9][0-9] |[a-zA-Z][0-9][a-zA-Z] )([0-9][a-zA-Z]{2})$', 'CP002','');

INSERT INTO DDRE VALUES ('CP', 'CPBE', '^(((?!999[3-9]))([1-9])([0-9]){2}([0-9]))$', 'CP003','');

COMMIT;
