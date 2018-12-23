CREATE OR REPLACE PROCEDURE CorretionColDate(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  -- Correction date format car probleme d'encodage
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = REGEXP_REPLACE(' || UPPER(maColonne) || ', ''fevrier'', ''février'')';
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = REGEXP_REPLACE(' || UPPER(maColonne) || ', ''aout'', ''août'')';
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = REGEXP_REPLACE(' || UPPER(maColonne) || ', ''decembre'', ''décembre'')';
  -- Correction apportee
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = TO_CHAR(TO_DATE(' || UPPER(maColonne) || ', ''DD MONTH YY''), ''DD-MM-YYYY'') WHERE ' || UPPER(maColonne) || ' Like ''% %''';
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = TO_CHAR(TO_DATE(' || UPPER(maColonne) || ', ''YYYY MONTH DD''), ''DD-MM-YYYY'') WHERE REGEXP_LIKE(datnaiss, ''^([0-9]{4})([ \-])?(janvier|février|mars|avril|mai|juin|juillet|août|septembre|octobre|novembre|décembre)([ \-])?([0-9]{2})$'')';
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = TO_CHAR(TO_DATE(' || UPPER(maColonne) || ', ''DD MM YY''), ''DD-MM-YYYY'') WHERE ' || UPPER(maColonne) || ' LIKE ''%/%''';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee');
END;
/

CREATE OR REPLACE PROCEDURE CorretionColSexe(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  -- Correction date format car probleme d'encodage
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = corrsexe(' || UPPER(maColonne) || ')';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee');
END;
/

CREATE OR REPLACE PROCEDURE CorretionColGrpSng(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  -- Correction date format car probleme d'encodage
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = corrgs(' || UPPER(maColonne) || ')';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee');
END;
/

CREATE OR REPLACE PROCEDURE CorretionColTaille(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = corrtaille(' || UPPER(maColonne) || ')';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee');
END;
/

CREATE OR REPLACE PROCEDURE CorretionColPoids(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = corrpoids(' || UPPER(maColonne) || ')';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee');
END;
/

CREATE OR REPLACE PROCEDURE CorretionColMail(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = corrmail(' || UPPER(maColonne) || ')';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee');
END;
/


-- Coorection avec le dictionnaire

CREATE OR REPLACE FUNCTION corrCountryDD(pays IN VARCHAR)
RETURN VARCHAR
AS
  res VARCHAR(20) := '';
BEGIN
  IF pays IS NULL THEN
    RETURN '';
  END IF;
  EXECUTE IMMEDIATE 'SELECT COUNTRY FROM (SELECT ENGLISH AS COUNTRY, UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(ENGLISH), UPPER(''' || pays || ''')) AS SIMI FROM DDVS WHERE CATEGORY = ''COUNTRY'') 
  GROUP BY COUNTRY, SIMI HAVING SIMI = (SELECT MAX(UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(ENGLISH), UPPER(''' || pays || '''))) FROM DDVS WHERE CATEGORY = ''COUNTRY'')'
  INTO res;
  RETURN res;
END;
/

CREATE OR REPLACE PROCEDURE CorretionColPaysDD(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = corrCountryDD(' || UPPER(maColonne) || ')';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee par data dictionary');
END;
/