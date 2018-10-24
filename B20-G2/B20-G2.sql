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

-- NOM Pr�nom 1                   : ELILTHAMILVALAVAN Magilan
-- NOM Pr�nom 2                   : MOUSSA Abdelkader

-- ====>>> Vos fichiers sql devront s'appeler : B20-G2.sql


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


SPOOL B20-GCI-02.lst

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
DROP TABLE DETAILCOM;
DROP TABLE ARTICLES;
DROP TABLE COMMANDES;
DROP TABLE CLIENTS;
PROMPT
-- Pause Tapez sur Enter...
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
-- Pause Tapez sur Enter...
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
-- Pause Tapez sur Enter...
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
-- Pause Tapez sur Enter...
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
-- Pause Tapez sur Enter...

-- ===============================================================================
-- D�finition de la structure des donn�es =========== FIN     ====================
-- en SQL 2 ======================================================================

-- Enrichissement des donn�es ========================== DEBUT =========================================
-- Enrichissement des donn�es ==========================================================================
-- Enrichissement des donn�es ==========================================================================

PROMPT
PROMPT =====================================================================
PROMPT |                                                                   |
PROMPT |      Historique des mouvements des articles                       |
PROMPT |                                                                   |
PROMPT =====================================================================
PROMPT
PROMPT

/*
-- Premi�re proposition pour les d�clencheurs

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
-- Pause Tapez sur Enter...

PROMPT
PROMPT =========================================================
PROMPT Suppression et cr�ation du trigger = d�clencheur.
PROMPT =========================================================
PROMPT
DROP TRIGGER MAJ_PRIX_ARTICLES;

CREATE OR REPLACE TRIGGER MAJ_PRIX_ARTICLES
	AFTER UPDATE ON ARTICLES
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

*/

-- Deuxi�me proposition pour les d�clencheurs

PROMPT
PROMPT =========================================================
PROMPT Il est n�cessaire de cr�er une table qui permet
PROMPT de garder le prix des articles avant leurs mises � jour.
PROMPT C est une table qui aura comme colonnes la r�f�rence, le nom, le prix
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
-- Pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT >> Trigger sur les mouvements des articles
PROMPT =====================================================================

PROMPT =====================================================================
PROMPT Suppression et cr�ation du Trigger.
PROMPT =====================================================================
PROMPT
DROP TRIGGER MOUVEMENTS_ARTICLES;

CREATE OR REPLACE TRIGGER MOUVEMENTS_ARTICLES
	AFTER UPDATE OR INSERT OR DELETE ON ARTICLES
	FOR EACH ROW
DECLARE
	V_REFART	VARCHAR2(10)	:= :OLD.REFART;
	V_NOMART	VARCHAR2(50)	:= :OLD.NOMART;
	V_PVART		NUMBER(10, 2)	:= :OLD.PVART;
	V_PAART		NUMBER(10, 2)	:= :OLD.PAART;
	V_QSART		NUMBER(3)		:= :OLD.QSART;

	VI_REFART	VARCHAR2(10)	:= :NEW.REFART;
	VI_NOMART	VARCHAR2(50)	:= :NEW.NOMART;
	VI_PVART	NUMBER(10, 2)	:= :NEW.PVART;
	VI_PAART	NUMBER(10, 2)	:= :NEW.PAART;
	VI_QSART	NUMBER(3)		:= :NEW.QSART;

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

-- Enrichissement du sch�ma d'une BD : =====================================>>>>>>>

-- Cr�ation des acc�l�rateurs des traitements : Les index ==================>>>>>>>

CREATE INDEX ndexcli ... ;

-- Cr�ation des r�les et des profils qui seront affect�s aux utilisateurs ===>>>>>>
-- Partage de donn�es

CREATE ROLE...
CREATE PROFILE...

-- COMMENT ou NO-COMMENT ? =================================================>>>>>>>
-- Commenter avec SQL (les commentaires seront stock�s dans le dictionnaire du SGBD)
-- vos tables et vos colonnes : il s'agit des m�ta-informations (m�ta-donn�es) tr�s utiles
-- pour les autres utilisateurs

-- COMMENT ou NO-COMMENT ? =================================================>>>>>>>
-- D�clenchement d'actions automatiques pour garder trace de toutes les mises � jour
-- des donn�es, grader plusieurs versions...
-- D�velopper le n�cessaire pour tracer tous les changements effectu�s dans la table des Clients !
-- Ceci pourrait permettre de faire un meilleur suivi de la client�le...

*/

PROMPT
PROMPT =========================================================
PROMPT Il est n�cessaire de cr�er une table qui permet
PROMPT de garder toutes les donn�es sur les clients avant leurs mises � jour.
PROMPT C est une table qui aura comme colonnes toutes celles de d�part avant la mise
PROMPT � jour et la date de la mise � jour, l'utilisateur ayant fait la lise � jour, etc...
PROMPT =========================================================
PROMPT

PROMPT
PROMPT =====================================================================
PROMPT Il est n�cessaire de cr�er une table HISTORIQUE_MVTS_CLIENTS.
PROMPT =====================================================================
PROMPT
/*
DROP TABLE HISTORIQUE_MVTS_CLIENTS;


CREATE TABLE HISTORIQUE_MVTS_CLIENTS
(
------------ � vous de compl�ter
);

PROMPT
-- Pause Tapez sur Enter...
PROMPT
*/

