
--CREATE TABLE DDCAT( TYPE VARCHAR2(100), FCT varchar2(100));
--INSERT INTO DDCAT VALUES ('SEXE','CORRSEXE');



CREATE OR REPLACE FUNCTION corrsexe(sexe in VARCHAR)
  return VARCHAR
as
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	requete_stock2 VARCHAR(255);
BEGIN
	requete:='select REGEXPR from DDRE where CATEGORY=''PEOPLE'' and SUBCATEGORY=''MEN'' ';
	execute immediate requete into requete_stock; 
	requete:='select REGEXPR from DDRE where CATEGORY=''PEOPLE'' and SUBCATEGORY=''WOMEN'' ';
	execute immediate requete into requete_stock2;
	IF(REGEXP_LIKE(upper(sexe),requete_stock)) THEN
		return 'M';
	ELSIF(REGEXP_LIKE(upper(sexe),requete_stock2)) then
		return 'F';
	else
		return '';
  END IF;
END;
/


CREATE OR REPLACE FUNCTION corrtaille(taille in VARCHAR)
  return VARCHAR
as
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	requete_stock2 VARCHAR(255);
	requete_stock3 VARCHAR(255);
	envoie VARCHAR(255);
BEGIN
	
	requete:='select REGEXPR from DDRE where CATEGORY=''SIZE'' and SUBCATEGORY=''SIZE-M'' ';
	execute immediate requete into requete_stock; 
	requete:='select REGEXPR from DDRE where CATEGORY=''SIZE'' and SUBCATEGORY=''SIZE-CM'' ';
	execute immediate requete into requete_stock2; 
	requete:='select REGEXPR from DDRE where CATEGORY=''SIZE'' and SUBCATEGORY=''SIZE-MM'' ';
	execute immediate requete into requete_stock3; 
	
		DBMS_OUTPUT.PUT_LINE(regexp_replace(taille ,'[a-zA-Z]+'));
	IF(REGEXP_LIKE(lower(taille),requete_stock)) THEN
		envoie:=''||taille||'m';
		return envoie;

	ELSIF(REGEXP_LIKE(lower(taille),requete_stock2)) then
		envoie:=''||regexp_replace(taille ,'[a-zA-Z]+')/100||'m';
		return envoie;
		
	elsif(REGEXP_LIKE(lower(taille),requete_stock3)) then
		envoie:=''||regexp_replace(taille ,'[a-zA-Z]+')/1000||'m';
		return envoie;

	else
		return '';
  	END IF;
END;
/


/*
CREATE OR REPLACE FUNCTION corrdate(datee in VARCHAR)
  return VARCHAR
as
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	requete_stock2 VARCHAR(255);
	requete_stock3 VARCHAR(255);
	envoie VARCHAR(255);
BEGIN
	
	requete:='select REGEXPR from DDRE where CATEGORY=''DATE'' and SUBCATEGORY=''DATEDDMMYYYY'' ';
	execute immediate requete into requete_stock; 
	requete:='select REGEXPR from DDRE where CATEGORY=''DATE'' and SUBCATEGORY=''DATEMMDDYYYY'' ';
	execute immediate requete into requete_stock2; 
	requete:='select REGEXPR from DDRE where CATEGORY=''DATE'' and SUBCATEGORY=''DATEYYYYMMDD'' ';
	execute immediate requete into requete_stock3; 
	

	IF(REGEXP_LIKE(lower(datee),requete_stock)) THEN
		envoie:=datee;
		return envoie;

	ELSIF(REGEXP_LIKE(lower(datee),requete_stock2)) then
		envoie:='';
		return envoie;
		
	elsif(REGEXP_LIKE(lower(datee),requete_stock3)) then
		envoie:=''||regexp_replace(datee ,'[a-zA-Z]+')/1000||'m';
		return envoie;

	else
		return '';
  	END IF;
END;
/
*/
CREATE OR REPLACE FUNCTION corrgs(blood in VARCHAR)
  return VARCHAR
