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

-- NOM Prénom 1                   : ELILTHAMILVALAVAN Magilan
-- NOM Prénom 2                   : MOUSSA Abdelkader

-- ====>>> Vos fichiers sql devront s'appeler : Bxy-GCI-01.sql


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


SPOOL Bxy-GCI-01.lst

PROMPT =========================================================
-- Nom du Cas       :  Gestion Commerciale Intelligente : GESCOMI : GCI
-- Nom de SGBD      :  ORACLE DBMS                    
-- Date de création :  Septembre 2018
-- Auteur           :  Faouzi BOUFARES 
-- Université       :  Université Sorbonne Paris Cité, Université Paris 13 
-- Formation        :  Master 2 EID 2  
PROMPT =========================================================
PROMPT 
PROMPT =========================================================
PROMPT |                                                       |
PROMPT |     Exercice 1 :  BD GESCOMI avec SQL 2               |
PROMPT |     Manipulations-Interrogations de BD                |
PROMPT |                                                       |
PROMPT =========================================================
PROMPT
PROMPT

PROMPT =========================================================
PROMPT Ceci permet d initialiser le type de la date
PROMPT =========================================================
ALTER SESSION SET NLS_DATE_FORMAT = 'DAY DD-MONTH-YYYY' ;
PROMPT =========================================================

-- ===============================================================================
-- Définition de la structure des données ================= DEBUT    =============
-- en SQL 2 ======================================================================
-- Création des tables ============= Magasin FR01 ====== PARIS   =================

PROMPT Destruction des tables de la bd GESCOMI EN SQL 2
PROMPT =========================================================
PROMPT
DROP TABLE DETAILCOM2;
DROP TABLE ARTICLES2;
DROP TABLE COMMANDES2;
DROP TABLE CLIENTS2;
PROMPT
Pause Tapez sur Enter...
PROMPT
PROMPT =========================================================
PROMPT Création des tables de la bd GESCOMI EN SQL 2
PROMPT =========================================================
PROMPT
PROMPT =========================================================
PROMPT >> Table : CLIENTS2                                             
PROMPT =========================================================
PROMPT
CREATE TABLE CLIENTS2
(
	CODCLI		VARCHAR2(10), 
	CIVCLI		VARCHAR2(12),
	NOMCLI		VARCHAR2(20),
	PRENCLI		VARCHAR2(20),
	CATCLI		NUMBER(1),
	ADNCLI		VARCHAR2(10),
	ADRCLI		VARCHAR2(50),
	CPCLI		VARCHAR2(10),
	VILCLI		VARCHAR2(20),
	PAYSCLI		VARCHAR2(30),
	MAILCLI		VARCHAR2(30),
	TELCLI		VARCHAR2(20),
	CONSTRAINT PK_CLIENTS2				PRIMARY KEY(CODCLI),
	CONSTRAINT CK_CLIENTS2_CIVCLI		CHECK(CIVCLI IN ('Mademoiselle', 'Madame', 'Monsieur')),
	CONSTRAINT CK_CLIENTS2_CATCLI		CHECK(CATCLI BETWEEN 1 and 7),
	CONSTRAINT NN_CLIENTS2_NOMCLI		CHECK(NOMCLI IS NOT NULL),
	CONSTRAINT NN_CLIENTS2_PRENCLI		CHECK(PRENCLI IS NOT NULL),
	CONSTRAINT NN_CLIENTS2_CATCLI		CHECK(CATCLI IS NOT NULL),
	CONSTRAINT CK_CLIENTS2_VILCLI		CHECK(VILCLI = UPPER(VILCLI)),
	CONSTRAINT CK_CLIENTS2_PAYSCLI		CHECK(PAYSCLI = UPPER(PAYSCLI))
);
PROMPT
Pause Tapez sur Enter...
PROMPT
PROMPT =========================================================
PROMPT >> Table : COMMANDES2
PROMPT =========================================================
PROMPT
CREATE TABLE COMMANDES2
(
	NUMCOM 		VARCHAR2(10), 
	CODCLI		VARCHAR2(10),
	DATCOM		DATE,
	CONSTRAINT PK_COMMANDES2					PRIMARY KEY(NUMCOM),
	CONSTRAINT NN_COMMANDES2_DATCOM				CHECK(DATCOM IS NOT NULL),
	CONSTRAINT FK_COMMANDES2_CODCLI_CLIENTS2	FOREIGN KEY(CODCLI)	REFERENCES CLIENTS2(CODCLI)
);
PROMPT
Pause Tapez sur Enter...
PROMPT
PROMPT =========================================================
PROMPT >> Table : ARTICLES2
PROMPT =========================================================
PROMPT
CREATE TABLE ARTICLES2
(
	REFART 		VARCHAR2(10), 
	NOMART		VARCHAR2(50),
	PVART		NUMBER(10, 2),
	QSART		NUMBER(3),
	PAART		NUMBER(10, 2),
	CONSTRAINT PK_ARTICLES2				PRIMARY KEY(REFART),
	CONSTRAINT NN_ARTICLES2_NOMART		CHECK(NOMART IS NOT NULL),
	CONSTRAINT CK_ARTICLES2_QSART		CHECK(QSART < 1000)
);
PROMPT
Pause Tapez sur Enter...
PROMPT
PROMPT =========================================================
PROMPT >> Table : DETAILCOM2
PROMPT =========================================================
PROMPT
CREATE TABLE DETAILCOM2
(
	NUMCOM 		VARCHAR2(10), 
	REFART		VARCHAR2(10),
	QTCOM		NUMBER(3),
	PUART		NUMBER(10, 2),
	REMISE		NUMBER(4, 2),
	CONSTRAINT PK_DETAILCOM2				PRIMARY KEY(NUMCOM, REFART),
	CONSTRAINT CK_DETAILCOM2_QTCOM			CHECK(QTCOM < 1000),
	CONSTRAINT NN_DETAILCOM2_QTCOM			CHECK(QTCOM IS NOT NULL),
	CONSTRAINT NN_DETAILCOM2_PUART			CHECK(PUART IS NOT NULL),
	CONSTRAINT NN_DETAILCOM2_REMISE			CHECK(REMISE IS NOT NULL),
	CONSTRAINT FK_DETAIL2_NUMCOM_COM2		FOREIGN KEY(NUMCOM)	REFERENCES COMMANDES2(NUMCOM),
	CONSTRAINT FK_DETAIL2_REFART_ARTICLES2	FOREIGN KEY(REFART)	REFERENCES ARTICLES2(REFART)
);
PROMPT
Pause Tapez sur Enter...

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
PROMPT =========================================================
PROMPT >> Insertion dans la Table : CLIENTS2
PROMPT =========================================================
PROMPT
INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C001', 'Madame', 'CLEMENT', 'EVE', 1, '18', 'BOULEVARD FOCH', '91000', 'EPINAY-SUR-ORGE', 'FRANCE','eve.clement@gmail.com', '+33777889911');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C002', 'Madame', 'LESEUL', 'MARIE', 1, '21', 'AVENUE D ITALIE', '75013', 'PARIS', 'FRANCE','marieleseul@yahoo.fr', '0617586565');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C003', 'Madame', 'UNIQUE', 'MARINE', 2, '77', 'RUE DE LA LIBERTE', '13001', 'MARSEILLE', 'FRANCE','munique@gmail.com', '+33777889922');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C004', 'Madame', 'CLEMENCE', 'EVELYNE', 3, '8 BIS', 'BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', 'FRANCE','clemence evelyne@gmail.com', '+33777889933');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C005', 'Madame', 'FORT', 'JEANNE', 3, '55', 'RUE DU JAPON', '94310', 'ORLY VILLE', 'FRANCE','jfort\@hotmail.fr', '+33777889944');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C006', 'Mademoiselle', 'LE BON', 'CLEMENCE', 1, '18', 'BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', 'FRANCE','clemence.le bon@cfo.fr', '0033777889955');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C007', 'Mademoiselle', 'TRAIFOR', 'ALICE', 2, '6', 'RUE DE LA ROSIERE', '75015', 'PARIS', 'FRANCE','alice.traifor@yahoo.fr', '+33777889966');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C008', 'Monsieur', 'VIVANT', 'JEAN-BAPTISTE', 1, '13', 'RUE DE LA PAIX', '93800', 'EPINAY-SUR-SEINE', 'FRANCE','jeanbaptiste@', '0607');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C009', 'Monsieur', 'CLEMENCE', 'ALEXANDRE', 1, '5', 'RUE DE BELLEVILLE', '75019', 'PARIS', 'FRANCE','alexandre.clemence@up13.fr', '+33149404071');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C010', 'Monsieur', 'TRAIFOR', 'ALEXANDRE', 1, '16', 'AVENUE FOCH', '75016', 'PARIS', 'FRA','alexandre.traifor@up13.fr', '06070809');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C011', 'Monsieur', 'PREMIER', 'JOSEPH', 2, '77', 'RUE DE LA LIBERTE', '13001', 'MARSEILLE', 'FRANCE','josef@premier', '+33777889977');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C012', 'Monsieur', 'CLEMENT', 'ADAM', 2, '13', 'AVENUE JEAN BAPTISTE CLEMENT', '9430', 'VILLETANEUSE', 'FRANCE','adam.clement@gmail.com', '+33149404072');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C013', 'Monsieur', 'FORT', 'GABRIEL', 5, '1', 'AVENUE DE CARTAGE', '99000', 'TUNIS', 'TUNISIE','gabriel.fort@yahoo.fr', '+21624801777');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C014', 'Monsieur', 'ADAM', 'DAVID', 5, '1', 'AVENUE DE ROME', '99001', 'ROME', 'ITALIE','david.adamé@gmail com', '');