DROP TABLE HISTORIQUE_MVTS_CLIENTS;

CREATE TABLE HISTORIQUE_MVTS_CLIENTS(
	CODCLI VARCHAR2(10), 
	CIVCLI VARCHAR2(12),
	NOMCLI VARCHAR2(20),
	PRENCLI VARCHAR2(20),
	CATCLI NUMBER(1),
	ADNCLI VARCHAR2(10),
	ADRCLI VARCHAR2(50),
	CPCLI VARCHAR2(10),
	VILCLI VARCHAR2(20),
	PAYSCLI VARCHAR2(30),
	MAILCLI VARCHAR2(30),
	TELCLI VARCHAR2(20),
	DATEMAJ DATE
);

CREATE OR REPLACE TRIGGER HISTORIQUE_MVTS_CLIENTS
	AFTER UPDATE ON CLIENTS
	FOR EACH ROW
DECLARE
BEGIN
	INSERT INTO HISTORIQUE_MVTS_CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI,ADNCLI,ADRCLI,CPCLI,VILCLI,PAYSCLI,MAILCLI,TELCLI,DATEMAJ)
	VALUES (:OLD.CODCLI, :OLD.CIVCLI, :OLD.NOMCLI, :OLD.PRENCLI, :OLD.CATCLI, :OLD.ADNCLI, :OLD.ADRCLI, :OLD.CPCLI, :OLD.VILCLI, :OLD.PAYSCLI, :OLD.MAILCLI, :OLD.TELCLI, sysdate);
END;
/

-- Enrichissement des donn�es ========================== FIN ===========================================
-- Enrichissement des donn�es ==========================================================================
-- Enrichissement des donn�es ==========================================================================


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
-- Pause Tapez sur Enter...
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
VALUES ('20061FB', 'C010', 'FRIDAY 14-FEBRURAY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20062FB', 'C009', 'FRIDAY 14-FEBRURAY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20065FB', 'C007', 'FRIDAY 14-FEBRURAY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20066FB', 'C002', 'FRIDAY 14-FEBRURAY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20067FB', 'C002', 'FRIDAY 14-FEBRURAY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20068FB', 'C002', 'FRIDAY 14-FEBRURAY-2003');

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
-- Pause Tapez sur Enter...
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
-- Pause Tapez sur Enter...
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
-- Pause Tapez sur Enter...

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
-- Pause Tapez sur Enter...
PROMPT

SELECT * FROM COMMANDES;

PROMPT
-- Pause Tapez sur Enter...
PROMPT

SELECT * FROM ARTICLES;

PROMPT
-- Pause Tapez sur Enter...
PROMPT

SELECT * FROM DETAILCOM;

PROMPT
-- Pause Tapez sur Enter...
PROMPT
-- ===============================================================================
-- Insertion des donn�es ============================ FIN ========================
-- en SQL 2 ======================================================================



-- Manipulations-Interrogations des donn�es =======================================================
-- en SQL 2 =======================================================================================
-- Requ�tes dans les tables =======================================================================


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


-- Manipulations pour v�rifier les TRIGGERS des lignes dans les tables ===========
-- Table des Articles

PROMPT
-- Pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT Exemple avec 2 insertions et 2 mises � jour dans la table ARTICLES
PROMPT =========================================================
PROMPT
DELETE	FROM	ARTICLES
WHERE	REFART = 'WD.010';

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.010', 'K7 VIDEO-Exemple de k7', 30.00, 3, 13.00);

DELETE	FROM	ARTICLES
WHERE	REFART = 'WD.011';

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.011', 'Exemple de DVD', 25.00, 5, 10.00);

PROMPT
-- Pause Tapez sur Enter...
PROMPT

COLUMN REFART	FORMAT A6
COLUMN NOMART	FORMAT A25
COLUMN PVART	FORMAT 99.99
COLUMN QSMART	FORMAT 99
COLUMN PAART	FORMAT 99.99
COLUMN DATMAJ	FORMAT A26

PROMPT =========================================================
PROMPT Visualisation des articles ins�r�s dans ARTICLES
PROMPT =========================================================
TTITLE CENTER 'Visualisation des articles ins�r�s dans ARTICLES' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	*
FROM	ARTICLES
WHERE	REFART in ('WD.010', 'WD.011');

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
-- ???

PROMPT
-- Pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT MAJ des articles dans ARTICLES
PROMPT =========================================================
PROMPT
TTITLE CENTER 'Mise � jour des articles ins�r�s dans ARTICLES' skip 1 -
       LEFT   '=========================================================================' skip 0
UPDATE	ARTICLES
SET	PVART = 45.00, PAART = 15.00
WHERE	REFART = 'WD.010';

UPDATE	ARTICLES
SET	PVART = 2.00
WHERE	REFART = 'WD.011';

PROMPT
-- Pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Visualisation des 2 articles MAJ dans ARTICLES
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Visualisation des 2 articles MAJ dans ARTICLES' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT	*
FROM	ARTICLES
WHERE	REFART in ('WD.010', 'WD.011');

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
-- ???

