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

-- ====>>> Vos fichiers sql devront s'appeler : Bxy-GCI-03.sql


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


SPOOL GCI-03.lst

SET TIMING ON;
SET LINES 1000
SET PAGES 1000

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
PROMPT |     Exercice 3 :  BD GESCOMI avec SQL 2               |
PROMPT |     Int�gration de BD                                 |
PROMPT |                                                       |
PROMPT =========================================================
PROMPT
PROMPT

PROMPT =========================================================
PROMPT Ceci permet d initialiser le type de la date
PROMPT =========================================================
/*
-- Initialiser le type de la date avec ...
ALTER SESSION SET NLS_DATE_FORMAT = 'DAY DD-MONTH-YYYY' ;
ALTER SESSION SET NLS_DATE_FORMAT = '???? HiHi HaHa' ;
*/
PROMPT =========================================================


/*

Entre parenth�ses hihi haha FFF !

Etant donn� la table CACLI suivante :
Elle est issue de plusieurs calculs sur les tables de la BD GesComI... 
Faire les requ�tes ci-dessous : Statistiques sur le chiffre d�affaires
*/


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


-- ===============================================================================
-- D�finition de la structure des donn�es ================= DEBUT    =============
-- en SQL 2 ======================================================================
-- Utilisation des tables ========== Magasin FR01 ====== PARIS   =================
-- CLIENTS2, ARTICLES2, COMMANDES2 et DETAILCOM2

-- Cr�ation des tables ============= Magasin FR02 ====== PARIS   =================
-- Cr�ation des tables ============= Magasin TN02 ====== SOUSSE  =================


-- INTEGRATION DE BASES DE DONNEES ; DATA INTEGRATION
-- QUALITE DES DONNEES ; DATA QUALITY

--======================================================================================
--======================================================================================
--======================================================================================

/*

-- Etant donn� l'ensemble des magasins

-- Chaque bin�me aura � c�er sa propore BD GesComI (On verra ult�rieurement!)!

-- Afficher la table MAGASINS_DW2

-- D�veloppez une proc�dure AJOUTECOLONNE qui permet d'ajouter � une table une colonne qui porte le nom de MAGASIN
-- Le contenu de cette colonne est l'identifiant du magasin NUMMAG
-- En entr�e le nom de la table et le contenu de la colonne ; En sortie une nouvelle table dont le nom est le nom de la table en entr�e concat�n� au _NUMMAG

-- L'ex�cution de la proc�dure permet donc d'affecter les donn�es � un seul magasin
-- On consid�re que les donn�es dans les tables CLIENTS2, ARTICLES2, COMMANDES2 et DETAILCOM2 sont celles du magasin FR01

-- EXEC AJOUTECOLONNE('CLIENTS2', 'FR01')

-- EXEC AJOUTECOLONNE('CLIENTS', 'FR02')

-- Corrigez le contenu de la nouvelle table CLIENTS_FR02 ; Comment savoir qu'elle peut contenir des anomalies et lesquelles ?

-- EXEC AJOUTECOLONNE('CLIENTS', 'TN02')

-- Corrigez le contenu de la nouvelle table CLIENTS_TN02 ; Comment savoir qu'elle peut contenir des anomalies et lesquelles ?

-- Assemblez (int�grer, fusionner) dans une nouvelle table, de nom TOUSCLIENTS, tous les clients des diff�rents magasins

-- Corrigez le contenu de la nouvelle table TOUSCLIENTS ; Comment savoir qu'elle peut contenir des anomalies et lesquelles ?

-- Assemblez (int�grer, fusionner) dans une nouvelle DWBD l'ensemble des tables des diff�rents magasins et tout le n�cessaire
-- Le r�sultat est : TOUSCLIENTS, TOUSARTICLES, TOUSCOMMANDES, TOUSDETAILSCOM, TOUSMAGASINS, etc...

*/



--=====================================================================================================================
--=====================================================================================================================
-- NOUVELLES DONNEES == NOUVELLES DONNEES  == NOUVELLES DONNEES
--=====================================================================================================================
--=====================================================================================================================

