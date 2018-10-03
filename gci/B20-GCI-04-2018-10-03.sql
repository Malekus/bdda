-- ===============================================================================
-------- Université Sorbonne Paris Cité, Université Paris 13 , Institut Galiée
-------- Master 2, Informatique, Exploration Informatique des Données et Décisionnel
-------- M2 EID2

-- ===============================================================================
-------- La Data ; The Data
-------- La Donnée est le monde du futur ; Les données et le monde de l'avenir
-------- The Data is the world of the future ;  The Data and the future's world

-------- DATA -->>> Big Data, Dark Data, Open Data, ... 
-- ===============================================================================
-------- Bases de Données Avancées = Advanced Databases (BDA)
-------- Entrepôts de Données = Data Warehouses (DWH, EDON)

-------- Directeur :  Dr. M. Faouzi Boufarès
-------- Enseignant-Chercheur Responsable      

-------- Page Web : http://www.lipn.univ-paris13.fr/~boufares

-------- http://www.lipn.univ-paris13.fr/~boufares/Master2EID2/*.sql

-- ===============================================================================
-- ===============================================================================
--   Projet  BDM : Big Data Management - Gestion des Données Massives
--
--   Data Manipulation (DI) - Manipulation de Données
--   Data Integration (DI) - Intégration de Données
--   Données structurées ; Données Semi-structurées ; Données NON structurées
--   Structured data; Semi-structured data; NON-structured data

--   Master Data Management (MDM) - Gestion des Données de Référence
--   Data Quality Managment (DQM) - Gestion de la qualité des données
--   Data Cleaning - Nettayage des données
--   Data deduplication - Elimination des doubles et des similaires

--   More semantics to better correct the data 
--   Plus de sémantique afin de mieux corriger les données
-- ===============================================================================
-- ===============================================================================
--
--------=============  BIG DATA, DATA BASE, DATA WAREHOUSE =============----------
--
-- Big Data & Clound Computing : Think DIFFERENTLY, BIGGER and SMARTER !
-- The Excellence in Data Use !
-- EID : L'Excellence dans l'Investigation des Données
-- EID : Excellence in Data Investigation
--
-- =============================================================================== 
-- Think DIFFERENTLY, BIGGER and SMARTER ! The Excellence in Data Use !
-- MISSION IMPOSSIBLE OU POSSIBLE ????? !!!!!!!!!!!
-- Votre mission, si vous l’acceptez, est : The Excellence in Data Use !
-- Si vous échouez, nous nierons avoir eu connaissance de vos agissements !

-- ===============================================================================
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
--   A new ETL   ETL & DQ : Extract-Transform-Load & Data-Quality 
--                    Al ETL Al Jadyd   
-- ===============================================================================
-- ===============================================================================

-- =============================================================================== 
-- =============================================================================== 
-- ===============================================================================                   
--   Nom du SGBD/DBMS  : ORACLE  /  DB2  /  MySQL  /  ...        
--   Date de creation  : 17/09/2018
---  Lieu              : Université Sorbonne Paris Cité, Université Paris 13, Institut Galiée
-- =============================================================================== 
-- ===============================================================================
-------------------- Master 2 EID2 - Promotion 2018-2019 -------------------------

-- Groupe de Travail N° (Binôme)  : Bxy

-- NOM Prénom 1                   : np1
-- NOM Prénom 2                   : np2

-- ====>>> Vos fichiers sql devront s'appeler : Bxy-GCI-04.sql


-- =============================================================================== 
-- ===============================================================================
-- ===============================================================================
--   Problématique    :  Intégration de données hétérogènes, distribuées

--   Problématique    :  Traitement des anomalies éventuelles
--   Problématique    :  Plusieurs types d'anomalies INTRA-Colonne ; INTER-COLONNES ; INTER-LIGNES

--   Problématique    :  Standardisation de données hétérogènes
--   Problématique    :  Traitement des valeurs invalides syntaxiquement
--   Problématique    :  Traitement des valeurs invalides sémantiquement
--   Problématique    :  Traitement des valeurs nulles
--   Problématique    :  Traitement des redondances sémantiques (Dépendances fonctionnelles)
--   Problématique    :  Elimination des doubles et similaires

