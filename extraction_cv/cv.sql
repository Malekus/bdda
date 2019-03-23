SET SERVEROUTPUT ON

DROP TABLE PERSONNE;
CREATE TABLE PERSONNE(
	NOM VARCHAR2(30),
	PRENOM VARCHAR2(30),
	AGE NUMBER,
	SEXE VARCHAR2(20),
	TEL VARCHAR2(30),
	EMAIL VARCHAR2(30),
	METIER VARCHAR2(30),
	ADRESSE VARCHAR2(50)
);

DROP TABLE FORMATION;
CREATE TABLE FORMATION(
	DATE_FORMATION DATE,
	DIPLOME VARCHAR2(50),
	OPTION VARCHAR2(50),
	ECOLE VARCHAR2(50)
);

DROP TABLE EXPERIENCE;
CREATE TABLE EXPERIENCE(
	DATE_EXPERIENCE DATE,
	TITRE VARCHAR2(50),
	ENTREPRISE VARCHAR2(50),
	TYPE_EXPERIENCE VARCHAR2(50)
);