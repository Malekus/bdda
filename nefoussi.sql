-- Création des tables ============= Magasin FR01 ====== PARIS   =================

ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';

PROMPT Destruction des tables de la bd GESCOMI EN SQL 2
PROMPT =========================================================
PROMPT
DROP TABLE DETAILCOM;
DROP TABLE ARTICLES;
DROP TABLE COMMANDES;
DROP TABLE CLIENTS;
PROMPT
-- Pause Tapez sur Enter...
PROMPT
PROMPT =========================================================
PROMPT Création des tables de la bd GESCOMI EN SQL 2
PROMPT =========================================================
PROMPT
PROMPT =========================================================
PROMPT >> Table : CLIENTS                                            
PROMPT =========================================================
PROMPT
CREATE TABLE CLIENTS
(
   CODCLI        VARCHAR2(10),
   CIVCLI        VARCHAR2(12),
   NOMCLI        VARCHAR2(20),
   PRENCLI        VARCHAR2(20),
   CATCLI        NUMBER(1),
   ADNCLI        VARCHAR2(10),
   ADRCLI        VARCHAR2(50),
   CPCLI        VARCHAR2(10),
   VILCLI        VARCHAR2(20),
   PAYSCLI        VARCHAR2(30),
   MAILCLI        VARCHAR2(30),
   TELCLI        VARCHAR2(20),
   CONSTRAINT PK_CLIENTS            PRIMARY KEY(CODCLI),
   CONSTRAINT CK_CLIENTS_CIVCLI        CHECK(CIVCLI IN ('Mademoiselle', 'Madame', 'Monsieur')),
   CONSTRAINT CK_CLIENTS_CATCLI        CHECK(CATCLI BETWEEN 1 and 7),
   CONSTRAINT NN_CLIENTS_NOMCLI        CHECK(NOMCLI IS NOT NULL),
   CONSTRAINT NN_CLIENTS_PRENCLI        CHECK(PRENCLI IS NOT NULL),
   CONSTRAINT NN_CLIENTS_CATCLI        CHECK(CATCLI IS NOT NULL),
   CONSTRAINT CK_CLIENTS_VILCLI        CHECK(VILCLI = UPPER(VILCLI)),
   CONSTRAINT CK_CLIENTS_PAYSCLI        CHECK(PAYSCLI = UPPER(PAYSCLI))
);
PROMPT
-- Pause Tapez sur Enter...
PROMPT
PROMPT =========================================================
PROMPT >> Table : COMMANDES
PROMPT =========================================================
PROMPT
CREATE TABLE COMMANDES
(
   NUMCOM         VARCHAR2(10),
   CODCLI        VARCHAR2(10),
   DATCOM        DATE,
   CONSTRAINT PK_COMMANDES                PRIMARY KEY(NUMCOM),
   CONSTRAINT NN_COMMANDES_DATCOM            CHECK(DATCOM IS NOT NULL),
   CONSTRAINT FK_COMMANDES_CODCLI_CLIENTS    FOREIGN KEY(CODCLI)    REFERENCES CLIENTS(CODCLI)
);
PROMPT
-- Pause Tapez sur Enter...
PROMPT
PROMPT =========================================================
PROMPT >> Table : ARTICLES
PROMPT =========================================================
PROMPT
CREATE TABLE ARTICLES
(
   REFART         VARCHAR2(10),
   NOMART        VARCHAR2(50),
   PVART        NUMBER(10, 2),
   QSART        NUMBER(3),
   PAART        NUMBER(10, 2),
   CONSTRAINT PK_ARTICLES            PRIMARY KEY(REFART),
   CONSTRAINT NN_ARTICLES_NOMART        CHECK(NOMART IS NOT NULL),
   CONSTRAINT CK_ARTICLES_QSART        CHECK(QSART < 1000)
);
PROMPT
-- Pause Tapez sur Enter...
PROMPT
PROMPT =========================================================
PROMPT >> Table : DETAILCOM
PROMPT =========================================================
PROMPT
CREATE TABLE DETAILCOM
(
   NUMCOM         VARCHAR2(10),
   REFART        VARCHAR2(10),
   QTCOM        NUMBER(3),
   PUART        NUMBER(10, 2),
   REMISE        NUMBER(4, 2),
   CONSTRAINT PK_DETAILCOM                PRIMARY KEY(NUMCOM, REFART),
   CONSTRAINT CK_DETAILCOM_QTCOM            CHECK(QTCOM < 1000),
   CONSTRAINT NN_DETAILCOM_QTCOM            CHECK(QTCOM IS NOT NULL),
   CONSTRAINT NN_DETAILCOM_PUART            CHECK(PUART IS NOT NULL),
   CONSTRAINT NN_DETAILCOM_REMISE            CHECK(REMISE IS NOT NULL),
   CONSTRAINT FK_DETAILCOM_NUMCOM_COM        FOREIGN KEY(NUMCOM)    REFERENCES COMMANDES(NUMCOM),
   CONSTRAINT FK_DETAILCOM_REFART_ARTICLES    FOREIGN KEY(REFART)    REFERENCES ARTICLES(REFART)
);
PROMPT
-- Pause Tapez sur Enter...

