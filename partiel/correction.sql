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

