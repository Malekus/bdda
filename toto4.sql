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
	select1 varchar(1000) :='';
BEGIN
	table1:='create or replace view v1(pays) as select upper('||colonne||') from '||tablee||' where '||colonne||' is not null and upper('||colonne||') not in(select upper(french) from DDVS where category=''COUNTRY'') ';
	
	execute immediate table1;

	table2:='create or replace view v2(english,french) as (select upper(english),upper(french) from DDVS where upper(english) in(select pays from v1) and category=''COUNTRY'' )';
	execute immediate table2;
	update1:='update t5 set '||colonne||'=(select french from v2 where english='||colonne||') where '||colonne||' in(select pays from v1) and '||colonne||' in(select upper(english) from ddvs where category=''COUNTRY'')';
	execute immediate update1;
	
	

END;
/


CREATE OR REPLACE PROCEDURE corrpaysddvsen(tablee in varchar,colonne in varchar)
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
	table1:='create or replace view v1(pays) as select upper('||colonne||') from '||tablee||' where '||colonne||' is not null and upper('||colonne||') not in(select upper(english) from DDVS where category=''COUNTRY'') ';
	
	execute immediate table1;

	table2:='create or replace view v2(french,english) as (select upper(french),upper(english) from DDVS where upper(french) in(select pays from v1) and category=''COUNTRY'')';
	execute immediate table2;
	update1:='update t5 set '||colonne||'=(select english from v2 where french='||colonne||') where '||colonne||' in(select pays from v1) and '||colonne||' in(select upper(french) from ddvs where category=''COUNTRY'')';
	execute immediate update1;
	
	table3:='create or replace view v3(pays) as select upper('||colonne||') from '||tablee||' where '||colonne||' is not null and upper('||colonne||') not in(select upper(english) from DDVS where category=''COUNTRY'') ';
	execute immediate table3;
	
END;
/


CREATE OR REPLACE PROCEDURE corrvilleddvsfr(tablee in varchar,colonne in varchar)
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
	table1:='create or replace view v1(ville) as select upper('||colonne||') from '||tablee||' where '||colonne||' is not null and upper('||colonne||') not in(select upper(french) from DDVS where category=''CITY'') ';
	
	execute immediate table1;

	table2:='create or replace view v2(english,french) as (select upper(english),upper(french) from DDVS where upper(english) in(select ville from v1) and category=''CITY'')';
	execute immediate table2;
	update1:='update t5 set '||colonne||'=(select french from v2 where english='||colonne||') where '||colonne||' in(select ville from v1) and '||colonne||' in(select upper(english) from ddvs where category=''CITY'')';
	
	execute immediate update1;

	table3:='create or replace view v4(ville) as select upper('||colonne||') from '||tablee||' where '||colonne||' is not null and upper('||colonne||') not in(select upper(french) from DDVS where category=''CITY'') ';
	execute immediate table3;
	
	
END;
/


CREATE OR REPLACE PROCEDURE corrvilleddvsen(tablee in varchar,colonne in varchar)
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
	table1:='create or replace view v1(ville) as select upper('||colonne||') from '||tablee||' where '||colonne||' is not null and upper('||colonne||') not in(select upper(english) from DDVS where category=''CITY'') ';
	
	execute immediate table1;

	table2:='create or replace view v2(french,english) as (select upper(french),upper(english) from DDVS where upper(french) in(select ville from v1) and category=''CITY'')';
	execute immediate table2;
	update1:='update t5 set '||colonne||'=(select english from v2 where french='||colonne||') where '||colonne||' in(select ville from v1) and '||colonne||' in(select upper(french) from ddvs where category=''CITY'')';
	
	execute immediate update1;


	
END;
/

CREATE OR REPLACE PROCEDURE TESTPAYS(tabledfe in varchar)
IS
	TYPE TYPE_TAB IS TABLE OF VARCHAR2(100);
	
	tabledf varchar(1000):= UPPER(tabledfe);
	looper varchar(1000) := '';
	update1 varchar(1000) := '';
	view1 varchar(1000) := '';
	view2 varchar(1000) := '';
	view3 varchar(1000) := '';
	view4 varchar(1000) := '';
	view5 varchar(1000) := '';
	view6 varchar(1000) := '';
	view7 varchar(1000) := '';
	viewpays varchar(1000) := '';
	viewville varchar(1000) := '';
	count1 varchar(1000) := '';
	count2 varchar(1000) := '';
	count3 varchar(1000) := '';
	count4 varchar(1000) := '';
	count5 varchar(1000) := '';
	count6 varchar(1000) := '';
	count7 varchar(1000) := '';
	counter1 varchar(1000) := '';
	counter2 varchar(1000) := '';
	counter3 varchar(1000) := '';
	counter4 number(10);
	counter5 number(10);
	counter6 number(10);
	counter7 number(10);
	procedure1 varchar(1000) := '';
	testExiste NUMBER;
	insert1 varchar(1000) := '';
	selectfinloop varchar(1000) := '';
	sel varchar(1000) := '';
CURSOR curseur IS
	SELECT column_name FROM user_tab_columns WHERE table_name = tabledf;
