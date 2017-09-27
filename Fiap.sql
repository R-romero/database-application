--MEU TESTE
create or replace Function fnc_X return number IS 
  X NUMBER;
  N1 NUMBER;
  N2 NUMBER;
BEGIN
  SELECT ROUND(DBMS_RANDOM.VALUE(1,1000)) INTO X FROM DUAL;
  SELECT VL_TOTAL INTO N1 FROM LOC_PEDIDO_LOCACAO WHERE NR_PEDIDO = X;
  SELECT SUM(VL_TOTAL) INTO N2 FROM LOC_ITEM_LOCACAO WHERE NR_PEDIDO = X;
  
  IF N1 = N2 THEN
        return 1;
  ELSE
        return 2;
  END IF;
EXCEPTION
WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20001,'Produto ' || X || ' Não Encontrado');
END;

select fnc_X from dual;

--CURSOR
Declare
  cursor c_depto is
  select nm_depto
    from loc_depto;
    
    v_depto c_depto%rowtype;
Begin
  open c_depto;
  loop
    fetch c_depto into v_depto;
      exit when c_depto%notfound;
      dbms_output.put_line(v_depto.nm_depto);
  end loop;
  close c_depto;
end;

--FUNCTION
CREATE OR REPLACE FUNCTION FNC_NOME_FUNC(P_CD_FUNC LOC_FUNCIONARIO.CD_FUNC%TYPE)
                                      RETURN VARCHAR2 IS
  V_NOME LOC_FUNCIONARIO.NM_FUNC%TYPE;
BEGIN
  SELECT NM_FUNC
    INTO V_NOME
      FROM LOC_FUNCIONARIO
    WHERE CD_FUNC = P_CD_FUNC;
  RETURN V_NOME;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    PRC_LOG_AUTONOMOUS('TENTATIVA COM O FUNCIONÁRIO ' || P_CD_FUNC);
    RETURN 'KEK';
  WHEN TOO_MANY_ROWS THEN
    RETURN 'LUL';
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, 'ERRO: ' || SQLERRM);
END;

SELECT FNC_NOME_FUNC(1000) FROM DUAL;
SELECT * FROM TESTE_AUTONOMOUS;

CREATE OR REPLACE PROCEDURE PRC_DADOS_DEPTO IS
  cursor c_depto is
  select nm_depto
    from loc_depto;
    
    v_depto c_depto%rowtype;
Begin
  open c_depto;
  loop
    fetch c_depto into v_depto;
      exit when c_depto%notfound;
      --INSERT, UPDATE, DELETE, OUTRO CURSOR
      dbms_output.put_line(v_depto.nm_depto);
  end loop;
  close c_depto;
end;

BEGIN
  PRC_DADOS_DEPTO;
END;

--CREATE OR REPLACE PACKAGE PKG_REV_2TDSR IS
--END;

--CREATE OR REPLACE PACKAGE BODY PKG_REV_2TDSR  
--END;

CREATE TABLE TESTE_AUTONOMOUS(DATA_EVENTO DATE, EVENTO VARCHAR2(100));

CREATE OR REPLACE PROCEDURE PRC_LOG_AUTONOMOUS
  (P_EVENTO TESTE_AUTONOMOUS.EVENTO%TYPE) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  INSERT INTO TESTE_AUTONOMOUS VALUES(SYSDATE,P_EVENTO);
  COMMIT;
END;