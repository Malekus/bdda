alter table MAGASINS_DW2 add MAILMAG VARCHAR(30);

create or replace procedure CREERMAILMAG
as
BEGIN
    FOR ligne in (select NUMMAG , LOWER('bb'||NUMMAG||'@gmail.com') as email from MAGASINS_DW2 where MAILMAG is null) LOOP
    update MAGASINS_DW2
    set MAILMAG = ligne.email
    where NUMMAG = ligne.NUMMAG;
    END LOOP;
END;
/

exec CREERMAILMAG;

drop table expression;
create table expression(nom varchar2(255), regex varchar2(255), PRIMARY key (nom, regex));
insert into expression values('telephone','^(0|\+33|0033)[1-9][0-9]');
insert into expression values('mail','^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
