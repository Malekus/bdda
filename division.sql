select REFART from DETAILCOM2
where NUMCOM in (select NUMCOM from commandes2)
group by REFART
having count(*) = (select count(distinct NUMCOM) from commandes2);

create or replace view commandeParisien as
select * from DETAILCOM2
where numcom in (
  select numcom from commandes2 where codcli in (
    select codcli from clients2 where vilcli = 'PARIS'
  )
);

select REFART from DETAILCOM2
where numcom in (select numcom from commandeParisien)
group by REFART
having count(*) = (select count(distinct NUMCOM) from commandeParisien);

DROP VIEW commandeParisien; 