-- =============================================================================== 
-- ===============================================================================
-- ===============================================================================   
-- =============================================================================== 
-- ===============================================================================


-- *******************************************************************************
-- *******************************************************************************
-- *******************************************************************************
--       SQL 2 --     SQL 2 -- --       SQL 2 --     SQL 2 -- 
--       SQL 2 --     SQL 2 -- --       SQL 2 --     SQL 2 -- 
-- *******************************************************************************
-- *******************************************************************************
-- *******************************************************************************




PROMPT =========================================================
-- Nom du Cas       :  Gestion Commerciale Intelligente : GESCOMI : GCI
-- Nom de SGBD      :  ORACLE DBMS                    
-- Date de création :  Septembre 2018
-- Auteur           :  Faouzi BOUFARES 
-- Université       :  Université Sorbonne Paris Cité, Université Paris 13 
-- Formation        :  Master 2 EID 2  
PROMPT =========================================================


-- ===============================================================================
-- Définition de la structure des données ================= DEBUT    =============
-- en SQL 2 ======================================================================
-- Création des tables ============= Magasin FR01 ====== PARIS   =================

SPOOL GCI-04.lst

SET TIMING ON;
SET LINES 1000
SET PAGES 1000

PROMPT 
PROMPT =========================================================
PROMPT |                                                       |
PROMPT |     Exercice 2 :  BD GESCOMI***DW avec SQL 2          |
PROMPT |     Exercice 2 :  Le schéma en étoile avec SQL 2      |
PROMPT |                                                       |
PROMPT =========================================================
PROMPT
PROMPT

PROMPT =========================================================
PROMPT Ceci permet d initialiser le type de la date
PROMPT =========================================================
ALTER SESSION SET NLS_DATE_FORMAT = 'DAY DD-MONTH-YYYY' ;
PROMPT =========================================================


PROMPT =====================================================================
PROMPT Suppression des tables de la bd GesComI***DW EN SQL 2
PROMPT =====================================================================
PROMPT


DROP TABLE VENTES_DW2;
DROP TABLE CLIENTS_DW2;
DROP TABLE TEMPS_DW2;
DROP TABLE ARTICLES_DW2;

PROMPT
Pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Suppression des vues de la bd GesComI***DW EN SQL 2
PROMPT =====================================================================
PROMPT
DROP VIEW V1;
DROP VIEW V2;
DROP VIEW V3;

PROMPT
Pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Creation des tables pour la BD GesComI***DW en sql 2
PROMPT =====================================================================
PROMPT

PROMPT =====================================================================
PROMPT >> Table : ARTICLES_DW2
PROMPT =====================================================================
CREATE TABLE ARTICLES_DW2
(
	NUMART		INTEGER,
	NOMART		CHAR(20),
	PUART		NUMBER(7,2),      
   	CONSTRAINT PK_ARTICLES_DW2 		PRIMARY KEY(NUMART),
	CONSTRAINT NN_ARTICLES_DW2_NOMART	CHECK(NOMART IS NOT NULL)
);

PROMPT
pause Tapez sur Enter...
PROMPT

/*
DROP TABLE MAGASINS_DW2;
PROMPT =====================================================================
PROMPT >> Table : MAGASINS_DW2
PROMPT =====================================================================
CREATE TABLE MAGASINS_DW2
(
	Définie précédemment, cf Exercice 1

);

PROMPT
pause Tapez sur Enter...
PROMPT
*/