BEGIN
		select count(*) into testExiste from user_tables where table_name = UPPER(tabledf || '_pays');
		IF testExiste != 0 THEN
		EXECUTE IMMEDIATE 'DROP TABLE ' || tabledf || '_pays';
		END IF;		
		select count(*) into testExiste from user_tables where table_name = UPPER(tabledf || '_ville');
		IF testExiste != 0 THEN
		EXECUTE IMMEDIATE 'DROP TABLE ' || tabledf || '_ville';
		END IF;	
		viewpays:= 'create table '||tabledf||'_pays (pays varchar(100))';
		execute immediate viewpays;
		viewville:= 'create table '||tabledf||'_ville (ville varchar(100))';
		execute immediate viewville;

	looper:='SELECT column_name FROM user_tab_columns WHERE table_name =''|| tabledf ||'' ';
	EXECUTE IMMEDIATE looper;



	FOR i IN curseur LOOP


		update1:='update '||tabledf||' set '||i.column_name||' = upper('||i.column_name||') ';
		execute immediate update1;
		
	DBMS_OUTPUT.PUT_LINE(upper(i.column_name));
		view1:= 'create or replace view tt(pays) as Select upper('||i.column_name||') from '|| tabledf ;
		execute immediate view1;

		view2:= 'create or replace view tt2(pays) as Select upper('||i.column_name||') from '||tabledf||' where '||i.column_name||' is not null and (upper('||i.column_name||') in(select upper(french) from DDVS where category=''COUNTRY'') or upper('||i.column_name||') in(select upper(english) from DDVS where category=''COUNTRY''))';
		execute immediate view2;
		view3:= 'create or replace view tt3(pays) as Select upper('||i.column_name||') from '||tabledf||' where '||i.column_name||' is not null and (upper('||i.column_name||') in(select upper(french) from DDVS where category=''CITY'') or upper('||i.column_name||') in(select upper(english) from DDVS where category=''CITY''))';
		execute immediate view3;
	
		count1:= 'select count(*) from tt';
		execute immediate count1 into counter1;
		count2:= 'select count(*) from tt2';
		execute immediate count2 into counter2;
		count3:= 'select count(*) from tt3';
		execute immediate count3 into counter3;

		if(counter2*100/counter1>=60) then
	
	DBMS_OUTPUT.PUT_LINE('c''est une colonne pays');
		insert1:= 'insert into ' || tabledf || '_pays values ('''||i.column_name||''')';
		execute immediate insert1;


		view6:= 'create or replace view tt6(pays) as Select upper('||i.column_name||') from '||tabledf||' where '||i.column_name||' is not null and upper('||i.column_name||') in(select upper(french) from DDVS where category=''COUNTRY'') ';
		execute immediate view6;
		view7:= 'create or replace view tt7(pays) as Select upper('||i.column_name||') from '||tabledf||' where '||i.column_name||' is not null and upper('||i.column_name||') in(select upper(english) from DDVS where category=''COUNTRY'') ';
		execute immediate view7;
		
		count6:= 'select count(*) from tt6';
		execute immediate count6 into counter6;
		count7:= 'select count(*) from tt7';
		execute immediate count7 into counter7;

			if(counter6>=counter7) then
		
	DBMS_OUTPUT.PUT_LINE('c''est une colonne pays en francais');
			corrpaysddvsfr(tabledf,i.column_name);
			
			else 
	DBMS_OUTPUT.PUT_LINE('c''est une colonne pays in english');
			corrpaysddvsen(tabledf,i.column_name);
			end if;

		elsif(counter3*100/counter1>=60)then
		
		
		DBMS_OUTPUT.PUT_LINE('c''est une colonne ville');
		insert1:= 'insert into ' || tabledf || '_ville values ('''||i.column_name||''')';
		execute immediate insert1;
		view4:= 'create or replace view tt4(ville) as Select upper('||i.column_name||') from '||tabledf||' where '||i.column_name||' is not null and upper('||i.column_name||') in(select upper(french) from DDVS where category=''CITY'') ';
		execute immediate view4;
		view5:= 'create or replace view tt5(ville) as Select upper('||i.column_name||') from '||tabledf||' where '||i.column_name||' is not null and upper('||i.column_name||') in(select upper(english) from DDVS where category=''CITY'') ';
		execute immediate view5;

		count4:= 'select count(*) from tt4';
		execute immediate count4 into counter4;
		count5:= 'select count(*) from tt5';
		execute immediate count5 into counter5;

			if(counter5<=counter4) then
			
			DBMS_OUTPUT.PUT_LINE('c''est une colonne ville en francais');

			corrvilleddvsfr(tabledf,i.column_name);
			else 
			DBMS_OUTPUT.PUT_LINE('c''est une colonne ville in english');
			corrvilleddvsen(tabledf,i.column_name);
			end if;
		end if;

	END LOOP;
	selectfinloop:= 'select count(*) from '||tabledf||'_ville ';
	execute immediate selectfinloop into sel;
	DBMS_OUTPUT.PUT_LINE(sel);

END;
/
/*
select pays_err, pays_corr from correction;

for ligne in (select pays_err from correction) LOOP
	UPDATE t5 set pays = (select pays_corr from correction where pays_err = ligne)
	where pays_err =

END LOOP

create or replace view tt10(ville) as Select upper(ville) from t5 where ville is not null and upper(ville) in(select upper(english) from DDVS where category='CITY');

*/



