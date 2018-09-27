-- ===============================================================================
-------- Universit� Sorbonne Paris Cit�, Universit� Paris 13 , Institut Gali�e
-------- Master 2 EID2 - Promotion 2018-2019
-------- La Data ; The Data

-------- Directeur :  Dr. M. Faouzi Boufar�s
-------- http://www.lipn.univ-paris13.fr/~boufares

-------- Bases de Donn�es Avanc�es = Advanced Databases (BDA)
-------- Entrep�ts de Donn�es = Data Warehouses (DWH, EDON)


-------- La Donn�e est le monde du futur ; Les donn�es et le monde de l'avenir
-------- The Data is the world of the future ;  The Data and the future's world

-------- DATA -->>> Big Data, Dark Data, Open Data, ...
-- ===============================================================================

--   Enseignant-Chercheur Responsable        :  Dr. M. Faouzi Boufar�s
--   http://www.lipn.univ-paris13.fr/~boufares/
--        Master2EID2/2018-09-17-GescomI-Bxy.sql

-- ===============================================================================
-- ===============================================================================
------------- Master 2 EID2 - Promotion 2018-2019

-- Groupe de Travail N� (Bin�me)  : B20

-- NOM Pr�nom 1                   : ELILTHAMILVALAVAN Magilan
-- NOM Pr�nom 2                   : MOUSSA Abdelkader

-- ====>>> Votre fichier sql devra s'appeler : 2018-09-17-GescomI-Bxy.sql

-- ===============================================================================

--   Projet  BDM : Big Data Management - Gestion des Donn�es Massives
--
--   Data Integration (DI) - Int�gration de Donn�es
--   Donn�es structur�es ; Donn�es Semi-structur�es ; Donn�es NON structur�es
--   Structured data; Semi-structured data; NON-structured data

--   Master Data Management (MDM) - Gestion des Donn�es de R�f�rence
--   Data Quality Managment (DQM) - Gestion de la qualit� des donn�es

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
-- Votre mission, si vous l'acceptez, est de :
-- D�velopper un outils qui permet de diagnostiquer les anomalies �ventuelles dans
-- ... les doubles et les similaires
-- ===============================================================================
-- ===============================================================================
--   A new ETL   ETL & DQ : Extract-Transform-Load & Data-Quality
--                    Al ETL Al Jadyd
-- ===============================================================================
-- ===============================================================================

--============================================================================ Remarque 0 ===|||
--=============== Remarque 0 : Nom obligatoire du Fichier
-- >>>>>>>>>>>>>>>>>>>>>>>>>>  2018-09-17-GescomI-Bxy.sql
--============================================================================ Remarque 0 ===|||

--   Nom du SGBD/DBMS         : ORACLE  /  DB2  /  MySQL  /  ...
--   Date de creation         : 17/09/2018
---  Lieu                     : Universit� Sorbonne Paris Cit�, Universit� Paris 13 , Institut Gali�e
--   Promotion universitaire  : Master 2 Informatique EID2   2018/2019
--   Master 2 Informatique - Exploration Informatique des Donn�es et D�cisionnel
-- ===============================================================================
-- ===============================================================================
--
-- ===============================================================================
--   Probl�matique    :  Int�gration de donn�es h�t�rog�nes, distribu�es

--   Probl�matique    :  Traitement des anomalies �ventuelles
--   Probl�matique    :  Plusieurs types d'anomalies INTRA-Colonne ; INTER-COLONNES ; INTER-LIGNES

--   Probl�matique    :  Standardisation de donn�es h�t�rog�nes
--   Probl�matique    :  Traitement des valeurs nulles
--   Probl�matique    :  Traitement des redondances s�mantiques (D�pendances fonctionnelles)
--   Probl�matique    :  Elimination des doubles et similaires


-- ===============================================================================
--
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


-- ===============================================================================
-- Groupe de Travail N�  : Bxy

-- NOM Pr�nom 1          : np1
-- NOM Pr�nom 2          : np2

-- ===============================================================================

-- ====>>> Votre fichier sql devra s'appeler : 2018-09-17-Gescom-Bxy.sql

-- ===============================================================================

-- *************************************************************************
-- *************************************************************************
-- *************************************************************************
--       SQL 2 --     SQL 2 -- --       SQL 2 --     SQL 2 --
--       SQL 2 --     SQL 2 -- --       SQL 2 --     SQL 2 --
-- *************************************************************************
-- *************************************************************************
-- *************************************************************************


SPOOL GesComI2.lst
PROMPT =========================================================
-- Nom du Cas       :  Gestion Commerciale Intelligente : GESCOMI
-- Nom de SGBD      :  ORACLE DBMS
-- Date de cr�ation :  Septembre 2018
-- Auteur           :  Faouzi BOUFARES
-- Universit�       :  Universit� Sorbonne Paris Cit�, Universit� Paris 13
-- Formation        :  Master 2 EID 2
PROMPT =========================================================
PROMPT
PROMPT =========================================================
PROMPT |                                                       |
PROMPT |     Exercice 1 :  BD GESCOMI avec SQL 2               |
PROMPT |                                                       |
PROMPT =========================================================
PROMPT
PROMPT

PROMPT =========================================================
PROMPT Ceci permet d initialiser le type de la date
PROMPT =========================================================
ALTER SESSION SET NLS_DATE_FORMAT = 'DAY DD-MONTH-YYYY' ;
PROMPT =========================================================

-- D�finition de la structure des donn�es ==================================
-- en SQL 2 ================================================================
-- Cr�ation des tables =====================================================

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
PROMPT Cr�ation des tables de la bd GESCOMI EN SQL 2
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

-- Insertion des donn�es ===================================================
-- en SQL 2 ================================================================
-- Insertion des lignes dans les tables ====================================

PROMPT
PROMPT =====================================================================
PROMPT Insertion des donn�es de la bd GESCOMI EN SQL 2 POUR UN MAGASIN donn�
PROMPT =====================================================================
PROMPT
PROMPT =========================================================
PROMPT >> Insertion dans la Table : CLIENTS2
PROMPT =========================================================
PROMPT
INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI)
VALUES ('C001', 'Madame', 'CLEMENT', 'EVE', 1, '18', 'BOULEVARD FOCH', '91000', 'EPINAY SUR ORGE', 'FRANCE','eve.clement@gmail.com');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI)
VALUES ('C002', 'Madame', 'LESEUL', 'MARIE', 1, '21', 'AVENUE D ITALIE', '75013', 'PARIS', 'FRANCE','marieleseul@yahoo.fr');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI)
VALUES ('C003', 'Madame', 'UNIQUE', 'MARINE', 2, '77', 'RUE DE LA LIBERTE', '13001', 'MARSEILLE', 'FRANCE','munique@gmail.com');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI)
VALUES ('C004', 'Madame', 'CLEMENCE', 'EVELYNE', 3, '8 BIS', 'BOULEVARD FOCH', '93800', 'EPINAY SUR SEINE', 'FRANCE','clemence evelyne@gmail.com');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI)
VALUES ('C005', 'Madame', 'FORT', 'JEANNE', 3, '55', 'RUE DU JAPON', '94310', 'ORLY VILLE', 'FRANCE','jfort\@hotmail.fr');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI)
VALUES ('C006', 'Mademoiselle', 'LE BON', 'CLEMENCE', 1, '18', 'BOULEVARD FOCH', '93800', 'EPINAY SUR SEINE', 'FRANCE','clemence.le bon@cfo.fr');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI)
VALUES ('C007', 'Mademoiselle', 'TRAIFOR', 'ALICE', 2, '6', 'RUE DE LA ROSIERE', '75015', 'PARIS', 'FRANCE','alice.traifor@yahoo.fr');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI)
VALUES ('C008', 'Monsieur', 'VIVANT', 'JEAN-BAPTISTE', 1, '13', 'RUE DE LA PAIX', '93800', 'EPINAY SUR SEINE', 'FRANCE','jeanbaptiste@');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI)
VALUES ('C009', 'Monsieur', 'CLEMENCE', 'ALEXANDRE', 1, '5', 'RUE DE BELLEVILLE', '75019', 'PARIS', 'FRANCE','alexandre.clemence@up13.fr');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI)
VALUES ('C010', 'Monsieur', 'TRAIFOR', 'ALEXANDRE', 1, '16', 'AVENUE FOCH', '75016', 'PARIS', 'FRANCE','alexandre.traifor@up13.fr');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI)
VALUES ('C011', 'Monsieur', 'PREMIER', 'JOSEPH', 2, '77', 'RUE DE LA LIBERTE', '13001', 'MARSEILLE', 'FRANCE','josef@premier');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI)
VALUES ('C012', 'Monsieur', 'CLEMENT', 'ADAM', 2, '13', 'AVENUE JEAN BAPTISTE CLEMENT', '9430', 'VILLETANEUSE', 'FRANCE','adam.clement@gmail.com');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI)
VALUES ('C013', 'Monsieur', 'FORT', 'GABRIEL', 5, '1', 'AVENUE DE CARTAGE', '99000', 'TUNIS', 'TUNISIE','gabriel.fort@yahoo.fr');

