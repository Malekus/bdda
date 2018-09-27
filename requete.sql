set lines 1000;
set pages 1000;



Ttitle 'Liste des mails errones'
SELECT codcli,nomcli,mailcli from clients2 where not regexp_LIKE(mailcli ,'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');

Ttitle 'Liste des mails valides'
SELECT codcli,nomcli,mailcli from clients2 where regexp_LIKE(mailcli ,'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');

Ttitle 'Liste des numeros valides'
select telmag from MAGASINS_DW2 where regexp_LIKE(telmag ,'^(0|\+33|0033)[1-9][0-9]');

CREATE INDEX col9_idx ON clients (col9) indextype is ctxsys.context;
