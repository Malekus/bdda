-- ===============================================================================
-------- Universit� Sorbonne Paris Cit�, Universit� Paris 13 , Institut Gali�e
-------- Master 2, Informatique, Exploration Informatique des Donn�es et D�cisionnel
-------- M2 EID2

-- ===============================================================================
-------- La Data ; The Data
-------- La Donn�e est le monde du futur ; Les donn�es et le monde de l'avenir
-------- The Data is the world of the future ;  The Data and the future's world

-------- DATA -->>> Big Data, Dark Data, Open Data, ...
-- ===============================================================================
-------- Bases de Donn�es Avanc�es = Advanced Databases (BDA)
-------- Entrep�ts de Donn�es = Data Warehouses (DWH, EDON)

-------- Directeur :  Dr. M. Faouzi Boufar�s
-------- Enseignant-Chercheur Responsable

-------- Page Web : http://www.lipn.univ-paris13.fr/~boufares

-------- http://www.lipn.univ-paris13.fr/~boufares/Master2EID2/*.sql

-- ===============================================================================
-- ===============================================================================
--   Projet  BDM : Big Data Management - Gestion des Donn�es Massives
--
--   Data Manipulation (DI) - Manipulation de Donn�es
--   Data Integration (DI) - Int�gration de Donn�es
--   Donn�es structur�es ; Donn�es Semi-structur�es ; Donn�es NON structur�es
--   Structured data; Semi-structured data; NON-structured data

--   Master Data Management (MDM) - Gestion des Donn�es de R�f�rence
--   Data Quality Managment (DQM) - Gestion de la qualit� des donn�es
--   Data Cleaning - Nettayage des donn�es
--   Data deduplication - Elimination des doubles et des similaires

--   More semantics to better correct the data
--   Plus de s�mantique afin de mieux corriger les donn�es
-- ===============================================================================
-- ===============================================================================
--
--------=============  BIG DATA, DATA BASE, DATA WAREHOUSE =============----------
--
-- Big Data & Clound Computing : Think DIFFERENTLY, BIGGER and SMARTER !
-- The Excellence in Data Use !
-- EID : L'Excellence dans l'Investigation des Donn�es
-- EID : Excellence in Data Investigation
--
-- ===============================================================================
-- Think DIFFERENTLY, BIGGER and SMARTER ! The Excellence in Data Use !
-- MISSION IMPOSSIBLE OU POSSIBLE ????? !!!!!!!!!!!
-- Votre mission, si vous l�acceptez, est : The Excellence in Data Use !
-- Si vous �chouez, nous nierons avoir eu connaissance de vos agissements !

-- ===============================================================================
-- Les dictons du jour !
--
-- Aujourd'hui, j'arr�te de fumer
-- Le TABAC t'ABAT
-- Fumer nuit gr�vement � ta sant� et � celle de ton entourage
--
-- M   T   Dents
-- SMILE and the World SMILES with you !
--
-- MANGER + MANGER = GROSSIR (??? M, A, N, G, E, R, O, S, S, I)
--
-- Manger & Bouger,
-- Pour votre sant� mangez 5 fruits et l�gumes par jour
-- Pour votre sant� ne mangez pas trop gras, trop sal�, trop sucr�
-- Pour votre sant� faites une activit� physique r�guli�re
-- Pour votre sant� faites 30 mn de marche par jour
-- Pour votre sant� faites des BD !!!
--
-- Dr. M. Faouzi Boufar�s
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
---  Lieu              : Universit� Sorbonne Paris Cit�, Universit� Paris 13, Institut Gali�e
-- ===============================================================================
-- ===============================================================================
-------------------- Master 2 EID2 - Promotion 2018-2019 -------------------------

-- Groupe de Travail N� (Bin�me)  : B20

-- NOM Pr�nom 1                   : ELILTHAMILVALAVAN Magilan
-- NOM Pr�nom 2                   : MOUSSA Abdelkader

-- ====>>> Vos fichiers sql devront s'appeler : Bxy-NomDuFichier.sql
-- ====>>> Ce fichier sql s'appelle : Bxy-G1.sql

-- ===============================================================================
-- ===============================================================================
-- ===============================================================================
--   Probl�matique    :  Int�gration de donn�es h�t�rog�nes, distribu�es

--   Probl�matique    :  Traitement des anomalies �ventuelles
--   Probl�matique    :  Plusieurs types d'anomalies INTRA-Colonne ; INTER-COLONNES ; INTER-LIGNES

--   Probl�matique    :  Standardisation de donn�es h�t�rog�nes
--   Probl�matique    :  Traitement des valeurs invalides syntaxiquement
--   Probl�matique    :  Traitement des valeurs invalides s�mantiquement
--   Probl�matique    :  Traitement des valeurs nulles
--   Probl�matique    :  Traitement des redondances s�mantiques (D�pendances fonctionnelles)
--   Probl�matique    :  Elimination des doubles et similaires

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


SPOOL B20-GCI-01.lst

PROMPT =========================================================
-- Nom du Cas       :  Gestion Commerciale Intelligente : GESCOMI : GCI
-- Nom de SGBD      :  ORACLE DBMS
-- Date de cr�ation :  SEPTEMBER 2018
-- Auteur           :  Faouzi BOUFARES
-- Universit�       :  Universit� Sorbonne Paris Cit�, Universit� Paris 13
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
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH' ;
PROMPT =========================================================

-- ===============================================================================
-- D�finition de la structure des donn�es ================= DEBUT    =============
-- en SQL 2 ======================================================================
-- Cr�ation des tables ============= Magasin FR01 ====== PARIS   =================

PROMPT Destruction des tables de la bd GESCOMI EN SQL 2
PROMPT =========================================================
PROMPT
DROP TABLE DETAILCOM;
DROP TABLE ARTICLES;
DROP TABLE COMMANDES;
DROP TABLE CLIENTS;
PROMPT
-- pause Tapez sur Enter...
PROMPT
PROMPT =========================================================
PROMPT Cr�ation des tables de la bd GESCOMI EN SQL 2
PROMPT =========================================================
PROMPT
PROMPT =========================================================
PROMPT >> Table : CLIENTS
PROMPT =========================================================
PROMPT

CREATE TABLE CLIENTS
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
	CONSTRAINT PK_CLIENTS				PRIMARY KEY(CODCLI),
	CONSTRAINT CK_CLIENTS_CIVCLI		CHECK(CIVCLI IN ('Mademoiselle', 'Madame', 'Monsieur')),
	CONSTRAINT CK_CLIENTS_CATCLI		CHECK(CATCLI BETWEEN 1 and 7),
	CONSTRAINT NN_CLIENTS_NOMCLI		CHECK(NOMCLI IS NOT NULL),
	CONSTRAINT NN_CLIENTS_PRENCLI		CHECK(PRENCLI IS NOT NULL),
	CONSTRAINT NN_CLIENTS_CATCLI		CHECK(CATCLI IS NOT NULL),
	CONSTRAINT CK_CLIENTS_VILCLI		CHECK(VILCLI = UPPER(VILCLI)),
	CONSTRAINT CK_CLIENTS_PAYSCLI		CHECK(PAYSCLI = UPPER(PAYSCLI))
);
PROMPT
-- pause Tapez sur Enter...
PROMPT
PROMPT =========================================================
PROMPT >> Table : COMMANDES
PROMPT =========================================================
PROMPT

