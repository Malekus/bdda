-- ===============================================================================
--   Projet  BDM : Big Data Management - Gestion des Données Massives
--
--   Data Integration (DI) - Intégration de Données
--   Master Data Management (MDM)
--   Data Quality Managment (DQM) - Gestion de la qualité des données
--   More semantics to better correct the data 
--   Plus de sémantique afin de mieux corriger les données
-- ===============================================================================
-- =============================================================================== 
--   A new ETL   ETL & DQ : Extract-Transform-Load & Data-Quality 
--                    Al ETL Al Jadyd   
-- ===============================================================================
-- ===============================================================================

--   Directeur        :  Dr. M. Faouzi Boufarès
--   http://www.lipn.univ-paris13.fr/~boufares/Master2EID2

-- ===============================================================================
--
--------=============  BIG DATA, DATA BASE, DATA WAREHOUSE =============----------
--
-- Big Data & Clound Computing : Think DIFFERENTLY, BIGGER and SMARTER !
-- The Excellence in Data Use !
-- EID : L'Excellence dans l'Investigation des Données
-- Excellence in Data Investigation
-- =============================================================================== 
--
-- ===============================================================================
--   Problématique    :  Intégration de données hétérogènes, distribuées
--   Problématique    :  Standardisation de données hétérogènes
--   Problématique    :  Elimination des doubles et similaires
--   Problématique    :  Traitement des valeurs nulles 
--   Problématique    :  Elimination des redondances (Dépendances fonctionnelles)
-- ===============================================================================     
--
-- Les dictons du jour !
--
-- Aujourd'hui, j'arrête de fumer
-- Le TABAC t'ABAT
-- Fumer nuit grâvement à ta santé et à celle de ton entourage
--
-- M   T   Dents
-- SMILE and the World SMILES with you !
--
-- MANGER + MANGER = GROSSIR (??? M, A, N, G, E, R, O, S, S, I)
--
-- Manger & Bouger, 
-- Pour votre santé mangez 5 fruits et légumes par jour
-- Pour votre santé ne mangez pas trop gras, trop salé, trop sucré
-- Pour votre santé faites une activité physique régulière
-- Pour votre santé faites 30 mn de marche par jour
-- Pour votre santé faites des BD !!!
--
-- Dr. M. Faouzi Boufarès
-- =============================================================================== 
-- ===============================================================================

-- ===============================================================================

-- Une solution pour diagnstiquer/profiler une table et remplir les rapports d''anomalies

-- ===============================================================================


-- Diagnostiquer/Profiler une source de données ---->>>>>>>>>>>>>>>>
-- Développer les procédures qui permettent de faire des analyses statistiques sur une table

-- ===============================================================================
set serveroutput on
-- ===============================================================================

-- M01 : Le nombre total de valeurs (nombre de lignes dans la table)

CREATE OR REPLACE PROCEDURE nbLigne(tab varchar, nom_col varchar) IS
query varchar(500);
nb_ligne number;
BEGIN
query := 'select count (' ||nom_col|| ') as NOMBRE_LIGNE from ' || tab ;
execute immediate query into nb_ligne  ;
dbms_output.put_line(nb_ligne);

END;
/

