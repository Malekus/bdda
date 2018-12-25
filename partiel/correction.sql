/******************************************************************
        Gestion des erreurs avec les expressions régulières
******************************************************************/
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


CREATE OR REPLACE PROCEDURE CorretionColPeople(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  -- Correction date format car probleme d'encodage
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = corrsexe(' || UPPER(maColonne) || ')';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee');
END;
/

CREATE OR REPLACE PROCEDURE CorretionColBlood(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  -- Correction date format car probleme d'encodage
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = corrgs(' || UPPER(maColonne) || ')';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee');
END;
/

CREATE OR REPLACE PROCEDURE CorretionColSize(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = corrtaille(' || UPPER(maColonne) || ')';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee');
END;
/

CREATE OR REPLACE PROCEDURE CorretionColWeight(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = corrpoids(' || UPPER(maColonne) || ')';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee');
END;
/

CREATE OR REPLACE PROCEDURE CorretionColTel(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = corrtel(' || UPPER(maColonne) || ')';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee');
END;
/

CREATE OR REPLACE PROCEDURE CorretionColEmail(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = corrmail(' || UPPER(maColonne) || ')';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee');
END;
/


/******************************************************************
        Gestion des erreurs avec le data dictionary
******************************************************************/

/*
        Correction des aéroports
*/

/*
        Correction des groupes sanguins
*/

/*
        Correction des villes
*/
CREATE OR REPLACE FUNCTION corrCityDD(city IN VARCHAR)
RETURN VARCHAR
AS
  res VARCHAR(20) := '';
BEGIN
  IF city IS NULL OR NOT REGEXP_LIKE(UPPER(city), '([a-zA-Z]+)')THEN
    RETURN '';
  END IF;
  EXECUTE IMMEDIATE 'SELECT CITY FROM (SELECT ENGLISH AS CITY, UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(ENGLISH), UPPER(''' || city || ''')) AS SIMI FROM DDVS WHERE CATEGORY = ''CITY'') 
  GROUP BY CITY, SIMI HAVING SIMI = (SELECT MAX(UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(ENGLISH), UPPER(''' || city || '''))) FROM DDVS WHERE CATEGORY = ''CITY'')'
  INTO res;
  RETURN res;
END;
/

CREATE OR REPLACE PROCEDURE CorretionColCityDD(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = corrCityDD(' || UPPER(maColonne) || ')';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee par data dictionary');
END;
/

/*
        Correction des civilités
*/
CREATE OR REPLACE FUNCTION corrCivilityDD(civility IN VARCHAR)
RETURN VARCHAR
AS
  res VARCHAR(20) := '';
BEGIN
  IF civility IS NULL THEN
    RETURN '';
  END IF;
  EXECUTE IMMEDIATE 'SELECT CITY FROM (SELECT ENGLISH AS CITY, UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(ENGLISH), UPPER(''' || city || ''')) AS SIMI FROM DDVS WHERE CATEGORY = ''CITY'') 
  GROUP BY CITY, SIMI HAVING SIMI = (SELECT MAX(UTL_MATCH.JARO_WINKLER_SIMILARITY(UPPER(ENGLISH), UPPER(''' || city || '''))) FROM DDVS WHERE CATEGORY = ''CITY'')'
  INTO res;
  RETURN res;
END;
/

CREATE OR REPLACE PROCEDURE CorretionColCivilityDD(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = corrCivilityDD(' || UPPER(maColonne) || ')';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee par data dictionary');
END;
/
/*
        Correction des continents
*/

/*
        Correction des pays
*/
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

CREATE OR REPLACE PROCEDURE CorretionColCountryDD(maTable IN VARCHAR, maColonne IN VARCHAR)
AS
BEGIN
  EXECUTE IMMEDIATE 'UPDATE ' || UPPER(maTable) || ' SET ' || UPPER(maColonne) || ' = corrCountryDD(' || UPPER(maColonne) || ')';
  DBMS_OUTPUT.PUT_LINE('Colonne ' || UPPER(MACOLONNE) || ' de la table ' || UPPER(maTable) || ' corigee par data dictionary');
END;
/

/*
        Correction des prénoms
*/

/*
        Correction des genres
*/