PROMPT =====================================================================
PROMPT >> Table : TEMPS_DW2
PROMPT =====================================================================
CREATE TABLE TEMPS_DW2
(
	IDTEMPS		INTEGER,
	DATEHEURET	DATE,
	ANNEET 		INTEGER,
	MOIST		INTEGER,
	JOURT		INTEGER,
	CONSTRAINT PK_TEMPS_DW2 	PRIMARY KEY(IDTEMPS)
);

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT >> Table : CLIENTS_DW2
PROMPT =====================================================================
CREATE TABLE CLIENTS_DW2
(
	NUMCLI		INTEGER,
	NOMCLI		CHAR(20),
	TELCLI		CHAR(15),
	ADRNUMCLI	VARCHAR2(10),
	ADRRUECLI	VARCHAR2(50),
	ADRCPCLI	VARCHAR2(10),
	ADRVILLECLI	VARCHAR2(50),
	ADRPAYSCLI	VARCHAR2(50),      
    	CONSTRAINT PK_CLIENTS_DW2 				PRIMARY KEY(NUMCLI),
	CONSTRAINT NN_CLIENTS_DW2_NOMCLI		CHECK(NOMCLI IS NOT NULL),
	CONSTRAINT CK_CLIENTS_DW2_ADRVILLECLI	CHECK(ADRVILLECLI = UPPER(ADRVILLECLI)),
	CONSTRAINT CK_CLIENTS_DW2_ADRPAYSCLI	CHECK(ADRPAYSCLI = UPPER(ADRPAYSCLI))
);

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT >> Table : VENTES_DW2
PROMPT =====================================================================
CREATE TABLE VENTES_DW2 
( 
	NUMVENTE		INTEGER,
	NUMART			INTEGER,
	IDTEMPS			INTEGER,
	NUMCLI			INTEGER,
	MONTANTVENTE	NUMBER(20,4),
	NUMMAG			VARCHAR(4),
	CONSTRAINT PK_VENTES_DW2		      PRIMARY KEY(NUMVENTE),
	CONSTRAINT FK_VENTES_DW2_NUMART_ARTICLES2     FOREIGN KEY(NUMART)  
						      REFERENCES ARTICLES_DW2(NUMART),
	CONSTRAINT FK_VENTES_DW2_NUMMAG_MAGASINS2     FOREIGN KEY(NUMMAG)  
						      REFERENCES MAGASINS_DW2(NUMMAG),
	CONSTRAINT FK_VENTES_DW2_IDTEMPS_TEMPS2       FOREIGN KEY(IDTEMPS) 
						      REFERENCES TEMPS_DW2(IDTEMPS),
	CONSTRAINT FK_VENTES_DW2_NUMCLI_CLIENTS2      FOREIGN KEY(NUMCLI)  
						      REFERENCES CLIENTS_DW2 (NUMCLI)	
);

PROMPT
pause Tapez sur Enter...
PROMPT


-- ===============================================================================
-- Définition de la structure des données =========== FIN     ====================
-- en SQL 2 ======================================================================

-- Insertion des données ===================================================
-- en SQL 2 ================================================================
-- Insertion des lignes dans les tables ====================================

PROMPT
PROMPT =====================================================================
PROMPT Insertion des données de la bd EN SQL 2 POUR UN MAGASIN donné Le FR01 de Paris
PROMPT =====================================================================
PROMPT
PROMPT =====================================================================
PROMPT Insertion des données de la bd GESCOMI***DW EN SQL 2
PROMPT =====================================================================
PROMPT

PROMPT =====================================================================
PROMPT >> Insertion des données de la Table : ARTICLES_DW2
PROMPT =====================================================================
PROMPT
INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (1, 'SIEGE DE TABLE', 35.00);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (2, 'CASQ CYCLIST PROTECT', 27.00);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (3, 'BONNET PARE-CHOCS', 10.71);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (4, 'STORE DE PROTECTION', 7.43);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (5, 'COINS DE PROTECTION', 4.00);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (6, 'CACHE PRISE COURANT', 2.29);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (7, 'BLOQUE PORTE', 5.00);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (8, 'BANDE DE FERMETURE', 3.29);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (9, 'PROTECTION DE FOUR', 37.86);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (10, 'PROTECT CUISINIERE', 30.71);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (11, 'BABY PHONE', 80.71);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (12, 'BRETELLE DE SECURITE', 15.57);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (13, 'HAUSSE-CHAISE', 42.71);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (14, 'COUVRE ROBINETTERIE', 7.86);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (15, 'BARR PORTE, EN BOIS', 32.71);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (16, 'BARR PORTE, EN METAL', 49.14);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (17, 'BARRIERE DE LIT', 23.71);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (18, 'PORTE-BEBE', 44.86);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (19, 'SIEGE-AUTO COSMOS', 126.86);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (20, 'SIEGE-AUTO EUROSEAT', 121.29);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (21, 'DVD-SPIRIT', 24.90);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (22, 'DVD-SPIDER MAN', 24.90);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (23, 'DVD-SPIDER MAN 2', 24.90);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (24, 'K7 VIDEO-TOY STORY', 21.29);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (25, 'DVD-TOY STORY 2', 34.29);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (26, 'K7-WINNIE L OURSON', 22.86);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (27, 'DVD-FRERES DES OURS', 35.00);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (28, 'K7-LE ROI LION', 30.00);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (29, 'K7-LE ROI LION 2', 30.00);