PROMPT =========================================================
PROMPT
INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C001', 'Madame', 'CLEM@ENT', 'EVE', 1, '18', 'BOULEVARD FOCH', '91000', 'EPINAY-SUR-ORGE', 'FRANCE','eve.clement@gmail.com', '+33777889911');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C002', 'Madame', 'LESEUL', 'MARIE', 1, '21', 'AVENUE D ITALIE', '75013', 'PARIS', 'FRANCE','marieleseul@yahoo.fr', '0617586565');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C003', 'Madame', 'UNIQUE', 'MARINE', 2, '77', 'RUE DE LA LIBERTE', '13001', 'MARCHEILLE', 'FRANCE','munique@gmail.com', '+33777889922');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C004', 'Madame', 'CLEMENCE', 'EVELYNE', 3, '8 BIS', 'BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', 'FRANCE','clemence evelyne@gmail.com', '+33777889933');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C005', 'Madame', 'FORT', 'JEANNE', 3, '55', 'RUE DU JAPON', '94310', 'ORLY-VILLE', 'FRANCE','jfort\@hotmail.fr', '+33777889944');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C006', 'Mademoiselle', 'LE BON', 'CLEMENCE', 1, '18', 'BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', 'FRANCE','clemence.le bon@cfo.fr', '0033777889955');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C007', 'Mademoiselle', 'TRAIFOR', 'ALICE', 2, '6', 'RUE DE LA ROSIERE', '75015', 'PARIS', 'FRANCE','alice.traifor@yahoo.fr', '+33777889966');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C008', 'Monsieur', 'VIVANT', 'JEAN-BAPTISTE', 1, '13', 'RUE DE LA PAIX', '93800', 'EPINAY-SUR-SEINE', 'FRANCE','jeanbaptiste@', '0607');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C009', 'Monsieur', 'CLEMENCE', 'ALEXANDRE', 1, '5', 'RUE DE BELLEVILLE', '75019', 'PARIS', 'FRANCE','alexandre.clemence@up13.fr', '+33149404071');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C010', 'Monsieur', 'TRAIFOR', 'ALEXANDRE', 1, '16', 'AVENUE FOCH', '75016', 'PARIS', 'FRA','alexandre.traifor@up13.fr', '06070809');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C011', 'Monsieur', 'PREMIER', 'JOS//EPH', 2, '77', 'RUE DE LA LIBERTE', '13001', 'MARSEILLE', 'FRANCE','josef@premier', '+33777889977');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C012', 'Monsieur', 'CLEMENT', 'ADAM', 2, '13', 'AVENUE JEAN BAPTISTE CLEMENT', '9430', 'VILLETANEUSE', 'FRANCE','adam.clement@gmail.com', '+33149404072');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C013', 'Monsieur', 'FORT', 'GABRIEL', 5, '1', 'AVENUE DE CARTAGE', '99000', 'TUNIS', 'TUNISIE','gabriel.fort@yahoo.fr', '+21624801777');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C014', 'Monsieur', 'ADAM', 'DAVID', 5, '1', 'AVENUE DE ROME', '99001', 'ROME', 'ITALIE','david.adamé@gmail com', '');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C015', 'Monsieur', 'Labsent', 'pala', 7, '1', 'rue des absents', '000', 'BAGDAD', 'IRAQ','pala-labsent@paici', '');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C016', 'Monsieur', 'CLEMENCE', 'CLEMENT', 1, '5', 'RUE DE BELLEVILLE', '75019', 'PARIS', 'FRANCE','clement.clemence@yahoo.fr', '+33649404071');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C017', 'Madame', 'CLEMENCE', 'CLEMENCE', 1, '5', 'RUE DE BELLEVILLE', '75019', 'PARIS', 'FRANCE','clemence.clemence@yahoo.fr', '+33649404071');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C018', 'Madame', 'CLEMENCE', 'CLEMENCE', 1, '5', 'RUE DE BELLEVILLE', '75019', 'PARIS', 'FRANCE','clemence.clemence@yahoo.fr', '+33649404077');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C019', 'Monsieur', 'TRAIFOR', 'SAMI', 1, '16', 'AVENUE FOCH', '75016', 'PARIS', 'FRANCE','sami.traifor@gmail.com', '06070899');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C055', 'Madame', 'obsolete', 'kadym', 7, '1', 'rue des anciens', '000', 'CARTHAGE', 'IFRIQIA','inexistant', 'inexistant');

