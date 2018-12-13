create or replace procedure mec
	AS
BEGIN
	EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW APL AS SELECT * FROM CLIENTS';
	FOR ligne IN (select * from apl) LOOP
		DBMS_OUTPUT.PUT_LINE(ligne);
	END LOOP;
END;
/
