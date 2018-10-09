alter table MAGASINS_DW2
add MAILMAG VARCHAR(30);

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