CREATE TABLE COMMANDES
(
	NUMCOM 		VARCHAR2(10),
	CODCLI		VARCHAR2(10),
	DATCOM		DATE,
	CONSTRAINT PK_COMMANDES					PRIMARY KEY(NUMCOM),
	CONSTRAINT NN_COMMANDES_DATCOM			CHECK(DATCOM IS NOT NULL),
	CONSTRAINT FK_COMMANDES_CODCLI_CLIENTS	FOREIGN KEY(CODCLI)	REFERENCES CLIENTS(CODCLI)
);
PROMPT
-- pause Tapez sur Enter...
PROMPT
PROMPT =========================================================
PROMPT >> Table : ARTICLES
PROMPT =========================================================
PROMPT
CREATE TABLE ARTICLES
(
	REFART 		VARCHAR2(10),
	NOMART		VARCHAR2(50),
	PVART		NUMBER(10, 2),
	QSART		NUMBER(3),
	PAART		NUMBER(10, 2),
	CONSTRAINT PK_ARTICLES				PRIMARY KEY(REFART),
	CONSTRAINT NN_ARTICLES_NOMART		CHECK(NOMART IS NOT NULL),
	CONSTRAINT CK_ARTICLES_QSART		CHECK(QSART < 1000)
);
PROMPT
-- pause Tapez sur Enter...
PROMPT
PROMPT =========================================================
PROMPT >> Table : DETAILCOM
PROMPT =========================================================
PROMPT
CREATE TABLE DETAILCOM
(
	NUMCOM 		VARCHAR2(10),
	REFART		VARCHAR2(10),
	QTCOM		NUMBER(3),
	PUART		NUMBER(10, 2),
	REMISE		NUMBER(4, 2),
	CONSTRAINT PK_DETAILCOM					PRIMARY KEY(NUMCOM, REFART),
	CONSTRAINT CK_DETAILCOM_QTCOM			CHECK(QTCOM < 1000),
	CONSTRAINT NN_DETAILCOM_QTCOM			CHECK(QTCOM IS NOT NULL),
	CONSTRAINT NN_DETAILCOM_PUART			CHECK(PUART IS NOT NULL),
	CONSTRAINT NN_DETAILCOM_REMISE			CHECK(REMISE IS NOT NULL),
	CONSTRAINT FK_DETAILCOM_NUMCOM_COM		FOREIGN KEY(NUMCOM)	REFERENCES COMMANDES(NUMCOM),
	CONSTRAINT FK_DETAILCOM_REFART_ARTICLES	FOREIGN KEY(REFART)	REFERENCES ARTICLES(REFART)
);
PROMPT
-- pause Tapez sur Enter...

-- ===============================================================================
-- D�finition de la structure des donn�es =========== FIN     ====================
-- en SQL 2 ======================================================================

-- ===============================================================================
-- Insertion des donn�es ============================ DEBUT ======================
-- en SQL 2 ======================================================================
-- Insertion des lignes dans les tables ==========================================

PROMPT
PROMPT =====================================================================
PROMPT Insertion des donn�es de la bd EN SQL 2 POUR UN MAGASIN donn� Le FR01 de Paris
PROMPT =====================================================================
PROMPT
PROMPT =========================================================
PROMPT >> Insertion dans la Table : CLIENTS
PROMPT =========================================================
PROMPT
INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C001', 'Madame', 'CLEM@ENT', 'EVE', 1, '18', 'BOULEVARD FOCH', '91000', 'EPINAY-SUR-ORGE', 'FRANCE','eve.clement@gmail.com', '+33777889911');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C002', 'Madame', 'LESEUL', 'MARIE', 1, '21', 'AVENUE D ITALIE', '75013', 'PARIS', 'FRANCE','marieleseul@yahoo.fr', '0617586565');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C003', 'Madame', 'UNIQUE', 'MARINE', 2, '77', 'RUE DE LA LIBERTE', '13001', 'MARCHEILLE', 'FRANCE','munique@gmail.com', '+33777889922');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C004', 'Madame', 'CLEMENCE', 'EVELYNE', 3, '8 BIS', 'BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', 'FRANCE','clemence evelyne@gmail.com', '+33777889933');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C005', 'Madame', 'FORT', 'JEANNE', 3, '55', 'RUE DU JAPON', '94310', 'ORLY-VILLE', 'FRANCE','jfort\@hotmail.fr', '+33777889944');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C006', 'Mademoiselle', 'LE BON', 'CLEMENCE', 1, '18', 'BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', 'FRANCE','clemence.le bon@cfo.fr', '0033777889955');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C007', 'Mademoiselle', 'TRAIFOR', 'ALICE', 2, '6', 'RUE DE LA ROSIERE', '75015', 'PARIS', 'FRANCE','alice.traifor@yahoo.fr', '+33777889966');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C008', 'Monsieur', 'VIVANT', 'JEAN-BAPTISTE', 1, '13', 'RUE DE LA PAIX', '93800', 'EPINAY-SUR-SEINE', 'FRANCE','jeanbaptiste@', '0607');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C009', 'Monsieur', 'CLEMENCE', 'ALEXANDRE', 1, '5', 'RUE DE BELLEVILLE', '75019', 'PARIS', 'FRANCE','alexandre.clemence@up13.fr', '+33149404071');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C010', 'Monsieur', 'TRAIFOR', 'ALEXANDRE', 1, '16', 'AVENUE FOCH', '75016', 'PARIS', 'FRA','alexandre.traifor@up13.fr', '06070809');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C011', 'Monsieur', 'PREMIER', 'JOS//EPH', 2, '77', 'RUE DE LA LIBERTE', '13001', 'MARCHEILLE', 'FRANCE','josef@premier', '+33777889977');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C012', 'Monsieur', 'CLEMENT', 'ADAM', 2, '13', 'AVENUE JEAN BAPTISTE CLEMENT', '9430', 'VILLETANEUSE', 'FRANCE','adam.clement@gmail.com', '+33149404072');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C013', 'Monsieur', 'FORT', 'GABRIEL', 5, '1', 'AVENUE DE CARTAGE', '99000', 'TUNIS', 'TUNISIE','gabriel.fort@yahoo.fr', '+21624801777');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C014', 'Monsieur', 'ADAM', 'DAVID', 5, '1', 'AVENUE DE ROME', '99001', 'ROME', 'ITALIE','david.adam�@gmail com', '');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C015', 'Monsieur', 'Labsent', 'pala', 7, '1', 'rue des absents', '000', 'BAGDAD', 'IRAQ','pala-labsent@paici', '');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C016', 'Madame', 'obsolete', 'kadym', 7, '1', 'rue des anciens', '000', 'CARTHAGE', 'IFRIQIA','inexistant', 'inexistant');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C017', 'Madame', 'RAHYM', 'KARYM', 1, '1', 'RUE DES GENTILS', '1000', 'CARTHAGE', 'TUNISIE','karym.rahym@gmail.com', '+21624808444');

PROMPT
-- pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Insertion dans la Table : COMMANDES
PROMPT =========================================================
PROMPT
INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20001AB', 'C012', 'SUNDAY 17-SEPTEMBER-2000');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20002AB', 'C001', 'SUNDAY 17-SEPTEMBER-2000');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20003AB', 'C006', ' MONDAY 16-OCTOBER-2000');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20004AB', 'C006', 'TUESDAY 24-OCTOBER-2000');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20011RB', 'C012', 'MONDAY 22-JANUARY-2001');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20012RB', 'C012', 'TUESDAY 13-MARCH-2001');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20031FB', 'C001', 'FRIDAY 14-FEBRURAY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20051FB', 'C003', 'FRIDAY 07-JANUARY-2005');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20052FB', 'C003', 'Wednesday 12-JANUARY-2005');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20053FB', 'C012', 'THURSDAY 10-MARCH-2005');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20054FB', 'C007', 'MONDAY 14-MARCH-2005');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20055FB', 'C012', 'FRIDAY 11-MARCH-2005');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20056FB', 'C013', 'MONDAY 14-MARCH-2005');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20057FB', 'C014', 'FRIDAY 11-MARCH-2005');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20061FB', 'C010', 'FRIDAY 14-FEBRUARY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20062FB', 'C009', 'FRIDAY 14-FEBRUARY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20065FB', 'C007', 'FRIDAY 14-FEBRUARY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20066FB', 'C002', 'FRIDAY 14-FEBRUARY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20067FB', 'C002', 'FRIDAY 14-FEBRUARY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20068FB', 'C002', 'FRIDAY 14-FEBRUARY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20069FB', 'C002', 'TUESDAY 30-JANUARY-2007');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20070FB', 'C002', 'TUESDAY 30-JANUARY-2007');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20071FB', 'C013', 'TUESDAY 30-JANUARY-2007');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20072FB', 'C013', 'TUESDAY 30-JANUARY-2007');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20073FB', 'C014', 'TUESDAY 30-JANUARY-2007');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20074FB', 'C014', 'TUESDAY 30-JANUARY-2007');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20184FB', 'C014', 'MONDAY 17-SEPTEMBER-2018');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20181AB', 'C012', 'MONDAY 17-SEPTEMBER-2018');