PROMPT
Pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Insertion dans la Table : COMMANDES2
PROMPT =========================================================
PROMPT
INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20001AB', 'C012', 'DIMANCHE 17-SEPTEMBRE-2000');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20002AB', 'C001', 'DIMANCHE 17-SEPTEMBRE-2000');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20003AB', 'C006', ' LUNDI 16-OCTOBRE-2000');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20004AB', 'C006', 'MARDI 24-OCTOBRE-2000');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20011RB', 'C012', 'LUNDI 22-JANVIER-2001');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20012RB', 'C012', 'MARDI 13-MARS-2001');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20031FB', 'C001', 'VENDREDI 14-février-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20051FB', 'C003', 'VENDREDI 07-JANVIER-2005');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20052FB', 'C003', 'MERCREDI 12-JANVIER-2005');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20053FB', 'C012', 'JEUDI 10-MARS-2005');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20054FB', 'C007', 'LUNDI 14-MARS-2005');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20055FB', 'C012', 'VENDREDI 11-MARS-2005');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20056FB', 'C013', 'LUNDI 14-MARS-2005');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20057FB', 'C014', 'VENDREDI 11-MARS-2005');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20061FB', 'C010', 'vendredi 14-février-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20062FB', 'C009', 'vendredi 14-février-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20065FB', 'C007', 'vendredi 14-février-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20066FB', 'C002', 'vendredi 14-février-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20067FB', 'C002', 'vendredi 14-février-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20068FB', 'C002', 'vendredi 14-février-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20069FB', 'C002', 'MARDI 30-JANVIER-2007');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20070FB', 'C002', 'MARDI 30-JANVIER-2007');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20071FB', 'C013', 'MARDI 30-JANVIER-2007');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20072FB', 'C013', 'MARDI 30-JANVIER-2007');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20073FB', 'C014', 'MARDI 30-JANVIER-2007');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20074FB', 'C014', 'MARDI 30-JANVIER-2007');

PROMPT
Pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Insertion dans la Table : ARTICLES2
PROMPT =========================================================
PROMPT
INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.001', 'SIEGE DE TABLE', 35.00, 10, 26.43);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.002', 'CASQUE CYCLISTE PROTECTION', 27.00, 20, 20.00);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.003', 'BONNET PARE-CHOCS', 10.71, 100, 5.71);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.004', 'STORE DE PROTECTION', 7.43, 5, 4.29);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.005', 'COINS DE PROTECTION', 4.00, 100, 1.71);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.006', 'CACHE PRISE DE COURANT', 2.29, 500, 0.71);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.007', 'BLOQUE PORTE', 5.00, 4, 2.29);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.008', 'BANDE DE FERMETURE', 3.29, 4, 1.71);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.009', 'PROTECTION DE FOUR', 37.86, 10, 26.43);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.010', 'PROTECTION DE CUISINIERE', 30.71, 10, 22.86);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.011', 'BABY PHONE', 80.71, 3, 45.71);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.012', 'BRETELLE DE SECURITE', 15.57, 8, 11.43);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.013', 'HAUSSE-CHAISE', 42.71, 1, 25.43);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.014', 'COUVRE ROBINETTERIE', 7.86, 12, 4.29);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.001', 'BARRIERE DE PORTE, EN BOIS', 32.71, 2, 25.71);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.002', 'BARRIERE DE PORTE, EN METAL', 49.14, 3, 28.43);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.003', 'BARRIERE DE LIT', 23.71, 10, 15.71);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.004', 'PORTE-BEBE', 44.86, 6, 34.29);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.005', 'SIEGE-AUTO COSMOS', 126.86, 2, 71.43);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.006', 'SIEGE-AUTO EUROSEAT', 121.29, 2, 71.43);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('FB.001', 'DVD-SPIRIT', 24.90, 2, 12.00);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('FB.002', 'DVD-SPIDER MAN', 24.90, 2, 12.00);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('FB.003', 'DVD-SPIDER MAN 2', 24.90, 2, 12.00);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.001', 'K7 VIDEO-TOY STORY', 21.29, 10, 9.29);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.002', 'DVD-TOY STORY 2', 34.29, 10, 12.14);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.003', 'K7 VIDEO-WINNIE L OURSON', 22.86, 5, 9.29);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.004', 'DVD-FRERES DES OURS', 35.00, 3, 13.00);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.005', 'K7 VIDEO-LE ROI LION', 30.00, 1, 13.00);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.006', 'K7 VIDEO-LE ROI LION 2', 30.00, 4, 13.00);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.007', 'K7 VIDEO-LE ROI LION 3', 30.00, 3, 13.00);

