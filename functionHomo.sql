CREATE OR REPLACE FUNCTION nbOccColonne( maTable IN VARCHAR, maColonne IN VARCHAR, maRecherche IN VARCHAR)
RETURN NUMBER
AS
	res NUMBER;
BEGIN 
	EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || maTable || ' WHERE UPPER(' || maColonne || ')=UPPER(''' || maRecherche || ''')'
	INTO res;
	IF res != 0 THEN
		RETURN 1;
	ELSE
		RETURN 0;
	END IF;
END;
/

CREATE OR REPLACE VIEW DD_COL_NAME AS SELECT TABLE_NAME, COLUMN_NAME FROM user_tab_cols WHERE TABLE_NAME LIKE '%DATA_DICTIONARY_%';

for k in colonne
	score nbOccColonne(table_name_1, column_name_1, k)

score le plus grand colonne = score(k)
correction