INSERT INTO ARTICLES_DW2 (NUMART, NOMART, PUART)
VALUES (30, 'K7-LE ROI LION 3', 30.00);

PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =====================================================================
PROMPT >> Table : TEMPS_DW2
PROMPT =====================================================================
PROMPT
INSERT INTO TEMPS_DW2 (IDTEMPS, DATEHEURET, ANNEET, MOIST, JOURT)
VALUES (1,  'LUNDI 17-SEPTEMBRE-2001', 2001, 9, 17);

INSERT INTO TEMPS_DW2 (IDTEMPS, DATEHEURET, ANNEET, MOIST, JOURT)
VALUES (2,  'DIMANCHE 17-SEPTEMBRE-2000', 2000, 9, 17);

INSERT INTO TEMPS_DW2 (IDTEMPS, DATEHEURET, ANNEET, MOIST, JOURT)
VALUES (3,  'LUNDI 16-OCTOBRE-2000', 2000, 10, 16);

INSERT INTO TEMPS_DW2 (IDTEMPS, DATEHEURET, ANNEET, MOIST, JOURT)
VALUES (4,  'JEUDI 24-OCTOBRE-2002', 2002, 10, 24);

INSERT INTO TEMPS_DW2 (IDTEMPS, DATEHEURET, ANNEET, MOIST, JOURT)
VALUES (5,  'LUNDI 22-JANVIER-2001', 2001, 1, 22);

INSERT INTO TEMPS_DW2 (IDTEMPS, DATEHEURET, ANNEET, MOIST, JOURT)
VALUES (6,  'MARDI 13-MARS-2001', 2001, 3, 13);

INSERT INTO TEMPS_DW2 (IDTEMPS, DATEHEURET, ANNEET, MOIST, JOURT)
VALUES (7,  'VENDREDI 14-FéVRIER-2003', 2003, 02, 14);

INSERT INTO TEMPS_DW2 (IDTEMPS, DATEHEURET, ANNEET, MOIST, JOURT)
VALUES (8,  'LUNDI 07-JANVIER-2002', 2002,1, 7);

INSERT INTO TEMPS_DW2 (IDTEMPS, DATEHEURET, ANNEET, MOIST, JOURT)
VALUES (9,  'MARDI 14-JANVIER-2003', 2003, 1, 14);

INSERT INTO TEMPS_DW2 (IDTEMPS, DATEHEURET, ANNEET, MOIST, JOURT)
VALUES (10,  'JEUDI 10-MARS-2005', 2005, 3, 10);

INSERT INTO TEMPS_DW2 (IDTEMPS, DATEHEURET, ANNEET, MOIST, JOURT)
VALUES (11,  'LUNDI 14-MARS-2005', 2005, 3, 24);

INSERT INTO TEMPS_DW2 (IDTEMPS, DATEHEURET, ANNEET, MOIST, JOURT)
VALUES (12,  'VENDREDI 11-MARS-2005', 2005, 09, 11);

PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =====================================================================
PROMPT >> Table : CLIENTS_DW2 
PROMPT =====================================================================
PROMPT
INSERT INTO CLIENTS_DW2 (NUMCLI, NOMCLI, TELCLI, ADRNUMCLI, ADRRUECLI, ADRCPCLI, ADRVILLECLI, ADRPAYSCLI)
VALUES (1,  'CLEMENT', '0174454454', '18', 'BOULEVARD FOCH', '91000', 'EPINAY SUR ORGE', 'FRANCE');