/*
-- Les clients du magasin FR02 c est celui de Paris en France

CREATE TABLE CLIENTS (Col1 VARCHAR(50), Col2 VARCHAR(50), Col3 VARCHAR(50), Col4 VARCHAR(50), Col5 VARCHAR(50), Col6 VARCHAR(50), Col7 VARCHAR(50), Col8 VARCHAR(50), Col9 VARCHAR(50), Col10 VARCHAR(50), Col11 VARCHAR(20));
INSERT INTO CLIENTS VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENCE', '3', '8, BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', 'FRANCE', 'clemence.rahma@up13.fr', '+33617586565');
INSERT INTO CLIENTS VALUES ('2996100', 'Monsieur', 'CLEMENCE', 'ALEXANDRE', '1', '5, RUE DE BELLEVILLE', '75019', 'PARIS', 'FRANCE', 'alexandre.clemence@up13.fr', '+33617586566');
INSERT INTO CLIENTS VALUES ('2997007', 'Monsieur', 'TRAIFOR', 'ADAM', '2', '13, AVENUE J. B. CLEMENT', '93430', 'VILLETANEUSE', 'FRANCE', 'adam.traifor@up13.fr', '+33617586567');
INSERT INTO CLIENTS VALUES ('2997777', 'Mademoiselle', 'LE BON', 'CLEMENTINE', '1', '18, BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', '', 'clementine.le bon@up13.fr', '+33617586568');
INSERT INTO CLIENTS VALUES ('2998500', 'Monsieur', 'CHEVALIER', 'INES', '1', '13, RUE DE LA PAIX', '93800', 'EPINAY SUR SEINE', 'FRANCE', 'ines.chevalier@up13.fr', '0717586560');
INSERT INTO CLIENTS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1', '186, AVENUE D ITALIE', '75013', 'PARIS', 'FRANCE', 'adam.le bon@up13.fr', '0717586561');
INSERT INTO CLIENTS VALUES ('2998505', 'Mademoiselle', 'TRAIFOR', 'ALICE', '2', '6, RUE DE LA ROSIERE', '75015', 'PARIS', '', 'alice.traifor@up13.fr', '0717586562');
INSERT INTO CLIENTS VALUES ('3000106', 'Monsieur', 'HARISSA', 'FORD', '1', '16, AVENUE FOCH', '75016', 'PARIS', 'FRANCE', 'ford.harissa@up13.fr', '0606');
INSERT INTO CLIENTS VALUES ('3000107', 'MO�NSIEUR', 'ONRI', 'PANDA', '2', '77, RUE DE LA LIBERTE', '13001', 'MARSEILLE', 'FRANCE', 'panda.onri@up13.fr', '+33');
INSERT INTO CLIENTS VALUES ('3000108', 'Madame', 'EDITE', 'FIAT', '1', '21, AVENUE D ITALIE', '75013', 'PARIS', '', 'fiat.edite@up13.fr', '');
INSERT INTO CLIENTS VALUES ('3000109', 'Madame', 'TOYOTA', 'JACKSON', '3', '55, RUE DU JAPON', '94310', 'ORLY VILLE', 'FRANCE', 'jackson.toyota@up13.fr', '');
INSERT INTO CLIENTS VALUES ('3000110', 'MADAME', 'ONRI', 'HONDA', '2', '77, RUE DE LA LIBERTE', '13001', 'MARSEILLE', 'FRANC', 'honda.onri@up13.fr', '');
INSERT INTO CLIENTS VALUES ('3000111', 'Madame', 'GENEREUX', 'EVE', '1', '18, BOULEVARD KELLERMAN', '75013', 'PARYS', 'FR', 'eve.genereux@up13.fr', '');
INSERT INTO CLIENTS VALUES ('299PPPP', 'Mlle', 'BON', 'CLEMENTINE', '1', '18, BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', 'FRANCE', 'clementine.bon@up13.fr', '+21624801801');
INSERT INTO CLIENTS VALUES ('3001', 'M.', 'LE BON', 'Adam', '1', '186, AVENUE D ITALIE', '75013', 'Paris', '', 'adam.le bon@up13.fr', '');
INSERT INTO CLIENTS VALUES ('3001777', 'Mr', 'LE BON', 'Adem', '1', '186, AVENUE D ITALIE', '75013', 'PARIS', 'france', 'adem.le bon@up13.fr', '');
INSERT INTO CLIENTS VALUES ('3001778', 'Mr', 'COURTOIS', 'Bruno', '1', '', '', 'Bruxelles', 'Belgique', 'bruno.courtois@gmail.com', '');
INSERT INTO CLIENTS VALUES ('3001779', 'Monsieur', 'VANDERHOTE', 'Ivan', '1', '', '', 'Bruxelles', 'Belgique', 'ivan.vanderhote@gmail.com', '');
INSERT INTO CLIENTS VALUES ('3001780', 'Monsieur', 'Hollanda', 'Francis', '1', '', '', 'Bruxelles', 'Belgique', 'francis.hollanda@gmail.com', '');
INSERT INTO CLIENTS VALUES ('3001781', 'Monsieur', 'Bernard', 'Hugues', '1', '', '', 'Bruxelles', 'Belgique', 'hugues.bernard@gmail.com', '');
INSERT INTO CLIENTS VALUES ('3001782', 'Monsieur', 'LATIFOU', 'Ilyas', '1', '', '', 'Brusselle', 'Belgic', 'ilyas.latifou@gmail.com', '');
INSERT INTO CLIENTS VALUES ('3001783', 'Madame', 'LALLEMAND', 'Ines', '1', '', '', 'Berlin', 'ALLEMANGNE', 'ines.lallemand@gmail.com', '');
INSERT INTO CLIENTS VALUES ('3001784', 'Monsieur', 'DEUTCH', 'Hans', '1', '', '', 'Berlin', 'ALLEMANGNE', 'hans.deutch@gmail.com', '');
INSERT INTO CLIENTS VALUES ('3001785', 'Madame', 'ALMANI', 'Eve', '1', '', '', 'Berlin', 'ALLEMANGNE', 'eve.almani@gmail.com', '');
INSERT INTO CLIENTS VALUES ('3001786', 'Madame', 'MERQUELLE', 'Angela', '1', '', '', 'Dublin', 'ALEMANGNE', 'angela.merquelle@gmail.com', '');

-- Les articles du magasin FR02 c est celui de Paris en France

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

-- Les commandes du magasin FR02 c est celui de Paris en France

CREATE TABLE COMMANDES (Col1 VARCHAR(50), Col2 VARCHAR(50), Col3 VARCHAR(50));
INSERT INTO COMMANDES VALUES ('20150917BB0001', '2997007', '17/09/2015');
INSERT INTO COMMANDES VALUES ('20150917BB0002', '2998500', '17/09/2015');
INSERT INTO COMMANDES VALUES ('20151016BB0001', '2996100', '16/10/2015');
INSERT INTO COMMANDES VALUES ('20151024BB0001', '2996100', '24/10/2015');
INSERT INTO COMMANDES VALUES ('20120156BB0001', '2996100', '16/01/2012');
INSERT INTO COMMANDES VALUES ('20120157BB0007', '2996100', '17/01/2012');
INSERT INTO COMMANDES VALUES ('20180917BB0007', '3001777', '17/09/2018');

-- Les d�tails des commandes du magasin FR02 c est celui de Paris en France

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
*/

