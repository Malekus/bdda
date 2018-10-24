DROP TABLE TABCLIDS ;
CREATE TABLE TABCLIDS (COL1 VARCHAR(10), COL2 VARCHAR(12), COL3 VARCHAR(10), COL4 VARCHAR(10), COL5 VARCHAR(1));
INSERT INTO TABCLIDS VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENCE', '3');
INSERT INTO TABCLIDS VALUES ('2996100', 'Monsieur', 'CLEMENCE', 'ALEXANDRE', '1');
INSERT INTO TABCLIDS VALUES ('3000107', 'MO�NSIEUR', 'ONRI', 'PANDA', '2');
INSERT INTO TABCLIDS VALUES ('2997777', 'Mademoiselle', 'LE BON', 'CLEMENTINE', '1');
INSERT INTO TABCLIDS VALUES ('299PPPP', 'Mlle', 'BON', 'CLEMENTINE', '1');
INSERT INTO TABCLIDS VALUES ('2997007', 'Monsieur', 'TRAIFOR', 'ADAM', '2');
INSERT INTO TABCLIDS VALUES ('2998500', 'Monsieur', 'CHEVALIER', 'INES', '1');
INSERT INTO TABCLIDS VALUES ('3000106', 'Monsieur', 'HARISSA', 'FORD', '1');
INSERT INTO TABCLIDS VALUES ('3000108', 'Madame', 'EDITE', 'FIAT', '1');
INSERT INTO TABCLIDS VALUES ('3000109', 'Madame', 'TOYOTA', 'JACKSON', '3');
INSERT INTO TABCLIDS VALUES ('3000111', 'Madame', 'GENEREUX', 'EVE', '1');
INSERT INTO TABCLIDS VALUES ('3001778', 'Mr', 'COURTOIS', 'Bruno', '1');
INSERT INTO TABCLIDS VALUES ('3001779', 'Monsieur', 'VANDERHOTE', 'Ivan', '1');
INSERT INTO TABCLIDS VALUES ('3001780', 'Monsieur', 'Hollanda', 'Francis', '1');
INSERT INTO TABCLIDS VALUES ('3001781', 'Monsieur', 'Bernard', 'Hugues', '1');
INSERT INTO TABCLIDS VALUES ('3001782', 'Monsieur', 'LATIFOU', 'Ilyas', '1');
INSERT INTO TABCLIDS VALUES ('3001783', 'Madame', 'LALLEMAND', 'Ines', '1');
INSERT INTO TABCLIDS VALUES ('3001784', 'Monsieur', 'DEUTCH', 'Hans', '1');
INSERT INTO TABCLIDS VALUES ('3001785', 'Madame', 'ALMANI', 'Eve', '1');
INSERT INTO TABCLIDS VALUES ('3001786', 'Madame', 'MERQUELLE', 'Ange', '1');
INSERT INTO TABCLIDS VALUES ('3001', 'M.', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('3001777', 'Mr', 'LE BON', 'Adem', '1');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('2998505', 'Mademoiselle', 'TRAIFOR', 'ALICE', '2');
INSERT INTO TABCLIDS VALUES ('3000110', 'MADAME', 'ONRI', 'HONDA', '2');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('3001777', 'Monsie�r', 'LE BON', 'Adam', '1');
INSERT INTO TABCLIDS VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENCE', '3');
INSERT INTO TABCLIDS VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENCE', '3');
INSERT INTO TABCLIDS VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENSE', '3');
INSERT INTO TABCLIDS VALUES ('2997007', '', 'TRAIFOR', 'ADAM', '2');
INSERT INTO TABCLIDS VALUES ('2997007', '', 'TRAIFOR', 'ADAM', '');
COMMIT;

DROP TABLE REGULAREXPRES;
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

DROP TABLE ColonneNotNull;
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



