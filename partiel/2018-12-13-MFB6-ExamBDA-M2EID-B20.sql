--====  FB ===========================================================================
--====  FB ===========================================================================
-- Universite Sorbonne Paris Cite - Promotion 2018-2019 - Decembre 2018
--====  FB ===========================================================================

-- Binôme Bxy :  ELILTHAMILVALAVAN Magilan            *** ELILTHAMILVALAVAN Magilan

-- Master 2 Informatique, Professionnel, Exploration Informatique des Donnees et Decisionnel
-- Examen de Bases de Donnees Avancees
--====  FB ===========================================================================

-- Nouveau nom du Fichier SQL : 2018-Profiler-B20.sql

--====  FB ===========================================================================
--====  FB ===========================================================================


/*
M. F. Boufares ; 
Universite Sorbonne Paris Cite
Universite Paris 13 ; Master 2 EID2
Jeudi 13 decembre 2018

Vous êtes le TOUBIB-TABIB des donnees : Un Data-Logue 
(Comme par exemple les Cardio-logues, les Pneumo-logues, les Uro-logues,...) !

Vous disposez des outils qui vous permettent de DIAGNOSTIQUER les anomalies de votre patient la source de donnees DataSource !

Est-ce une mission possible ?! SiSi C PO CIBLE !!!
VOTRE MISSION SI VOUS L'ACCEPTEZ EST DE DONNER UN SENS AUX DONNEES !
SI VOUS ECHOUEZ, NOUS NIERONS AVOIR EU CONNAISSANCE DE VOS AGISSEMENTS !

Faites le diagnostic automatiquement qui vous permet :
- de detecter les erreurs (les anomalies), et ensuite,
- de corriger les anomalies

Vous êtes entrain de developper un outil de qualite tres intelligent : --->>>>>> SmartDATA
Est-ce une mission impossible ?! SiSi C PO CIBLE !!!

-----??????????? V -----??????????? *******************************

iDQMS : intelligent Data Quality Management System --->>>>>> SmartDATA

                            -----iDQMS-----
         Data Source ---->>|               |----->>> Data Reports + Updates
                           |   SmartDATA   |
   Data Dicionnaries ---->>|               |----->>> Correct Data + INCorrect Data
                            -----iDQMS-----

Data Source       : Data with anomalies (Examples : CSV file, SQL table)
Data Dicionnaries : Dictionnaries such as DDRE for Regular Expressions and DDVS for Valid Strings
Data Reports      : Reports that contain diagnostics (metrics & mesures), to help correcting INVALID DATA
Updates           : A set of actions to do to better correct Data (UPDATE DataSource SET ...=... WHERE ... ; Etc...)
Correct Data      : VALID Records (with NO anomalies ->> Heteregeneous Data, Null Value, Functional Dependency, Deduplication,...)
INCorrect Data    : INVALID Records (with anomalies, at least one) DSWARNING

-----??????????? V -----??????????? *******************************

*/
set serveroutput on
DROP TABLE DATASOURCE;
CREATE TABLE DATASOURCE ( NOM VARCHAR2(20), PRENOM VARCHAR2(20), DATNAISS VARCHAR2(20), VILNAIS VARCHAR2(20), PAYSNAIS VARCHAR2(20), SEXE VARCHAR2(20), GS VARCHAR2(5),TAILLE VARCHAR2(20),POIDS VARCHAR2(20), TELMOBILE VARCHAR2(20), EMAIL VARCHAR2(40) );

