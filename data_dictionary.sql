ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';

DROP TABLE DATA_DICTIONARY_FIRSTNAME;
DROP TABLE DATA_DICTIONARY_COUNTRY;
DROP TABLE DATA_DICTIONARY_CITY;

CREATE TABLE DATA_DICTIONARY_FIRSTNAME(
  FIRSTNAME VARCHAR2(50),
  SEXE VARCHAR2(25),
  PRIMARY KEY(FIRSTNAME),
  CONSTRAINT CHK_SEXE CHECK(SEXE IN ('Madame', 'Monsieur'))
);

CREATE TABLE DATA_DICTIONARY_COUNTRY(
  COUNTRY_ENGLISH VARCHAR2(100),
  COUNTRY_FRENCH VARCHAR2(100),
  COUNTRY_ALPHA2 VARCHAR2(10),
  COUNTRY_ALPHA3 VARCHAR2(10),
  PRIMARY KEY(COUNTRY_ENGLISH)
);

CREATE TABLE DATA_DICTIONARY_CITY(
  COUNTRY_ALPHA2 VARCHAR2(10),
  CITY_ENGLISH VARCHAR2(255),
  CITY_FRENCH VARCHAR2(255)
);

@data_dictionary_firstname
@data_dictionary_country
@data_dictionary_city_1
@data_dictionary_city_2
@data_dictionary_city_3
@data_dictionary_city_4
@data_dictionary_city_5
@data_dictionary_city_6
@data_dictionary_city_7
@data_dictionary_city_8

select * from DATA_DICTIONARY_FIRSTNAME;
select * from DATA_DICTIONARY_COUNTRY;
select count(*) from DATA_DICTIONARY_CITY;