PROMPT
-- pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Insertion dans la Table : ARTICLES
PROMPT =========================================================
PROMPT
INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.001', 'SIEGE DE TABLE', 35.00, 10, 26.43);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.002', 'CASQUE CYCLISTE PROTECTION', 27.00, 20, 20.00);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.003', 'BONNET PARE-CHOCS', 10.71, 100, 5.71);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.004', 'STORE DE PROTECTION', 7.43, 5, 4.29);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.005', 'COINS DE PROTECTION', 4.00, 100, 1.71);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.006', 'CACHE PRISE DE COURANT', 2.29, 500, 0.71);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.007', 'BLOQUE PORTE', 5.00, 4, 2.29);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.008', 'BANDE DE FERMETURE', 3.29, 4, 1.71);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.009', 'PROTECTION DE FOUR', 37.86, 10, 26.43);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.010', 'PROTECTION DE CUISINIERE', 30.71, 10, 22.86);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.011', 'BABY PHONE', 80.71, 3, 45.71);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.012', 'BRETELLE DE SECURITE', 15.57, 8, 11.43);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.013', 'HAUSSE-CHAISE', 42.71, 1, 25.43);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.014', 'COUVRE ROBINETTERIE', 7.86, 12, 4.29);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.001', 'BARRIERE DE PORTE, EN BOIS', 32.71, 2, 25.71);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.002', 'BARRIERE DE PORTE, EN METAL', 49.14, 3, 28.43);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.003', 'BARRIERE DE LIT', 23.71, 10, 15.71);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.004', 'PORTE-BEBE', 44.86, 6, 34.29);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.005', 'SIEGE-AUTO COSMOS', 126.86, 2, 71.43);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.006', 'SIEGE-AUTO EUROSEAT', 121.29, 2, 71.43);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('FB.001', 'DVD-SPIRIT', 24.90, 2, 12.00);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('FB.002', 'DVD-SPIDER MAN', 24.90, 2, 12.00);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('FB.003', 'DVD-SPIDER MAN 2', 24.90, 2, 12.00);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.001', 'K7 VIDEO-TOY STORY', 21.29, 10, 9.29);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.002', 'DVD-TOY STORY 2', 34.29, 10, 12.14);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.003', 'K7 VIDEO-WINNIE L OURSON', 22.86, 5, 9.29);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.004', 'DVD-FRERES DES OURS', 35.00, 3, 13.00);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.005', 'K7 VIDEO-LE ROI LION', 30.00, 1, 13.00);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.006', 'K7 VIDEO-LE ROI LION 2', 30.00, 4, 13.00);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.007', 'K7 VIDEO-LE ROI LION 3', 30.00, 3, 13.00);

PROMPT
-- pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Insertion dans la Table : DETAILCOM
PROMPT =========================================================
PROMPT
INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20001AB', 'F1.001', 2, 35.00, 2.50);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20001AB', 'F1.003', 4, 10.71, 3.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20001AB', 'F1.013', 2, 49.14, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20001AB', 'WD.001', 1, 21.29, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20002AB', 'F1.001', 2, 33.00, 3.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20002AB', 'WD.001', 1, 21.29, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20002AB', 'WD.002', 1, 34.29, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20002AB', 'WD.003', 1, 22.86, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20003AB', 'FB.001', 5, 21.00, 4.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20003AB', 'WD.002', 1, 34.29, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20003AB', 'WD.003', 1, 22.86, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20004AB', 'F1.008', 2, 3.29, 3.50);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20004AB', 'WD.001', 1, 21.29, 2.50);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20012RB', 'F1.007', 5, 5.00, 3.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20012RB', 'F1.009', 1, 37.86, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20012RB', 'FB.003', 5, 24.00, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20031FB', 'F1.008', 2, 3.29, 3.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20031FB', 'F2.001', 1, 30.71, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20031FB', 'FB.001', 5, 21.00, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20051FB', 'F1.008', 2, 3.29, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20051FB', 'FB.001', 5, 21.00, 4.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20052FB', 'F1.001', 2, 35.00, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20052FB', 'F1.003', 4, 10.71, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20052FB', 'F1.013', 2, 49.14, 3.50);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20052FB', 'WD.001', 1, 21.29, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20052FB', 'WD.003', 1, 22.86, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20053FB', 'WD.003', 1, 22.86, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20054FB', 'WD.003', 1, 22.86, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20055FB', 'F1.008', 5, 3.29, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20055FB', 'F1.009', 1, 37.86, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20055FB', 'F1.011', 2, 80.71, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20055FB', 'F2.001', 1, 30.71, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20056FB', 'F1.011', 2, 80.71, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20057FB', 'F2.001', 1, 30.71, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20061FB', 'FB.003', 5, 24.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20062FB', 'FB.003', 5, 24.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20065FB', 'FB.003', 5, 24.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20066FB', 'FB.003', 5, 24.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20067FB', 'FB.001', 22, 24.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20068FB', 'FB.001', 22, 24.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20069FB', 'FB.001', 25, 58.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20070FB', 'FB.001', 50, 24.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20071FB', 'FB.001', 37, 27.90, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20072FB', 'FB.001', 8, 34.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20073FB', 'FB.001', 35, 15.50, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20074FB', 'FB.001', 12, 19.99, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20181AB', 'FB.001', 7, 17.77, 0.00);

PROMPT =========================================================
PROMPT Validation des insertions dans la bd EN SQL 2
PROMPT =========================================================

COMMIT;

PROMPT
-- pause Tapez sur Enter...

-- Affichage des donn�es ===================================================
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

SELECT * FROM CLIENTS;

PROMPT
-- pause Tapez sur Enter...
PROMPT

SELECT * FROM COMMANDES;

PROMPT
-- pause Tapez sur Enter...
PROMPT

SELECT * FROM ARTICLES;

PROMPT
-- pause Tapez sur Enter...
PROMPT

SELECT * FROM DETAILCOM;

PROMPT
-- pause Tapez sur Enter...
PROMPT
-- ===============================================================================
-- Insertion des donn�es ============================ FIN ========================
-- en SQL 2 ======================================================================
-- Insertion des lignes dans les tables ==========================================

-- ===============================================================================
-- Insertion des lignes dans les tables ==========================================
-- Manipulations-Interrogations des donn�es ========= DEBUT ======================
-- en SQL 2 ======================================================================
-- Requ�tes dans les tables ======================================================

