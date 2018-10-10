spool magasins.csv
set lines 200
set pages 0
SET heading off
set FEEDBACK off
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