INSERT INTO CLIENTS (CODCLI, CIVCLI, NOMCLI, PRENCLI, CATCLI, ADNCLI, ADRCLI, CPCLI, VILCLI, PAYSCLI, MAILCLI, TELCLI)
VALUES ('C056', 'Madame', 'RAHYM', 'KARYM', 1, '1', 'RUE DES GENTILS', '1000', 'CARTHAGE', 'TUNISIE','karym.rahym@gmail.com', '+21624808444');

PROMPT
-- Pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Insertion dans la Table : COMMANDES
PROMPT =========================================================
PROMPT

ALTER SESSION SET NLS_DATE_FORMAT = 'DAY DD-MONTH-YYYY' ;

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20001AB', 'C012', 'SUNDAY 17-SEPTEMBER-2000');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20002AB', 'C001', 'SUNDAY 17-SEPTEMBER-2000');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20003AB', 'C006', ' MONDAY 16-OCTOBER-2000');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20004AB', 'C006', 'TUESDAY 24-OCTOBER-2000');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20011RB', 'C012', 'MONDAY 22-JANUARY-2001');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20012RB', 'C012', 'TUESDAY 13-MARCH-2001');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20031FB', 'C001', 'FRIDAY 14-FEBRUARY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20051FB', 'C003', 'FRIDAY 07-JANUARY-2005');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20052FB', 'C003', 'Wednesday 12-JANUARY-2005');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20053FB', 'C012', 'THURSDAY 10-MARCH-2005');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20054FB', 'C007', 'MONDAY 14-MARCH-2005');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20055FB', 'C012', 'FRIDAY 11-MARCH-2005');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20056FB', 'C013', 'MONDAY 14-MARCH-2005');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20057FB', 'C014', 'FRIDAY 11-MARCH-2005');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20061FB', 'C010', 'FRIDAY 14-FEBRUARY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20062FB', 'C009', 'FRIDAY 14-FEBRUARY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20065FB', 'C007', 'FRIDAY 14-FEBRUARY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20066FB', 'C002', 'FRIDAY 14-FEBRUARY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20067FB', 'C002', 'FRIDAY 14-FEBRUARY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20068FB', 'C002', 'FRIDAY 14-FEBRUARY-2003');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20069FB', 'C002', 'TUESDAY 30-JANUARY-2007');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20070FB', 'C002', 'TUESDAY 30-JANUARY-2007');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20071FB', 'C013', 'TUESDAY 30-JANUARY-2007');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20072FB', 'C013', 'TUESDAY 30-JANUARY-2007');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20073FB', 'C014', 'TUESDAY 30-JANUARY-2007');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20074FB', 'C014', 'TUESDAY 30-JANUARY-2007');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20184FB', 'C014', 'MONDAY 17-SEPTEMBER-2018');

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('20181AB', 'C012', 'MONDAY 17-SEPTEMBER-2018');