INSERT INTO CLIENTS_DW2 (NUMCLI, NOMCLI, TELCLI, ADRNUMCLI, ADRRUECLI, ADRCPCLI, ADRVILLECLI, ADRPAYSCLI)
VALUES (2,  'LESEUL',  '0165441122', '21', 'AVENUE D ITALIE', '75013', 'PARIS', 'FRANCE');

INSERT INTO CLIENTS_DW2 (NUMCLI, NOMCLI, TELCLI, ADRNUMCLI, ADRRUECLI, ADRCPCLI, ADRVILLECLI, ADRPAYSCLI)
VALUES (3,  'UNIQUE',  '0246454621', '77', 'RUE DE LA LIBERTE', '13001', 'MARSEILLE', 'FRANCE');

INSERT INTO CLIENTS_DW2 (NUMCLI, NOMCLI, TELCLI, ADRNUMCLI, ADRRUECLI, ADRCPCLI, ADRVILLECLI, ADRPAYSCLI)
VALUES (4,  'CLEMENCE', '0520354631', '8 BIS', 'BOULEVARD FOCH', '93800', 'EPINAY SUR SEINE', 'FRANCE');

INSERT INTO CLIENTS_DW2 (NUMCLI, NOMCLI, TELCLI, ADRNUMCLI, ADRRUECLI, ADRCPCLI, ADRVILLECLI, ADRPAYSCLI)
VALUES (5, 'FORT',  '04967465431', '55', 'RUE DU JAPON', '94310', 'ORLY VILLE', 'FRANCE');

INSERT INTO CLIENTS_DW2 (NUMCLI, NOMCLI, TELCLI, ADRNUMCLI, ADRRUECLI, ADRCPCLI, ADRVILLECLI, ADRPAYSCLI)
VALUES (6,  'LE BON',  '0549746454', '18', 'BOULEVARD FOCH', '93800', 'EPINAY SUR SEINE', 'FRANCE');

INSERT INTO CLIENTS_DW2 (NUMCLI, NOMCLI, TELCLI, ADRNUMCLI, ADRRUECLI, ADRCPCLI, ADRVILLECLI, ADRPAYSCLI)
VALUES (7,  'TRAIFOR','044676872', '6', 'RUE DE LA ROSIERE', '75015', 'PARIS', 'FRANCE');

INSERT INTO CLIENTS_DW2 (NUMCLI, NOMCLI, TELCLI, ADRNUMCLI, ADRRUECLI, ADRCPCLI, ADRVILLECLI, ADRPAYSCLI)
VALUES (8,  'VIVANT', '003232498754', '13', 'RUE DE LA PAIX', '99999', 'BRUXELLES', 'BELGIQUE');

INSERT INTO CLIENTS_DW2 (NUMCLI, NOMCLI, TELCLI, ADRNUMCLI, ADRRUECLI, ADRCPCLI, ADRVILLECLI, ADRPAYSCLI)
VALUES (9,  'CLEMENCE','003267487467', '5', 'RUE DE BELLEVILLE', '99999', 'BRUXELLES', 'BELGIQUE');

INSERT INTO CLIENTS_DW2 (NUMCLI, NOMCLI, TELCLI, ADRNUMCLI, ADRRUECLI, ADRCPCLI, ADRVILLECLI, ADRPAYSCLI)
VALUES (10,  'TRAIFOR','003256767987', '16', 'AVENUE FOCH', '99998', 'ANDERLECK', 'BELGIQUE');

INSERT INTO CLIENTS_DW2 (NUMCLI, NOMCLI, TELCLI, ADRNUMCLI, ADRRUECLI, ADRCPCLI, ADRVILLECLI, ADRPAYSCLI)
VALUES (11,  'PREMIER','003216575445', '77', 'RUE DE LA LIBERTE', '99998', 'ANDERLECK', 'BELGIQUE');

INSERT INTO CLIENTS_DW2 (NUMCLI, NOMCLI, TELCLI, ADRNUMCLI, ADRRUECLI, ADRCPCLI, ADRVILLECLI, ADRPAYSCLI)
VALUES (12,  'CLEMENT','405465482', '132', 'AVENUE DES LILAS', '99999', 'BRUXELLES', 'BELGIQUE');

