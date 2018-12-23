-- fonction qui corrige le sexe/genre
CREATE OR REPLACE FUNCTION corrsexe(sexe in VARCHAR)
  return VARCHAR
as
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	requete_stock2 VARCHAR(255);
BEGIN
	-- si l'entrée est un homme
	requete:='select REGEXPR from DDRE where CATEGORY=''PEOPLE'' and SUBCATEGORY=''MEN'' ';
	execute immediate requete into requete_stock; 
	-- si l'entrée est une femme
	requete:='select REGEXPR from DDRE where CATEGORY=''PEOPLE'' and SUBCATEGORY=''WOMEN'' ';
	execute immediate requete into requete_stock2;
	IF(REGEXP_LIKE(upper(sexe),requete_stock)) THEN
		-- alors on le remplace par 'M'    
		return 'M';
	ELSIF(REGEXP_LIKE(upper(sexe),requete_stock2)) then
		-- alors on le remplace par 'F'    
		return 'F';
	else
		-- si l'entrée n'est ni une femme ni un homme on retourne '' car on ne sait pas
		return '';
  END IF;
END;
/

--fonction qui corrige la taille
CREATE OR REPLACE FUNCTION corrtaille(taille in VARCHAR)
  return VARCHAR
as
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	requete_stock2 VARCHAR(255);
	requete_stock3 VARCHAR(255);
	envoie VARCHAR(255);
BEGIN
	--si la taille est en metre
	requete:='select REGEXPR from DDRE where CATEGORY=''SIZE'' and SUBCATEGORY=''SIZE-M'' ';
	execute immediate requete into requete_stock; 
	--si la taille est en centimetre
	requete:='select REGEXPR from DDRE where CATEGORY=''SIZE'' and SUBCATEGORY=''SIZE-CM'' ';
	execute immediate requete into requete_stock2; 
	--si la taille est en milimetre
	requete:='select REGEXPR from DDRE where CATEGORY=''SIZE'' and SUBCATEGORY=''SIZE-MM'' ';
	execute immediate requete into requete_stock3; 
	
	IF(REGEXP_LIKE(lower(taille),requete_stock)) THEN
		-- alors on renvoie la taille en entrée avec 'm' derriere
		envoie:=''||taille;
		return envoie;

	ELSIF(REGEXP_LIKE(lower(taille),requete_stock2)) then
		-- alors on renvoie la taille en entrée diviser par 100 avec 'm' derriere
		envoie:=''||regexp_replace(taille ,'[a-zA-Z]+')/100||'m';
		return envoie;
		
	elsif(REGEXP_LIKE(lower(taille),requete_stock3)) then
		-- alors on renvoie la taille en entrée diviser par 1000 avec 'm' derriere
		envoie:=''||regexp_replace(taille ,'[a-zA-Z]+')/1000||'m';
		return envoie;

	else
		-- si l'entrée n'est rien de tout ça on retourne ''
		return '';
  	END IF;
END;
/

-- fonction qui corrige les groupe sanguin
CREATE OR REPLACE FUNCTION corrgs(blood in VARCHAR)
  return VARCHAR
as
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	envoie VARCHAR(255);
BEGIN
	-- si l'entrée a bien la regex d'un groupe sanguin
	requete:='select REGEXPR from DDRE where CATEGORY=''BLOOD'' ';
	execute immediate requete into requete_stock; 
	

	IF(REGEXP_LIKE(blood,requete_stock)) THEN
		-- alors on renvoit le groupe sanguin en majuscule
		envoie:=upper(blood);
		return envoie;

	else
		-- sinon on renvoie ''
		return '';
  	END IF;
END;
/

-- fonction qui corrige le poids
CREATE OR REPLACE FUNCTION corrpoids(poids in VARCHAR)
  return VARCHAR
as
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	requete_stock2 VARCHAR(255);
	requete_stock3 VARCHAR(255);
	envoie VARCHAR(255);