PROMPT
-- Pause Tapez sur Enter...
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
-- ???

PROMPT
-- Pause Tapez sur Enter...
PROMPT


PROMPT
PROMPT =====================================================================
PROMPT |                                                                   |
PROMPT |      Historique des mouvements des articles                       |
PROMPT |                                                                   |
PROMPT =====================================================================
PROMPT
PROMPT


PROMPT
-- Pause Tapez sur Enter...
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
PROMPT Suppression et Insertion dans la table ARTICLES (par user-X par exemple)
PROMPT =====================================================================
PROMPT
DELETE
FROM	ARTICLES
WHERE	REFART = 'WD.012';

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.012', 'Exemple de DVD BIS', 25.00, 5, 10.00);

PROMPT =====================================================================
PROMPT Mouvements dans la table ARTICLES effectu�s par des utilisateurs
PROMPT externes: user-y et user-X
PROMPT =====================================================================
PROMPT

PROMPT
-- Pause Tapez sur Enter...
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
-- Pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Suppression et insertion dans la table ARTICLES.
PROMPT =====================================================================
PROMPT
DELETE	FROM	ARTICLES
WHERE	REFART = 'WD.012';

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.012', 'le roi de la jungle 1', 29.99, 5, 13.00);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
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
-- Pause Tapez sur Enter...
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
PROMPT Mise � jour dans la table ARTICLES pour effectuer les tests.
PROMPT =====================================================================
PROMPT
UPDATE	ARTICLES
SET	PVART = 35.00, PAART = 10.90, QSART = 12
WHERE	REFART = 'WD.012';

UPDATE	ARTICLES
SET	PVART = 50.00, PAART = 25.00, QSART = 10
WHERE	REFART = 'WD.012';

UPDATE	ARTICLES
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
PROMPT la table ARTICLES, pendant une p�riode. Tout �a pour pouvoir ensuite
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
-- Pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Suppression et creation de la table comparaison_chiffre_affaires.
PROMPT Cette table va permettre de stocker les informations concernant
PROMPT le chiffre d affaires moyen des diff�rents pays avant la p�riode o�
PROMPT l on a d�cid� de regarder l impact des mouvements effectu�s sur
PROMPT la table ARTICLES. De garder aussi le chiffre d affaires durant
PROMPT la p�riode consid�r�e. Et aussi, d inscrire la variation au niveau
PROMPT des chiffres d affaires.
PROMPT =====================================================================
PROMPT
DROP TABLE COMPARAISON_CHIFFRE_AFFAIRES;

CREATE TABLE COMPARAISON_CHIFFRE_AFFAIRES
(
	PAYS		VARCHAR2(20),
	DATE_DEBUT	INTEGER,
	DATE_FIN	INTEGER,
	CA_AVANT	NUMBER(10, 2),
	CA_APRES	NUMBER(10, 2),
	VARIATION	NUMBER(10, 2)
);

PROMPT
-- Pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Creation de vue VUE_ART permettant de garder pour chaque article
PROMPT de la table ARTICLES son prix de vente moyen, son prix d achat moyen
PROMPT et sa quantit� en stock moyen.
PROMPT =====================================================================
PROMPT
CREATE OR REPLACE VIEW VUE_ART (REFART, A_PVART, A_PAART, A_QSART) AS
(
	SELECT		DISTINCT REFART, AVG(PVART) as A_PVART, AVG(PAART) as A_PAART, AVG(QSART) as A_QSART
	FROM		ARTICLES
	GROUP BY 	REFART
);


PROMPT
-- Pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Creation de vue VUE_MVTS_ART permettant de garder pour chaque article
PROMPT de la table HISTORIQUE_MVTS_ARTICLES son prix de vente moyen, son
PROMPT prix d achat moyen et sa quantit� en stock moyen.
PROMPT =====================================================================
PROMPT
CREATE OR REPLACE VIEW VUE_MVTS_ART (REFART, A_PVART, A_PAART, A_QSART) AS
(
	SELECT		DISTINCT REFART, AVG(PVART) as A_PVART, AVG(PAART) as A_PAART, AVG(QSART) as A_QSART
	FROM		HISTORIQUE_MVTS_ARTICLES
	WHERE		TYPEMVT = 'UPDATE'
	AND		EXTRACT(YEAR FROM DATMVT) BETWEEN 2006 AND 2007
	GROUP BY 	REFART
);


PROMPT
-- Pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Creation de vue CHIFFRE_AFFAIRES_AVANT permettant de calculer le
PROMPT chiffre d affaires de chaque pays avant une p�riode consid�r�e.
PROMPT =====================================================================
PROMPT
CREATE OR REPLACE VIEW CHIFFRE_AFFAIRES_AVANT AS
(
	SELECT	cl.PAYSCLI, sum((d.PUART*d.QTCOM) * (1-(d.REMISE/100))) as chiffre_affaire
	FROM	DETAILCOM d, CLIENTS cl, COMMANDES c
	WHERE	d.NUMCOM  = c.NUMCOM
	AND	cl.CODCLI = c.CODCLI
	AND	EXTRACT(YEAR FROM c.DATCOM) < 2006
	GROUP BY cl.PAYSCLI
);

