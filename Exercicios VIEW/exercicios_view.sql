CREATE OR REPLACE VIEW VW_USUARIO_ATIVO AS
 (Select idn cod_func, nome, doc_identificacao
    FROM TAB_FUNCIONARIO
    WHERE DT_DEMISSAO IS NULL);
SELECT * FROM VW_USUARIO_ATIVO;
  
CREATE OR REPLACE VIEW VW_TOTAL_SALARIO AS
  (Select SUM(VL_SALARIO_ATUAL) TOTAL_SALARIO
    FROM TAB_FUNCIONARIO);
SELECT * FROM VW_TOTAL_SALARIO;
    
CREATE OR REPLACE VIEW VW_QTD_FUNC AS
  (SELECT COUNT(IDN) QTD_FUNC
    FROM TAB_FUNCIONARIO
      WHERE DT_DEMISSAO IS NULL);
SELECT * FROM QT_QTD_FUNC;
      
CREATE OR REPLACE VIEW VW_NOME_FUNC AS
  (SELECT substr(nome, 1, instr(nome,' ')-1) PRIMEIRO_NOME
    FROM TAB_FUNCIONARIO);
SELECT * FROM VW_NOME_FUNC;
    