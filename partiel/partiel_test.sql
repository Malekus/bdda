--CREATE TABLE DDCAT( TYPE VARCHAR2(100), FCT varchar2(100));
--INSERT INTO DDCAT VALUES ('SEXE','CORRSEXE');
/*CREATE OR REPLACE FUNCTION corrdate(datee in VARCHAR)
return VARCHAR
as
requete VARCHAR(255);
requete_stock VARCHAR(255);
requete_stock2 VARCHAR(255);
requete_stock3 VARCHAR(255);
envoie VARCHAR(255);
BEGIN
requete:='select REGEXPR from DDRE where CATEGORY=''DATE'' and SUBCATEGORY=''DATEDDMMYYYY'' ';
execute immediate requete into requete_stock;
requete:='select REGEXPR from DDRE where CATEGORY=''DATE'' and SUBCATEGORY=''DATEMMDDYYYY'' ';
execute immediate requete into requete_stock2;
requete:='select REGEXPR from DDRE where CATEGORY=''DATE'' and SUBCATEGORY=''DATEYYYYMMDD'' ';
execute immediate requete into requete_stock3;
IF(REGEXP_LIKE(lower(datee),requete_stock)) THEN
envoie:=datee;
return envoie;
ELSIF(REGEXP_LIKE(lower(datee),requete_stock2)) then
envoie:='';
return envoie;
elsif(REGEXP_LIKE(lower(datee),requete_stock3)) then
envoie:=''||regexp_replace(datee ,'[a-zA-Z]+')/1000||'m';
return envoie;
else
return '';
END IF;
END;
/
*/
CREATE OR REPLACE FUNCTION corrgs(
    blood IN VARCHAR)
  RETURN VARCHAR
AS
  requete       VARCHAR(255);
  requete_stock VARCHAR(255);
  envoie        VARCHAR(255);
BEGIN
  requete:='select REGEXPR from DDRE where CATEGORY=''BLOOD'' ';
  EXECUTE immediate requete INTO requete_stock;
  IF(REGEXP_LIKE(blood,requete_stock)) THEN
    envoie:=upper(blood);
    RETURN envoie;
  ELSE
    RETURN '';
  END IF;
END;
/
CREATE OR REPLACE FUNCTION corrpoids(
  poids IN VARCHAR)
RETURN VARCHAR
AS
  requete        VARCHAR(255);
  requete_stock  VARCHAR(255);
  requete_stock2 VARCHAR(255);
  requete_stock3 VARCHAR(255);
  envoie         VARCHAR(255);
BEGIN
  requete:='select REGEXPR from DDRE where CATEGORY=''WEIGHT'' and SUBCATEGORY=''WEIGHT-KG'' ';
  EXECUTE immediate requete INTO requete_stock;
  requete:='select REGEXPR from DDRE where CATEGORY=''WEIGHT'' and SUBCATEGORY=''WEIGHT-TONNE'' ';
  EXECUTE immediate requete INTO requete_stock2;
  requete:='select REGEXPR from DDRE where CATEGORY=''WEIGHT'' and SUBCATEGORY=''WEIGHT-G'' ';
  EXECUTE immediate requete INTO requete_stock3;
  IF(REGEXP_LIKE(poids,requete_stock)) THEN
    envoie:=lower(poids);
    RETURN envoie;
  ELSIF(REGEXP_LIKE(poids,requete_stock2)) THEN
    envoie:=''||regexp_replace(poids ,'[a-zA-Z]+')*1000||'kg';
    RETURN envoie;
  elsif(REGEXP_LIKE(poids,requete_stock3)) THEN
    envoie:=''||regexp_replace(poids ,'[a-zA-Z]+')/1000||'kg';
    RETURN envoie;
  ELSE
    RETURN '';
  END IF;
END;
/
CREATE OR REPLACE FUNCTION corrmail(
  mail IN VARCHAR)