PROMPT
-- Pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Creation de vue CHIFFRE_AFFAIRES_APRES permettant de calculer le
PROMPT chiffre d affaires de chaque pays durant la p�riode consid�r�e.
PROMPT =====================================================================
PROMPT
CREATE OR REPLACE VIEW CHIFFRE_AFFAIRES_APRES (PAYSCLI, CHIFFAFF, ) AS
(
	SELECT	cl.PAYSCLI, sum((d.PUART*d.QTCOM) * (1-(d.REMISE/100))) as chiffre_affaires
	FROM	DETAILCOM d, CLIENTS cl, COMMANDES c
	WHERE	d.NUMCOM  = c.NUMCOM
	AND	cl.CODCLI = c.CODCLI
	AND	EXTRACT(YEAR FROM c.DATCOM) BETWEEN 2006 AND 2007
	GROUP BY cl.PAYSCLI
);

PROMPT
-- Pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Creation de procedure MOYENNE_PRIX_ART permettant de calculer le prix
PROMPT moyen d achat et de vente, et la quantit� moyenne en stock de chaque
PROMPT article. Et ensuite de calculer le chiffre d affaires avant et pendant
PROMPT une p�riode consid�r�e. Tout cela pour savoir si les mouvements
PROMPT effectu�s, durant une p�riode consid�r�e, sur la table ARTICLES ont
PROMPT apport� plus ou moins d argent.
PROMPT =====================================================================
PROMPT
CREATE OR REPLACE PROCEDURE MOYENNE_PRIX_ART IS
	CURSOR curseur IS
		SELECT	DISTINCT REFART
		FROM	VUE_MVTS_ART;

	CURSOR curseurBIS IS
		SELECT	DISTINCT PAYSCLI
		FROM	CLIENTS;


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

		INSERT INTO COMPARAISON_CHIFFRE_AFFAIRES
		VALUES (V_PAYS, 2006, 2007, V_CA_AVANT, V_CA_APRES, V_VARIATION);
	END LOOP;
END;
/

PROMPT
-- Pause Tapez sur Enter...
PROMPT

PROMPT =====================================================================
PROMPT Execution de procedure
PROMPT =====================================================================
PROMPT
EXECUTE MOYENNE_PRIX_ART;


PROMPT
-- Pause Tapez sur Enter...
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
-- ??

PROMPT
-- Pause Tapez sur Enter...
PROMPT

TTITLE CENTER 'Visualisation de la table COMPARAISON_CHIFFRE_AFFAIRE' skip 1 -
       LEFT   '=========================================================================' skip 0
SELECT * FROM COMPARAISON_CHIFFRE_AFFAIRE;

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
--
--      Visualisation de la table COMPARAISON_CHIFFRE_AFFAIRE
--??

PROMPT
-- Pause Tapez sur Enter...
PROMPT

--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================


PROMPT =====================================================================
PROMPT >> Requete  : Articles toujours command�s ensemble
PROMPT =====================================================================
PROMPT
TTITLE CENTER 'Requete: les articles qui sont toujours command�s ensemble' skip 1 -
       LEFT   '=========================================================================' skip 0

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
-- Le(s) les articles qui sont toujours command�s ensemble sont :
--??

-- FB FB FB FB FB FB A compl�ter

-- >>>>>>>>>>>>>>>>>>>>>>>>>> -- R�sultat g�n�r�:
-- Le(s) les articles qui sont toujours command�s ensemble sont :
--??

-- FB FB FB FB FB FB A compl�ter
--


-- ************************************************************************************************
-- ************************************************************************************************
-- ************************************************************************************************
-- ************************************************************************************************
-- ************************************************************************************************
-- **********    Historique des mouvements des clients                             ****************
-- ************************************************************************************************
-- ************************************************************************************************
-- ************************************************************************************************
-- ************************************************************************************************
-- ************************************************************************************************

-- Manipulations pour v�rifier les TRIGGERS des lignes dans les tables ============================
-- Table des Clients


-- FB FB FB FB FB FB A compl�ter

--=================================================================================================
--=================================================================================================
--=================================================================================================
--=================================================================================================



--=================================================================================================
--=================================================================================================
--=================================================================================================
--= Manipulation intelligente des donn�es : Qu�est-ce un syst�me de recommandation�  ==============
--=================================================================================================
--=================================================================================================
--=================================================================================================
--=================================================================================================
-- MFB FFF +++

/*
FB6.1. Construisez la vue � Vi � qui contient les articles command�s par un client donn� � Ci �.
G�n�ralisez dans une proc�dure PL/SQL !

FB6.2. Construisez la vue � Vij � qui contient les articles command�s � la fois
par les deux clients � Ci � et � Cj �.
On pourrait consid�rer que les deux clients � Ci � et � Cj � sont � amis-voisins �
si et seulement si la vue � Vij � est non vide (ou 90%)!

On pourrait alors recommander ou proposer � l�un des deux clients, soit � Cj �,
les articles de � Ci � -son ami- qu�il n�a pas command�s !

On pourrait aussi recommander ou proposer � l�un des deux clients, soit � Cj �,
les articles de � Ci � -son ami- qu�il n�a pas command�s +
mais qui doivent appartenir � la m�me cat�gorie !

Discussions & G�n�ralisation !

*/

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????