INSERT INTO DATASOURCE VALUES ('LAMEME', 'Lina', '22/02/2002', 'Lille', 'France', 'F', 'AB+', '155cm', '69Kg', '+33 7 77 77 77 77', 'lina.lameme@gmail.com');
INSERT INTO DATASOURCE VALUES ('CLEMENT', 'Adam', '10/06/1996', 'Paris', 'France', 'M', 'B+', '172cm', '71', '+33617716698', 'adam.clement@gmail.com');
INSERT INTO DATASOURCE VALUES ('LABELLE', 'Eve', '17/06/1990', 'Paris', 'Fr', 'F', 'B', '169cm', '', '669964916', 'eve.la belle@gmail.com');
INSERT INTO DATASOURCE VALUES ('CLEMENT', 'Clemence', '01/10/1920', 'Marseille', 'France', 'F', 'A+', '1,68m', '68kg', '684071896', 'clemence.clement@gmail.com');
INSERT INTO DATASOURCE VALUES ('TRAIFOR', 'Adam', '19/06/2001', 'Lyon', 'France', 'M', 'B+', '1700mm', '71kg', '(+33) 06 30 50 19 16', 'adam.traifor@gmail.com');
INSERT INTO DATASOURCE VALUES ('EVE', 'Evelyne', '22 novembre 1969', '-', '', 'F', '', '', '', '687844442', 'evelyne!?/eve@gmail.com');
INSERT INTO DATASOURCE VALUES ('NANNOU', 'Ines', '22 novembre 1969', 'Nice', 'France', 'F', 'B+', '1,69m', '70KG', '678466837', 'ines.nan@nou@gmail.com');
INSERT INTO DATASOURCE VALUES ('GRAND', 'Adam', '16 octobre 1996', 'Paris', '', 'M', 'B+', '1920mm', '71KiloG', '646532809', 'adam.grand@gmail.com');
INSERT INTO DATASOURCE VALUES ('LAMEME', 'Lina', '22 fevrier 2002', 'Lille', 'France', 'F', 'AB+', '155cm', '69KG', '+33 7 77 77 77 77', 'lina.lameme@gmail.com');
INSERT INTO DATASOURCE VALUES ('LAMEME', 'Lina', '22 fevrier 2002', 'Lille', 'France', 'F', 'AB+', '155cm', '69KG', '+33 7 77 77 77 77', '');
INSERT INTO DATASOURCE VALUES ('LAMEME', 'Lina', '22 fevrier 2002', 'Lille', 'France', 'F', 'AB+', '155cm', '69KG', '', 'lina.lameme@gmail.com');
INSERT INTO DATASOURCE VALUES ('LAMEME', 'L.', '22 fevrier 2002', 'Lille', 'France', 'F', 'AB+', '155cm', '69KG', '', 'lina.lameme@gmail.com');
INSERT INTO DATASOURCE VALUES ('lameme', 'lina', '22 fevrier 2002', 'lille', '', 'f', '', '155cm', '69kg', '+33 7 77 77 77 77', 'lina.lameme@gmail.com');
INSERT INTO DATASOURCE VALUES ('lameme', 'lina', '22 fevrier 2002', 'lille', 'franc', 'f', 'ab+', '155cm', '69kg', '+33 7 77 77 77 77', 'lina.lameme@gmail');
INSERT INTO DATASOURCE VALUES ('CLEMENT', 'Clemence', '11 novembre 2011', 'Barcelone', 'Espagne', 'F', 'A+', '111cm', '13kg', '', 'fcb-clement@yahoo.fr');
INSERT INTO DATASOURCE VALUES ('CLEMENT', 'Clemence', '11 novembre 2011', 'Barcelone', 'Espagne', 'F', 'A+', '1,11m', '13000g', '', 'fcb-clement@yahoo.fr');
INSERT INTO DATASOURCE VALUES ('CLEMENT', 'clemence', '2011-novembre-11', 'Barcelone', 'Espagne', 'F', 'A+', '1,11m', '13000g', '', 'fcb-clement@yahoo.fr');
COMMIT;


--====  1 ===========================================================================

-- Quelques questions pour commencer !

SELECT DISTINCT NOM FROM DATASOURCE;
SELECT DISTINCT UPPER(NOM) FROM DATASOURCE;
SELECT EMAIL FROM DATASOURCE;

-- Homogeneisation !!! Comment !

SELECT TAILLE FROM DATASOURCE;
SELECT AVG(TAILLE) AS MOYTAIL FROM DATASOURCE ;
SELECT MAX(POIDS) AS MAXPDS FROM DATASOURCE ;

--====  2 ===========================================================================

-- Il y aurait des problemes dans cette source de donnees !!

REM Que faire ?
REM C EST SMARTDATA QUI VA NOUS RENSEIGNER !

-- Developpez le mecanisme qui permet de diagnostiquer (profiler) les problemes dans la source de donnees
-- Completez/Corrigez le script sql 2018ProfilerDonnees.sql --==>>> 2018-12-13-Profiler-Bxy.sql

--====  3 ===========================================================================

-- Dans l'exemble d'application traite en cours-TD-TP "GEStion COMmerciale"
-- Les villes & les pays des clients et des magasins peuvent consituer de nouvelles donnees 
-- qui permettraient d'enrichir le dicionnaire de donnees DDVS (Data Dictionnary for Valid Strings) utilise pour corriger des anomalies
-- Proposez une metthode d'enrichissement de ce dictionnaire et developpez le script sql correspondant

--====  4 ===========================================================================

-- Dans l'exemble d'application traite en cours-TD-TP "GEStion COMmerciale"
-- Le schema, relationnel, de la BD GESCOM 
-- est compose de plusieurs tables et leurs derives : CLIENTS, COMMANDES, ARTICLES, DETAILSCOM, MAGASINS...

-- Detaillez la maniere de definir un nouveau schema cible-destination (dit schema en etoile) extrait depuis toutes les sources
-- Celui-ci permet de faire des croisements-analyses-extractions-exploitations des donnees tel que celui des ventes par rapport 
-- aux articles, aux magasins, aux clients et à la dimension temps...

-- Comparez le avec le schema global qui regroupe toutes les tables (l'Union-l'Integration de toutes les tables de toutes les BD)

