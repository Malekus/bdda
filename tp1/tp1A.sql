
-- A.1
exp M2EID_20/M2EID_20 parfile=param.dat

-- A.2
SET HEADING ON FEEDBACK ON
SPOOL textes.txt
SELECT * FROM articles;
SELECT * FROM clients;
SELECT * FROM commandes;
SELECT * FROM detailcom;
SPOOL OFF

-- A.2.1
SET HEADING OFF FEEDBACK OFF ECHO OFF PAGESIZE 0
SPOOL spl_ARTICLES.txt
SELECT REFART || ';' || NOMART || ';' || PVART || ';' || QSART || ';' || PAART FROM articles;
SPOOL OFF
SPOOL spl_CLIENTS.txt
SELECT CODCLI || ';' || CIVCLI || ';' || NOMCLI || ';' || PRENCLI || ';' || CATCLI || ';' || ADNCLI || ';' || ADRCLI || ';' || CPCLI || ';' || VILCLI || ';' || PAYSCLI || ';' || MAILCLI|| ';' || TELCLI FROM clients;
SPOOL OFF
SPOOL spl_COMMANDES.txt
SELECT  numcom || ';' || codcli || ';' || datcom FROM commandes;
SPOOL OFF
SPOOL spl_DETAILCOM.txt
SELECT COL1 || ';' || COL2 || ';' || COL3 || ';' || COL4 || ';' || COL5 FROM detailcom;
SPOOL OFF


-- A.2.1

SET HEADING ON
SPOOL splbis_ARTICLES.txt
column REFART HEADING 'REFART'
column NOMART HEADING 'NOMART'
column PVART HEADING 'PVART'
column QSART HEADING 'QSART'
column PAART HEADING 'PAART'
SELECT REFART || ';' || NOMART || ';' || PVART || ';' || QSART || ';' || PAART FROM articles;
SPOOL OFF
SPOOL splbis_CLIENTS.txt
column REFART HEADING 'REFART'
column NOMART HEADING 'NOMART'
column PVART HEADING 'PVART'
column QSART HEADING 'QSART'
column PAART HEADING 'PAART'
SELECT CODCLI || ';' || CIVCLI || ';' || NOMCLI || ';' || PRENCLI || ';' || CATCLI || ';' || ADNCLI || ';' || ADRCLI || ';' || CPCLI || ';' || VILCLI || ';' || PAYSCLI || ';' || MAILCLI|| ';' || TELCLI FROM clients;
SPOOL OFF
SPOOL splbis_COMMANDES.txt
column REFART HEADING 'REFART'
column NOMART HEADING 'NOMART'
column PVART HEADING 'PVART'
column QSART HEADING 'QSART'
column PAART HEADING 'PAART'
SELECT  numcom || ';' || codcli || ';' || datcom FROM commandes;
SPOOL OFF
SPOOL splbis_DETAILCOM.txt
column COL1 HEADING 'COL1'
column COL2 HEADING 'COL2'
column COL3 HEADING 'COL3'
column COL4 HEADING 'COL4'
column COL5 HEADING 'COL5'
SELECT COL1 || ';' || COL2 || ';' || COL3 || ';' || COL4 || ';' || COL5 FROM detailcom;
SPOOL OFF

SET SERVEROUTPUT ON
create or replace directory utl_dir as '/export/home/users/master/master2/m2eid/11510378/Documents/DBA/bdda/tp1';

CREATE OR REPLACE PROCEDURE queryToSpool(maTable IN VARCHAR, maCondition IN VARCHAR DEFAULT NULL)
AS
	fichier  utl_file.file_type;
BEGIN
	CASE UPPER(maTable)
		WHEN 'ARTICLES' THEN
			fichier := utl_file.fopen('utl_dir', 'spl_articles_dir.txt', 'w');
			FOR article in (SELECT * FROM articles) LOOP				
				utl_file.put_line(fichier, article.REFART || ';' || article.NOMART || ';' || article.PVART || ';' || article.QSART || ';' || article.PAART);
			END LOOP;
			utl_file.fclose(fichier);
		WHEN 'CLIENTS' THEN
			fichier := utl_file.fopen('utl_dir', 'spl_clients_dir.txt', 'w');
			FOR client in (SELECT * FROM clients) LOOP
				utl_file.put_line(CODCLI || ';' || CIVCLI || ';' || NOMCLI || ';' || PRENCLI || ';' || CATCLI || ';' || ADNCLI || ';' || ADRCLI || ';' || CPCLI || ';' || VILCLI || ';' || PAYSCLI || ';' || MAILCLI|| ';' || TELCLI);
			END LOOP;
			utl_file.fclose(fichier);
		WHEN 'COMMANDES' THEN
			fichier := utl_file.fopen('utl_dir', 'spl_commandes_dir.txt', 'w');
			FOR commande in (SELECT * FROM commandes) LOOP
				utl_file.put_line(numcom || ';' || codcli || ';' || datcom);
			END LOOP;
			utl_file.fclose(fichier);
		WHEN 'DETAILCOM' THEN
			fichier := utl_file.fopen('utl_dir', 'spl_detailcom_dir.txt', 'w');
			FOR detail in (SELECT * FROM detailcom) LOOP
				utl_file.put_line(COL1 || ';' || COL2 || ';' || COL3 || ';' || COL4 || ';' || COL5);
			END LOOP;
			utl_file.fclose(fichier);
		ELSE
			RETURN;
		
	END CASE;
END;
/

exec queryToSpool('ARTICLES');
