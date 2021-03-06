CREATE OR REPLACE VIEW VW_USUARIO_ATIVO AS
 (Select idn cod_func, nome, doc_identificacao
    FROM TAB_FUNCIONARIO
    WHERE DT_DEMISSAO IS NULL);
SELECT * FROM VW_USUARIO_ATIVO;
  
CREATE OR REPLACE VIEW VW_TOTAL_SALARIO AS
  (Select SUM(VL_SALARIO_ATUAL) "Total_Salario"
    FROM TAB_FUNCIONARIO
      WHERE DT_DEMISSAO IS NULL);
SELECT * FROM VW_TOTAL_SALARIO;
    
CREATE OR REPLACE VIEW VW_QTD_FUNC AS
  (SELECT COUNT(1) "Qtd_Func"
    FROM TAB_FUNCIONARIO
      WHERE DT_DEMISSAO IS NULL);
SELECT * FROM VW_QTD_FUNC;
      
CREATE OR REPLACE VIEW VW_NOME_FUNC AS
  (SELECT substr(nome, 0, instr(nome,' ')-1) Primeiro_Nome
    FROM TAB_FUNCIONARIO);
SELECT * FROM VW_NOME_FUNC;
    