INSERT INTO CLIENTS2 (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI)
VALUES ('C014', 'Monsieur', 'ADAM', 'DAVID', 5, '1', 'AVENUE DE ROME', '99001', 'ROME', 'ITALIE','david.adam�@gmail com');

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
VALUES ('20031FB', 'C001', 'VENDREDI 14-f�vrier-2003');

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

-------------------------------------------------------------

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20056FB', 'C013', 'LUNDI 14-MARS-2005');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20057FB', 'C014', 'VENDREDI 11-MARS-2005');

-------------------------------------------------------------

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20061FB', 'C010', 'vendredi 14-f�vrier-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20062FB', 'C009', 'vendredi 14-f�vrier-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20065FB', 'C007', 'vendredi 14-f�vrier-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20066FB', 'C002', 'vendredi 14-f�vrier-2003');

-------------------------------------------------------------

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20067FB', 'C002', 'vendredi 14-f�vrier-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20068FB', 'C002', 'vendredi 14-f�vrier-2003');

-------------------------------------------------------------

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
PROMPT Validation des insertions dans la bd GESCOMI EN SQL 2
PROMPT =========================================================

COMMIT;

PROMPT
Pause Tapez sur Enter...

-- Affichage des donn�es ===================================================
-- en SQL 2 ================================================================
-- Affichage des lignes dans les tables ====================================

PROMPT
PROMPT =========================================================
PROMPT Affichage des tables de la bd GESCOM EN SQL 2
PROMPT =========================================================

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

-- Manipulations-Interrogations des donn�es ================================
-- en SQL 2 ================================================================
-- Requ�tes dans les tables ================================================

PROMPT =========================================================
PROMPT FB-A : Requetes sur la bd GESCOM EN SQL 2 : A1, A2, ... E6, E7
PROMPT =========================================================
PROMPT
/*
Exemples de requ�tes � Tester :

Requ�tes Ai (S�lections + Projections)
A01. Les Noms des clients (Avec �ventuellement des doublons)
A02. Les Noms des clients (Sans les doublons)
A03. Articles dont le prix de vente est sup�rieur ou �gal au double du prix d�achat
A04. Les articles dont le prix de vente est soit 4 soit 27 soit 35
A05. Les articles dont le prix de vente est compris entre 30 et 50
A06. Les commandes du mois de septembre 2015
A07. Les d�tails des commandes d�une ann�e donn�e (2012)
A08. Les clients de � Paris � (Civilit� Nom Pr�nom, Ville)
A09. Les clients dont le nom commence par � C �
A10. Les articles dont le nom commence par � Barri�res de � �
A11. Les articles du fournisseur � WD �
A12. Les clients dont le nom de la ville se prononce comme � pari � ou � barizzz �
A13. D�codification de la cat�gorie des clients : Transformez la cat�gorie comme suit : 1 ? Grossiste, 2 ? Demi-Gros, ? D�taillant
A14. Y-a-t-il des anomalies dans les donn�es ; Quelles sont ces anomalies ? (Qualit� des donn�es)

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
F01. Clients ayant command� en septembre 2011
F02. Montant total des commandes de septembre 2011
F03. Commandes ayant des articles dont le prix vente est sup�rieur � 20 (Commande, Article, PV)
F04. Commandes ayant des articles dont le prix vente est sup�rieur � 20 (Commande, Nombre)
F05. Commandes ayant 4 articles dont le prix vente est sup�rieur � 20
F06. Les clients de paris qui n�ont pas command� en octobre 2011
F07. Les clients de paris ou ceux ayant command� en octobre 2011

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
D�chargez toutes les tables de la BD GesComI dans des fichiers CSV en utilisant le � ; � comme s�parateur de colonnes.

I02. Import Depuis des fichiers vers une BD g�r�e par un SGBD (Import/Chargement)
Importer/Chargez toutes les tables de la BD GesComI � partir de fichiers de diff�rents types tels que CSV, Excel et autres.
Le � ; � est utilis� comme s�parateur de colonnes.

Requ�tes Ji (PL/SQL : D�clencheurs-Triggers ; Proc�dures-Fonctions ; Coh�rence globale des donn�es ; Qualit� des donn�es)
J01. D�veloppez une proc�dure PL/SQL qui permet de v�rifier la coh�rence de la BD :
V�rifiez si toutes les commandes portent au moins sur un article et affichez celles qui sont donc vides !

J02. Afin de garder trace (sauvegarde & suivi) des prix unitaires de chaque article, d�veloppez un d�clencheur qui permet d�enregistrer chaque mise-�-jour de tables des articles !
Pour d�velopper le d�clencheur (Trigger) sur les mouvements des articles, il est n�cessaire de cr�er une table HISTORIQUE_MVTS_ARTICLES.

J03. D�veloppez une proc�dure PL/SQL qui permet d��liminer les doubles dans la table des clients !
J04. D�veloppez une proc�dure PL/SQL qui permet de v�rifier certaines d�pendances fonctionnelles dans la table des clients !

*/

-- QUELQUES REPONSES ET RESULTATS POUR DEMARRER ============================
-- Manipulations-Interrogations des donn�es ================================
-- en SQL 2 ================================================================
-- Requ�tes dans les tables ================================================

PROMPT =========================================================
PROMPT FB-B : Requetes sur la bd GESCOM EN SQL 2
PROMPT =========================================================
PROMPT
/

SET TIMING ON;

PROMPT =========================================================
PROMPT >> Requete A01. Les Noms des clients (Avec �ventuellement des doublons)
PROMPT =========================================================
PROMPT
SELECT NOMCLI FROM CLIENTS2 ;

PROMPT =========================================================
PROMPT >> Requete A02. Les Noms des clients (Sans les doublons)
PROMPT =========================================================
PROMPT
SELECT DISTINCT NOMCLI FROM CLIENTS2 ;


-- FB FB FB FB FB FB A compl�ter






PROMPT =========================================================
PROMPT >> Requete : Chiffre d affaires par pays
PROMPT =========================================================
PROMPT
TTITLE CENTER 'Requete: permet de determiner le chiffre d affaires par pays' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	c.PAYSCLI, sum((d.PUART*d.QTCOM) * (1-(d.REMISE/100))) as chiffre_affaires
FROM	DETAILCOM2 d, CLIENTS2 c, COMMANDES2 k
WHERE	d.NUMCOM  = k.NUMCOM
AND	 	c.CODCLI = k.CODCLI
GROUP BY c.PAYSCLI;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>
--
-- R�sultat g�n�r�:
--
--   Requete: permet de determiner le chiffre d affaires par pays
-- ================================================================
-- PAYSCLI                        CHIFFRE_AFFAIRES
-- ------------------------------ ---------------
-- FRANCE                              5718,46505
-- ITALIE                                  813,09
-- TUNISIE                                2498,02
--
-- Ecoul� : 00 :00 :00.00
-- _______________________________________________________________

PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =====================================================================
PROMPT >> Requete : Articles command�s toujours en quantit� > 5
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Requete: les articles toujours command�s en quantit� superieure � 5' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT d.NUMCOM, a.REFART, a.NOMART
FROM   ARTICLES2 a, DETAILCOM2 d
WHERE  a.REFART = d.REFART
AND    d.QTCOM > 5;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
--
--    Requete: les articles toujours command�s en quantit� superieure � 5
-- =========================================================================
-- NUMCOM     REFART NOMART
-- ---------- ------ -------------------------
-- 20074FB    FB.001 DVD-SPIRIT
-- 20073FB    FB.001 DVD-SPIRIT
-- 20072FB    FB.001 DVD-SPIRIT
-- 20071FB    FB.001 DVD-SPIRIT
-- 20070FB    FB.001 DVD-SPIRIT
-- 20069FB    FB.001 DVD-SPIRIT
-- 20068FB    FB.001 DVD-SPIRIT
-- 20067FB    FB.001 DVD-SPIRIT
-- 20071FB    FB.003 DVD-SPIDER MAN 2
--
-- 9 ligne(s) s�lectionn�e(s).
--
-- Ecoul� : 00 :00 :00.01
-- __________________________________________________________________________

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

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
--
--    Requete: Articles sans remise depuis le 1er janvier 2005
-- =========================================================================
-- NUMCOM     REFART NOMART
-- ---------- ------ -------------------------
-- 20052FB    WD.001 K7 VIDEO-TOY STORY
-- 20054FB    WD.003 K7 VIDEO-WINNIE L OURSON
-- 20053FB    WD.003 K7 VIDEO-WINNIE L OURSON
-- 20052FB    WD.003 K7 VIDEO-WINNIE L OURSON
--
-- 20 ligne(s) s�lectionn�e(s).
--
-- Ecoul� : 00 :00 :00.03
-- __________________________________________________________________________

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT >> Requete : Articles command�s par tous les parisiens
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Requete: les articles qui sont command�s par tous les parisiens' skip 1 -
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

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
--
--
-- Requete: les articles qui sont command�s par tous les parisiens
-- =========================================================================
-- REFART NOMART
-- ------ -------------------------
-- FB.003 DVD-SPIDER MAN 2
--
-- Ecoul� : 00 :00 :00.03
-- __________________________________________________________________________

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Requete : Trigger sur la mise a jour des prix EN SQL 2
PROMPT =========================================================
PROMPT
TTITLE CENTER 'Requete: Trigger sur la mise � jour des prix' skip 1 -
       LEFT   '=========================================================================' skip 0

PROMPT
PROMPT =========================================================
PROMPT Il est n�cessaire de cr�er une table HISTORIQUE_PRIX qui permet
PROMPT de garder le prix des articles avant leurs mises � jour.
PROMPT C est une table qui aura comme colonne la r�f�rence, le nom, le prix
PROMPT d achat, le prix de vente (prix catalogue) de l article avant la mise
PROMPT � jour et la date de la mise � jour.
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
PROMPT Suppression et cr�ation du trigger = d�clencheur.
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
PROMPT Exemple avec 2 insertions et 2 mises � jour dans la table ARTICLES2
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
PROMPT Visualisation des 2 articles ins�r�s dans ARTICLES2
PROMPT =========================================================
TTITLE CENTER 'Visualisation des 2 articles ins�r�s dans ARTICLES2' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	*
FROM	ARTICLES2
WHERE	REFART in ('WD.010', 'WD.011');

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
--
--  Visualisation des 2 articles ins�r�s dans ARTICLES2
-- ================================================================
-- REFART NOMART                     PVART QSART  PAART
-- ------ ------------------------- ------ ----- ------
-- WD.010 K7 VIDEO-Exemple de k7     30.00     3  13.00
-- WD.011 Exemple de DVD             25.00     5  10.00
--
-- Ecoul� : 00 :00 :00.01
-- ______________________________________________________________

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT MAJ des 2 articles dans ARTICLES2
PROMPT =========================================================
PROMPT
TTITLE CENTER 'Mise � jour des 2 articles ins�r�s dans ARTICLES2' skip 1 -
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

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
--
--
-- Visualisation des 2 articles MAJ dans ARTICLES2
-- =========================================================================
-- REFART NOMART                     PVART QSART  PAART
-- ------ ------------------------- ------ ----- ------
-- WD.010 K7 VIDEO-Exemple de k7     45.00     3  15.00
-- WD.011 Exemple de DVD              2.00     5  10.00
--
-- Ecoul� : 00 :00 :00.01
-- __________________________________________________________________________

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

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
--
--
--   Visualisation de la table HISTORIQUE_PRIX
-- =========================================================================
-- REFART NOMART                     PVART  PAART DATMAJ
-- ------ ------------------------- ------ ------ --------------------------
-- WD.010 K7 VIDEO-Exemple de k7     30.00  13.00
-- WD.011 Exemple de DVD             25.00  10.00
--
-- Ecoul� : 00 :00 :00.00
-- __________________________________________________________________________

PROMPT
pause Tapez sur Enter...
PROMPT


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
	SELECT NUMCOM FROM COMMANDES2
	MINUS (SELECT NUMCOM FROM DETAILCOM2);

BEGIN
	DBMS_OUTPUT.PUT_LINE('Le(s) num�ro(s) de commande vide(s) sont :');
	FOR i IN curseur LOOP
		DBMS_OUTPUT.PUT_LINE('-  ' || i.NUMCOM);
	END LOOP;
END;
/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Execution de la proc�dure COHERENCE_BD
PROMPT =====================================================================
PROMPT
EXECUTE COHERENCE_BD;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
--
-- Le(s) num�ro(s) de commande vide(s) sont :
--   -  20011RB
--
-- Proc�dure PL/SQL termin�e avec succ�s.
-- Ecoul� : 00 :00 :00.01
-- __________________________________________________________________________

PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =====================================================================
PROMPT >> Requete  : Articles toujours command�s ensemble
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Requete: les articles qui sont toujours command�s ensemble' skip 1 -
       LEFT   '=========================================================================' skip 0







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
--======================================================================================
-- MFB FFF 1

SPOOL GescomIDW2.lst
PROMPT =========================================================
-- Nom du Cas       :  Gestion Commerciale Intelligente : GESCOMI
-- Nom de SGBD      :  ORACLE DBMS
-- Date de cr�ation :  Septembre 2018
-- Auteur           :  Faouzi BOUFARES
-- Universit�       :  Universit� Sorbonne Paris Cit�, Universit� Paris 13
-- Formation        :  Master 2 EID 2
PROMPT =========================================================
PROMPT
PROMPT =========================================================
PROMPT |                                                       |
PROMPT |     Exercice 2 :  BD GESCOMI***DW avec SQL 2          |
PROMPT |     Exercice 2 :  Le sch�ma en �toile avec SQL 2      |
PROMPT |                                                       |
PROMPT =========================================================
PROMPT
PROMPT

PROMPT =========================================================
PROMPT Ceci permet d initialiser le type de la date
PROMPT =========================================================
ALTER SESSION SET NLS_DATE_FORMAT = 'DAY DD-MONTH-YYYY' ;
PROMPT =========================================================

-- D�finition de la structure des donn�es ==================================
-- en SQL 2 ================================================================
-- Cr�ation des tables =====================================================

PROMPT =====================================================================
PROMPT Suppression des tables de la bd GesComI***DW EN SQL 2
PROMPT =====================================================================
PROMPT
DROP TABLE VENTES_DW2;
DROP TABLE CLIENTS_DW2;
DROP TABLE TEMPS_DW2;
DROP TABLE MAGASINS_DW2;
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
   	CONSTRAINT PK_MAGASINS_DW2 		PRIMARY KEY(NUMMAG),
	CONSTRAINT NN_MAGASINS_DW2_NOMMAG	CHECK(NOMMAG IS NOT NULL),
	CONSTRAINT CK_MAGASINS_DW2_ADRVILLEMAG	CHECK(ADRVILLEMAG = UPPER(ADRVILLEMAG)),
	CONSTRAINT CK_MAGASINS_DW2_ADRPAYSMAG	CHECK(ADRPAYSMAG = UPPER(ADRPAYSMAG))
);

PROMPT
pause Tapez sur Enter...
PROMPT

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


PROMPT =====================================================================
PROMPT Insertion des donn�es de la bd GESCOMI***DW EN SQL 2
PROMPT =====================================================================
PROMPT

PROMPT =====================================================================
PROMPT >> Insertion des donn�es de la Table : ARTICLES_DW2
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
PROMPT >> Table : MAGASINS_DW2
PROMPT =====================================================================
PROMPT
INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR01',  'MAG_1_FRANCE', '0142586485', '18', 'BOULEVARD FOCH', '91000', 'EPINAY SUR ORGE', 'FRANCE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR02', 'MAG_2_FRANCE', '+33153800796', '21', 'AVENUE D ITALIE', '75013', 'PARIS', 'FRANCE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR03', 'MAG_3_FRANCE','0254974410', '77', 'RUE DE LA LIBERTE', '13001', 'MARSEILLE', 'FRANCE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR04', 'MAG_4_FRANCE', '0657985246', '8 BIS', 'BOULEVARD FOCH', '93800', 'EPINAY SUR SEINE', 'FRANCE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR05', 'MAG_5_FRANCE', '0546874430', '55', 'RUE DU JAPON', '94310', 'ORLY VILLE', 'FRANCE');

INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('FR06','MAG_6_FRANCE', '0549876546', '18', 'BOULEVARD FOCH', '93800', 'EPINAY SUR SEINE', 'FRANCE');

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
INSERT INTO MAGASINS_DW2 (NUMMAG, NOMMAG, TELMAG, ADRNUMMAG, ADRRUEMAG, ADRCPMAG, ADRVILLEMAG, ADRPAYSMAG)
VALUES ('IT02', 'MAG_1_ITALIE', '00315', '1', 'AVENUE DE ROME', '99001', 'ROME', 'ITALIE');


PROMPT
pause Tapez sur Enter...
PROMPT

--====================================================================================
--====================================================================================
--====================================================================================
--==================== Modification de la structure des donn�e =======================
--====================================================================================
--====================================================================================
--====================================================================================
-- Modifier la structure de la table MAGASINS_DW2
-- Ajouter la colonne MAILMAG de type VARCHAR(30)
-- Ins�rer les nouvelles donn�es dans cette colonne
-- V�rifier que tous les mails sont corrects !
-- D�velopper une proc�dure qui le fait avec comme param�tres par exemple :
-- les noms de la table et de la colonne � v�rifier moyennant une EXPRESSION REGULIERE
--====================================================================================
--====================================================================================


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
VALUES (7,  'VENDREDI 14-F�VRIER-2003', 2003, 02, 14);

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

COLUMN NUMMAG		FORMAT 999
COLUMN NOMMAG		FORMAT A8
COLUMN TELMAG		FORMAT A11
COLUMN ADRNUMMAG	FORMAT A9
COLUMN ADRRUEMAG	FORMAT A10
COLUMN ADRCPMAG		FORMAT A9
COLUMN ADRVILLEMAG	FORMAT A10
COLUMN ADRPAYSMAG	FORMAT A9

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
       CENTER 'pour la periode de 2001 � 2003, par ville et annee' skip 1 -
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

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
--
--       Requete Q1: Total des ventes des magasins en France ou en Belgique,
--       pour la periode de 2001 � 2003, par ville et annee
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
-- 6 ligne(s) s�lectionn�e(s).
--
-- Ecoul� : 00 :00 :00.03
-- __________________________________________________________________________

PROMPT
pause Tapez sur Enter...
PROMPT

TTITLE CENTER 'Requete Q1Prim: Total des ventes des magasins en France ou en Belgique,' skip 1 -
       center 'pour la periode de 2001 � 2003, par ville et annee' skip 1 -
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

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
--
--     Requete Q1Prim: Total des ventes des magasins en France ou en Belgique,
--       pour la periode de 2001 � 2003, par ville et annee
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
-- 6 ligne(s) s�lectionn�e(s).
--
-- Ecoul� : 00 :00 :00.04
-- __________________________________________________________________________



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
--======================================================================================
-- MFB FFF 2


-- ************************************************************************************************
-- ************************************************************************************************
-- ************************************************************************************************
-- ************************************************************************************************
-- ************************************************************************************************
-- **********    CORRELATION ENTTRE LES PRIX DES ARTICLE ET LE CHIFFRE D'AFFAIRE    ***************
-- **********    CORRELATION ENTTRE LES PRIX DES ARTICLE ET LE CHIFFRE D'AFFAIRE    ***************
-- **********    CORRELATION ENTTRE LES PRIX DES ARTICLE ET LE CHIFFRE D'AFFAIRE    ***************
-- ************************************************************************************************
-- ************************************************************************************************
-- ************************************************************************************************
-- ************************************************************************************************
-- ************************************************************************************************


PROMPT
PROMPT =====================================================================
PROMPT |                                                                   |
PROMPT |      Historique des mouvements des articles                       |
PROMPT |                                                                   |
PROMPT =====================================================================
PROMPT
PROMPT

PROMPT =====================================================================
PROMPT >> Trigger sur les mouvements des articles
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Requete: Trigger sur les mouvements des articles' skip 1 -
       LEFT   '=========================================================================' skip 0

PROMPT
PROMPT =====================================================================
PROMPT Il est n�cessaire de cr�er une table HISTORIQUE_MVTS_ARTICLES.
PROMPT =====================================================================
PROMPT
DROP TABLE HISTORIQUE_MVTS_ARTICLES;

CREATE TABLE HISTORIQUE_MVTS_ARTICLES
(
	NOMUSER		VARCHAR2(15),
	TYPEMVT		VARCHAR2(15),
	REFART 		VARCHAR2(10),
	NOMART		VARCHAR2(50),
	PVART		NUMBER(10, 2),
	PAART		NUMBER(10, 2),
	QSART		NUMBER(3),
	DATMVT		DATE,
	CONSTRAINT NN_HIST_ARTICLES_NOMART	CHECK(NOMART IS NOT NULL),
	CONSTRAINT NN_HIST_ARTICLES_NOMUSER	CHECK(NOMUSER IS NOT NULL),
	CONSTRAINT NN_HIST_ARTICLES_NOMTYPEMVT	CHECK(TYPEMVT IS NOT NULL)
);

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Suppression et cr�ation du trigger.
PROMPT =====================================================================
PROMPT
DROP TRIGGER MOUVEMENTS_ARTICLES2;

CREATE OR REPLACE TRIGGER MOUVEMENTS_ARTICLES2
	AFTER UPDATE OR INSERT OR DELETE ON ARTICLES2
	FOR EACH ROW
DECLARE
	V_REFART	VARCHAR2(10)	:= :OLD.REFART;
	V_NOMART	VARCHAR2(50)	:= :OLD.NOMART;
	V_PVART		NUMBER(10, 2)	:= :OLD.PVART;
	V_PAART		NUMBER(10, 2)	:= :OLD.PAART;
	V_QSART		NUMBER(3)	:= :OLD.QSART;

	VI_REFART	VARCHAR2(10)	:= :NEW.REFART;
	VI_NOMART	VARCHAR2(50)	:= :NEW.NOMART;
	VI_PVART	NUMBER(10, 2)	:= :NEW.PVART;
	VI_PAART	NUMBER(10, 2)	:= :NEW.PAART;
	VI_QSART	NUMBER(3)	:= :NEW.QSART;

BEGIN
	IF UPDATING THEN
		INSERT INTO HISTORIQUE_MVTS_ARTICLES (NOMUSER, TYPEMVT, REFART, NOMART, PVART, PAART, QSART, DATMVT)
		VALUES (USER, 'UPDATE', V_REFART, V_NOMART, V_PVART, V_PAART, V_QSART, SYSDATE);
	END IF;

	IF DELETING THEN
		INSERT INTO HISTORIQUE_MVTS_ARTICLES (NOMUSER, TYPEMVT, REFART, NOMART, PVART, PAART, QSART, DATMVT)
		VALUES (USER, 'DELETE', V_REFART, V_NOMART, V_PVART, V_PAART, V_QSART, SYSDATE);
	END IF;

	IF INSERTING THEN
		INSERT INTO HISTORIQUE_MVTS_ARTICLES (NOMUSER, TYPEMVT, REFART, NOMART, PVART, PAART, QSART, DATMVT)
		VALUES (USER, 'INSERT', VI_REFART, VI_NOMART, VI_PVART, VI_PAART, VI_QSART, SYSDATE);
	END IF;
END;
/


PROMPT
pause Tapez sur Enter...
PROMPT

COLUMN 	NOMUSER		FORMAT A12
COLUMN	TYPEMVT		FORMAT A6
COLUMN	REFART 		FORMAT A6
COLUMN	NOMART		FORMAT A11
COLUMN	PVART		FORMAT 999.99
COLUMN	PAART		FORMAT 999.99
COLUMN	QSART		FORMAT 999
COLUMN	DATMVT		FORMAT A19

PROMPT =====================================================================
PROMPT Suppression et Insertion dans la table articles2 (par user-X par exemple)
PROMPT =====================================================================
PROMPT
DELETE
FROM	ARTICLES2
WHERE	REFART = 'WD.012';

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.012', 'Exemple de DVD BIS', 25.00, 5, 10.00);