PROMPT
Pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Insertion dans la Table : DETAILCOM2
PROMPT =========================================================
PROMPT
INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20001AB', 'F1.001', 2, 35.00, 2.50);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20001AB', 'F1.003', 4, 10.71, 3.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20001AB', 'F1.013', 2, 49.14, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20001AB', 'WD.001', 1, 21.29, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20002AB', 'F1.001', 2, 33.00, 3.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20002AB', 'WD.001', 1, 21.29, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20002AB', 'WD.002', 1, 34.29, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20002AB', 'WD.003', 1, 22.86, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20003AB', 'FB.001', 5, 21.00, 4.00);

INSERT INTO DETAILCOM2(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20003AB', 'WD.002', 1, 34.29, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20003AB', 'WD.003', 1, 22.86, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20004AB', 'F1.008', 2, 3.29, 3.50);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20004AB', 'WD.001', 1, 21.29, 2.50);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20012RB', 'F1.007', 5, 5.00, 3.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20012RB', 'F1.009', 1, 37.86, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20012RB', 'FB.003', 5, 24.00, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20031FB', 'F1.008', 2, 3.29, 3.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20031FB', 'F2.001', 1, 30.71, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20031FB', 'FB.001', 5, 21.00, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20051FB', 'F1.008', 2, 3.29, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20051FB', 'FB.001', 5, 21.00, 4.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20052FB', 'F1.001', 2, 35.00, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20052FB', 'F1.003', 4, 10.71, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20052FB', 'F1.013', 2, 49.14, 3.50);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20052FB', 'WD.001', 1, 21.29, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20052FB', 'WD.003', 1, 22.86, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20053FB', 'WD.003', 1, 22.86, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20054FB', 'WD.003', 1, 22.86, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20055FB', 'F1.008', 5, 3.29, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20055FB', 'F1.009', 1, 37.86, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20055FB', 'F1.011', 2, 80.71, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20055FB', 'F2.001', 1, 30.71, 0.00);

-------------------------------------------------------------

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20056FB', 'F1.011', 2, 80.71, 0.00);

