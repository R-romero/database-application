--Criar uma view chamada VW USUARIO_ATIVO, que retorne o código, nome e documento de todos os usuários ativos.
select * from tab_funcionario;

create or replace view vw_usuario_ativo as
  select idn, nome, doc_identificacao
    from tab_funcionario
   where dt_demissao is null;
   
select * from VW_USUARIO_ATIVO;

--Criar uma view chamada VW_TOTAL_SALARIO, que retorne o total gasto com salários.
create or replace view vw_total_salario as
  select sum(vl_salario_atual) Total_salario
    from tab_funcionario;
    
select * from vw_total_salario;

--Criar uma view chamada VW_QTD_FUNC, que retorne a quantidade de funcionários ativos.
create or replace view vw_qtd_func as
  select count(*) Qtd_func
    from tab_funcionario
   where DT_DEMISSAO is null;
   
select * from vw_qtd_func;

--Criar uma view chamada VW_NOME_FUNC, que retorne somente o primeiro nome dos funcionários ativos.
create or replace view vw_nome_func as
  select nvl(substr(nome, 1, instr(nome, ' ')-1), 'Nome invalido') primeiro_nome
    from tab_funcionario
   where DT_DEMISSAO is null;
   
select * from vw_nome_func;


--******************************************************************************

set serveroutput on;
--Desenvolver um bloco anônimo em PL/SQL, que receba 2 valores e exiba a soma, multiplicação e divisão destes números.
DECLARE
 n1 NUMBER; 
 n2 NUMBER;
 soma NUMBER;
 multiplicacao NUMBER;
 divisao NUMBER;
BEGIN
 n1 := 4;
 n2 := 2;
 soma := (n1 + n2);
 multiplicacao := (n1 * n2);
 divisao := (n1 / n2); 
 DBMS_OUTPUT.PUT_LINE('Entrada N1: ' || n1 || ' e N2: ' || n2 || ' Soma: ' || 
  soma || '; Multiplicação: ' || multiplicacao || '; Divisão: ' || divisao);
END;

--Desenvolver um bloco anônimo em PL/SQL, que receba um nome completo em uma variável e exiba somente o primeiro nome.

DECLARE
  nome_completo VARCHAR2(50);
BEGIN 
  nome_completo := 'Felipe Dornelas Viel';
  DBMS_OUTPUT.PUT_LINE(SUBSTR(nome_completo, 1, INSTR(nome_completo, ' ')-1));
END;

--Desenvolver um bloco anônimo em PL/SQL, que receba uma data no formato DD/MM/YYYY e exiba somente o mês por extenso.
DECLARE
  v_data DATE;
BEGIN 
  v_data := TO_DATE('10/01/1995', 'dd/MM/yyyy');
  DBMS_OUTPUT.put_line(TO_CHAR(v_data, 'MONTH'));
END;

--******************************************************************************
--1) Desenvolver um bloco PL/SQL que exiba o nome e a idade armazenados em variáveis.
DECLARE 
  v_nome VARCHAR2(50);
  v_idade NUMBER;
BEGIN
  v_nome := 'Felipe';
  v_idade := 22;
  DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome || ' de Idade: ' || v_idade);
END;

--2) Desenvolver um script PL/SQL que receba em variáveis o nome, idade e email. Para todas as entradas, validar os casos abaixo:
-- Caso a idade seja menor que 18 anos, retornar somente a mensagem "Idade não permitida.
-- O endereço de e-mail obrigatóriamente deve ter o caractere "@".
-- O nome deve ter no mínimo 2 nomes.
--Caso todas as condições acima estejam validadas, exibir todos os dados recebidos nas variáveis.
DECLARE 
  v_nome VARCHAR2(50);
  v_idade NUMBER;
  v_email VARCHAR2(50);