RETURN VARCHAR
AS
  requete        VARCHAR(255);
  requete_stock  VARCHAR(255);
  requete_stock2 VARCHAR(255);
  requete_stock3 VARCHAR(255);
  envoie         VARCHAR(255);
BEGIN
  requete:='select REGEXPR from DDRE where CATEGORY=''EMAIL'' ';
  EXECUTE immediate requete INTO requete_stock;
  IF(REGEXP_LIKE(mail,requete_stock)) THEN
    envoie:=lower(mail);
    RETURN envoie;
  ELSE
    RETURN '';
  END IF;
END;
/
CREATE OR REPLACE FUNCTION corrphone(
  phone IN VARCHAR,
  pay   IN VARCHAR)
RETURN VARCHAR
AS
  pays           VARCHAR(255):=upper(pay);
  requete        VARCHAR(255);
  requete_stock  VARCHAR(255);
  requete_stock2 VARCHAR(255);
  requete_stock3 VARCHAR(255);
  envoie         VARCHAR(255);
BEGIN
  requete:='select REGEXPR from DDRE where CATEGORY=''PHONE'' and SUBCATEGORY=''PHONE-FR'' ';
  EXECUTE immediate requete INTO requete_stock;
  requete:='select REGEXPR from DDRE where CATEGORY=''PHONE'' and SUBCATEGORY=''PHONE-ES'' ';
  EXECUTE immediate requete INTO requete_stock2;
  requete:='select REGEXPR from DDRE where CATEGORY=''PHONE'' and SUBCATEGORY=''PHONE-BASE'' ';
  EXECUTE immediate requete INTO requete_stock3;
  IF(REGEXP_LIKE(phone,requete_stock)) THEN
    envoie:=regexp_replace(phone ,'(\(\+33)\)+') ;
    envoie:=regexp_replace(envoie ,'(\+33)+') ;
    envoie:=regexp_replace(envoie ,' +') ;
    SELECT LENGTH(envoie) INTO requete FROM dual;
    IF(requete =10) THEN
      IF(pays  ='COUNTRYEUR001') THEN
        envoie:='+33'||envoie;
        RETURN envoie;
      elsif(pays='COUNTRYEUR007') THEN
        envoie :='+34'||envoie;
        RETURN envoie;
      END IF;
    ELSE
      IF(pays  ='COUNTRYEUR001') THEN
        envoie:='+330'||envoie;
        RETURN envoie;
      elsif(pays='COUNTRYEUR007') THEN
        envoie :='+340'||envoie;
        RETURN envoie;
      END IF;
    END IF;
  ELSIF(REGEXP_LIKE(phone,requete_stock2)) THEN
    envoie:=regexp_replace(phone ,'(\(\+34)\)+') ;
    envoie:=regexp_replace(envoie ,'(\+34)+') ;
    envoie:=regexp_replace(envoie ,' +') ;
    SELECT LENGTH(envoie) INTO requete FROM dual;
    IF(requete =10) THEN
      IF(pays  ='COUNTRYEUR001') THEN
        envoie:='+33'||envoie;
        RETURN envoie;
      elsif(pays='COUNTRYEUR007') THEN
        envoie :='+34'||envoie;
        RETURN envoie;
      END IF;
    ELSE
      IF(pays  ='COUNTRYEUR001') THEN
        envoie:='+330'||envoie;
        RETURN envoie;
      elsif(pays='COUNTRYEUR007') THEN
        envoie :='+340'||envoie;
        RETURN envoie;
      END IF;
    END IF;
  ELSIF(REGEXP_LIKE(phone,requete_stock3)) THEN
    envoie:=regexp_replace(phone ,' +') ;
    SELECT LENGTH(envoie) INTO requete FROM dual;
    IF(requete =10) THEN
      IF(pays  ='COUNTRYEUR001') THEN
        envoie:='+33'||envoie;
        RETURN envoie;
      elsif(pays='COUNTRYEUR007') THEN
        envoie :='+34'||envoie;
        RETURN envoie;
      END IF;
    ELSE
      IF(pays  ='COUNTRYEUR001') THEN
        envoie:='+330'||envoie;
        RETURN envoie;
      elsif(pays='COUNTRYEUR007') THEN
        envoie :='+340'||envoie;
        RETURN envoie;
      END IF;
    END IF;
  ELSE
    RETURN '';
  END IF;