as
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	envoie VARCHAR(255);
BEGIN
	
	requete:='select REGEXPR from DDRE where CATEGORY=''BLOOD'' ';
	execute immediate requete into requete_stock; 
	

	IF(REGEXP_LIKE(blood,requete_stock)) THEN
		envoie:=upper(blood);
		return envoie;

	else
		return '';
  	END IF;
END;
/

CREATE OR REPLACE FUNCTION corrpoids(poids in VARCHAR)
  return VARCHAR
as
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	requete_stock2 VARCHAR(255);
	requete_stock3 VARCHAR(255);
	envoie VARCHAR(255);
BEGIN

	requete:='select REGEXPR from DDRE where CATEGORY=''WEIGHT'' and SUBCATEGORY=''WEIGHT-KG'' ';
	execute immediate requete into requete_stock; 
	requete:='select REGEXPR from DDRE where CATEGORY=''WEIGHT'' and SUBCATEGORY=''WEIGHT-TONNE'' ';
	execute immediate requete into requete_stock2; 
	requete:='select REGEXPR from DDRE where CATEGORY=''WEIGHT'' and SUBCATEGORY=''WEIGHT-G'' ';
	execute immediate requete into requete_stock3; 


	IF(REGEXP_LIKE(poids,requete_stock)) THEN
		envoie:=lower(poids);
		return envoie;
	
	ELSIF(REGEXP_LIKE(poids,requete_stock2)) then
		envoie:=''||regexp_replace(poids ,'[a-zA-Z]+')*1000||'kg';
		return envoie;
		
	elsif(REGEXP_LIKE(poids,requete_stock3)) then
		envoie:=''||regexp_replace(poids ,'[a-zA-Z]+')/1000||'kg';
		return envoie;

	else
		return '';
  	END IF;
END;
/


CREATE OR REPLACE FUNCTION corrmail(mail in VARCHAR)
  return VARCHAR
as
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	requete_stock2 VARCHAR(255);
	requete_stock3 VARCHAR(255);
	envoie VARCHAR(255);
BEGIN

	requete:='select REGEXPR from DDRE where CATEGORY=''EMAIL'' ';
	execute immediate requete into requete_stock; 
	


	IF(REGEXP_LIKE(mail,requete_stock)) THEN
		envoie:=lower(mail);
		return envoie;
	
	else
		return '';
  	END IF;
END;
/

CREATE OR REPLACE FUNCTION corrphone(phone in VARCHAR,pay in VARCHAR)
  return VARCHAR
as
	pays VARCHAR(255):=upper(pay);
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	requete_stock2 VARCHAR(255);
	requete_stock3 VARCHAR(255);
	envoie VARCHAR(255);