--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
-- MFB FFF +++++++++++++++++++++++++++++++++++++++++++

--=================================================================================================
--=================================================================================================
--=================================================================================================
--= Manipulation intelligente des donn�es : D�pendances Fonctionnelles   ==========================
--=================================================================================================
--=================================================================================================
--=================================================================================================
--=================================================================================================
-- MFB FFF +++

/*

Requ�tes Ji (PL/SQL Proc�dures-Fonctions ; pour v�rifier la Coh�rence globale des donn�es ;
>>>>>>>>>>>>>> Qualit� des donn�es

D�veloppez une proc�dure PL/SQL qui permet de v�rifier certaines d�pendances fonctionnelles dans la table des clients !

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????
*/

DROP TABLE VILPAYSDF ;
CREATE TABLE VILPAYSDF (COL1 VARCHAR2(20), COL2 VARCHAR2(20));
INSERT INTO VILPAYSDF VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
INSERT INTO VILPAYSDF VALUES ('PARIS', 'FRANCE');
INSERT INTO VILPAYSDF VALUES ('VILLETANEUSE', 'FRANCE');
INSERT INTO VILPAYSDF VALUES ('EPINAY-SUR-SEINE', '');
INSERT INTO VILPAYSDF VALUES ('EPINAY SUR SEINE', 'FRANCE');
INSERT INTO VILPAYSDF VALUES ('PARIS', 'FRANCE');
INSERT INTO VILPAYSDF VALUES ('PARIS', '');
INSERT INTO VILPAYSDF VALUES ('PARIS', 'FRANCE');
INSERT INTO VILPAYSDF VALUES ('MARSEILLE', 'FRANCE');
INSERT INTO VILPAYSDF VALUES ('ORLY-VILLE', 'FRANCE');
INSERT INTO VILPAYSDF VALUES ('MARSEILLE', 'FRANC');
INSERT INTO VILPAYSDF VALUES ('PARYS', 'FR');
INSERT INTO VILPAYSDF VALUES ('EPINAY-SUR-SEINE', 'FRANCE');
INSERT INTO VILPAYSDF VALUES ('PARIS', 'france');
INSERT INTO VILPAYSDF VALUES ('Bruxelles', 'Belgique');
COMMIT;

REM VISUALISATION DES DONNEES
SELECT * FROM VILPAYSDF;

REM HOMOGENEISATION DES DONNEES : TOUT EN MAJUSCULE
UPDATE VILPAYSDF SET COL1 = UPPER(COL1);
UPDATE VILPAYSDF SET COL2 = UPPER(COL2);
COMMIT;

SELECT * FROM VILPAYSDF;

-- Algorithme pour v�rifier la DF entre 2 colonnes :
CREATE OR REPLACE VIEW LISTAVERIFIER_VP (VILLE, PAYS) AS
SELECT DISTINCT * FROM VILPAYSDF;

SELECT * FROM LISTAVERIFIER_VP ;

CREATE OR REPLACE VIEW VERIFDF_VP (VILLE, NBR) AS
SELECT VILLE, COUNT(*) AS NBR FROM LISTAVERIFIER_VP GROUP BY VILLE ORDER BY VILLE;
SELECT * FROM VERIFDF_VP ;

SELECT MAX(NBR) AS MAXOCCUR FROM VERIFDF_VP;
-- REM Si MAXOCCUR > 1 Alors la DF n'est pas v�rifi�e !

--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
--======================================================================================
-- MFB FFF +++++++++++++++++++++++++++++++++++++++++++


--=================================================================================================
--=================================================================================================
--=================================================================================================
--= Manipulation intelligente des donn�es : Elimination des doubles et des similaires   ===========
--=================================================================================================
--=================================================================================================
--=================================================================================================
--=================================================================================================
-- MFB FFF +++

/*

Requ�tes Ji (PL/SQL Proc�dures-Fonctions ; pour v�rifier la Coh�rence globale des donn�es ;
>>>>>>>>>>>>>> Qualit� des donn�es

D�veloppez une proc�dure PL/SQL qui permet d��liminer les doubles dans la table des clients !

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????

*/

/*
Entre parenth�ses hihi haha FFF ! (...)

Etant donn� la table TABCLIDS suivante :
Elle est issue des tables de la BD GesComI...
Faire les requ�tes ci-dessous :
Eliminer les doubles et les similaires !
*/