PROMPT =========================================================
PROMPT FB-A : Requetes sur la bd EN SQL 2 : A, B, C, D, E, F, I, J...
PROMPT =========================================================
PROMPT
/*
Exemples de requ�tes � Tester :

Requ�tes Ai (S�lections + Projections)
A01. Les Noms des clients (Avec �ventuellement des doublons)
A02. Les Noms des clients (Sans les doublons)
A03. Les articles dont le prix de vente est sup�rieur ou �gal au double du prix d�achat
A04. Les articles dont le prix de vente est soit 4 soit 27 soit 35
A05. Les articles dont le prix de vente est compris entre 30 et 50
A06. Les commandes du mois de SEPTEMBER 2015
A07. Les d�tails des commandes d�une ann�e donn�e (2012)
A08. Les clients de � Paris � (Civilit� Nom Pr�nom, Ville)
A09. Les clients dont le nom commence par � C �
A10. Les articles dont le nom commence par � Barri�res de � �
A11. Les articles du fournisseur � WD �
A12. Les clients pour lesquels on n'a pas de t�l�phone
A13. Les clients dont le nom de la ville se prononce comme � pari � ou � barizzz � ou � pary �
A14. D�codification de la cat�gorie des clients : Transformez la cat�gorie comme suit :
     1 ? Grossiste, 2 ? Demi-Gros, ? D�taillant
A15. Qualit� des donn�es ::: Y-a-t-il des anomalies dans les donn�es ; Quelles sont ces anomalies ?
A15a. Les clients pour lesquels les mails sont invalides (Code, Nom, et Mail)
A15b. Les clients pour lesquels les t�l�phones sont invalides (Code, Nom, et Mail)

Requ�tes Bi (Tris + S�lections + Projections + Calculs)
B01. Classez les clients par ville, par ordre croissant
B02. Classez les articles de PV < 20, dans l�ordre d�croissant du stock
B03. Calculez la marge pour chaque article (marge = PV � PA !)
B04. Calculez la marge pour tous les si�ges
B05. Classez la marge pour tous les si�ges, dans l�ordre d�croissant de la marge

Requ�tes Ci (Calculs + S�lections+ Projections)
C01. Nombre de clients (Femme + Homme)
C02. Nombre de clientes (Femme)
C03. Nombre de clients (Homme)
C04. Le prix de vente le plus �lev�
C05. Moyenne des prix de vente des articles
C06. Le chiffre d�affaires global
C07. Les articles dont le prix de vente est sup�rieur � la moyenne des prix de vente

Requ�tes Di (Calculs + Sous-Totaux + S�lections+ Projections)
D01. Nombre de clients par cat�gorie
D02. Nombre de clients parisiens par cat�gorie
D03. Montant de chaque commande
D04. Nombre de clients parisiens par cat�gorie, nombre > 2
D05. Total des quantit�s command�es par article
D06. Total des quantit�s command�es par cat�gorie d�article
D07. Total du chiffre d�affaires par cat�gorie d�article
D08. Total, moyenne, min et max du chiffre d�affaires par cat�gorie d�article
D09. Le chiffre d�affaires par ann�e

Requ�tes Ei (Jointures + S�lections + Projections)
E01.   ? Diff�rents types de jointures (�qui-jointure)  : voir pages suivantes
E02. full outer join
E03. left join
E04. right join
E05. Produit Cart�sien (Le cas le plus g�n�ral sans clause WHERE ; la jointure est un cas particulier)
E06. La t�ta-jointure (t�ta appartient � < <= > >= <>)
E07.
E08. Jointure & Optimisation des requ�tes
E09. Jointure avec une requ�te dans la clause FROM
E10. Jointure & Ordre d�ex�cution des tables

Requ�tes Fi (Calculs + Sous-Totaux + Unions + Intersections + Diff�rences + Jointures)
F01. Clients ayant command� en SEPTEMBER 2011
F02. Montant total des commandes de SEPTEMBER 2011
F03. Commandes ayant des articles dont le prix vente est sup�rieur � 20 (Commande, Article, PV)
F04. Commandes ayant des articles dont le prix vente est sup�rieur � 20 (Commande, Nombre)
F05. Commandes ayant 4 articles dont le prix vente est sup�rieur � 20
F06. Les clients de paris qui n�ont pas command� en OCTOBER 2011
F07. Les clients de paris ou ceux ayant command� en OCTOBER 2011

Requ�tes Gi (Divisions)
G01. Les articles qui figurent sur toutes les commandes !
G02. Articles command�s par tous les parisiens
G03. Les articles qui figurent sur toutes les commandes d�une p�riode donn�e !

Requ�tes Hi (SQL Avanc�, SQL pour le multidimensionnel)
H01. Nombre de clients
H02. Nombre de pays
H03. Nombre de clients par cat�gorie
H04. Nombre de clients par cat�gorie et par ville
H05. Nombre de clients par ville et par cat�gorie
H06. Nombre de clients par cat�gorie et par ville ? fonction CUBE
H07. Nombre de clients par cat�gorie et par ville ? fonction ROLLUP

H08. Classez les clients par ordre d�croissant du chiffre d�affaires CA
H09. Classez les clients par ordre d�croissant du ca, donnez le rang
H10. Classez les clients par ordre d�croissant du ca, donnez le rang : RANK() OVER�
H11. Clients par ordre d�croissant du ca et de la cat�gorie, donnez le rang
H12. Clients par ordre d�croissant du ca et de la cat�gorie, donnez le rang


Requ�tes Ii (SQL Gestion de Gros volumes de Donn�es - Export / Import)
I01. Export depuis une BD g�r�e par un SGBD vers des fichiers (Extraction/Export/D�chargement)
Utilisation de l�utilitaire SPOOLER pour extraire/exporter les tables d�une BD vers des fichiers textes
(sql> spool nomdefichier.txt 		sql>select� 				sql> spool off)
(sql> spool nomdefichier.lst 		sql>select�				sql> spool off)
D�chargez toutes les tables de la BD dans des fichiers CSV en utilisant le � ; � comme s�parateur de colonnes.

I02. Import Depuis des fichiers vers une BD g�r�e par un SGBD (Import/Chargement)
Importer/Chargez toutes les tables de la BD � partir de fichiers de diff�rents types tels que CSV, Excel et autres.
Le � ; � est utilis� comme s�parateur de colonnes.
*/

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????
-- ====>>> Vos fichiers sql devront s'appeler : Bxy-NomDuFichier.sql
-- ====>>> Le fichier sql, des requetes ci-dessus, s'appelle : Bxy-G1requetes.sql

-- QUELQUES REPONSES ET RESULTATS POUR DEMARRER ============================
-- Manipulations-Interrogations des donn�es ================================
-- en SQL 2 ================================================================
-- Requ�tes dans les tables ================================================

PROMPT =========================================================
PROMPT FB-B : Requetes sur la bd EN SQL 2
PROMPT =========================================================
PROMPT

PROMPT =========================================================
PROMPT >> Requete : Les Noms des clients (Avec �ventuellement des doublons)
PROMPT =========================================================
PROMPT
SELECT NOMCLI FROM CLIENTS ;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
-- ???
PROMPT
-- pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete : Les Noms des clients (Sans les doublons)
PROMPT =========================================================
PROMPT
SELECT DISTINCT NOMCLI FROM CLIENTS ;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
-- ???
PROMPT
-- pause Tapez sur Enter...
PROMPT

-- Quelques r�gles de gestion afin d'homog�n�iser et normaliser les donn�es
-- La colonne NOMCLI n'est pas bien renseign�e ni comment�e NO COMMENT !
-- Les seules contraintes d�finies sur la colonne NOMCLI sont :
-- Son type syntaxique >> NOMCLI VARCHAR2(20),
-- Son type/carat�re obligatoire >> CONSTRAINT NN_CLIENTS_NOMCLI CHECK(NOMCLI IS NOT NULL),
-- Il faudrait par exemple ajouter :
-- la majuscule >> CONSTRAINT CK_CLIENTS_NOMCLI	CHECK(NOMCLI = UPPER(NOMCLI)),
-- l'expression r�guli�re qui permet de d�finir la r�gle alphab�tique :

PROMPT =========================================================
PROMPT >> Requete : Les Noms des clients NON MAJUSCULEs !
PROMPT =========================================================
PROMPT
SELECT NOMCLI FROM CLIENTS WHERE NOMCLI <> UPPER(NOMCLI);

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
-- ???
PROMPT
-- pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete : Les Noms des clients NON Alphab�tiques !
PROMPT =========================================================
PROMPT
SELECT NOMCLI FROM CLIENTS WHERE NOT -- ??? ^[A..Z a..z];

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
-- ???
PROMPT
-- pause Tapez sur Enter...
PROMPT


PROMPT =====================================================================
PROMPT >> Requete : Articles command�s toujours en quantit� > 5
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Requete: les articles toujours command�s en quantit� superieure � 5' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT d.NUMCOM, a.REFART, a.NOMART
FROM   ARTICLES a, DETAILCOM d
WHERE  a.REFART = d.REFART
AND    d.QTCOM > 5;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
-- ???

PROMPT
-- pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT >> Requete : Articles sans remise depuis le 1er JANUARY 2005
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Requete: Articles sans remise depuis le 1er JANUARY 2005' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	d.NUMCOM, a.REFART, a.NOMART
FROM	ARTICLES a, DETAILCOM d, COMMANDES c
WHERE	EXTRACT(YEAR FROM DATCOM) > 2004
AND	c.NUMCOM = d.NUMCOM
AND	d.REFART = a.REFART
AND	d.REMISE = 0;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
-- ???

PROMPT
-- pause Tapez sur Enter...
PROMPT

-- =================================================================
-- ========= Quelques requetes de suivi du chiffre d affaires DEBUT
-- =================================================================
PROMPT =========================================================
PROMPT >> Requete : Chiffre d affaires global du magasin en question
PROMPT =========================================================
PROMPT

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????

PROMPT
-- pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete : Chiffre d affaires par jour
PROMPT =========================================================
PROMPT

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????

PROMPT
-- pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete : Chiffre d affaires par mois
PROMPT =========================================================
PROMPT

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????

