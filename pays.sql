set lines 130;
set pages 60;

DROP TABLE CLIENTS;
CREATE TABLE CLIENTS (Col1 VARCHAR(50), Col2 VARCHAR(50), Col3 VARCHAR(50), Col4 VARCHAR(50), Col5 VARCHAR(50), Col6 VARCHAR(50), Col7 VARCHAR(50), Col8 VARCHAR(50), Col9 VARCHAR(50), Col10 VARCHAR(50));
INSERT INTO CLIENTS VALUES ('2994570', 'Madame', 'RAHMA', 'CLEMENCE', '3', '8, BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', 'FRANCE', 'clemence.rahma@up13.fr');
INSERT INTO CLIENTS VALUES ('2996100', 'Monsieur', 'CLEMENCE', 'ALEXANDRE', '1', '5, RUE DE BELLEVILLE', '75019', 'PARIS', 'FRANCE', 'alexandre.clemence@up13.fr');
INSERT INTO CLIENTS VALUES ('2997007', 'Monsieur', 'TRAIFOR', 'ADAM', '2', '13, AVENUE J. B. CLEMENT', '93430', 'VILLETANEUSE', 'FRANCE', 'adam.traifor@up13.fr');
INSERT INTO CLIENTS VALUES ('2997777', 'Mademoiselle', 'LE BON', 'CLEMENTINE', '1', '18, BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', '', 'clementine.le bon@up13.fr');
INSERT INTO CLIENTS VALUES ('2998500', 'Monsieur', 'CHEVALIER', 'INES', '1', '13, RUE DE LA PAIX', '93800', 'EPINAY SUR SEINE', 'FRANCE', 'ines.chevalier@up13.fr');
INSERT INTO CLIENTS VALUES ('3001777', 'Monsieur', 'LE BON', 'Adam', '1', '186, AVENUE D ITALIE', '75013', 'PARIS', 'FRANCE', 'adam.le bon@up13.fr');
INSERT INTO CLIENTS VALUES ('2998505', 'Mademoiselle', 'TRAIFOR', 'ALICE', '2', '6, RUE DE LA ROSIERE', '75015', 'PARIS', '', 'alice.traifor@up13.fr');
INSERT INTO CLIENTS VALUES ('3000106', 'Monsieur', 'HARISSA', 'FORD', '1', '16, AVENUE FOCH', '75016', 'PARIS', 'FRANCE', 'ford.harissa@up13.fr');
INSERT INTO CLIENTS VALUES ('3000107', 'MO�NSIEUR', 'ONRI', 'PANDA', '2', '77, RUE DE LA LIBERTE', '13001', 'MARSEILLE', 'FRANCE', 'panda.onri@up13.fr');
INSERT INTO CLIENTS VALUES ('3000108', 'Madame', 'EDITE', 'FIAT', '1', '21, AVENUE D ITALIE', '75013', 'PARIS', '', 'fiat.edite@up13.fr');
INSERT INTO CLIENTS VALUES ('3000109', 'Madame', 'TOYOTA', 'JACKSON', '3', '55, RUE DU JAPON', '94310', 'ORLY VILLE', 'FRANCE', 'jackson.toyota@up13.fr');
INSERT INTO CLIENTS VALUES ('3000110', 'MADAME', 'ONRI', 'HONDA', '2', '77, RUE DE LA LIBERTE', '13001', 'MARSEILLE', 'FRANC', 'honda.onri@up13.fr');
INSERT INTO CLIENTS VALUES ('3000111', 'Madame', 'GENEREUX', 'EVE', '1', '18, BOULEVARD FOCH', '91000', 'EPINAY SUR ORGE', 'FR', 'eve.genereux@up13.fr');
INSERT INTO CLIENTS VALUES ('299PPPP', 'Mlle', 'BON', 'CLEMENTINE', '1', '18, BOULEVARD FOCH', '93800', 'EPINAY-SUR-SEINE', 'FRANCE', 'clementine.bon@up13.fr');
INSERT INTO CLIENTS VALUES ('3001', 'M.', 'LE BON', 'Adam', '1', '186, AVENUE D ITALIE', '75013', 'Paris', '', 'adam.le bon@up13.fr');
INSERT INTO CLIENTS VALUES ('3001777', 'Mr', 'LE BON', 'Adem', '1', '186, AVENUE D ITALIE', '75013', 'PARIS', 'france', 'adem.le bon@up13.fr');

insert into clients(col9) values('Belgique');
insert into clients(col9) values('Belgique');
insert into clients(col9) values('Belgique');
insert into clients(col9) values('Belgie');
insert into clients(col9) values('Algerie');
insert into clients(col9) values('Algerie');
insert into clients(col9) values('Algerie');
insert into clients(col9) values('Algerie');
insert into clients(col9) values('Algerie');
insert into clients(col9) values('Algeri');
insert into clients(col9) values('Alger');
insert into clients(col9) values('ALLEMAGNE');
insert into clients(col9) values('ALLEMAGNE');
insert into clients(col9) values('ALLEMAGNE');
insert into clients(col9) values('ALLEMAGNE');
insert into clients(col9) values('ALLEMAGNE');
insert into clients(col9) values('ALLEMAGNE');
insert into clients(col9) values('ARGENTINE');
update clients set col9 = upper(col9);


  create or replace view test(f,s,d) as
  select first, second, UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second) as distance from (select col1 as first from vilpays group by col1 order by col1),(select col1 as second from vilpays group by col1 order by col1)
  where first != second and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(first, second) < 30;
  -- Vue ville et le nombre d'occurence
  create or replace view villeCount(ville, nombre) as
  select col1, count(*) from vilpays group by col1 order by col1;

  create or replace view v1(v, n) as
  select * from villeCount where upper(ville) like '%BR%';

  select * from v1 where n = (select max(n) from v1);

  select * from VILLECOUNT;

  select * from VILPAYS;

  select substr(col1,0,3) from VILPAYS group by col1 order by col1;