DROP TABLE TABCLIDS ;
CREATE TABLE TABCLIDS (COL1 VARCHAR(10), COL2 VARCHAR(12), COL3 VARCHAR(10), COL4 VARCHAR(10), COL5 VARCHAR(1));
INSERT INTO TABCLIDS VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENCE', '3');
INSERT INTO TABCLIDS VALUES ('2996100', 'Monsieur', 'CLEMENCE', 'ALEXANDRE', '1');
INSERT INTO TABCLIDS VALUES ('3000107', 'MO�NSIEUR', 'ONRI', 'PANDA', '2');
INSERT INTO TABCLIDS VALUES ('2997777', 'Mademoiselle', 'LE BON', 'CLEMENTINE', '1');
INSERT INTO TABCLIDS VALUES ('299PPPP', 'Mlle', 'BON', 'CLEMENTINE', '1');
INSERT INTO TABCLIDS VALUES ('2997007', 'Monsieur', 'TRAIFOR', 'ADAM', '2');
INSERT INTO TABCLIDS VALUES ('2998500', 'Monsieur', 'CHEVALIER', 'INES', '1');
INSERT INTO TABCLIDS VALUES ('3000106', 'Monsieur', 'HARISSA', 'FORD', '1');
INSERT INTO TABCLIDS VALUES ('3000108', 'Madame', 'EDITE', 'FIAT', '1');
INSERT INTO TABCLIDS VALUES ('3000109', 'Madame', 'TOYOTA', 'JACKSON', '3');
INSERT INTO TABCLIDS VALUES ('3000111', 'Madame', 'GENEREUX', 'EVE', '1');
INSERT INTO TABCLIDS VALUES ('3001778', 'Mr', 'COURTOIS', 'Bruno', '1');
INSERT INTO TABCLIDS VALUES ('3001779', 'Monsieur', 'VANDERHOTE', 'Ivan', '1');
INSERT INTO TABCLIDS VALUES ('3001780', 'Monsieur', 'Hollanda', 'Francis', '1');
INSERT INTO TABCLIDS VALUES ('3001781', 'Monsieur', 'Bernard', 'Hugues', '1');
INSERT INTO TABCLIDS VALUES ('3001782', 'Monsieur', 'LATIFOU', 'Ilyas', '1');
INSERT INTO TABCLIDS VALUES ('3001783', 'Madame', 'LALLEMAND', 'Ines', '1');
INSERT INTO TABCLIDS VALUES ('3001784', 'Monsieur', 'DEUTCH', 'Hans', '1');
INSERT INTO TABCLIDS VALUES ('3001785', 'Madame', 'ALMANI', 'Eve', '1');
INSERT INTO TABCLIDS VALUES ('3001786', 'Madame', 'MERQUELLE', 'Ange', '1');
INSERT INTO TABCLIDS VALUES ('3001', 'M.', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('3001777', 'Mr', 'LE BON', 'Adem', '1');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('2998505', 'Mademoiselle', 'TRAIFOR', 'ALICE', '2');
INSERT INTO TABCLIDS VALUES ('3000110', 'MADAME', 'ONRI', 'HONDA', '2');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsie�r', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENCE', '3');
INSERT INTO TABCLIDS VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENCE', '3');
INSERT INTO TABCLIDS VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENSE', '3');
INSERT INTO TABCLIDS VALUES ('2997007', '', 'TRAIFOR', 'ADAM', '2');
INSERT INTO TABCLIDS VALUES ('2997007', '', 'TRAIFOR', 'ADAM', '');
COMMIT;

--======================================================================================

REM VISUALISATION DES DONNEES
SELECT COUNT(*) AS NbrCli FROM TABCLIDS;
SELECT * FROM TABCLIDS;

REM ??? Que font les commandes SQL ci-dessous ?
SELECT COUNT(DISTINCT *) FROM TABCLIDS;
SELECT DISTINCT * FROM TABCLIDS;

SELECT col1, col2, col3, col4, col5 FROM TABCLIDS
    minus
SELECT DISTINCT col1, col2, col3, col4, col5 FROM TABCLIDS;

-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????
-- A VOUS ! -- BON COURAGE -- MFB
-- ????????????      FB FB FB FB FB FB A compl�ter ??????????????
--======================================================================================
--======================================================================================
--======================================================================================
COMMIT;
SET TIMING OFF;
SPOOL OFF;
--======================================================================================
--======================================================================================
--======================================================================================





