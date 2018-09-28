select count(*) as nb_client from clients2;
select count( distinct PAYSCLI) as nb_pays from clients2;
select catcli as categorie , count(*) as nb_client from clients2 group by catcli;
select catcli as categorie , count(*) as nb_client from clients2 group by catcli;
select catcli as categorie , count(*) as nb_client, vilcli as ville  from clients2 group by catcli, vilcli;
select count(*) as nb_client, vilcli as ville, catcli as categorie  from clients2 group by vilcli, catcli;