BEGIN

	-- si le poids est en kilogramme
	requete:='select REGEXPR from DDRE where CATEGORY=''WEIGHT'' and SUBCATEGORY=''WEIGHT-KG'' ';
	execute immediate requete into requete_stock;
	-- si le poids est en tonne
	requete:='select REGEXPR from DDRE where CATEGORY=''WEIGHT'' and SUBCATEGORY=''WEIGHT-TONNE'' ';
	execute immediate requete into requete_stock2; 
	-- si le poids est en gramme
	requete:='select REGEXPR from DDRE where CATEGORY=''WEIGHT'' and SUBCATEGORY=''WEIGHT-G'' ';
	execute immediate requete into requete_stock3; 


	IF(REGEXP_LIKE(poids,requete_stock)) THEN
		--on renvoie le poids d'entrée en minuscule
		envoie:=''||regexp_replace(poids ,'[a-zA-Z]+')||'kg';
		return envoie;
	
	ELSIF(REGEXP_LIKE(poids,requete_stock2)) then
		--on renvoie le poids multiplier par 1000 en minuscule
		envoie:=''||regexp_replace(poids ,'[a-zA-Z]+')*1000||'kg';
		return envoie;
		
	elsif(REGEXP_LIKE(poids,requete_stock3)) then
		--on renvoie le poids diviser par 1000 en minuscule
		envoie:=''||regexp_replace(poids ,'[a-zA-Z]+')/1000||'kg';
		return envoie;

	else
		-- sinon on renvoie ''
		return '';
  	END IF;
END;
/

--correction de mail
CREATE OR REPLACE FUNCTION corrmail(mail in VARCHAR)
  return VARCHAR
as
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	requete_stock2 VARCHAR(255);
	requete_stock3 VARCHAR(255);
	envoie VARCHAR(255);
BEGIN
	--si l'entrée est bien un mail
	requete:='select REGEXPR from DDRE where CATEGORY=''EMAIL'' ';
	execute immediate requete into requete_stock; 
	


	IF(REGEXP_LIKE(mail,requete_stock)) THEN
		--alors on renvoie le mail en minuscule
		envoie:=lower(mail);
		return envoie;
	
	else
		--sinon on renvoie ''
		return '';
  	END IF;
END;
/