PROMPT
-- pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete : Chiffre d affaires par ann�e
PROMPT =========================================================
PROMPT

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????

PROMPT
-- pause Tapez sur Enter...
PROMPT


PROMPT =========================================================
PROMPT >> Requete : Chiffre d affaires par ville du client
PROMPT =========================================================
PROMPT

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????

PROMPT
-- pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete : Chiffre d affaires par pays du client
PROMPT =========================================================
PROMPT
TTITLE CENTER 'Requete: permet de determiner le chiffre d affaires par pays' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	c.PAYSCLI, SUM((d.PUART*d.QTCOM) * (1-(d.REMISE/100))) AS chiffre_affaires
FROM	DETAILCOM d, CLIENTS c, COMMANDES k
WHERE	d.NUMCOM  = k.NUMCOM
AND	 	c.CODCLI = k.CODCLI
GROUP BY c.PAYSCLI;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
-- ------------------------------ ---------------
-- ???

PROMPT
-- pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete : Chiffre d affaires par pays et par ville du client
PROMPT =========================================================
PROMPT

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????

PROMPT
-- pause Tapez sur Enter...
PROMPT


-- =================================================================
-- ========= Quelques requetes de suivi du chiffre d affaires FIN
-- =================================================================

PROMPT =====================================================================
PROMPT >> Requete : Articles command�s par tous les parisiens
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Requete: les articles qui sont command�s par tous les parisiens' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	REFART, NOMART
FROM	ARTICLES
WHERE	NOT EXISTS
	(SELECT *
	 FROM	CLIENTS
	 WHERE	UPPER(VILCLI) = 'PARIS'
	 AND	NOT EXISTS
		(SELECT *
		 FROM	COMMANDES, DETAILCOM
		 WHERE	COMMANDES.NUMCOM = DETAILCOM.NUMCOM
		 AND	DETAILCOM.REFART = ARTICLES.REFART
		 AND	COMMANDES.CODCLI = CLIENTS.CODCLI));

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
-- ???

PROMPT
-- pause Tapez sur Enter...
PROMPT


-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????

--======================================================================================
--======================================================================================
--======================================================================================

--======================================================================================
--======================================================================================
--======================================================================================
-- MFB FFF + BB est une entreprise internationale ayant plusieurs magasins dans le monde
--======================================================================================
--======================================================================================
--======================================================================================
--======================== Liste des magasins de l'entreprise BB =======================
--======================================================================================
--======================================================================================
--======================================================================================

DROP TABLE MAGASINS;

PROMPT =====================================================================
PROMPT >> Table : MAGASINS
PROMPT =====================================================================
CREATE TABLE MAGASINS
(
	NUMMAG		VARCHAR(4),
	NOMMAG		CHAR(50),
	TELMAG		CHAR(15),
	ADRNUMMAG	VARCHAR2(10),
	ADRRUEMAG	VARCHAR2(50),
	ADRCPMAG	VARCHAR2(10),
	ADRVILLEMAG	VARCHAR2(50),
	ADRPAYSMAG	VARCHAR2(50),
   	CONSTRAINT PK_MAGASINS 				PRIMARY KEY(NUMMAG),
	CONSTRAINT NN_MAGASINS_NOMMAG		CHECK(NOMMAG IS NOT NULL),
	CONSTRAINT CK_MAGASINS_ADRVILLEMAG	CHECK(ADRVILLEMAG = UPPER(ADRVILLEMAG)),
	CONSTRAINT CK_MAGASINS_ADRPAYSMAG	CHECK(ADRPAYSMAG = UPPER(ADRPAYSMAG))
);

PROMPT =====================================================================
PROMPT Insertion des donn�es de la bd GESCOMI EN SQL 2
PROMPT =====================================================================
PROMPT

