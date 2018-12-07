--====================================================================
-- Projet iDQMS : intelligent Data Quality Management System
-- Directeur    : Dr. M. F. BOUFARES
-- Etablissement : UniversitÃ© Sorbonne Paris CitÃ©, UniversitÃ© Paris 13
--====================================================================
-- Data Dicionnary for Regular Expressions DDRE
--=============== CrÃ©ation de la table DDRE ==========================
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

--================================================================================

--================================================================================


-- Insertion des donnÃ©es dans DDRE

-- poids: exemple 3kg500 3,5Kg 3 kg 5, dag, mg, cg
INSERT INTO DDRE VALUES ('WEIGHT','WEIGHT-KG','^[0-9]+[[:space:]]?([dDcCkKhHmMnNÂµ]g|g|dag)[0-9]*$','WEIGHT001',''); 

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

INSERT INTO DDRE VALUES ('PEOPLE','ANYPEOPLE','^(F|FEMALE|FEMELLE|0|WOMEN|FEMME|M|MALE|MÂLE|MEN|HOMME|1|H|MADAME|MONSIEUR|MADEMOISELLE)$','PEOPLE001','');

INSERT INTO DDRE VALUES ('ADRESSE','ALL','^([0-9])+, ([\w .]+)$','ADRESSE001','');

INSERT INTO DDRE VALUES ('IDENTITY', 'ID', '^([0-9a-zA-Z]\1){2}([\w.\d])*([0-9])$', 'IDENTITY001','');


COMMIT;




DROP TABLE DDTF;
CREATE TABLE DDTF
(
CATEGORY    VARCHAR(50), 
FORMAT  VARCHAR(50),
PRIMARYKEY  VARCHAR(20),
CONSTRAINT  PKDDTF PRIMARY KEY (PRIMARYKEY)
);

INSERT INTO DDTF VALUES ('DATE','YYYY-MM-DD','DATEFORMAT');

INSERT INTO DDTF VALUES ('MONEY','MONEY $','MONEYFORMAT');

INSERT INTO DDTF VALUES ('MAN','Monsieur','MANFORMAT');

INSERT INTO DDTF VALUES ('WOMAN','Madame','WOMANFORMAT');

INSERT INTO DDTF VALUES ('UPPER','UPPER(monUpper)','UPPERFORMAT');

INSERT INTO DDTF VALUES ('INITCAP','INITCAP(monInicap)','INITCAPFORMAT');

INSERT INTO DDTF VALUES ('TELFR','+33TELFR','TELFRFORMAT');

COMMIT;

-- Fonction qui renvoie 1 si le mot correspond a l'expression régulière
CREATE OR REPLACE FUNCTION regValide(regex IN VARCHAR, word IN VARCHAR)
RETURN NUMBER
AS
BEGIN
	IF REGEXP_LIKE(word, regex) THEN
		RETURN 1;
	ELSE
		RETURN 0;
	END IF;
  RETURN -1;
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
	OPEN monCurseur FOR ('SELECT ' || maColonne || ' FROM ' || maTable);
        LOOP
            FETCH monCurseur INTO maVariable;
            	res := res + regValide(UPPER(maVariable), regex);
            EXIT WHEN monCurseur%NOTFOUND;
        END LOOP;
    CLOSE monCurseur;
    RETURN res;
END;
/



-- CREATE OR REPLACE VIEW TEMP_DESC AS 
select category, SUBCATEGORY, NUMBEROCC 
from (select CATEGORY, SUBCATEGORY, regValideCol('ARTICLES_TN02', 'Col5', REGEXPR) AS NUMBEROCC from DDRE) B
group by category, SUBCATEGORY, NUMBEROCC
HAVING NUMBEROCC = (select max(regValideCol('ARTICLES_TN02', 'Col5', REGEXPR)) from DDRE);

-- Procedure qui donne la categorie et la sous-categorie qui possède le plus grande nombre d'occurence !
CREATE OR REPLACE PROCEDURE findCol(maTable IN VARCHAR, maColonne IN VARCHAR, findCat OUT VARCHAR, findSubCat OUT VARCHAR)
AS
  x VARCHAR(20) := '';
BEGIN
  EXECUTE IMMEDIATE 'SELECT category, SUBCATEGORY from (select CATEGORY, SUBCATEGORY, regValideCol(''' 
  || UPPER(maTable) || ''', ''' 
  || UPPER(maColonne) || ''', REGEXPR) AS NUMBEROCC from DDRE) group by category, SUBCATEGORY, NUMBEROCC HAVING NUMBEROCC = (select max(regValideCol(''' 
  || UPPER(maTable) || ''', ''' 
  || UPPER(maColonne) || ''', REGEXPR)) from DDRE)'
  INTO findCat, findSubCat;
END;
/

DECLARE
  ab VARCHAR(30) := '';
  cd VARCHAR(30) := '';
BEGIN
  findCol('ARTICLES_TN02', 'Col5', ab, cd);
  Dbms_Output.Put_Line(ab || ' ' || cd);
END;
/

CREATE OR REPLACE PROCEDURE detectionColonne(maTable IN VARCHAR)
AS
BEGIN
  
END
;
/