BEGIN

	
	requete:='select REGEXPR from DDRE where CATEGORY=''PHONE'' ';
	execute immediate requete into requete_stock; 
	requete:='select numero from phone_num where pays='''||pays||''' ';
	execute immediate requete into requete_stock2; 



	IF(REGEXP_LIKE(phone,requete_stock)) THEN
		envoie:=regexp_replace(phone ,'(\(\+..)\)+') ;
		envoie:=regexp_replace(envoie ,'(\+..)+') ;
		envoie:=regexp_replace(envoie ,' +') ;
		select length(envoie) into requete from dual;	
		if(requete=10) then							
				envoie:='+'||requete_stock2||''||envoie;
				return envoie;
			
		else
				envoie:='+'||requete_stock2||'0'||envoie;
				return envoie;
			
		end if;


	else
		return '';  	
	END IF;
	
END;
/

--- fonction qui prend en parametre un pays et 'french' ou 'english' afin de savoir en quelle langue doit etre le pays
CREATE OR REPLACE FUNCTION corrpays(pay VARCHAR, langu varchar)
  return VARCHAR
as
	pays VARCHAR(255):=upper(pay);
	langue VARCHAR(255):=upper(langu);
	


	view1 varchar(1000) := '';
	stock1 varchar(100):= '';
	stock2 varchar(100):= '';
BEGIN

		if(langue='FRENCH') THEN	
		view1:= 'select count(upper(french)) from ddvs where category=''COUNTRY'' and upper(english)=upper('''||pays||''') ';

		execute immediate view1 into stock1;

			if(stock1='0') then
				view1:= 'select count(upper(french)) from ddvs where category=''COUNTRY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(french),upper('''||pays||'''))>80';
				execute immediate view1 into stock2;
				if(stock2='0') then
					return '';
				else
					view1:= 'select upper(french) from ddvs where category=''COUNTRY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(french),upper('''||pays||'''))>80';
					execute immediate view1 into stock2;
					return stock2;
				end if;
			else
				view1:= 'select upper(french) from ddvs where category=''COUNTRY'' and upper(english)=upper('''||pays||''') ';

				execute immediate view1 into stock1;
				return stock1;
			end if;
		elsif(langue='ENGLISH') THEN

		view1:= 'select count(upper(english)) from ddvs where category=''COUNTRY'' and upper(french)=upper('''||pays||''') ';
		execute immediate view1 into stock1;

			if(stock1='0') then
				view1:= 'select count(upper(english)) from ddvs where category=''COUNTRY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(english),upper('''||pays||'''))>80';
				execute immediate view1 into stock2;
				if(stock2='0') then
					return '';
				else
					view1:= 'select upper(english) from ddvs where category=''COUNTRY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(english),upper('''||pays||'''))>80';
					execute immediate view1 into stock2;
					return stock2;
				end if;
			else
				view1:= 'select upper(english) from ddvs where category=''COUNTRY'' and upper(french)=upper('''||pays||''') ';
				execute immediate view1 into stock1;

				return stock1;
			end if;
		else
			return 'hmm';		
		end if;
	
END;
/


--- fonction qui prend en parametre une ville et 'french' ou 'english' afin de savoir en quelle langue doit etre la ville
CREATE OR REPLACE FUNCTION corrville(cit VARCHAR, langu varchar)
  return VARCHAR
as
	city VARCHAR(255):=upper(cit);
	langue VARCHAR(255):=upper(langu);
	


	view1 varchar(1000) := '';
	stock1 varchar(100):= '';
	stock2 varchar(100):= '';
BEGIN

		if(langue='FRENCH') THEN	
		view1:= 'select count(upper(french)) from ddvs where category=''CITY'' and upper(english)=upper('''||city||''') ';

		execute immediate view1 into stock1;

			if(stock1='0') then
				view1:= 'select count(upper(french)) from ddvs where category=''CITY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(french),upper('''||city||'''))>80';
				execute immediate view1 into stock2;
				if(stock2='0') then
					return '';
				else
					view1:= 'select upper(french) from ddvs where category=''CITY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(french),upper('''||city||'''))>80';
					execute immediate view1 into stock2;
					return stock2;
				end if;
			else
				view1:= 'select upper(french) from ddvs where category=''CITY'' and upper(english)=upper('''||city||''') ';

				execute immediate view1 into stock1;
				return stock1;
			end if;
		elsif(langue='ENGLISH') THEN

		view1:= 'select count(upper(english)) from ddvs where category=''CITY'' and upper(french)=upper('''||city||''') ';
		execute immediate view1 into stock1;

			if(stock1='0') then
				view1:= 'select count(upper(english)) from ddvs where category=''CITY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(english),upper('''||city||'''))>80';
				execute immediate view1 into stock2;
				if(stock2='0') then
					return '';
				else
					view1:= 'select upper(english) from ddvs where category=''CITY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(english),upper('''||city||'''))>80';
					execute immediate view1 into stock2;
					return stock2;
				end if;
			else
				view1:= 'select upper(english) from ddvs where category=''CITY'' and upper(french)=upper('''||city||''') ';
				execute immediate view1 into stock1;

				return stock1;
			end if;
		else
			return '';		
		end if;
	
END;
/