DROP TABLE TABCLIDS ;
CREATE TABLE TABCLIDS (COL1 VARCHAR(10), COL2 VARCHAR(12), COL3 VARCHAR(10), COL4 VARCHAR(10), COL5 VARCHAR(1));
INSERT INTO TABCLIDS VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENCE', '3');
INSERT INTO TABCLIDS VALUES ('2996100', 'Monsieur', 'CLEMENCE', 'ALEXANDRE', '1');
INSERT INTO TABCLIDS VALUES ('3000107', 'MO�NSIEUR', 'ONRI', 'PANDA', '2');
INSERT INTO TABCLIDS VALUES ('2997777', 'Mademoiselle', 'LE BON', 'CLEMENTINE', '1');
INSERT INTO TABCLIDS VALUES ('299PPPP', 'Mlle', 'BON', 'CLEMENTINE', '1');
INSERT INTO TABCLIDS VALUES ('2997007', 'Monsieur', 'TRAIFOR', 'ADAM', '2');
INSERT INTO TABCLIDS VALUES ('2998500', 'Monsieur', 'CHEVALIER', 'INES', '1');
INSERT INTO TABCLIDS VALUES ('3000106', 'Monsieur', 'HARISSA', 'FORD', '1');
INSERT INTO TABCLIDS VALUES ('3000108', 'Madame', 'EDITE', 'FIAT', '1');
INSERT INTO TABCLIDS VALUES ('3000109', 'Madame', 'TOYOTA', 'JACKSON', '3');
INSERT INTO TABCLIDS VALUES ('3000111', 'Madame', 'GENEREUX', 'EVE', '1');
INSERT INTO TABCLIDS VALUES ('3001778', 'Mr', 'COURTOIS', 'Bruno', '1');
INSERT INTO TABCLIDS VALUES ('3001779', 'Monsieur', 'VANDERHOTE', 'Ivan', '1');
INSERT INTO TABCLIDS VALUES ('3001780', 'Monsieur', 'Hollanda', 'Francis', '1');
INSERT INTO TABCLIDS VALUES ('3001781', 'Monsieur', 'Bernard', 'Hugues', '1');
INSERT INTO TABCLIDS VALUES ('3001782', 'Monsieur', 'LATIFOU', 'Ilyas', '1');
INSERT INTO TABCLIDS VALUES ('3001783', 'Madame', 'LALLEMAND', 'Ines', '1');
INSERT INTO TABCLIDS VALUES ('3001784', 'Monsieur', 'DEUTCH', 'Hans', '1');
INSERT INTO TABCLIDS VALUES ('3001785', 'Madame', 'ALMANI', 'Eve', '1');
INSERT INTO TABCLIDS VALUES ('3001786', 'Madame', 'MERQUELLE', 'Ange', '1');
INSERT INTO TABCLIDS VALUES ('3001', 'M.', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('3001777', 'Mr', 'LE BON', 'Adem', '1');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('2998505', 'Mademoiselle', 'TRAIFOR', 'ALICE', '2');
INSERT INTO TABCLIDS VALUES ('3000110', 'MADAME', 'ONRI', 'HONDA', '2');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsie�r', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENCE', '3');
INSERT INTO TABCLIDS VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENCE', '3');
INSERT INTO TABCLIDS VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENSE', '3');
INSERT INTO TABCLIDS VALUES ('2997007', '', 'TRAIFOR', 'ADAM', '2');
INSERT INTO TABCLIDS VALUES ('2997007', '', 'TRAIFOR', 'ADAM', '');
COMMIT;

