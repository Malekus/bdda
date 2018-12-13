CREATE OR REPLACE PROCEDURE corrpaysddvsfr(tablee in varchar,colonne in varchar)
as
	table1 varchar(1000) := '';
	table2 varchar(1000) := '';
	table3 varchar(1000) := '';
	update1 varchar(1000) := '';
	looper varchar(1000) := '';
	distance varchar(1000) := '';
	dist varchar(100) :='';
	update2 varchar(1000) := '';
BEGIN
	table1:='create or replace view v1(pays) as select upper('||colonne||') from '||tablee||' where '||colonne||' is not null and upper('||colonne||') not in(select upper(french) from DDVS where category=''COUNTRY'') ';
	
	execute immediate table1;

	table2:='create or replace view v2(english,french) as (select upper(english),upper(french) from DDVS where upper(english) in(select pays from v1) and category=''COUNTRY'' )';
	execute immediate table2;
	update1:='update t5 set '||colonne||'=(select french from v2 where english='||colonne||') where '||colonne||' in(select pays from v1) and '||colonne||' in(select upper(english) from ddvs where category=''COUNTRY'')';
	execute immediate update1;
	table3:='create or replace view v3(pays) as select upper('||colonne||') from '||tablee||' where '||colonne||' is not null and upper('||colonne||') not in(select upper(french) from DDVS where category=''COUNTRY'') ';
	execute immediate table3;
	for r in (select pays from v3)
	loop
		distance:='select french from ddvs where UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(french),('''||r.pays||'''))>80 and category=''COUNTRY'' ';
		execute immediate distance into dist;
		DBMS_OUTPUT.PUT_LINE(r.pays);
		DBMS_OUTPUT.PUT_LINE(dist);
		update2:='update t5 set '||colonne||'=upper('''||dist||''') where '||colonne||'='''||r.pays||'''  ';
		execute immediate update2;
	end loop;


END;
/