PROMPT
-- Pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Insertion dans la Table : ARTICLES
PROMPT =========================================================
PROMPT
INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.001', 'SIEGE DE TABLE', 35.00, 10, 26.43);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.002', 'CASQUE CYCLISTE PROTECTION', 27.00, 20, 20.00);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.003', 'BONNET PARE-CHOCS', 10.71, 100, 5.71);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.004', 'STORE DE PROTECTION', 7.43, 5, 4.29);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.005', 'COINS DE PROTECTION', 4.00, 100, 1.71);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.006', 'CACHE PRISE DE COURANT', 2.29, 500, 0.71);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.007', 'BLOQUE PORTE', 5.00, 4, 2.29);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.008', 'BANDE DE FERMETURE', 3.29, 4, 1.71);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.009', 'PROTECTION DE FOUR', 37.86, 10, 26.43);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.010', 'PROTECTION DE CUISINIERE', 30.71, 10, 22.86);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.011', 'BABY PHONE', 80.71, 3, 45.71);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.012', 'BRETELLE DE SECURITE', 15.57, 8, 11.43);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.013', 'HAUSSE-CHAISE', 42.71, 1, 25.43);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F1.014', 'COUVRE ROBINETTERIE', 7.86, 12, 4.29);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.001', 'BARRIERE DE PORTE, EN BOIS', 32.71, 2, 25.71);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.002', 'BARRIERE DE PORTE, EN METAL', 49.14, 3, 28.43);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.003', 'BARRIERE DE LIT', 23.71, 10, 15.71);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.004', 'PORTE-BEBE', 44.86, 6, 34.29);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.005', 'SIEGE-AUTO COSMOS', 126.86, 2, 71.43);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('F2.006', 'SIEGE-AUTO EUROSEAT', 121.29, 2, 71.43);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('FB.001', 'DVD-SPIRIT', 24.90, 2, 12.00);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('FB.002', 'DVD-SPIDER MAN', 24.90, 2, 12.00);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('FB.003', 'DVD-SPIDER MAN 2', 24.90, 2, 12.00);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.001', 'K7 VIDEO-TOY STORY', 21.29, 10, 9.29);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.002', 'DVD-TOY STORY 2', 34.29, 10, 12.14);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.003', 'K7 VIDEO-WINNIE L OURSON', 22.86, 5, 9.29);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.004', 'DVD-FRERES DES OURS', 35.00, 3, 13.00);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.005', 'K7 VIDEO-LE ROI LION', 30.00, 1, 13.00);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.006', 'K7 VIDEO-LE ROI LION 2', 30.00, 4, 13.00);

INSERT INTO ARTICLES (REFART, NOMART, PVART, QSART, PAART)
VALUES ('WD.007', 'K7 VIDEO-LE ROI LION 3', 30.00, 3, 13.00);

PROMPT
-- Pause Tapez sur Enter...
PROMPT

PROMPT =========================================================
PROMPT >> Insertion dans la Table : DETAILCOM
PROMPT =========================================================
PROMPT
INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20001AB', 'F1.001', 2, 35.00, 2.50);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20001AB', 'F1.003', 4, 10.71, 3.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20001AB', 'F1.013', 2, 49.14, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20001AB', 'WD.001', 1, 21.29, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20002AB', 'F1.001', 2, 33.00, 3.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20002AB', 'WD.001', 1, 21.29, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20002AB', 'WD.002', 1, 34.29, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20002AB', 'WD.003', 1, 22.86, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20003AB', 'FB.001', 5, 21.00, 4.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20003AB', 'WD.002', 1, 34.29, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20003AB', 'WD.003', 1, 22.86, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20004AB', 'F1.008', 2, 3.29, 3.50);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20004AB', 'WD.001', 1, 21.29, 2.50);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20012RB', 'F1.007', 5, 5.00, 3.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20012RB', 'F1.009', 1, 37.86, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20012RB', 'FB.003', 5, 24.00, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20031FB', 'F1.008', 2, 3.29, 3.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20031FB', 'F2.001', 1, 30.71, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20031FB', 'FB.001', 5, 21.00, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20051FB', 'F1.008', 2, 3.29, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20051FB', 'FB.001', 5, 21.00, 4.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20052FB', 'F1.001', 2, 35.00, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20052FB', 'F1.003', 4, 10.71, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20052FB', 'F1.013', 2, 49.14, 3.50);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20052FB', 'WD.001', 1, 21.29, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20052FB', 'WD.003', 1, 22.86, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20053FB', 'WD.003', 1, 22.86, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20054FB', 'WD.003', 1, 22.86, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20055FB', 'F1.008', 5, 3.29, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20055FB', 'F1.009', 1, 37.86, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20055FB', 'F1.011', 2, 80.71, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20055FB', 'F2.001', 1, 30.71, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20056FB', 'F1.011', 2, 80.71, 0.00);

