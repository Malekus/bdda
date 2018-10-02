SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION distance(premier IN VARCHAR, second IN VARCHAR)
  RETURN NUMBER
    IS
  re NUMBER := 0;
  BEGIN
    --La taille des deux mots est la meme
    IF LENGTH(premier) = LENGTH(second) THEN
      dbms_output.put_line('1 = 2');
      FOR i in 1..LENGTH(premier) LOOP
        -- premier[i] != second[i]
        IF SUBSTR(premier,i,1) != SUBSTR(second,i,1) THEN
          re := re + 1;
        END IF;
      END LOOP;
    --La taille du second mot est plus grand que le premier
    ELSIF LENGTH(premier) < LENGTH(second) THEN
      dbms_output.put_line('1 < 2');
      FOR i in 1..LENGTH(premier) LOOP
        IF SUBSTR(premier,i,1) != SUBSTR(second,i,1) THEN
          re := re + 1;
        END IF;
      END LOOP;
      re := re + (LENGTH(second) - LENGTH(premier));

    --La taille du premier mot est plus grand que le second
    ELSE
      dbms_output.put_line('1 > 2');
      FOR i in 1..LENGTH(second) LOOP
        IF SUBSTR(premier,i,1) != SUBSTR(second,i,1) THEN
          re := re + 1;
        END IF;
      END LOOP;
      re := re + (LENGTH(premier) - LENGTH(second));
    END IF;
    RETURN re;
  END;
/

CREATE OR REPLACE PROCEDURE calcule_distance()
  IS
BEGIN
  dbms_output.put_line('Salut');
END;
/