--correction d'un numéro de téléphone
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

	--si l'entrée est bien un numéro de téléphone
	requete:='select REGEXPR from DDRE where CATEGORY=''PHONE'' ';
	execute immediate requete into requete_stock; 
	-- recuperation de l'indicateur en fonction du pays	 
	requete:='select numero from phone_num where pays='''||pays||''' ';
	execute immediate requete into requete_stock2; 



	IF(REGEXP_LIKE(phone,requete_stock)) THEN
		-- si il y a des parenthese avec l'indicateur dedans on les enleves ex: (+33)
		envoie:=regexp_replace(phone ,'(\(\+..)\)+') ;
		-- si il y a que l'indicateur on l'enleve ex: +33    
		envoie:=regexp_replace(envoie ,'(\+..)+') ;
		-- si il y a des espaces on les enleves
		envoie:=regexp_replace(envoie ,' +') ;
		select length(envoie) into requete from dual;	
		if(requete=10) then			
		     		--si il y a 10 chiffres on met l'indicateur devant et on retourne le numero
				envoie:='+'||requete_stock2||''||envoie;
				return envoie;
			
		else
		       		--si il y a 9 chiffres on met l'indicateur puis un '0' devant et on retourne le numero
				envoie:='+'||requete_stock2||'0'||envoie;
				return envoie;
			
		end if;


	else
		--sinon on retourne ''       
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
		--si le pays est écrit en français
		if(langue='FRENCH') THEN	
		
		--on compte le nombre de pays qui à son nom en anglais qui est égale au pays en entrée de la fonction
		view1:= 'select count(upper(french)) from ddvs where category=''COUNTRY'' and upper(english)=upper('''||pays||''') ';
		execute immediate view1 into stock1;
			--si il n'y en a pas
			if(stock1='0') then
		       		-- on compte le nombre de pays qui à son nom en français qui est quasiment égale au pays d'entrée de la fonction
				view1:= 'select count(upper(french)) from ddvs where category=''COUNTRY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(french),upper('''||pays||'''))>70';
				execute immediate view1 into stock2;
				if(stock2='0') then
		       			--si il n'y en a pas on retourne ''
					return '';
				else
		       			--si il y en a un on retourne donc ce pays
					view1:= 'select upper(french) from ddvs where category=''COUNTRY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(french),upper('''||pays||'''))>70';
					execute immediate view1 into stock2;
					return stock2;
				end if;
			else
		       	--si il y en a un on retourne le pays	
				view1:= 'select upper(french) from ddvs where category=''COUNTRY'' and upper(english)=upper('''||pays||''') ';
				execute immediate view1 into stock1;
				return stock1;
			end if;
		--si le pays est écrit en anglais
		elsif(langue='ENGLISH') THEN
		       
		--on compte le nombre de pays qui à son nom en francais qui est égale au pays en entrée de la fonction
		view1:= 'select count(upper(english)) from ddvs where category=''COUNTRY'' and upper(french)=upper('''||pays||''') ';
		execute immediate view1 into stock1;
			--si il n'y en a pas
			if(stock1='0') then
		       		-- on compte le nombre de pays qui à son nom en anglais qui est quasiment égale au pays d'entrée de la fonction		       
				view1:= 'select count(upper(english)) from ddvs where category=''COUNTRY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(english),upper('''||pays||'''))>70';
				execute immediate view1 into stock2;
				if(stock2='0') then
		       			--si il n'y en a pas on retourne ''		       
					return '';
				else
		       			--si il y en a un on retourne donc ce pays		       
					view1:= 'select upper(english) from ddvs where category=''COUNTRY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(english),upper('''||pays||'''))>70';
					execute immediate view1 into stock2;
					return stock2;
				end if;
			else
		       	--si il y en a un on retourne le pays			       
				view1:= 'select upper(english) from ddvs where category=''COUNTRY'' and upper(french)=upper('''||pays||''') ';
				execute immediate view1 into stock1;

				return stock1;
			end if;
		else
		--si il n'y a pas la langue on retourne ''
			return '';		
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
		--si la langue est écrit en français

		if(langue='FRENCH') THEN	
		       
		--on compte le nombre de ville qui à son nom en anglais qui est égale a la ville en entrée de la fonction
		view1:= 'select count(upper(french)) from ddvs where category=''CITY'' and upper(english)=upper('''||city||''') ';
		execute immediate view1 into stock1;
		       
			--si il n'y en a pas
			if(stock1='0') then
		       		-- on compte le nombre de ville qui à son nom en français qui est quasiment égale a la ville d'entrée de la fonction
				view1:= 'select count(upper(french)) from ddvs where category=''CITY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(french),upper('''||city||'''))>0';
				execute immediate view1 into stock2;
				if(stock2='0') then
 	       			--si il n'y en a pas on retourne ''
					return '';
				else   
		       			--si il y en a un on retourne donc cette ville
					view1:= 'select upper(french) from ddvs where category=''CITY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(french),upper('''||city||'''))>80';
					execute immediate view1 into stock2;
					return stock2;
				end if;
			else
		       	--si il y en a un on retourne la ville	
				view1:= 'select upper(french) from ddvs where category=''CITY'' and upper(english)=upper('''||city||''') ';

				execute immediate view1 into stock1;
				return stock1;
			end if;
		--si la langue est écrit en anglais
		elsif(langue='ENGLISH') THEN
		--on compte le nombre de ville qui à son nom en francais qui est égale a la ville en entrée de la fonction

		view1:= 'select count(upper(english)) from ddvs where category=''CITY'' and upper(french)=upper('''||city||''') ';
		execute immediate view1 into stock1;
			--si il n'y en a pas
			if(stock1='0') then
		       		-- on compte le nombre de ville qui à son nom en anglais qui est quasiment égale a la ville d'entrée de la fonction
				view1:= 'select count(upper(english)) from ddvs where category=''CITY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(english),upper('''||city||'''))>80';
				execute immediate view1 into stock2;
				if(stock2='0') then
 	       			--si il n'y en a pas on retourne ''

					return '';
				else
		       			--si il y en a un on retourne donc cette ville
					view1:= 'select upper(english) from ddvs where category=''CITY'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(english),upper('''||city||'''))>80';
					execute immediate view1 into stock2;
					return stock2;
				end if;
			else
		       	--si il y en a un on retourne la ville	
				view1:= 'select upper(english) from ddvs where category=''CITY'' and upper(french)=upper('''||city||''') ';
				execute immediate view1 into stock1;

				return stock1;
			end if;
		else
		       --si il n'y a pas de langue on retourne ''
			return '';		
		end if;
	
END;
/
---fonction qui prend en parametre le prenom et la langue(french ou english)
CREATE OR REPLACE FUNCTION corrfirstname(nam in VARCHAR, langu in varchar)
  return VARCHAR
as
	name VARCHAR(255):=upper(nam);
	langue VARCHAR(255):=upper(langu);
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	requete_stock2 VARCHAR(255);
	requete_stock3 VARCHAR(255);
	requete_stock4 VARCHAR(255);
	requete_stock5 VARCHAR(255);
	envoie VARCHAR(255);
BEGIN

	
	requete:='select REGEXPR from DDRE where CATEGORY=''FIRSTNAME'' ';
	execute immediate requete into requete_stock; 

	-- si la langue dans laquelle est écrit le prénom est francaise
	if(langue='FRENCH') THEN
		--si le prénom  est bien un prénom 
		IF(REGEXP_LIKE(name,requete_stock)) THEN
			requete:='select count(french) from DDVS where CATEGORY=''FIRSTNAME'' and upper(french)='''||name||''' ';
			execute immediate requete into requete_stock2;
			--si le nom est bien dans le dictionnaire des prenom alors on retourne ce nom
			if(requete_stock2='1') then
				return name;
			else
			--sinon
				requete:='select count(french) from DDVS where CATEGORY=''FIRSTNAME'' and upper(english)='''||name||''' ';
				execute immediate requete into requete_stock3;
			       --si le prenom est dans le dictionnaire des prenom anglais alors on retourne son prenom francais
				if(requete_stock3='1') then
					requete:='select french from DDVS where CATEGORY=''FIRSTNAME'' and upper(english)='''||name||''' ';
					execute immediate requete into requete_stock4;
					return upper(requete_stock4);
				else
			       --sinon si son prénom ressemble à un prénom dans le dictionnaire on renvoie le prénom auquel il ressemble
					requete:='select count(french) from DDVS where CATEGORY=''FIRSTNAME'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(french),'''||name||''')>75 ';
					execute immediate requete into requete_stock4;
					if(requete_stock4='1') then
						requete:='select french from DDVS where CATEGORY=''FIRSTNAME'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(french),'''||name||''')>75 ';
						execute immediate requete into requete_stock5;
						return upper(requete_stock5);
					else
			       		--si le prénom ne ressemble a rien dans le dictionnaire on renvoie ''
						return '';
					end if;
				end if;
			end if;
		else
		-- si ce n'est pas un prénom on renvoie ''
			return '';  	
		END IF;
	-- si la langue dans laquelle est écrit le prénom est anglaise

	elsif(langue='ENGLISH') THEN
		--si le prénom  est bien un prénom 
		IF(REGEXP_LIKE(name,requete_stock)) THEN
			requete:='select count(english) from DDVS where CATEGORY=''FIRSTNAME'' and upper(english)='''||name||''' ';
			execute immediate requete into requete_stock2;
			--si le nom est bien dans le dictionnaire des prenom alors on retourne ce nom
			if(requete_stock2='1') then
				return name;
			else
			--sinon

				requete:='select count(english) from DDVS where CATEGORY=''FIRSTNAME'' and upper(french)='''||name||''' ';
				execute immediate requete into requete_stock3;
			       --si le prenom est dans le dictionnaire des prenom anglais alors on retourne son prenom francais
				if(requete_stock3='1') then
					requete:='select english from DDVS where CATEGORY=''FIRSTNAME'' and upper(french)='''||name||''' ';
					execute immediate requete into requete_stock4;
					return upper(requete_stock4);
				else
			       --sinon si son prénom ressemble à un prénom dans le dictionnaire on renvoie le prénom auquel il ressemble
					requete:='select count(english) from DDVS where CATEGORY=''FIRSTNAME'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(english),'''||name||''')>75 ';
					execute immediate requete into requete_stock4;
					if(requete_stock4='1') then
						requete:='select english from DDVS where CATEGORY=''FIRSTNAME'' and UTL_MATCH.EDIT_DISTANCE_SIMILARITY(upper(english),'''||name||''')>75 ';
						execute immediate requete into requete_stock5;
						return upper(requete_stock5);
					else
			       		--si le prénom ne ressemble a rien dans le dictionnaire on renvoie ''
						return '';
					end if;
				end if;
			end if;
		else
		-- si ce n'est pas un prénom on renvoie ''
			return '';  	
		END IF;
	else
		-- si il n'y a pas de langue on revoie ''
		return '';	
	END IF;
END;
/
---fonction qui donne le pays en fonction de la ville et de la langue de la ville (soit french soit english) (si une colonne a plus de ville de type french alors la langue donnée ici sera french) 
CREATE OR REPLACE FUNCTION corrpaysdeville(vill in VARCHAR, langu in varchar)
  return VARCHAR
as
	ville VARCHAR(255):=upper(vill);
	langue VARCHAR(255):=upper(langu);
	requete VARCHAR(255);
	requete_stock VARCHAR(255);
	requete_stock2 VARCHAR(255);
	requete_stock3 VARCHAR(255);
	requete_stock4 VARCHAR(255);
	requete_stock1 VARCHAR(255);
	envoie VARCHAR(255);
BEGIN

	
	

	--si langue est francaise
	if(langue='FRENCH') THEN
		requete:='select count(FOREIGNKEY) from DDVS where CATEGORY=''CITY'' and upper(FRENCH)='''||ville||''' ';
		execute immediate requete into requete_stock; 
		--si la ville en entrée n'est pas dans le data dictionnary on retourne '' 
		if(requete_stock='0') then
			return '';
		--si la ville en entrée est dans la data dictionnary on retourne le pays qui lui est affilié dans le DD
		else
			requete:='select FOREIGNKEY from DDVS where CATEGORY=''CITY'' and upper(FRENCH)='''||ville||''' ';
			execute immediate requete into requete_stock1;
			requete:='select FRENCH from DDVS where CATEGORY=''COUNTRY'' and upper(PRIMARYKEY)='''||requete_stock1||''' ';
			execute immediate requete into requete_stock2; 
			return requete_stock2;
		end if;
	--si langue est anglaise
	elsif(langue='ENGLISH') THEN
		requete:='select count(FOREIGNKEY) from DDVS where CATEGORY=''CITY'' and upper(english)='''||ville||''' ';
		execute immediate requete into requete_stock; 
		--si la ville en entrée n'est pas dans le data dictionnary on retourne '' 
		if(requete_stock='0') then
			return '';
		--si la ville en entrée est dans la data dictionnary on retourne le pays qui lui est affilié dans le DD
		else
			requete:='select FOREIGNKEY from DDVS where CATEGORY=''CITY'' and upper(english)='''||ville||''' ';
			execute immediate requete into requete_stock1;
			requete:='select english from DDVS where CATEGORY=''COUNTRY'' and upper(PRIMARYKEY)='''||requete_stock1||''' ';
			execute immediate requete into requete_stock2; 
			return requete_stock2;
		end if;
	else
	--si il n'y a pas de langue on retourne ''		       
		return '';
	END IF;
END;
/