INSERT INTO CLIENTS_DW2 (NUMCLI, NOMCLI, TELCLI, ADRNUMCLI, ADRRUECLI, ADRCPCLI, ADRVILLECLI, ADRPAYSCLI)
VALUES (13,  'FORT', '065476545', '1', 'AVENUE DE CARTAGE', '99000', 'TUNIS', 'TUNISIE');

INSERT INTO CLIENTS_DW2 (NUMCLI, NOMCLI, TELCLI, ADRNUMCLI, ADRRUECLI, ADRCPCLI, ADRVILLECLI, ADRPAYSCLI)
VALUES (14,  'ADAM',  '035479875', '1', 'AVENUE DE ROME', '99001', 'ROME', 'ITALIE');

PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =====================================================================
PROMPT >> Table : VENTES_DW2
PROMPT =====================================================================
PROMPT
INSERT INTO VENTES_DW2 (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG)
VALUES (1, 30, 5, 2, 28.99, 'FR02');

INSERT INTO VENTES_DW2 (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG)
VALUES (2, 28, 4, 3, 28.99, 'FR04');

INSERT INTO VENTES_DW2 (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG)
VALUES (3, 26, 6, 1 ,22.00, 'FR06');

INSERT INTO VENTES_DW2 (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG)
VALUES (4, 24, 7, 8, 21.00, 'BE02');

INSERT INTO VENTES_DW2 (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG)
VALUES (5, 22, 5, 9, 24.90, 'TN01');

INSERT INTO VENTES_DW2 (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG)
VALUES (6, 11, 11, 11, 122.00, 'TN01');

INSERT INTO VENTES_DW2 (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG)
VALUES (7, 18, 12, 14 ,44.00, 'IT01');

INSERT INTO VENTES_DW2 (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG)
VALUES (8, 16, 12, 2, 49.00, 'TN01');

INSERT INTO VENTES_DW2 (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG)
VALUES (9, 14, 2, 4, 7.80, 'FR03');

INSERT INTO VENTES_DW2 (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG)
VALUES (10, 12, 6, 5, 15.55, 'FR02');

INSERT INTO VENTES_DW2 (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG)
VALUES (11, 10, 8 ,12, 30.70, 'BE03');

INSERT INTO VENTES_DW2 (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG)
VALUES (12, 8, 9, 11, 3.00,'TN01');

INSERT INTO VENTES_DW2 (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG)
VALUES (13, 6, 1, 4, 2.00, 'FR02');

INSERT INTO VENTES_DW2 (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG)
VALUES (14, 4, 10, 14 ,7.40, 'IT01');

INSERT INTO VENTES_DW2 (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG)
VALUES (15, 2, 3, 3 , 27.00, 'FR05');

COMMIT;	   

PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =====================================================================
PROMPT Affichage des tables de la bd GESCOM EN SQL 2 
PROMPT =====================================================================
PROMPT
COLUMN NUMCLI		FORMAT 999
COLUMN NOMCLI		FORMAT A8
COLUMN TELCLI		FORMAT A11
COLUMN ADRNUMCLI	FORMAT A9
COLUMN ADRRUECLI	FORMAT A10
COLUMN ADRCPCLI		FORMAT A9
COLUMN ADRVILLECLI	FORMAT A10
COLUMN ADRPAYSCLI	FORMAT A9

COLUMN NUMMAG		FORMAT A4
COLUMN NOMMAG		FORMAT A8
COLUMN TELMAG		FORMAT A10
COLUMN ADRNUMMAG	FORMAT A5
COLUMN ADRRUEMAG	FORMAT A10
COLUMN ADRCPMAG		FORMAT A7
COLUMN ADRVILLEMAG	FORMAT A10
COLUMN ADRPAYSMAG	FORMAT A10
COLUMN MAILMAG	    FORMAT A10

COLUMN NUMART		FORMAT 999
COLUMN NOMART		FORMAT A20
COLUMN PUART		FORMAT 9999.99

