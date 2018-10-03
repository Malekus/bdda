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

-- Groupe de Travail N� (Bin�me)  : Bxy

-- NOM Pr�nom 1                   : np1
-- NOM Pr�nom 2                   : np2

-- ====>>> Vos fichiers sql devront s'appeler : Bxy-GCI-02.sql


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


SPOOL Bxy-GCI-02.lst

PROMPT =========================================================
-- Nom du Cas       :  Gestion Commerciale Intelligente : GESCOMI : GCI
-- Nom de SGBD      :  ORACLE DBMS                    
-- Date de cr�ation :  Septembre 2018
-- Auteur           :  Faouzi BOUFARES 
-- Universit�       :  Universit� Sorbonne Paris Cit�, Universit� Paris 13 
-- Formation        :  Master 2 EID 2  
PROMPT =========================================================
PROMPT 
PROMPT =========================================================
PROMPT |                                                       |
PROMPT |     Exercice 2 :  BD GESCOMI avec SQL 2               |
PROMPT |     Enrichissement du sch�ma d une BD :               |
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
-- D�finition de la structure des donn�es ================= DEBUT    =============
-- en SQL 2 ======================================================================
-- Cr�ation des tables ============= Magasin FR01 ====== PARIS   =================

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


PROMPT 
PROMPT =====================================================================
PROMPT |                                                                   |
PROMPT |      Historique des mouvements des articles                       |
PROMPT |                                                                   |
PROMPT =====================================================================
PROMPT
PROMPT

PROMPT
PROMPT =========================================================
PROMPT Il est n�cessaire de cr�er une table qui permet
PROMPT de garder le prix des articles avant leurs mises � jour.
PROMPT C est une table qui aura comme colonne la r�f�rence, le nom, le prix
PROMPT d achat, le prix de vente (prix catalogue) de l article avant la mise
PROMPT � jour et la date de la mise � jour.
PROMPT =========================================================
PROMPT


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
PROMPT >> Trigger sur les mouvements des articles
PROMPT =====================================================================

PROMPT =====================================================================
PROMPT Suppression et cr�ation du Trigger.
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

/*

-- Enrichissement du sch�ma d'une BD :

-- Cr�ation des acc�l�rateurs des traitements : Les index ;

CREATE INDEX ndexcli ... ;

-- Cr�ation des r�les et des profils qui seront affect�s aux utilisateurs ;
-- Partage de donn�es

CREATE ROLE...
CREATE PROFILE...

-- COMMENT ou NO-COMMENT ?
-- Commenter avec SQL (les commentaires seront stock�s dans le dictionnaire du SGBD)
-- vos tables et vos colonnes : il s'agit des m�ta-informations (m�ta-donn�es) tr�s utiles
-- pour les autres utilisateurs

-- D�velopper le n�cessaire pour garder trace de tous les changements effectu�s dans la table des Clients !
-- Ceci pourrait permettre de faire un meilleur suivi de la client�le...

*/

-- FB FB FB FB FB FB A compl�ter


--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
-- MFB FFF +++


-- ===============================================================================
-- D�finition de la structure des donn�es =========== FIN     ====================
-- en SQL 2 ======================================================================

-- Insertion des donn�es ===================================================
-- en SQL 2 ================================================================
-- Insertion des lignes dans les tables ====================================

PROMPT
PROMPT =====================================================================
PROMPT Insertion des donn�es de la bd EN SQL 2 POUR UN MAGASIN donn� Le FR01 de Paris
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
VALUES ('C014', 'Monsieur', 'ADAM', 'DAVID', 5, '1', 'AVENUE DE ROME', '99001', 'ROME', 'ITALIE','david.adam�@gmail com', '+???');

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

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20056FB', 'C013', 'LUNDI 14-MARS-2005');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20057FB', 'C014', 'VENDREDI 11-MARS-2005');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20061FB', 'C010', 'vendredi 14-f�vrier-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20062FB', 'C009', 'vendredi 14-f�vrier-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20065FB', 'C007', 'vendredi 14-f�vrier-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20066FB', 'C002', 'vendredi 14-f�vrier-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20067FB', 'C002', 'vendredi 14-f�vrier-2003');

INSERT INTO COMMANDES2 (NUMCOM, CODCLI, DATCOM)
VALUES ('20068FB', 'C002', 'vendredi 14-f�vrier-2003');

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


/*

Requ�tes Ji (PL/SQL : D�clencheurs-Triggers ; Proc�dures-Fonctions ; Coh�rence globale des donn�es ; Qualit� des donn�es)

J01. D�veloppez une proc�dure PL/SQL qui permet de v�rifier la coh�rence de la BD : 
V�rifiez si toutes les commandes portent au moins sur un article et affichez celles qui sont donc vides !

J02. Afin de garder trace (sauvegarde & suivi) des prix unitaires de chaque article, d�veloppez un d�clencheur qui permet d�enregistrer chaque mise-�-jour de tables des articles !
Pour d�velopper le d�clencheur (Trigger) sur les mouvements des articles, il est n�cessaire de cr�er une table HISTORIQUE_MVTS_ARTICLES.

J03. D�veloppez une proc�dure PL/SQL qui permet d��liminer les doubles dans la table des clients !

J04. D�veloppez une proc�dure PL/SQL qui permet de v�rifier certaines d�pendances fonctionnelles dans la table des clients !

*/


-- ************************************************************************************************ 
-- ************************************************************************************************ 
-- ************************************************************************************************ 
-- ************************************************************************************************ 
-- ************************************************************************************************ 
-- **********    Historique des mouvements des articles                             *************** 
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
-- ??

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
--??



--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================





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
--??

PROMPT
pause Tapez sur Enter...
PROMPT


PROMPT =====================================================================
PROMPT >> Requete  : Articles toujours command�s ensemble
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Requete: les articles qui sont toujours command�s ensemble' skip 1 -
       LEFT   '=========================================================================' skip 0

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
--
-- Le(s) les articles qui sont toujours command�s ensemble sont :
--??
	


-- FB FB FB FB FB FB A compl�ter


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
--= Manipulation intelligente des donn�es : Qu�est-ce un syst�me de recommandation�=====
--======================================================================================
--======================================================================================
--======================================================================================
-- MFB FFF +++

/*
FB6.1. Construisez la vue � Vi � qui contient les articles command�s par un client donn� � Ci �.
G�n�ralisez dans une proc�dure PL/SQL !

FB6.2. Construisez la vue � Vij � qui contient les articles command�s � la fois 
par les deux clients � Ci � et � Cj �.
On pourrait consid�rer que les deux clients � Ci � et � Cj � sont � amis � 
si et seulement si la vue � Vij � est non vide !

On pourrait alors recommander ou proposer � l�un des deux clients, soit � Cj �, 
les articles de � Ci � -son ami- qu�il n�a pas command�s !

On pourrait aussi recommander ou proposer � l�un des deux clients, soit � Cj �, 
les articles de � Ci � -son ami- qu�il n�a pas command�s + 
mais qui doivent appartenir � la m�me cat�gorie !

Discussions & G�n�ralisation !

*/



-- FB FB FB FB FB FB A compl�ter

