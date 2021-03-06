@annexe2.sql
DROP TABLE VENTES_DW2B_FR;
CREATE TABLE VENTES_DW2B_FR AS SELECT * FROM VENTES_DW2B;
SELECT count(*) FROM VENTES_DW2B_FR;
SELECT count(*) FROM VENTES_DW2B_FR WHERE NUMMAG LIKE 'FR%';
DELETE FROM VENTES_DW2B_FR WHERE NUMMAG NOT LIKE 'FR%';
SELECT count(*) FROM VENTES_DW2B_FR;

-- B.2.1
select count(*) as nb, SUBSTR(NUMMAG, 1, 2) as pays from VENTES_DW2B group by SUBSTR(nummag, 1, 2);

-- B.2.3
ALTER TABLE VENTES_DW2B ADD PAYS VARCHAR2(2);

UPDATE VENTES_DW2B SET PAYS = SUBSTR(NUMMAG, 1, 2);

DROP TABLE VENTES_DW2B_COUNTRY;
CREATE TABLE VENTES_DW2B_COUNTRY(
    NUMVENTE INTEGER,
    NUMART INTEGER,
    IDTEMPS INTEGER,
    NUMCLI INTEGER,
    MONTANTVENTE NUMBER(20,4),
    NUMMAG VARCHAR(4),
    PAYS VARCHAR(2)
)
TABLESPACE USERS PARTITION BY LIST (PAYS)(
    PARTITION PT_VENTE_DE VALUES ('DE')
    TABLESPACE USERS,
    PARTITION PT_VENTE_ES VALUES ('ES')
    TABLESPACE USERS,
    PARTITION PT_VENTE_DEF VALUES (DEFAULT)
    TABLESPACE USERS
);

INSERT INTO VENTES_DW2B_COUNTRY VALUES (1, 30, 5, 2, 28.99, 'FR02', 'FR');
INSERT INTO VENTES_DW2B_COUNTRY VALUES (2, 28, 4, 3, 28.99, 'FR04', 'FR');
INSERT INTO VENTES_DW2B_COUNTRY VALUES (3, 26, 6, 1, 22, 'FR06', 'FR');
INSERT INTO VENTES_DW2B_COUNTRY VALUES (4, 24, 7, 8, 21, 'BE02', 'BE');
INSERT INTO VENTES_DW2B_COUNTRY VALUES (5, 22, 5, 9, 24.9, 'TN01', 'TN');
INSERT INTO VENTES_DW2B_COUNTRY VALUES (6, 11, 11, 11, 122, 'TN01', 'TN');
INSERT INTO VENTES_DW2B_COUNTRY VALUES (7, 18, 12, 14, 44, 'IT01', 'IT');
INSERT INTO VENTES_DW2B_COUNTRY VALUES (8, 16, 12, 2, 49, 'TN01', 'TN');
INSERT INTO VENTES_DW2B_COUNTRY VALUES (9, 14, 2, 4, 7.8, 'FR03', 'FR');
INSERT INTO VENTES_DW2B_COUNTRY VALUES (10, 12, 6, 5, 15.55, 'FR02', 'FR');
INSERT INTO VENTES_DW2B_COUNTRY VALUES (11, 10, 8, 12, 30.7, 'BE03', 'BE');
INSERT INTO VENTES_DW2B_COUNTRY VALUES (12, 8, 9, 11, 3, 'TN01', 'TN');
INSERT INTO VENTES_DW2B_COUNTRY VALUES (13, 6, 1, 4, 2, 'FR02', 'FR');
INSERT INTO VENTES_DW2B_COUNTRY VALUES (14, 4, 10, 14, 7.4, 'IT01', 'IT');
INSERT INTO VENTES_DW2B_COUNTRY VALUES (15, 2, 3, 3, 27, 'FR05', 'FR');
    

SELECT count(*) FROM VENTES_DW2B_COUNTRY PARTITION (PT_VENTE_DE);
SELECT count(*) FROM VENTES_DW2B_COUNTRY PARTITION (PT_VENTE_ES);
SELECT count(*) FROM VENTES_DW2B_COUNTRY PARTITION (PT_VENTE_DEF);

ALTER TABLE VENTES_DW2B_COUNTRY DROP PARTITION PT_VENTE_DE;
ALTER TABLE VENTES_DW2B_COUNTRY DROP PARTITION PT_VENTE_ES;
ALTER TABLE VENTES_DW2B_COUNTRY DROP PARTITION PT_VENTE_DEF;

DROP TABLE VENTES_DW2B_COUNTRY;
CREATE TABLE VENTES_DW2B_COUNTRY(
    NUMVENTE INTEGER,
    NUMART INTEGER,
    IDTEMPS INTEGER,
    NUMCLI INTEGER,
    MONTANTVENTE NUMBER(20,4),
    NUMMAG VARCHAR(4),
    PAYS VARCHAR(2)
)
TABLESPACE USERS PARTITION BY LIST (PAYS)(
    PARTITION PT_VENTE_DE VALUES ('DE')
    TABLESPACE USERS,
    PARTITION PT_VENTE_ES VALUES ('ES')
    TABLESPACE USERS,
    PARTITION PT_VENTE_IT VALUES ('IT')
    TABLESPACE USERS,
    PARTITION PT_VENTE_GB VALUES ('GB')
    TABLESPACE USERS,
    PARTITION PT_VENTE_KR VALUES ('KR')
    TABLESPACE USERS,
    PARTITION PT_VENTE_DEF VALUES (DEFAULT)
    TABLESPACE USERS
);

COMMIT;

La partition PT_VENTE_DE : contienne les lignes dont le Pays = ‘DE’
La partition PT_VENTE_ES : contienne les lignes dont le Pays = ‘ES'
La partition PT_VENTE_IT : contienne les lignes dont le Pays = 'IT'
La partition PT_VENTE_GB : contienne les lignes dont le Pays = 'GB'
La partition PT_VENTE_KR : contienne les lignes dont le Pays = 'KR'