DROP TABLE REGULAREXPRES;
CREATE TABLE REGULAREXPRES(
    CATEGORY 								VARCHAR2(20),
    REGULAREXPR 							VARCHAR2(200),
    CONSTRAINT PK_REGULAREXPRES				PRIMARY KEY(CATEGORY),
    CONSTRAINT CK_REGULAREXPRES_CATEGORY	CHECK(CATEGORY = UPPER(CATEGORY))
);
INSERT INTO REGULAREXPRES VALUES
('MAIL', '^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
INSERT INTO REGULAREXPRES VALUES
('ALPHABETIQUE', '[[:alpha:]]');
INSERT INTO REGULAREXPRES VALUES
('TELTN', '^(0|\+33)(\d){9}$');
INSERT INTO REGULAREXPRES VALUES
('NUMERIQUE', '^([1-9])(\d)*$');
INSERT INTO REGULAREXPRES VALUES
('TEMPERATURECF', '^(\-?[0-9]+(\,[0-9]+)?)(?F|?C)$');
INSERT INTO REGULAREXPRES VALUES
('NOM', '^([a-zA-Z])([a-zA-Z]+|[a-zA-Z]+[\- ][a-zA-Z]+)$');
INSERT INTO REGULAREXPRES VALUES
('PRENOM', '^([a-zA-Z])([a-zA-Z]+|[a-zA-Z]+[\-][a-zA-Z]+)$');
INSERT INTO REGULAREXPRES VALUES
('SEXE_F', '^([fF])([eE][mM]{2}[eE]|[eE][mM][eE][lL]{2}[eE]|[eE][mM][aA][lL][eE])?$|^([wW])([iI][fF][eE]|[oO][mM][aA][nN])$');
INSERT INTO REGULAREXPRES VALUES 
('SEXE_H', '^([mM]{1})(([aA][nN])|([aA][lL][eE]))?$|^([hH])([oO][mM]{2}[eE])?$');
INSERT INTO REGULAREXPRES VALUES
('BLOODGROUP', '^(A|B|O|AB)(\+|\-)$');
INSERT INTO REGULAREXPRES VALUES
('CIVILITEF', '^[mM][aA][dD][aA][mM][eE]$|^[mM][lL]{2}[eE]$|^[mM][aA][dD][eE][mM][oO][iI][eS][eE][lL]{2}[eE]$|^[mM]\.$');
INSERT INTO REGULAREXPRES VALUES
('CIVILITEH', '^[mM][oO][nN][sS][iI][eE][uU][rR]$|^[mM][rR](\.)?$');
INSERT INTO REGULAREXPRES VALUES
('CIVILITE', '^([mM][aA][dD])([aA][mM][eE]|[eE][mM][oO][iI][sS][eE][lL]{2}[eE])$|^[mM][lL]{2}[eE]$|^[mM]\.$|^[mM][oO][nN][sS][iI][eE][uU][rR]$|^[mM][rR](\.)?$');
INSERT INTO REGULAREXPRES VALUES
('ADRNUM', '^(\d)+( bis| Bis| BIS)?$');
INSERT INTO REGULAREXPRES VALUES
('ADRRUE', '^([ ]?[\w][ ]?)+([^ ])$');
INSERT INTO REGULAREXPRES VALUES
('CP', '^(\d){5}$');
INSERT INTO REGULAREXPRES VALUES
('VILLE', '^([a-zA-Z])([a-zA-Z]+|[a-zA-Z\-]+)([^-])$');
INSERT INTO REGULAREXPRES VALUES
('PAYS', '^([a-zA-Z])([a-zA-Z]+|[a-zA-Z\-]+)([^-])$');
INSERT INTO REGULAREXPRES VALUES
('IDTABCLIDS', '^[1-9][0-9]{6}$');
COMMIT;

CREATE OR REPLACE FUNCTION getRegex(categorie VARCHAR)
    return VARCHAR IS
    expression VARCHAR(2000);
BEGIN
  select regularexpr into expression from REGULAREXPRES where category = UPPER(categorie);
  return expression;
END;
/

CREATE OR REPLACE FUNCTION correctionIdTabClids(idClient in VARCHAR)
  return VARCHAR
as
BEGIN
    IF REGEXP_LIKE(idClient, '^[1-9][0-9]{6}$') THEN
        return idClient;
    ELSE
        return '';
    END IF;
  
END;
/

CREATE OR REPLACE FUNCTION correctionNom(nom in VARCHAR)
  return VARCHAR
as
BEGIN
  return UPPER(nom);
END;
/

CREATE OR REPLACE FUNCTION correctionPrenom(prenom in VARCHAR)
  return VARCHAR
as
BEGIN
  return INITCAP(prenom);
END;
/

CREATE OR REPLACE FUNCTION correctionCivilite(civilite in VARCHAR)
  return VARCHAR
as
BEGIN
  IF REGEXP_LIKE(civilite, '^[mM][oO][nN][sS][iI][eE][uU][rR]$|^[mM][rR](\.)?$') THEN
    return 'Monsieur';
  ELSE
    return 'Madame';
  END IF;
END;
/

CREATE OR REPLACE PROCEDURE correctionIntra(maColonne IN VARCHAR, maTable IN VARCHAR, wordRegex IN VARCHAR)
is
  TYPE curType IS REF CURSOR;
  vCursor curType;
  maVariable VARCHAR(255);
  variableCorrection VARCHAR(255);
  requete VARCHAR(255);
  requeteCorrection VARCHAR(255);
  requeteUpdate VARCHAR(255);
BEGIN
    requete := 'SELECT ' || maColonne || ' FROM ' || maTable;
    OPEN vCursor FOR requete;
    LOOP
      FETCH vCursor INTO maVariable;
        IF REGEXP_LIKE(maVariable, getRegex(wordRegex)) THEN
          requeteCorrection := 'SELECT CORRECTION'|| wordRegex ||'(''' || maVariable || ''') from dual';
          EXECUTE IMMEDIATE requeteCorrection
          INTO variableCorrection;
          requeteUpdate := 'UPDATE ' || maTable || ' SET ' || maColonne || '=''' || variableCorrection || ''' WHERE ' || maColonne || '=''' || maVariable || '''';
          EXECUTE IMMEDIATE requeteUpdate;
        ELSE
            requeteUpdate := 'UPDATE ' || maTable || ' SET ' || maColonne || '= null WHERE ' || maColonne || '=''' || maVariable || '''';
            EXECUTE IMMEDIATE requeteUpdate;
        END IF;
      EXIT WHEN vCursor%NOTFOUND;
    END LOOP;
    CLOSE vCursor;
END;
/

DROP TABLE ColonneNotNull;
CREATE TABLE ColonneNotNull(
    NOM VARCHAR(255),
    NBNOTNULL NUMBER(5),
    NBROW NUMBER(5)
);

create or replace function nbColonneNotNull(maColonne in VARCHAR, maTable in VARCHAR)
RETURN NUMBER
AS
    req VARCHAR(2000);
    nbNotNull NUMBER;
    nbRow NUMBER;
BEGIN
    req := 'SELECT COUNT(*) FROM ' || maTable || ' WHERE ' || maColonne || ' IS NOT NULL';
    EXECUTE IMMEDIATE req
    INTO nbNotNull;
    req := 'SELECT COUNT(*) FROM ' || maTable;
    EXECUTE IMMEDIATE req
    INTO nbRow;
    req := 'INSERT INTO ColonneNotNull VALUES(''' || maColonne || ''',''' || nbNotNull || ''',''' || NBROW || ''')';
    EXECUTE IMMEDIATE req;
    RETURN nbNotNull;
END;
/

CREATE OR REPLACE PROCEDURE allCorrectionIntra
as
BEGIN
    correctionIntra('COL1', 'TABCLIDS', 'IDTABCLIDS');
    correctionIntra('COL2', 'TABCLIDS', 'CIVILITE');
    correctionIntra('COL3', 'TABCLIDS', 'NOM');
    correctionIntra('COL4', 'TABCLIDS', 'PRENOM');
END;
/

exec allCorrectionIntra();

select nbColonneNotNull('COL1', 'TABCLIDS') from dual;
select nbColonneNotNull('COL2', 'TABCLIDS') from dual;
select nbColonneNotNull('COL3', 'TABCLIDS') from dual;
select nbColonneNotNull('COL4', 'TABCLIDS') from dual;
select nbColonneNotNull('COL5', 'TABCLIDS') from dual;

select * from TABCLIDS;
