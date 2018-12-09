
CREATE OR REPLACE PROCEDURE TESTPAYS(tabledfe in varchar)
IS
	tabledf varchar(1000):= UPPER(tabledfe);
	looper varchar(1000) := '';

	view1 varchar(1000) := '';
	view2 varchar(1000) := '';
	view3 varchar(1000) := '';
	count1 varchar(1000) := '';
	count2 varchar(1000) := '';
	count3 varchar(1000) := '';
	counter1 varchar(1000) := '';
	counter2 varchar(1000) := '';
	counter3 varchar(1000) := '';
CURSOR curseur IS
	SELECT column_name FROM user_tab_columns WHERE table_name = tabledf;
BEGIN


	looper:='SELECT column_name FROM user_tab_columns WHERE table_name =''|| tabledf ||'' ';
	EXECUTE IMMEDIATE looper;



	FOR i IN curseur LOOP
		
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

		if(counter2*100/counter1>80) then
		DBMS_OUTPUT.PUT_LINE('c''est une colonne pays');
		elsif(counter3*100/counter1>80)then
		DBMS_OUTPUT.PUT_LINE('c''est une colonne ville');
		end if;

	END LOOP;
	
END;
/
