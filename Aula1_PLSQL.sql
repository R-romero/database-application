set serveroutput on; --Habilita retorno da console do server
--
DECLARE 
  v_mensagem VARCHAR2(100) := 'Hello World!';
BEGIN
  DBMS_OUTPUT.put_line(mensagem);
END;

--EXERCICIOS
--Soma, Multiplicação e Divisão de 2 numeros.

DECLARE
  v1 NUMBER := 10;
  v2 NUMBER := 3;
  v_soma NUMBER;
  v_multiplicacao NUMBER;
  v_divisao NUMBER;
BEGIN
  v_soma := (v1+v2);
  v_multiplicacao := (v1*v2);
  v_divisao := (v1/v2);
  DBMS_OUTPUT.put_line('Entrada v1:' || v1 || ' e v2:' || v2 || ' Soma: ' || 
  soma || '; Multiplicação: ' || multiplicacao || '; Divisão: ' || divisao);
END;
 
--Mostrar apenas o primeiro nome com uma variavel de nome completo 
DECLARE 
  v_nome_completo VARCHAR2(100) := 'Felipe Dornelas Viel';
BEGIN
  DBMS_OUTPUT.put_line(SUBSTR(nome_completo, 0, INSTR(nome_completo, ' ') -1));
END;

--receba uma data no formato DD/MM/YYYY e mostre só o mes por extenso

DECLARE 
  v_data DATE;
BEGIN
  v_data := TO_DATE('10/01/1995', 'dd/mm/yyyy');
  DBMS_OUTPUT.put_line(TO_CHAR(v_data, 'MONTH'));
END;