PROMPT =====================================================================
PROMPT Mouvements dans la table ARTICLES2 effectu�s par des utilisateurs
PROMPT externes: user-y et user-X
PROMPT =====================================================================
PROMPT

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Visualisation de la table HISTORIQUE_MVTS_ARTICLES
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Visualisation de la table HISTORIQUE_MVTS_ARTICLES' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	*
FROM	HISTORIQUE_MVTS_ARTICLES;

-- __________________________________________________________________________
--
-- R�sultat g�n�r�:
--
--      Visualisation de la table HISTORIQUE_MVTS_ARTICLES
-- =========================================================================
--

-- __________________________________________________________________________

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Suppression et insertion dans la table articles2.
PROMPT =====================================================================
PROMPT
DELETE	FROM	ARTICLES2
WHERE	REFART = 'WD.012';

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.012', 'le roi de la jungle 1', 29.99, 5, 13.00);

INSERT INTO ARTICLES2 (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.023', 'le roi de la jungle 2', 39.99, 5, 21.00);

COMMIT;

PROMPT =====================================================================
PROMPT Visualisation de la table HISTORIQUE_MVTS_ARTICLES
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Visualisation de la table HISTORIQUE_MVTS_ARTICLES' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	*
FROM	HISTORIQUE_MVTS_ARTICLES;

-- __________________________________________________________________________
--
-- R�sultat g�n�r�:
--
--      Visualisation de la table HISTORIQUE_MVTS_ARTICLES
-- =========================================================================
-- __________________________________________________________________________

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT
PROMPT =====================================================================
PROMPT |                                                                   |
PROMPT |      Historique des mouvements des articles                       |
PROMPT |                                                                   |
PROMPT =====================================================================
PROMPT
PROMPT

PROMPT =====================================================================
PROMPT Mise � jour dans la table articles2 pour effectuer les tests.
PROMPT =====================================================================
PROMPT
UPDATE	ARTICLES2
SET	PVART = 35.00, PAART = 10.90, QSART = 12
WHERE	REFART = 'WD.012';

UPDATE	ARTICLES2
SET	PVART = 50.00, PAART = 25.00, QSART = 10
WHERE	REFART = 'WD.012';

UPDATE	ARTICLES2
SET	PVART = 25.00, PAART = 5.00, QSART = 52
WHERE	REFART = 'WD.012';

COMMIT;

PROMPT =====================================================================
PROMPT Visualisation de la table HISTORIQUE_MVTS_ARTICLES
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Visualisation de la table HISTORIQUE_MVTS_ARTICLES' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	*
FROM	HISTORIQUE_MVTS_ARTICLES;

-- __________________________________________________________________________
--
-- R�sultat g�n�r�:
--
--      Visualisation de la table HISTORIQUE_MVTS_ARTICLES
-- =========================================================================

-- __________________________________________________________________________

PROMPT =====================================================================
PROMPT Suppression et creation de la table comparaison_art
PROMPT Cette table va permettre de stocker les mouvements dans
PROMPT la table ARTICLES2, pendant une p�riode. Tout �a pour pouvoir ensuite
PROMPT �tudier l impact de ces mouvements sur le chiffre d affaires durant
PROMPT la p�riode consid�r�e.
PROMPT =====================================================================
PROMPT
DROP TABLE COMPARAISON_ART;

CREATE TABLE COMPARAISON_ART
(
	REFART 		VARCHAR2(10),
	PVART		NUMBER(10, 2),
	PAART		NUMBER(10, 2),
	QSART		NUMBER(3),
	DATE_DEBUT	INTEGER,
	DATE_FIN	INTEGER
);

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Suppression et creation de la table comparaison_chiffre_affaires.
PROMPT Cette table va permettre de stocker les informations concernant
PROMPT le chiffre d affaires moyen des diff�rents pays avant la p�riode o�
PROMPT l on a d�cid� de regarder l impact des mouvements effectu�s sur
PROMPT la table ARTICLES2. De garder aussi le chiffre d affaires durant
PROMPT la p�riode consid�r�e. Et aussi, d inscrire la variation au niveau
PROMPT des chiffres d affaires.
PROMPT =====================================================================
PROMPT
DROP TABLE COMPARAISON_CHIFFRE_AFFAIRE;

CREATE TABLE COMPARAISON_CHIFFRE_AFFAIRE
(
	PAYS		VARCHAR2(20),
	DATE_DEBUT	INTEGER,
	DATE_FIN	INTEGER,
	CA_AVANT	NUMBER(10, 2),
	CA_APRES	NUMBER(10, 2),
	VARIATION	NUMBER(10, 2)
);

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Creation de vue VUE_ART permettant de garder pour chaque article
PROMPT de la table ARTICLES2 son prix de vente moyen, son prix d achat moyen
PROMPT et sa quantit� en stock moyen.
PROMPT =====================================================================
PROMPT
CREATE OR REPLACE VIEW VUE_ART AS
(
	SELECT		DISTINCT REFART, AVG(PVART) as A_PVART, AVG(PAART) as A_PAART, AVG(QSART) as A_QSART
	FROM		ARTICLES2
	GROUP BY 	REFART
);


PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Creation de vue VUE_MVTS_ART permettant de garder pour chaque article
PROMPT de la table HISTORIQUE_MVTS_ARTICLES son prix de vente moyen, son
PROMPT prix d achat moyen et sa quantit� en stock moyen.
PROMPT =====================================================================
PROMPT
CREATE OR REPLACE VIEW VUE_MVTS_ART AS
(
	SELECT		DISTINCT REFART, AVG(PVART) as A_PVART, AVG(PAART) as A_PAART, AVG(QSART) as A_QSART
	FROM		HISTORIQUE_MVTS_ARTICLES
	WHERE		TYPEMVT = 'UPDATE'
	AND		EXTRACT(YEAR FROM DATMVT) BETWEEN 2006 AND 2007
	GROUP BY 	REFART
);


PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Creation de vue CHIFFRE_AFFAIRES_AVANT permettant de calculer le
PROMPT chiffre d affaires de chaque pays avant une p�riode consid�r�e.
PROMPT =====================================================================
PROMPT
CREATE OR REPLACE VIEW CHIFFRE_AFFAIRES_AVANT AS
(
	SELECT	cl.PAYSCLI, sum((d.PUART*d.QTCOM) * (1-(d.REMISE/100))) as chiffre_affaire
	FROM	DETAILCOM2 d, CLIENTS2 cl, COMMANDES2 c
	WHERE	d.NUMCOM  = c.NUMCOM
	AND	cl.CODCLI = c.CODCLI
	AND	EXTRACT(YEAR FROM c.DATCOM) < 2006
	GROUP BY cl.PAYSCLI
);

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Creation de vue CHIFFRE_AFFAIRES_APRES permettant de calculer le
PROMPT chiffre d affaires de chaque pays durant la p�riode consid�r�e.
PROMPT =====================================================================
PROMPT
CREATE OR REPLACE VIEW CHIFFRE_AFFAIRES_APRES AS
(
	SELECT	cl.PAYSCLI, sum((d.PUART*d.QTCOM) * (1-(d.REMISE/100))) as chiffre_affaire
	FROM	DETAILCOM2 d, CLIENTS2 cl, COMMANDES2 c
	WHERE	d.NUMCOM  = c.NUMCOM
	AND	cl.CODCLI = c.CODCLI
	AND	EXTRACT(YEAR FROM c.DATCOM) BETWEEN 2006 AND 2007
	GROUP BY cl.PAYSCLI
);

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Creation de procedure MOYENNE_PRIX_ART permettant de calculer le prix
PROMPT moyen d achat et de vente, et la quantit� moyenne en stock de chaque
PROMPT article. Et ensuite de calculer le chiffre d affaires avant et pendant
PROMPT une p�riode consid�r�e. Tout cela pour savoir si les mouvements
PROMPT effectu�s, durant une p�riode consid�r�e, sur la table ARTICLES2 ont
PROMPT apport� plus ou moins d argent.
PROMPT =====================================================================
PROMPT
CREATE OR REPLACE PROCEDURE MOYENNE_PRIX_ART IS
	CURSOR curseur IS
		SELECT	DISTINCT REFART
		FROM	VUE_MVTS_ART;

	CURSOR curseurBIS IS
		SELECT	DISTINCT PAYSCLI
		FROM	CLIENTS2;


	V_REFART 	VARCHAR2(10);
	V_PVART		NUMBER(10, 2);
	V_PAART		NUMBER(10, 2);
	V_QSART		NUMBER(3);
	V_CA_AVANT	NUMBER(10, 2);
	V_CA_APRES	NUMBER(10, 2);
	V_VARIATION	NUMBER(10, 2);
	V_PAYS		VARCHAR2(20);

	V1_PVART	NUMBER(10, 2);
	V1_PAART	NUMBER(10, 2);
	V1_QSART	NUMBER(3);

	V2_PVART	NUMBER(10, 2);
	V2_PAART	NUMBER(10, 2);
	V2_QSART	NUMBER(3);
BEGIN
	FOR c IN curseur LOOP
		SELECT	REFART, A_PVART, A_PAART, A_QSART INTO V_REFART, V1_PVART, V1_PAART, V1_QSART
		FROM	VUE_MVTS_ART
		WHERE	REFART = c.REFART;

		SELECT	REFART, A_PVART, A_PAART, A_QSART INTO V_REFART, V2_PVART, V2_PAART, V2_QSART
		FROM	VUE_ART
		WHERE	REFART = c.REFART;

		V_PVART := (V1_PVART + V2_PVART) /2;
		V_PAART := (V1_PAART + V2_PAART) /2;
		V_QSART := (V1_QSART + V2_QSART) /2;

		INSERT INTO COMPARAISON_ART
		VALUES (V_REFART, V_PVART, V_PAART, V_QSART, 2006, 2007);

	END LOOP;

	FOR cBIS IN curseurBIS LOOP
		SELECT	PAYSCLI, CHIFFRE_AFFAIRE INTO V_PAYS, V_CA_AVANT
		FROM	CHIFFRE_AFFAIRE_AVANT
		WHERE	PAYSCLI = cBIS.PAYSCLI;

		SELECT	PAYSCLI, CHIFFRE_AFFAIRE INTO V_PAYS, V_CA_APRES
		FROM	CHIFFRE_AFFAIRE_APRES
		WHERE	PAYSCLI = cBIS.PAYSCLI;

		V_VARIATION := V_CA_APRES - V_CA_AVANT;

		INSERT INTO COMPARAISON_CHIFFRE_AFFAIRE
		VALUES (V_PAYS, 2006, 2007, V_CA_AVANT, V_CA_APRES, V_VARIATION);
	END LOOP;
END;
/

PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Execution de procedure
PROMPT =====================================================================
PROMPT
EXECUTE MOYENNE_PRIX_ART;


PROMPT
pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Visualisation des tables COMPARAISON_ART et
PROMPT COMPARAISON_CHIFFRE_AFFAIRE
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Visualisation de la table COMPARAISON_ART' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT * FROM COMPARAISON_ART;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
--
--    Visualisation de la table COMPARAISON_ART
-- =========================================================================
-- REFART   PVART   PAART QSART DATE_DEBUT   DATE_FIN
-- ------ ------- ------- ----- ---------- ----------
-- WD.012   30.00    9.87    30       2006       2007
-- WD.023   35.20   17.23    10       2006       2007
--
-- __________________________________________________________________________

PROMPT
pause Tapez sur Enter...
PROMPT

TTITLE CENTER 'Visualisation de la table COMPARAISON_CHIFFRE_AFFAIRE' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT * FROM COMPARAISON_CHIFFRE_AFFAIRE;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
--
--      Visualisation de la table COMPARAISON_CHIFFRE_AFFAIRE
-- =========================================================================
-- PAYS                 DATE_DEBUT   DATE_FIN   CA_AVANT   CA_APRES  VARIATION
-- -------------------- ---------- ---------- ---------- ---------- ----------
-- FRANCE                     2006       2007    3068,47       2650    -418,47
-- ITALIE                     2006       2007      30,71     782,38     751,67
-- TUNISIE                    2006       2007     161,42     2336,6    2175,18
-- __________________________________________________________________________



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
--======================================================================================
-- MFB FFF 3

CREATE TABLE CACLI (DATECA DATE, MONTANTCA NUMBER);
INSERT INTO CACLI VALUES ('01-01-2010', 72);
INSERT INTO CACLI VALUES ('01-02-2010', 88);
INSERT INTO CACLI VALUES ('01-03-2010', 90);
INSERT INTO CACLI VALUES ('01-04-2010', 74);
INSERT INTO CACLI VALUES ('01-05-2010', 79);
INSERT INTO CACLI VALUES ('01-06-2010', 72);
INSERT INTO CACLI VALUES ('01-07-2010', 76);
INSERT INTO CACLI VALUES ('01-08-2010', 89);
INSERT INTO CACLI VALUES ('01-09-2010', 90);
INSERT INTO CACLI VALUES ('01-10-2010', 80);
INSERT INTO CACLI VALUES ('01-11-2010', 69);
INSERT INTO CACLI VALUES ('01-12-2010', 90);
INSERT INTO CACLI VALUES ('01-01-2011', 78);
INSERT INTO CACLI VALUES ('01-02-2011', 93);
INSERT INTO CACLI VALUES ('01-03-2011', 81);
INSERT INTO CACLI VALUES ('01-04-2011', 72);
INSERT INTO CACLI VALUES ('01-05-2011', 94);
INSERT INTO CACLI VALUES ('01-06-2011', 70);
INSERT INTO CACLI VALUES ('01-07-2011', 93);
INSERT INTO CACLI VALUES ('01-08-2011', 72);
INSERT INTO CACLI VALUES ('01-09-2011', 82);
INSERT INTO CACLI VALUES ('01-10-2011', 74);
INSERT INTO CACLI VALUES ('01-11-2011', 90);
INSERT INTO CACLI VALUES ('01-12-2011', 73);
INSERT INTO CACLI VALUES ('01-01-2012', 63);
INSERT INTO CACLI VALUES ('01-02-2012', 67);
INSERT INTO CACLI VALUES ('01-03-2012', 74);
INSERT INTO CACLI VALUES ('01-04-2012', 64);
INSERT INTO CACLI VALUES ('01-05-2012', 66);
INSERT INTO CACLI VALUES ('01-06-2012', 60);
INSERT INTO CACLI VALUES ('01-07-2012', 69);
INSERT INTO CACLI VALUES ('01-08-2012', 68);
INSERT INTO CACLI VALUES ('01-09-2012', 69);
INSERT INTO CACLI VALUES ('01-10-2012', 75);
INSERT INTO CACLI VALUES ('01-11-2012', 61);
INSERT INTO CACLI VALUES ('01-12-2012', 60);
INSERT INTO CACLI VALUES ('01-01-2013', 75);
INSERT INTO CACLI VALUES ('01-02-2013', 63);
INSERT INTO CACLI VALUES ('01-03-2013', 69);
INSERT INTO CACLI VALUES ('01-04-2013', 61);
INSERT INTO CACLI VALUES ('01-05-2013', 63);
INSERT INTO CACLI VALUES ('01-06-2013', 62);
INSERT INTO CACLI VALUES ('01-07-2013', 58);
INSERT INTO CACLI VALUES ('01-08-2013', 60);
INSERT INTO CACLI VALUES ('01-09-2013', 61);
INSERT INTO CACLI VALUES ('01-10-2013', 59);
INSERT INTO CACLI VALUES ('01-11-2013', 72);
INSERT INTO CACLI VALUES ('01-12-2013', 59);
INSERT INTO CACLI VALUES ('01-01-2014', 50);
INSERT INTO CACLI VALUES ('01-02-2014', 54);
INSERT INTO CACLI VALUES ('01-03-2014', 59);
INSERT INTO CACLI VALUES ('01-04-2014', 60);
INSERT INTO CACLI VALUES ('01-05-2014', 50);
INSERT INTO CACLI VALUES ('01-06-2014', 54);
INSERT INTO CACLI VALUES ('01-07-2014', 55);
INSERT INTO CACLI VALUES ('01-08-2014', 58);
INSERT INTO CACLI VALUES ('01-09-2014', 60);
INSERT INTO CACLI VALUES ('01-10-2014', 56);
INSERT INTO CACLI VALUES ('01-11-2014', 56);
INSERT INTO CACLI VALUES ('01-12-2014', 55);
INSERT INTO CACLI VALUES ('01-01-2015', 55);
INSERT INTO CACLI VALUES ('01-02-2015', 55);
INSERT INTO CACLI VALUES ('01-03-2015', 51);
INSERT INTO CACLI VALUES ('01-04-2015', 55);
INSERT INTO CACLI VALUES ('01-05-2015', 56);
INSERT INTO CACLI VALUES ('01-06-2015', 56);
INSERT INTO CACLI VALUES ('01-07-2015', 56);
INSERT INTO CACLI VALUES ('01-08-2015', 52);
INSERT INTO CACLI VALUES ('01-09-2015', 58);
INSERT INTO CACLI VALUES ('01-10-2015', 59);
INSERT INTO CACLI VALUES ('01-11-2015', 57);
INSERT INTO CACLI VALUES ('01-12-2015', 50);
INSERT INTO CACLI VALUES ('01-01-2016', 18);
INSERT INTO CACLI VALUES ('01-02-2016', 16);
INSERT INTO CACLI VALUES ('01-03-2016', 18);
INSERT INTO CACLI VALUES ('01-04-2016', 19);
INSERT INTO CACLI VALUES ('01-05-2016', 20);
INSERT INTO CACLI VALUES ('01-06-2016', 10);
INSERT INTO CACLI VALUES ('01-07-2016', 18);
INSERT INTO CACLI VALUES ('01-08-2016', 13);
INSERT INTO CACLI VALUES ('01-09-2016', 19);
INSERT INTO CACLI VALUES ('01-10-2016', 18);
INSERT INTO CACLI VALUES ('01-11-2016', 20);
INSERT INTO CACLI VALUES ('01-12-2016', 12);
INSERT INTO CACLI VALUES ('01-01-2017', 14);
INSERT INTO CACLI VALUES ('01-02-2017', 12);
INSERT INTO CACLI VALUES ('01-03-2017', 17);
INSERT INTO CACLI VALUES ('01-04-2017', 12);
INSERT INTO CACLI VALUES ('01-05-2017', 20);
INSERT INTO CACLI VALUES ('01-06-2017', 14);
INSERT INTO CACLI VALUES ('01-07-2017', 16);
INSERT INTO CACLI VALUES ('01-08-2017', 19);
INSERT INTO CACLI VALUES ('01-09-2017', 12);
INSERT INTO CACLI VALUES ('01-10-2017', 12);
INSERT INTO CACLI VALUES ('01-11-2017', 19);
INSERT INTO CACLI VALUES ('01-12-2017', 20);
INSERT INTO CACLI VALUES ('01-01-2018', 15);
INSERT INTO CACLI VALUES ('01-02-2018', 11);
INSERT INTO CACLI VALUES ('01-03-2018', 14);
INSERT INTO CACLI VALUES ('01-04-2018', 17);
INSERT INTO CACLI VALUES ('01-05-2018', 13);
INSERT INTO CACLI VALUES ('01-06-2018', 13);
INSERT INTO CACLI VALUES ('01-07-2018', 11);
INSERT INTO CACLI VALUES ('01-08-2018', 10);
INSERT INTO CACLI VALUES ('01-09-2018', 13);
COMMIT;

/*
-- Initialiser le type de la date avec ...

ALTER SESSION SET NLS_DATE_FORMAT = 'DAY DD-MONTH-YYYY' ;
ALTER SESSION SET NLS_DATE_FORMAT = '???? HiHi HaHa' ;

*/

/*
A vous les requetes suivantes :
Donnez la repr�sentation graphique sous EXCEL !
Gestion des "Reporting"

Chiffre d�affaires pour l�ann�e 2010
Chiffre d�affaires pour l�ann�e 2011
Chiffre d�affaires pour les deux ann�es 2012 et 2013
Chiffre d�affaires de 2010 � 2018
Statistiques sur le chiffre d�affaires � P�riode de 2010 � 2018

*/

--======================================================================================
--======================================================================================
--======================================================================================

-- MFB FFF 4

-- INTEGRATION DE BASES DE DONNEES ; DATA INTEGRATION
-- QUALITE DES DONNEES ; DATA QUALITY

--======================================================================================
--======================================================================================
--======================================================================================

/*

-- Etant donn� l'ensemble des magasins cf ci-haut la table des magasins

-- Chaque bin�me aura � c�er sa propore BD GesComI !

-- Afficher la table MAGASINS_DW2

-- D�veloppez une proc�dure AJOUTECOLONNE qui permet d'ajouter � une table une colonne qui porte le nom de MAGASIN
-- Le contenu de cette colonne est l'identifiant du magasin NUMMAG
-- En entr�e le nom de la table et le contenu de la colonne ; En sortie une nouvelle table dont le nom est le nom de la table en entr�e concat�n� au _NUMMAG

-- L'ex�cution de la proc�dure permet donc d'affecter les donn�es � un seul magasin

-- EXEC AJOUTECOLONNE('CLIENTS', 'FR02')

-- Corrigez le contenu de la nouvelle table CLIENTS_FR02 ; Comment savoir qu'elle peut contenir des anomalies et lesquelles ?

-- On consid�re que les donn�es dans les tables CLIENTS2, ARTICLES2, COMMANDES2 et DETAILCOM2 sont celles du magasin FR03

-- EXEC AJOUTECOLONNE('CLIENTS2', 'FR03')

-- Assemblez (int�grer, fusionner) dans une nouvelle table, de nom LESCLIENTS, tous les clients des diff�rents magasins

-- Corrigez le contenu de la nouvelle table LESCLIENTS ; Comment savoir qu'elle peut contenir des anomalies et lesquelles ?
*/

-- NOUVELLES DONNEES == NOUVELLES DONNEES  == NOUVELLES DONNEES
-- Les clients du magasin FR02 c est celui de Paris

CREATE TABLE CLIENTS (Col1 VARCHAR(50), Col2 VARCHAR(50), Col3 VARCHAR(50), Col4 VARCHAR(50), Col5 VARCHAR(50), Col6 VARCHAR(50), Col7 VARCHAR(50), Col8 VARCHAR(50), Col9 VARCHAR(50), Col10 VARCHAR(50));
INSERT INTO CLIENTS VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENCE', '3', '8, BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', 'FRANCE', 'clemence.rahma@up13.fr');
INSERT INTO CLIENTS VALUES ('2996100', 'Monsieur', 'CLEMENCE', 'ALEXANDRE', '1', '5, RUE DE BELLEVILLE', '75019', 'PARIS', 'FRANCE', 'alexandre.clemence@up13.fr');
INSERT INTO CLIENTS VALUES ('2997007', 'Monsieur', 'TRAIFOR', 'ADAM', '2', '13, AVENUE J. B. CLEMENT', '93430', 'VILLETANEUSE', 'FRANCE', 'adam.traifor@up13.fr');
INSERT INTO CLIENTS VALUES ('2997777', 'Mademoiselle', 'LE BON', 'CLEMENTINE', '1', '18, BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', '', 'clementine.le bon@up13.fr');
INSERT INTO CLIENTS VALUES ('2998500', 'Monsieur', 'CHEVALIER', 'INES', '1', '13, RUE DE LA PAIX', '93800', 'EPINAY SUR SEINE', 'FRANCE', 'ines.chevalier@up13.fr');
INSERT INTO CLIENTS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1', '186, AVENUE D ITALIE', '75013', 'PARIS', 'FRANCE', 'adam.le bon@up13.fr');
INSERT INTO CLIENTS VALUES ('2998505', 'Mademoiselle', 'TRAIFOR', 'ALICE', '2', '6, RUE DE LA ROSIERE', '75015', 'PARIS', '', 'alice.traifor@up13.fr');
INSERT INTO CLIENTS VALUES ('3000106', 'Monsieur', 'HARISSA', 'FORD', '1', '16, AVENUE FOCH', '75016', 'PARIS', 'FRANCE', 'ford.harissa@up13.fr');
INSERT INTO CLIENTS VALUES ('3000107', 'MO�NSIEUR', 'ONRI', 'PANDA', '2', '77, RUE DE LA LIBERTE', '13001', 'MARSEILLE', 'FRANCE', 'panda.onri@up13.fr');
INSERT INTO CLIENTS VALUES ('3000108', 'Madame', 'EDITE', 'FIAT', '1', '21, AVENUE D ITALIE', '75013', 'PARIS', '', 'fiat.edite@up13.fr');
INSERT INTO CLIENTS VALUES ('3000109', 'Madame', 'TOYOTA', 'JACKSON', '3', '55, RUE DU JAPON', '94310', 'ORLY VILLE', 'FRANCE', 'jackson.toyota@up13.fr');
INSERT INTO CLIENTS VALUES ('3000110', 'MADAME', 'ONRI', 'HONDA', '2', '77, RUE DE LA LIBERTE', '13001', 'MARSEILLE', 'FRANC', 'honda.onri@up13.fr');
INSERT INTO CLIENTS VALUES ('3000111', 'Madame', 'GENEREUX', 'EVE', '1', '18, BOULEVARD FOCH', '91000', 'EPINAY SUR ORGE', 'FR', 'eve.genereux@up13.fr');
INSERT INTO CLIENTS VALUES ('299PPPP', 'Mlle', 'BON', 'CLEMENTINE', '1', '18, BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', 'FRANCE', 'clementine.bon@up13.fr');
INSERT INTO CLIENTS VALUES ('3001', 'M.', 'LE BON', 'Adam', '1', '186, AVENUE D ITALIE', '75013', 'Paris', '', 'adam.le bon@up13.fr');
INSERT INTO CLIENTS VALUES ('3001777', 'Mr', 'LE BON', 'Adem', '1', '186, AVENUE D ITALIE', '75013', 'PARIS', 'france', 'adem.le bon@up13.fr');

-- Les articles du magasin FR02 c est celui de Paris

CREATE TABLE ARTICLES (Col1 VARCHAR(50), Col2 VARCHAR(50), Col3 VARCHAR(50), Col4 VARCHAR(50), Col5 VARCHAR(50));
INSERT INTO ARTICLES VALUES ('00.37291', 'SIEGE DE TABLE', '55.00 �', '10', '26.43 �');
INSERT INTO ARTICLES VALUES ('00.37325', 'CASQUE CYCLISTE PROTECTION', '27.00 �', '20', '20.00 �');
INSERT INTO ARTICLES VALUES ('00.37341', 'BONNET PARE-CHOCS', '10.71 �', '100', '05.71 �');
INSERT INTO ARTICLES VALUES ('00.37366', 'STORE DE PROTECTION', '07.43 �', '5', '04.29 �');
INSERT INTO ARTICLES VALUES ('00.37408', 'COINS DE PROTECTION', '04.00 �', '100', '01.71 �');
INSERT INTO ARTICLES VALUES ('00.37424', 'CACHE PRISE DE COURANT', '02.29 �', '500', '00.71 �');
INSERT INTO ARTICLES VALUES ('00.37432', 'BLOQUE PORTE', '05.00 �', '4', '02.29 �');
INSERT INTO ARTICLES VALUES ('00.37457', 'BANDE DE FERMETURE', '02.29 �', '4', '01.71 �');
INSERT INTO ARTICLES VALUES ('00.37465', 'PROTECTION DE FOUR', '37.86 �', '10', '26.43 �');
INSERT INTO ARTICLES VALUES ('00.37473', 'PROTECTION DE CUISINIERE', '30.71 �', '10', '22.86 �');
INSERT INTO ARTICLES VALUES ('00.37515', 'BABY PHONE', '80.71 �', '3', '45.71 �');
INSERT INTO ARTICLES VALUES ('00.37630', 'BRETELLE DE SECURITE REMOND', '15.57 �', '8', '11.43 �');
INSERT INTO ARTICLES VALUES ('00.39321', 'HAUSSE-CHAISE', '42.71 �', '1', '25.43 �');
INSERT INTO ARTICLES VALUES ('00.39495', 'COUVRE ROBINETTERIE', '07.86 �', '12', '04.29 �');
INSERT INTO ARTICLES VALUES ('11.36613', 'BARRIERE DE PORTE, EN BOIS', '32.71 �', '2', '25.71 �');
INSERT INTO ARTICLES VALUES ('11.36639', 'BARRIERE DE PORTE, EN METAL', '79.14 �', '3', '28.43 �');
INSERT INTO ARTICLES VALUES ('11.36860', 'BARRIERE DE LIT', '23.71 �', '10', '15.71 �');
INSERT INTO ARTICLES VALUES ('11.37108', 'PORTE-BEBE', '44.86 �', '6', '34.29 �');
INSERT INTO ARTICLES VALUES ('11.37173', 'SIEGE-AUTO COSMOS', '126.86 �', '2', '71.43 �');
INSERT INTO ARTICLES VALUES ('11.37280', 'SIEGE-AUTO EUROSEAT', '121.29 �', '2', '71.43 �');
INSERT INTO ARTICLES VALUES ('WD.001', 'K7 VIDEO - TOY STORY', '21.29 �', '10', '09.29 �');
INSERT INTO ARTICLES VALUES ('WD.002', 'DVD - TOY STORY 2', '34.29 �', '10', '12.14 �');
INSERT INTO ARTICLES VALUES ('WD.003', 'K7 VIDEO - WINNIE L OURSON', '32.86 �', '5', '09.29 �');
INSERT INTO ARTICLES VALUES ('MV.001', 'Jeux Vid�o PS4 SPIDER-MAN', '59.00 �', '250', '19.00 �');

-- Les commandes du magasin FR02 c est celui de Paris

CREATE TABLE COMMANDES (Col1 VARCHAR(50), Col2 VARCHAR(50), Col3 VARCHAR(50));
INSERT INTO COMMANDES VALUES ('20150917BB0001', '2997007', '17/09/2015');
INSERT INTO COMMANDES VALUES ('20150917BB0002', '2998500', '17/09/2015');
INSERT INTO COMMANDES VALUES ('20151016BB0001', '2996100', '16/10/2015');
INSERT INTO COMMANDES VALUES ('20151024BB0001', '2996100', '24/10/2015');
INSERT INTO COMMANDES VALUES ('20120156BB0001', '2996100', '16/01/2012');
INSERT INTO COMMANDES VALUES ('20120157BB0007', '2996100', '17/01/2012');
INSERT INTO COMMANDES VALUES ('20180917BB0007', '3001777', '17/09/2018');

-- Les d�tails des commandes du magasin FR02 c est celui de Paris

CREATE TABLE DETAILSCOM (Col1 VARCHAR(50), Col2 VARCHAR(50), Col3 VARCHAR(50), Col4 VARCHAR(50), Col5 VARCHAR(50));
INSERT INTO DETAILSCOM VALUES ('20150917BB0001', '00.37291', '2', '35.00 �', '10.00%');
INSERT INTO DETAILSCOM VALUES ('20150917BB0001', '00.37341', '4', '10.71 �', '10.00%');
INSERT INTO DETAILSCOM VALUES ('20150917BB0001', '11.36639', '2', '49.14 �', '00.00%');
INSERT INTO DETAILSCOM VALUES ('20150917BB0001', 'WD.001', '1', '21.29 �', '00.00%');
INSERT INTO DETAILSCOM VALUES ('20150917BB0002', '00.37291', '2', '35.00 �', '00.00%');
INSERT INTO DETAILSCOM VALUES ('20150917BB0002', 'WD.001', '1', '21.29 �', '00.00%');
INSERT INTO DETAILSCOM VALUES ('20150917BB0002', 'WD.002', '1', '34.29 �', '00.00%');
INSERT INTO DETAILSCOM VALUES ('20150917BB0002', 'WD.003', '1', '22.86 �', '00.00%');
INSERT INTO DETAILSCOM VALUES ('20151016BB0001', 'WD.001', '1', '21.29 �', '20.00%');
INSERT INTO DETAILSCOM VALUES ('20151016BB0001', 'WD.002', '1', '34.29 �', '00.00%');
INSERT INTO DETAILSCOM VALUES ('20151016BB0001', 'WD.003', '1', '22.86 �', '00.00%');
INSERT INTO DETAILSCOM VALUES ('20151024BB0001', '00.37457', '2', '03.29 �', '00.00%');
INSERT INTO DETAILSCOM VALUES ('20120156BB0001', 'WD.003', '2', '25.00 �', '00.00%');
INSERT INTO DETAILSCOM VALUES ('20120157BB0007', 'WD.001', '5', '22.00 �', '50.00%');
INSERT INTO DETAILSCOM VALUES ('20120157BB0007', 'WD.002', '10', '34.29 �', '50.00%');
INSERT INTO DETAILSCOM VALUES ('20180917BB0007', 'MV.001', '2', '59.00 �', '10.00%');

COMMIT;
