--====================================================================
-- Projet iDQMS : intelligent Data Quality Management System
-- Directeur    : Dr. M. F. BOUFARES
-- Etablissement : Université Sorbonne Paris Cité, Université Paris 13
--====================================================================
-- Data Dicionnary for Regular Expressions DDRE
--=============== Création de la table DDRE ==========================
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


-- Insertion des données dans DDRE

-- poids: exemple 3kg500 3,5Kg 3 kg 5, dag, mg, cg
INSERT INTO DDRE VALUES ('WEIGHT','WEIGHT-KG','^[0-9]+[[:space:]]?([dDcCkKhHmMnNµ]g|g|dag)[0-9]*$','WEIGHT001',''); 

 -- poids: exemple 3lb, tonne, once, pounds
INSERT INTO DDRE VALUES ('WEIGHT','WEIGHT-TONNE','^[0-9]+[[:space:]]?(lb|oz|livre|once|tonne|t|pounds)$','WEIGHT002','');

-- longueur: exemple 3m50 3,5m, cm, dam
INSERT INTO DDRE VALUES ('LENGTH','LENGTH-M','^[0-9]+[[:space:]]?([dDcCkKhHmMnNµ]m|m|dam)[0-9]*$','LENGTH001','');

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

INSERT INTO DDRE VALUES ('VOLUME','','^[0-9]+[[:space:]]?([dcmhknµ]l|litre|gallon|gal)[0-9]*$','VOLUME001','');

INSERT INTO DDRE VALUES ('URL', '','^((http|https):\/\/)?(www[.])?([a-zA-Z0-9]|-)+([.][a-zA-Z(-|\/|=|?)?]+)+$', 'URL001', '') ;

INSERT INTO DDRE VALUES ('EMAIL','','^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$','EMAIL001', '') ;

INSERT INTO DDRE VALUES ('DATE','DATEDDMMYYYY','^(0?[1-9]|[12][0-9]|3[01])[\/\-\.](0?[1-9]|1[012])[\/\-\.]\d{4}$','DATE001','');

INSERT INTO DDRE VALUES ('DATE','DATEMMDDYYYY','^(0?[1-9]|1[012])[\/\-\.](0?[1-9]|[12][0-9]|3[01])[\/\-\.]\d{4}$','DATE002',''); 

INSERT INTO DDRE VALUES ('DATE','DATEYYYYMMDD','^(\d{4})[\/\-\.](0?[1-9]|1[012])[\/\-\.](0?[1-9]|[12][0-9]|3[01])$','DATE003','');

INSERT INTO DDRE VALUES ('INTEGER','','^[[:digit:]]+$','INTEGER001','');

COMMIT;




