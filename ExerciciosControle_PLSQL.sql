-- EXERCICIOS 21-03-2017
SET SERVEROUTPUT ON;

--1) Desenvolver um bloco PL/SQL que exiba o nome e a idade armazenados em variáveis.
DECLARE
  nome varchar2(50);
  idade number(2);
BEGIN
  nome  := 'Joao';
  idade := 35;
  DBMS_OUTPUT.PUT_LINE('Meu nome é ' || nome || ', tenho '  || idade || ' anos.');
END;

--2) Desenvolver um script PL/SQL que receba em variáveis o nome, idade e email. Para todas as entradas,
--   validar os casos abaixo:
--  - Caso a idade seja menor que 18 anos, retornar somente a mensagem "Idade não permitida.
--  - O endereço de e-mail obrigatóriamente deve ter o caractere "@".
--  - O nome deve ter no mínimo 2 nomes.
--  - Caso todas as condições acima estejam validadas, exibir todos os dados recebidos nas variáveis.
DECLARE
  v_nome varchar2(50);
  v_idade number(2);
  v_email varchar2(50);
BEGIN
  v_nome :='Felipe Dornelas Viel';
  v_idade :=22;
  v_email :='felipedviel@hotmail.com';
  if v_idade < 18 then
    DBMS_OUTPUT.PUT_LINE('Idade nao permitida');
  elsif 
    instr(v_email,'@')=0 then
    DBMS_OUTPUT.PUT_LINE('Falta o @');
  elsif 
    instr(v_nome,' ')=0 or length(v_nome) < 3 then
    DBMS_OUTPUT.PUT_LINE('O nome não é composto!');
  else
    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome || ' Idade: ' || v_idade || ' Email: ' || v_email);
  end if;
END;

-- 3) Desenvolver um bloco PL/SQL que receba 5 valores e armazene a média dos 5 valores. Armazenar somente números inteiros.
DECLARE
 vl_n1 number;
 vl_n2 number;
 vl_n3 number;
 vl_n4 number;
 vl_n5 number;
 vl_media number;
BEGIN
  vl_n1 := 2;
  vl_n2 := 2;
  vl_n3 := 4;
  vl_n4 := 1000;
  vl_n5 := 10;
  vl_media := trunc((vl_n1 + vl_n2 + vl_n3 + vl_n4 +vl_n5 )/5);
  DBMS_OUTPUT.PUT_LINE('Com truc ' || vl_media);
  DBMS_OUTPUT.PUT_LINE('Sem truc ' || (vl_n1 + vl_n2 + vl_n3 + vl_n4 +vl_n5 )/5);
END;

-- 4) Desenvolver um Bloco PL/SQL que receba um número em uma variável e exiba o resto
-- da divisão dos próximos 100 números. Imprimir se é Par ou ímpar.
--com loop
DECLARE
vl_n1 number;
vl_ct number;
BEGIN
vl_n1 := 200;
vl_ct := 0;
  loop
    vl_ct := vl_ct + 1;
    vl_n1 := vl_n1 + 1;
    if MOD(vl_n1, 2) = 0 then
      DBMS_OUTPUT.PUT_LINE(vl_n1 || ' é Par');
    else 
      DBMS_OUTPUT.PUT_LINE(vl_n1 || ' é Impar');
    end if;
  exit when vl_ct = 100;
  end loop;
END;

--com for
declare
  v_inicio number:=100;
begin 
  for x in v_inicio..v_inicio+100 loop
    if mod(v_inicio,2)=0 then
      DBMS_OUTPUT.PUT_LINE(v_inicio || ' é Par');
    else
      DBMS_OUTPUT.PUT_LINE(v_inicio || ' é Impar');
    end if;
    v_inicio:=v_inicio+1;
  end loop;
end;

--5) Desenvolver um Bloco PL/SQL que receba um nome, caso o nome exceda 30 caracteres exiba somente o sobrenome.
DECLARE
vl_nome VARCHAR(50);
BEGIN
  vl_nome :='Felipe Dornelas Viel aaaaaaaaaaa';
  if LENGTH(vl_nome) > 30 then
    DBMS_OUTPUT.PUT_LINE(SUBSTR(vl_nome,INSTR(vl_nome,' ',-1))+1, length(v_nome));
  else 
    DBMS_OUTPUT.PUT_LINE(vl_nome);
  end if;
END;

--6) Desenvolver um Bloco PL/SQL que exiba a seguinte mensagem de texto:
--   'Hoje' || <sysdate> || ', estamos no seguinte dia da semana:' || <dia da semana>
DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('Hoje ' || sysdate || ' ,estamos no seguinte dia da semana :' || to_char(sysdate,'day'));
END;

--7) Desenvolva um bloco anônimo que exiba durante 365 dias (1 ano)
--   apenas as datas que caem no sábado e domingo, após a entrada de uma data.
--   Após a solicitação da entrada do campo data, exiba sequencialmente a data e
--   o dia da semana que representa essa data. Utilize o comando loop para realizar essa tarefa.
--   Utilize o pacote DBMS_OUTPUT para exibir esses valores. Exiba os valores em ordem de data

DECLARE 
  vl_data DATE;
  vl_cont INTEGER;
  BEGIN
  vl_data :=('01/01/2000');
  vl_cont :=0;
  loop
    if to_char(vl_data,'fmDAY')= 'SÁBADO' then
      DBMS_OUTPUT.PUT_LINE(to_char(vl_data,'DD-mm-YYYY') || ' cai no sabado');
    elsif to_char(vl_data,'fmDAY')='DOMINGO' then
      DBMS_OUTPUT.PUT_LINE(to_char(vl_data,'DD-mm-YYYY') || ' cai no domingo');
    end if;
    vl_cont := vl_cont + 1;
    vl_data := vl_data + 1;
  exit when vl_cont = 365;
  end loop;
END;

declare 
  v_data date;
begin
  v_data := to_date('28/03/2017','dd/mm/yyyy');
  for x in 1..365 loop
    if to_char(v_data,'d')=7 then
      DBMS_OUTPUT.PUT_LINE(to_char(v_data) || ' é sábado');
    elsif to_char(v_data,'d')=1 then
      DBMS_OUTPUT.PUT_LINE(to_char(v_data) || ' é domingo');
    end if;
    v_data:= v_data+1;
  end loop;
end;