CREATE OR REPLACE FUNCTION Fun_numLigne (nom_col in varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS nbLigne NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select count (' || nom_col || ') from ' || nom_tab ;
     	execute immediate query into nbligne  ;
      RETURN(nbLigne); 
    END;
/

-- M02 : Le nombre de valeurs nulles dans une colonne

CREATE OR REPLACE PROCEDURE nbEltNull(tab varchar, nom_col varchar) IS
query varchar(500);
nb_val_null number;
BEGIN
query := 'select count (*) from ' || tab || ' where ' ||nom_col|| ' is null';
execute immediate query into nb_val_null  ;
dbms_output.put_line(nb_val_null);
-- dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_nbEltNull (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS nb_val_null  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select count(*) from ' || nom_tab || ' where ' || nom_col || ' is null' ;
     	execute immediate query into nb_val_null  ;
      RETURN(nb_val_null); 
    END;
/

-- M03 : Le nombre de "mots" à considérer dans une colonne

CREATE OR REPLACE PROCEDURE nbMots(tab varchar, nom_col varchar) IS
query varchar(500);
nb_mots number;
TYPE TYP_TAB is table of varchar2(100) ;
nbMots_tab TYP_TAB  ;
BEGIN
query := 'select regexp_count('|| nom_col || ','' '' )+1 from ' ||tab;
EXECUTE IMMEDIATE query BULK COLLECT INTO nbMots_tab ;
FOR I IN nbMots_tab.first..nbMots_tab.last LOOP
DBMS_OUTPUT.PUT_LINE( nbMots_tab(I) ) ;
END LOOP ;

END;
/

-- M04 : Le nombre de valeurs distinctes dans une colonne

set serveroutput on
CREATE OR REPLACE PROCEDURE nbMots_distinct(tab varchar, nom_col varchar) IS
query varchar(500);
nb_mots number;
TYPE TYP_TAB is table of varchar2(100) ;
nbMots_tab TYP_TAB  ;
BEGIN
query := 'select distinct regexp_count('|| nom_col || ','' '' )+1 from ' ||tab;
EXECUTE IMMEDIATE query BULK COLLECT INTO nbMots_tab ;
FOR I IN nbMots_tab.first..nbMots_tab.last LOOP
DBMS_OUTPUT.PUT_LINE( nbMots_tab(I) ) ;
--DBMS_OUTPUT.PUT_LINE(query) ;
END LOOP ;

END;
/

-- M05 : L'unicité des valeurs dans une colonne


-- M06 : La longueur minimale des chaines de caractères dans une colonne

set serveroutput on
CREATE OR REPLACE PROCEDURE min_chaine_car (tab varchar, nom_col varchar) IS
query varchar(500);
min_char number;
BEGIN
query := ' select min(length(' ||nom_col|| '))  from ' || tab ;
execute immediate query into min_char  ;
dbms_output.put_line(min_char);
-- dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_min_chaine_car (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS min_char  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := ' select min(length(' ||nom_col|| ')) from ' || nom_tab  ;
     	execute immediate query into min_char  ;
      RETURN(min_char); 
    END;
/


-- M07 : La longueur maximale des chaines de caractères dans une colonne

CREATE OR REPLACE PROCEDURE max_chaine_car (tab varchar, nom_col varchar) IS
query varchar(500);
max_char number;
BEGIN
query := ' select max(length(' ||nom_col|| '))  from ' || tab ;
execute immediate query into max_char  ;
dbms_output.put_line(max_char);
-- dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_max_chaine_car (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS max_char  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := ' select max(length(' ||nom_col|| ')) from ' || nom_tab ;
     	execute immediate query into max_char ;
      RETURN(max_char); 
    END;
/

-- M08 : La longueur moyenne des chaines de caractères dans une colonne

set serveroutput on
CREATE OR REPLACE PROCEDURE avg_chaine_car (tab varchar, nom_col varchar) IS
query varchar(500);
avg_char number;
BEGIN
query := ' select avg(length(' ||nom_col|| ')) from ' || tab ;
execute immediate query into avg_char  ;
dbms_output.put_line(avg_char);
-- dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_avg_chaine_car  (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS moy_char  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := ' select avg(length(' ||nom_col|| '))from ' || nom_tab ;
     	execute immediate query into moy_char ;
      RETURN(moy_char); 
    END;
/

-- M09 : La valeur minimale des numériques dans une colonne

set serveroutput on
CREATE OR REPLACE PROCEDURE min_numerique (tab varchar, nom_col varchar) IS
query varchar(500);
min_num number;
BEGIN
query := 'select min (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1))) from ' || tab ;
execute immediate query into min_num  ;
dbms_output.put_line(min_num);
--dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_min_numerique  (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS min_num  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select min (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1))) from ' || nom_tab ;
     	execute immediate query into min_num ;
        RETURN(min_num); 
    END;
/

-- M10 : La valeur maximale des numériques dans une colonne

CREATE OR REPLACE PROCEDURE max_numerique (tab varchar, nom_col varchar) IS
query varchar(500);
max_num number;
BEGIN
query := 'select max (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1)))  from ' || tab ;
execute immediate query into max_num  ;
dbms_output.put_line(max_num);
--dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_max_numerique (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS max_num  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select max (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1))) from ' || nom_tab ;
     	execute immediate query into max_num ;
        RETURN(max_num); 
    END;
/


-- M11 : La valeur moyenne des numériques dans une colonne

CREATE OR REPLACE PROCEDURE avg_numerique (tab varchar, nom_col varchar) IS
query varchar(500);
avg_num number;
BEGIN
query := 'select avg (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1))) from ' || tab ;
execute immediate query into avg_num  ;
dbms_output.put_line(avg_num);
--dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_avg_numerique (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS avg_num  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select avg (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1))) from ' || nom_tab ;
     	execute immediate query into avg_num ;
        RETURN(avg_num); 
    END;
/

-- M12 : La valeur médiane des numériques dans une colonne

set serveroutput on
CREATE OR REPLACE PROCEDURE median_numerique (tab varchar, nom_col varchar) IS
query varchar(500);
median_num number;
BEGIN
query := 'select median (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1))) from ' || tab ;
execute immediate query into median_num  ;
dbms_output.put_line(median_num);
--dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_median_numerique  (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS median_num  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select median (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1)))  from ' || nom_tab ;
     	execute immediate query into median_num ;
        RETURN(median_num); 
    END;
/

-- M13 : La valeur de l'écart type des numériques dans une colonne

set serveroutput on
CREATE OR REPLACE PROCEDURE ecartType_numerique (tab varchar, nom_col varchar) IS
query varchar(500);
ecartType_num number;
BEGIN
query := 'select stddev (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1))) as ecartType_numerique from ' || tab ;
execute immediate query into ecartType_num  ;
dbms_output.put_line(ecartType_num);
--dbms_output.put_line(query) ;

END;
/

CREATE OR REPLACE FUNCTION Fun_ecartType_numerique  (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS ecartType_num  NUMBER(11,2);
	query varchar(500);
   BEGIN 
	query := 'select stddev (length (SUBSTR('|| nom_col ||', regexp_instr('|| nom_col ||', ''[[:digit:]]*$''), Length('|| nom_col ||') - regexp_instr('|| nom_col ||', ''[[:digit:]]*$'') + 1)))  from ' || nom_tab ;
     	execute immediate query into ecartType_num ;
        RETURN(ecartType_num); 
    END;
/

-- M14 : La valeur minimale des dates (la plus ancienne) dans une colonne


CREATE OR REPLACE PROCEDURE Val_Min_date(tab varchar, nom_col varchar) IS
query varchar(500);
dateMin varchar(50);
BEGIN
query := 'select min ( '||nom_col||') from ' || tab;
execute immediate query into dateMin  ;
dbms_output.put_line(dateMin);
END;
/

CREATE OR REPLACE FUNCTION Fun_Min_date (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS dateMin varchar(50);
	query varchar(500);
   BEGIN 
	query := 'select min ( '||nom_col||') from ' || nom_tab;
     	execute immediate query into dateMin ;
        RETURN(dateMin); 
    END;
/

-- M15 : La valeur maximale des dates (la plus récente) dans une colonne


CREATE OR REPLACE PROCEDURE Val_Max_date(tab varchar, nom_col varchar) IS
query varchar(500);
dateMax varchar(50);
BEGIN
query := 'select max ( '||nom_col||') from ' || tab;
execute immediate query into dateMax   ;
dbms_output.put_line(dateMax );
END;
/

CREATE OR REPLACE FUNCTION Fun_Max_date (nom_col IN varchar, NOM_TAB IN VARCHAR )
   RETURN NUMBER 
   IS dateMax varchar(50);
	query varchar(500);
   BEGIN 
	query := 'select min ( '||nom_col||') from ' || nom_tab;
     	execute immediate query into dateMax ;
        RETURN(dateMax); 
    END;
/


-- M16 : Le nombre de lignes qui respectent une condition ou des conditions donnée(s) avec le taux

select count(*) as nbLigne_condition, constraint_name, constraint_type
from user_constraints
where table_name = 'PNNP'
group by
constraint_name, constraint_type;


-- ================================================================================
-- Tests des fonctions utilisees pour les mesures inserees dans la table systeme DIAGNOTAB
-- ================================================================================

--  M01
select Fun_numLigne ('col?','tab?') from dual ;

-- M02
select Fun_nbEltNull('col?','tab?') from dual ;

-- M06
select Fun_min_chaine_car('col?','tab?') from dual ;

-- M07
select Fun_max_chaine_car('col?','tab?') from dual ;

-- M08
select Fun_avg_chaine_car('col?','tab?') from dual ;

-- M09
select Fun_min_numerique('col?','tab?') from dual ;

-- M10
select Fun_max_numerique('col?','tab?') from dual ;

-- M11
select Fun_avg_numerique('col?','tab?') from dual ;

-- M12
select Fun_median_numerique('col?','tab?') from dual ;

-- M13
select Fun_ecartType_numerique('col?','tab?') from dual ;

-- ================================================================================
--  ************ DIAGNOSTIC // PROFILAGE D'UNE SOURCE DE DONNEES ******************
-- ================================================================================

-- Procedure qui duplique la source des donnees

CREATE OR REPLACE PROCEDURE duplique(tab varchar) IS
query varchar(500);
BEGIN
query := 'create table '||tab||'PRIM AS SELECT * from ' || tab;
execute immediate query   ;
END;
/

-- Creation de la table systeme DRDIAGNOTAB

DROP TABLE DRDIAGNOTAB ;
create table DRDiagnotab (
	nom_table varchar(20),
	nom_colonne varchar(20),
	type_colonne varchar(20),
	taille_colonne number,
	type_semantique varchar(20),
	M01 NUMBER ,
	M02 NUMBER ,
	M03 NUMBER ,
	M04 NUMBER ,
	M05 NUMBER ,
	M06 NUMBER ,
	M07 NUMBER ,
	M08 NUMBER ,
	M09 NUMBER ,
	M10 NUMBER ,
	M11 NUMBER ,
	M12 NUMBER ,
	M13 NUMBER ,
	M14 NUMBER ,
	M15 NUMBER ,
	date_insertion date, 
	utilisateur varchar(40)
 );


-- Creation de la table utile pour stocker les colonnes des tables dans le curseur. Cette table est utilisée dans les deux procedures INSERT_DIAGNOTAB  et  INSERT_DIAGNOTABCOL

create table intermediaire (
	nom_col varchar(50),
	type_col varchar (50),
	taille_col number 
);

-- Insertion grace à une procedure automatisée des differents champs dans la table systeme DIAGNOTAB. Ainsi nous avons besoin que du Nom de la table pour lancer la procedure, ce qui la rend generale.

CREATE OR REPLACE PROCEDURE INSERT_DIAGNOTAB (tab VARCHAR2) IS
query1 varchar(1000);
query2 varchar(1000);
query3 varchar(1000);
query4 varchar(1000);
query5 varchar(1000);
CURSOR CUR IS
SELECT nom_col,type_col,taille_col from intermediaire ;
col_courrante varchar (50) ;
type_courrant varchar (50) ;
taille_courrante number ;
existe number ;


BEGIN   

 query1 := 'insert into intermediaire (nom_col, type_col, taille_col) SELECT column_name, data_type, data_length FROM USER_TAB_COLUMNS
									WHERE table_name =  '''||tab ||''' ';
 execute immediate query1  ;

 query2 := ' SELECT COUNT(*) FROM DRdiagnotab where nom_table = '''||tab ||''' ' ;
	execute immediate query2 INTO EXISTE  ;
 open CUR ;
LOOP
    FETCH CUR INTO col_courrante, type_courrant,taille_courrante ;
    EXIT WHEN CUR%NOTFOUND;
    query3 := ' insert into DRdiagnotab (nom_table,nom_colonne,type_colonne, taille_colonne,M01,M02,M06,M07,M08, M09, M10,M11,M12,M13, DATE_INSERTION, UTILISATEUR)
		SELECT  '''||tab ||''' ,
			'''||col_courrante||''' ,
			'''||type_courrant||''',
			'''||taille_courrante||''',
			 Fun_numLigne ('''||col_courrante||''','''||tab||''') ,
			 Fun_nbEltNull('''||col_courrante||''','''||tab||''') ,
			 Fun_min_chaine_car('''||col_courrante||''','''||tab||''') ,
			 Fun_max_chaine_car('''||col_courrante||''','''||tab||''') ,
			 Fun_avg_chaine_car ('''||col_courrante||''','''||tab||''') ,
            		 Fun_min_numerique ('''||col_courrante||''','''||tab||''')  ,
			 Fun_max_numerique ('''||col_courrante||''','''||tab||''')  ,
			 Fun_avg_numerique ('''||col_courrante||''','''||tab||''') ,
			 Fun_median_numerique ('''||col_courrante||''','''||tab||''') ,
			 Fun_ecartType_numerique ('''||col_courrante||''','''||tab||''') ,
			 sysdate ,
			 user from dual 
			 ';
	query4 := ' update DRdiagnotab set
			nom_table = '''||tab ||''',
			nom_colonne = '''||col_courrante||''' ,
			type_colonne = '''||type_courrant||''',
			taille_colonne = '''||taille_courrante||''',
			M01 = (select Fun_numLigne ('''||col_courrante||''','''||tab||''') from dual) ,
			M02 = (select Fun_nbEltNull('''||col_courrante||''','''||tab||''') from dual),
			M06 = (select Fun_min_chaine_car('''||col_courrante||''','''||tab||''') from dual) ,
			M07 = (select Fun_max_chaine_car('''||col_courrante||''','''||tab||''') from dual) ,
			M08 = (select Fun_avg_chaine_car ('''||col_courrante||''','''||tab||''') from dual) ,
			M09 = (select Fun_min_numerique ('''||col_courrante||''','''||tab||''')  from dual) ,
			M10 = (select Fun_max_numerique ('''||col_courrante||''','''||tab||''') from dual) ,
			M11 = (select Fun_avg_numerique ('''||col_courrante||''','''||tab||''') from dual ),
			M12 = (select Fun_median_numerique ('''||col_courrante||''','''||tab||''') from dual ),
			M13 = (select Fun_ecartType_numerique ('''||col_courrante||''','''||tab||''') from dual),
			DATE_INSERTION = sysdate ,
			UTILISATEUR = (select user from dual )'
			;
	if existe > 0 then
	execute immediate query4 ;
	else
	execute immediate query3 ;
	end if ;
  END LOOP; 
  CLOSE CUR;
    query5 := ' delete from intermediaire ' ;
	execute immediate query5 ;

END;
/

-- Creation de la table systeme DRDIAGNOTABCOL


DROP TABLE DRDIAGNOTABCOL ;
create table DRDIAGNOTABCOL (
	nom_table varchar(20),
	nom_colonne varchar(20),
	valeur_colonne varchar(50),
	occurence_valeur number,
	ratio number ,
	date_insertion date, 
	utilisateur varchar(40)
 );


-- Insertion grace à une procedure automatisée des differents champs dans la table systeme DIAGNOTABCOL. Ainsi nous avons besoin que du Nom de la table pour lancer la procedure, ce qui la rend generale.

CREATE OR REPLACE PROCEDURE INSERT_DIAGNOTABCOL (tab VARCHAR) IS
query1 varchar(1000);
query2 varchar(1000);
query3 varchar(1000);
CURSOR CUR1 IS
SELECT nom_col from intermediaire ;
col_courrante varchar(200) ;

BEGIN
query1 := 'insert into intermediaire (nom_col) SELECT column_name
						FROM USER_TAB_COLUMNS
						WHERE table_name =  '''||tab ||''' ';
execute immediate query1  ;
open CUR1 ;
LOOP
FETCH CUR1 INTO col_courrante;
EXIT WHEN CUR1%NOTFOUND;

query2 := 'insert into DRDiagnotabcol (nom_table,valeur_colonne, nom_colonne,DATE_INSERTION,  utilisateur ,occurence_valeur) 
 	select distinct '''||tab ||''','|| col_courrante ||', '''|| col_courrante ||''', sysdate,user, count(*) from '|| tab ||' group by '|| 	col_courrante ||' ' ;
execute immediate query2 ;

 query3 := ' delete from intermediaire ' ;
	execute immediate query3 ;

END LOOP;
CLOSE CUR1;
END;
/

-- RATIO : Procedure qui calcule les ratios des occurences de la table de DIAGNOTABCOL
set serveroutput on
CREATE OR REPLACE PROCEDURE INSERT_DIAGNOTABCOL_RATIO (tab VARCHAR) IS
CURSOR CUR IS
SELECT occurence_valeur FROM DRdiagnotabcol;
OCC_courrante varchar(200) ;
query varchar(1000);

BEGIN
open CUR ;
LOOP
FETCH CUR INTO OCC_COURRANTE ;
EXIT WHEN CUR%NOTFOUND;

QUERY := 'UPDATE DRDIAGNOTABCOL D SET RATIO = (SELECT ('||OCC_COURRANTE||')/t.COUNT(*) FROM '||TAB||' T WHERE D.NOM_TABLE = '''|| TAB ||''' )' ;
	execute immediate query ;
END LOOP;
CLOSE CUR;
END;
/

-- Creation de la table systeme DRDIAGNOTABCOLCOL

DROP TABLE DRDIAGNOTABCOLCOL ;
create table DRDIAGNOTABCOLCOL (
	COL1 varchar(20),
	COMPARE varchar(50),
	COL2 varchar(20),
	egale_ratio number,
	sup_ratio number,
	inf_ratio number
 );


-- Procedure qui compare les colonnes d une table

set serveroutput on
CREATE OR REPLACE PROCEDURE INSERT_DIAGNOTABCOLCOL (tab VARCHAR) IS
query1 varchar(1000);
query2 varchar(1000);
TYPE TYP_TAB is table of varchar2(100) ;
colonne_tab TYP_TAB  ;
taille number ;

BEGIN
query1 := ' SELECT column_name FROM USER_TAB_COLUMNS
						WHERE table_name =  '''||tab ||''' ';
execute immediate query1 BULK COLLECT INTO colonne_tab ;
taille := colonne_tab.count ;
FOR I IN 1..taille LOOP
	for J in I .. taille loop
	--DBMS_OUTPUT.PUT_LINE( colonne_tab(I) ) ;
	query2 :=' INSERT INTO DRDIAGNOTABCOLCOL (COL1, COMPARE, COL2)
			select '''||colonne_tab(I)||''',
			CASE 
			WHEN '||colonne_tab(I)||' > '||colonne_tab(J)||' THEN 
			''>'' 
			WHEN '||colonne_tab(I)||' < '||colonne_tab(J)||' THEN 
			''<'' 
			WHEN '||colonne_tab(I)||' = '||colonne_tab(J)||' THEN 
			''='' 
			END ,
			'''||colonne_tab(J)||'''
			from '||TAB;
	--DBMS_OUTPUT.PUT_LINE( query2 ) ;
	execute immediate query2 ;
	
	end loop ;
END LOOP ;
INSERT INTO DRDIAGNOTABCOLCOL (egale_ratio, sup_ratio, inf_ratio)
			select 
			sum(case when compare = '=' then 1 else 0 end)/count(*) as eg,
			sum(case when compare = '>' then 1 else 0 end)/count(*) as sup,
			sum(case when compare = '<' then 1 else 0 end)/count(*) as inf
			from DRdiagnotabcolcol ;	
END;
/


-- Trouver le type sémantique 

-- procedure qui trouve le type sémantique de chaque colonne d'une table ET L'INSERE DANS DRDIAGOTAB 

CREATE OR REPLACE PROCEDURE INSERT_DIAGNOTAB_TYPE (tab VARCHAR2) IS
query1 varchar(1000);
query2 varchar(1000);
query3 varchar(1000);
query4 varchar(1000);
CURSOR CUR IS
SELECT nom_col from intermediaire ;
col_courrante varchar (50) ;

BEGIN   

 query1 := 'insert into intermediaire (nom_col) SELECT column_name FROM USER_TAB_COLUMNS
									WHERE table_name =  '''||tab ||''' ';
 execute immediate query1  ;

 open CUR ;
LOOP
    FETCH CUR INTO col_courrante ;
    EXIT WHEN CUR%NOTFOUND;
    query3 := ' insert into DRdiagnotab (type_semantique) values
		select CASE 
			WHEN exists (SELECT 1 FROM '||tab ||' WHERE REGEXP_LIKE ('|| col_courrante ||', ''^[A-Za-z0-9]+$'')) then
			''VARCHAR'' 
			WHEN exists (SELECT 1 FROM '||tab ||' WHERE REGEXP_LIKE ('|| col_courrante ||', ''^[[:digit:]]+$'')) then
			''NUMBER'' 
			when regexp_instr('|| col_courrante ||', ''^\d/\d/\d{4}$'') = 1 then
        		  ''date''
       			  when regexp_instr('|| col_courrante ||', ''^\d{2}/\d/\d{4}$'') = 1 then
       			   ''date''
      			   when regexp_instr('|| col_courrante ||', ''^\d/\d{2}/\d{4}$'') = 1 then
      			    ''date''
     			    when regexp_instr('|| col_courrante ||', ''^\d{2}/\d{2}/\d{4}$'') = 1 then
     			     ''date''
			END from '||tab ;
	--DBMS_OUTPUT.PUT_LINE( query3 ) ;
	execute immediate query3 ;
 END LOOP; 
  CLOSE CUR;
    query4 := ' delete from intermediaire ' ;
	execute immediate query4 ;

END;
/

-- procedure qui decoupe une colonne 

CREATE OR REPLACE PROCEDURE split (tab VARCHAR2) IS
query varchar(1000);
CURSOR CUR IS
SELECT nom_col from intermediaire ;
col_courrante varchar (50) ;
nb number ;

BEGIN   

 query := 'insert into intermediaire (nom_col) SELECT column_name FROM USER_TAB_COLUMNS
									WHERE table_name =  '''||tab ||''' ';
 execute immediate query  ;

    open CUR ;
    LOOP
    FETCH CUR INTO col_courrante ;
    EXIT WHEN CUR%NOTFOUND;
   	  query := ' select STATS_MODE(regexp_count('|| col_courrante ||','' '')+1) from '||tab ; -- TROUVER LE NOMBRE DES MOTS LE PLUS FREQUENT
  	  execute immediate query into nb ; -- DECOUPER LA COLONNE EN NB MOTS
   	  FOR i IN 1..nb LOOP
 			query := 'alter table '||tab ||' add '|| col_courrante ||''||i||' varchar2(50)' ;
			execute immediate query ;
			query := 'insert into '||tab ||' ('|| col_courrante ||''||i||') SELECT REGEXP_SUBSTR('|| col_courrante ||',''(.*?)([[:space:]]|$)'', 1, '||i||' ) FROM '||tab  ;
			execute immediate query ;
	 end loop ;
    END LOOP; 
    CLOSE CUR;
    query := ' delete from intermediaire ' ;
    execute immediate query ;

END;
/

-- Creation de la table HISTORY
DROP TABLE HISTORY ;
create table HISTORY (category varchar(100), valeur varchar(100), occurence varchar(100));

drop table intermediaire ;
create table intermediaire (
	nom_col varchar(50)
);

-- Procedure qui insere les données dans la table HISTORY 

CREATE OR REPLACE PROCEDURE INSERT_HISTORY (tab VARCHAR) IS
query varchar(1000);
CURSOR CUR1 IS
SELECT nom_col from intermediaire ;
col_courrante varchar(200) ;

BEGIN
query := 'insert into intermediaire (nom_col) SELECT column_name
						FROM USER_TAB_COLUMNS
						WHERE table_name =  '''||tab ||''' ';
execute immediate query  ;
open CUR1 ;
LOOP
FETCH CUR1 INTO col_courrante;
EXIT WHEN CUR1%NOTFOUND;

query := 'insert into HISTORY ( valeur, occurence) 
 	select distinct '|| col_courrante ||', count(*) from '|| tab ||' group by '|| 	col_courrante ||' ' ;
execute immediate query ;

END LOOP;
CLOSE CUR1;

query := 'create table temp (category, valeur) as SELECT DDVS.CATEGORY, HISTORY.VALEUR FROM DDVS, HISTORY
WHERE DDVS.FRENCH = HISTORY.VALEUR 
union
SELECT DDVS.CATEGORY, HISTORY.VALEUR FROM DDVS, HISTORY
WHERE DDVS.english = HISTORY.VALEUR 
union
SELECT DDVS.CATEGORY, HISTORY.VALEUR FROM DDVS, HISTORY
WHERE DDVS.abreviation = HISTORY.VALEUR ';
	execute immediate query ;

query := ' UPDATE history H SET category = (select T.category from temp T where t.valeur= h.valeur) ';
execute immediate query ;

query := ' drop table temp ' ;
    execute immediate query ;

query := ' delete from intermediaire ' ;
    execute immediate query ;
END;
/



SET pagesize 9999
SET linesize 9999

COL N  FORMAT A10
COL PR FORMAT A10
COL S  FORMAT A2
COL CI FORMAT A5
COL M  FORMAT A10
COL T  FORMAT A10
COL V  FORMAT A10
COL P  FORMAT A10
COL DN FORMAT A10
COL W  FORMAT A10
COL G  FORMAT A10


-- ************************************************************************************************
-- SIMULATION D'UN DIAGNOSTIC SUR LA TABLE DS1

TTITLE 'Affichage des donees de la table DS1'
select * from DS1;

TTITLE 'DUPPLIQUER LA TABLE DS1'
EXEC DUPLIQUE('DS1') 

TTITLE 'Affichage des données de la table DS1PRIM';
select * from DS1PRIM;

TTITLE 'CALCULER LES MESURES ET LES INSERER DANS DRDIAGNOTAB'
EXEC INSERT_DIAGNOTAB('DS1PRIM')

TTITLE 'TROUVER LE TYPE SEMANTYQUE DE CHAQUE COLONNE ET L INSERER DANS DRDIAGNOTAB'
EXEC INSERT_DIAGNOTAB_TYPE ('DS1PRIM') 

TTITLE 'Affichage des données de la table DRDIAGNOTAB ';
select * from DRDIAGNOTAB;

TTITLE'INSERTION DANS DRDIAGNOTABCOL'
EXEC INSERT_DIAGNOTABCOL ('DS1PRIM') 

TTITLE'CALCULER LES RATIOS ET LES INSERER DANS DRDIAGNOTABCOL'
EXEC INSERT_DIAGNOTABCOL_RATIO('DS1PRIM') 

TTITLE 'Affichage des données de la table DRDIAGNOTABCOL'
SELECT * FROM DRDIAGNOTABCOL ;

TTITLE 'COMPARER LES COLONNES ET INSERER LE RESULTA DANS DRDIAGNOTABCOLCOL'
EXEC INSERT_DIAGNOTABCOLCOL ('DS1PRIM')

TTITLE ' Affichage des données de la table DRDIAGNOTABCOLCOL'
SELECT * FROM DRDIAGNOTABCOLCOL ; 

TTITLE 'DECOUPER LES COLONNES DE LA TABLE'
EXEC SPLIT ('DS1PRIM')  

TTITLE 'INSERER DANS LA TABLE HISTORY LA CATÉGORIE, LA VALEUR ET L''OCCURENCE DE CHAQUE VALEUR DE LA TABLE DS1PRIM '
EXEC INSERT_HISTORY('DS1PRIM') 

SET pagesize 9999
SET linesize 9999

COL CATEGORY  FORMAT A10
COL VALEUR    FORMAT A10
COL OCCURENCE FORMAT A10

TTITLE ' Affichage des données de la table DS1PRIM'
SELECT * FROM HISTORY ;

TTITLE OFF


-- ======================================================================================
-- ===========  Exemples : DETECTION & CORRECTION DES ANOMALIES DANS LES DONNEES ========
-- ======================================================================================


-- =============================================================================== 
-- =============================================================================== 
-- =============================================================================== 
-- ===========  Exemple 1 : DETECTION & CORRECTION DES ANOMALIES DANS LES DONNEES
-- ===========  The Data Source is : DS1
-- =============================================================================== 
-- =============================================================================== 
-- =============================================================================== 

DROP TABLE DS1 ;
CREATE TABLE DS1 
   (	N VARCHAR2(50), 
	PR VARCHAR2(50), 
	S VARCHAR2(10), 
	CI VARCHAR2(15), 
	M VARCHAR2(200), 
	T VARCHAR2(20), 
	V VARCHAR2(50), 
	P VARCHAR2(50), 
	DN VARCHAR2(20), 
	W VARCHAR2(200), 
	G VARCHAR2(20),
	DPC VARCHAR2(20),
	DDC VARCHAR2(20),
        FL VARCHAR2(100)
   );


Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values 
('Sweden','Abir','f','m','abir@gmail.com','+33698068000','Londres','Royaume-Uni','5/3/2000','www.hot mail.fr','m', '17/09/2007', '12/12/2012','Sweden Abir');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values 
('Hamon','Maria','f','Mrs','tayyara@gmail.com','6999','London','Royaume-Uni','5/7/1999','(null)','Mrs', '17/09/2007', '12/12/2012','Hamon     Maria');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values 
('Ben','Aicha','f','mme','(null)','0653545555','Epinay sur seine','France','(null)','(null)','mme', '17/09/2007', '12/12/2012', 'Ben Aicha');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Grande','Clémence','f','madame','clemence@gmail.com','0607080911',null,null,'(null)','boufares@lipn.fr','madame', '17/09/2007', '12/12/2012', 'Grande Clémence');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values 
('Adam','LeBon','m','m','(null)','0653545551','Epinay sur seine','France','5/2/1999','(null)','m', '17/09/2007', '12/12/2012', 'Adam    LeBon');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Grande','Clémence','f','m','clemence@gmail.com','0607080911','Londres','UK','02.02.2004','www.talend.com','m', '17/09/2007', '12/12/2012', 'Grande Clémence');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values 
('Le Bon','126','m','mlle','adam@yahoo.fr','0653545577','Epinay Villetaneuse','newvalue2','2/1/2005','www.galilee.fr','mlle', '17/09/2007', '12/12/2012', 'Le Bon 126');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values 
('Hollande','R.','m','mme','saintr@yhoo.fr','0708091122','Epinay-sur-seine','France','02.03.1960','(null)','mme', '17/09/2007', '12/12/2012', 'Hollande R.');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values 
('Tunsi','Rahma','0','mme','(null)','(null)','Qatar',null,'(null)','www.gmail.com','mme', '17/09/2007', '12/12/2012', 'Tunsi Rahma');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values 
('ESPAGNE','Emir','1','mme','(null)','(null)','Pékin','Chine','(null)','(null)','mme', '17/09/2007', '12/12/2012', 'ESPAGNE    Emir');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Traifor','Eve','0','m','traifor@up13.fr','0666622223','Beijing','China','2/1/2003','(null)','m', '17/09/2007', '12/12/2012', 'Traifor Eve');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Ben','Lydia','1','m','traifor@up13.fr','+33666622223','Paris','France','(null)','www.lipn.com','m', '17/09/2007', '12/12/2012', 'Ben Lydia');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Silence','marie','1','mlle','alebon@up13.fr','0653545500','Londres',null,'6/5/2001','(null)','mlle', '17/09/2007', '12/12/2012', 'Silence marie');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values 
('MAROK','Adam','m','mme','adam@obsolete.uk','(null)','LA','USA','(null)','(null)','mme', '17/09/2007', '12/12/2012', 'MAROK Adam');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values 
('Paris','H.','f','mme','paris@live.fr','0670804865','Paris','Paris','3/2/2009','(null)','mme', '17/09/2007', '12/12/2012', 'Paris H.');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Unique','Adam','1','mme','adam@gmail.com','+33606068009','Paris','Paris','(null)','www.ensias.ma','mme', '17/09/2007', '12/12/2012', 'Unique Adam');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Sweden','Abir','f','m','abir@gmail.com','+33698068000','Paris','Paris','5/3/2000','www.hotmail.fr','m', '17/09/2007', '12/12/2012', 'Sweden Abir');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values 
('HAMON','Sylvie','m','m','abir@gmail.com','69806','Paris','Paris','2/2/2003','(null)','m', '17/09/2007', '12/12/2012', 'HAMON Sylvie');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Tayyara','Faouzi','m','mlle','tayyara@gmail.com','+33699921456','Pariss','null','6/5/1999','www.yahoo.fr','mlle', '17/09/2007', '12/12/2012', 'Tayyara     Faouzi');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Bouffe','Aimé','1','mme','tayyara@gmail.com','6999','Paris','Franca1','(null)','www.tunis.tn','mme', '17/09/2007', '12/12/2012', 'Bouffe Aimé');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Serafoub','Clemence','f','mme','tayyara@gmail.com','+33699958961','Bnp','(null)','(null)','www.facebook.com','mme', '17/09/2007', '12/12/2012', 'Serafoub Clemence');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Bouffe','Yohan','1','mme','tayyara@gmail.com','6999','Baris','Fcb','3/21/1987','www.google.com','mme', '17/09/2007', '12/12/2012', 'Bouffe Yohan');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Serafoub','Izouaf','1','m','tayyara@gmail.com','0699978325','Casablanca','Maroc','6/3/2012','www.lg.fr','m', '17/09/2007', '12/12/2012', 'Serafoub Izouaf');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Hamon','maria','f','m','tayyara@gmail.com','6999','Zarzis','Tunisie','5/7/1999','www.mars.it','m', '17/09/2007', '12/12/2012', 'Hamon maria');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Paris','eve','f','mlle','eveparis@gmail.com','0611223344','djerba','Tunisia','2/2/2003','www.atos.com','mlle', '17/09/2007', '12/12/2012', 'Paris eve');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Grande','Clémence','f','m','clemence@gmail.com','0607080911','Londres','UK','02.02.2004','www.talend.com','m', '17/09/2007', '12/12/2012', 'Grande Clémence');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Grande','Clémence','f','m','clemence@gmail.com','0607080911','Londres','UK','02.02.2004','www.talend.com','m', '17/09/2007', '12/12/2012', 'Grande Clémence');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Grande','Clémence','f','m','clemence@gmail.com','0607080911','Londres','UK','02.02.2004','www.talend.com','m', '17/09/2007', '12/12/2012', 'Grande Clémence');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Grande','Clémence','f','m','clemence@gmail.com','0607080911','Londres','RU','02.02.2004','www.ta lend.com','m', '17/09/2007', '12/12/2000', 'Grande Clémence');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Grande','Clémence','f','madame','clemence@gmail.com','0607080911',null,null,'(null)','boufares@lipn.fr','madame', '17/09/2007', '12/12/2012', 'Grande Clémence');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Grande','Clémence','f','madame','clemence@gmail.com','0607080911',null,null,'(null)','boufares@lipn.fr','madame', '17/09/2007', '12/12/2012', 'Grande Clémence');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Grande','Clémence','f','mdame','clemence@gmail.com','0607080911',null,null,'(null)','boufares@lipn.fr','madame', '17/09/2007', '12/12/2012', 'Grande Clémence');
Insert into DS1 (N,PR,S,CI,M,T,V,P,DN,W,G, DPC, DDC, FL) values ('Grande','Clémence','f','madame','clemence@gmail.com','0607080911',null,null,'(null)','boufares@lipn.fr','mdame', '17/09/2007', '12/12/2012', 'Grande Clémence');
COMMIT;

COL N   FORMAT A10
COL PR  FORMAT A10
COL S   FORMAT A2
COL CI  FORMAT A5
COL M   FORMAT A10
COL T   FORMAT A10
COL V   FORMAT A10
COL P   FORMAT A10
COL DN  FORMAT A10
COL W   FORMAT A10
COL G   FORMAT A10
COL DPC FORMAT A10
COL DDC FORMAT A10
COL FL  FORMAT A20


select * from DS1;

-- =============================================================================== 
-- =============================================================================== 
-- =============================================================================== 
-- ===========  Exemple 2 : DETECTION & CORRECTION DES ANOMALIES DANS LES DONNEES
-- ===========  The Data Source is : DS2
-- =============================================================================== 
-- =============================================================================== 
-- =============================================================================== 

DROP TABLE DS2;

CREATE TABLE DS2 
(
Col1 VARCHAR2(30), 
Col2 VARCHAR2(30), 
Col3 VARCHAR2(30),
Col4 VARCHAR2(30)
); 


INSERT INTO DS2 VALUES ('Adam LeBon', 'LeBon Adam', '75013 Paris', '10-11-2016');
INSERT INTO DS2 VALUES ('Clémence Belle', 'Belle Clémence', '75014 Paris', '10-11-2016');
INSERT INTO DS2 VALUES ('Eve Premier', 'Premier Eve', '75015 Paris', '10-11-2016');
INSERT INTO DS2 VALUES ('Linda Traifor', 'Traifor Linda', '06 Nice', '10-11-2016');
INSERT INTO DS2 VALUES ('Bernard Hugues et Leila', 'Hugues et Leila Bernard', '', '10-11-2016');
INSERT INTO DS2 VALUES ('Inès La Meilleure', 'La Meilleure Inès', '93430 Villetaneuse', '10-NOV-2016');
INSERT INTO DS2 VALUES ('Grande Sonia', 'Sonia Grande', '', '10-11-2016');
INSERT INTO DS2 VALUES ('Houda ZiZOU', 'ZiZOU Houda', '75019 Paris', '10-11-2016');
INSERT INTO DS2 VALUES ('Jean-Michel Ange', 'Ange Jean-Michel', '75019 Paris', '10-11-2016');
INSERT INTO DS2 VALUES ('Marie Noel DOUBLE', 'DOUBLE Marie Noel', ', '10-11-2016'');
INSERT INTO DS2 VALUES ('', '', '94310 Orly-Ville', '10-NOV-2016');
INSERT INTO DS2 VALUES ('Seule', 'Seule', '', '10-11-2016');
INSERT INTO DS2 VALUES ('Seule', 'Seule', 'Marseille');
INSERT INTO DS2 VALUES ('', '', '13 Marseille', '10-11-2016');
INSERT INTO DS2 VALUES ('Unique', 'Unique', '13001 Marseille', '10-11-2016');
INSERT INTO DS2 VALUES ('Unique', 'Unique', '', '10-11-2016');
INSERT INTO DS2 VALUES ('Faouzi', 'Faouzi', 'Nantes 99999', '10-11-2016');
INSERT INTO DS2 VALUES ('Alain Deloin', 'Deloin Alain', '75019 Paris', '10-NOV-2016');
INSERT INTO DS2 VALUES ('Joseph JOJO', 'JOJO Joseph', 'Paris 75015', '10-11-2016');
INSERT INTO DS2 VALUES ('Yann NOUHA', 'NOUHA Yann', '94310 Orly-Ville', '10-11-2016');
INSERT INTO DS2 VALUES ('Michel BARAka', 'BARAka Michel', '94310 Orly-Ville', '10-11-2016');
INSERT INTO DS2 VALUES ('Clément CLEMENTINE', 'CLEMENTINE Clément', '94310 Orly Ville', '10-11-2016');
INSERT INTO DS2 VALUES ('Eve JOLIE', 'JOLIE Eve', '', '10-11-2016');
INSERT INTO DS2 VALUES ('Adam BEAU', 'BEAU Adam', '93430 Villetaneuse', '10-11-2016');
INSERT INTO DS2 VALUES ('Céline PION', 'PION Céline', '93430 Villetaneuse', '10-11-2016');
INSERT INTO DS2 VALUES ('Adam DOUBLE', 'DOUBLE Adam', '75013 Paris', '10-11-2016');
INSERT INTO DS2 VALUES ('Adam DOUBLE', 'DOUBLE Adam', '75013 Paris', '10-11-2016');
INSERT INTO DS2 VALUES ('Adam DOUBLE', 'DOUBLE Adam', '75013 Paris', '10-11-2016');
INSERT INTO DS2 VALUES ('Adem DOUBLE', 'DOUBLE Adam', '75013 Paris', '10-11-2016');
INSERT INTO DS2 VALUES ('Adam DOUBLE', 'DOUBLE Adam', '75013 Paris', '10-NOV-2016');
INSERT INTO DS2 VALUES ('Adam DOUBLE', 'DOUBLE Adam', '75013 Paris', 'jj-mmm-aaaa');
INSERT INTO DS2 VALUES ('Adam DOUBLE', 'DOUBLE Adam', '75013 Paris', '11-10-2016');
INSERT INTO DS2 VALUES ('Adam DOUBLE', 'DOUBLE Adam', '75013 Paris', '2016-11-10');

COMMIT;


select * from DS2;