PROMPT =====================================================================
PROMPT >> Table : MAGASINS
PROMPT =====================================================================
PROMPT
INSERT INTO MAGASINS (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR01',  'BB-BE KIND', '0142586485', '18', 'AVENUE FOCH', '91000', 'PARIS', 'FRANCE');

INSERT INTO MAGASINS (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR02', 'BB-SAY PLEASE', '+33153800796', '21', 'AVENUE D ITALIE', '75013', 'PARIS', 'FRANCE');

INSERT INTO MAGASINS (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR03', 'BB-SAY THANK YOU','0254974410', '77', 'RUE DE LA LIBERTE', '13001', 'MARCHEILLE', 'FRANCE');

INSERT INTO MAGASINS (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR04', 'BB-WORK HARD', '0657985246', '8 BIS', 'BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', 'FRANCE');

INSERT INTO MAGASINS (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR05', 'BB-ENCOURAGE EACH OTHER', '0546874430', '55', 'RUE DU JAPON', '94310', 'ORLY-VILLE', 'FRANCE');

INSERT INTO MAGASINS (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR06','BB-SAY I M SORRY', '0549876546', '18', 'BOULEVARD FOCH', '93800', 'LYON', 'FRANCE');

INSERT INTO MAGASINS (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR07', 'BB-LIBERTE EGALITE FRATERNITE', '0466468720', '6', 'RUE DE LA ROSIERE', '75015', 'PARIS', 'FRANCE');

INSERT INTO MAGASINS (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('BE01', 'BB-YES WEEK-END', '003257446571', '13', 'RUE DE LA PAIX', '99999', 'BRUXELLES', 'BELGIQUE');

INSERT INTO MAGASINS (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('BE02', 'BB-FAMILY RULES', '003254987541', '5', 'RUE DE BELLEVILLE', '99999', 'BRUXELLES', 'BELGIQUE');

INSERT INTO MAGASINS (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('BE03', 'BB-DO YOUR BEST', '0032546713274', '16', 'AVENUE FOCH', '99998', 'ANDERLECK', 'BELGIQUE');

INSERT INTO MAGASINS (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('BE04', 'BB-FORGIVE OTHERS', '003264787542', '77', 'RUE DE LA LIBERTE', '99998', 'ANDERLECK', 'BELGIQUE');

INSERT INTO MAGASINS (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('BE05', 'BB-SERVICES', '0032448746842', '134', 'AVENUE DES LILAS', '99999', 'BRUXELLES', 'BELGIQUE');

INSERT INTO MAGASINS (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('TN01', 'BB-AZIZ M@M@', '009967687745', '1', 'AVENUE DE CARTAGE', '99000', 'TUNIS', 'TUNISIE');

INSERT INTO MAGASINS (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('TN02', 'BB-SALEM ALIK', '+21624888222', '11', 'BOULEVARD DU 14 JANUARY 2011', '4001', 'SOUSSE', 'TUNISIE');

INSERT INTO MAGASINS (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('IT01', 'BB-BELLA CIAO', '0099241564315', '1', 'AVENUE DE ROME', '99001', 'ROME', 'ITALIE');

COMMIT;

PROMPT
-- pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Affichage des magasins de  l entreprise BB EN SQL 2
PROMPT =====================================================================
PROMPT

COLUMN NUMMAG		FORMAT A4
COLUMN NOMMAG		FORMAT A10
COLUMN TELMAG		FORMAT A10
COLUMN ADRNUMMAG	FORMAT A5
COLUMN ADRRUEMAG	FORMAT A10
COLUMN ADRCPMAG		FORMAT A7
COLUMN ADRVILLEMAG	FORMAT A10
COLUMN ADRPAYSMAG	FORMAT A10
COLUMN MAILMAG	    FORMAT A10

SELECT * FROM MAGASINS;

PROMPT
-- pause Tapez sur Enter...
PROMPT

--====================================================================================
--====================================================================================
--====================================================================================
--==================== Modification de la structure des donn�es ======================
--====================================================================================
--====================================================================================
--====================================================================================
-- Modifiez la structure de la table MAGASINS
-- Ajoutez la colonne MAILMAG de type VARCHAR(30)
ALTER TABLE MAGASINS ADD MAILMAG VARCHAR(30);
-- D�veloppez une proc�dure CREERMAILMAG qui permet d Ins�rer les nouvelles donn�es dans cette colonne
-- Le mail d un magasin (en minuscule) est compos� de : 'bb' + NUMMAG + '@gmail.com'

CREATE OR REPLACE PROCEDURE CREERMAILMAG
AS
BEGIN
    FOR ligne IN (SELECT NUMMAG , LOWER('bb'||NUMMAG||'@gmail.com') AS email FROM MAGASINS WHeRE MAILMAG IS NULL) LOOP
        UPDATE MAGASINS
        SET MAILMAG = ligne.email
        WHERE NUMMAG = ligne.NUMMAG;
    END LOOP;
END;
/

exec CREERMAILMAG;

PROMPT =====================================================================
PROMPT Affichage des magasins de  l entreprise BB EN SQL 2
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

SELECT * FROM MAGASINS;

PROMPT
-- pause Tapez sur Enter...
PROMPT

--======================================================================================
--======================================================================================
--======================================================================================
-- MFB FFF ++++++++ D�chargement des donn�es des magasins dans un fichier au format CSV
-- MFB FFF ++++++++ Le s�parateur est ;
--======================================================================================
spool magasin.csv
set lines 200
set pages 0
SET heading off
set feedback off
SELECT
    trim(NUMMAG || ';' ||
    trim(NOMMAG)|| ';' ||
    trim(TELMAG)|| ';' ||
    ADRNUMMAG   || ';' ||
    ADRRUEMAG   || ';' ||
    ADRCPMAG    || ';' ||
    ADRVILLEMAG || ';' ||
    ADRPAYSMAG  || ';' ||
    ADRVILLEMAG || ';' ||
    MAILMAG || ';')
FROM MAGASINS;
spool off;
--======================================================================================
--======================================================================================
--======================================================================================
-- MFB FFF +++++++++++++++++++   QUALITE DES DONNEES !! DATA QUALITY !!
-- MFB FFF +++++++++++++++++++   NETTOYAGE DES DONNEES !! DATA CLEANING !!
--======================================================================================
-- Qualit� des donn�es ::: Y-a-t-il des anomalies dans les donn�es ?
-- Quelles sont ces anomalies ? Comment les d�tecter et comment les corriger ?
--======================================================================================
--======================================================================================
--==== V�rification de la validit� (v�racit�) des donn�es de l'entreprise BB ===========
--========== Donn�e valide ? Donn�e INVALIDE ===========================================
--======================================================================================
--======================================================================================

/*CREATE TABLE CLIENTS
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
	CONSTRAINT PK_CLIENTS				PRIMARY KEY(CODCLI),
	CONSTRAINT CK_CLIENTS_CIVCLI		CHECK(CIVCLI IN ('Mademoiselle', 'Madame', 'Monsieur')),
	CONSTRAINT CK_CLIENTS_CATCLI		CHECK(CATCLI BETWEEN 1 and 7),
	CONSTRAINT NN_CLIENTS_NOMCLI		CHECK(NOMCLI IS NOT NULL),
	CONSTRAINT NN_CLIENTS_PRENCLI		CHECK(PRENCLI IS NOT NULL),
	CONSTRAINT NN_CLIENTS_CATCLI		CHECK(CATCLI IS NOT NULL),
	CONSTRAINT CK_CLIENTS_VILCLI		CHECK(VILCLI = UPPER(VILCLI)),
	CONSTRAINT CK_CLIENTS_PAYSCLI		CHECK(PAYSCLI = UPPER(PAYSCLI))
);*/
-- V�rifier toutes les informations relatives aux clients...

-- Afficher les clients pour lesquels on n'a pas de t�l�phone (Code, Nom, Tel)
CREATE OR REPLACE VIEW CLISANSTEL (Code, Nom, Tel)
AS SELECT CODCLI, NOMCLI, TELCLI FROM CLIENTS WHERE TELCLI IS NULL;
SELECT * FROM CLISANSTEL;

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????

-- Afficher les clients pour lesquels les mails sont invalides ou qui n'ont pas de mail (Code, Nom, Mail)
CREATE OR REPLACE VIEW CLIINVALIDMAIL (Code, Nom, Mail)
AS SELECT CODCLI, NOMCLI, MAILCLI FROM CLIENTS
WHERE MAILCLI IS NULL OR NOT           -- Regexe;
SELECT * FROM CLIINVALIDMAIL;

-- Afficher les clients pour lesquels les t�l�phones sont invalides (Code, Nom, Tel)
CREATE OR REPLACE VIEW CLIINVALIDTEL (Code, Nom, Tel)
AS SELECT CODCLI, NOMCLI, TELCLI FROM CLIENTS
WHERE TELCLI IS NULL OR NOT           -- Regexe;
SELECT * FROM CLIINVALIDTEL;

-- Afficher les clients pour lesquels le nom ou le pr�nom n'est pas alphab�tique (Code, Nom, Pr�nom)
-- ou que le nom n'est pas en MAJUSCULE
-- ou que le pr�nom n'est pas "Premi�re lettre en Majuscule et le reste en minuscule
CREATE OR REPLACE VIEW CLIINVALIDNAME (Code, Nom, Prenom)
AS SELECT CODCLI, NOMCLI, PRENCLI FROM CLIENTS
WHERE -- ;
SELECT * FROM CLIINVALIDNAME;

--====================================================================================
--====================================================================================
-- D�velopper le m�canisme (proc�dure et/ou fonction) qui le fait avec comme param�tres par exemple :
-- les noms de la table et de la colonne � v�rifier moyennant une EXPRESSION REGULIERE ou autre
-- Cr�er une table pour stocker les expressions r�guli�res par cat�gorie s�mantique de donn�es
--====================================================================================
--====================================================================================
DROP TABLE REGULAREXPRES;
CREATE TABLE REGULAREXPRES
(
CATEGORY 								VARCHAR2(20),
REGULAREXPR 							VARCHAR2(200),
CONSTRAINT PK_REGULAREXPRES				PRIMARY KEY(CATEGORY),
CONSTRAINT CK_REGULAREXPRES_CATEGORY	CHECK(CATEGORY = UPPER(CATEGORY))
);




-- Des cat�gories s�mantiques de donn�es d�finies avec des expressions r�guli�res
-- Le nombre de valeurs cl�s est infini
INSERT INTO REGULAREXPRES VALUES
('MAIL', '^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
INSERT INTO REGULAREXPRES VALUES
('TELFR-I', 'son expression');
INSERT INTO REGULAREXPRES VALUES
('TELFR', 'son expression');
INSERT INTO REGULAREXPRES VALUES
('TELBE-I', 'son expression');
INSERT INTO REGULAREXPRES VALUES
('TELBE', 'son expression');
INSERT INTO REGULAREXPRES VALUES
('TELTN-I', 'son expression');
INSERT INTO REGULAREXPRES VALUES
('TELTN', 'son expression');
-- et d'autres t�l�phone selon votre pays d origine et plus
INSERT INTO REGULAREXPRES VALUES
('DATEFR', 'son expression');
INSERT INTO REGULAREXPRES VALUES
('DATEAM', 'son expression');
INSERT INTO REGULAREXPRES VALUES
('ALPHABETIQUE', '[[:alpha:]]');
INSERT INTO REGULAREXPRES VALUES
('NUMERIQUE', 'son expression');
INSERT INTO REGULAREXPRES VALUES
('TEMPERATURECF', '^(\-?[0-9]+(\,[0-9]+)?)(�F|�C)$');
INSERT INTO REGULAREXPRES VALUES
('NOM', '^([a-zA-Z])([a-zA-Z]+|[a-zA-Z]+[\-][a-zA-Z]+)$');

-- Des cat�gories s�mantiques de donn�es d�finies avec des expressions r�guli�res
-- Le nombre de valeurs (ou mots) cl�s est fini
-- La civilit� (CIVILITY) est d�finie par exemple par :
/*
Madame, MADAME, MAdame, Mme, MME... Mademoiselle, MADEMOISELLE, MADEMoiselle, Mlle...
Madam, MADAM, MaDAm, Mrs, MRS, Miss, MISS...
Monsieur, MONSIEUR, M., ...
Sir, SIR, Mr., M.,...

*/


-- Le sexe (SEX) est d�fini par exemple par :
/*
Femme, FEMME, Femelle, F
Woman, Wife, Female, F
Homme, HOMME, Male, MALe, M, H
MAN, Man, Male, MALe, M
*/
INSERT INTO REGULAREXPRES VALUES ('SEXE_F', '^([fF])([eE][mM]{2}[eE]|[eE][mM][eE][lL]{2}[eE]|[eE][mM][aA][lL][eE])?$|^([wW])([iI][fF][eE]|[oO][mM][aA][nN])$');
INSERT INTO REGULAREXPRES VALUES ('SEXE_H', '^([mM]{1})(([aA][nN])|([aA][lL][eE]))?$|^([hH])([oO][mM]{2}[eE])?$');


-- Le groupe sanguin (BLOODGROUP) est d�finie par les seules valeurs MAJUSCULES
-- fond�es sur les syst�mes ABO et Rh�sus :
/*
A+, A-, B+, B-, AB+, AB-, O+ et O-
*/

INSERT INTO REGULAREXPRES VALUES ('BLOODGROUP', '^(A|B|O|AB)(\+|\-)$');

COMMIT;

-- Cr�eer une fonction qui permet de dire si une valeur v�rifie une expression r�guli�re
-- CREATE OR REPLACE FUNCTION VerifRegExpr (...Valeur ...CategExpReg) renvoie Vrai ou Faux

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????

--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--==================== TRAITEMENT DE CERTAINES ANOMALIES ===============================
--==================== INTRA-COLONNE et INTER-COLONNES (DF) ============================
/*
Entre parenth�ses hihi haha FFF ! (...)

Etant donn� la table VILPAYS suivante :
Elle est issue des tables de la BD GesComI...
Faire les requ�tes ci-dessous :
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
INSERT INTO VILPAYS VALUES ('MARCHEILLE', 'FRANCE');
INSERT INTO VILPAYS VALUES ('PARIS', '');
INSERT INTO VILPAYS VALUES ('ORLY-VILLE', 'FRANCE');
INSERT INTO VILPAYS VALUES ('MARCHEILLE', 'FRANC');
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
INSERT INTO VILPAYS VALUES ('SOUcE', 'TUNISIE');
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
INSERT INTO VILPAYS VALUES ('SOUScE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('SOUSSE', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('TUNIS', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('DJERBA', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('DJERBA', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('DJERBA', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('DJERBA', 'TUNISIE');
INSERT INTO VILPAYS VALUES ('JERBA', 'TUNISIE');
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
INSERT INTO VILPAYS VALUES ('F�s', 'Maroc');
INSERT INTO VILPAYS VALUES ('Rabat', 'Marok');
INSERT INTO VILPAYS VALUES ('Rabat', 'Maroc');
INSERT INTO VILPAYS VALUES ('Rabat', 'Maroc');
INSERT INTO VILPAYS VALUES ('Rabat', 'Maroc');
INSERT INTO VILPAYS VALUES ('Rabat', 'Maroc');
INSERT INTO VILPAYS VALUES ('Casablanca', 'Maroc');
INSERT INTO VILPAYS VALUES ('Casablanka', 'Maroc');
INSERT INTO VILPAYS VALUES ('Rabat', '');
INSERT INTO VILPAYS VALUES ('PARI', 'FRANCE');
INSERT INTO VILPAYS VALUES ('PARISI', 'FRANCE');
INSERT INTO VILPAYS VALUES ('BAGDAD', 'IRAQ');
INSERT INTO VILPAYS VALUES ('BAGDAD', 'IRAQ');
INSERT INTO VILPAYS VALUES ('BAGDAD', 'IRAQ');
INSERT INTO VILPAYS VALUES ('BAGDADE', 'IRAQ');
INSERT INTO VILPAYS VALUES ('TEHERAN', 'IRAN');
INSERT INTO VILPAYS VALUES ('TEHERAN', 'IRAN');
INSERT INTO VILPAYS VALUES ('TEHERAN', 'IRAN');
INSERT INTO VILPAYS VALUES ('TEHERAN', 'IRA');
INSERT INTO VILPAYS VALUES ('TEHERAN', 'IRAN');
INSERT INTO VILPAYS VALUES ('TEHERAN', '');
INSERT INTO VILPAYS VALUES ('TEERAN', 'IRAN');
INSERT INTO VILPAYS VALUES ('TEHERAN', 'YRAN');
INSERT INTO VILPAYS VALUES ('TEHERAN', 'IRANE');
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

REM Calcul du nombre de villes et du nombre de pays
SELECT COUNT(COL1) AS NBVILLES, COUNT(COL2) AS NBPAYS FROM VILPAYS;

REM Calcul du nombre de villes et du nombre de pays
SELECT COUNT(DISTINCT COL1) AS NBVILLES, COUNT(DISTINCT COL2) AS NBPAYS FROM VILPAYS;

REM Compter le nombre d occurrences par valeur de COL1 et valeur de COL2 afin de d�tecter d �ventuelles anomalies
CREATE OR REPLACE VIEW V1 (VILLE, NOMBRE) SELECT COL1, COUNT(*) FROM VILPAYS GROUP BY COL1 ORDER BY 1;
SELECT * FROM V1;
CREATE OR REPLACE VIEW V2 (PAYS, NOMBRE) SELECT COL2, COUNT(*) FROM VILPAYS GROUP BY COL2 ORDER BY 1;
SELECT * FROM V2;

REM On consid�re que la valeur la plus fr�quente (pour chaque groupe de valeurs similaires) est la chaine de caract�res valide
REM D�veloppez le processus qui permet de d�tecter les anomalies et �ventuellement les corriger

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????
-- A VOUS ! -- BON COURAGE -- MFB
-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????

--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--==================== TRAITEMENT DE CERTAINES ANOMALIES ===============================
--==================== INTER-LIGNES ====================================================
/*
Entre parenth�ses hihi haha FFF ! (...)

Etant donn� la table TABCLI suivante :
Elle est issue des tables de la BD GesComI...
Faire les requ�tes ci-dessous :
Eliminer les doubles et les similaires !
*/

CREATE TABLE TABCLI (COL1 VARCHAR(10), COL2 VARCHAR(12), COL3 VARCHAR(10), COL4 VARCHAR(10), COL1 VARCHAR(1));
INSERT INTO TABCLI VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENCE', '3');
INSERT INTO TABCLI VALUES ('2996100', 'Monsieur', 'CLEMENCE', 'ALEXANDRE', '1');
INSERT INTO TABCLI VALUES ('3000107', 'MO�NSIEUR', 'ONRI', 'PANDA', '2');
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
INSERT INTO TABCLI VALUES ('3001777', 'Monsie�r', 'LE BON', 'Adam', '1');
COMMIT;

--======================================================================================
--======================================================================================
--======================================================================================

REM VISUALISATION DES DONNEES
SELECT COUNT(*) AS NbrCli FROM TABCLI;
SELECT * FROM TABCLI;

REM ??? Que font les commandes SQL ci-dessous ?
SELECT COUNT(DISTINCT *) FROM TABCLI ;
SELECT DISTINCT * FROM TABCLI ;

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????
-- A VOUS ! -- BON COURAGE -- MFB
-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????

--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--==================== TRAITEMENT DE CERTAINES ANOMALIES ===============================
--==================== DES CONTRAINTES DEFINIES PAR L UTILSATEUR =======================

-- D�veloppez une proc�dure PL/SQL qui permet de v�rifier la coh�rence de la BD :
-- V�rifiez si toutes les commandes portent au moins sur un article
-- Affichez celles qui sont donc vides !

PROMPT =====================================================================
PROMPT >> Requete : Procedure PL/SQL => v�rification coh�rence de la BD
PROMPT =====================================================================
PROMPT
REM Verifier si toutes les commandes portent au moins sur un article et
REM afficher celles qui sont donc vides!

TTITLE CENTER 'Verification de la coh�rence de la base de donn�es' skip 1 -
       LEFT   '=========================================================================' skip 0

SET SERVEROUTPUT ON;

PROMPT =====================================================================
PROMPT Suppression et cr�ation de la proc�dure COHERENCE_BD
PROMPT =====================================================================
PROMPT
DROP PROCEDURE COHERENCE_BD;

CREATE OR REPLACE PROCEDURE COHERENCE_BD IS
	CURSOR curseur IS
	SELECT NUMCOM FROM COMMANDES
	MINUS (SELECT NUMCOM FROM DETAILCOM);

BEGIN
	DBMS_OUTPUT.PUT_LINE('Le(s) num�ro(s) de commande vide(s) sont :');
	FOR i IN curseur LOOP
		DBMS_OUTPUT.PUT_LINE('-  ' || i.NUMCOM);
	END LOOP;
END;
/

PROMPT
-- pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Execution de la proc�dure COHERENCE_BD
PROMPT =====================================================================
PROMPT
EXECUTE COHERENCE_BD;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
--
-- Le(s) num�ro(s) de commande vide(s) sont :
--  ????

PROMPT
-- pause Tapez sur Enter...
PROMPT

--====================================================================================
--====================================================================================
--====================================================================================
--==================== Modification de la structure des donn�es ======================
--========================== Diagnostiquer les anomalies =========x====================
--====================================================================================
--====================================================================================
-- Ajoutez 4 colonnes � la table CLIENTS afin de diagnostiquer les �ventuelles anomalies
-- ANOMALIES de type VARCHAR(20), VALIDCOL NUMBER(2), INVALIDCOL NUMBER(2), NULLCOL NUMBER(2)
CREATE TABLE DIAGNOSTICDATA
(ANOMALIES VARCHAR(20), VALIDCOL NUMBER(2), INVALIDCOL NUMBER(2), NULLCOL NUMBER(2));
INSERT INTO DIAGNOSTICDATA (''; 0, 0, 0);
/*
CREATE OR REPLACE VIEW DIAGNOCLIENTS
AS SELECT * FROM CLIENTS, DIAGNOSTICDATA;
SELECT * FROM DIAGNOCLIENTS;
*/

select * from clients;

set SERVEROUTPUT ON;


create or replace trigger trigger_anomalie
AFTER 
INSERT OR UPDATE OR DELETE
ON CLIENTS
DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('Ya un truc');
END;
/


create or replace function test_regex(maTable in VARCHAR, maColonne in VARCHAR, monExpression in VARCHAR)
return NUMBER IS
  retour NUMBER := 0;
BEGiN

  return retour;
END;
/



DECLARE
td NUMBER := true;
BEGIN
 td := TEST_REGEX('a', 'b', 'sdfghj');
 SYS.DBMS_OUTPUT.PUT_LINE('' || td);
END;
/


create or replace procedure proc_anomalie
is
  Cursor mesClients is
  select * from clients;
  v_valide NUMBER :=0;
  v_null NUMBER :=0;
  v_non_valide NUMBER := 0;
BEGIN
  FOR monClient in mesClients LOOP
    DBMS_OUTPUT.PUT_LINE(monClient.nomcli);
  END LOOP;
END;
/

select prencli from clients where not REGEXP_LIKE(PRENCLI, (select REGULAREXPR from REGULAREXPRES where category = 'NOM'));

exec proc_anomalie();



DECLARE
    v_e VARCHAR(500) := '';
    v_v NUMBER := 0;
    v_i NUMBER := 0;
    v_n NUMBER := 0;
BEGIN
    anomality('"', getRegex('nom'), v_e, v_v, v_i, v_n);
    dbms_output.put_line(v_e);
END;
/

create or replace procedure anomality(
    wordCompared IN VARCHAR, 
    wordRegex IN VARCHAR,
    v_errorIndicator IN OUT VARCHAR,
    v_valide IN OUT NUMBER,
    v_invalide IN OUT NUMBER,
    v_null IN OUT NUMBER)
is
BEGIN
    IF wordCompared is null THEN
        v_null := v_null + 1;
        v_errorIndicator := v_errorIndicator || 'N';
    ELSE
        IF REGEXP_LIKE(wordCompared, wordRegex) THEN
            v_valide := v_valide + 1;
            v_errorIndicator := v_errorIndicator || 'T';
        ELSE
            v_invalide := v_invalide + 1;
            v_errorIndicator := v_errorIndicator || 'F';
        END IF;
    END IF;
END;
/

create or replace function getRegex(categorie VARCHAR)
    return VARCHAR IS
    expression VARCHAR(255) := '';
BEGIN
  select regularexpr into expression from REGULAREXPRES where category = UPPER(categorie);
  return expression;
END;
/


create or replace procedure addAnnomalie(codeClient in VARCHAR)
is
    v_Client CLIENTS%ROWTYPE;
    v_errorIndi Varchar(255) := '';
    v_valide NUMBER := 0;
    v_invalide NUMBER := 0;
    v_null NUMBER := 0;
    v_existe VARCHAR(255) := '';
BEGIN
    SELECT * INTO v_Client FROM clients WHERE codCli = codeClient;
    
    anomality(v_client.nomcli, getRegex('nom'),v_errorIndi, v_valide, v_invalide, v_null);
    anomality(v_client.prencli, getRegex('nom'),v_errorIndi, v_valide, v_invalide, v_null);
    anomality(v_client.nomcli, getRegex('nom'),v_errorIndi, v_valide, v_invalide, v_null);
    anomality(v_client.prencli, getRegex('nom'),v_errorIndi, v_valide, v_invalide, v_null);
    anomality(v_client.nomcli, getRegex('nom'),v_errorIndi, v_valide, v_invalide, v_null);
    anomality(v_client.prencli, getRegex('nom'),v_errorIndi, v_valide, v_invalide, v_null);
    anomality(v_client.nomcli, getRegex('nom'),v_errorIndi, v_valide, v_invalide, v_null);
    anomality(v_client.prencli, getRegex('nom'),v_errorIndi, v_valide, v_invalide, v_null);
    anomality(v_client.nomcli, getRegex('nom'),v_errorIndi, v_valide, v_invalide, v_null);
    anomality(v_client.prencli, getRegex('nom'),v_errorIndi, v_valide, v_invalide, v_null);
    DELETE FROM DIAGNOSTICDATA WHERE anomalies = v_errorIndi;
    INSERT INTO DIAGNOSTICDATA VALUES(v_errorIndi,v_valide, v_invalide, v_null);
    /*
    SELECT ANOMALIES INTO v_existe from DIAGNOSTICDATA where ANOMALIES = v_client.codcli;
    IF v_existe is null THEN
        INSERT INTO DIAGNOSTICDATA VALUES(v_client.codcli,v_valide, v_invalide, v_null);
    ELSE
        DELETE FROM DIAGNOSTICDATA WHERE anomalies = v_client.codcli;
        INSERT INTO DIAGNOSTICDATA VALUES(v_client.codcli,v_valide, v_invalide, v_null);
    END IF;
    */
    
END;
/

exec addAnnomalie('C001');
select * from DIAGNOSTICDATA;


DROP TABLE DIAGNOCLIENTS;
CREATE TABLE DIAGNOCLIENTS
AS SELECT * FROM CLIENTS, DIAGNOSTICDATA;
SELECT * FROM DIAGNOCLIENTS;
select * from clients;

-- D�veloppez le m�canisme VERIFYDATACLI qui permet de faire :
-- Pour chaque ligne de la table
-- V�rifier la validit� de chaque colonne
-- ErrorIndicator = ''  -- ErrorIndicator est une chaine vide au d�part
-- NbreT = 0    NbrF = 0 NbrN = 0
-- Si la donn�e est valide alors ErrorIndicator = ErrorIndicator || 'T' et NbrT = NbrT + 1
-- Si la donn�e est INvalide alors ErrorIndicator = ErrorIndicator || 'F' et NbrF = NbrF + 1
-- Si la donn�e est vide alors ErrorIndicator = ErrorIndicator || 'N' et NbrN = NbrN + 1
-- Ins�rer � la fin de chaque ligne la valeur ErrorIndicator dans la colonne ANOMALIES
-- ErrorIndicator permet de diagnostiquer le contenu d une ligne entiere
-- Ins�rer � la fin de chaque ligne le nombre de valeurs valides (nombre de T)
-- Ins�rer � la fin de chaque ligne le nombre de valeurs invalides (nombre de F)
-- Ins�rer � la fin de chaque ligne le nombre de valeurs nulles (nombre de N)
-- La colonne ANOMALIES et les 3 autres colonnes permettent de diagnostiquer le contenu de la table entiere

-- Filtrez (d�coupez) la table en plusieurs parties :
-- Les donn�es VALIDES, les "WARNING" et les "INVALIDES"
-- Affichez les lignes INVALIDES avec messages d'erreur

-- Proposez des corrections...

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????

--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
-- MFB FFF +++++++++++++++++++++++++++++++++++++++++++
COMMIT;
SET TIMING OFF;
SPOOL OFF;