END;
/
CREATE OR REPLACE FUNCTION corrsexe(
  sexe IN VARCHAR)
RETURN VARCHAR
AS
  requete        VARCHAR(255);
  requete_stock  VARCHAR(255);
  requete_stock2 VARCHAR(255);
BEGIN
  requete:='select REGEXPR from DDRE where CATEGORY=''PEOPLE'' and SUBCATEGORY=''MEN'' ';
  EXECUTE immediate requete INTO requete_stock;
  requete:='select REGEXPR from DDRE where CATEGORY=''PEOPLE'' and SUBCATEGORY=''WOMEN'' ';
  EXECUTE immediate requete INTO requete_stock2;
  IF(REGEXP_LIKE(upper(sexe),requete_stock)) THEN
    RETURN 'M';
  ELSIF(REGEXP_LIKE(upper(sexe),requete_stock2)) THEN
    RETURN 'F';
  ELSE
    RETURN '';
  END IF;
END;
/
CREATE OR REPLACE FUNCTION corrtaille(
  taille IN VARCHAR)
RETURN VARCHAR
AS
  requete        VARCHAR(255);
  requete_stock  VARCHAR(255);
  requete_stock2 VARCHAR(255);
  requete_stock3 VARCHAR(255);
  envoie         VARCHAR(255);
BEGIN
  requete:='select REGEXPR from DDRE where CATEGORY=''SIZE'' and SUBCATEGORY=''SIZE-M'' ';
  EXECUTE immediate requete INTO requete_stock;
  requete:='select REGEXPR from DDRE where CATEGORY=''SIZE'' and SUBCATEGORY=''SIZE-CM'' ';
  EXECUTE immediate requete INTO requete_stock2;
  requete:='select REGEXPR from DDRE where CATEGORY=''SIZE'' and SUBCATEGORY=''SIZE-MM'' ';
  EXECUTE immediate requete INTO requete_stock3;
  DBMS_OUTPUT.PUT_LINE(regexp_replace(taille ,'[a-zA-Z]+'));
  IF(REGEXP_LIKE(lower(taille),requete_stock)) THEN
    envoie:=''||taille||'m';
    RETURN envoie;
  ELSIF(REGEXP_LIKE(lower(taille),requete_stock2)) THEN
    envoie:=''||regexp_replace(taille ,'[a-zA-Z]+')/100||'m';
    RETURN envoie;
  elsif(REGEXP_LIKE(lower(taille),requete_stock3)) THEN
    envoie:=''||regexp_replace(taille ,'[a-zA-Z]+')/1000||'m';
    RETURN envoie;
  ELSE
    RETURN '';
  END IF;
END;
/

Select tO_CHAR(sysdate, 'DD MONTH YYYY')
FROM datasource;




UPDATE DATASOURCE SET datnaiss = REGEXP_REPLACE(datnaiss, 'fevrier', 'février');
UPDATE DATASOURCE SET datnaiss = REGEXP_REPLACE(datnaiss, 'decembre', 'décembre');
UPDATE DATASOURCE SET datnaiss = REGEXP_REPLACE(datnaiss, 'aout', 'août');

select TO_CHAR(TO_DATE(datnaiss, 'YYYY MONTH DD'), 'DD-MM-YYYY') from DATASOURCE where regexp_like(datnaiss, '^([0-9]{4})([ \-])?(janvier|février|mars|avril|mai|juin|juillet|août|septembre|octobre|novembre|décembre)([ \-])?([0-9]{2})$');

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

-- Test 
exec CorretionColDate('Datasource', 'datnaiss');