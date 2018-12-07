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

CREATE OR REPLACE FUNCTION regValide(regex IN VARCHAR, word IN VARCHAR)
RETURN NUMBER
AS
BEGIN
	IF REGEXP_LIKE(regex, word) THEN
		RETURN 1;
	ELSE
		RETURN 0;
	END IF;
END;
/

CREATE OR REPLACE PROCEDURE regValideCol(maTable IN VARCHAR, maColonne IN VARCHAR, regex IN VARCHAR)
--RETURN NUMBER
AS
	Type curseurType IS REF CURSOR;
    monCurseur curseurType;
    maVariable VARCHAR(200);
    res NUMBER := 0;
BEGIN
	OPEN monCurseur FOR ('SELECT ' || UPPER(maColonne) || ' FROM ' || UPPER(maTable));
        LOOP
            FETCH monCurseur INTO maVariable;
            	DBMS_OUTPUT.PUT_LINE(regValide(maVariable, '^([0-9]+)(.[0-9]{1,2})? (\$)$'));
            EXIT WHEN monCurseur%NOTFOUND;
        END LOOP;
    CLOSE monCurseur;
END;
/


/*



OPEN monCurseur FOR requete;
        LOOP
            FETCH monCurseur INTO v_Article;
            EXECUTE IMMEDIATE 'INSERT INTO articleARecomder values ('''||codeClient1||''','''||codeClient2||''',''' ||v_Article|| ''')';
            EXIT WHEN monCurseur%NOTFOUND;
        END LOOP;
    CLOSE monCurseur;







*/