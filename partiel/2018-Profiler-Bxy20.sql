--====  FB ===========================================================================
--====  FB ===========================================================================
-- Université Sorbonne Paris Cité - Promotion 2018-2019 - Décembre 2018
--====  FB ===========================================================================

-- Binôme Bxy :  NOM1 Prénom1            *** NOM2 Prénom2

-- Master 2 Informatique, Professionnel, Exploration Informatique des Données et Décisionnel
-- Examen de Bases de Données Avancées
--====  FB ===========================================================================

-- Nouveau nom du Fichier SQL : 2018-Profiler-Bxy.sql

--====  FB ===========================================================================
--====  FB ===========================================================================


/*
M. F. Boufarès ; 
Université Sorbonne Paris Cité
Université Paris 13 ; Master 2 EID2
Jeudi 13 décembre 2018

Vous êtes le TOUBIB-TABIB des données : Un Data-Logue 
(Comme par exemple les Cardio-logues, les Pneumo-logues, les Uro-logues,...) !

Vous disposez des outils qui vous permettent de DIAGNOSTIQUER les anomalies de votre patient la source de données DataSource !

Est-ce une mission possible ?! SiSi C PO CIBLE !!!
VOTRE MISSION SI VOUS L'ACCEPTEZ EST DE DONNER UN SENS AUX DONNEES !
SI VOUS ECHOUEZ, NOUS NIERONS AVOIR EU CONNAISSANCE DE VOS AGISSEMENTS !

Faites le diagnostic automatiquement qui vous permet :
- de détecter les erreurs (les anomalies), et ensuite,
- de corriger les anomalies

Vous êtes entrain de développer un outil de qualité très intelligent : --->>>>>> SmartDATA
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

DROP TABLE DATASOURCE;
CREATE TABLE DATASOURCE ( NOM VARCHAR2(20), PRENOM VARCHAR2(20), DATNAISS VARCHAR2(20), VILNAIS VARCHAR2(20), PAYSNAIS VARCHAR2(20), SEXE VARCHAR2(20), GS VARCHAR2(5),TAILLE VARCHAR2(20),POIDS VARCHAR2(20), TELMOBILE VARCHAR2(20), EMAIL VARCHAR2(40) );

INSERT INTO DATASOURCE VALUES ('LAMEME', 'Lina', '22/02/2002', 'Lille', 'France', 'F', 'AB+', '155cm', '69Kg', '+33 7 77 77 77 77', 'lina.lameme@gmail.com');
INSERT INTO DATASOURCE VALUES ('CLEMENT', 'Adam', '10/06/1996', 'Paris', 'France', 'M', 'B+', '172cm', '71', '+33617716698', 'adam.clement@gmail.com');
INSERT INTO DATASOURCE VALUES ('LABELLE', 'Eve', '17/06/1990', 'Paris', 'Fr', 'F', 'B', '169cm', '', '669964916', 'eve.la belle@gmail.com');
INSERT INTO DATASOURCE VALUES ('CLEMENT', 'Clémence', '01/10/1920', 'Marseille', 'France', 'F', 'A+', '1,68m', '68kg', '684071896', 'clémence.clement@gmail.com');
INSERT INTO DATASOURCE VALUES ('TRAIFOR', 'Adam', '19/06/2001', 'Lyon', 'France', 'M', 'B+', '1700mm', '71kg', '(+33) 06 30 50 19 16', 'adam.traifor@gmail.com');
INSERT INTO DATASOURCE VALUES ('EVE', 'Evelyne', '22 novembre 1969', '-', '', 'F', '', '', '', '687844442', 'evelyne!?/eve@gmail.com');
INSERT INTO DATASOURCE VALUES ('NANNOU', 'Inès', '22 novembre 1969', 'Nice', 'France', 'F', 'B+', '1,69m', '70KG', '678466837', 'ines.nan@nou@gmail.com');
INSERT INTO DATASOURCE VALUES ('GRAND', 'Adam', '16 octobre 1996', 'Paris', '', 'M', 'B+', '1920mm', '71KiloG', '646532809', 'adam.grand@gmail.com');
INSERT INTO DATASOURCE VALUES ('LAMEME', 'Lina', '22 février 2002', 'Lille', 'France', 'F', 'AB+', '155cm', '69KG', '+33 7 77 77 77 77', 'lina.lameme@gmail.com');
INSERT INTO DATASOURCE VALUES ('LAMEME', 'Lina', '22 février 2002', 'Lille', 'France', 'F', 'AB+', '155cm', '69KG', '+33 7 77 77 77 77', '');
INSERT INTO DATASOURCE VALUES ('LAMEME', 'Lina', '22 février 2002', 'Lille', 'France', 'F', 'AB+', '155cm', '69KG', '', 'lina.lameme@gmail.com');
INSERT INTO DATASOURCE VALUES ('LAMEME', 'L.', '22 février 2002', 'Lille', 'France', 'F', 'AB+', '155cm', '69KG', '', 'lina.lameme@gmail.com');
INSERT INTO DATASOURCE VALUES ('lameme', 'lina', '22 février 2002', 'lille', '', 'f', '', '155cm', '69kg', '+33 7 77 77 77 77', 'lina.lameme@gmail.com');
INSERT INTO DATASOURCE VALUES ('lameme', 'lina', '22 février 2002', 'lille', 'franc', 'f', 'ab+', '155cm', '69kg', '+33 7 77 77 77 77', 'lina.lameme@gmail');
INSERT INTO DATASOURCE VALUES ('CLEMENT', 'Clémence', '11 novembre 2011', 'Barcelone', 'Espagne', 'F', 'A+', '111cm', '13kg', '', 'fcb-clement@yahoo.fr');
INSERT INTO DATASOURCE VALUES ('CLEMENT', 'Clémence', '11 novembre 2011', 'Barcelone', 'Espagne', 'F', 'A+', '1,11m', '13000g', '', 'fcb-clement@yahoo.fr');
INSERT INTO DATASOURCE VALUES ('CLEMENT', 'clemence', '2011-novembre-11', 'Barcelone', 'Espagne', 'F', 'A+', '1,11m', '13000g', '', 'fcb-clement@yahoo.fr');
COMMIT;


--====  1 ===========================================================================

-- Quelques questions pour commencer !

SELECT DISTINCT NOM FROM DATASOURCE;
SELECT DISTINCT UPPER(NOM) FROM DATASOURCE;
SELECT EMAIL FROM DATASOURCE;

-- Homogénéisation !!! Comment !

SELECT TAILLE FROM DATASOURCE;
SELECT AVG(TAILLE) AS MOYTAIL FROM DATASOURCE ;
SELECT MAX(POIDS) AS MAXPDS FROM DATASOURCE ;

--====  2 ===========================================================================

-- Il y aurait des problèmes dans cette source de données !!

REM Que faire ?
REM C EST SMARTDATA QUI VA NOUS RENSEIGNER !

-- Développez le mécanisme qui permet de diagnostiquer (profiler) les problèmes dans la source de données
-- Complétez/Corrigez le script sql 2018ProfilerDonnees.sql --==>>> 2018-12-13-Profiler-Bxy.sql

--====  3 ===========================================================================

-- Dans l'exemble d'application traité en cours-TD-TP "GEStion COMmerciale"
-- Les villes & les pays des clients et des magasins peuvent consituer de nouvelles données 
-- qui permettraient d'enrichir le dicionnaire de données DDVS (Data Dictionnary for Valid Strings) utilisé pour corriger des anomalies
-- Proposez une métthode d'enrichissement de ce dictionnaire et développez le script sql correspondant

--====  4 ===========================================================================

-- Dans l'exemble d'application traité en cours-TD-TP "GEStion COMmerciale"
-- Le schéma, relationnel, de la BD GESCOM 
-- est composé de plusieurs tables et leurs dérivés : CLIENTS, COMMANDES, ARTICLES, DETAILSCOM, MAGASINS...

-- Détaillez la manière de définir un nouveau schéma cible-destination (dit schéma en étoile) extrait depuis toutes les sources
-- Celui-ci permet de faire des croisements-analyses-extractions-exploitations des données tel que celui des ventes par rapport 
-- aux articles, aux magasins, aux clients et à la dimension temps...

-- Comparez le avec le schéma global qui regroupe toutes les tables (l'Union-l'Intégration de toutes les tables de toutes les BD)

--====  5 ===========================================================================

-- N'oubliez pas, si vous le souhaitez, d'envoyer la version définitive (G-Bxy) de tous vos travaux avant le jj-décembre 2018

--====  FB ===========================================================================
--====  FB ===========================================================================