--=====================================================================================================================
--=====================================================================================================================
-- NOUVELLES DONNEES == NOUVELLES DONNEES  == NOUVELLES DONNEES
--=====================================================================================================================
--=====================================================================================================================

/*
-- Les clients du magasin TN02 c est celui de Sousse en Tunisie

CREATE TABLE CLIENTS (Col1 VARCHAR(50), Col2 VARCHAR(50), Col3 VARCHAR(50), Col4 VARCHAR(50), Col5 VARCHAR(50), Col6 VARCHAR(50), Col7 VARCHAR(50), Col8 VARCHAR(50), Col9 VARCHAR(50), Col10 VARCHAR(50), Col11 VARCHAR(20));
INSERT INTO CLIENTS VALUES ('TN0001', 'Madame', 'RAHMA', 'LINA', '3', '', '', 'TUNIS', 'TUNISIE', 'lina.rahma@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0002', 'Madame', 'SFAXI', 'KENZA', '3', '', '', 'SOUSSE', 'TUNISIE', 'kenza.sfaxi@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0003', 'Madame', 'GARROU', 'LINDA', '3', '', '', 'SOUSSE', 'Italie', 'linda.garrou@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0004', 'Madame', 'FARES', 'LEILA', '3', '', '', 'SOUSSE', 'TUNISIE', 'leila.fares@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0005', 'Madame', 'FARES', 'INES', '3', '', '', 'SOUSSE', 'TUNISIE', 'ines.fares@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0006', 'Madame', 'FARES', 'INES', '3', '', '', 'SOUSSE', 'TUNISIE', 'ines.fares@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0007', 'Madame', 'FARES', 'MARIA', '3', '', '', 'SOUSSE', 'TUNISIE', 'maria.fares@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0008', 'Madame', 'FARES', 'INES', '1', '', '', 'SOUSSE', 'TUNISIE', 'ines.fares@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0009', 'Madame', 'DIAB', 'SONIA', '2', '', '', 'SOUSSE', 'TUNISIE', 'sonia.diab@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0010', 'Madame', 'MAGREBI', 'HAYET', '1', '', '', 'SOUSSE', 'TUNISIE', 'hayet.magrebi@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0011', 'Madame', 'SLIMANE', 'AZIZA', '3', '', '', 'SOUSSE', 'TUNISIE', 'aziza.slimane@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0012', 'Madame', 'SLIMANE', 'BEYYA', '2', '', '', 'BIZERTE', 'TUNISIE', 'beyya.slimane@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0013', 'Madame', 'SAHLOUL', 'MERIAM', '1', '', '', 'BIZERTE', 'TUNISIE', 'meriam.sahloul@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0014', 'Monsieur', 'BONBON', 'FAOUZI', '1', '', '', 'BIZERTE', 'TUNISIE', 'faouzi.bonbon@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0015', 'Monsieur', 'ZIZOU', 'ADAM', '1', '', '', 'BIZERTE', 'TUNISIE', 'adam.zizou@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0016', 'Monsieur', 'TOUNSI', 'ADEM', '1', '', '', 'BIZERTE', 'TUNISIE', 'adem.tounsi@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0017', 'Monsieur', 'ZATLA', 'SERGIO', '1', '', '', 'DJERBA', 'France', 'sergio.zatla@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0018', 'Monsieur', 'ZIDANE', 'ALI', '1', '', '', 'HAMMAMET', 'TUNISIE', 'ali.zidane@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0019', 'Monsieur', 'MOHAMED', 'MOHAMED', '1', '', '', 'HAMMAMET', 'TUNISIE', 'mohamed.mohamed@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0020', 'Monsieur', 'LATIFOU', 'ELIAS', '1', '', '', 'HAMMAMET', 'TUNISIE', 'elias.latifou@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0021', 'Monsieur', 'LATIFOU', 'ABDERRAOUF', '1', '', '', 'HAMMAMET', 'TUNISIE', 'abderraouf.latifou@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0022', 'Monsieur', 'SOUSSI', 'KARIM', '1', '', '', 'SOUSSE', 'TUNISIE', 'karim.soussi@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0023', 'Monsieur', 'SOURIR', 'FATHI', '1', '', '', 'SOUSSE', 'TUNISIE', 'fathi.sourir@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0024', 'Monsieur', 'BAJBOUJ', 'BEJI', '1', '', '', 'SOUSSE', 'TUNISIE', 'beji.bajbouj@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('TN0025', 'Monsieur', 'RAIS', 'TAFI', '1', '', '', 'TUNIS', 'TUNISIE', 'tafi.rais@gmail.com', '+21624801801');
INSERT INTO CLIENTS VALUES ('2997007', 'Monsieur', 'TRAIFOR', 'ADAM', '2', '13, AVENUE J. B. CLEMENT', '93430', 'VILLETANEUSE', 'FRANCE', 'adam.traifor@up13.fr', '+33617586567');


-- Les articles du magasin TN02 c est celui de Sousse en Tunisie

CREATE TABLE ARTICLES (Col1 VARCHAR(50), Col2 VARCHAR(50), Col3 VARCHAR(50), Col4 VARCHAR(50), Col5 VARCHAR(50));
INSERT INTO ARTICLES VALUES ('00.37291', 'SIEGE DE TABLE', '95.15 Dt', '10', '79.29 Dt');
INSERT INTO ARTICLES VALUES ('00.37325', 'CASQUE CYCLISTE PROTECTION', '72.00 Dt', '20', '60.00 Dt');
INSERT INTO ARTICLES VALUES ('00.37341', 'BONNET PARE-CHOCS', '20.56 Dt', '100', '17.13 Dt');
INSERT INTO ARTICLES VALUES ('00.37366', 'STORE DE PROTECTION', '15.44 Dt', '5', '12.87 Dt');
INSERT INTO ARTICLES VALUES ('00.37408', 'COINS DE PROTECTION', '06.16 Dt', '100', '05.13 Dt');
INSERT INTO ARTICLES VALUES ('00.37424', 'CACHE PRISE DE COURANT', '02.56 Dt', '500', '02.13 Dt');
INSERT INTO ARTICLES VALUES ('00.37432', 'BLOQUE PORTE', '08.24 Dt', '4', '06.87 Dt');
INSERT INTO ARTICLES VALUES ('00.37457', 'BANDE DE FERMETURE', '06.16 Dt', '4', '05.13 Dt');
INSERT INTO ARTICLES VALUES ('00.37465', 'PROTECTION DE FOUR', '95.15 Dt', '10', '79.29 Dt');
INSERT INTO ARTICLES VALUES ('00.37473', 'PROTECTION DE CUISINIERE', '82.30 Dt', '10', '68.58 Dt');
INSERT INTO ARTICLES VALUES ('00.37515', 'BABY PHONE', '164.56 Dt', '3', '137.13 Dt');
INSERT INTO ARTICLES VALUES ('00.37630', 'BRETELLE DE SECURITE REMOND', '41.15 Dt', '8', '34.29 Dt');
INSERT INTO ARTICLES VALUES ('00.39321', 'HAUSSE-CHAISE', '91.55 Dt', '1', '76.29 Dt');
INSERT INTO ARTICLES VALUES ('00.39495', 'COUVRE ROBINETTERIE', '15.44 Dt', '12', '12.87 Dt');
INSERT INTO ARTICLES VALUES ('11.36613', 'BARRIERE DE PORTE, EN BOIS', '92.56 Dt', '2', '77.13 Dt');
INSERT INTO ARTICLES VALUES ('11.36639', 'BARRIERE DE PORTE, EN METAL', '102.35 Dt', '3', '85.29 Dt');
INSERT INTO ARTICLES VALUES ('11.36860', 'BARRIERE DE LIT', '56.56 Dt', '10', '47.13 Dt');
INSERT INTO ARTICLES VALUES ('11.37108', 'PORTE-BEBE', '123.44 Dt', '6', '102.87 Dt');
INSERT INTO ARTICLES VALUES ('11.37173', 'SIEGE-AUTO COSMOS', '257.15 Dt', '2', '214.29 Dt');
INSERT INTO ARTICLES VALUES ('11.37280', 'SIEGE-AUTO EUROSEAT', '257.15 Dt', '2', '214.29 Dt');
INSERT INTO ARTICLES VALUES ('WD.001', 'K7 VIDEO - TOY STORY', '33.44 Dt', '10', '27.87 Dt');
INSERT INTO ARTICLES VALUES ('WD.002', 'DVD - TOY STORY 2', '43.70 Dt', '10', '36.42 Dt');
INSERT INTO ARTICLES VALUES ('WD.003', 'K7 VIDEO - WINNIE L OURSON', '33.44 Dt', '5', '27.87 Dt');
INSERT INTO ARTICLES VALUES ('MV.001', 'Jeu Vid�o PS4 SPIDER-MAN', '68.40 Dt', '250', '57.00 Dt');

-- Les commandes du magasin TN02 c est celui de Sousse en Tunisie

CREATE TABLE COMMANDES-MAG7 (Col1 VARCHAR(50), Col2 VARCHAR(50), Col3 VARCHAR(50));
INSERT INTO COMMANDES VALUES ('KTN001', 'TN0001', '17/09/2015');
INSERT INTO COMMANDES VALUES ('KTN002', 'TN0002', '17/09/2015');
INSERT INTO COMMANDES VALUES ('KTN003', 'TN0003', '16/10/2015');
INSERT INTO COMMANDES VALUES ('KTN004', 'TN0004', '24/10/2015');
INSERT INTO COMMANDES VALUES ('KTN005', 'TN0001', '16/01/2012');
INSERT INTO COMMANDES VALUES ('KTN006', 'TN0022', '17/01/2017');
INSERT INTO COMMANDES VALUES ('KTN007', 'TN0022', '17/09/2018');

-- Les d�tails des commandes du magasin TN02 c est celui de Sousse en Tunisie

CREATE TABLE DETAILSCOM-MAG7 (Col1 VARCHAR(50), Col2 VARCHAR(50), Col3 VARCHAR(50), Col4 VARCHAR(50), Col5 VARCHAR(50));
INSERT INTO ARTICLES VALUES ('KTN001', '00.37291', '2', '95.15 Dt', '30.00%');
INSERT INTO ARTICLES VALUES ('KTN001', '00.37341', '4', '20.56 Dt', '30.00%');
INSERT INTO ARTICLES VALUES ('KTN001', '11.36639', '2', '102.35 Dt', '30.00%');
INSERT INTO ARTICLES VALUES ('KTN001', 'WD.001', '1', '33.44 Dt', '30.00%');
INSERT INTO ARTICLES VALUES ('KTN002', '00.37291', '2', '95.15 Dt', '30.00%');
INSERT INTO ARTICLES VALUES ('KTN002', 'WD.001', '1', '33.44 Dt', '30.00%');
INSERT INTO ARTICLES VALUES ('KTN002', 'WD.002', '1', '43.70 Dt', '30.00%');
INSERT INTO ARTICLES VALUES ('KTN002', 'WD.003', '1', '33.44 Dt', '30.00%');
INSERT INTO ARTICLES VALUES ('KTN001', 'WD.001', '1', '33.44 Dt', '30.00%');
INSERT INTO ARTICLES VALUES ('KTN001', 'WD.002', '1', '43.70 Dt', '30.00%');
INSERT INTO ARTICLES VALUES ('KTN001', 'WD.003', '1', '33.44 Dt', '30.00%');
INSERT INTO ARTICLES VALUES ('KTN001', '00.37457', '2', '06.16 Dt', '30.00%');
INSERT INTO ARTICLES VALUES ('KTN001', 'WD.003', '2', '33.44 Dt', '30.00%');
INSERT INTO ARTICLES VALUES ('KTN005', 'WD.001', '5', '33.44 Dt', '30.00%');
INSERT INTO ARTICLES VALUES ('KTN007', 'WD.002', '10', '43.70 Dt', '30.00%');
INSERT INTO ARTICLES VALUES ('KTN007', 'MV.001', '2', '68.40 Dt', '30.00%');

COMMIT;

*/