INSERT INTO DETAILCOM (NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20057FB', 'F2.001', 1, 30.71, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20061FB', 'FB.003', 5, 24.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20062FB', 'FB.003', 5, 24.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20065FB', 'FB.003', 5, 24.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20066FB', 'FB.003', 5, 24.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20067FB', 'FB.001', 22, 24.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20068FB', 'FB.001', 22, 24.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20069FB', 'FB.001', 25, 58.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20070FB', 'FB.001', 50, 24.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20071FB', 'FB.001', 37, 27.90, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20072FB', 'FB.001', 8, 34.00, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20073FB', 'FB.001', 35, 15.50, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20074FB', 'FB.001', 12, 19.99, 0.00);

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('20181AB', 'FB.001', 7, 17.77, 0.00);

--=========================================================================
-- Nouvelles données pour les systèmes de recommandantion
/*
INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('2018001', 'C001', 'MONDAY 17-SEPTEMBER-2018');

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018001', 'FB.001', 2, 17.77, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018001', 'FB.002', 3, 24.90, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018001', 'FB.003', 1, 24.90, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018001', 'FB.004', 1, 7.43, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018001', 'FB.005', 1, 4.00, 0.00);

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('2018002', 'C002', 'MONDAY 17-SEPTEMBER-2018');

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018002', 'FB.001', 1, 17.77, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018002', 'FB.002', 1, 24.90, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018002', 'FB.003', 1, 24.90, 0.00);

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('2018003', 'C003', 'MONDAY 17-SEPTEMBER-2018');

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018003', 'FB.001', 5, 17.77, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018003', 'FB.002', 2, 24.90, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018003', 'FB.003', 1, 24.90, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018003', 'FB.005', 1, 4.00, 0.00);

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('2018004', 'C004', 'MONDAY 17-SEPTEMBER-2018');

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018004', 'FB.002', 3, 24.90, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018004', 'FB.003', 3, 24.90, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018004', 'FB.004', 3, 7.43, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018004', 'FB.005', 4, 4.00, 0.00);

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('2018005', 'C006', 'FRIDAY 21-SEPTEMBER-2018');

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018005', 'FB.006', 1, 2.29, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018005', 'FB.007', 1, 5.00, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018005', 'FB.008', 1, 3.29, 0.00);

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('2018006', 'C007', 'FRIDAY 21-SEPTEMBER-2018');

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018006', 'FB.006', 1, 2.29, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018006', 'FB.007', 1, 5.00, 0.00);

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('2018007', 'C009', 'FRIDAY 21-SEPTEMBER-2018');

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018007', 'FB.001', 5, 17.77, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018007', 'FB.009', 2, 37.86, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018007', 'FB.010', 2, 30.71, 0.00);

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('2018008', 'C010', 'FRIDAY 21-SEPTEMBER-2018');

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018008', 'FB.001', 1, 17.77, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018008', 'FB.009', 2, 37.86, 0.00);

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('2018009', 'C011', 'FRIDAY 21-SEPTEMBER-2018');

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018009', 'FB.001', 2, 17.77, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018009', 'FB.009', 2, 37.86, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018009', 'FB.010', 1, 30.71, 0.00);

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('2018010', 'C013', 'MONDAY 17-SEPTEMBER-2018');

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018010', 'FB.001', 3, 17.77, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018010', 'FB.002', 1, 24.90, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018010', 'FB.006', 4, 2.29, 0.00);

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('2018011', 'C014', 'MONDAY 17-SEPTEMBER-2018');

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018011', 'FB.001', 2, 17.77, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018011', 'FB.002', 1, 24.90, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018011', 'FB.006', 4, 2.29, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018011', 'FB.007', 5, 5.00, 0.00);

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('2018012', 'C016', 'FRIDAY 21-SEPTEMBER-2018');

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018012', 'FB.004', 3, 7.43, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018012', 'FB.006', 1, 2.29, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018012', 'FB.009', 1, 37.86, 0.00);

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('2018013', 'C017', 'FRIDAY 21-SEPTEMBER-2018');

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018013', 'FB.004', 1, 7.43, 0.00);
INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018013', 'FB.009', 1, 37.86, 0.00);

INSERT INTO COMMANDES (NUMCOM, CODCLI, DATCOM)
VALUES ('2018014', 'C019', 'FRIDAY 21-SEPTEMBER-2018');

INSERT INTO DETAILCOM(NUMCOM, REFART, QTCOM, PUART, REMISE)
VALUES ('2018014', 'FB.011', 1, 80.71, 0.00);
*/
--=========================================================================

PROMPT =========================================================
PROMPT Validation des insertions dans la bd EN SQL 2
PROMPT =========================================================

COMMIT;



DROP TABLE VENTES_DW2B ;
PROMPT =====================================================================
PROMPT >> Création de la Table : VENTES_DW2B
PROMPT =====================================================================
CREATE TABLE VENTES_DW2B (
   NUMVENTE INTEGER,
   NUMART INTEGER,
   IDTEMPS INTEGER,
   NUMCLI INTEGER,
   MONTANTVENTE NUMBER(20,4),
   NUMMAG VARCHAR(4),
   CONSTRAINT PK_VENTES_DW2B PRIMARY KEY(NUMVENTE)
);

INSERT INTO VENTES_DW2B (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG) VALUES (1, 30, 5, 2, 28.99, 'FR02');
INSERT INTO VENTES_DW2B (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG) VALUES (2, 28, 4, 3, 28.99, 'FR04');
INSERT INTO VENTES_DW2B (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG) VALUES (3, 26, 6, 1 ,22.00, 'FR06');
INSERT INTO VENTES_DW2B (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG) VALUES (4, 24, 7, 8, 21.00, 'BE02');
INSERT INTO VENTES_DW2B (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG) VALUES (5, 22, 5, 9, 24.90, 'TN01');
INSERT INTO VENTES_DW2B (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG) VALUES (6, 11, 11, 11, 122.00, 'TN01');
INSERT INTO VENTES_DW2B (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG) VALUES (7, 18, 12, 14 ,44.00, 'IT01');
INSERT INTO VENTES_DW2B (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG) VALUES (8, 16, 12, 2, 49.00, 'TN01');
INSERT INTO VENTES_DW2B (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG) VALUES (9, 14, 2, 4, 7.80, 'FR03');
INSERT INTO VENTES_DW2B (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG) VALUES (10, 12, 6, 5, 15.55, 'FR02');
INSERT INTO VENTES_DW2B (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG) VALUES (11, 10, 8 ,12, 30.70, 'BE03');
INSERT INTO VENTES_DW2B (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG) VALUES (12, 8, 9, 11, 3.00,'TN01');
INSERT INTO VENTES_DW2B (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG) VALUES (13, 6, 1, 4, 2.00, 'FR02');
INSERT INTO VENTES_DW2B (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG) VALUES (14, 4, 10, 14 ,7.40, 'IT01');
INSERT INTO VENTES_DW2B (NUMVENTE, NUMART, IDTEMPS, NUMCLI, MONTANTVENTE, NUMMAG) VALUES (15, 2, 3, 3 , 27.00, 'FR05');
COMMIT;