BEGIN
  v_nome := 'Felipe Dornelas Viel';
  v_idade := 22;
  v_email := 'felipedvielhotmail.com';
  
  IF v_idade < 18 THEN
     DBMS_OUTPUT.PUT_LINE('Idade não Permitida');
  --ELSIF INSTR(v_email,'@') = 0 THEN   
  ELSIF v_email not like '%@%' THEN
     DBMS_OUTPUT.PUT_LINE('Email invalido');
  ELSIF INSTR(v_nome, ' ') = 0 OR LENGTH(v_nome) < 5 THEN
     DBMS_OUTPUT.PUT_LINE('Nome inválido');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome);
    DBMS_OUTPUT.PUT_LINE('Idade: ' || v_idade);
    DBMS_OUTPUT.PUT_LINE('Email: ' || v_email);
  END IF;
END;


--3) Desenvolver um bloco PL/SQL que receba 5 valores e armazene a média dos 5 valores. Armazenar somente números inteiros.
DECLARE
  v_n1 NUMBER;
  v_n2 NUMBER;
  v_n3 NUMBER;
  v_n4 NUMBER;
  v_n5 NUMBER;
  v_media NUMBER;
BEGIN
  v_n1 := 2;
  v_n2 := 2;
  v_n3 := 4;
  v_n4 := 1000;
  v_n5 := 10;
  v_media := TRUNC((v_n1 + v_n2 + v_n3 + v_n4 + v_n5)/5);
  DBMS_OUTPUT.PUT_LINE('Com truc ' || v_media);
  DBMS_OUTPUT.PUT_LINE('Sem truc ' || (v_n1 + v_n2 + v_n3 + v_n4 +v_n5 )/5);
END;

--4) Desenvolver um Bloco PL/SQL que receba um número em uma variável e exiba o resto da divisão dos próximos 100 números. Imprimir se é Par ou ímpar.
DECLARE 
  v_ini NUMBER;
BEGIN
  v_ini := 400;
  FOR x IN v_ini..v_ini+100 LOOP
    IF MOD(x,2) = 0 THEN
      dbms_output.put_line (x || ' é par');
    ELSE
      dbms_output.put_line (x || ' é impar');
    END IF;
  END LOOP;
END;

--5) Desenvolver um Bloco PL/SQL que receba um nome, caso o nome exceda 30 caracteres exiba somente o sobrenome.
DECLARE
  v_nome_completo varchar2(100);
BEGIN
  v_nome_completo := 'Felipe Dornelas Viel AAAAAAAAAAAAAAAAAAAAA';
  IF LENGTH(v_nome_completo) > 30 THEN
    dbms_output.put_line (substr(v_nome_completo,instr(v_nome_completo,' ',-1)+1));
  END IF;
END;

--6) Desenvolver um Bloco PL/SQL que exiba a seguinte mensagem de texto:
--'Hoje' || <sysdate> || ', estamos no seguinte dia da semana:' || <dia da semana>
DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('Hoje ' || sysdate || ' ,estamos no seguinte dia da semana :' || to_char(sysdate,'day'));
END;

--7) Desenvolva um bloco anônimo que exiba durante 365 dias (1 ano) apenas as datas que caem no sábado e domingo, após a entrada de uma data. 
--Após a solicitação da entrada do campo data, exiba sequencialmente a data e o dia da semana que representa essa data. 
--Utilize o comando loop para realizar essa tarefa. Utilize o pacote DBMS_OUTPUT para exibir esses valores. Exiba os valores em ordem de data
alter session set nls_language='english';
declare
  v_data  date;
begin
  v_data := to_date('28/03/2017','dd/mm/yyyy');
  for x in 1..365 loop
    --if trim(to_char(v_data,'day'))='sábado' or trim(to_char(v_data,'day'))='domingo'  then
    if to_char(v_data,'d')=7 or to_char(v_data,'d')=1  then
      dbms_output.put_line( v_data || ' é ' || to_char(v_data,'Day'));
    end if;
    v_data:=v_data+1; 
  end loop;
end;


