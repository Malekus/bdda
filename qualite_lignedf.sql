CREATE OR REPLACE PROCEDURE TESTDS(colonne1 in varchar,colonne2 in varchar,colonne3 in varchar,colonne4 in varchar,colonne5 in varchar,tabledf in varchar)
AS

	homogen varchar(1000):= '';
	homogen2 varchar(1000):= '';
	homogen3 varchar(1000):= '';
	homogen4 varchar(1000):= '';
	homogen5 varchar(1000):= '';
	view1 varchar(1000) := '';
	upda1 varchar(1000) := '';
	view2 varchar(1000) := '';
	upda2 varchar(1000) := '';
	view3 varchar(1000) := '';
	upda3 varchar(1000) := '';
BEGIN
	homogen:='UPDATE ' || tabledf || ' SET ' || colonne1 ||'=UPPER(' || colonne1 || ')';
	execute immediate homogen;
	homogen2:='UPDATE ' || tabledf || ' SET '|| colonne2 ||'=UPPER(' || colonne2 || ' )';
	execute immediate homogen2;
	homogen3:='UPDATE ' || tabledf || ' SET '|| colonne3 ||'=UPPER(' || colonne3 || ' )';
	execute immediate homogen3;
	homogen4:='UPDATE ' || tabledf || ' SET '|| colonne4 ||'=UPPER(' || colonne4 || ' )';
	execute immediate homogen4;
	homogen5:='UPDATE ' || tabledf || ' SET '|| colonne5 ||'=UPPER(' || colonne5 || ' )';
	execute immediate homogen5;

	view1:='create or replace view test(c1,c2,c3,c4,c5,count,conc,conc4) as select ' || colonne1 ||','|| colonne2 ||','|| colonne3 ||','|| colonne4 ||',' || colonne5 || ',count(*),concat(concat(concat(' || colonne1 ||','|| colonne2 ||'),concat('|| colonne3 ||','|| colonne4 ||')),' || colonne5 || ') as conc , concat(concat('|| colonne2 ||','|| colonne3 ||'),concat('|| colonne4 ||',' || colonne5 || ')) as conc4 from ' || tabledf || ' group by ' || colonne1 ||','|| colonne2 ||','|| colonne3 ||','|| colonne4 ||',' || colonne5 || ' order by count(*) desc';
	execute immediate view1;

	upda1:='update ' || tabledf || ' set ' || colonne1 || '=(select c1 from test where (concat(concat(' || colonne2 || ',' || colonne3 || '),concat(' || colonne4 || ',' || colonne5 || ')))=conc4 and ROWNUM =1) ';	
	execute immediate upda1;

	view2:='create or replace view test(c1,c2,c3,c4,c5,count,conc,conc4,conc3,conc4b) as select ' || colonne1 || ',' || colonne2 || ','|| colonne3 ||',' || colonne4 || ','|| colonne5 ||',count(*),concat(concat(concat(' || colonne1 || ',' || colonne2 || '),concat('|| colonne3 ||',' || colonne4 || ')),'|| colonne5 ||') as conc , concat(concat(' || colonne1 || ','|| colonne3 ||'),concat(' || colonne4 || ','|| colonne5 ||')) as conc4, concat(concat(' || colonne1 || ',' || colonne4 || '),col5) as conc3, concat(concat(' || colonne1 || ','|| colonne3 ||'),'|| colonne5 ||') as conc4b from ' || tabledf || ' group by ' || colonne1 || ',' || colonne2 || ','|| colonne3 ||',' || colonne4 || ','|| colonne5 ||' order by count(*) desc';
	execute immediate view2;
	upda2:='update ' || tabledf || ' set ' || colonne2 || '=(select c2 from test where concat(concat(' || colonne1 || ',' || colonne3 || '),concat(' || colonne4 || ',' || colonne5 || '))=conc4 and ROWNUM <=1)';
	execute immediate upda2;

END;
/ 