--====  5 ===========================================================================

-- N'oubliez pas, si vous le souhaitez, d'envoyer la version definitive (G-Bxy) de tous vos travaux avant le jj-decembre 2018

--====  FB ===========================================================================
--====  FB ===========================================================================

@DDRE
@DDVS
@rendu
@partiel_test
COMMIT;


select * from clients_FR02;

select * from DDVS  where CATEGORY = 'FIRSTNAME' AND ENGLISH LIKE '%rue%';
/*
UTL_MATCH.JARO_WINKLER_SIMILARITY
UTL_MATCH.edit_distance_similarity
*/

CREATE OR REPLACE FUNCTION corrCityDD(city IN VARCHAR)
RETURN VARCHAR
AS
  res VARCHAR(20) := '';
BEGIN
  IF city IS NULL OR NOT REGEXP_LIKE(UPPER(city), '([a-zA-Z]+)')THEN
    RETURN '';
  END IF;
  EXECUTE IMMEDIATE 'SELECT CITY FROM (SELECT ENGLISH AS CITY, UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(ENGLISH), UPPER(''' || city || ''')) AS SIMI FROM DDVS WHERE CATEGORY = ''CITY'') 
  GROUP BY CITY, SIMI HAVING SIMI = (SELECT MAX(UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(ENGLISH), UPPER(''' || city || '''))) FROM DDVS WHERE CATEGORY = ''CITY'')'
  INTO res;
  RETURN res;
END;
/

DROP function CorretionColPaysDD;

select * from datasource;



desc DDVS;
desc datasource;
select english, french, UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(english), UPPER('MME')), UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(french), UPPER('MME')) from DDVS where category = 'CIVILITY';
select UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER('mme'), UPPER('MME')) from dual;

-- Creation des vues du DDVS
CREATE OR REPLACE VIEW V_DD_CIVILITY AS SELECT * FROM DDVS WHERE CATEGORY = 'CIVILITY';
-- Recherche de la cl� primaire


desc V_DD_CIVILITY;

CREATE OR REPLACE PROCEDURE createViewDD
AS
BEGIN
  FOR ligne IN (select category from DDVS group by category order by category) LOOP
    EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW V_DD_' || ligne.category || ' AS SELECT * FROM DDVS WHERE CATEGORY = ''' || ligne.category || '''';
  END LOOP;
END;
/

exec createViewDD();
select * from V_DD_FIRSTNAME;

CREATE OR REPLACE FUNCTION getPrimaryKeyDD(monType IN VARCHAR, mot IN VARCHAR)
 RETURN VARCHAR
AS
  Type curseurType IS REF CURSOR;
  monCurseur curseurType;
  maVariable VARCHAR(200);
  res VARCHAR(10) := '';
BEGIN
  IF mot IS NULL THEN
    RETURN '';
  END IF;
  -- Probleme de similarit� donc on passe par un curseur
  OPEN monCurseur FOR  'select primarykey from (SELECT PRIMARYKEY, UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(english), UPPER(''' || mot || ''')) AS SIMI FROM V_DD_'|| UPPER(monType) ||'
    UNION
  SELECT PRIMARYKEY, UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(french), UPPER(''' || mot || ''')) AS SIMI FROM V_DD_'|| UPPER(monType) ||') WHERE SIMI > 95
  group by primarykey, simi having simi = (select max(simi) from (SELECT PRIMARYKEY, UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(english), UPPER(''' || mot || ''')) AS SIMI FROM V_DD_'|| UPPER(monType) ||'
    UNION
  SELECT PRIMARYKEY, UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(french), UPPER(''' || mot || ''')) AS SIMI FROM V_DD_'|| UPPER(monType) ||'))';
    LOOP
      FETCH monCurseur INTO maVariable;
        RETURN maVariable;
      EXIT WHEN monCurseur%NOTFOUND;
    END LOOP;
  CLOSE monCurseur;
  RETURN res;
END;
/

select english, vilnais, UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(english), UPPER(vilnais)) from datasource, DDVS where  UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(english), UPPER(vilnais)) > 95; 

CREATE OR REPLACE PROCEDURE CorretionColByPkDD(maTable IN VARCHAR, maColonne IN VARCHAR, monType IN VARCHAR, maLangue IN VARCHAR DEFAULT 'ENGLISH')
AS
BEGIN
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = (select ' || maLangue || ' from DDVS where PRIMARYKEY = getPrimaryKeyDD(''' || UPPER(monType) || ''', ' || UPPER(maColonne) || '))';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee par data dictionary');
END;
/

select * from Datasource;

select nom, (select english from DDVS where DDVS.PRIMARYKEY = getPrimaryKeyDD('firstname', nom)) from datasource;

exec CorretionColByPkDD('datasource', 'nom', 'firstName');