SELECT * FROM VENTES_DW2;

PROMPT
Pause Tapez sur Enter...
PROMPT

SELECT * FROM CLIENTS_DW2;

PROMPT
Pause Tapez sur Enter...
PROMPT

SELECT * FROM TEMPS_DW2;

PROMPT
Pause Tapez sur Enter...
PROMPT

SELECT * FROM MAGASINS_DW2;

PROMPT
Pause Tapez sur Enter...
PROMPT

SELECT * FROM ARTICLES_DW2;

PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =====================================================================
PROMPT Creation des vues pour la BD GesComIDW en sql 2
PROMPT =====================================================================
PROMPT




-- Manipulations-Interrogations des données ================================
-- en SQL 2 ================================================================
-- Requêtes dans les tables ================================================
-- Vues et Vues Matérialisées ==============================================

--======================================================================================
--======================================================================================
--======================================================================================

TTITLE CENTER 'Vue1: Total des ventes des magasins a partir de 2002, par ville et annee' skip 1 -
       LEFT   '=========================================================================' skip 0
CREATE OR REPLACE VIEW V1 (VILLE, ANNEE, MONTANT1) AS
	(SELECT   ADRVILLEMAG, ANNEET, SUM(MONTANTVENTE) 
	 FROM     VENTES_DW2, MAGASINS_DW2, TEMPS_DW2   
	 WHERE    VENTES_DW2.NUMMAG  = MAGASINS_DW2.NUMMAG
	 AND      VENTES_DW2.IDTEMPS = TEMPS_DW2.IDTEMPS
	 AND      TEMPS_DW2.ANNEET  >= 2002
 	 GROUP BY ADRVILLEMAG, ANNEET);

PROMPT
pause Tapez sur Enter...
PROMPT

TTITLE CENTER 'Vue2: Total des ventes des magasins en France par ville, annee et mois' skip 1 -
       LEFT   '=========================================================================' skip 0
CREATE OR REPLACE VIEW V2 (VILLE, ANNEE, MOIS, MONTANT2) AS
	(SELECT   ADRVILLEMAG, ANNEET, MOIST, SUM(MONTANTVENTE) 
	 FROM     VENTES_DW2, MAGASINS_DW2, TEMPS_DW2   
	 WHERE    VENTES_DW2.NUMMAG          = MAGASINS_DW2.NUMMAG
	 AND      VENTES_DW2.IDTEMPS 	     = TEMPS_DW2.IDTEMPS
	 AND      UPPER(MAGASINS_DW2.ADRPAYSMAG) = 'FRANCE'
 	 GROUP BY ADRVILLEMAG, ANNEET, MOIST);

PROMPT
pause Tapez sur Enter...
PROMPT

TTITLE CENTER 'Vue3: Total des ventes des magasins en Belgique ,avant <= 2001,' skip 1 -
       CENTER 'par ville, annee et mois' skip 1 -
       LEFT   '=========================================================================' skip 0
CREATE OR REPLACE VIEW V3 (VILLE, ANNEE, MOIS, MONTANT3) AS
	(SELECT   ADRVILLEMAG, ANNEET, MOIST, SUM(MONTANTVENTE) 
	 FROM     VENTES_DW2, MAGASINS_DW2, TEMPS_DW2   
	 WHERE    VENTES_DW2.NUMMAG  	     = MAGASINS_DW2.NUMMAG
	 AND      VENTES_DW2.IDTEMPS	     = TEMPS_DW2.IDTEMPS
	 AND      UPPER(MAGASINS_DW2.ADRPAYSMAG) = 'BELGIQUE'
	 AND 	  TEMPS_DW2.ANNEET  	    <= 2001
 	 GROUP BY ADRVILLEMAG, ANNEET, MOIST);

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Creation des requetes pour la BD GesComIDW en sql 2
PROMPT =====================================================================
PROMPT

SET TIMING ON;

TTITLE CENTER 'Requete Q1: Total des ventes des magasins en France ou en Belgique,' skip 1 -
       CENTER 'pour la periode de 2001 à 2003, par ville et annee' skip 1 -
       LEFT   '=========================================================================' skip 0