INSERT INTO DETAILCOM2 (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20057FB', 'F2.001', 1, 30.71, 0.00);

-------------------------------------------------------------

INSERT INTO DETAILCOM2(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20061FB', 'FB.003', 5, 24.00, 0.00);

INSERT INTO DETAILCOM2(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20062FB', 'FB.003', 5, 24.00, 0.00);

INSERT INTO DETAILCOM2(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20065FB', 'FB.003', 5, 24.00, 0.00);

INSERT INTO DETAILCOM2(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20066FB', 'FB.003', 5, 24.00, 0.00);

-------------------------------------------------------------

INSERT INTO DETAILCOM2(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20067FB', 'FB.001', 22, 24.00, 0.00);

INSERT INTO DETAILCOM2(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20068FB', 'FB.001', 22, 24.00, 0.00);

-------------------------------------------------------------

INSERT INTO DETAILCOM2(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20069FB', 'FB.001', 25, 58.00, 0.00);

INSERT INTO DETAILCOM2(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20070FB', 'FB.001', 50, 24.00, 0.00);

INSERT INTO DETAILCOM2(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20071FB', 'FB.001', 37, 27.90, 0.00);

INSERT INTO DETAILCOM2(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20072FB', 'FB.001', 8, 34.00, 0.00);

INSERT INTO DETAILCOM2(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20073FB', 'FB.001', 35, 15.50, 0.00);

INSERT INTO DETAILCOM2(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20074FB', 'FB.001', 12, 19.99, 0.00);

PROMPT =========================================================
PROMPT Validation des insertions dans la bd EN SQL 2 
PROMPT =========================================================

COMMIT;

PROMPT
Pause Tapez sur Enter...

-- Affichage des données ===================================================
-- en SQL 2 ================================================================
-- Affichage des lignes dans les tables ====================================

PROMPT
PROMPT =========================================================
PROMPT Affichage des tables de la bd EN SQL 2 
PROMPT =========================================================

SET TIMING ON;
SET LINES 1000
SET PAGES 1000

COLUMN CODCLI  FORMAT A6
COLUMN CIVCLI  FORMAT A8
COLUMN NOMCLI  FORMAT A8
COLUMN PRENCLI FORMAT A8
COLUMN CATCLI  FORMAT 99
COLUMN ADNCLI  FORMAT A6
COLUMN ADRCLI  FORMAT A10
COLUMN CPCLI   FORMAT A5
COLUMN VILCLI  FORMAT A6
COLUMN PAYSCLI FORMAT A7
COLUMN MAILCLI FORMAT A10
COLUMN TELCLI  FORMAT A10

COLUMN NUMCOM  FORMAT A10
COLUMN DATCOM  FORMAT A28
COLUMN REFART  FORMAT A8
COLUMN NOMART  FORMAT A25
COLUMN PVART   FORMAT 999.99
COLUMN QSART   FORMAT 99
COLUMN PAART   FORMAT 999.99
COLUMN QTCOM   FORMAT 99
COLUMN PUART   FORMAT 999.99
COLUMN REMISE  FORMAT 999.99

SELECT * FROM CLIENTS2;

PROMPT
Pause Tapez sur Enter...
PROMPT

SELECT * FROM COMMANDES2;

PROMPT
Pause Tapez sur Enter...
PROMPT

SELECT * FROM ARTICLES2;

PROMPT
Pause Tapez sur Enter...
PROMPT

SELECT * FROM DETAILCOM2;

PROMPT
pause Tapez sur Enter...
PROMPT


-- Manipulations-Interrogations des données ================================
-- en SQL 2 ================================================================
-- Requêtes dans les tables ================================================

PROMPT =========================================================
PROMPT FB-A : Requetes sur la bd EN SQL 2 : A01, A02,... E06,... E10...,F, G, H I02...
PROMPT =========================================================
PROMPT
/*
Exemples de requêtes à Tester : 

Requêtes Ai (Sélections + Projections)
A01. Les Noms des clients (Avec éventuellement des doublons)
A02. Les Noms des clients (Sans les doublons)
A03. Les articles dont le prix de vente est supérieur ou égal au double du prix d’achat
A04. Les articles dont le prix de vente est soit 4 soit 27 soit 35
A05. Les articles dont le prix de vente est compris entre 30 et 50
A06. Les commandes du mois de septembre 2015
A07. Les détails des commandes d’une année donnée (2012)
A08. Les clients de « Paris » (Civilité Nom Prénom, Ville)
A09. Les clients dont le nom commence par « C »
A10. Les articles dont le nom commence par « Barrières de … »
A11. Les articles du fournisseur « WD »
A12. Les clients pour lesquels on n'a pas de téléphone
A13. Les clients dont le nom de la ville se prononce comme « pari » ou « barizzz » ou « pary »
A14. Décodification de la catégorie des clients : Transformez la catégorie comme suit : 1 ? Grossiste, 2 ? Demi-Gros, ? Détaillant
A15. Qualité des données ::: Y-a-t-il des anomalies dans les données ; Quelles sont ces anomalies ? 
A15a. Les clients pour lesquels les mails sont invalides (Code, Nom, et Mail)
A15b. Les clients pour lesquels les téléphones sont invalides (Code, Nom, et Mail)

Requêtes Bi (Tris + Sélections + Projections + Calculs)
B01. Classez les clients par ville, par ordre croissant
B02. Classez les articles de PV < 20, dans l’ordre décroissant du stock
B03. Calculez la marge pour chaque article (marge = PV – PA !)
B04. Calculez la marge pour tous les sièges
B05. Classez la marge pour tous les sièges, dans l’ordre décroissant de la marge

Requêtes Ci (Calculs + Sélections+ Projections)
C01. Nombre de clients (Femme + Homme)
C02. Nombre de clientes (Femme)
C03. Nombre de clients (Homme)
C04. Le prix de vente le plus élevé
C05. Moyenne des prix de vente des articles
C06. Le chiffre d’affaires global
C07. Les articles dont le prix de vente est supérieur à la moyenne des prix de vente

Requêtes Di (Calculs + Sous-Totaux + Sélections+ Projections)
D01. Nombre de clients par catégorie
D02. Nombre de clients parisiens par catégorie
D03. Montant de chaque commande
D04. Nombre de clients parisiens par catégorie, nombre > 2
D05. Total des quantités commandées par article
D06. Total des quantités commandées par catégorie d’article
D07. Total du chiffre d’affaires par catégorie d’article
D08. Total, moyenne, min et max du chiffre d’affaires par catégorie d’article
D09. Le chiffre d’affaires par année

Requêtes Ei (Jointures + Sélections + Projections)
E01.   ? Différents types de jointures (équi-jointure)  : voir pages suivantes
E02. full outer join
E03. left join
E04. right join
E05. Produit Cartésien (Le cas le plus général sans clause WHERE ; la jointure est un cas particulier)
E06. La téta-jointure (téta appartient à < <= > >= <>)
E07.
E08. Jointure & Optimisation des requêtes
E09. Jointure avec une requête dans la clause FROM
E10. Jointure & Ordre d’exécution des tables

Requêtes Fi (Calculs + Sous-Totaux + Unions + Intersections + Différences + Jointures)
F01. Clients ayant commandé en septembre 2011
F02. Montant total des commandes de septembre 2011
F03. Commandes ayant des articles dont le prix vente est supérieur à 20 (Commande, Article, PV)
F04. Commandes ayant des articles dont le prix vente est supérieur à 20 (Commande, Nombre)
F05. Commandes ayant 4 articles dont le prix vente est supérieur à 20
F06. Les clients de paris qui n’ont pas commandé en octobre 2011
F07. Les clients de paris ou ceux ayant commandé en octobre 2011

Requêtes Gi (Divisions)
G01. Les articles qui figurent sur toutes les commandes !
G02. Articles commandés par tous les parisiens
G03. Les articles qui figurent sur toutes les commandes d’une période donnée !

Requêtes Hi (SQL Avancé, SQL pour le multidimensionnel)
H01. Nombre de clients
H02. Nombre de pays
H03. Nombre de clients par catégorie
H04. Nombre de clients par catégorie et par ville
H05. Nombre de clients par ville et par catégorie
H06. Nombre de clients par catégorie et par ville ? fonction CUBE
H07. Nombre de clients par catégorie et par ville ? fonction ROLLUP

H08. Classez les clients par ordre décroissant du chiffre d’affaires CA
H09. Classez les clients par ordre décroissant du ca, donnez le rang
H10. Classez les clients par ordre décroissant du ca, donnez le rang : RANK() OVER…
H11. Clients par ordre décroissant du ca et de la catégorie, donnez le rang
H12. Clients par ordre décroissant du ca et de la catégorie, donnez le rang


Requêtes Ii (SQL Gestion de Gros volumes de Données - Export / Import)
I01. Export depuis une BD gérée par un SGBD vers des fichiers (Extraction/Export/Déchargement)
Utilisation de l’utilitaire SPOOLER pour extraire/exporter les tables d’une BD vers des fichiers textes
(sql> spool nomdefichier.txt 		sql>select… 				sql> spool off)
(sql> spool nomdefichier.lst 		sql>select…				sql> spool off)
Déchargez toutes les tables de la BD dans des fichiers CSV en utilisant le « ; » comme séparateur de colonnes.

I02. Import Depuis des fichiers vers une BD gérée par un SGBD (Import/Chargement)
Importer/Chargez toutes les tables de la BD à partir de fichiers de différents types tels que CSV, Excel et autres. 
Le « ; » est utilisé comme séparateur de colonnes.
*/



-- QUELQUES REPONSES ET RESULTATS POUR DEMARRER ============================
-- Manipulations-Interrogations des données ================================
-- en SQL 2 ================================================================
-- Requêtes dans les tables ================================================

PROMPT =========================================================
PROMPT FB-B : Requetes sur la bd EN SQL 2
PROMPT =========================================================
PROMPT


-- FB FB FB FB FB FB A compléter




PROMPT =========================================================
PROMPT >> Requete A01. Les Noms des clients (Avec éventuellement des doublons)
PROMPT =========================================================
PROMPT
SELECT NOMCLI FROM CLIENTS2 ;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>
-- 
-- Résultat généré:
-- ??? 
PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete A02. Les Noms des clients (Sans les doublons)
PROMPT =========================================================
PROMPT
SELECT DISTINCT NOMCLI FROM CLIENTS2 ;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>
-- 
-- Résultat généré:
-- ??? 
PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete : Chiffre d affaires par pays
PROMPT =========================================================
PROMPT
TTITLE CENTER 'Requete: permet de determiner le chiffre d affaires par pays' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	c.PAYSCLI, SUM((d.PUART*d.QTCOM) * (1-(d.REMISE/100))) AS chiffre_affaires 
FROM	DETAILCOM2 d, CLIENTS2 c, COMMANDES2 k
WHERE	d.NUMCOM  = k.NUMCOM
AND	 	c.CODCLI = k.CODCLI
GROUP BY c.PAYSCLI;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>
-- 
-- Résultat généré:
--
--   Requete: permet de determiner le chiffre d affaires par pays
-- ================================================================
-- PAYSCLI                        CHIFFRE_AFFAIRES
-- ------------------------------ ---------------
-- ??? 

PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =====================================================================
PROMPT >> Requete : Articles commandés toujours en quantité > 5
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Requete: les articles toujours commandés en quantité superieure à 5' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT d.NUMCOM, a.REFART, a.NOMART
FROM   ARTICLES2 a, DETAILCOM2 d
WHERE  a.REFART = d.REFART
AND    d.QTCOM > 5;
      
-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
--
--    Requete: les articles toujours commandés en quantité superieure à 5
-- =========================================================================
-- NUMCOM     REFART NOMART
-- ---------- ------ -------------------------
-- ??? 

PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =====================================================================
PROMPT >> Requete : Articles sans remise depuis le 1er janvier 2005
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Requete: Articles sans remise depuis le 1er janvier 2005' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	d.NUMCOM, a.REFART, a.NOMART
FROM	ARTICLES2 a, DETAILCOM2 d, COMMANDES2 c
WHERE	EXTRACT(YEAR FROM DATCOM) > 2004
AND	c.NUMCOM = d.NUMCOM
AND	d.REFART = a.REFART
AND	d.REMISE = 0;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
--
--    Requete: Articles sans remise depuis le 1er janvier 2005
-- =========================================================================
-- NUMCOM     REFART NOMART
-- ---------- ------ -------------------------
-- ??? 

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT >> Requete : Articles commandés par tous les parisiens
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Requete: les articles qui sont commandés par tous les parisiens' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	REFART, NOMART
FROM	ARTICLES2
WHERE	NOT EXISTS
	(SELECT *
	 FROM	CLIENTS2
	 WHERE	UPPER(VILCLI) = 'PARIS'
	 AND	NOT EXISTS
		(SELECT *
		 FROM	COMMANDES2, DETAILCOM2
		 WHERE	COMMANDES2.NUMCOM = DETAILCOM2.NUMCOM
		 AND	DETAILCOM2.REFART = ARTICLES2.REFART
		 AND	COMMANDES2.CODCLI = CLIENTS2.CODCLI));

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
--
--
-- Requete: les articles qui sont commandés par tous les parisiens
-- =========================================================================
-- REFART NOMART
-- ------ -------------------------
-- ??? 

PROMPT
pause Tapez sur Enter...
PROMPT


-- FB FB FB FB FB FB A compléter


--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
-- MFB FFF +++





/*

Requêtes Ji (PL/SQL : Déclencheurs-Triggers ; Procédures-Fonctions ; Cohérence globale des données ; Qualité des données)

J01. Développez une procédure PL/SQL qui permet de vérifier la cohérence de la BD : 
Vérifiez si toutes les commandes portent au moins sur un article et affichez celles qui sont donc vides !

J02. Afin de garder trace (sauvegarde & suivi) des prix unitaires de chaque article, 
développez un déclencheur qui permet d’enregistrer chaque mise-à-jour de tables des articles !
Pour développer le déclencheur (Trigger) sur les mouvements des articles, il est nécessaire de créer une table HISTORIQUE_MVTS_ARTICLES.

*/



PROMPT =========================================================
PROMPT >> Requete : Trigger sur la mise a jour des prix EN SQL 2
PROMPT =========================================================
PROMPT
TTITLE CENTER 'Requete: Trigger sur la mise à jour des prix' skip 1 -
       LEFT   '=========================================================================' skip 0

PROMPT
PROMPT =========================================================
PROMPT Il est nécessaire de créer une table HISTORIQUE_PRIX qui permet
PROMPT de garder le prix des articles avant leurs mises à jour.
PROMPT C est une table qui aura comme colonne la référence, le nom, le prix
PROMPT d achat, le prix de vente (prix catalogue) de l article avant la mise
PROMPT à jour et la date de la mise à jour.
PROMPT =========================================================
PROMPT
DROP TABLE HISTORIQUE_PRIX;

CREATE TABLE HISTORIQUE_PRIX
(
	REFART 		VARCHAR2(10), 
	NOMART		VARCHAR2(50),
	PVART		NUMBER(10, 2),
	PAART		NUMBER(10, 2),
	DATMAJ		DATE,
	CONSTRAINT	NN_HISTORIQUE_PRIX_NOMART	CHECK(NOMART IS NOT NULL)
);

PROMPT
pause Tapez sur Enter...

PROMPT
PROMPT =========================================================
PROMPT Suppression et création du trigger = déclencheur.
PROMPT =========================================================
PROMPT
DROP TRIGGER MAJ_PRIX_ARTICLES2;

CREATE OR REPLACE TRIGGER MAJ_PRIX_ARTICLES2
	AFTER UPDATE ON ARTICLES2
	FOR EACH ROW

DECLARE
	V_REFART	VARCHAR2(10) := :OLD.REFART;
	V_NOMART	VARCHAR2(50) := :OLD.NOMART;
	V_PVART		NUMBER(10, 2) := :OLD.PVART;
	V_PAART		NUMBER(10, 2) := :OLD.PAART;

BEGIN
	INSERT INTO HISTORIQUE_PRIX (REFART, NOMART, PVART, PAART, DATMAJ)
	VALUES (V_REFART, V_NOMART, V_PVART, V_PAART, SYSDATE);
END;
/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT Exemple avec 2 insertions et 2 mises à jour dans la table ARTICLES2
PROMPT =========================================================
PROMPT
DELETE	FROM	ARTICLES2
WHERE	REFART = 'WD.010';

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.010', 'K7 VIDEO-Exemple de k7', 30.00, 3, 13.00);

DELETE	FROM	ARTICLES2
WHERE	REFART = 'WD.011';

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.011', 'Exemple de DVD', 25.00, 5, 10.00);

PROMPT
pause Tapez sur Enter...
PROMPT

COLUMN REFART	FORMAT A6
COLUMN NOMART	FORMAT A25
COLUMN PVART	FORMAT 99.99
COLUMN QSMART	FORMAT 99
COLUMN PAART	FORMAT 99.99
COLUMN DATMAJ	FORMAT A26

PROMPT =========================================================
PROMPT Visualisation des 2 articles insérés dans ARTICLES2
PROMPT =========================================================
TTITLE CENTER 'Visualisation des 2 articles insérés dans ARTICLES2' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	*
FROM	ARTICLES2
WHERE	REFART in ('WD.010', 'WD.011');

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
--
--  Visualisation des 2 articles insérés dans ARTICLES2
-- ================================================================
-- REFART NOMART                     PVART QSART  PAART
-- ------ ------------------------- ------ ----- ------
-- ??? 

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT MAJ des 2 articles dans ARTICLES2
PROMPT =========================================================
PROMPT
TTITLE CENTER 'Mise à jour des 2 articles insérés dans ARTICLES2' skip 1 -
       LEFT   '=========================================================================' skip 0
UPDATE	ARTICLES2
SET	PVART = 45.00, PAART = 15.00
WHERE	REFART = 'WD.010';

UPDATE	ARTICLES2
SET	PVART = 2.00
WHERE	REFART = 'WD.011';

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Visualisation des 2 articles MAJ dans ARTICLES2
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Visualisation des 2 articles MAJ dans ARTICLES2' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	*
FROM	ARTICLES2
WHERE	REFART in ('WD.010', 'WD.011');

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
--
--
-- Visualisation des 2 articles MAJ dans ARTICLES2
-- =========================================================================
-- REFART NOMART                     PVART QSART  PAART
-- ------ ------------------------- ------ ----- ------
-- ??? 

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Visualisation de la table HISTORIQUE_PRIX
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Visualisation de la table HISTORIQUE_PRIX' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	*
FROM	HISTORIQUE_PRIX;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
--
--
--   Visualisation de la table HISTORIQUE_PRIX
-- =========================================================================
-- REFART NOMART                     PVART  PAART DATMAJ
-- ------ ------------------------- ------ ------ --------------------------
-- ??? 

PROMPT
pause Tapez sur Enter...
PROMPT




PROMPT =====================================================================
PROMPT >> Requete : Procedure PL/SQL => vérification cohérence de la BD
PROMPT =====================================================================
PROMPT
REM Verifier si toutes les commandes portent au moins sur un article et
REM afficher celles qui sont donc vides!

TTITLE CENTER 'Verification de la cohérence de la base de données' skip 1 -
       LEFT   '=========================================================================' skip 0

SET SERVEROUTPUT ON;

PROMPT =====================================================================
PROMPT Suppression et création de la procédure COHERENCE_BD
PROMPT =====================================================================
PROMPT
DROP PROCEDURE COHERENCE_BD;

CREATE OR REPLACE PROCEDURE COHERENCE_BD IS
	CURSOR curseur IS
	SELECT NUMCOM FROM COMMANDES2
	MINUS (SELECT NUMCOM FROM DETAILCOM2);

BEGIN
	DBMS_OUTPUT.PUT_LINE('Le(s) numéro(s) de commande vide(s) sont :');
	FOR i IN curseur LOOP
		DBMS_OUTPUT.PUT_LINE('-  ' || i.NUMCOM);
	END LOOP;
END;
/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Execution de la procédure COHERENCE_BD
PROMPT =====================================================================
PROMPT
EXECUTE COHERENCE_BD;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- Résultat généré:
--
-- Le(s) numéro(s) de commande vide(s) sont :
--   -  20011RB
--
-- Procédure PL/SQL terminée avec succès.
-- Ecoulé : 00 :00 :00.01
-- __________________________________________________________________________

PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =====================================================================
PROMPT >> Requete  : Articles toujours commandés ensemble
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Requete: les articles qui sont toujours commandés ensemble' skip 1 -
       LEFT   '=========================================================================' skip 0


	
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
	

--======================================================================================
--======================================================================================
--======================================================================================
--======================== Liste des magasins de l'entreprise BB =======================
--======================================================================================
--======================================================================================


DROP TABLE MAGASINS_DW2;


PROMPT
Pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT >> Table : MAGASINS_DW2
PROMPT =====================================================================
CREATE TABLE MAGASINS_DW2
(
	NUMMAG		VARCHAR(4),
	NOMMAG		CHAR(30),
	TELMAG		CHAR(15),
	ADRNUMMAG	VARCHAR2(10),
	ADRRUEMAG	VARCHAR2(50),
	ADRCPMAG	VARCHAR2(10),
	ADRVILLEMAG	VARCHAR2(50),
	ADRPAYSMAG	VARCHAR2(50),      
   	CONSTRAINT PK_MAGASINS_DW2 				PRIMARY KEY(NUMMAG),
	CONSTRAINT NN_MAGASINS_DW2_NOMMAG		CHECK(NOMMAG IS NOT NULL),
	CONSTRAINT CK_MAGASINS_DW2_ADRVILLEMAG	CHECK(ADRVILLEMAG = UPPER(ADRVILLEMAG)),
	CONSTRAINT CK_MAGASINS_DW2_ADRPAYSMAG	CHECK(ADRPAYSMAG = UPPER(ADRPAYSMAG))
);



PROMPT =====================================================================
PROMPT Insertion des données de la bd GESCOMI***DW EN SQL 2
PROMPT =====================================================================
PROMPT


PROMPT =====================================================================
PROMPT >> Table : MAGASINS_DW2
PROMPT =====================================================================
PROMPT
INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR01',  'MAG_1_FRANCE', '0142586485', '18', 'AVENUE FOCH', '91000', 'PARIS', 'FRANCE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR02', 'MAG_2_FRANCE', '+33153800796', '21', 'AVENUE D ITALIE', '75013', 'PARIS', 'FRANCE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR03', 'MAG_3_FRANCE','0254974410', '77', 'RUE DE LA LIBERTE', '13001', 'MARSEILLE', 'FRANCE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR04', 'MAG_4_FRANCE', '0657985246', '8 BIS', 'BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', 'FRANCE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR05', 'MAG_5_FRANCE', '0546874430', '55', 'RUE DU JAPON', '94310', 'ORLY-VILLE', 'FRANCE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR06','MAG_6_FRANCE', '0549876546', '18', 'BOULEVARD FOCH', '93800', 'LYON', 'FRANCE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR07', 'MAG_7_FRANCE', '0466468720', '6', 'RUE DE LA ROSIERE', '75015', 'PARIS', 'FRANCE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('BE01', 'MAG_1_BELGIQUE', '003257446571', '13', 'RUE DE LA PAIX', '99999', 'BRUXELLES', 'BELGIQUE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('BE02', 'MAG_2_BELGIQUE', '003254987541', '5', 'RUE DE BELLEVILLE', '99999', 'BRUXELLES', 'BELGIQUE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('BE03', 'MAG_3_BELGIQUE', '0032546713274', '16', 'AVENUE FOCH', '99998', 'ANDERLECK', 'BELGIQUE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('BE04', 'MAG_4_BELGIQUE', '003264787542', '77', 'RUE DE LA LIBERTE', '99998', 'ANDERLECK', 'BELGIQUE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('BE05', 'MAG_5_BELGIQUE', '0032448746842', '134', 'AVENUE DES LILAS', '99999', 'BRUXELLES', 'BELGIQUE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('TN01', 'MAG_1_TUNISIE', '009967687745', '1', 'AVENUE DE CARTAGE', '99000', 'TUNIS', 'TUNISIE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('TN02', 'MAG_2_TUNISIE', '+21624888222', '11', 'BOULEVARD DU 14 JANVIER 2011', '4001', 'SOUSSE', 'TUNISIE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('IT01', 'MAG_1_ITALIE', '0099241564315', '1', 'AVENUE DE ROME', '99001', 'ROME', 'ITALIE');

COMMIT;

PROMPT
pause Tapez sur Enter...
PROMPT

--====================================================================================
--====================================================================================
--====================================================================================
--==================== Modification de la structure des donnée =======================
--====================================================================================
--====================================================================================
--====================================================================================
-- Modifier la structure de la table MAGASINS_DW2
-- Ajouter la colonne MAILMAG de type VARCHAR(30)

-- Développez une procédure CREERMAILMAG qui permet d Insérer les nouvelles données dans cette colonne
-- Le mail d un magasin (en minuscule) est composé de : 'bb' + NUMMAG + 'gmail.com'

-- Vérifier les mails et les téléphones des clients...
-- Développer une procédure qui le fait avec comme paramètres par exemple :
-- les noms de la table et de la colonne à vérifier moyennant une EXPRESSION REGULIERE
-- Créer une table pour stocker les expressions régulière par catégorie de données

--====================================================================================
--====================================================================================



PROMPT =====================================================================
PROMPT Affichage des tables de la bd GESCOM EN SQL 2 
PROMPT =====================================================================
PROMPT


COLUMN NUMMAG		FORMAT A4
COLUMN NOMMAG		FORMAT A8
COLUMN TELMAG		FORMAT A10
COLUMN ADRNUMMAG	FORMAT A5
COLUMN ADRRUEMAG	FORMAT A10
COLUMN ADRCPMAG		FORMAT A7
COLUMN ADRVILLEMAG	FORMAT A10
COLUMN ADRPAYSMAG	FORMAT A10
COLUMN MAILMAG	    FORMAT A10



SELECT * FROM MAGASINS_DW2;

PROMPT
Pause Tapez sur Enter...
PROMPT

SELECT * FROM CLINETS2;

PROMPT
Pause Tapez sur Enter...
PROMPT

-- FB FB FB FB FB FB A compléter


--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
-- MFB FFF +++


--======================================================================================
--======================================================================================
--======================================================================================
COMMIT;	   
SET TIMING OFF;
SPOOL OFF;
--======================================================================================
--======================================================================================
--======================================================================================


--======================================================================================
--======================================================================================
--==================== TRAITEMENT DE CERTAINES ANOMALIES ===============================
/*
Entre parenthèses hihi haha FFF !

Etant donné la table VILPAYS suivante :
Elle est issue des tables de la BD GesComI... 
Faire les requêtes ci-dessous : 
Calculs dans la table VILPAYS !
*/

CREATE TABLE VILPAYS (COL1 VARCHAR2(20), COL2 VARCHAR2(20));
INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
INSERT INTO VILPAYS VALUES ('PARIS', 'FRANCE');
INSERT INTO VILPAYS VALUES ('VILLETANEUSE', 'FRANCE');
INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', '');
INSERT INTO VILPAYS VALUES ('EPINAY SUR SEINE', 'FRANCE');
INSERT INTO VILPAYS VALUES ('PARIS', 'FRANCE');
INSERT INTO VILPAYS VALUES ('PARIS', '');
INSERT INTO VILPAYS VALUES ('PARIS', 'FRANCE');
INSERT INTO VILPAYS VALUES ('MARSEILLE', 'FRANCE');
INSERT INTO VILPAYS VALUES ('PARIS', '');
INSERT INTO VILPAYS VALUES ('ORLY-VILLE', 'FRANCE');
INSERT INTO VILPAYS VALUES ('MARSEILLE', 'FRANC');
INSERT INTO VILPAYS VALUES ('PARYS', 'FR');
INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
INSERT INTO VILPAYS VALUES ('Paris', '');
INSERT INTO VILPAYS VALUES ('PARIS', 'france');
INSERT INTO VILPAYS VALUES ('Bruxelles', 'Belgique');
INSERT INTO VILPAYS VALUES ('Bruxelles', 'Belgique');
INSERT INTO VILPAYS VALUES ('Bruxelles', 'Belgique');
INSERT INTO VILPAYS VALUES ('Bruxelles', 'Belgique');
INSERT INTO VILPAYS VALUES ('Brusselle', 'Belgic');
INSERT INTO VILPAYS VALUES ('Berlin', 'ALLEMANGNE');
INSERT INTO VILPAYS VALUES ('Berlin', 'ALLEMANGNE');
INSERT INTO VILPAYS VALUES ('Berlin', 'ALLEMANGNE');
INSERT INTO VILPAYS VALUES ('Dublin', 'ALEMANGNE');
INSERT INTO VILPAYS VALUES ('TUNIS', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('SOUSSE', 'Italie');
INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('SOUSSE', '');
INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('BIZERTE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('BIZERTE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('BIZERTE', '');
INSERT INTO VILPAYS VALUES ('BIZERTE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('BIZERTE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('DJERBA', 'France');
INSERT INTO VILPAYS VALUES ('HAMMAMET', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('HAMMAMET', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('HAMMAMET', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('HAMMAMET', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('TUNIS', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('PARIS', 'FRANCE');
INSERT INTO VILPAYS VALUES ('VILLETANEUSE', 'FRANC');
INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
INSERT INTO VILPAYS VALUES ('PARIS', 'FRANC');
INSERT INTO VILPAYS VALUES ('VILLETANEUSE', 'FRANC');
INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
INSERT INTO VILPAYS VALUES ('VILLETANEUSE', 'FRANC');
INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
INSERT INTO VILPAYS VALUES ('PARIS', 'FRANC');
INSERT INTO VILPAYS VALUES ('VILLETANEUSE', 'FRANC');
INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
INSERT INTO VILPAYS VALUES ('VILETANEUSE', 'FRANC');
INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
INSERT INTO VILPAYS VALUES ('PARIS', 'FRANC');
INSERT INTO VILPAYS VALUES ('VILLETANEUSE', 'FRANC');
INSERT INTO VILPAYS VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
INSERT INTO VILPAYS VALUES ('ROME', 'ITALIE');
INSERT INTO VILPAYS VALUES ('ROME', 'ITALIA');
INSERT INTO VILPAYS VALUES ('MADRID', 'Espagne');
INSERT INTO VILPAYS VALUES ('MADRID', 'Spain');
INSERT INTO VILPAYS VALUES ('Dakar', 'SENEGAL');
INSERT INTO VILPAYS VALUES ('Dakar', 'SENEGAL');
INSERT INTO VILPAYS VALUES ('Dakar', 'SENEGAL');
INSERT INTO VILPAYS VALUES ('Dakar', 'SENEGUAL');
INSERT INTO VILPAYS VALUES ('Dacar', 'SENEGAL');
INSERT INTO VILPAYS VALUES ('Dakar', 'SENEGAL');
INSERT INTO VILPAYS VALUES ('Alger', 'ALGERIE');
INSERT INTO VILPAYS VALUES ('Alger', 'ALGERIE');
INSERT INTO VILPAYS VALUES ('Alger', 'ALGERIE');
INSERT INTO VILPAYS VALUES ('Alger', 'ALGERIA');
INSERT INTO VILPAYS VALUES ('Alger', 'ALGERIE');
INSERT INTO VILPAYS VALUES ('Alger', 'ALGERIE');
INSERT INTO VILPAYS VALUES ('ALGER', 'ALGER');
INSERT INTO VILPAYS VALUES ('CAIRO', 'Egypt');
INSERT INTO VILPAYS VALUES ('Marrakech', 'Marroc');
INSERT INTO VILPAYS VALUES ('Fès', 'Maroc');
INSERT INTO VILPAYS VALUES ('Rabat', 'Marok');
INSERT INTO VILPAYS VALUES ('Rabat', 'Maroc');
INSERT INTO VILPAYS VALUES ('Rabat', 'Maroc');
INSERT INTO VILPAYS VALUES ('Rabat', 'Maroc');
INSERT INTO VILPAYS VALUES ('Rabat', 'Maroc');
INSERT INTO VILPAYS VALUES ('Casablanca', 'Maroc');
INSERT INTO VILPAYS VALUES ('Casablanka', 'Maroc');
INSERT INTO VILPAYS VALUES ('Rabat', '');
COMMIT; 

--======================================================================================
--======================================================================================
--======================================================================================

REM VISUALISATION DES DONNEES
SELECT * FROM VILPAYS;

REM HOMOGENEISATION DES DONNEES : TOUT EN MAJUSCULE
UPDATE VILPAYS SET COL1 = UPPER(COL1);
UPDATE VILPAYS SET COL2 = UPPER(COL2);
COMMIT;
SELECT * FROM VILPAYS;

REM Calcul du nombre de lignes dans la table
SELECT COUNT(*) FROM VILPAYS;

REM Calcul du nombre de villes, du nombre de pays
SELECT COUNT(COL1) AS NBVILLES, COUNT(COL2) AS NBPAYS FROM VILPAYS;

REM Calcul du nombre de villes, du nombre de pays
SELECT COUNT(DISTINCT COL1) AS NBVILLES, COUNT(DISTINCT COL2) AS NBPAYS FROM VILPAYS;

REM Compter le nombre doccurrences par valeur de COL1 et valeur de COL2 afin de détecter d éventuelles anomalies
CREATE OR REPLACE VIEW V1 (VILLE, NOMBRE) SELECT COL1, COUNT(*) FROM VILPAYS GROUP BY COL1 ORDER BY 1;
SELECT * FROM V1;
CREATE OR REPLACE VIEW V2 (VILLE, NOMBRE) SELECT COL2, COUNT(*) FROM VILPAYS GROUP BY COL2 ORDER BY 1;
SELECT * FROM V2;

REM On considère que la valeur la plus fréquente (pour chaque groupe de valeurs similaires) est la chaine de caractères valide
REM Développez le processus qui permet de corriger les anomalies

-- A VOUS !

-- BON COURAGE -- MFB

-- FB FB FB FB FB FB A compléter


--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
-- MFB FFF +++


--======================================================================================
--======================================================================================
--==================== TRAITEMENT DE CERTAINES ANOMALIES ===============================
/*
Entre parenthèses hihi haha FFF !

Etant donné la table TABCLI suivante :
Elle est issue des tables de la BD GesComI... 
Faire les requêtes ci-dessous : 
Eliminer les doubles et les similaires !
*/

CREATE TABLE TABCLI (COL1 VARCHAR(10), COL2 VARCHAR(12), COL3 VARCHAR(10), COL4 VARCHAR(10), COL1 VARCHAR(1));
INSERT INTO TABCLI VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENCE', '3');
INSERT INTO TABCLI VALUES ('2996100', 'Monsieur', 'CLEMENCE', 'ALEXANDRE', '1');
INSERT INTO TABCLI VALUES ('3000107', 'MO NSIEUR', 'ONRI', 'PANDA', '2');
INSERT INTO TABCLI VALUES ('2997777', 'Mademoiselle', 'LE BON', 'CLEMENTINE', '1');
INSERT INTO TABCLI VALUES ('299PPPP', 'Mlle', 'BON', 'CLEMENTINE', '1');
INSERT INTO TABCLI VALUES ('2997007', 'Monsieur', 'TRAIFOR', 'ADAM', '2');
INSERT INTO TABCLI VALUES ('2998500', 'Monsieur', 'CHEVALIER', 'INES', '1');
INSERT INTO TABCLI VALUES ('3000106', 'Monsieur', 'HARISSA', 'FORD', '1');
INSERT INTO TABCLI VALUES ('3000108', 'Madame', 'EDITE', 'FIAT', '1');
INSERT INTO TABCLI VALUES ('3000109', 'Madame', 'TOYOTA', 'JACKSON', '3');
INSERT INTO TABCLI VALUES ('3000111', 'Madame', 'GENEREUX', 'EVE', '1');
INSERT INTO TABCLI VALUES ('3001778', 'Mr', 'COURTOIS', 'Bruno', '1');
INSERT INTO TABCLI VALUES ('3001779', 'Monsieur', 'VANDERHOTE', 'Ivan', '1');
INSERT INTO TABCLI VALUES ('3001780', 'Monsieur', 'Hollanda', 'Francis', '1');
INSERT INTO TABCLI VALUES ('3001781', 'Monsieur', 'Bernard', 'Hugues', '1');
INSERT INTO TABCLI VALUES ('3001782', 'Monsieur', 'LATIFOU', 'Ilyas', '1');
INSERT INTO TABCLI VALUES ('3001783', 'Madame', 'LALLEMAND', 'Ines', '1');
INSERT INTO TABCLI VALUES ('3001784', 'Monsieur', 'DEUTCH', 'Hans', '1');
INSERT INTO TABCLI VALUES ('3001785', 'Madame', 'ALMANI', 'Eve', '1');
INSERT INTO TABCLI VALUES ('3001786', 'Madame', 'MERQUELLE', 'Angela', '1');
INSERT INTO TABCLI VALUES ('3001', 'M.', 'LE BON', 'Adam', '1');
INSERT INTO TABCLI VALUES ('3001777', 'Mr', 'LE BON', 'Adem', '1');
INSERT INTO TABCLI VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLI VALUES ('2998505', 'Mademoiselle', 'TRAIFOR', 'ALICE', '2');
INSERT INTO TABCLI VALUES ('3000110', 'MADAME', 'ONRI', 'HONDA', '2');
INSERT INTO TABCLI VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLI VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLI VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '');
INSERT INTO TABCLI VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLI VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
COMMIT; 

--======================================================================================
--======================================================================================
--======================================================================================

REM VISUALISATION DES DONNEES
SELECT * FROM TABCLI;

REM ??? Que fait la commande ci-dessous ?
SELECT DISTINCT * FROM TABCLI ;

-- FB FB FB FB FB FB A compléter


--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
-- MFB FFF +++
