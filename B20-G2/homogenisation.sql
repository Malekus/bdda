
DROP TABLE REGULAREXPRES CASCADE CONSTRAINTS;
CREATE TABLE REGULAREXPRES(
    CATEGORY 								VARCHAR2(20),
    REGULAREXPR 							VARCHAR2(200),
    CONSTRAINT PK_REGULAREXPRES				PRIMARY KEY(CATEGORY),
    CONSTRAINT CK_REGULAREXPRES_CATEGORY	CHECK(CATEGORY = UPPER(CATEGORY))
);
INSERT INTO REGULAREXPRES VALUES
('MAIL', '^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
INSERT INTO REGULAREXPRES VALUES
('ALPHABETIQUE', '[[:alpha:]]');
INSERT INTO REGULAREXPRES VALUES
('TELTN', '^(0|\+33)(\d){9}$');
INSERT INTO REGULAREXPRES VALUES
('NUMERIQUE', '^([1-9])(\d)*$');
INSERT INTO REGULAREXPRES VALUES
('TEMPERATURECF', '^(\-?[0-9]+(\,[0-9]+)?)(?F|?C)$');
INSERT INTO REGULAREXPRES VALUES
('NOM', '^([a-zA-Z])([a-zA-Z]+|[a-zA-Z]+[\- ][a-zA-Z]+)$');
INSERT INTO REGULAREXPRES VALUES
('PRENOM', '^([a-zA-Z])([a-zA-Z]+|[a-zA-Z]+[\-][a-zA-Z]+)$');
INSERT INTO REGULAREXPRES VALUES
('SEXE_F', '^([fF])([eE][mM]{2}[eE]|[eE][mM][eE][lL]{2}[eE]|[eE][mM][aA][lL][eE])?$|^([wW])([iI][fF][eE]|[oO][mM][aA][nN])$');
INSERT INTO REGULAREXPRES VALUES
('SEXE_H', '^([mM]{1})(([aA][nN])|([aA][lL][eE]))?$|^([hH])([oO][mM]{2}[eE])?$');
INSERT INTO REGULAREXPRES VALUES
('BLOODGROUP', '^(A|B|O|AB)(\+|\-)$');
INSERT INTO REGULAREXPRES VALUES
('CIVILITEF', '^[mM][aA][dD][aA][mM][eE]$|^[mM][lL]{2}[eE]$|^[mM][aA][dD][eE][mM][oO][iI][eS][eE][lL]{2}[eE]$|^[mM]\.$');
INSERT INTO REGULAREXPRES VALUES
('CIVILITEH', '^[mM][oO][nN][sS][iI][eE][uU][rR]$|^[mM][rR](\.)?$');
INSERT INTO REGULAREXPRES VALUES
('CIVILITE', '^([mM][aA][dD])([aA][mM][eE]|[eE][mM][oO][iI][sS][eE][lL]{2}[eE])$|^[mM][lL]{2}[eE]$|^[mM]\.$|^[mM][oO][nN][sS][iI][eE][uU][rR]$|^[mM][rR](\.)?$');
INSERT INTO REGULAREXPRES VALUES
('ADRNUM', '^(\d)+( bis| Bis| BIS)?$');
INSERT INTO REGULAREXPRES VALUES
('ADRRUE', '^([ ]?[\w][ ]?)+([^ ])$');
INSERT INTO REGULAREXPRES VALUES
('CP', '^(\d){5}$');
INSERT INTO REGULAREXPRES VALUES
('VILLE', '^([a-zA-Z])([a-zA-Z]+|[a-zA-Z\-]+)([^-])$');
INSERT INTO REGULAREXPRES VALUES
('PAYS', '^([a-zA-Z])([a-zA-Z]+|[a-zA-Z\-]+)([^-])$');
INSERT INTO REGULAREXPRES VALUES
('IDTABCLIDS', '^[1-9][0-9]{6}$');
COMMIT;

CREATE OR REPLACE FUNCTION getRegex(categorie VARCHAR)
    return VARCHAR IS
    expression VARCHAR(2000);
BEGIN
  select regularexpr into expression from REGULAREXPRES where category = UPPER(categorie);
  return expression;
END;
/

CREATE OR REPLACE FUNCTION correctionIdTabClids(idClient in VARCHAR)
  return VARCHAR
as
BEGIN
    IF REGEXP_LIKE(idClient, '^[1-9][0-9]{6}$') THEN
        return idClient;
    ELSE
        return '';
    END IF;
END;
/

CREATE OR REPLACE FUNCTION correctionNom(nom in VARCHAR)
  return VARCHAR
as
BEGIN
  return UPPER(nom);
END;
/

CREATE OR REPLACE FUNCTION correctionPrenom(prenom in VARCHAR)
  return VARCHAR
as
BEGIN
  return INITCAP(prenom);
END;
/

CREATE OR REPLACE FUNCTION correctionCivilite(civilite in VARCHAR)
  return VARCHAR
as
BEGIN
  IF REGEXP_LIKE(civilite, '^[mM][oO][nN][sS][iI][eE][uU][rR]$|^[mM][rR](\.)?$') THEN
    return 'Monsieur';
  ELSE
    return 'Madame';
  END IF;
END;
/

CREATE OR REPLACE PROCEDURE correctionIntra(maColonne IN VARCHAR, maTable IN VARCHAR, wordRegex IN VARCHAR)
is
  TYPE curType IS REF CURSOR;
  vCursor curType;
  maVariable VARCHAR(255);
  variableCorrection VARCHAR(255);
  requete VARCHAR(255);
  requeteCorrection VARCHAR(255);
  requeteUpdate VARCHAR(255);
BEGIN
    requete := 'SELECT ' || maColonne || ' FROM ' || maTable;
    OPEN vCursor FOR requete;
    LOOP
      FETCH vCursor INTO maVariable;
        IF REGEXP_LIKE(maVariable, getRegex(wordRegex)) THEN
          requeteCorrection := 'SELECT CORRECTION'|| wordRegex ||'(''' || maVariable || ''') from dual';
          EXECUTE IMMEDIATE requeteCorrection
          INTO variableCorrection;
          requeteUpdate := 'UPDATE ' || maTable || ' SET ' || maColonne || '=''' || variableCorrection || ''' WHERE ' || maColonne || '=''' || maVariable || '''';
          EXECUTE IMMEDIATE requeteUpdate;
        ELSE
            requeteUpdate := 'UPDATE ' || maTable || ' SET ' || maColonne || '= null WHERE ' || maColonne || '=''' || maVariable || '''';
            EXECUTE IMMEDIATE requeteUpdate;
        END IF;
      EXIT WHEN vCursor%NOTFOUND;
    END LOOP;
    CLOSE vCursor;
END;
/

DROP TABLE ColonneNotNull CASCADES CONSTRAINTS;
CREATE TABLE ColonneNotNull(
    NOM VARCHAR(255),
    NBNOTNULL NUMBER(5),
    NBROW NUMBER(5)
);

create or replace function nbColonneNotNull(maColonne in VARCHAR, maTable in VARCHAR)
RETURN NUMBER
AS
    req VARCHAR(2000);
    nbNotNull NUMBER;
    nbRow NUMBER;
BEGIN
    req := 'SELECT COUNT(*) FROM ' || maTable || ' WHERE ' || maColonne || ' IS NOT NULL';
    EXECUTE IMMEDIATE req
    INTO nbNotNull;
    req := 'SELECT COUNT(*) FROM ' || maTable;
    EXECUTE IMMEDIATE req
    INTO nbRow;
    req := 'INSERT INTO ColonneNotNull VALUES(''' || maColonne || ''',''' || nbNotNull || ''',''' || NBROW || ''')';
    EXECUTE IMMEDIATE req;
    RETURN nbNotNull;
END;
/

CREATE OR REPLACE PROCEDURE allCorrectionIntra
as
BEGIN
	select nbColonneNotNull('COL1', 'TABCLIDS') from dual;
	select nbColonneNotNull('COL2', 'TABCLIDS') from dual;
	select nbColonneNotNull('COL3', 'TABCLIDS') from dual;
	select nbColonneNotNull('COL4', 'TABCLIDS') from dual;
	select nbColonneNotNull('COL5', 'TABCLIDS') from dual;

    correctionIntra('COL1', 'TABCLIDS', 'IDTABCLIDS');
    correctionIntra('COL2', 'TABCLIDS', 'CIVILITE');
    correctionIntra('COL3', 'TABCLIDS', 'NOM');
    correctionIntra('COL4', 'TABCLIDS', 'PRENOM');
END;
/

exec allCorrectionIntra();