COLUMN ADRVILLEMAG	FORMAT A20

SELECT   ADRVILLEMAG, ANNEET, SUM(MONTANTVENTE) AS MONTANT
FROM     VENTES_DW2, MAGASINS_DW2, TEMPS_DW2
WHERE    VENTES_DW2.NUMMAG  = MAGASINS_DW2.NUMMAG
AND      VENTES_DW2.IDTEMPS = TEMPS_DW2.IDTEMPS
AND      (UPPER(MAGASINS_DW2.ADRPAYSMAG) = 'FRANCE' 
	  OR UPPER(MAGASINS_DW2.ADRPAYSMAG) = 'BELGIQUE')
AND      TEMPS_DW2.ANNEET BETWEEN 2001 AND 2003
GROUP BY ADRVILLEMAG, ANNEET;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
--
--       Requete Q1: Total des ventes des magasins en France ou en Belgique,
--       pour la periode de 2001 à 2003, par ville et annee
-- =========================================================================
-- ADRVILLEMAG              ANNEET    MONTANT
-- -------------------- ---------- ----------
-- PARIS                      2001      46,54
-- ANDERLECK                  2001       24,9
-- BRUXELLES                  2002       30,7
-- BRUXELLES                  2003         24
-- EPINAY SUR SEINE           2001         22
-- EPINAY SUR SEINE           2002      28,99
-- 
-- 6 ligne(s) sélectionnée(s).
-- 
-- Ecoulé : 00 :00 :00.03
-- __________________________________________________________________________

PROMPT
pause Tapez sur Enter...
PROMPT

TTITLE CENTER 'Requete Q1Prim: Total des ventes des magasins en France ou en Belgique,' skip 1 -
       center 'pour la periode de 2001 à 2003, par ville et annee' skip 1 -
       LEFT   '=========================================================================' skip 0

COLUMN ADRVILLEMAG	FORMAT A20

	SELECT   ADRVILLEMAG, ANNEE, MONTANT1
	FROM     V1, (SELECT DISTINCT ADRVILLEMAG
		      FROM   MAGASINS_DW2
		      WHERE  UPPER(MAGASINS_DW2.ADRPAYSMAG) = 'FRANCE' 
		  	     OR UPPER(MAGASINS_DW2.ADRPAYSMAG) = 'BELGIQUE') S1
	WHERE    V1.VILLE = S1.ADRVILLEMAG
	AND	 ANNEE   <= 2003
--	GROUP BY ADRVILLEMAG, ANNEE, MONTANT1
UNION
	SELECT   VILLE, ANNEE, SUM(MONTANT2)
	FROM     V2
	WHERE    ANNEE = 2001
	GROUP BY VILLE, ANNEE
UNION
	SELECT   S2.ADRVILLEMAG, ANNEE, SUM(MONTANT3)
	FROM     V3, (SELECT DISTINCT ADRVILLEMAG
		      FROM   MAGASINS_DW2) S2
	WHERE    V3.VILLE = S2.ADRVILLEMAG 
	AND      ANNEE    = 2001
	GROUP BY ADRVILLEMAG, ANNEE;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
--
--     Requete Q1Prim: Total des ventes des magasins en France ou en Belgique,
--       pour la periode de 2001 à 2003, par ville et annee
-- =========================================================================
-- ADRVILLEMAG               ANNEE   MONTANT1
-- -------------------- ---------- ----------
-- ANDERLECK                  2001       24,9
-- BRUXELLES                  2002       30,7
-- BRUXELLES                  2003         24
-- EPINAY SUR SEINE           2001         22
-- EPINAY SUR SEINE           2002      28,99
-- PARIS                      2001      46,54
-- 
-- 6 ligne(s) sélectionnée(s).
-- 
-- Ecoulé : 00 :00 :00.04
-- __________________________________________________________________________


-- A vous de comparer avec la New BD TOUSCLIENTS, TOUSARTICLES...


--======================================================================================
--======================================================================================
--======================================================================================
COMMIT;	   
SET TIMING OFF;
SPOOL OFF;
--======================================================================================
--======================================================================================
--======================================================================================




