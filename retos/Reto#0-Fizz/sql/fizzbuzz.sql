SET SERVEROUTPUT ON
DECLARE
  numeros NUMBER;
  result VARCHAR2(20);
BEGIN
  FOR numeros IN 1..100 LOOP
    IF MOD(numeros, 3) = 0 AND MOD(numeros, 5) = 0 THEN
      result := 'fizzbuzz';
    ELSIF MOD(numeros, 3) = 0 THEN
      result := 'fizz';
    ELSIF MOD(numeros, 5) = 0 THEN
      result := 'buzz';
    ELSE
      result := TO_CHAR(numeros);
    END IF;

    -- Mostrar el resultado
    DBMS_OUTPUT.PUT_LINE(result);
  END LOOP;
END;
/