PROMPT A01
select NOMCLI from CLIENTS2;
PROMPT A02
select DISTINCT(NOMCLI) from CLIENTS2;
PROMPT A03
select DISTINCT(NOMART) from ARTICLES2 where PVART >= PAART * 2;
PROMPT A04
select DISTINCT(NOMART) from ARTICLES2 where PVART in (4,27,35);
PROMPT A05
select DISTINCT(NOMART) from ARTICLES2 where PVART BETWEEN 30 and 50;
PROMPT A06
select * from COMMANDES2 where MOUTH(DATECOM) = 9 and YEAR(DATECOM) = 2015;
PROMPT A07
select * from COMMANDES2 where YEAR(DATECOM) = 2012;
PROMPT A08
select CIVCLI, NOMCLI, PRENCLI, VILCLI from CLIENTS2 where VILCLI = 'Paris';
PROMPT A09
select * from CLIENTS2 where NOMCLI like 'C%';
PROMPT A10
select * from ARTICLES2 where NOMART like 'Barrières de%';
PROMPT A11
select * from ARTICLES2 where REFART like 'WD.%';
PROMPT A12
select * from CLIENTS2 where soundex(VILCLI) in ('pari', 'barizzz');
PROMPT A13
select
  case CATCLI
  when 1 then 'Grossiste'
  when 2 then 'Demi-Gros'
  else 'Détaillant'
  end as categorie
from CLIENTS2;
PROMPT A14
