set serveroutput on; --Habilita retorno da console do server

--Exemplo if
--
DECLARE
  v_idade NUMBER;
BEGIN
  v_idade := 66;
  IF v_idade >= 18 AND v_idade <=65 THEN
     DBMS_OUTPUT.put_line('Maior');
  ELSIF v_idade > 65 THEN
    DBMS_OUTPUT.put_line('Idoso');
  ELSE
    DBMS_OUTPUT.put_line('Menor');
  END IF;
END;

--Exemplo Loop
DECLARE
  v_cnt NUMBER;
BEGIN
  v_cnt := 0;
  LOOP
    v_cnt := v_cnt +1;
    DBMS_OUTPUT.put_line(v_cnt);
  EXIT WHEN v_cnt = 100;
  END LOOP;
END;

--Exemplo loop for
BEGIN
  FOR x IN 1..100 LOOP
   DBMS_OUTPUT.put_line(x);
  END LOOP;
END;

 