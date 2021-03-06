--CURSOR EXPLICITO
CREATE OR REPLACE
FUNCTION FNC_QTD_CLIENTES
RETURN NUMBER IS
  CURSOR C_QTD IS
    SELECT COUNT(1) QTD
      FROM CLIENTE_ERP;
      
      V_QTD C_QTD%ROWTYPE;
BEGIN
  OPEN C_QTD;
  LOOP
    FETCH C_QTD INTO V_QTD;
    EXIT WHEN C_QTD%NOTFOUND;
  END LOOP;
  CLOSE C_QTD;
  RETURN V_QTD.QTD;
END;

--CURSOR IMPLICITO
CREATE OR REPLACE
FUNCTION FNC_QTD_CLIENTES
RETURN NUMBER IS
  V_QTD NUMBER;
BEGIN
  SELECT COUNT(1) INTO V_QTD
    FROM CLIENTE_ERP;
  RETURN V_QTD;
END;


SELECT FNC_QTD_CLIENTES FROM DUAL;

--EXERCICIO
CREATE OR REPLACE
  FUNCTION FNC_IS_GERENTE(P_CD_FUNC PF0064.LOC_FUNCIONARIO.CD_FUNC%TYPE)
RETURN VARCHAR2 IS
  V_NOME_GER VARCHAR2(1000);
BEGIN
  SELECT G.NM_FUNC INTO V_NOME_GER
  FROM PF0064.LOC_FUNCIONARIO F, PF0064.LOC_FUNCIONARIO G 
  WHERE F.CD_GERENTE = G.CD_FUNC
    AND F.CD_FUNC = 22;
  RETURN V_NOME_GER;
END;

SELECT FNC_IS_GERENTE(22) GERENTE FROM DUAL;
