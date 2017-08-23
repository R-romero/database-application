DROP TABLE LOC_AGENCIA_BANCO CASCADE CONSTRAINTS;

DROP TABLE LOC_ENDERECO_PROPRIETARIO CASCADE CONSTRAINTS;

DROP TABLE LOC_ENDERECO_CLIENTE CASCADE CONSTRAINTS;

DROP TABLE LOC_MOVTO_COMISSAO CASCADE CONSTRAINTS;

DROP TABLE LOC_MOVTO_COBRANCA CASCADE CONSTRAINTS;

DROP TABLE LOC_DUPLICATA CASCADE CONSTRAINTS;

DROP TABLE LOC_NF_LOCACAO_ITEM CASCADE CONSTRAINTS;

DROP TABLE LOC_NF_LOCACAO CASCADE CONSTRAINTS;

DROP TABLE LOC_CFO CASCADE CONSTRAINTS;

DROP TABLE LOC_COND_PARCELAS CASCADE CONSTRAINTS;

DROP TABLE LOC_COND_PAGTO CASCADE CONSTRAINTS;

DROP TABLE LOC_RESERVA CASCADE CONSTRAINTS;

DROP TABLE LOC_ITEM_LOCACAO CASCADE CONSTRAINTS;

DROP TABLE LOC_PEDIDO_LOCACAO CASCADE CONSTRAINTS;

DROP TABLE LOC_AGENCIA CASCADE CONSTRAINTS;

DROP TABLE LOC_IMPOSTOS CASCADE CONSTRAINTS;

DROP TABLE LOC_CIDADE CASCADE CONSTRAINTS;

DROP TABLE LOC_OPERADORA_DDD CASCADE CONSTRAINTS;

DROP TABLE LOC_DDD_PREFIXO CASCADE CONSTRAINTS;

DROP TABLE LOC_DDD CASCADE CONSTRAINTS;

DROP TABLE LOC_PREFIXO CASCADE CONSTRAINTS;

DROP TABLE LOC_OPERADORA CASCADE CONSTRAINTS;

DROP TABLE LOC_FUNCIONARIO CASCADE CONSTRAINTS;

DROP TABLE LOC_DEPTO CASCADE CONSTRAINTS;

DROP TABLE LOC_CLIENTE CASCADE CONSTRAINTS;

DROP TABLE LOC_FOTOS_VEICULO CASCADE CONSTRAINTS;

DROP TABLE LOC_VEICULO CASCADE CONSTRAINTS;

DROP TABLE LOC_GRUPO CASCADE CONSTRAINTS;

DROP TABLE LOC_PROPRIETARIO CASCADE CONSTRAINTS;

DROP TABLE LOC_MOVTO_TRANSACAO CASCADE CONSTRAINTS;

DROP TABLE LOC_ESTADO CASCADE CONSTRAINTS;

DROP TABLE LOC_CLI_FISICA CASCADE CONSTRAINTS;

DROP TABLE LOC_CLI_JURIDICA CASCADE CONSTRAINTS;

DROP TABLE LOC_OPERADORA_CARTAO CASCADE CONSTRAINTS;

DROP TABLE LOC_BANCO CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_LOC_MOVTO_TRANSACAO;

DROP SEQUENCE SEQ_LOC_DDD;

DROP SEQUENCE SEQ_LOC_CLI;

DROP SEQUENCE SEQ_LOC_PEDIDO_LOCACAO;


CREATE TABLE LOC_BANCO (
       CD_BANCO             NUMBER(4) 		NOT NULL,
       NM_BANCO             VARCHAR2(80) 	NOT NULL,
	   URL                  VARCHAR2(50)
);

ALTER TABLE LOC_BANCO
       ADD CONSTRAINT PK_BANCO PRIMARY KEY (CD_BANCO);

CREATE TABLE LOC_AGENCIA_BANCO (
       CD_AGENCIA           NUMBER(8) 		NOT NULL,
       END_AGENCIA          VARCHAR2(30) 	NOT NULL,
       CEP                  NUMBER(8) 		NOT NULL,
       NUMERO               NUMBER(4) 		NOT NULL,
       APELIDO              VARCHAR2(30) 	NULL,
       CD_BANCO             NUMBER(4) 		NOT NULL
);

ALTER TABLE LOC_AGENCIA_BANCO
       ADD CONSTRAINT PK_LOC_AGENCIA_BANCO PRIMARY KEY (CD_AGENCIA, CD_BANCO);

CREATE TABLE LOC_CFO (
       CFOP                 NUMBER(4) 		NOT NULL,
       DESC_CFO             VARCHAR2(400) 	NOT NULL,
       APLICACAO            VARCHAR2(2000) 	NULL
);

ALTER TABLE LOC_CFO
       ADD CONSTRAINT PK_LOC_CFO PRIMARY KEY (CFOP);

CREATE TABLE LOC_CIDADE (
       CD_CIDADE            NUMBER(8) 		NOT NULL,
       NM_CIDADE            VARCHAR2(40) 	NOT NULL,
       CD_ESTADO            VARCHAR2(2) 	NOT NULL
);

ALTER TABLE LOC_CIDADE
       ADD CONSTRAINT PK_LOC_CIDADE PRIMARY KEY (CD_CIDADE, CD_ESTADO);

CREATE TABLE LOC_AGENCIA (
       CD_CIDADE            NUMBER(8) 		NOT NULL,
       CD_AGENCIA           NUMBER(8) 		NOT NULL,
       NM_LOGRADOURO        VARCHAR2(40) 	NOT NULL,
       NM_BAIRRO            VARCHAR2(30) 	NOT NULL,
       NUMERO               NUMBER(4) 		NOT NULL,
       CD_ESTADO            VARCHAR2(2) 	NOT NULL
);

ALTER TABLE LOC_AGENCIA
       ADD  CONSTRAINT PK_LOC_AGENCIA PRIMARY KEY (CD_CIDADE, CD_AGENCIA, CD_ESTADO);

CREATE TABLE LOC_CLI_FISICA (
       CD_CLIENTE           NUMBER(8) 		NOT NULL,
       NR_CPF               NUMBER(12) 		NOT NULL,
       NR_HABILITACAO       NUMBER(18) 		NULL,
       DT_NASCIMENTO        DATE 			NULL,
       NR_RG                NUMBER(10) 		NOT NULL,
       TIT_ELEITOR          NUMBER(15) 		
);

ALTER TABLE LOC_CLI_FISICA
       ADD CONSTRAINT PK_LOC_CLI_FISICA PRIMARY KEY (CD_CLIENTE);

CREATE TABLE LOC_CLI_JURIDICA (
       CD_CLIENTE           NUMBER(8) 		NOT NULL,
       NR_CNPJ              NUMBER(14) 		NOT NULL,
       INS_ESTADUAL         NUMBER(18) 		NULL,
       DT_FUNDACAO          DATE 		NULL,
       INS_MUNICIPAL        NUMBER(15) 		NOT NULL,
       NM_FANTASIA          VARCHAR2(20) 	NOT NULL
);

ALTER TABLE LOC_CLI_JURIDICA
       ADD CONSTRAINT PK_LOC_CLI_JURIDICA PRIMARY KEY (CD_CLIENTE);

CREATE TABLE LOC_CLIENTE (
       CD_CLIENTE           NUMBER(8) 		NOT NULL,
	   NM_CLIENTE           VARCHAR2(50)    NOT NULL,
       TP_CLIENTE           VARCHAR2(1) 	NOT NULL,
       NR_ESTRELAS          NUMBER(2) 		NULL,
       TELEFONE             VARCHAR2(15) 	NULL,
       FAX                  VARCHAR2(15) 	NULL,
	   NR_HABILITACAO       NUMBER(12)      NULL
);

ALTER TABLE LOC_CLIENTE
       ADD CONSTRAINT PK_LOC_CLIENTE PRIMARY KEY (CD_CLIENTE);

ALTER TABLE LOC_CLIENTE
       ADD CONSTRAINT CK_TP_CLIENTE CHECK (TP_CLIENTE IN ('F','J'));

	   
CREATE TABLE LOC_COND_PAGTO (
       CD_CONDICAO          NUMBER(8) 		NOT NULL,
       DESC_CONDICAO        VARCHAR2(30) 	NOT NULL
);

ALTER TABLE LOC_COND_PAGTO
       ADD CONSTRAINT PK_LOC_COND_PAGTO PRIMARY KEY (CD_CONDICAO);

CREATE TABLE LOC_COND_PARCELAS (
       CD_CONDICAO          NUMBER(8) 		NOT NULL,
       CD_PARCELA           NUMBER(8) 		NOT NULL,
       DESC_COND_PARC       VARCHAR2(40) 	NOT NULL,
       QTD_DIAS             NUMBER(4) 		NOT NULL
);

ALTER TABLE LOC_COND_PARCELAS
       ADD CONSTRAINT PK_LOC_COND_PARCELAS PRIMARY KEY (CD_CONDICAO, CD_PARCELA);


CREATE TABLE LOC_DDD (
       CD_DDD               NUMBER(3) 		NOT NULL,
	   SEQ_DDD              NUMBER(5)       NOT NULL,   
	   ESTADO_DDD           VARCHAR2(2)     NOT NULL,
       CIDADE_DDD           VARCHAR2(40) 	NOT NULL
);

ALTER TABLE LOC_DDD
       ADD CONSTRAINT PK_LOC_DDD PRIMARY KEY (CD_DDD, SEQ_DDD, ESTADO_DDD);

CREATE TABLE LOC_DDD_PREFIXO (
       CD_PREFIXO           NUMBER(4) 		NOT NULL,
       CD_DDD               NUMBER(3) 		NOT NULL,
	   SEQ_DDD              NUMBER(5)       NOT NULL,
	   ESTADO_DDD           VARCHAR2(2)     NOT NULL
);

ALTER TABLE LOC_DDD_PREFIXO
       ADD CONSTRAINT PK_LOC_DDD_PREFIXO PRIMARY KEY (CD_PREFIXO, CD_DDD, SEQ_DDD, ESTADO_DDD);

CREATE TABLE LOC_DEPTO (
       CD_DEPTO             NUMBER(5) 		NOT NULL,
       NM_DEPTO             VARCHAR(40) 	NULL
);

ALTER TABLE LOC_DEPTO
       ADD CONSTRAINT PK_LOC_DEPTO PRIMARY KEY (CD_DEPTO);

CREATE TABLE LOC_DUPLICATA (
       NR_NOTA              NUMBER(6) 		NOT NULL,
       CD_DUPLICATA         NUMBER(8) 		NOT NULL,
       VL_DUPLICATA         NUMBER(10,2) 	NOT NULL,
       DT_VENCTO            DATE 			NOT NULL,
       DT_PAGTO             DATE 			NULL,
       PERC_DESCTO          NUMBER(2) 		NOT NULL,
       DT_PAGTO_DESCTO      DATE 			NOT NULL,
       VL_DESCTO            NUMBER(10,2) 	NOT NULL,
       NR_DIAS_ATRASO       NUMBER(3) 		NULL,
       SITUACAO             VARCHAR2(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE LOC_DUPLICATA
       ADD CONSTRAINT PK_LOC_DUPLICATA PRIMARY KEY (NR_NOTA, CD_DUPLICATA);

ALTER TABLE LOC_DUPLICATA
       ADD CONSTRAINT CK_SITUACAO CHECK (SITUACAO IN ('A', 'C', 'L'));

CREATE TABLE LOC_ENDERECO_CLIENTE (
       CD_END_CLI           NUMBER(5) 		NOT NULL,
       LOGRADOURO           VARCHAR2(60) 	NOT NULL,
       BAIRRO               VARCHAR2(40) 	NOT NULL,
       CEP                  NUMBER(8) 		NOT NULL,
       TP_ENDERECO          VARCHAR2(1) 	NOT NULL,
       CD_CLIENTE           NUMBER(8) 		NOT NULL,
       CD_CIDADE            NUMBER(8) 		NULL,
       CD_ESTADO            VARCHAR2(2) 	NULL,
       NUMERO               NUMBER(8) 		NULL,
       COMPLEMENTO          VARCHAR2(50) 	NULL
);

ALTER TABLE LOC_ENDERECO_CLIENTE
       ADD CONSTRAINT PK_LOC_ENDERECO_CLIENTE PRIMARY KEY (CD_END_CLI, CD_CLIENTE);

ALTER TABLE LOC_ENDERECO_CLIENTE
       ADD CONSTRAINT CK_TP_ENDERECO_CLIENTE CHECK (TP_ENDERECO IN ('C', 'R', 'E'));

CREATE TABLE LOC_ENDERECO_PROPRIETARIO (
       CD_ENDERECO_PROP     NUMBER(3) 		NOT NULL,
       LOGRADOURO           VARCHAR2(60) 	NOT NULL,
       CD_PROPRIETARIO      NUMBER(10) 		NOT NULL,
       CEP                  NUMBER(8) 		NOT NULL,
       BAIRRO               VARCHAR2(40) 	NOT NULL,
       TP_ENDERECO          VARCHAR2(1) 	NOT NULL,
       CD_CIDADE            NUMBER(8) 		NULL,
       COMPLEMENTO          VARCHAR2(60) 	NULL,
       CD_ESTADO            VARCHAR2(2) 	NULL
);

ALTER TABLE LOC_ENDERECO_PROPRIETARIO
       ADD CONSTRAINT PK_LOC_ENDERECO_PROPRIETARIO PRIMARY KEY (CD_ENDERECO_PROP, CD_PROPRIETARIO);

ALTER TABLE LOC_ENDERECO_PROPRIETARIO
       ADD CONSTRAINT CK_TP_ENDERECO_PROPRIETARIO CHECK (TP_ENDERECO IN ('C', 'R'));

CREATE TABLE LOC_ESTADO (
       CD_ESTADO            VARCHAR2(2) 	NOT NULL,
       NM_ESTADO            VARCHAR2(30) 		NULL
);

ALTER TABLE LOC_ESTADO
       ADD CONSTRAINT LOC_ESTADO PRIMARY KEY (CD_ESTADO);

CREATE TABLE LOC_FOTOS_VEICULO (
       NR_PLACA             VARCHAR2(7) 	NOT NULL,
       NR_FOTO              NUMBER(3) 		NOT NULL,
       FOTO                 BLOB 			NULL
);

ALTER TABLE LOC_FOTOS_VEICULO
       ADD CONSTRAINT PK_LOC_FOTOS_VEICULO PRIMARY KEY (NR_PLACA, NR_FOTO);

CREATE TABLE LOC_FUNCIONARIO (
       CD_FUNC              NUMBER(5) 		NOT NULL,
       NM_FUNC              VARCHAR2(40) 	NULL,
       DT_INICIO            DATE 			NULL,
       CD_GERENTE           NUMBER(5) 		NULL,
       NR_CPF               NUMBER(12) 		NULL,
       VL_SALARIO           NUMBER(11,2) 	NULL,
       VL_PERC_COMISSAO     NUMBER(11,2) 	NULL,
       CD_DEPTO             NUMBER(5) 		NOT NULL,
       NR_ESTRELAS          NUMBER(1)
);

ALTER TABLE LOC_FUNCIONARIO
       ADD CONSTRAINT PK_LOC_FUNCIONARIO PRIMARY KEY (CD_FUNC);

CREATE TABLE LOC_GRUPO (
       CD_GRUPO             NUMBER(3) 		NOT NULL,
       DS_GRUPO             VARCHAR2(100) 	NOT NULL,
       VL_LOCACAO_DIARIA    NUMBER(8,2) 	NULL
);

ALTER TABLE LOC_GRUPO
       ADD CONSTRAINT PK_LOC_GRUPO PRIMARY KEY (CD_GRUPO);

CREATE TABLE LOC_IMPOSTOS (
       CD_IMPOSTO           VARCHAR2(4) 	NOT NULL,
       DT_INI_VIGENCIA      DATE 			NOT NULL,
       DT_FIN_VIGENCIA      DATE 			NULL,
       ALIQUOTA             NUMBER(2,2) 	NOT NULL,
       CD_CIDADE            NUMBER(8) 		NULL,
       CD_ESTADO            VARCHAR2(2) 	NULL
);

ALTER TABLE LOC_IMPOSTOS
       ADD CONSTRAINT PK_LOC_IMPOSTOS PRIMARY KEY (CD_IMPOSTO, DT_INI_VIGENCIA);

CREATE TABLE LOC_ITEM_LOCACAO (
       DT_RETIRADA          DATE 			NULL,
       NR_ITEM              NUMBER(5) 		NOT NULL,
       DT_ENTREGA           DATE 			NULL,
       QT_DIAS              NUMBER(3) 		NULL,
       VL_LOCACAO           NUMBER(11,2) 	NULL,
       NR_PLACA             VARCHAR2(7) 	NOT NULL,
       VL_TOTAL             NUMBER(11,2) 	NULL,
       NR_PEDIDO            NUMBER(8) 		NOT NULL
);

ALTER TABLE LOC_ITEM_LOCACAO
       ADD CONSTRAINT PK_LOC_ITEM_LOCACAO PRIMARY KEY (NR_PEDIDO, NR_ITEM);

create index idx_iloc1 on loc_item_locacao(dt_retirada);
create index idx_iloc2 on loc_item_locacao(dt_entrega);
create index idx_iloc3 on loc_item_locacao(qt_dias);
create index idx_iloc4 on loc_item_locacao(vl_locacao);
create index idx_iloc5 on loc_item_locacao(vl_total);


CREATE TABLE LOC_MOVTO_COBRANCA (
       CD_MOVTO             NUMBER(8) 		NOT NULL,
       DT_MVTO              DATE 			NOT NULL,
       VL_MOVTO             NUMBER(12,2) 	NOT NULL,
       DT_PAGTO             DATE 			NULL,
       NR_NOTA              NUMBER(6) 		NOT NULL,
       CD_DUPLICATA         NUMBER(8) 		NOT NULL,
       DEB_CRED             VARCHAR2(1) 	NOT NULL,
       CD_TRANSACAO         NUMBER(8) 		NOT NULL,
       TP_PAGTO             VARCHAR2(2) 	NOT NULL,
       NR_DOCTO_PAGTO       NUMBER(15) 		NULL,
       CD_OPERADORA         NUMBER(8) 		NULL,
       CD_BANCO             NUMBER(4) 		NULL
);

ALTER TABLE LOC_MOVTO_COBRANCA
       ADD CONSTRAINT PK_LOC_MOVTO_COBRANCA PRIMARY KEY (CD_MOVTO, NR_NOTA, CD_DUPLICATA);

ALTER TABLE LOC_MOVTO_COBRANCA
       ADD CONSTRAINT CK_DEB_CRED CHECK (DEB_CRED IN ('D', 'C'));

ALTER TABLE LOC_MOVTO_COBRANCA
       ADD CONSTRAINT CK_TP_PAGTO CHECK (TP_PAGTO IN ('BB', 'CH', 'DI', 'DC', 'NP',  'CC'));

CREATE TABLE LOC_MOVTO_COMISSAO (
       CD_MOVTO_COB         NUMBER(8) 		NOT NULL,
       CD_MOVTO             NUMBER(8) 		NOT NULL,
       NR_NOTA              NUMBER(6) 		NOT NULL,
       CD_DUPLICATA         NUMBER(8) 		NOT NULL,
       DEB_CRED             VARCHAR2(1) 	NOT NULL,
       CD_FUNC              NUMBER(5) 		NOT NULL,
       VL_COMISSAO          NUMBER(10,2) 	NOT NULL,
       PERC_COMISSAO        NUMBER(10,2) 	NOT NULL
);

ALTER TABLE LOC_MOVTO_COMISSAO
       ADD CONSTRAINT PK_LOC_MOVTO_COMISSAO PRIMARY KEY (CD_MOVTO_COB);

ALTER TABLE LOC_MOVTO_COMISSAO
       ADD CONSTRAINT CK_DEB_CRED_MOVTO_COMISSAO CHECK (DEB_CRED IN ('D', 'C'));

CREATE TABLE LOC_MOVTO_TRANSACAO (
       CD_TRANSACAO         NUMBER(8) 		NOT NULL,
       DESC_TRANSACAO       VARCHAR2(30) 	NOT NULL,
       DEB_CRED             VARCHAR2(1) 	NOT NULL
                                   CHECK (DEB_CRED IN ('D', 'C')),
       STATUS_TRANSACAO     VARCHAR2(1) 	NOT NULL
                                   CHECK (STATUS_TRANSACAO IN ('A','I'))
);

ALTER TABLE LOC_MOVTO_TRANSACAO
       ADD CONSTRAINT PK_LOC_MOVTO_TRANSACAO PRIMARY KEY (CD_TRANSACAO);

ALTER TABLE LOC_MOVTO_TRANSACAO
       ADD CONSTRAINT CK_DEB_CRED_MOVTO_TRANSACAO CHECK (DEB_CRED IN ('D', 'C'));
	   
	   
CREATE TABLE LOC_NF_LOCACAO (
       NR_NOTA              NUMBER(6) 		NOT NULL,
       NR_PEDIDO            NUMBER(8) 		NOT NULL,
       ENDERECO             VARCHAR2(40) 	NOT NULL,
       BAIRRO               VARCHAR2(40) 	NOT NULL,
       CIDADE               VARCHAR2(40) 	NOT NULL,
       ESTADO               VARCHAR2(2) 	NOT NULL,
       CEP                  NUMBER(8) 		NOT NULL,
       VL_TOTAL_NF          NUMBER(12,2) 	NULL,
       CD_CONDICAO          NUMBER(8) 		NOT NULL,
       DT_EMISSAO           DATE 			NOT NULL,
       DT_SAIDA             DATE 			NULL,
       CFOP                 NUMBER(4) 		NOT NULL
);


ALTER TABLE LOC_NF_LOCACAO
       ADD CONSTRAINT PK_LOC_NF_LOCACAO PRIMARY KEY (NR_NOTA);


CREATE TABLE LOC_NF_LOCACAO_ITEM (
       NR_NOTA              NUMBER(6) 		NOT NULL,
       NR_PLACA             VARCHAR2(7) 	NOT NULL,
       VL_UNITARIO          NUMBER(10,2) 	NOT NULL,
       DESC_PRODUTO         VARCHAR2(45)	NOT NULL,
       QUANTIDADE           NUMBER(3) 		NOT NULL,
       VL_TOTAL             NUMBER(10,2) 	NOT NULL,
       ALIQ_ICMS            NUMBER(2) 		NULL
);


ALTER TABLE LOC_NF_LOCACAO_ITEM
       ADD CONSTRAINT PK_LOC_NF_LOCACAO_ITAM PRIMARY KEY (NR_NOTA, NR_PLACA);


CREATE TABLE LOC_OPERADORA (
       CD_OPERADORA         NUMBER(4) 		NOT NULL,
       NM_OPERADORA         VARCHAR2(40) 	NOT NULL
);

ALTER TABLE LOC_OPERADORA
       ADD CONSTRAINT PK_LOC_OPERADORA PRIMARY KEY (CD_OPERADORA);


CREATE TABLE LOC_OPERADORA_CARTAO (
       CD_OPERADORA         NUMBER(8) 		NOT NULL,
       NM_OPERADORA         VARCHAR2(50) 	NOT NULL
);

ALTER TABLE LOC_OPERADORA_CARTAO
       ADD CONSTRAINT PK_LOC_OPERADORA_CARTAO PRIMARY KEY (CD_OPERADORA);


CREATE TABLE LOC_OPERADORA_DDD (
       CD_OPERADORA         NUMBER(4) 		NOT NULL,
       CD_DDD               NUMBER(3) 		NOT NULL,
       SEQ_DDD              NUMBER(5) 		NOT NULL,
       ESTADO_DDD           VARCHAR2(2) 	NOT NULL
);

ALTER TABLE LOC_OPERADORA_DDD
       ADD  CONSTRAINT PK_LOC_OPERADORA_DDD PRIMARY KEY (CD_OPERADORA, cd_ddd, SEQ_DDD, ESTADO_DDD);

	   
CREATE TABLE LOC_PEDIDO_LOCACAO (
       CD_CLIENTE           NUMBER(8) 		NOT NULL,
       NR_PEDIDO            NUMBER(8) 		NOT NULL,
       DT_LOCACAO           DATE 		NOT NULL,
       QT_DIAS              NUMBER(5) 		NULL,
       VL_TOTAL             NUMBER(10,2) 	NULL,
       STATUS               VARCHAR2(2) 	NULL,
       TP_PAGTO             VARCHAR2(2) 	NULL,
       DT_RETIRADA          DATE 		NULL,
       DT_ENTREGA           DATE 		NULL,
       CD_FUNC              NUMBER(5) 		NULL,
       CD_CIDADE            NUMBER(8) 		NULL,
       CD_AGENCIA           NUMBER(8) 		NULL,
       CD_ESTADO            VARCHAR2(2) 	NULL
);

ALTER TABLE LOC_PEDIDO_LOCACAO
       ADD CONSTRAINT PK_LOC_PEDIDO_LOCACAO PRIMARY KEY (NR_PEDIDO);

ALTER TABLE LOC_PEDIDO_LOCACAO
       ADD CONSTRAINT CK_STATUS CHECK (STATUS IN ('PG', 'AB', 'CC','IN'));

ALTER TABLE LOC_PEDIDO_LOCACAO
       ADD CONSTRAINT CK_TP_PAGTO_LOCACAO CHECK (TP_PAGTO IN ('BB', 'CH', 'DI', 'DC', 'NP',  'CC'));

	   
CREATE TABLE LOC_PREFIXO (
       CD_PREFIXO           NUMBER(8) 		NOT NULL,
       DESC_PREFIXO         VARCHAR2(30) 	NOT NULL
);

ALTER TABLE LOC_PREFIXO
       ADD CONSTRAINT PK_LOC_PREFIXO PRIMARY KEY (CD_PREFIXO);

CREATE TABLE LOC_PROPRIETARIO (
       CD_PROPRIETARIO      NUMBER(10) 		NOT NULL,
       NOME_PROPRIETARIO    VARCHAR2(50) 	NOT NULL,
       TP_PROPRIETARIO      VARCHAR2(1) 	NULL,
       TELEFONE             VARCHAR2(25) 	NULL,
       NR_CPF               NUMBER(12) 		NULL,
       NR_CGC               NUMBER(15) 		NULL,
       DS_EMAIL		    VARCHAR2(80)	NULL
);

ALTER TABLE LOC_PROPRIETARIO
       ADD CONSTRAINT PK_LOC_PROPRIETARIO PRIMARY KEY (CD_PROPRIETARIO);

ALTER TABLE LOC_PROPRIETARIO
       ADD CONSTRAINT CK_TP_PROPRIETARIO CHECK (TP_PROPRIETARIO IN ('F', 'J'));

CREATE TABLE LOC_RESERVA (
       DT_RESERVA           DATE 			NOT NULL,
       DT_RETIRADA          DATE 			NOT NULL,
       NR_PLACA             VARCHAR2(7) 	NOT NULL,
       NR_CARTAO_CREDITO    NUMBER(18) 		NULL,
       DT_INICIO_LOCACAO    DATE 			NOT NULL,
       DT_FIM_LOCACAO       DATE 			NOT NULL,
       CD_OPERADORA         NUMBER(8) 		NOT NULL,
       NM_CLIENTE           VARCHAR2(50) 	NOT NULL,
       HORA_RETIDADA        DATE 			NOT NULL,
       CIDADE_RETIRADA      VARCHAR2(20) 	NULL,
       STATUS               VARCHAR2(1) 	NOT NULL,
       CIDADE_DEVOLUCAO     VARCHAR2(20) 	NOT NULL,
       ENDERECO             VARCHAR2(50) 	NOT NULL,
       BAIRRO               VARCHAR2(40) 	NOT NULL,
       CIDADE               VARCHAR2(40) 	NOT NULL,
       ESTADO               VARCHAR2(30) 	NOT NULL,
       CEP                  NUMBER(8) 		NOT NULL,
       NR_HABILITACAO       NUMBER(18) 		NOT NULL,
       DT_NASCIMENTO        DATE		 	NOT NULL,
       TP_CLIENTE           VARCHAR2(1) 	NOT NULL,
       CPF_CNPJ             NUMBER(15) 		NOT NULL,
       CD_CIDADE            NUMBER(8) 		NULL,
       CD_AGENCIA           NUMBER(8) 		NULL,
       CD_ESTADO            VARCHAR2(2) 	NULL
);

ALTER TABLE LOC_RESERVA
       ADD CONSTRAINT PK_LOC_RESERVA PRIMARY KEY (NR_PLACA, DT_RESERVA);

ALTER TABLE LOC_RESERVA
       ADD CONSTRAINT CK_STATUS_RESERVA CHECK (STATUS IN ('A','C','E'));

ALTER TABLE LOC_RESERVA
       ADD CONSTRAINT CK_TP_CLIENTE_RESERVA CHECK (TP_CLIENTE IN ('F', 'J'));
	   
	   
CREATE TABLE LOC_VEICULO (
       NR_PLACA             VARCHAR2(7) 	NOT NULL,
       CD_PROPRIETARIO      NUMBER(10) 		NOT NULL,
       NR_CHASSIS           VARCHAR2(40) 	    NULL,
       STATUS               VARCHAR2(1) 	NOT NULL,
       TIPO_AUTOMOVEL       VARCHAR2(4) 	NULL,
       KM_ATUAL             NUMBER(10) 		NULL,
       COMBUSTIVEL          VARCHAR2(10) 	NULL,
       MODELO               VARCHAR2(30) 	NULL,
       COR                  VARCHAR2(15) 	NULL,
       CD_GRUPO             NUMBER(3) 		NOT NULL
);


ALTER TABLE LOC_VEICULO
       ADD CONSTRAINT PK_LOC_VEICULO PRIMARY KEY (NR_PLACA);

ALTER TABLE LOC_VEICULO
       ADD CONSTRAINT CK_STATUS_VEICULO CHECK (STATUS IN ('L', 'M', 'A','I'));
	   
	   
ALTER TABLE LOC_AGENCIA
       ADD CONSTRAINT FK_LOC_AGECID FOREIGN KEY (CD_CIDADE, CD_ESTADO)
                             REFERENCES LOC_CIDADE;


ALTER TABLE LOC_AGENCIA_BANCO
       ADD CONSTRAINT FK_LOC_AGEBAN FOREIGN KEY (CD_BANCO)
                             REFERENCES LOC_BANCO;


ALTER TABLE LOC_CIDADE
       ADD CONSTRAINT FK_LOC_CIDEST FOREIGN KEY (CD_ESTADO)
                             REFERENCES LOC_ESTADO;


ALTER TABLE LOC_CLI_FISICA
       ADD CONSTRAINT FK_LOC_FISCLI FOREIGN KEY (CD_CLIENTE)
                             REFERENCES LOC_CLIENTE;


ALTER TABLE LOC_CLI_JURIDICA
       ADD CONSTRAINT FK_LOC_JURCLI FOREIGN KEY (CD_CLIENTE)
                             REFERENCES LOC_CLIENTE;


ALTER TABLE LOC_COND_PARCELAS
       ADD CONSTRAINT FK_LOC_PARPAG FOREIGN KEY (CD_CONDICAO)
                             REFERENCES LOC_COND_PAGTO;

ALTER TABLE LOC_DDD_PREFIXO
       ADD CONSTRAINT FK_LOC_PREDDD FOREIGN KEY (CD_DDD, SEQ_DDD, ESTADO_DDD)
                             REFERENCES LOC_DDD;

ALTER TABLE LOC_DDD_PREFIXO
       ADD CONSTRAINT FK_LOC_PREPRE FOREIGN KEY (CD_PREFIXO)
                             REFERENCES LOC_PREFIXO;

ALTER TABLE LOC_DUPLICATA
       ADD CONSTRAINT FK_LOC_NF_DUPLOC FOREIGN KEY (NR_NOTA)
                             REFERENCES LOC_NF_LOCACAO;

ALTER TABLE LOC_ENDERECO_CLIENTE
       ADD CONSTRAINT FK_LOC_ENDCLI_CID FOREIGN KEY (CD_CIDADE, CD_ESTADO)
                             REFERENCES LOC_CIDADE;

ALTER TABLE LOC_ENDERECO_CLIENTE
       ADD CONSTRAINT FK_LOC_ENDCLI_CLI FOREIGN KEY (CD_CLIENTE)
                             REFERENCES LOC_CLIENTE;

ALTER TABLE LOC_ENDERECO_PROPRIETARIO
       ADD CONSTRAINT FK_LOC_END_PROCID FOREIGN KEY (CD_CIDADE, CD_ESTADO)
                             REFERENCES LOC_CIDADE;

ALTER TABLE LOC_ENDERECO_PROPRIETARIO
       ADD CONSTRAINT FK_LOC_END_PROP FOREIGN KEY (CD_PROPRIETARIO)
                             REFERENCES LOC_PROPRIETARIO;

ALTER TABLE LOC_FOTOS_VEICULO
       ADD CONSTRAINT FK_LOC_FOTVEI FOREIGN KEY (NR_PLACA)
                             REFERENCES LOC_VEICULO;

ALTER TABLE LOC_FUNCIONARIO
       ADD CONSTRAINT FK_LOC_FUNDEP FOREIGN KEY (CD_DEPTO)
                             REFERENCES LOC_DEPTO;

ALTER TABLE LOC_FUNCIONARIO
       ADD CONSTRAINT FK_LOC_FUNFUN FOREIGN KEY (CD_FUNC)
                             REFERENCES LOC_FUNCIONARIO;

ALTER TABLE LOC_IMPOSTOS
       ADD CONSTRAINT FK_LOC_IMPEST FOREIGN KEY (CD_ESTADO)
                             REFERENCES LOC_ESTADO;

ALTER TABLE LOC_IMPOSTOS
       ADD CONSTRAINT FK_LOC_IMPCID FOREIGN KEY (CD_CIDADE, CD_ESTADO)
                             REFERENCES LOC_CIDADE;

ALTER TABLE LOC_ITEM_LOCACAO
       ADD CONSTRAINT FK_LOC_ITLOC_PEDLOC FOREIGN KEY (NR_PEDIDO)
                             REFERENCES LOC_PEDIDO_LOCACAO;

ALTER TABLE LOC_ITEM_LOCACAO
       ADD CONSTRAINT FK_LOC_ITELOC_VEI FOREIGN KEY (NR_PLACA)
                             REFERENCES LOC_VEICULO;

ALTER TABLE LOC_MOVTO_COBRANCA
       ADD CONSTRAINT FK_LOC_MOVCOB_BANCO FOREIGN KEY (CD_BANCO)
                             REFERENCES LOC_BANCO;

ALTER TABLE LOC_MOVTO_COBRANCA
       ADD CONSTRAINT FK_LOC_MOVCOB_OPECART FOREIGN KEY (CD_OPERADORA)
                             REFERENCES LOC_OPERADORA_CARTAO;

ALTER TABLE LOC_MOVTO_COBRANCA
       ADD CONSTRAINT FK_LOC_MOVCOB_MOVTRAN FOREIGN KEY (CD_TRANSACAO)
                             REFERENCES LOC_MOVTO_TRANSACAO;

ALTER TABLE LOC_MOVTO_COBRANCA
       ADD CONSTRAINT FK_LOC_MOVCOB_LOCDUP FOREIGN KEY (NR_NOTA, CD_DUPLICATA)
                             REFERENCES LOC_DUPLICATA;

ALTER TABLE LOC_MOVTO_COMISSAO
       ADD CONSTRAINT FK_LOC_MOVCOM_LOCFUN FOREIGN KEY (CD_FUNC)
                             REFERENCES LOC_FUNCIONARIO;

ALTER TABLE LOC_MOVTO_COMISSAO
       ADD CONSTRAINT FK_LOC_MOVCOM_MOVCOB FOREIGN KEY (CD_MOVTO, NR_NOTA, CD_DUPLICATA)
                             REFERENCES LOC_MOVTO_COBRANCA;

ALTER TABLE LOC_NF_LOCACAO
       ADD CONSTRAINT FK_LOC_NFLOC_LOCCFO FOREIGN KEY (CFOP)
                             REFERENCES LOC_CFO;

ALTER TABLE LOC_NF_LOCACAO
       ADD CONSTRAINT FK_LOC_NFLOC_CONPAG FOREIGN KEY (CD_CONDICAO)
                             REFERENCES LOC_COND_PAGTO;

ALTER TABLE LOC_NF_LOCACAO
       ADD CONSTRAINT FK_LOC_NFLOC_PEDLOC FOREIGN KEY (NR_PEDIDO)
                             REFERENCES LOC_PEDIDO_LOCACAO;

ALTER TABLE LOC_NF_LOCACAO_ITEM
       ADD CONSTRAINT FK_LOC_NF_LOCITEM_LOCVEI FOREIGN KEY (NR_PLACA)
                             REFERENCES LOC_VEICULO;

ALTER TABLE LOC_NF_LOCACAO_ITEM
       ADD CONSTRAINT FK_LOC_NFLOC_ITEM_NFLOC FOREIGN KEY (NR_NOTA)
                             REFERENCES LOC_NF_LOCACAO;

ALTER TABLE LOC_OPERADORA_DDD
       ADD CONSTRAINT FK_LOC_OPEDDD_LOCDDD FOREIGN KEY (cd_ddd, seq_ddd, estado_ddd)
                             REFERENCES LOC_DDD;

ALTER TABLE LOC_OPERADORA_DDD
       ADD CONSTRAINT FK_LOC_OPEDDD_LOCOPE FOREIGN KEY (CD_OPERADORA)
                             REFERENCES LOC_OPERADORA;

ALTER TABLE LOC_PEDIDO_LOCACAO
       ADD CONSTRAINT FK_LOC_PEDLOC_LOCAGE FOREIGN KEY (CD_CIDADE, CD_AGENCIA, CD_ESTADO)
                             REFERENCES LOC_AGENCIA;

ALTER TABLE LOC_PEDIDO_LOCACAO
       ADD CONSTRAINT FK_LOC_PEDLOC_LOCFUN FOREIGN KEY (CD_FUNC)
                             REFERENCES LOC_FUNCIONARIO;

ALTER TABLE LOC_PEDIDO_LOCACAO
       ADD CONSTRAINT FK_LOC_PEDLOC_LOCCLI FOREIGN KEY (CD_CLIENTE)
                             REFERENCES LOC_CLIENTE;

ALTER TABLE LOC_RESERVA
       ADD CONSTRAINT FK_LOC_RES_LOCAGE FOREIGN KEY (CD_CIDADE, CD_AGENCIA, CD_ESTADO)
                             REFERENCES LOC_AGENCIA;

ALTER TABLE LOC_RESERVA
       ADD CONSTRAINT FK_LOC_RES_LOCOPE FOREIGN KEY (CD_OPERADORA)
                             REFERENCES LOC_OPERADORA;

ALTER TABLE LOC_RESERVA
       ADD CONSTRAINT FK_LOC_RES_LOCVEI FOREIGN KEY (NR_PLACA)
                             REFERENCES LOC_VEICULO;

ALTER TABLE LOC_VEICULO
       ADD CONSTRAINT FK_LOCVEI_LOCPRO FOREIGN KEY (CD_PROPRIETARIO)
                             REFERENCES LOC_PROPRIETARIO;

ALTER TABLE LOC_VEICULO
       ADD CONSTRAINT FK_LOCVEI_LOCGRU FOREIGN KEY (CD_GRUPO)
                             REFERENCES LOC_GRUPO;

CREATE SEQUENCE SEQ_LOC_MOVTO_TRANSACAO
 INCREMENT BY 1
 START WITH 0
 MAXVALUE 99999999999
 MINVALUE 0
 NOCYCLE
 NOCACHE
/

CREATE SEQUENCE SEQ_LOC_DDD
 INCREMENT BY 1
 START WITH 0
 MAXVALUE 99999999999
 MINVALUE 0
 NOCYCLE
 NOCACHE
/

CREATE SEQUENCE SEQ_LOC_CLI
 INCREMENT BY 1
 START WITH 0
 MAXVALUE 99999999999
 MINVALUE 0
 NOCYCLE
 NOCACHE
/

CREATE SEQUENCE SEQ_LOC_PEDIDO_LOCACAO
 INCREMENT BY 1
 START WITH 0
 MAXVALUE 99999999999
 MINVALUE 0
 NOCYCLE
 NOCACHE
/




-- Carregar Banco --
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (246 ,    'Banco ABC Brasil S.A. ', 'http://www.abcbrasil.com.br');
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (025 ,    'Banco Alfa S.A. ', 'http://www.bancoalfa.com.br');
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (641 ,    'Banco Alvorada S.A.',  null);
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (029 ,    'Banco Banerj S.A. ', 'http://www.banerj.com.br');
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (038 ,    'Banco Banestado S.A.  ', 'http://www.banestado.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (740 ,    'Banco Barclays S.A.  ', 'http://www.barclays.com'); 
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (107 ,    'Banco BBM S.A.  ', 'http://www.bbmbank.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (031 ,    'Banco Beg S.A.  ', 'http://www.itau.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (096 ,    'Banco BMF de Servi�os de Liquida��o e Cust�dia S.A  ', 'http://www.bmf.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (394 ,    'Banco BMC S.A.  ', 'http://www.bmc.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (318 ,    'Banco BMG S.A.  ', 'http://www.bancobmg.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (752 ,    'Banco BNP Paribas Brasil S.A.  ', 'http://www.bnpparibas.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (248 ,    'Banco Boavista Interatl�ntico S.A.', null);
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (036 ,    'Banco Bradesco BBI S.A.', null);
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (237 ,    'Banco Bradesco S.A.  ', 'http://www.bradesco.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (225 ,    'Banco Brascan S.A.  ', 'http://www.bancobrascan.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (044 ,    'Banco BVA S.A.  ', 'http://www.bancobva.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (263 ,    'Banco Cacique S.A.  ', 'http://www.bancocacique.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (222 ,    'Banco Calyon Brasil S.A.  ', 'http://www.calyon.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (040 ,    'Banco Cargill S.A.  ', 'http://www.bancocargill.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (745 ,    'Banco Citibank S.A.  ', 'http://www.citibank.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (215 ,    'Banco Comercial e de Investimento Sudameris S.A.  ', 'http://www.sudameris.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (756 ,    'Banco Cooperativo do Brasil S.A. - BANCOOB  ', 'http://www.bancoob.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (748 ,    'Banco Cooperativo Sicredi S.A.  ', 'http://www.sicredi.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (505 ,    'Banco Credit Suisse (Brasil) S.A.  ', 'http://www.csfb.com');
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (229 ,    'Banco Cruzeiro do Sul S.A.  ', 'http://www.bcsul.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (003 ,    'Banco da Amaz�nia S.A.  ', 'http://www.bancoamazonia.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (707 ,    'Banco Daycoval S.A.  ', 'http://www.daycoval.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (024 ,    'Banco de Pernambuco S.A. - BANDEPE  ', 'http://www.bandepe.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (456 ,    'Banco de Tokyo-Mitsubishi UFJ Brasil S.A.  ', 'http://www.btm.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (214 ,    'Banco Dibens S.A.  ', 'http://www.bancodibens.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (001 ,    'Banco do Brasil S.A.  ', 'http://www.bb.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (027 ,    'Banco do Estado de Santa Catarina S.A.  ', 'http://www.besc.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (047 ,    'Banco do Estado de Sergipe S.A.  ', 'http://www.banese.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (037 ,    'Banco do Estado do Par� S.A.  ', 'http://www.banparanet.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (041 ,    'Banco do Estado do Rio Grande do Sul S.A.  ', 'http://www.banrisul.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (004 ,    'Banco do Nordeste do Brasil S.A.  ', 'http://www.banconordeste.gov.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (265 ,    'Banco Fator S.A.  ', 'http://www.bancofator.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (224 ,    'Banco Fibra S.A.  ', 'http://www.bancofibra.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (175 ,    'Banco Finasa S.A.  ', 'http://www.finasa.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (252 ,    'Banco Fininvest S.A.  ', 'http://www.fininvest.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (233 ,    'Banco GE Capital S.A.  ', 'http://www.bancoge.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (734 ,    'Banco Gerdau S.A.  ', 'http://www.bancogerdau.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (612 ,    'Banco Guanabara S.A.  ', 'http://www.bcoguan.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (063 ,    'Banco Ibi S.A. Banco M�ltiplo  ', 'http://www.ibi.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (604 ,    'Banco Industrial do Brasil S.A.  ', 'http://www.bancoindustrial.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (320 ,    'Banco Industrial e Comercial S.A.  ', 'http://www.bicbanco.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (653 ,    'Banco Indusval S.A.  ', 'http://www.indusval.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (630 ,    'Banco Intercap S.A.  ', 'http://www.intercap.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (249 ,    'Banco Investcred Unibanco S.A.', null);
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (184 ,    'Banco Ita� BBA S.A.  ', 'http://www.itaubba.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (652 ,    'Banco Ita� Holding Financeira S.A.  ', 'http://www.itau.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (341 ,    'Banco Ita� S.A.  ', 'http://www.itau.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (479 ,    'Banco Ita�Bank S.A  ', 'http://www.bankboston.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (376 ,    'Banco J. P. Morgan S.A.  ', 'http://www.jpmorgan.com');
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (074 ,    'Banco J. Safra S.A.  ', 'http://www.jsafra.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (600 ,    'Banco Luso Brasileiro S.A.  ', 'http://www.lusobrasileiro.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (389 ,    'Banco Mercantil do Brasil S.A.  ', 'http://www.mercantil.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (755 ,    'Banco Merrill Lynch de Investimentos S.A.  ', 'http://www.ml.com');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (151 ,    'Banco Nossa Caixa S.A.  ', 'http://www.nossacaixa.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (045 ,    'Banco Opportunity S.A.  ', 'http://www.opportunity.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (623 ,    'Banco Panamericano S.A.  ', 'http://www.panamericano.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (611 ,    'Banco Paulista S.A.  ', 'http://www.bancopaulista.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (643 ,    'Banco Pine S.A.  ', 'http://www.bancopine.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (638 ,    'Banco Prosper S.A.  ', 'http://www.bancoprosper.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (747 ,    'Banco Rabobank International Brasil S.A.  ', 'http://www.rabobank.com');
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (356 ,    'Banco Real S.A.  ', 'http://www.bancoreal.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (633 ,    'Banco Rendimento S.A.  ', 'http://www.rendimento.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (072 ,    'Banco Rural Mais S.A.  ', 'http://www.rural.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (453 ,    'Banco Rural S.A.  ', 'http://www.rural.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (422 ,    'Banco Safra S.A.  ', 'http://www.safra.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (033 ,    'Banco Santander S.A.  ', 'http://www.santander.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (250 ,    'Banco Schahin S.A.  ', 'http://www.bancoschahin.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (749 ,    'Banco Simples S.A.  ', 'http://www.bancosimples.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (366 ,    'Banco Soci�t� G�n�rale Brasil S.A.  ', 'http://www.sgbrasil.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (637 ,    'Banco Sofisa S.A.  ', 'http://www.sofisa.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (464 ,    'Banco Sumitomo Mitsui Brasileiro S.A.  ', null);
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (634 ,    'Banco Tri�ngulo S.A.  ', 'http://www.tribanco.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (208 ,    'Banco UBS Pactual S.A.  ', 'http://www.pactual.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (116 ,    'Banco �nico S.A.  ', 'http://www.unibanco.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (655 ,    'Banco Votorantim S.A.  ', 'http://www.bancovotorantim.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (610 ,    'Banco VR S.A.  ', 'http://www.vr.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (370 ,    'Banco WestLB do Brasil S.A.  ', 'http://www.westlb.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (021 ,    'BANESTES S.A. Banco do Estado do Esp�rito Santo  ', 'http://www.banestes.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (719 ,    'Banif-Banco Internacional do Funchal (Brasil)S.A.  ', 'http://www.banif.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (204 ,    'Bankpar Banco Multiplo S.A..  ', 'http://www.iamex.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (073 ,    'BB Banco Popular do Brasil S.A.  ', 'http://www.bancopopulardobrasil.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (069 ,    'BPN Brasil Banco M�tiplo S.A.  ', 'http://www.bpnbrasil.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (070 ,    'BRB - Banco de Bras�lia S.A.  ', 'http://www.brb.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (104 ,    'Caixa Econ�mica Federal  ', 'http://www.caixa.gov.br');
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (477 ,    'Citibank N.A.  ', 'http://www.citibank.com/brasil');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (487 ,    'Deutsche Bank S.A. - Banco Alem�o  ', 'http://www.deutsche-bank.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (751 ,    'Dresdner Bank Brasil S.A. - Banco M�ltiplo  ', 'http://www.drkw.net');
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (062 ,    'Hipercard Banco M�ltiplo S.A.  ', 'http://www.banco1.net');
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (399 ,    'HSBC Bank Brasil S.A. - Banco M�ltiplo  ', 'http://www.hsbc.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (492 ,    'ING Bank N.V.  ', 'http://www.ing.com');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (488 ,    'JPMorgan Chase Bank  ', 'http://www.jpmorganchase.com');
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (065 ,    'Lemon Bank Banco M�ltiplo S.A.  ', 'http://www.lemon.com');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (409 ,    'UNIBANCO - Uni�o de Bancos Brasileiros S.A.  ', 'http://www.unibanco.com.br');  
insert into loc_banco ( CD_BANCO,   NM_BANCO, URL ) values (230 ,    'Unicard Banco M�ltiplo S.A.  ', 'http://www.unicard.com.br');

-- Carregar Agencia Banc�ria --
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA BOA VISTA', 02290000, 233,'AGENCIA MATRIZ',246);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA BOA VISTA', 02290023, 233,'AGENCIA MATRIZ',025);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA BOA VISTA', 02292300, 233,'AGENCIA MATRIZ',641);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA BOA VISTA', 02393123, 233,'AGENCIA MATRIZ',029);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA BOA VISTA', 02290000, 233,'AGENCIA MATRIZ',038);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA BOA VISTA', 02290000, 233,'AGENCIA MATRIZ',740);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 25 DE MAR�O', 02290000, 233,'AGENCIA MATRIZ',107);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 25 DE MAR�O', 02290000, 233,'AGENCIA MATRIZ',031);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA BAR�O DE LIMEIRA', 05690045, 233,'AGENCIA MATRIZ',096);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'AV. PAULISTA', 02290000, 233,'AGENCIA MATRIZ',394);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 12390000, 233,'AGENCIA MATRIZ',318);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'AV. PAULISTA', 02245600, 233,'AGENCIA MATRIZ',752);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA BOA VISTA', 02290000, 233,'AGENCIA MATRIZ',248);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'AV. PAULISTA', 02290000, 233,'AGENCIA MATRIZ',036);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'AV. PAULISTA', 02290000, 233,'AGENCIA MATRIZ',237);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290045, 233,'AGENCIA MATRIZ',225);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290100, 233,'AGENCIA MATRIZ',044);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA BOA VISTA', 02290200, 233,'AGENCIA MATRIZ',263);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290200, 233,'AGENCIA MATRIZ',222);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',040);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',745);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 45290333, 233,'AGENCIA MATRIZ',215);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',756);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 56789000, 233,'AGENCIA MATRIZ',748);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',505);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA AUGUSTA', 02290000, 233,'AGENCIA MATRIZ',229);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'AV. PAULISTA', 02290000, 233,'AGENCIA MATRIZ',003);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',707);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA AUGUSTA', 56789000, 233,'AGENCIA MATRIZ',024);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',456);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA AUGUSTA', 02290000, 233,'AGENCIA MATRIZ',214);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA BAR�O DE LIMEIRA', 02290000, 233,'AGENCIA MATRIZ',001);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',027);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',047);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',037);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA BAR�O DE LIMEIRA', 02290000, 233,'AGENCIA MATRIZ',041);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',004);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA SETE DE ABRIL', 02290000, 233,'AGENCIA MATRIZ',265);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA SETE DE ABRIL', 02290000, 233,'AGENCIA MATRIZ',224);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA SETE DE ABRIL', 02290000, 233,'AGENCIA MATRIZ',175);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA SETE DE ABRIL', 02290000, 233,'AGENCIA MATRIZ',252);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'ALAMEDA SANTOS', 02290000, 233,'AGENCIA MATRIZ',233);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'PCA.DA SE', 02290000, 233,'AGENCIA MATRIZ',734);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA AUGUSTA', 02290000, 233,'AGENCIA MATRIZ',612);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA AUGUSTA', 02290000, 233,'AGENCIA MATRIZ',063);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA DA MOOCA', 02290000, 233,'AGENCIA MATRIZ',604);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA DA MOOCA', 02290000, 233,'AGENCIA MATRIZ',320);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA DA MOOCA', 02290000, 233,'AGENCIA MATRIZ',653);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA DA MOOCA', 02290000, 233,'AGENCIA MATRIZ',630);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'AV. PAES DE BARROS', 02290000, 233,'AGENCIA MATRIZ',249);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'AV. PAES DE BARROS', 02290000, 233,'AGENCIA MATRIZ',184);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'AV. PAES DE BARROS', 02290000, 233,'AGENCIA MATRIZ',652);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'AV. PAES DE BARROS', 02290000, 233,'AGENCIA MATRIZ',341);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA QUIRINO DE ANDRADE', 02290000, 233,'AGENCIA MATRIZ',479);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA QUIRINO DE ANDRADE', 02290000, 233,'AGENCIA MATRIZ',376);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA DIREITA', 02290000, 233,'AGENCIA MATRIZ',074);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA DIREITA', 02290000, 233,'AGENCIA MATRIZ',600);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA DIREITA', 02290000, 233,'AGENCIA MATRIZ',389);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA DA QUITANDA', 02290000, 233,'AGENCIA MATRIZ',755);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA DA QUITANDA', 02290000, 233,'AGENCIA MATRIZ',151);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA DA QUITANDA', 02290000, 233,'AGENCIA MATRIZ',045);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA DA QUITANDA', 02290000, 233,'AGENCIA MATRIZ',623);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA JOSE BONIFACIO', 02290000, 233,'AGENCIA MATRIZ',611);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA SAO BENTO', 02290000, 233,'AGENCIA MATRIZ',643);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA SAO BENTO', 02290000, 233,'AGENCIA MATRIZ',638);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA SAO BENTO', 02290000, 233,'AGENCIA MATRIZ',747);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA SAO BENTO', 02290000, 233,'AGENCIA MATRIZ',356);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA SAO BENTO', 02290000, 233,'AGENCIA MATRIZ',633);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA JOSE BONIFACIO', 02290000, 233,'AGENCIA MATRIZ',072);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA DO BECO', 02290000, 233,'AGENCIA MATRIZ',453);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA DO BECO', 02290000, 233,'AGENCIA MATRIZ',422);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',033);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',250);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',749);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',366);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',637);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',464);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',634);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',208);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',116);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',655);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',610);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',370);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',021);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02294444, 233,'AGENCIA MATRIZ',719);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',204);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',073);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290456, 233,'AGENCIA MATRIZ',069);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290066, 233,'AGENCIA MATRIZ',070);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',104);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',477);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',487);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',751);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',062);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',399);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290455, 233,'AGENCIA MATRIZ',492);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',488);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',065);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',409);
INSERT INTO LOC_AGENCIA_BANCO (CD_AGENCIA, END_AGENCIA, CEP, NUMERO, APELIDO, CD_BANCO) VALUES (1, 'RUA 15 DE NOVEMBRO', 02290000, 233,'AGENCIA MATRIZ',230);

-- Carregar CFO --
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1101,'Compra para industrializa��o ou produ��o rural (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)', 'Compra de mercadoria a ser utilizada em processo de industrializa��o ou produ��o rural, bem como a entrada de mercadoria em estabelecimento industrial ou produtor rural de cooperativa recebida de seus cooperados ou de estabelecimento de outra cooperativa');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1102,'Compra para comercializa��o', 'Classificam-se neste c�digo as compras de mercadorias a serem comercializadas. Tamb�m ser�o classificadas neste c�digo as entradas de mercadorias em estabelecimento comercial de cooperativa recebidas de seus cooperados ou de estabelecimento de outra cooperativa');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1111,'Compra para industrializa��o de mercadoria recebida anteriormente em consigna��o industrial', 'Classificam-se neste c�digo as compras efetivas de mercadorias a serem utilizadas em processo de industrializa��o, recebidas anteriormente a t�tulo de consigna��o industrial');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1113,'Compra para comercializa��o, de mercadoria recebida anteriormente em consigna��o mercantil', 'Classificam-se neste c�digo as compras efetivas de mercadorias recebidas anteriormente a t�tulo de consigna��o mercantil');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1116,'Compra para industrializa��o ou produ��o rural originada de encomenda para recebimento futuro (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)', 'Compra de mercadoria, a ser utilizada em processo de industrializa��o ou produ��o rural, quando da entrada real da mercadoria, cuja aquisi��o tenha sido classificada no c�digo �1.922 � Lan�amento efetuado a t�tulo de simples faturamento decorrente de compra para recebimento futuro�');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1117,'Compra para comercializa��o originada de encomenda para recebimento futuro', 'Classificam-se neste c�digo as compras de mercadorias a serem comercializadas, quando da entrada real da mercadoria, cuja aquisi��o tenha sido classificada no c�digo 1.922 - Lan�amento efetuado a t�tulo de simples faturamento decorrente de compra para recebimento futuro');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1118,'Compra de mercadoria para comercializa��o pelo adquirente origin�rio entregue pelo vendedor remetente ao destinat�rio, em venda � ordem.', 'Classificam-se neste c�digo as compras de mercadorias j� comercializadas, que, sem transitar pelo estabelecimento do adquirente origin�rio, sejam entregues pelo vendedor remetente diretamente ao destinat�rio, em opera��o de venda � ordem, cuja venda seja classificada, pelo adquirente origin�rio, no c�digo 5.120 - Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinat�rio pelo vendedor remetente, em venda � ordem');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1120,'Compra para industrializa��o, em venda � ordem, j� recebida do vendedor remetente', 'Classificam-se neste c�digo as compras de mercadorias a serem utilizadas em processo de industrializa��o, em vendas � ordem, j� recebidas do vendedor remetente, por ordem do adquirente origin�rio.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1121,'Compra para comercializa��o, em venda � ordem, j� recebida do vendedor remetente', 'Classificam-se neste c�digo as compras de mercadorias a serem comercializadas, em vendas � ordem, j� recebidas do vendedor remetente por ordem do adquirente origin�rio');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1122,'Compra para industrializa��o em que a mercadoria foi remetida pelo fornecedor ao industrializador sem transitar pelo estabelecimento adquirente', 'Classificam-se neste c�digo as compras de mercadorias a serem utilizadas em processo de industrializa��o, remetidas pelo fornecedor para o industrializador sem que a mercadoria tenha transitado pelo estabelecimento do adquirente');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1124,'Industrializa��o efetuada por outra empresa', 'Classificam-se neste c�digo as entradas de mercadorias industrializadas por terceiros, compreendendo os valores referentes aos servi�os prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial. Quando a industrializa��o efetuada se referir a bens do ativo imobilizado ou de mercadorias para uso ou consumo do estabelecimento encomendante, a entrada dever� ser classificada nos c�digos 1.551 - Compra de bem para o ativo imobilizado ou 1.556 - Compra de material para uso ou consumo');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1125,'Industrializa��o efetuada por outra empresa quando a mercadoria remetida para utiliza��o no processo de industrializa��o n�o transitou pelo estabelecimento adquirente da mercadoria', 'Classificam-se neste c�digo as entradas de mercadorias industrializadas por outras empresas, em que as mercadorias remetidas para utiliza��o no processo de industrializa��o n�o transitaram pelo estabelecimento do adquirente das mercadorias, compreendendo os valores referentes aos servi�os prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial. Quando a industrializa��o efetuada se referir a bens do ativo imobilizado ou de mercadorias para uso ou consumo do estabelecimento encomendante, a entrada dever� ser classificada nos c�digos 1.551 - Compra de bem para o ativo imobilizado ou 1.556 - Compra de material para uso ou consumo');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1126,'Compra para utiliza��o na presta��o de servi�o', 'Classificam-se neste c�digo as entradas de mercadorias a serem utilizadas nas presta��es de servi�os');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1151,'Transfer�ncia para industrializa��o ou produ��o rural (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)', 'Entrada de mercadoria recebida, em transfer�ncia de outro estabelecimento da mesma empresa, para ser utilizada em processo de industrializa��o ou produ��o rural');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1152,'Transfer�ncia para comercializa��o', 'Classificam-se neste c�digo as entradas de mercadorias recebidas em transfer�ncia de outro estabelecimento da mesma empresa, para serem comercializadas');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1153,'Transfer�ncia de energia el�trica para distribui��o', 'Classificam-se neste c�digo as entradas de energia el�trica recebida em transfer�ncia de outro estabelecimento da mesma empresa, para distribui��o');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1154,'Transfer�ncia para utiliza��o na presta��o de servi�o', 'Classificam-se neste c�digo as entradas de mercadorias recebidas em transfer�ncia de outro estabelecimento da mesma empresa, para serem utilizadas nas presta��es de servi�os');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1201,'Devolu��o de venda de produ��o do estabelecimento', 'Devolu��o de venda de produto industrializado ou produzido pelo estabelecimento, cuja sa�da tenha sido classificada como "Venda de produ��o do estabelecimento". (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1202,'Devolu��o de venda de mercadoria adquirida ou recebida de terceiros', 'Classificam-se neste c�digo as devolu��es de vendas de mercadorias adquiridas ou recebidas de terceiros, que n�o tenham sido objeto de industrializa��o no estabelecimento, cujas sa�das tenham sido classificadas como Venda de mercadoria adquirida ou recebida de terceiros');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1203,'Devolu��o de venda de produ��o do estabelecimento, destinada � Zona Franca de Manaus ou �reas de Livre Com�rcio', 'Devolu��o de venda de produto industrializado ou produzido pelo estabelecimento, cuja sa�da tenha sido classificada no c�digo "5.109 � Venda de produ��o do estabelecimento destinada � Zona Franca de Manaus ou �reas de Livre Com�rcio". (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1204,'Devolu��o de venda de mercadoria adquirida ou recebida de terceiros, destinada � Zona Franca de Manaus ou �reas de Livre Com�rcio', 'Classificam-se neste c�digo as devolu��es de vendas de mercadorias adquiridas ou recebidas de terceiros, cujas sa�das foram classificadas no c�digo 5.110 - Venda de mercadoria adquirida ou recebida de terceiros, destinada � Zona Franca de Manaus ou �reas de Livre Com�rcio');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1205,'Anula��o de valor relativo � presta��o de servi�o de comunica��o', 'Classificam-se neste c�digo as anula��es correspondentes a valores faturados indevidamente, decorrentes de presta��es de servi�os de comunica��o');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1206,'Anula��o de valor relativo � presta��o de servi�o de transporte', 'Classificam-se neste c�digo as anula��es correspondentes a valores faturados indevidamente, decorrentes de presta��es de servi�os de transporte');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1207,'Anula��o de valor relativo � venda de energia el�trica', 'Classificam-se neste c�digo as anula��es correspondentes a valores faturados indevidamente, decorrentes de venda de energia el�trica');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1208,'Devolu��o de produ��o do estabelecimento, remetida em transfer�ncia', 'Devolu��o de produto industrializado ou produzido pelo estabelecimento transferido para outro estabelecimento da mesma empresa. (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1209,'Devolu��o de mercadoria adquirida ou recebida de terceiros, remetida em transfer�ncia', 'Classificam-se neste c�digo as devolu��es de mercadorias adquiridas ou recebidas de terceiros, transferidas para outros estabelecimentos da mesma empresa');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1251,'Compra de energia el�trica para distribui��o ou comercializa��o', 'Classificam-se neste c�digo as compras de energia el�trica utilizada em sistema de distribui��o ou comercializa��o. Tamb�m ser�o classificadas neste c�digo as compras de energia el�trica por cooperativas para distribui��o aos seus cooperados');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1252,'Compra de energia el�trica por estabelecimento industrial', 'Classificam-se neste c�digo as compras de energia el�trica utilizada no processo de industrializa��o. Tamb�m ser�o classificadas neste c�digo as compras de energia el�trica utilizada por estabelecimento industrial de cooperativa');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1253,'Compra de energia el�trica por estabelecimento comercial', 'Classificam-se neste c�digo as compras de energia el�trica utilizada por estabelecimento comercial. Tamb�m ser�o classificadas neste c�digo as compras de energia el�trica utilizada por estabelecimento comercial de cooperativa');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1254,'Compra de energia el�trica por estabelecimento prestador de servi�o de transporte', 'Classificam-se neste c�digo as compras de energia el�trica utilizada por estabelecimento prestador de servi�os de transporte');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1255,'Compra de energia el�trica por estabelecimento prestador de servi�o de comunica��o', 'Classificam-se neste c�digo as compras de energia el�trica utilizada por estabelecimento prestador de servi�os de comunica��o');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1256,'Compra de energia el�trica por estabelecimento de produtor rural', 'Classificam-se neste c�digo as compras de energia el�trica utilizada por estabelecimento de produtor rural');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1257,'Compra de energia el�trica para consumo por demanda contratada', 'Classificam-se neste c�digo as compras de energia el�trica para consumo por demanda contratada, que prevalecer� sobre os demais c�digos deste subgrupo');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1301,'Aquisi��o de servi�o de comunica��o para execu��o de servi�o da mesma natureza', 'Classificam-se neste c�digo as aquisi��es de servi�os de comunica��o utilizados nas presta��es de servi�os da mesma natureza');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1302,'Aquisi��o de servi�o de comunica��o por estabelecimento industrial', 'Classificam-se neste c�digo as aquisi��es de servi�os de comunica��o utilizados por estabelecimento industrial. Tamb�m ser�o classificadas neste c�digo as aquisi��es de servi�os de comunica��o utilizados por estabelecimento industrial de cooperativa');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1303,'Aquisi��o de servi�o de comunica��o por estabelecimento comercial', 'Classificam-se neste c�digo as aquisi��es de servi�os de comunica��o utilizados por estabelecimento comercial. Tamb�m ser�o classificadas neste c�digo as aquisi��es de servi�os de comunica��o utilizados por estabelecimento comercial de cooperativa');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1304,'Aquisi��o de servi�o de comunica��o por estabelecimento de prestador de servi�o de transporte', 'Classificam-se neste c�digo as aquisi��es de servi�os de comunica��o utilizados por estabelecimento prestador de servi�o de transporte');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1305,'Aquisi��o de servi�o de comunica��o por estabelecimento de geradora ou de distribuidora de energia el�trica', 'Classificam-se neste c�digo as aquisi��es de servi�os de comunica��o utilizados por estabelecimento de geradora ou de distribuidora de energia el�trica');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1306,'Aquisi��o de servi�o de comunica��o por estabelecimento de produtor rural', 'Classificam-se neste c�digo as aquisi��es de servi�os de comunica��o utilizados por estabelecimento de produtor rural');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1351,'Aquisi��o de servi�o de transporte para execu��o de servi�o da mesma natureza', 'Classificam-se neste c�digo as aquisi��es de servi�os de transporte utilizados nas presta��es de servi�os da mesma natureza');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1352,'Aquisi��o de servi�o de transporte por estabelecimento industrial', 'Classificam-se neste c�digo as aquisi��es de servi�os de transporte utilizados por estabelecimento industrial. Tamb�m ser�o classificadas neste c�digo as aquisi��es de servi�os de transporte utilizados por estabelecimento industrial de cooperativa');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1353,'Aquisi��o de servi�o de transporte por estabelecimento comercial', 'Classificam-se neste c�digo as aquisi��es de servi�os de transporte utilizados por estabelecimento comercial. Tamb�m ser�o classificadas neste c�digo as aquisi��es de servi�os de transporte utilizados por estabelecimento comercial de cooperativa');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1354,'Aquisi��o de servi�o de transporte por estabelecimento de prestador de servi�o de comunica��o', 'Classificam-se neste c�digo as aquisi��es de servi�os de transporte utilizados por estabelecimento prestador de servi�os de comunica��o');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1355,'Aquisi��o de servi�o de transporte por estabelecimento de geradora ou de distribuidora de energia el�trica', 'Classificam-se neste c�digo as aquisi��es de servi�os de transporte utilizados por estabelecimento de geradora ou de distribuidora de energia el�trica');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1356,'Aquisi��o de servi�o de transporte por estabelecimento de produtor rural', 'Classificam-se neste c�digo as aquisi��es de servi�os de transporte utilizados por estabelecimento de produtor rural');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1401,'Compra para industrializa��o ou produ��o rural de mercadoria sujeita ao regime de substitui��o tribut�ria (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)', 'Compra de mercadoria sujeita ao regime de substitui��o tribut�ria, a ser utilizada em processo de industrializa��o ou produ��o rural, bem como compra, por estabelecimento industrial ou produtor rural de cooperativa, de mercadoria sujeita ao mencionado regime');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1403,'Compra para comercializa��o em opera��o com mercadoria sujeita ao regime de substitui��o tribut�ria', 'Classificam-se neste c�digo as compras de mercadorias a serem comercializadas, decorrentes de opera��es com mercadorias sujeitas ao regime de substitui��o tribut�ria. Tamb�m ser�o classificadas neste c�digo as compras de mercadorias sujeitas ao regime de substitui��o tribut�ria em estabelecimento comercial de cooperativa');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1406,'Compra de bem para o ativo imobilizado cuja mercadoria est� sujeita ao regime de substitui��o tribut�ria', 'Classificam-se neste c�digo as compras de bens destinados ao ativo imobilizado do estabelecimento, em opera��es com mercadorias sujeitas ao regime de substitui��o tribut�ria');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1407,'Compra de mercadoria para uso ou consumo cuja mercadoria est� sujeita ao regime de substitui��o tribut�ria', 'Classificam-se neste c�digo as compras de mercadorias destinadas ao uso ou consumo do estabelecimento, em opera��es com mercadorias sujeitas ao regime de substitui��o tribut�ria');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1408,'Transfer�ncia para industrializa��o ou produ��o rural de mercadoria sujeita ao regime de substitui��o tribut�ria (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)', 'Mercadoria sujeita ao regime de substitui��o tribut�ria, recebida em transfer�ncia de outro estabelecimento da mesma empresa, para ser industrializada ou consumida na produ��o rural no estabelecimento');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1409,'Transfer�ncia para comercializa��o em opera��o com mercadoria sujeita ao regime de substitui��o tribut�ria', 'Classificam-se neste c�digo as mercadorias recebidas em transfer�ncia de outro estabelecimento da mesma empresa, para serem comercializadas, decorrentes de opera��es sujeitas ao regime de substitui��o tribut�ria');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1410,'Devolu��o de venda de mercadoria, de produ��o do estabelecimento, sujeita ao regime de substitui��o tribut�ria', 'Devolu��o de produto industrializado ou produzido pelo estabelecimento, cuja sa�da tenha sido classificada como "Venda de mercadoria de produ��o do estabelecimento sujeita ao regime de substitui��o tribut�ria"');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1411,'Devolu��o de venda de mercadoria adquirida ou recebida de terceiros em opera��o com mercadoria sujeita ao regime de substitui��o tribut�ria', 'Classificam-se neste c�digo as devolu��es de vendas de mercadorias adquiridas ou recebidas de terceiros, cujas sa�das tenham sido classificadas como Venda de mercadoria adquirida ou recebida de terceiros em opera��o com mercadoria sujeita ao regime de substitui��o tribut�ria');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1414,'Retorno de mercadoria de produ��o do estabelecimento, remetida para venda fora do estabelecimento, sujeita ao regime de substitui��o tribut�ria', 'Entrada, em retorno, de produto industrializado ou produzido pelo pr�prio estabelecimento, remetido para venda fora do estabelecimento, inclusive por meio de ve�culo, sujeito ao regime de substitui��o tribut�ria e n�o comercializado');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1415,'Retorno de mercadoria adquirida ou recebida de terceiros, remetida para venda fora do estabelecimento em opera��o com mercadoria sujeita ao regime de substitui��o tribut�ria', 'Classificam-se neste c�digo as entradas, em retorno, de mercadorias adquiridas ou recebidas de terceiros remetidas para vendas fora do estabelecimento, inclusive por meio de ve�culos, em opera��es com mercadorias sujeitas ao regime de substitui��o tribut�ria, e n�o comercializadas');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1451,'Retorno de animal do estabelecimento produtor', 'Classificam-se neste c�digo as entradas referentes ao retorno de animais criados pelo produtor no sistema integrado');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1452,'Retorno de insumo n�o utilizado na produ��o', 'Classificam-se neste c�digo o retorno de insumos n�o utilizados pelo produtor na cria��o de animais pelo sistema integrado');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1501,'Entrada de mercadoria recebida com fim espec�fico de exporta��o', 'Classificam-se neste c�digo as entradas de mercadorias em estabelecimento de trading company, empresa comercial exportadora ou outro estabelecimento do remetente, com fim espec�fico de exporta��o');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1503,'Entrada decorrente de devolu��o de produto, de fabrica��o do estabelecimento, remetido com fim espec�fico de exporta��o', 'Devolu��o de produto industrializado ou produzido pelo estabelecimento, remetido a "trading company", a empresa comercial exportadora ou a outro estabelecimento do remetente, com fim espec�fico de exporta��o, cuja sa�da tenha sido classificada no c�digo "5.501 � Remessa de produ��o do estabelecimento com fim espec�fico de exporta��o"');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1504,'Entrada decorrente de devolu��o de mercadoria remetida com fim espec�fico de exporta��o, adquirida ou recebida de terceiros', 'Devolu��o de mercadoria, adquirida ou recebida de terceiro, remetida a trading company, a empresa comercial exportadora ou a outro estabelecimento do remetente, com fim espec�fico de exporta��o, cuja sa�da tenha sido classificada no c�digo �5.502 - Remessa de mercadoria adquirida ou recebida de terceiros, com fim espec�fico de exporta��o�');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1505,'Entrada decorrente de devolu��o simb�lica de mercadoria remetida para forma��o de lote de exporta��o, de produto industrializado ou produzido pelo pr�prio estabelecimento.', 'Devolu��o simb�lica de mercadoria remetida para forma��o de lote de exporta��o, cuja sa�da tenha sido classificada no c�digo "5.504 � Remessa de mercadoria para forma��o de lote de exporta��o, de produto industrializado ou produzido pelo pr�prio estabelecimento"');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1506,'Entrada decorrente de devolu��o simb�lica de mercadoria, adquirida ou recebida de terceiros, remetida para forma��o de lote de exporta��o', 'Devolu��o simb�lica de mercadoria remetida para forma��o de lote de exporta��o em armaz�ns alfandegados, entrepostos aduaneiros ou outros estabelecimentos que venham a ser regulamentados pela legisla��o tribut�ria de cada Unidade Federada, efetuada pelo estabelecimento deposit�rio, cuja sa�da tenha sido classificada no c�digo "5.505 � Remessa de mercadoria, adquirida ou recebida de terceiros, para forma��o de lote de exporta��o"');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1551,'Compra de bem para o ativo imobilizado', 'Classificam-se neste c�digo as compras de bens destinados ao ativo imobilizado do estabelecimento');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1552,'Transfer�ncia de bem do ativo imobilizado', 'Classificam-se neste c�digo as entradas de bens destinados ao ativo imobilizado recebidos em transfer�ncia de outro estabelecimento da mesma empresa');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1553,'Devolu��o de venda de bem do ativo imobilizado', 'Classificam-se neste c�digo as devolu��es de vendas de bens do ativo imobilizado, cujas sa�das tenham sido classificadas no c�digo 5.551 - Venda de bem do ativo imobilizado.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1554,'Retorno de bem do ativo imobilizado remetido para uso fora do estabelecimento', 'Classificam-se neste c�digo as entradas por retorno de bens do ativo imobilizado remetidos para uso fora do estabelecimento, cujas sa�das tenham sido classificadas no c�digo 5.554 - Remessa de bem do ativo imobilizado para uso fora do estabelecimento');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1555,'Entrada de bem do ativo imobilizado de terceiro, remetido para uso no estabelecimento', 'Classificam-se neste c�digo as entradas de bens do ativo imobilizado de terceiros, remetidos para uso no estabelecimento');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1556,'Compra de material para uso ou consumo', 'Classificam-se neste c�digo as compras de mercadorias destinadas ao uso ou consumo do estabelecimento');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1557,'Transfer�ncia de material para uso ou consumo', 'Classificam-se neste c�digo as entradas de materiais para uso ou consumo recebidos em transfer�ncia de outro estabelecimento da mesma empresa');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1601,'Recebimento, por transfer�ncia, de cr�dito de ICMS', 'Classificam-se neste c�digo os lan�amentos destinados ao registro de cr�ditos de ICMS, recebidos por transfer�ncia de outras empresas');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1602,'Recebimento, por transfer�ncia, de saldo credor do ICMS, de outro estabelecimento da mesma empresa, para compensa��o de saldo devedor do imposto.', 'Lan�amento destinado ao registro da transfer�ncia de saldo credor do ICMS, recebido de outro estabelecimento da mesma empresa, destinado � compensa��o do saldo devedor do estabelecimento, inclusive no caso de apura��o centralizada do imposto');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1603,'Ressarcimento de ICMS retido por substitui��o tribut�ria', 'Lan�amento destinado ao registro de ressarcimento de ICMS retido por substitui��o tribut�ria � contribuinte substitu�do, efetuado pelo contribuinte substituto, ou, ainda, quando o ressarcimento for apropriado pelo pr�prio contribuinte substitu�do, nas hip�teses previstas na legisla��o aplic�vel');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1604,'Lan�amento do cr�dito relativo � compra de bem para o ativo imobilizado', 'Lan�amento destinado ao registro da apropria��o de cr�dito de bem do ativo imobilizado. (Dec.25.068/2003-EFEITOS A PARTIR DE 01.01.2003)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1605,'Recebimento, por transfer�ncia, de saldo devedor do ICMS de outro estabelecimento da mesma empresa', 'Lan�amento destinado ao registro da transfer�ncia de saldo devedor do ICMS, recebido de outro estabelecimento da mesma empresa, para efetiva��o da apura��o centralizada do imposto. (ACR Ajuste SINIEF 03/2004) (DECRETO N� 26.810/2004) (a partir de 01.01.2005)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1651,'Compra de combust�vel ou lubrificante para industrializa��o subseq�ente', 'Compra de combust�vel ou lubrificante a ser utilizados em processo de industrializa��o do pr�prio produto. (ACR Ajuste SINIEF 9/2003 - a partir 01.01.2004)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1652,'Compra de combust�vel ou lubrificante para comercializa��o', 'Compra de combust�vel ou lubrificante a ser comercializados. (ACR Ajuste SINIEF 9/2003 - a partir 01.01.2004)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1653,'Compra de combust�vel ou lubrificante por consumidor ou usu�rio final', 'Compra de combust�vel ou lubrificante, a ser consumidos em processo de industrializa��o de outros produtos, na produ��o rural, na presta��o de servi�o ou por usu�rio final');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1658,'Transfer�ncia de combust�vel ou lubrificante para industrializa��o', 'Entrada de combust�vel ou lubrificante, recebidos em transfer�ncia de outro estabelecimento da mesma empresa, para ser utilizados em processo de industrializa��o do pr�prio produto.(Decreto 26.174/2003)(efeitos a partir 01.01.2004)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1659,'Transfer�ncia de combust�vel ou lubrificante para comercializa��o', 'Entrada de combust�vel ou lubrificante, recebidos em transfer�ncia de outro estabelecimento da mesma empresa, para ser comercializados. .(Decreto 26.174/2003) (efeitos a partir 01.01.2004)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1660,'Devolu��o de venda de combust�vel ou lubrificante destinados � industrializa��o subseq�ente', 'Devolu��o de venda de combust�vel ou lubrificante, cuja sa�da tenha sido classificada como "Venda de combust�vel ou lubrificante destinados � industrializa��o subseq�ente". (Decreto 26.174/2003)(efeitos a partir 01.01.2004)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1661,'Devolu��o de venda de combust�vel ou lubrificante destinados � comercializa��o', 'Devolu��o de venda de combust�vel ou lubrificante, cuja sa�da tenha sido classificada como "Venda de combust�vel ou lubrificante para comercializa��o".(Decreto 26.174/2003)(efeitos a partir 01.01.2004)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1662,'Devolu��o de venda de combust�vel ou lubrificante destinados a consumidor ou usu�rio final', 'Devolu��o de venda de combust�vel ou lubrificante, cuja sa�da tenha sido classificada como "Venda de combust�vel ou lubrificante por consumidor ou usu�rio final"..(Decreto 26.174/2003)(efeitos a partir 01.01.2004)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1663,'Entrada de combust�vel ou lubrificante para armazenagem', 'Entrada de combust�vel ou lubrificante para armazenagem.(Decreto 26.174/2003)(efeitos a partir 01.01.2004)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1664,'Retorno de combust�vel ou lubrificante remetidos para armazenagem', 'Entrada, ainda que simb�lica, por retorno de combust�vel ou lubrificante, remetidos para armazenagem. .(Decreto 26.174/2003)(efeitos a partir 01.01.2004)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1901,'Entrada para industrializa��o por encomenda', 'Classificam-se neste c�digo as entradas de insumos recebidos para industrializa��o por encomenda de outra empresa ou de outro estabelecimento da mesma empresa');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1902,'Retorno de mercadoria remetida para industrializa��o por encomenda', 'Classificam-se neste c�digo o retorno dos insumos remetidos para industrializa��o por encomenda, incorporados ao produto final pelo estabelecimento industrializador');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1903,'Entrada de mercadoria remetida para industrializa��o e n�o aplicada no referido processo', 'Classificam-se neste c�digo as entradas em devolu��o de insumos remetidos para industrializa��o e n�o aplicados no referido processo');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1904,'Retorno de remessa para venda fora do estabelecimento', 'Classificam-se neste c�digo as entradas em retorno de mercadorias remetidas para venda fora do estabelecimento, inclusive por meio de ve�culos, e n�o comercializadas');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1905,'Entrada de mercadoria recebida para dep�sito em dep�sito fechado ou armaz�m geral', 'Classificam-se neste c�digo as entradas de mercadorias recebidas para dep�sito em dep�sito fechado ou armaz�m geral');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1906,'Retorno de mercadoria remetida para dep�sito fechado ou armaz�m geral', 'Classificam-se neste c�digo as entradas em retorno de mercadorias remetidas para dep�sito em dep�sito fechado ou armaz�m geral');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1907,'Retorno simb�lico de mercadoria remetida para dep�sito fechado ou armaz�m geral', 'Classificam-se neste c�digo as entradas em retorno simb�lico de mercadorias remetidas para dep�sito em dep�sito fechado ou armaz�m geral, quando as mercadorias depositadas tenham sido objeto de sa�da a qualquer t�tulo e que n�o tenham retornado ao estabelecimento depositante');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1908,'Entrada de bem por conta de contrato de comodato', 'Classificam-se neste c�digo as entradas de bens recebidos em cumprimento de contrato de comodato');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1909,'Retorno de bem remetido por conta de contrato de comodato', 'Classificam-se neste c�digo as entradas de bens recebidos em devolu��o ap�s cumprido o contrato de comodato');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1910,'Entrada de bonifica��o, doa��o ou brinde', 'Classificam-se neste c�digo as entradas de mercadorias recebidas a t�tulo de bonifica��o, doa��o ou brinde');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1911,'Entrada de amostra gr�tis', 'Classificam-se neste c�digo as entradas de mercadorias recebidas a t�tulo de amostra gr�tis');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1912,'Entrada de mercadoria ou bem recebido para demonstra��o', 'Classificam-se neste c�digo as entradas de mercadorias ou bens recebidos para demonstra��o');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1913,'Retorno de mercadoria ou bem remetido para demonstra��o', 'Classificam-se neste c�digo as entradas em retorno de mercadorias ou bens remetidos para demonstra��o');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1914,'Retorno de mercadoria ou bem remetido para exposi��o ou feira', 'Classificam-se neste c�digo as entradas em retorno de mercadorias ou bens remetidos para exposi��o ou feira');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1915,'Entrada de mercadoria ou bem recebido para conserto ou reparo', 'Classificam-se neste c�digo as entradas de mercadorias ou bens recebidos para conserto ou reparo');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1916,'Retorno de mercadoria ou bem remetido para conserto ou reparo', 'Classificam-se neste c�digo as entradas em retorno de mercadorias ou bens remetidos para conserto ou reparo');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1917,'Entrada de mercadoria recebida em consigna��o mercantil ou industrial', 'Classificam-se neste c�digo as entradas de mercadorias recebidas a t�tulo de consigna��o mercantil ou industrial');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1918,'Devolu��o de mercadoria remetida em consigna��o mercantil ou industrial', 'Classificam-se neste c�digo as entradas por devolu��o de mercadorias remetidas anteriormente a t�tulo de consigna��o mercantil ou industrial');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1919,'Devolu��o simb�lica de mercadoria vendida ou utilizada em processo industrial, remetida anteriormente em consigna��o mercantil ou industrial', 'Classificam-se neste c�digo as entradas por devolu��o simb�lica de mercadorias vendidas ou utilizadas em processo industrial, remetidas anteriormente a t�tulo de consigna��o mercantil ou industrial');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1920,'Entrada de vasilhame ou sacaria', 'Classificam-se neste c�digo as entradas de vasilhame ou sacaria');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1921,'Retorno de vasilhame ou sacaria', 'Classificam-se neste c�digo as entradas em retorno de vasilhame ou sacaria');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1922,'Lan�amento efetuado a t�tulo de simples faturamento decorrente de compra para recebimento futuro', 'Classificam-se neste c�digo os registros efetuados a t�tulo de simples faturamento decorrente de compra para recebimento futuro');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1923,'Entrada de mercadoria recebida do vendedor remetente, em venda � ordem', 'Classificam-se neste c�digo as entradas de mercadorias recebidas do vendedor remetente, em vendas � ordem, cuja compra do adquirente origin�rio, foi classificada nos c�digos 1.120 - Compra para industrializa��o, em venda � ordem, j� recebida do vendedor remetente ou 1.121 - Compra para comercializa��o, em venda � ordem, j� recebida do vendedor remetente');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1924,'Entrada para industrializa��o por conta e ordem do adquirente da mercadoria, quando esta n�o transitar pelo estabelecimento do adquirente', 'Classificam-se neste c�digo as entradas de insumos recebidos para serem industrializados por conta e ordem do adquirente, nas hip�teses em que os insumos n�o tenham transitado pelo estabelecimento do adquirente dos mesmos');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1925,'Retorno de mercadoria remetida para industrializa��o por conta e ordem do adquirente da mercadoria, quando esta n�o transitar pelo estabelecimento do adquirente', 'Classificam-se neste c�digo o retorno dos insumos remetidos por conta e ordem do adquirente, para industrializa��o e incorporados ao produto final pelo estabelecimento industrializador, nas hip�teses em que os insumos n�o tenham transitado pelo estabelecimento do adquirente');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1926,'Lan�amento efetuado a t�tulo de reclassifica��o de mercadoria decorrente de forma��o de kit ou de sua desagrega��o', 'Classificam-se neste c�digo os registros efetuados a t�tulo de reclassifica��o decorrente de forma��o de kit de mercadorias ou de sua desagrega��o');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1931,'Lan�amento efetuado pelo tomador do servi�o de transporte, quando a responsabilidade de reten��o do imposto for atribu�da ao remetente ou alienante da mercadoria, pelo servi�o de transporte realizado por transportador aut�nomo ou por transportador n�o-inscrito na Unidade da Federa��o onde se tenha iniciado o servi�o.', 'Lan�amento efetuado pelo tomador do servi�o de transporte realizado por transportador aut�nomo ou por transportador n�o-inscrito na Unidade da Federa��o onde se tenha iniciado o servi�o, quando a responsabilidade pela reten��o do imposto for atribu�da ao remetente ou alienante da mercadoria');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1932,'Aquisi��o de servi�o de transporte iniciado em Unidade da Federa��o diversa daquela onde esteja inscrito o prestador', 'Aquisi��o de servi�o de transporte que tenha sido iniciado em Unidade da Federa��o diversa daquela onde o prestador esteja inscrito como contribuinte. (ACR Ajuste SINIEF 03/2004) (DECRETO N� 26.810/2004) (efeitos a partir 01.01.2005)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1933,'Aquisi��o de servi�o tributado pelo Imposto sobre Servi�os de Qualquer Natureza (Ajuste SINIEF 06/2005) (NR)', 'Aquisi��o de servi�o, cujo imposto � de compet�ncia municipal, desde que informado em Nota Fiscal modelo 1 ou 1-A. (NR Ajuste SINIEF 06/2005) (DECRETO N� 26.868/2006 - efeitos a partir 01.01.2006)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (1949,'Outra entrada de mercadoria ou presta��o de servi�o n�o especificada', 'Classificam-se neste c�digo as outras entradas de mercadorias ou presta��es de servi�os que n�o tenham sido especificadas nos c�digos anteriores.5.068/2003-EFEITOS A 01.01.2003)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2101,'Compra para industrializa��o ou produ��o rural (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)', 'Compra de mercadoria a ser utilizada em processo de industrializa��o ou produ��o rural, bem como a entrada de mercadoria em estabelecimento industrial ou produtor rural de cooperativa, recebida de seus cooperados ou de estabelecimento de outra cooperativa.(NR Ajuste SINIEF 05/2005) (Dec. 28.868/2006 - Efeitos a partir de 01/01/2006, ficando facultada ao contribuinte a sua ado��o para fatos geradores ocorridos no per�odo de 01 de novembro a 31 de dezembro de 2005)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2102,'Compra para comercializa��o', 'Classificam-se neste c�digo as compras de mercadorias a serem comercializadas. Tamb�m ser�o classificadas neste c�digo as entradas de mercadorias em estabelecimento comercial de cooperativa recebidas de seus cooperados ou de estabelecimento de outra cooperativa');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2111,'Compra para industrializa��o de mercadoria recebida anteriormente em consigna��o industrial', 'Classificam-se neste c�digo as compras efetivas de mercadorias a serem utilizadas em processo de industrializa��o, recebidas anteriormente a t�tulo de consigna��o industrial');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2113,'Compra para comercializa��o, de mercadoria recebida anteriormente em consigna��o mercantil', 'Classificam-se neste c�digo as compras efetivas de mercadorias recebidas anteriormente a t�tulo de consigna��o mercantil.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2116,'Compra para industrializa��o ou produ��o rural originada de encomenda para recebimento futuro (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)', 'Compra de mercadoria a ser utilizada em processo de industrializa��o ou produ��o rural, quando da entrada real da mercadoria, cuja aquisi��o tenha sido classificada no c�digo "2.922 � Lan�amento efetuado a t�tulo de simples faturamento decorrente de compra para recebimento futuro".(NR Ajuste SINIEF 05/2005) (Dec. 28.868/2006 - Efeitos a partir de 01/01/2006, ficando facultada ao contribuinte a sua ado��o para fatos geradores ocorridos no per�odo de 01 de novembro a 31 de dezembro de 2005)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2117,'Compra para comercializa��o originada de encomenda para recebimento futuro', 'Classificam-se neste c�digo as compras de mercadorias a serem comercializadas, quando da entrada real da mercadoria, cuja aquisi��o tenha sido classificada no c�digo 2.922 - Lan�amento efetuado a t�tulo de simples faturamento decorrente de compra para recebimento futuro');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2118,'Compra de mercadoria para comercializa��o pelo adquirente origin�rio, entregue pelo vendedor remetente ao destinat�rio, em venda � ordem', 'Classificam-se neste c�digo as compras de mercadorias j� comercializadas, que, sem transitar pelo estabelecimento do adquirente origin�rio, sejam entregues pelo vendedor remetente diretamente ao destinat�rio, em opera��o de venda � ordem, cuja venda seja classificada, pelo adquirente origin�rio, no c�digo 6.120 - Venda de mercadoria adquirida ou recebida de terceiros entregue ao destinat�rio pelo vendedor remetente, em venda � ordem');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2120,'Compra para industrializa��o, em venda � ordem, j� recebida do vendedor remetente', 'Classificam-se neste c�digo as compras de mercadorias a serem utilizadas em processo de industrializa��o, em vendas � ordem, j� recebidas do vendedor remetente, por ordem do adquirente origin�rio');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2121,'Compra para comercializa��o, em venda � ordem, j� recebida do vendedor remetente', 'Classificam-se neste c�digo as compras de mercadorias a serem comercializadas, em vendas � ordem, j� recebidas do vendedor remetente por ordem do adquirente origin�rio');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2122,'Compra para industrializa��o em que a mercadoria foi remetida pelo fornecedor ao industrializador sem transitar pelo estabelecimento adquirente', 'Classificam-se neste c�digo as compras de mercadorias a serem utilizadas em processo de industrializa��o, remetidas pelo fornecedor para o industrializador sem que a mercadoria tenha transitado pelo estabelecimento do adquirente');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2124,'Industrializa��o efetuada por outra empresa', 'Classificam-se neste c�digo as entradas de mercadorias industrializadas por terceiros, compreendendo os valores referentes aos servi�os prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial. Quando a industrializa��o efetuada se referir a bens do ativo imobilizado ou de mercadorias para uso ou consumo do estabelecimento encomendante, a entrada dever� ser classificada nos c�digos 2.551 - Compra de bem para o ativo imobilizado ou 2.556 - Compra de material para uso ou consumo');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2125,'Industrializa��o efetuada por outra empresa quando a mercadoria remetida para utiliza��o no processo de industrializa��o n�o transitou pelo estabelecimento adquirente da mercadoria', 'Classificam-se neste c�digo as entradas de mercadorias industrializadas por outras empresas, em que as mercadorias remetidas para utiliza��o no processo de industrializa��o n�o transitaram pelo estabelecimento do adquirente das mercadorias, compreendendo os valores referentes aos servi�os prestados e os das mercadorias de propriedade do industrializador empregadas no processo industrial. Quando a industrializa��o efetuada se referir a bens do ativo imobilizado ou de mercadorias para uso ou consumo do estabelecimento encomendante, a entrada dever� ser classificada nos c�digos 2.551 - Compra de bem para o ativo imobilizado ou 2.556 - Compra de material para uso ou consumo');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2126,'Compra para utiliza��o na presta��o de servi�o', 'Classificam-se neste c�digo as entradas de mercadorias a serem utilizadas nas presta��es de servi�os');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2151,'Transfer�ncia para industrializa��o ou produ��o rural (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)', 'Entrada de mercadoria, recebida em transfer�ncia de outro estabelecimento da mesma empresa, para ser utilizada em processo de industrializa��o ou produ��o rural.(NR Ajuste SINIEF 05/2005) (Dec. 28.868/2006 - Efeitos a partir de 01/01/2006, ficando facultada ao contribuinte a sua ado��o para fatos geradores ocorridos no per�odo de 01 de novembro a 31 de dezembro de 2005');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2152,'Transfer�ncia para comercializa��o', 'Classificam-se neste c�digo as entradas de mercadorias recebidas em transfer�ncia de outro estabelecimento da mesma empresa, para serem comercializadas');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2153,'Transfer�ncia de energia el�trica para distribui��o', 'Classificam-se neste c�digo as entradas de energia el�trica recebida em transfer�ncia de outro estabelecimento da mesma empresa, para distribui��o');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2154,'Transfer�ncia para utiliza��o na presta��o de servi�o', 'Classificam-se neste c�digo as entradas de mercadorias recebidas em transfer�ncia de outro estabelecimento da mesma empresa, para serem utilizadas nas presta��es de servi�os');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2201,'Devolu��o de venda de produ��o do estabelecimento', 'Devolu��o de venda de produto industrializado ou produzido pelo estabelecimento, cuja sa�da tenha sido classificada no c�digo "6.101 - Venda de produ��o do estabelecimento".(NR Ajuste SINIEF 05/2005) (Dec. 28.868/2006 - Efeitos a partir de 01/01/2006, ficando facultada ao contribuinte a sua ado��o para fatos geradores ocorridos no per�odo de 01 de novembro a 31 de dezembro de 2005)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2202,'Devolu��o de venda de mercadoria adquirida ou recebida de terceiros', 'Devolu��o de vendas de mercadoria, adquirida ou recebida de terceiro, que n�o tenham sido objeto de industrializa��o no estabelecimento, cuja sa�da tenha sido classificada como Venda de mercadoria adquirida ou recebida de terceiros');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2203,'Devolu��o de venda de produ��o do estabelecimento destinada � Zona Franca de Manaus ou �reas de Livre Com�rcio', 'Devolu��o de venda de produto industrializado ou produzido pelo estabelecimento, cuja sa�da tenha sido classificada no c�digo "6.109 � Venda de produ��o do estabelecimento destinada � Zona Franca de Manaus ou �reas de Livre Com�rcio". (NR Ajuste SINIEF 05/2005) (Dec. 28.868/2006 - Efeitos a partir de 01/01/2006, ficando facultada ao contribuinte a sua ado��o para fatos geradores ocorridos no per�odo de 01 de novembro a 31 de dezembro de 2005)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2204,'Devolu��o de venda de mercadoria adquirida ou recebida de terceiros, destinada � Zona Franca de Manaus ou �reas de Livre Com�rcio', 'Devolu��o de venda de mercadoria adquirida ou recebida de terceiro, cuja sa�da tenha sido classificada no c�digo �6.110 - Venda de mercadoria adquirida ou recebida de terceiros, destinada � Zona Franca de Manaus ou �reas de Livre Com�rcio�');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2205,'Anula��o de valor relativo � presta��o de servi�o de comunica��o', 'Anula��o correspondente a valor faturado indevidamente, decorrente de presta��o de servi�o de comunica��o');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2206,'Anula��o de valor relativo � presta��o de servi�o de transporte', 'Anula��o correspondente a valor faturado indevidamente, decorrente de presta��o de servi�o de transporte');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2207,'Anula��o de valor relativo � venda de energia el�trica', 'Anula��o correspondente a valor faturado indevidamente, decorrente de venda de energia el�trica');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2208,'Devolu��o de produ��o do estabelecimento, remetida em transfer�ncia.', 'Devolu��o de produto industrializado ou produzido pelo estabelecimento e transferido para outro estabelecimento da mesma empresa.(NR Ajuste SINIEF 05/2005) (Dec. 28.868/2006 - Efeitos a partir de 01/01/2006, ficando facultada ao contribuinte a sua ado��o para fatos geradores ocorridos no per�odo de 01 de novembro a 31 de dezembro de 2005)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2209,'Devolu��o de mercadoria adquirida ou recebida de terceiros e remetida em transfer�ncia', 'Devolu��o de mercadoria adquirida ou recebida de terceiros, transferidas para outros estabelecimentos da mesma empresa');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2251,'Compra de energia el�trica para distribui��o ou comercializa��o', 'Classificam-se neste c�digo as compras de energia el�trica utilizada em sistema de distribui��o ou comercializa��o. Tamb�m ser�o classificadas neste c�digo as compras de energia el�trica por cooperativas para distribui��o com seus cooperados');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2252,'Compra de energia el�trica por estabelecimento industrial', 'Classificam-se neste c�digo as compras de energia el�trica utilizada no processo de industrializa��o. Tamb�m ser�o classificadas neste c�digo as compras de energia el�trica utilizada por estabelecimento industrial de cooperativa.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2253,'Compra de energia el�trica por estabelecimento comercial', 'Classificam-se neste c�digo as compras de energia el�trica utilizada por estabelecimento comercial. Tamb�m ser�o classificadas neste c�digo as compras de energia el�trica utilizada por estabelecimento comercial de cooperativa.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2254,'Compra de energia el�trica por estabelecimento prestador de servi�o de transporte', 'Classificam-se neste c�digo as compras de energia el�trica utilizada por estabelecimento prestador de servi�os de transporte.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2255,'Compra de energia el�trica por estabelecimento prestador de servi�o de comunica��o', 'Classificam-se neste c�digo as compras de energia el�trica utilizada por estabelecimento prestador de servi�os de comunica��o.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2256,'Compra de energia el�trica por estabelecimento de produtor rural', 'Classificam-se neste c�digo as compras de energia el�trica utilizada por estabelecimento de produtor rural.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2257,'Compra de energia el�trica para consumo por demanda contratada', 'Classificam-se neste c�digo as compras de energia el�trica para consumo por demanda contratada, que prevalecer� sobre os demais c�digos deste subgrupo.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2301,'Aquisi��o de servi�o de comunica��o para execu��o de servi�o da mesma natureza', 'Classificam-se neste c�digo as aquisi��es de servi�os de comunica��o utilizados nas presta��es de servi�os da mesma natureza.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2302,'Aquisi��o de servi�o de comunica��o por estabelecimento industrial', 'Classificam-se neste c�digo as aquisi��es de servi�os de comunica��o utilizados por estabelecimento industrial. Tamb�m ser�o classificadas neste c�digo as aquisi��es de servi�os de comunica��o utilizados por estabelecimento industrial de cooperativa.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2303,'Aquisi��o de servi�o de comunica��o por estabelecimento comercial', 'Classificam-se neste c�digo as aquisi��es de servi�os de comunica��o utilizados por estabelecimento comercial. Tamb�m ser�o classificadas neste c�digo as aquisi��es de servi�os de comunica��o utilizados por estabelecimento comercial de cooperativa.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2304,'Aquisi��o de servi�o de comunica��o por estabelecimento de prestador de servi�o de transporte', 'Classificam-se neste c�digo as aquisi��es de servi�os de comunica��o utilizado por estabelecimento prestador de servi�o de transporte.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2305,'Aquisi��o de servi�o de comunica��o por estabelecimento de geradora ou de distribuidora de energia el�trica', 'Classificam-se neste c�digo as aquisi��es de servi�os de comunica��o utilizados por estabelecimento de geradora ou de distribuidora de energia el�trica.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2306,'Aquisi��o de servi�o de comunica��o por estabelecimento de produtor rural', 'Classificam-se neste c�digo as aquisi��es de servi�os de comunica��o utilizados por estabelecimento de produtor rural.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2351,'Aquisi��o de servi�o de transporte para execu��o de servi�o da mesma natureza', 'Classificam-se neste c�digo as aquisi��es de servi�os de transporte utilizados nas presta��es de servi�os da mesma natureza.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2352,'Aquisi��o de servi�o de transporte por estabelecimento industrial', 'Classificam-se neste c�digo as aquisi��es de servi�os de transporte utilizados por estabelecimento industrial. Tamb�m ser�o classificadas neste c�digo as aquisi��es de servi�os de transporte utilizados por estabelecimento industrial de cooperativa.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2353,'Aquisi��o de servi�o de transporte por estabelecimento comercial', 'Classificam-se neste c�digo as aquisi��es de servi�os de transporte utilizados por estabelecimento comercial. Tamb�m ser�o classificadas neste c�digo as aquisi��es de servi�os de transporte utilizados por estabelecimento comercial de cooperativa.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2354,'Aquisi��o de servi�o de transporte por estabelecimento de prestador de servi�o de comunica��o', 'Classificam-se neste c�digo as aquisi��es de servi�os de transporte utilizados por estabelecimento prestador de servi�os de comunica��o.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2355,'Aquisi��o de servi�o de transporte por estabelecimento de geradora ou de distribuidora de energia el�trica', 'Classificam-se neste c�digo as aquisi��es de servi�os de transporte utilizados por estabelecimento de geradora ou de distribuidora de energia el�trica.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2356,'Aquisi��o de servi�o de transporte por estabelecimento de produtor rural', 'Classificam-se neste c�digo as aquisi��es de servi�os de transporte utilizados por estabelecimento de produtor rural.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2401,'Compra para industrializa��o ou produ��o rural de mercadoria sujeita ao regime de substitui��o tribut�ria (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)', 'Compra de mercadoria, sujeita ao regime de substitui��o tribut�ria, a ser utilizada em processo de industrializa��o ou produ��o rural, bem como compra, por estabelecimento industrial ou produtor rural de cooperativa, de mercadoria sujeita ao mencionado regime.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2403,'Compra para comercializa��o em opera��o com mercadoria sujeita ao regime de substitui��o tribut�ria', 'Classificam-se neste c�digo as compras de mercadorias a serem comercializadas, decorrentes de opera��es com mercadorias sujeitas ao regime de substitui��o tribut�ria. Tamb�m ser�o classificadas neste c�digo as compras de mercadorias sujeitas ao regime de substitui��o tribut�ria em estabelecimento comercial de cooperativa.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2406,'Compra de bem para o ativo imobilizado cuja mercadoria est� sujeita ao regime de substitui��o tribut�ria', 'Classificam-se neste c�digo as compras de bens destinados ao ativo imobilizado do estabelecimento, em opera��es com mercadorias sujeitas ao regime de substitui��o tribut�ria.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2407,'Compra de mercadoria para uso ou consumo cuja mercadoria est� sujeita ao regime de substitui��o tribut�ria', 'Classificam-se neste c�digo as compras de mercadorias destinadas ao uso ou consumo do estabelecimento, em opera��es com mercadorias sujeitas ao regime de substitui��o tribut�ria.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2408,'Transfer�ncia para industrializa��o ou produ��o rural de mercadoria sujeita ao regime de substitui��o tribut�ria (NR Ajuste SINIEF 05/2005) (Decreto 28.868/2006)', 'Entrada de mercadoria, sujeita ao regime de substitui��o tribut�ria, recebida em transfer�ncia de outro estabelecimento da mesma empresa, para ser industrializada ou consumida na produ��o rural no estabelecimento destinat�rio.R Ajuste SINIEF 05/2005) (Dec. 28.868/2006 - Efeitos a partir de 01/01/2006, ficando facultada ao contribuinte a sua ado��o para fatos geradores ocorridos no per�odo de 01 de novembro a 31 de dezembro de 2005)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2409,'Transfer�ncia para comercializa��o em opera��o com mercadoria sujeita ao regime de substitui��o tribut�ria', 'Classificam-se neste c�digo as mercadorias recebidas em transfer�ncia de outro estabelecimento da mesma empresa, para serem comercializadas, decorrentes de opera��es sujeitas ao regime de substitui��o tribut�ria.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2410,'Devolu��o de venda de produ��o do estabelecimento, quando o produto estiver sujeito ao regime de substitui��o tribut�ria', 'Devolu��o de produto industrializado ou produzido pelo estabelecimento, cuja sa�da tenha sido classificada como "Venda de produ��o do estabelecimento quando o produto estiver sujeito ao regime de substitui��o tribut�ria".(NR Ajuste SINIEF 05/2005) (Dec. 28.868/2006 - Efeitos a partir de 01/01/2006, ficando facultada ao contribuinte a sua ado��o para fatos geradores ocorridos no per�odo de 01 de novembro a 31 de dezembro de 2005)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2411,'Devolu��o de venda de mercadoria adquirida ou recebida de terceiros em opera��o com mercadoria sujeita ao regime de substitui��o tribut�ria', 'Devolu��o de vendas de mercadoria adquirida ou recebida de terceiro, cuja sa�da tenha sido classificada como �Venda de mercadoria adquirida ou recebida de terceiros em opera��o com mercadoria sujeita ao regime de substitui��o tribut�ria�.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2414,'Retorno de produ��o do estabelecimento, remetida para venda fora do estabelecimento, quando o produto estiver sujeito ao regime de substitui��o tribut�ria', 'Entrada, em retorno, de produto industrializado ou produzido pelo estabelecimento sujeito ao regime de substitui��o tribut�ria, remetido para venda fora do estabelecimento, inclusive por meio de ve�culo, e n�o comercializado.(NR Ajuste SINIEF 05/2005) (Dec. 28.868/2006 - Efeitos a partir de 01/01/2006, ficando facultada ao contribuinte a sua ado��o para fatos geradores ocorridos no per�odo de 01 de novembro a 31 de dezembro de 2005)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2415,'Retorno de mercadoria adquirida ou recebida de terceiros, remetida para venda fora do estabelecimento em opera��o com mercadoria sujeita ao regime de substitui��o tribut�ria', 'Entrada, em retorno, de mercadoria sujeita ao regime de substitui��o tribut�ria, adquirida ou recebida de terceiro remetida para venda fora do estabelecimento, inclusive por meio de ve�culo, e n�o comercializada.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2501,'Entrada de mercadoria recebida com fim espec�fico de exporta��o', 'Classificam-se neste c�digo as entradas de mercadorias em estabelecimento de trading company, empresa comercial exportadora ou outro estabelecimento do remetente, com fim espec�fico de exporta��o.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2503,'Entrada decorrente de devolu��o de produto industrializado pelo estabelecimento, remetido com fim espec�fico de exporta��o', 'Devolu��o de produto industrializado ou produzido pelo estabelecimento, remetido a "trading company", a empresa comercial exportadora ou a outro estabelecimento do remetente, com fim espec�fico de exporta��o, cuja sa�da tenha sido classificada no c�digo "6.501 � Remessa de produ��o do estabelecimento com fim espec�fico de exporta��o".(NR Ajuste SINIEF 05/2005) (Dec.28.868/2006 - Efeitos a partir de 01/01/2006, ficando facultada ao contribuinte a sua ado��o para fatos geradores ocorridos no per�odo de 01 de novembro a 31 de dezembro de 2005)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2504,'Entrada decorrente de devolu��o de mercadoria remetida com fim espec�fico de exporta��o, adquirida ou recebida de terceiros', 'Classificam-se neste c�digo as devolu��es de mercadorias adquiridas ou recebidas de terceiros remetidas a trading company, a empresa comercial exportadora ou a outro estabelecimento do remetente, com fim espec�fico de exporta��o, cujas sa�das tenham sido classificadas no c�digo 6.502 - Remessa de mercadoria adquirida ou recebida de terceiros, com fim espec�fico de exporta��o.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2505,'Entrada decorrente de devolu��o simb�lica de mercadoria remetida para forma��o de lote de exporta��o, de produto industrializado ou produzido pelo pr�prio estabelecimento.', 'Devolu��o simb�lica de mercadoria remetida para forma��o de lote de exporta��o, cuja sa�da tenha sido classificada no c�digo "6.504 � Remessa de mercadoria para forma��o de lote de exporta��o, de produto industrializado ou produzido pelo pr�prio estabelecimento". (ACR Ajuste SINIEF 09/2005) (Decreto 28.868/2006)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2506,'Entrada decorrente de devolu��o simb�lica de mercadoria, adquirida ou recebida de terceiros, remetida para forma��o de lote de exporta��o.', 'Devolu��o simb�lica de mercadoria remetida para forma��o de lote de exporta��o em armaz�ns alfandegados, entrepostos aduaneiros ou outros estabelecimentos que venham a ser regulamentados pela legisla��o tribut�ria de cada Unidade Federada, efetuada pelo estabelecimento deposit�rio, cuja sa�da tenha sido classificada no c�digo "6.505 � Remessa de mercadoria, adquirida ou recebida de terceiros, para forma��o de lote de exporta��o".');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2551,'Compra de bem para o ativo imobilizado', 'Classificam-se neste c�digo as compras de bens destinados ao ativo imobilizado do estabelecimento.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2552,'Transfer�ncia de bem do ativo imobilizado', 'Classificam-se neste c�digo as entradas de bens destinados ao ativo imobilizado recebidos em transfer�ncia de outro estabelecimento da mesma empresa.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2553,'Devolu��o de venda de bem do ativo imobilizado', 'Classificam-se neste c�digo as devolu��es de vendas de bens do ativo imobilizado, cujas sa�das tenham sido classificadas no c�digo 6.551 - Venda de bem do ativo imobilizado.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2554,'Retorno de bem do ativo imobilizado remetido para uso fora do estabelecimento', 'Classificam-se neste c�digo as entradas por retorno de bens do ativo imobilizado remetidos para uso fora do estabelecimento, cujas sa�das tenham sido classificadas no c�digo 6.554 - Remessa de bem do ativo imobilizado para uso fora do estabelecimento.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2555,'Entrada de bem do ativo imobilizado de terceiro, remetido para uso no estabelecimento', 'Classificam-se neste c�digo as entradas de bens do ativo imobilizado de terceiros, remetidos para uso no estabelecimento.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2556,'Compra de material para uso ou consumo', 'Classificam-se neste c�digo as compras de mercadorias destinadas ao uso ou consumo do estabelecimento.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2557,'Transfer�ncia de material para uso ou consumo', 'Classificam-se neste c�digo as entradas de materiais para uso ou consumo recebidos em transfer�ncia de outro estabelecimento da mesma empresa.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2603,'Ressarcimento de ICMS retido por substitui��o tribut�ria', 'Classificam-se neste c�digo os lan�amentos destinados ao registro de ressarcimento de ICMS retido por substitui��o tribut�ria a contribuinte substitu�do, efetuado pelo contribuinte substituto, nas hip�teses previstas na legisla��o aplic�vel.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2651,'Compra de combust�vel ou lubrificante para industrializa��o subseq�ente', 'Compra de combust�vel ou lubrificante a ser utilizados em processo de industrializa��o do pr�prio produto. (a partir 01.01.2004 -  Decreto N� 26.174 de 26/11/2003)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2652,'Compra de combust�vel ou lubrificante para comercializa��o', 'Compra de combust�vel ou lubrificante a ser comercializados. (a partir 01.01.2004 -  Decreto N� 26.174 de 26/11/2003)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2653,'Compra de combust�vel ou lubrificante por consumidor ou usu�rio final', 'Compra de combust�vel ou lubrificante, a ser consumidos em processo de industrializa��o de outros produtos, na produ��o rural, na presta��o de servi�o ou por usu�rio final.(NR Ajuste SINIEF 05/2005) (Dec.28.868/2006 - Efeitos a partir de 01/01/2006, ficando facultada ao contribuinte a sua ado��o para fatos geradores ocorridos no per�odo de 01 de novembro a 31 de dezembro de 2005)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2658,'Transfer�ncia de combust�vel ou lubrificante para industrializa��o', 'Entrada de combust�vel ou lubrificante, recebidos em transfer�ncia de outro estabelecimento da mesma empresa, para ser utilizados em processo de industrializa��o do pr�prio produto. (a partir 01.01.2004 -  Decreto N� 26.174 de 26/11/2003)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2659,'Transfer�ncia de combust�vel ou lubrificante para comercializa��o', 'Entrada de combust�vel ou lubrificante, recebidos em transfer�ncia de outro estabelecimento da mesma empresa, para ser comercializados. (a partir 01.01.2004 -  Decreto N� 26.174 de 26/11/2003)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2660,'Devolu��o de venda de combust�vel ou lubrificante destinados � industrializa��o subseq�ente', 'Devolu��o de venda de combust�vel ou lubrificante, cuja sa�da tenha sido classificada como "Venda de combust�vel ou lubrificante destinados � industrializa��o subseq�ente".(a partir 01.01.2004 -  Decreto N� 26.174 de 26/11/2003)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2661,'Devolu��o de venda de combust�vel ou lubrificante destinados � comercializa��o', 'Devolu��o de venda de combust�vel ou lubrificante, cuja sa�da tenha sido classificada como "Venda de combust�vel ou lubrificante para comercializa��o".(a partir 01.01.2004 -  Decreto N� 26.174 de 26/11/2003)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2662,'Devolu��o de venda de combust�vel ou lubrificante destinados a consumidor ou usu�rio final', 'Devolu��o de venda de combust�vel ou lubrificante, cuja sa�da tenha sido classificada como "Venda de combust�vel ou lubrificante por consumidor ou usu�rio final".(a partir 01.01.2004 -  Decreto N� 26.174 de 26/11/2003)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2663,'Entrada de combust�vel ou lubrificante para armazenagem', 'Entrada de combust�vel ou lubrificante para armazenagem. (a partir 01.01.2004 -  Decreto N� 26.174 de 26/11/2003)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2664,'Retorno de combust�vel ou lubrificante remetidos para armazenagem', 'Entrada, ainda que simb�lica, por retorno de combust�vel ou lubrificante, remetidos para armazenagem. (a partir 01.01.2004 -  Decreto N� 26.174 de 26/11/2003)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2901,'Entrada para industrializa��o por encomenda', 'Classificam-se neste c�digo as entradas de insumos recebidos para industrializa��o por encomenda de outra empresa ou de outro estabelecimento da mesma empresa.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2902,'Retorno de mercadoria remetida para industrializa��o por encomenda', 'Classificam-se neste c�digo o retorno dos insumos remetidos para industrializa��o por encomenda, incorporados ao produto final pelo estabelecimento industrializador.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2903,'Entrada de mercadoria remetida para industrializa��o e n�o aplicada no referido processo', 'Classificam-se neste c�digo as entradas em devolu��o de insumos remetidos para industrializa��o e n�o aplicados no referido processo.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2904,'Retorno de remessa para venda fora do estabelecimento', 'Classificam-se neste c�digo as entradas em retorno de mercadorias remetidas para venda fora do estabelecimento, inclusive por meio de ve�culos, e n�o comercializadas.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2905,'Entrada de mercadoria recebida para dep�sito em dep�sito fechado ou armaz�m geral', 'Classificam-se neste c�digo as entradas de mercadorias recebidas para dep�sito em dep�sito fechado ou armaz�m geral.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2906,'Retorno de mercadoria remetida para dep�sito fechado ou armaz�m geral', 'Classificam-se neste c�digo as entradas em retorno de mercadorias remetidas para dep�sito em dep�sito fechado ou armaz�m geral.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2907,'Retorno simb�lico de mercadoria remetida para dep�sito fechado ou armaz�m geral', 'Classificam-se neste c�digo as entradas em retorno simb�lico de mercadorias remetidas para dep�sito em dep�sito fechado ou armaz�m geral, quando as mercadorias depositadas tenham sido objeto de sa�da a qualquer t�tulo e que n�o tenham retornado ao estabelecimento depositante.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2908,'Entrada de bem por conta de contrato de comodato', 'Classificam-se neste c�digo as entradas de bens recebidos em cumprimento de contrato de comodato.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2909,'Retorno de bem remetido por conta de contrato de comodato', 'Classificam-se neste c�digo as entradas de bens recebidos em devolu��o ap�s cumprido o contrato de comodato.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2910,'Entrada de bonifica��o, doa��o ou brinde', 'Classificam-se neste c�digo as entradas de mercadorias recebidas a t�tulo de bonifica��o, doa��o ou brinde.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2911,'Entrada de amostra gr�tis', 'Classificam-se neste c�digo as entradas de mercadorias recebidas a t�tulo de amostra gr�tis.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2912,'Entrada de mercadoria ou bem recebido para demonstra��o', 'Classificam-se neste c�digo as entradas de mercadorias ou bens recebidos para demonstra��o.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2913,'Retorno de mercadoria ou bem remetido para demonstra��o', 'Classificam-se neste c�digo as entradas em retorno de mercadorias ou bens remetidos para demonstra��o.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2914,'Retorno de mercadoria ou bem remetido para exposi��o ou feira', 'Classificam-se neste c�digo as entradas em retorno de mercadorias ou bens remetidos para exposi��o ou feira.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2915,'Entrada de mercadoria ou bem recebido para conserto ou reparo', 'Classificam-se neste c�digo as entradas de mercadorias ou bens recebidos para conserto ou reparo.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2916,'Retorno de mercadoria ou bem remetido para conserto ou reparo', 'Classificam-se neste c�digo as entradas em retorno de mercadorias ou bens remetidos para conserto ou reparo.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2917,'Entrada de mercadoria recebida em consigna��o mercantil ou industrial', 'Classificam-se neste c�digo as entradas de mercadorias recebidas a t�tulo de consigna��o mercantil ou industrial.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2918,'Devolu��o de mercadoria remetida em consigna��o mercantil ou industrial', 'Classificam-se neste c�digo as entradas por devolu��o de mercadorias remetidas anteriormente a t�tulo de consigna��o mercantil ou industrial.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2919,'Devolu��o simb�lica de mercadoria vendida ou utilizada em processo industrial, remetida anteriormente em consigna��o mercantil ou industrial', 'Classificam-se neste c�digo as entradas por devolu��o simb�lica de mercadorias vendidas ou utilizadas em processo industrial, remetidas anteriormente a t�tulo de consigna��o mercantil ou industrial.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2920,'Entrada de vasilhame ou sacaria', 'Classificam-se neste c�digo as entradas de vasilhame ou sacaria.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2921,'Retorno de vasilhame ou sacaria', 'Classificam-se neste c�digo as entradas em retorno de vasilhame ou sacaria.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2922,'Lan�amento efetuado a t�tulo de simples faturamento decorrente de compra para recebimento futuro', 'Classificam-se neste c�digo os registros efetuados a t�tulo de simples faturamento decorrente de compra para recebimento futuro.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2923,'Entrada de mercadoria recebida do vendedor remetente, em venda � ordem', 'Classificam-se neste c�digo as entradas de mercadorias recebidas do vendedor remetente, em vendas � ordem, cuja compra do adquirente origin�rio, foi classificada nos c�digos 2.120 - Compra para industrializa��o, em venda � ordem, j� recebida do vendedor remetente ou 2.121 - Compra para comercializa��o, em venda � ordem, j� recebida do vendedor remetente.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2924,'Entrada para industrializa��o por conta e ordem do adquirente da mercadoria, quando esta n�o transitar pelo estabelecimento do adquirente', 'Classificam-se neste c�digo as entradas de insumos recebidos para serem industrializados por conta e ordem do adquirente, nas hip�teses em que os insumos n�o tenham transitado pelo estabelecimento do adquirente dos mesmos.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2925,'Retorno de mercadoria remetida para industrializa��o por conta e ordem do adquirente da mercadoria, quando esta n�o transitar pelo estabelecimento do adquirente', 'Classificam-se neste c�digo o retorno dos insumos remetidos por conta e ordem do adquirente, para industrializa��o e incorporados ao produto final pelo estabelecimento industrializador, nas hip�teses em que os insumos n�o tenham transitado pelo estabelecimento do adquirente.');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2931,'Lan�amento efetuado pelo tomador do servi�o de transporte, quando a responsabilidade de reten��o do imposto for atribu�da ao remetente ou alienante da mercadoria, pelo servi�o de transporte realizado por transportador aut�nomo ou por transportador n�o-inscrito na Unidade da Federa��o onde se tenha iniciado o servi�o ', 'Lan�amento efetuado pelo tomador do servi�o de transporte realizado por transportador aut�nomo ou por transportador n�o-inscrito na Unidade da Federa��o onde se tenha iniciado o servi�o, quando a responsabilidade pela reten��o do imposto for atribu�da ao remetente ou alienante da mercadoria. (ACR Ajuste SINIEF 03/2004) (DECRETO N� 26.810/2004) (a partir de 01.01.2005)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2932,'Aquisi��o de servi�o de transporte iniciado em Unidade da Federa��o diversa daquela onde esteja inscrito o prestador', 'Aquisi��o de servi�o de transporte que tenha sido iniciado em Unidade da Federa��o diversa daquela onde o prestador esteja inscrito como contribuinte. (ACR Ajuste SINIEF 03/2004) (DECRETO N� 26.810/2004) (a partir de 01.01.2005)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2933,'Aquisi��o de servi�o tributado pelo Imposto Sobre Servi�os de Qualquer Natureza', 'Aquisi��o de servi�o, cujo imposto � de compet�ncia municipal, desde que informado em Nota Fiscal modelo 1 e 1-A. (NR Ajuste SINIEF 06/2005) (a partir de 01.01.2006)');
insert into loc_cfo (CFOP ,DESC_CFO, APLICACAO ) values (2949,'Outra entrada de mercadoria ou presta��o de servi�o n�o especificado', 'Classificam-se neste c�digo as outras entradas de mercadorias ou presta��es de servi�os que n�o tenham sido especificados nos c�digos anteriores.');

-- Carregar Estado --
insert into loc_estado ( cd_estado , nm_estado ) values ('DF', 'Distrito Federal');
insert into loc_estado ( cd_estado , nm_estado ) values ('RJ', 'RIO DE JANEIRO');
insert into loc_estado ( cd_estado , nm_estado ) values ('SP', 'S�o Paulo');
insert into loc_estado ( cd_estado , nm_estado ) values ('AL', 'Alagoas');
insert into loc_estado ( cd_estado , nm_estado ) values ('SE', 'Sergipe');
insert into loc_estado ( cd_estado , nm_estado ) values ('PE', 'Pernambuco');
insert into loc_estado ( cd_estado , nm_estado ) values ('ES', 'Esp�rito Santo');
insert into loc_estado ( cd_estado , nm_estado ) values ('PB', 'Para�ba');
insert into loc_estado ( cd_estado , nm_estado ) values ('SC', 'Santa Catarina');
insert into loc_estado ( cd_estado , nm_estado ) values ('RN', 'Rio Grande do Norte');
insert into loc_estado ( cd_estado , nm_estado ) values ('CE', 'Cear�');
insert into loc_estado ( cd_estado , nm_estado ) values ('PR', 'Paran�');
insert into loc_estado ( cd_estado , nm_estado ) values ('RS', 'Rio Grande do Sul');
insert into loc_estado ( cd_estado , nm_estado ) values ('MG', 'Minas Gerais');
insert into loc_estado ( cd_estado , nm_estado ) values ('BA', 'Bahia');
insert into loc_estado ( cd_estado , nm_estado ) values ('MA', 'Maranh�o');
insert into loc_estado ( cd_estado , nm_estado ) values ('GO', 'Goi�s');
insert into loc_estado ( cd_estado , nm_estado ) values ('PI', 'Piau�');
insert into loc_estado ( cd_estado , nm_estado ) values ('MS', 'Mato Grosso do Sul');
insert into loc_estado ( cd_estado , nm_estado ) values ('RO', 'Rond�nia');
insert into loc_estado ( cd_estado , nm_estado ) values ('PA', 'Par�');
insert into loc_estado ( cd_estado , nm_estado ) values ('TO', 'Tocantins');
insert into loc_estado ( cd_estado , nm_estado ) values ('AC', 'Acre');
insert into loc_estado ( cd_estado , nm_estado ) values ('AP', 'Amap�');
insert into loc_estado ( cd_estado , nm_estado ) values ('MT', 'Mato Grosso');
insert into loc_estado ( cd_estado , nm_estado ) values ('AM', 'Amazonas');
insert into loc_estado ( cd_estado , nm_estado ) values ('RR', 'Roraima');

-- Carregar Cidade --
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (1,'SAO PAULO','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (2,'AMERICANA','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (3,'RIBEIRAO PRETO','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (4,'SANTOS','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (5,'JUNDIAI','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (6,'CAMPINAS','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (7,'SAO CARLOS','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (8,'MIRASOL','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (9,'COSMORAMA','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (10,'JALES','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (11,'SANTA FE DO SUL','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (12,'SAO CARLOS','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (13,'SOROCABA','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (14,'SAO ROQUE','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (15,'ARARAQUARA','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (16,'SAO JOSE DO RIO PRETO','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (17,'ARACATUBA','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (18,'PIRACICABA','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (19,'IBIUNA','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (20,'MOGI DA CRUZES','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (21,'SAO VICENTE','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (22,'ARUJA','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (23,'SAO SEBASTIAO','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (24,'GUARUJA','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (25,'GUARULHOS','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (26,'SAO BERNARDO','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (27,'SANTO ANDRE','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (28,'SAO CAETANO','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (29,'ARARAS','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (30,'SUZANO','SP');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (1,'UBERABA','MG');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (2,'BELO HORIZONTE','MG');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (3,'SACRAMENTO','MG');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (4,'TEOFILO OTONI','MG');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (5,'UBERLANDIA','MG');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (1,'RIO DE JANEIRO','RJ');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (2,'BARRA DO PIRAI','RJ');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (3,'SAO CRISTOVAO','RJ');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (4,'SAO CONCALO','RJ');
insert into loc_cidade (CD_CIDADE, NM_CIDADE, CD_ESTADO  ) values (5,'CAMPOS','RJ');

-- Carregar Agencia
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (1,1,'RUA VINTE E UM','VILA OLIMPIA',123,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (1,2,'AV. BRASIL','IBIRAPUERA',1323,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (1,3,'AV. S�O JO�O','CENTRO',456,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (1,4,'RUA TURIASSU','SUMARE',789,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (2,1,'RUA JOSE DINIZ CUNHA','CENTRO',1220,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (3,1,'AV. VEREADOR JOSE DINIZ','CENTRO',400,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (3,2,'AV. JUNQUEIRA','JRD. SAO SEBASTIAO',900,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (4,1,'RUA DO CANAL 3','VILA DELMIRO',23,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (4,2,'RUA DR. MIRALDO DE VICENTE','CENTRO',1146,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (5,1,'RUA JOSE CARLOS NOGUEIRA','CENTRO',26,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (6,1,'AV. CARLOS VIDIGAL ANDRADE','CENTRO',1100,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (6,2,'RUA PONTE PRETA','VILA PRETA',12,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (6,3,'RUA SETE DE ABRIL','CENTRO',856,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (7,1,'AV. PRINCIPAL','VILA MADALENA',2123,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (12,1,'RUA TRINTA E UM DE JANEIRO','CENTRO',850,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (13,1,'AV. DOS COQUEIROS','CENTRO',1113,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (15,1,'AV. DR. CARLOS MIRANDO JR','CENTRO',324,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (16,1,'RUA GROELANDIA','JRD. J1',26,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (16,2,'RUA CENTRAL','CENTRO',1255,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (21,1,'AV. SAO VICENTE','PRAINHA',3123,'SP');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (1,1,'AV. DO CORREGO','CENTRO',123,'MG');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (2,1,'AV. BRASIL','CENTRO',1100,'MG');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (5,1,'AV. PRESIDENTE DUTRA','CENTRO',1276,'MG');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (1,1,'AV. DA GAVEA','ATERRO DO FLAMENGO',603,'RJ');
insert into loc_agencia (CD_CIDADE ,CD_AGENCIA, NM_LOGRADOURO, NM_BAIRRO, NUMERO, CD_ESTADO ) values (1,2,'AV. IPANEMA','IPANAMA',12,'RJ');


-- Carregar Cliente --
insert into loc_cliente values ( seq_loc_cli.nextval,'MOVEIS BANANAL LTDA','J',null, null, NULL, 09293984003);
insert into loc_cliente values ( seq_loc_cli.nextval,'BRUSCHETTA E FRANCISCO LTDA.','J',NULL,NULL,NULL, 09293984003);                                                                                        
insert into loc_cliente values ( seq_loc_cli.nextval,'MOVEIS RIBEIRO LTDA','J',NULL,NULL,NULL, 09293984003);                                                                                  
insert into loc_cliente values ( seq_loc_cli.nextval,'SUPERMERCADO ANAPOLIS LTDA','J',NULL,NULL,NULL, 09293984003);                                                                                           
insert into loc_cliente values ( seq_loc_cli.nextval,'ARMARINHOS JOSE PAULO LTDA','J',NULL,NULL,NULL, 09293984003);                                                                             
insert into loc_cliente values ( seq_loc_cli.nextval,'PANTANAL SPORTS MAGAZINE IMP EXP LTDA','J',NULL,NULL,NULL, 80012529945);                                                                                
insert into loc_cliente values ( seq_loc_cli.nextval,'SUPERMERCADO SUPERPAO LTDA','J',NULL,NULL,NULL, 00112545001);                                                                                      
insert into loc_cliente values ( seq_loc_cli.nextval,'MOISES DE PAULA MENDONCA','J',NULL,NULL,NULL, 09293984003);                                                                                                        
insert into loc_cliente values ( seq_loc_cli.nextval,'R. GASQUES BORDONI','J',NULL,NULL,NULL, 12585442000);                                                                               
insert into loc_cliente values ( seq_loc_cli.nextval,'HIPERMERCADO GOTARGO LTDA','J',NULL,NULL,NULL, 11152589993);                                                                                     
insert into loc_cliente values ( seq_loc_cli.nextval,'HERMES SILVESTRE DE MORAIS','J',NULL,NULL,NULL, 09293984003);                                                                                    
insert into loc_cliente values ( seq_loc_cli.nextval,'JACARANDA MOVEIS E ELETRODOMESTICOS LTDA','J',NULL,NULL,NULL, 09293984003);                                                                       
insert into loc_cliente values ( seq_loc_cli.nextval,'PALMA ALMEIDA E ALMEIDA LTDA','J',NULL,NULL,NULL, 09293984003);                                                                       
insert into loc_cliente values ( seq_loc_cli.nextval,'ELIANA MAGDA DE LOURENZO BORGES','J',NULL,NULL,NULL, 09293984003);                                                                          
insert into loc_cliente values ( seq_loc_cli.nextval,'JOSE RODRIGUES DE MIRANDA','J',NULL,NULL,NULL, 11152589993);                                                                         
insert into loc_cliente values ( seq_loc_cli.nextval,'CARVALHO E BARROSO LTDA','J',NULL,NULL,NULL, 11525899333);                                                                                                
insert into loc_cliente values ( seq_loc_cli.nextval,'JOAO BORGES CATALAO','J',NULL,NULL,NULL, 09293984003);                                                                         
insert into loc_cliente values ( seq_loc_cli.nextval,'LOURENCO PEREIRA PINTO E CIA LTDA','J',NULL,NULL,NULL, 09293984003);                                                                                   
insert into loc_cliente values ( seq_loc_cli.nextval,'MARCELINO E CARNEIRO LTDA','J',NULL,NULL,NULL, 09293984003);                                                                                            
insert into loc_cliente values ( seq_loc_cli.nextval,'ATLAS MATERIAIS ESCOLARES LTDA','J',NULL,NULL,NULL, 09293984003);                                                                                     
insert into loc_cliente values ( seq_loc_cli.nextval,'GILBERTO JOAO DALLA VALLE','J',NULL,NULL,NULL, 09293984003);                                                                                   
insert into loc_cliente values ( seq_loc_cli.nextval,'UNIVERSAL MOVEIS LTDA','J',NULL,NULL,NULL, 80090000182);                                                                                           
insert into loc_cliente values ( seq_loc_cli.nextval,'MOVEIS QUILES LTDA.','J',NULL,NULL,NULL, 09293984003);                                                                                                  
insert into loc_cliente values ( seq_loc_cli.nextval,'RAMAO SEBASTIAO LEITE','J',NULL,NULL,NULL, 09293984003);                                                                                    
insert into loc_cliente values ( seq_loc_cli.nextval,'YAMASHITA ELETRODOMESTICOS LTDA','J',NULL,NULL,NULL, 09293984003);                                                                        
insert into loc_cliente values ( seq_loc_cli.nextval,'FRANCISCO SOARES DE LIMA','J',NULL,NULL,NULL, 09293984003);                                                                                          
insert into loc_cliente values ( seq_loc_cli.nextval,'ACENDOR ALVES PADILHA','J',NULL,NULL,NULL, 09293984003);                                                                                              
insert into loc_cliente values ( seq_loc_cli.nextval,'MARTINS E MARTINS LTDA','J',NULL,NULL,NULL, 09293984003);                                                                                            
insert into loc_cliente values ( seq_loc_cli.nextval,'CAMILO E MACHADO LTDA','J',NULL,NULL,NULL, 09293984003);                                                                             
insert into loc_cliente values ( seq_loc_cli.nextval,'LEANDRO E RAMOS LTDA','J',NULL,NULL,NULL, 09293984003);                                                                                            
insert into loc_cliente values ( seq_loc_cli.nextval,'ELETRO DISCO LTDA','J',NULL,NULL,NULL, 09293984003);                                                                                          
insert into loc_cliente values ( seq_loc_cli.nextval,'LOJA NACIONAL LTDA','J',NULL,NULL,NULL, 09293984003);                                                                                             
insert into loc_cliente values ( seq_loc_cli.nextval,'A CONCILAR INDUSTRIA E COMERCIO LTDA','J',NULL,NULL,NULL, 09293984003);                                                                        
insert into loc_cliente values ( seq_loc_cli.nextval,'MINERACAO RIO DO NORTE S/A','J',NULL,NULL,NULL, 09293984003);                                                                              
insert into loc_cliente values ( seq_loc_cli.nextval,'ILDEFONSO FERREIRA DE SOUZA E CIA LTDA','J',NULL,NULL,NULL, 09293984003);                                                                             
insert into loc_cliente values ( seq_loc_cli.nextval,'H VERISSIMO E CIA LTDA','J',NULL,NULL,NULL, 09293984003);                                                                                     
insert into loc_cliente values ( seq_loc_cli.nextval,'BRINQUEDOS BANDEIRANTE AGROPECUARIA LTDA','J',NULL,NULL,NULL, 09293984003);                                                  
insert into loc_cliente values ( seq_loc_cli.nextval,'NEIDA MARQUES FERNANDES','J',NULL,NULL,NULL, 09293984003);                                                                                 
insert into loc_cliente values ( seq_loc_cli.nextval,'ALBERTINO MOREIRA REIS','J',NULL,NULL,NULL, 09293984003);                                                                                             
insert into loc_cliente values ( seq_loc_cli.nextval,'FRANCISCO EUDASIO DE OLIVEIRA','J',NULL,NULL,NULL, 09293984003);                                                                                     
insert into loc_cliente values ( seq_loc_cli.nextval,'P. RABELO DE BRITO E CIA LTDA','J',NULL,NULL,NULL, 09293984003);                                                                                 
insert into loc_cliente values ( seq_loc_cli.nextval,'LEITE E SILVA LTDA','J',NULL,NULL,NULL, 09293984003);                                                                                                
insert into loc_cliente values ( seq_loc_cli.nextval,'E. RIBEIRO E CIA LTDA','J',NULL,NULL,NULL, 09293984003);                                                                                           
insert into loc_cliente values ( seq_loc_cli.nextval,'IRMAOS CANUTO LTDA','J',NULL,NULL,NULL, 09293984003);                                                                                              
insert into loc_cliente values ( seq_loc_cli.nextval,'LUNDGREN IRMAOS TEC S/A C PERNAMB','J',NULL,NULL,NULL, 09293984003);                                                              
insert into loc_cliente values ( seq_loc_cli.nextval,'ARTE LIVROS LTDA','J',NULL,NULL,NULL, 09293984003);                                                                                            
insert into loc_cliente values ( seq_loc_cli.nextval,'ADAUTO CAMELO DE SOUZA','J',NULL,NULL,NULL, 09293984003);                                                                                          
insert into loc_cliente values ( seq_loc_cli.nextval,'JOSE MARIA SALES','J',NULL,NULL,NULL, 09293984003);                                                                                                    
insert into loc_cliente values ( seq_loc_cli.nextval,'FRANCISO DE ALMEIDA CHAVES','J',NULL,NULL,NULL, 09293984003);                                                                           
insert into loc_cliente values ( seq_loc_cli.nextval,'ANASTACIO LEONARDO DA SILVA','J',NULL,NULL,NULL, 09293984003);
insert into loc_cliente values ( seq_loc_cli.nextval,'PADLIPSKAS LTDA','J',NULL,NULL,NULL, 8521257825);
insert into loc_cliente values ( seq_loc_cli.nextval,'LOPES LTDA','J',NULL,NULL,NULL, 6325412587);
insert into loc_cliente values ( seq_loc_cli.nextval,'OLIVEIRA S/A','J',NULL,NULL,NULL, 7452002523);
insert into loc_cliente values ( seq_loc_cli.nextval,'KOWSKWN LTDA','J',NULL,NULL,NULL, 986521478253);
insert into loc_cliente values ( seq_loc_cli.nextval,'MENKONE LTDA','J',NULL,NULL,NULL, 3598741268);
insert into loc_cliente values ( seq_loc_cli.nextval,'MARIA LINDA DA SILVA','F',NULL,NULL,NULL, 123874521);
insert into loc_cliente values ( seq_loc_cli.nextval,'JOAO PONEIS ME','F',NULL,NULL,NULL, 8625410);
insert into loc_cliente values ( seq_loc_cli.nextval,'JENNIFER SANTOS','F',NULL,NULL,NULL, 87451023);
insert into loc_cliente values ( seq_loc_cli.nextval,'LUIZA SOUZA','F',NULL,NULL,NULL, 962587412);
insert into loc_cliente values ( seq_loc_cli.nextval,'MONICA CEBOLINHA','F',NULL,NULL,NULL, 6644882244);
insert into loc_cliente values ( seq_loc_cli.nextval,'GUSTAV COLOSSUS PODEROSO','F',NULL,NULL,NULL, 0935284752);

-- Carregar Cliente Juridica
insert into loc_cli_juridica values ( 1, 591537000173,00124350909580, to_date('19/05/1993','dd/mm/rrrr'),0297736846652300,'BANANAL');                                                                                   
insert into loc_cli_juridica values ( 2, 289314000156,00124350909580, to_date('19/05/1993','dd/mm/rrrr'),0297736846652300,'BRUSCHETTA');                                                                                        
insert into loc_cli_juridica values ( 3, 297481000149,00124350909580, to_date('01/07/1991','dd/mm/rrrr'),0297736846652300,'MV RIBEIRO');                                                                                  
insert into loc_cli_juridica values ( 4, 127266000361,00124350909580, to_date('01/07/1992','dd/mm/rrrr'),0297736846652300,'SUP ANAPOLIS');                                                                                           
insert into loc_cli_juridica values ( 5, 32003000107, 00124350909580, to_date('01/07/1978','dd/mm/rrrr'),0297736846652300,'JOPAULO');                                                                             
insert into loc_cli_juridica values ( 6, 942334000184,00124350909580, to_date('01/07/1978','dd/mm/rrrr'),0297736846652300,'PANTANAL');                                                                                
insert into loc_cli_juridica values ( 7, 1047554000298,00124350909580,to_date('01/07/1978','dd/mm/rrrr'),0297736846652300,'SUPERPAO');                                                                                      
insert into loc_cli_juridica values ( 8, 1152834000185,00124350909580,to_date('01/07/1992','dd/mm/rrrr'),0297736846652300,'MENDONCA');                                                                                                        
insert into loc_cli_juridica values ( 9, 1319516000166,00124350909580,to_date('01/07/1992','dd/mm/rrrr'),0297736846652300,'BORDONI');                                                                               
insert into loc_cli_juridica values (10, 1339514000139,00124350909580,to_date('01/07/1992','dd/mm/rrrr'),0297736846652300,'GOTARGO');                                                                                     
insert into loc_cli_juridica values (11, 1359520000158,00124350909580,to_date('01/07/1992','dd/mm/rrrr'),0297736846652300,'HERMES');                                                                                    
insert into loc_cli_juridica values (12, 1524602000100,00124350909580,to_date('01/02/1991','dd/mm/rrrr'),0297736846652300,'JACARANDA');                                                                       
insert into loc_cli_juridica values (13, 1648211000106,00124350909580,to_date('01/05/1990','dd/mm/rrrr'),0297736846652300,'PALMA');                                                                       
insert into loc_cli_juridica values (14, 1763713000170,00124350909580,to_date('01/06/1976','dd/mm/rrrr'),0297736846652300,'ELIANA BORGES');                                                                         
insert into loc_cli_juridica values (15, 2279339000102,00124350909580,to_date('22/09/1993','dd/mm/rrrr'),0297736846652300,'MIRANDA');                                                                         
insert into loc_cli_juridica values (16, 2357879000159,00124350909580,to_date('01/09/1991','dd/mm/rrrr'),0297736846652300,'BARROSO');                                                                                                
insert into loc_cli_juridica values (17, 2482404000275,00124350909580,to_date('01/07/1983','dd/mm/rrrr'),0297736846652300,'J.B.CATALAO');                                                                         
insert into loc_cli_juridica values (18, 2699320000379,00124350909580,to_date('13/07/1993','dd/mm/rrrr'),0297736846652300,'PEREIRA PINTO');                                                                                   
insert into loc_cli_juridica values (19, 2709244000173,00124350909580,to_date('01/03/1988','dd/mm/rrrr'),0297736846652300,'CARNEIRO');                                                                                            
insert into loc_cli_juridica values (20, 2783546000191,00124350909580,to_date('12/07/1993','dd/mm/rrrr'),0297736846652300,'ATLAS ESCOLARES');                                                                                     
insert into loc_cli_juridica values (21, 3038908000182,00124350909580,to_date('08/07/1993','dd/mm/rrrr'),0297736846652300,'GIL DALLA VALLE');                                                                                   
insert into loc_cli_juridica values (22, 3178357000152,00124350909580,to_date('01/07/1992','dd/mm/rrrr'),0297736846652300,'UNIVERSAL');                                                                                           
insert into loc_cli_juridica values (23, 3241585000120,00124350909580,to_date('01/05/1992','dd/mm/rrrr'),0297736846652300,'QUILES');                                                                                                  
insert into loc_cli_juridica values (24, 3345105000170,00124350909580,to_date('30/04/1993','dd/mm/rrrr'),0297736846652300,'RAMAO LEITE');                                                                                    
insert into loc_cli_juridica values (25, 3487246000128,00124350909580,to_date('14/06/1993','dd/mm/rrrr'),0297736846652300,'YAMASHITA LTDA');                                                                        
insert into loc_cli_juridica values (26, 3619046000181,00124350909580,to_date('01/07/1992','dd/mm/rrrr'),0297736846652300,'FRAN SOARES LIMA');                                                                                          
insert into loc_cli_juridica values (27, 3648284000204,00124350909580,to_date('09/06/1993','dd/mm/rrrr'),0297736846652300,'ACENDOR');                                                                                             
insert into loc_cli_juridica values (28, 3790896000148,00124350909580,to_date('27/05/1993','dd/mm/rrrr'),0297736846652300,'MARTINS LTDA');                                                                                            
insert into loc_cli_juridica values (29, 3838307000154,00124350909580,to_date('01/10/1983','dd/mm/rrrr'),0297736846652300,'CAMILO LTDA');                                                                             
insert into loc_cli_juridica values (30, 3879608000126,00124350909580,to_date('12/05/1993','dd/mm/rrrr'),0297736846652300,'LERAMOS LTDA');                                                                                            
insert into loc_cli_juridica values (31, 4038931000130,00124350909580,to_date('01/07/1992','dd/mm/rrrr'),0297736846652300,'TROISCO LTDA');                                                                                          
insert into loc_cli_juridica values (32, 4083614000135,00124350909580,to_date('01/07/1992','dd/mm/rrrr'),0297736846652300,'NACIONAL LTDA');                                                                                             
insert into loc_cli_juridica values (33, 4657573000739,00124350909580,to_date('12/04/1993','dd/mm/rrrr'),0297736846652300,'CONCILAR');                                                                        
insert into loc_cli_juridica values (34, 4932216000731,00124350909580,to_date('01/07/1992','dd/mm/rrrr'),0297736846652300,'MINDONORTE');                                                                              
insert into loc_cli_juridica values (35, 5273263000198,00124350909580,to_date('01/08/1965','dd/mm/rrrr'),0297736846652300,'ILDEFONSO');                                                                             
insert into loc_cli_juridica values (36, 5361381000158,00124350909580,to_date('01/09/1966','dd/mm/rrrr'),0297736846652300,'H VERISSIMO');                                                                                     
insert into loc_cli_juridica values (37, 5434964000161,00124350909580,to_date('01/12/1992','dd/mm/rrrr'),0297736846652300,'BANAGRO');                                                  
insert into loc_cli_juridica values (38, 5521190000106,00124350909580,to_date('01/07/1992','dd/mm/rrrr'),0297736846652300,'NEIDA MARQUESE');                                                                                 
insert into loc_cli_juridica values (39, 5580493000108,00124350909580,to_date('29/03/1994','dd/mm/rrrr'),0297736846652300,'ALBERTINO REIS');                                                                                             
insert into loc_cli_juridica values (40, 5817234000140,00124350909580,to_date('01/05/1985','dd/mm/rrrr'),0297736846652300,'FRANEUDASIO');                                                                                     
insert into loc_cli_juridica values (41, 6065155000192,00124350909580,to_date('01/07/1992','dd/mm/rrrr'),0297736846652300,'P. RABELO E CIA');                                                                                 
insert into loc_cli_juridica values (42, 6182737000159,00124350909580,to_date('24/03/1994','dd/mm/rrrr'),0297736846652300,'BAZER LEITE');                                                                                                
insert into loc_cli_juridica values (43, 6687289000650,00124350909580,to_date('01/04/1989','dd/mm/rrrr'),0297736846652300,'E.RIBEIRO LTDA');                                                                                         
insert into loc_cli_juridica values (44, 6789259000140,00124350909580,to_date('01/08/1978','dd/mm/rrrr'),0297736846652300,'CANUTO LTDA');                                                                                              
insert into loc_cli_juridica values (45, 7209612045581,00124350909580,to_date('01/07/1992','dd/mm/rrrr'),0297736846652300,'PERNAMBUCANAS');                                                              
insert into loc_cli_juridica values (46, 7287519000141,00124350909580,to_date('24/09/1993','dd/mm/rrrr'),0297736846652300,'ARTE LIVROS');                                                                                            
insert into loc_cli_juridica values (47, 7562879000104,00124350909580,to_date('05/05/1994','dd/mm/rrrr'),0297736846652300,'ADAUTO SOUZA');                                                                                          
insert into loc_cli_juridica values (48, 7564883000101,00124350909580,to_date('09/09/1993','dd/mm/rrrr'),0297736846652300,'MARSALES');                                                                                                    
insert into loc_cli_juridica values (49, 7623259000138,00124350909580,to_date('14/09/1993','dd/mm/rrrr'),0297736846652300,'ALMEIDA CHAVES');                                                                           
insert into loc_cli_juridica values (50, 7988363000126,00124350909580,to_date('01/07/1992','dd/mm/rrrr'),0297736846652300,'ANASTACIOLEOSILVA');

-- Carregar Cliente Pessoa Fisica
insert into loc_cli_fisica( cd_cliente, nr_cpf, nr_habilitacao, dt_nascimento, nr_rg, tit_eleitor) values ( 56, 60821522639, 123456788, to_date('18/05/1967','dd/mm/yyyy'), 17688193, 987654321);
insert into loc_cli_fisica( cd_cliente, nr_cpf, nr_habilitacao, dt_nascimento, nr_rg, tit_eleitor) values ( 57, 89727118704, 885544112, to_date('13/03/2002','dd/mm/yyyy'), 28965874, null);
insert into loc_cli_fisica( cd_cliente, nr_cpf, nr_habilitacao, dt_nascimento, nr_rg, tit_eleitor) values ( 58,   670517614, 336699885, to_date('19/12/2000','dd/mm/yyyy'), 12512535, null);
insert into loc_cli_fisica( cd_cliente, nr_cpf, nr_habilitacao, dt_nascimento, nr_rg, tit_eleitor) values ( 59, 58819147599, 775522110, to_date('21/03/1940','dd/mm/yyyy'), 06985214, 698745215);
insert into loc_cli_fisica( cd_cliente, nr_cpf, nr_habilitacao, dt_nascimento, nr_rg, tit_eleitor) values ( 60, 25685125847, 301287452, to_date('31/03/1977','dd/mm/yyyy'), 74582153, 547895232);

-- Carregar Endere�o de Cliente
insert into loc_endereco_cliente ( cd_end_cli, logradouro, bairro, cep, tp_endereco, cd_cliente, cd_cidade, cd_estado, numero ) values (1, 'Rua Sampei Sato', 'Ermelino Matarazzo', 03814010, 'E', 12, 25, 'SP', 476);
insert into loc_endereco_cliente ( cd_end_cli, logradouro, bairro, cep, tp_endereco, cd_cliente, cd_cidade, cd_estado, numero ) values (1, 'Rua Rubens Santos', 'Bela Vista', 01317910, 'C', 15, 1, 'SP', 1343);
insert into loc_endereco_cliente ( cd_end_cli, logradouro, bairro, cep, tp_endereco, cd_cliente, cd_cidade, cd_estado, numero ) values (1, 'Rua da Alegria', 'Centro', 01301000, 'E', 58, 1, 'SP', 12);
insert into loc_endereco_cliente ( cd_end_cli, logradouro, bairro, cep, tp_endereco, cd_cliente, cd_cidade, cd_estado, numero ) values (1, 'Av. que Sobe e Desce', 'Centro', 01301000, 'C', 57, 1, 'SP', 55);
insert into loc_endereco_cliente ( cd_end_cli, logradouro, bairro, cep, tp_endereco, cd_cliente, cd_cidade, cd_estado, numero ) values (1, 'Av. Principal', 'Centro', 01301000, 'C', 18, 1, 'SP', 235);


-- Carregar Movimento Transacao --
insert into loc_movto_transacao (CD_TRANSACAO,  DESC_TRANSACAO, DEB_CRED, STATUS_TRANSACAO) values (SEQ_LOC_MOVTO_TRANSACAO.NEXTVAL, 'LIQUIDA��O','C','A');
insert into loc_movto_transacao (CD_TRANSACAO,  DESC_TRANSACAO, DEB_CRED, STATUS_TRANSACAO) values (SEQ_LOC_MOVTO_TRANSACAO.NEXTVAL, 'ESTORNO DE LIQUIDA��O','D','A');
insert into loc_movto_transacao (CD_TRANSACAO,  DESC_TRANSACAO, DEB_CRED, STATUS_TRANSACAO) values (SEQ_LOC_MOVTO_TRANSACAO.NEXTVAL, 'CANCELAMENTO','C','A');
insert into loc_movto_transacao (CD_TRANSACAO,  DESC_TRANSACAO, DEB_CRED, STATUS_TRANSACAO) values (SEQ_LOC_MOVTO_TRANSACAO.NEXTVAL, 'ESTORNO CANCELAMENTO','D','A');
insert into loc_movto_transacao (CD_TRANSACAO,  DESC_TRANSACAO, DEB_CRED, STATUS_TRANSACAO) values (SEQ_LOC_MOVTO_TRANSACAO.NEXTVAL, 'LIQUIDA��O PARCIAL','C','A');
insert into loc_movto_transacao (CD_TRANSACAO,  DESC_TRANSACAO, DEB_CRED, STATUS_TRANSACAO) values (SEQ_LOC_MOVTO_TRANSACAO.NEXTVAL, 'ESTORNO LIQUIDA��O PARCIAL','D','A');

-- Carregar Operadora Cartao --
insert into loc_operadora_cartao( cd_operadora, nm_operadora) values (1,'VISA');
insert into loc_operadora_cartao( cd_operadora, nm_operadora) values (2,'MASTER CARD');
insert into loc_operadora_cartao( cd_operadora, nm_operadora) values (3,'BANCO 24 HORAS');
insert into loc_operadora_cartao( cd_operadora, nm_operadora) values (4,'AMERICAN EXPRESS');

-- Carregar Condi��o de Pagamento --
insert into loc_cond_pagto values (1,'A VISTA');
insert into loc_cond_pagto values (2,'30 DIAS');
insert into loc_cond_pagto values (3,'60 DIAS');
insert into loc_cond_pagto values (4,'90 DIAS');
insert into loc_cond_pagto values (5,'120 DIAS');

-- Carregar Condi��o de Parcelas --
insert into loc_cond_parcelas values (1,1, 'PAGTO NO ATO DA COMPRA',0);
insert into loc_cond_parcelas values (2,1, 'PAGTO PARCELADO EM 30 DIAS',30);
insert into loc_cond_parcelas values (3,1, 'PAGTO PARCELADO EM 60 DIAS',30);
insert into loc_cond_parcelas values (3,2, 'PAGTO PARCELADO EM 60 DIAS',60);
insert into loc_cond_parcelas values (4,1, 'PAGTO PARCELADO EM 90 DIAS',30);
insert into loc_cond_parcelas values (4,2, 'PAGTO PARCELADO EM 90 DIAS',60);
insert into loc_cond_parcelas values (4,3, 'PAGTO PARCELADO EM 90 DIAS',90);
insert into loc_cond_parcelas values (5,1, 'PAGTO PARCELADO EM 120 DIAS',30);
insert into loc_cond_parcelas values (5,2, 'PAGTO PARCELADO EM 120 DIAS',60);
insert into loc_cond_parcelas values (5,3, 'PAGTO PARCELADO EM 120 DIAS',90);
insert into loc_cond_parcelas values (5,4, 'PAGTO PARCELADO EM 120 DIAS',120);

-- Carregar Proprietario --
insert into loc_proprietario values ( 1, 'Adriana Lopes da Silva', 'F','(011) 9988-7766', '12325285425', NULL,  'adls.gmail.com');
insert into loc_proprietario values ( 2, 'Celso Santos'          , 'F','(011) 9644-1122', '36521487533', NULL, 'cs@yahoo.com');
insert into loc_proprietario values ( 3, 'Yuri Gagari'           , 'F','(011) 7855-2154', '85402306984', NULL, 'yurig@kings.com');
insert into loc_proprietario values ( 4, 'Maria Linda Oliveira'  , 'F','(011) 6587-5102', '75195385200', NULL, 'marialinda@Tomtom.com');
insert into loc_proprietario values ( 5, 'VeiVei Veiculos Ltda'  , 'J','(011) 85147-1247', NULL, '01415825000115', 'v3@hotmail.com');
insert into loc_proprietario values ( 6, 'Tamara Rozet        '  , 'F','(011) 85147-1247', NULL, '92213176000140', 'tamarar@gmail.com');
insert into loc_proprietario values ( 7, 'Veic veiculos Ltda'    , 'J','(011) 85147-1247', NULL, '43165437000198', 'veve@xinxan.com');
insert into loc_proprietario values ( 8, 'ShowCar S/A'           , 'J','(047) 4458-8412' , 09308352585, '16221236000198', 'showcar.com');
insert into loc_proprietario values ( 9, 'InvestCar LTDA'        , 'J','(055) 3312-8745' , 05124852158, NULL, 'investcar@uol.com.br');
insert into loc_proprietario values (10, 'Ferdinando Fernandes'  , 'F','(021) 2235-6910' , NULL, '75565845000123', 'fefe@yahoo.com.br');

-- Carregar Endere�o do Propriet�rio --
insert into loc_endereco_proprietario  (CD_ENDERECO_PROP, LOGRADOURO, CD_PROPRIETARIO, CEP,  BAIRRO, TP_ENDERECO, CD_CIDADE, COMPLEMENTO, CD_ESTADO ) values ( 1,'Rua Jose Bonifacio, 250, 13 and.', 1 ,03390000, 'CENTRO', 'R', 1, NULL, 'SP');
insert into loc_endereco_proprietario  (CD_ENDERECO_PROP, LOGRADOURO, CD_PROPRIETARIO, CEP,  BAIRRO, TP_ENDERECO, CD_CIDADE, COMPLEMENTO, CD_ESTADO ) values ( 2,'Rua Carlos de Souza 1250',2,03398701, 'STA. EFIGENIA','R',1 ,'BLOCO A', 'SP');
insert into loc_endereco_proprietario  (CD_ENDERECO_PROP, LOGRADOURO, CD_PROPRIETARIO, CEP,  BAIRRO, TP_ENDERECO, CD_CIDADE, COMPLEMENTO, CD_ESTADO ) values ( 3,'AV. BRASIL',3,03398701, 'PINHEIROS','R',1,NULL,'SP');
insert into loc_endereco_proprietario  (CD_ENDERECO_PROP, LOGRADOURO, CD_PROPRIETARIO, CEP,  BAIRRO, TP_ENDERECO, CD_CIDADE, COMPLEMENTO, CD_ESTADO ) values ( 4,'AV. CRUZEIRO DO SUL',4,03390985, 'SANTANA','R',1, 'BLOCOE 3 AND', 'SP');
insert into loc_endereco_proprietario  (CD_ENDERECO_PROP, LOGRADOURO, CD_PROPRIETARIO, CEP,  BAIRRO, TP_ENDERECO, CD_CIDADE, COMPLEMENTO, CD_ESTADO ) values ( 5,'RUA SETE DE ABRIL',5,01230000, 'CENTRO','C',1, NULL, 'SP');
insert into loc_endereco_proprietario  (CD_ENDERECO_PROP, LOGRADOURO, CD_PROPRIETARIO, CEP,  BAIRRO, TP_ENDERECO, CD_CIDADE, COMPLEMENTO, CD_ESTADO ) values ( 6,'AV. FRANCISCO VIERIRA BUENO',6,03390000, 'VILA PRIMAVERA','R',1, NULL, 'SP');
insert into loc_endereco_proprietario  (CD_ENDERECO_PROP, LOGRADOURO, CD_PROPRIETARIO, CEP,  BAIRRO, TP_ENDERECO, CD_CIDADE, COMPLEMENTO, CD_ESTADO ) values ( 7,'AV. SENADOR QUEIROS', 7, 03390000, 'LUZ','C',1,NULL,'SP');

-- Carregar Grupo de ve�culo --
insert into loc_grupo values ( 0, 'Carro Antigo', 645 );
insert into loc_grupo values ( 1, 'Carro B�sico', 45 );
insert into loc_grupo values ( 2, 'Van B�sico', 120 );
insert into loc_grupo values ( 3, 'Carro com ar condicionado', 60 );
insert into loc_grupo values ( 4, 'Van com ar condicionado', 155 );
insert into loc_grupo values ( 5, 'Motocicleta 125 cc', 70 );
insert into loc_grupo values ( 6, 'Motocicleta 250 cc', 180);
insert into loc_grupo values ( 7, 'Motocicleta 500 cc', 350 );
insert into loc_grupo values ( 8, 'Onibus Executivo', 837 );

-- Carregar Ve�culo --
insert into loc_veiculo values ( 'CZR9988', 1,  '9C2ND28001R099654', 'A', 'CAR', 1100	,'GASOLINA'	,'Vectra'				,'Azul Marinho'		, 3 );
insert into loc_veiculo values ( 'BZT2255', 2,  '1Z2WE34111V076321', 'A', 'CAR', 2200	,'GASOLINA'	,'Tempra'				,'Preto'		, 3 );
insert into loc_veiculo values ( 'POO3456', 2,  '1Z2WE34111V076321', 'A', 'CAR', 2200	,'GASOLINA'	,'CORSA SEDAN'				,'AZUL'			, 3 );
insert into loc_veiculo values ( 'DRV4395', 3,  '4V5MM67992S123467', 'A', 'CAR', 3300	,'GASOLINA'	,'Fiat Palio'				,'CINZA STIL'		, 1 );
insert into loc_veiculo values ( 'DRV4396', 3,  '4VBGM67992S123467', 'A', 'CAR', 3300	,'GASOLINA'	,'Fiat Palio'				,'CINZA STIL'		, 1 );
insert into loc_veiculo values ( 'DRV4397', 3,  '4V5MJKKL92S123467', 'A', 'CAR', 3300	,'GASOLINA'	,'Fiat Palio'				,'CINZA STIL'		, 1 );
insert into loc_veiculo values ( 'DVC4345', 4,  '4X5MF67992N134568', 'A', 'CAR', 4600	,'GASOLINA'	,'Fiat Brava HGT'			,'Cinza Stil'		, 5 );
insert into loc_veiculo values ( 'CCC2400', 5,  '6V5MM64552S123800', 'A', 'CAR', 18300	,'GASOLINA'	,'Gol'					,'Verde'		, 1 );
insert into loc_veiculo values ( 'MNN2521', 6,  '0V5XX67992S120057', 'A', 'CAR', 29800	,'GASOLINA'	,'Volvo S80'				,'Preto'		, 5 );
insert into loc_veiculo values ( 'AWW1956', 7,  '1V5BB67992G120345', 'A', 'CAR', 19800	,'GASOLINA'	,'Parati'				,'Verde Samanbaia'	, 4 );
insert into loc_veiculo values ( 'PPP2005', 7,  '234BB67992G12HY45', 'A', 'CAR', 10342	,'ALCOOL'	,'FISTA'				,'PRETA'		, 1 );
insert into loc_veiculo values ( 'DSE8990', 6,  '0V5XX67992S120057', 'A', 'CAR', 21340	,'GASOLINA'	,'Honda Civic'				,'Cinza Bari'		, 5 );
insert into loc_veiculo values ( 'XDF5600', 3,  '5V66X67992S156769', 'A', 'CAR', 11340	,'GASOLINA'	,'Peugeot 206'				,'Vermelho'		, 3 );
insert into loc_veiculo values ( 'CCR4567', 5, '9CFGD34501R099654', 'A', 'CAR', 2000	,'GASOLINA'	,'SIENA'				,'CINZA BARI'		, 3 );
insert into loc_veiculo values ( 'NMH5558', 6, 'XCDFGD34501R09954', 'A', 'VAN', 1200	,'GASOLINA'	,'ECO SPORT'				,'PRETA'		, 4 );
insert into loc_veiculo values ( 'XXP8909', 7, 'XCDFGD34501R45567', 'A', 'VAN', 14545	,'ALCOOL'	,'MERIVA'				,'PRETA'		, 4 );
insert into loc_veiculo values ( 'PLO1200', 1, 'FGTRYGD345ERR5768', 'A', 'CAR', 10545	,'ALCOOL'	,'FOCUS'				,'PRATA'		, 3 );
insert into loc_veiculo values ( 'QQW1455', 2, '12TRYGD345ERR5768', 'A', 'CAR', 10222  ,'GASOLINA'	,'FOCUS SEDAN'				,'PRATA'		, 3 );
insert into loc_veiculo values ( 'PLV1200', 2, 'FGTRYGD345ERR5768', 'A', 'CAR', 6545	,'GASOLINA'	,'FOCUS SEDAN'				,'CINZA'		, 3 );
insert into loc_veiculo values ( 'WWR4589', 4, '345RYGD345ERR1267', 'A', 'CAR', 21545	,'GASOLINA'	,'BRAVA HGT 1.8'			,'CINZA STIL'		, 3 );
insert into loc_veiculo values ( 'YYT2341', 4, 'EFFRYGD345ERR1267', 'A', 'CAR', 21545	,'GASOLINA'	,'BRAVA HGT 1.8'			,'AZUL PETROLEO'	, 3 );
insert into loc_veiculo values ( 'TTT4348', 5, 'EFFRYGD345ERR1267', 'A', 'CAR', 3545	,'ALCOOL'	,'BRAVA HGT 1.8'			,'PRETA'		, 3 );
insert into loc_veiculo values ( 'FFG4433', 5, 'EFFRYGD345ERR1267', 'A', 'CAR', 8577	,'ALCOOL'	,'BRAVA HGT 1.8'			,'AZUL PETROLEO'	, 3 );
insert into loc_veiculo values ( 'ZXD9001', 5, 'PORTYGD345BNFG342', 'A', 'CAR', 21545	,'ALCOOL'	,'FIESTA'				,'VERDE SAMAMBAIA'	, 1 );
insert into loc_veiculo values ( 'MNW9087', 5, 'XCDFGD34501R09954', 'A', 'CAR', 23545	,'GASOLINA'	,'MAREA'				,'CINZA STIL'		, 5 );
insert into loc_veiculo values ( 'BBF6544', 2, 'EFFRYGD345ERR1345', 'A', 'CAR', 12389  ,'GASOLINA'	,'AUDI A4'				,'VERMELHA'		, 5 );
insert into loc_veiculo values ( 'JGH1245', 7, '1V5BB45692G120344', 'A', 'CAR', 3456	,'GASOLINA'	,'AUDI A6'				,'AZUL'			, 5 );
insert into loc_veiculo values ( 'LPG6523', 7, '0V5XX67992S120057', 'A', 'CAR', 9800	,'GASOLINA'	,'GOLF'					,'BRANCO'		, 3 );
insert into loc_veiculo values ( 'SXE2343', 4, '4V5MM67992FRD3467', 'A', 'CAR', 2345	,'GASOLINA'	,'MERCEDES CLASSE A'			,'PRATA'		, 6 );
insert into loc_veiculo values ( 'CAC4270', 1, '456MM6DD2FRD3445B', 'A', 'CAR', 67234  ,'GASOLINA'	,'MERCEDES 300 E' 			,'PRETA'		, 6 );
insert into loc_veiculo values ( 'TTW9083', 1, 'XCDFGD34501R09954', 'A', 'CAR', 23545	,'GASOLINA'	,'CELTA 1.0'				,'CINZA STIL'		, 1 );
insert into loc_veiculo values ( 'TTG6544', 1, 'EFFRYGD345ERR1345', 'A', 'CAR', 10788  ,'GASOLINA'	,'ASTRA GL'				,'VERMELHA'		, 3 );
insert into loc_veiculo values ( 'TTJ1245', 3, '1V5BB45692G120344', 'A', 'CAR', 3456	,'GASOLINA'	,'CORSA SEDAN'				,'AZUL'			, 1 );
insert into loc_veiculo values ( 'XDF6544', 3, '0V5XX67992S120057', 'A', 'CAR', 9800	,'GASOLINA'	,'FERRARI 355 GTS TARGA'		,'VERMELHA'		, 7 );
insert into loc_veiculo values ( 'LPH6555', 3, '0V5XX67992S120057', 'A', 'CAR', 29800	,'GASOLINA'	,'FERRARI 355 GTS TARGA'		,'AMARELA'		, 7 );
insert into loc_veiculo values ( 'SSE2343', 5, '4V5MM67992FRD3467', 'A', 'CAR', 2345	,'GASOLINA'	,'JAGUAR S-TYPE 3.0 V6' 		,'PRATA'		, 7 );
insert into loc_veiculo values ( 'CAX4271', 5, '456MM6DD2FRD3445B', 'A', 'CAR', 67234  ,'GASOLINA'	,'MASERATI 3200 GT COUPE'		,'PRETA'		, 7 );
insert into loc_veiculo values ( 'CAP4271', 5, '456MM6DD2FRD3445B', 'A', 'CAR', 15266  ,'GASOLINA'	,'MASERATI 3200 GT COUPE'		,'PRATA'		, 7 );
insert into loc_veiculo values ( 'CAL4345', 6, '456MM6D32FRDG445J', 'A', 'CAR', 11250  ,'GASOLINA'	,'LAMBORGHINI GALLARDO COUPE 5.0'	,'AMARELA'		, 7 );
insert into loc_veiculo values ( 'PQE3452', 6, '456MM6DD2FRD3675N', 'A', 'CAR', 19456  ,'GASOLINA'	,'PORSCHE 928  '			,'AZUL'			, 7 );
insert into loc_veiculo values ( 'PQT3333', 6, '456MM6DD2FRD8845X', 'A', 'CAR', 23134  ,'GASOLINA'	,'PORSCHE BOXSTER S CABRIOLET'		,'CINZA STIL'		, 7 );
insert into loc_veiculo values ( 'QQQ3344', 7, '456MM6DD2FRD3445P', 'A', 'CAR', 34234  ,'GASOLINA'	,'BMW 318iA COMPACT 1.8 16v  '		,'AZUL'			, 7 );
insert into loc_veiculo values ( 'GHJ4511', 7, '9CFGD34501R099654', 'A', 'CAR', 2000	,'GASOLINA'	,'SIENA'				,'CINZA	BARI'		, 3 );
insert into loc_veiculo values ( 'RRJ4512', 7, '9CFGD34501R099654', 'A', 'CAR', 5000	,'GASOLINA'	,'SIENA'				,'CINZA BARI'		, 3 );
insert into loc_veiculo values ( 'JKR6655', 7, '9CFGD34561R099654', 'A', 'CAR', 5600	,'GASOLINA'	,'SIENA 1.6'				,'CINZA STIL'		, 3 );
insert into loc_veiculo values ( 'JPP6612', 5, '9CFGD34561R099654', 'A', 'CAR', 5600	,'GASOLINA'	,'SIENA 1.6'				,'CINZA STIL'		, 3 );
insert into loc_veiculo values ( 'TTX1243', 6, '1V5BB45692G120344', 'A', 'CAR', 8456	,'GASOLINA'	,'CORSA WIND 1.0'				,'AZUL'			, 1 );
insert into loc_veiculo values ( 'XXW1008', 6, '1V5BB45692G120345', 'A', 'CAR', 18456	,'GASOLINA'	,'CORSA WIND 1.0'				,'AZUL'			, 1 );
insert into loc_veiculo values ( 'OXO9002', 1, '1V5BB45692G120345', 'A', 'CAR', 18456	,'GASOLINA'	,'CORSA WIND 1.0'				,'AZUL'			, 1 );

-- Carregar Operadora --
insert into loc_operadora (CD_OPERADORA, NM_OPERADORA ) values (1,'TIM');
insert into loc_operadora (CD_OPERADORA, NM_OPERADORA ) values (2,'VIVO');
insert into loc_operadora (CD_OPERADORA, NM_OPERADORA ) values (3,'CLARO');
insert into loc_operadora (CD_OPERADORA, NM_OPERADORA ) values (4,'TELEFONICA');
insert into loc_operadora (CD_OPERADORA, NM_OPERADORA ) values (5,'OI');
insert into loc_operadora (CD_OPERADORA, NM_OPERADORA ) values (6,'EMBRATEL');

-- Carregar Prefixo -- 
insert into loc_prefixo (cd_prefixo, desc_prefixo) values (6702, 'PREFIXO 6702');
insert into loc_prefixo (cd_prefixo, desc_prefixo) values (6703, 'PREFIXO 6703');
insert into loc_prefixo (cd_prefixo, desc_prefixo) values (6704, 'PREFIXO 6704');
insert into loc_prefixo (cd_prefixo, desc_prefixo) values (6705, 'PREFIXO 6705');
insert into loc_prefixo (cd_prefixo, desc_prefixo) values (6706, 'PREFIXO 6706');
insert into loc_prefixo (cd_prefixo, desc_prefixo) values (6708, 'PREFIXO 6708');
insert into loc_prefixo (cd_prefixo, desc_prefixo) values (6709, 'PREFIXO 6709');
insert into loc_prefixo (cd_prefixo, desc_prefixo) values (6254, 'PREFIXO 6254');
insert into loc_prefixo (cd_prefixo, desc_prefixo) values (6502, 'PREFIXO 6502');



-- Carregar DDD --
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AGUAS DA PRATA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL);

INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,19 ,SEQ_LOC_DDD.CURRVAL, 1 );


INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AGUAS DE LINDOIA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL);
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,19 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AGUAS DE SANTA BARBARA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AGUAS DE SAO PEDRO' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL);
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,19 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AGUDOS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ALAMBARI' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ALFREDO MARCONDES' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ALTAIR' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ALTINOPOLIS' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,16 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ALTO ALEGRE' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,18 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ALUMINIO' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ALVARES FLORENCE' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ALVARES MACHADO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ALVARO DE CARVALHO' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ALVINLANDIA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AMERICANA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,19 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AMERICO BRASILIENSE' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AMERICO DE CAMPOS' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AMPARO' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,19 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ANALANDIA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,19 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ANDRADINA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ANGATUBA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ANHEMBI' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ANHUMAS' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('APARECIDA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
insert into loc_ddd_prefixo (CD_PREFIXO     ,CD_DDD,   SEQ_DDD, ESTADO_DDD ) values (6702, 012, SEQ_LOC_DDD.CURRVAL, 'SP');
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('APARECIDA DO OESTE' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('APIAI' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ARACARIGUAMA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ARACATUBA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ARACOIABA DA SERRA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ARAMINA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ARANDU' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ARAPEI' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ARARAQUARA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ARARAS' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ARCO-IRIS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AREALVA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AREIAS' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AREIOPOLIS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ARIRANHA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ARTUR NOGUEIRA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,19 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ARUJA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,11 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ASPASIA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ASSIS' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('ATIBAIA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
insert into loc_ddd_prefixo (CD_PREFIXO     ,CD_DDD,   SEQ_DDD, ESTADO_DDD ) values (6703, 011, SEQ_LOC_DDD.CURRVAL, 'SP');
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AURIFLAMA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AVAI' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,14 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AVANHANDAVA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('AVARE' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BADY BASSITT' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BALBINOS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BALSAMO' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,17 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BANANAL' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BARAO DE ANTONINA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BARBOSA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BARIRI' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BARRA BONITA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BARRA DO CHAPEU' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BARRA DO TURVO' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BARRETOS' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,17 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BARRINHA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BARUERI' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BASTOS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BATATAIS' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BAURU' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BEBEDOURO' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BENTO DE ABREU' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BERNARDINO DE CAMPOS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BERTIOGA' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
insert into loc_ddd_prefixo (CD_PREFIXO     ,CD_DDD,   SEQ_DDD, ESTADO_DDD ) values (6705, 013, SEQ_LOC_DDD.CURRVAL, 'SP');
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BILAC' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BIRIGUI' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BIRITIBA-MIRIM' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BOA ESPERANCA DO SUL' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BOCAINA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
insert into loc_ddd_prefixo (CD_PREFIXO     ,CD_DDD,   SEQ_DDD, ESTADO_DDD ) values (6708, 014, SEQ_LOC_DDD.CURRVAL, 'SP');
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BOFETE' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BOITUVA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,15 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BOM JESUS DOS PERDOES' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,11 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BOM SUCESSO DE ITARARE' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BORA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BORACEIA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BORBOREMA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
insert into loc_ddd_prefixo (CD_PREFIXO     ,CD_DDD,   SEQ_DDD, ESTADO_DDD ) values (6254, 016, SEQ_LOC_DDD.CURRVAL, 'SP');
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BOREBI' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BOTUCATU' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BRAGANCA PAULISTA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BRAUNA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
insert into loc_ddd_prefixo (CD_PREFIXO     ,CD_DDD,   SEQ_DDD, ESTADO_DDD ) values (6502, 018, SEQ_LOC_DDD.CURRVAL, 'SP');
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BREJO ALEGRE' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BRODOWSKI' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BROTAS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BURI' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
insert into loc_ddd_prefixo (CD_PREFIXO     ,CD_DDD,   SEQ_DDD, ESTADO_DDD ) values (6709, 015, SEQ_LOC_DDD.CURRVAL, 'SP');
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BURITAMA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('BURITIZAL' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CABRALIA PAULISTA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CABREUVA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CACAPAVA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
insert into loc_ddd_prefixo (CD_PREFIXO     ,CD_DDD,   SEQ_DDD, ESTADO_DDD ) values (6704, 012, SEQ_LOC_DDD.CURRVAL, 'SP');
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CACHOEIRA PAULISTA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CACONDE' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CAFELANDIA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CAIABU' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CAIEIRAS' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CAIUA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CAJAMAR' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CAJATI' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CAJOBI' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CAJURU' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CAMPINA DO MONTE ALEGRE' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CAMPINAS' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CAMPO LIMPO PAULISTA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CAMPOS DO JORDAO' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD, SEQ_DDD) VALUES ('CAMPOS NOVOS PAULISTA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CANANEIA' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CANAS' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CANDIDO MOTA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CANDIDO RODRIGUES' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CANITAR' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CAPAO BONITO' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CAPELA DO ALTO' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CAPIVARI' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CARAGUATATUBA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CARAPICUIBA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CARDOSO' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CASA BRANCA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CASSIA DOS COQUEIROS' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CASTILHO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CATANDUVA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CATIGUA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CEDRAL' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CERQUILHO' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CESARIO LANGE' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CHARQUEADA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,19 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CHAVANTES' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,14 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CLEMENTINA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('COLINA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('COLOMBIA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CONCHAL' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CONCHAS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CORDEIROPOLIS' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('COROADOS' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CORONEL MACEDO' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CORUMBATAI' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('COSMOPOLIS' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('COSMORAMA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('COTIA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CRAVINHOS' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CRISTAIS PAULISTA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CRUZALIA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CRUZEIRO' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CUBATAO' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('CUNHA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('DESCALVADO' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('DIADEMA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('DIRCE REIS' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('DIVINOLANDIA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('DOBRADA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('DOIS CORREGOS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('DOLCINOPOLIS' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('DOURADO' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('DRACENA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('DUARTINA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('DUMONT' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ECHAPORA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ELDORADO' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ELIAS FAUSTO' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ELISIARIO' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('EMBAUBA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('EMBU' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('EMBU-GUACU' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('EMILIANOPOLIS' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,18 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ENGENHEIRO COELHO' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ESPIRITO SANTO DO PINHAL' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ESPIRITO SANTO DO TURVO' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ESTIVA GERBI' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ESTRELA DO NORTE' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ESTRELA DO OESTE' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('EUCLIDES DA CUNHA PAULISTA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('FARTURA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('FERNANDO PRESTES' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('FERNANDOPOLIS' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('FERNAO' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('FERRAZ DE VASCONCELOS' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('FLORA RICA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('FLOREAL' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('FLORIDA PAULISTA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('FLORINIA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('FRANCA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('FRANCISCO MORATO' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('FRANCO DA ROCHA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GABRIEL MONTEIRO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GALIA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,14 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GARCA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GASTAO VIDIGAL' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GAVIAO PEIXOTO' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GENERAL SALGADO' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GETULINA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GLICERIO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL);
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,18 ,SEQ_LOC_DDD.CURRVAL, 1 ); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUAICARA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUAIMBE' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUAIRA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUAPIACU' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,17 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUAPIARA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUARA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUARACAI' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUARACI' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUARANI DO OESTE' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUARANTA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUARARAPES' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUARAREMA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUARATINGUETA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUAREI' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUARIBA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUARUJA' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUARULHOS' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUATAPARA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,16 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('GUZOLANDIA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('HERCULANDIA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('HOLAMBRA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('HORTOLANDIA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IACANGA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IACRI' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IARAS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IBATE' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IBIRA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IBIRAREMA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IBITINGA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IBIUNA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ICEM' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IEPE' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IGARACU DO TIETE' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IGARAPAVA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IGARATA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IGUAPE' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ILHA COMPRIDA' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ILHA SOLTEIRA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ILHABELA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('INDAIATUBA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('INDIANA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('INDIAPORA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('INUBIA PAULISTA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,18 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IPAUSSU' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IPERO' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IPEUNA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IPIGUA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IPORANGA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IPUA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IRACEMAPOLIS' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IRAPUA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('IRAPURU' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITABERA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITAI' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITAJOBI' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITAJU' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITANHAEM' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITAOCA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITAPECERICA DA SERRA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITAPETININGA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITAPEVA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITAPEVI' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITAPIRA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITAPIRAPUA PAULISTA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITAPOLIS' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITAPORANGA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITAPUI' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITAPURA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITAQUAQUECETUBA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITARARE' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITARIRI' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITATIBA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITATINGA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITIRAPINA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITIRAPUA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITOBI' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITU' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITUPEVA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ITUVERAVA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JABORANDI' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JABOTICABAL' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JACAREI' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JACI' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JACUPIRANGA' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JAGUARIUNA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JALES' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JAMBEIRO' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JANDIRA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JARDINOPOLIS' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JARINU' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JAU' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JERIQUARA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JOANOPOLIS' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JOAO RAMALHO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JOSE BONIFACIO' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JULIO MESQUITA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JUMIRIM' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JUNDIAI' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JUNQUEIROPOLIS' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JUQUIA' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('JUQUITIBA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LAGOINHA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LARANJAL PAULISTA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LAVINIA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LAVRINHAS' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LEME' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LENCOIS PAULISTA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LIMEIRA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LINDOIA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LINS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LORENA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LOURDES' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LOUVEIRA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LUCELIA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LUCIANOPOLIS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LUIS ANTONIO' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LUIZIANIA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LUPERCIO' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('LUTECIA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MACATUBA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MACAUBAL' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MACEDONIA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MAGDA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MAIRINQUE' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MAIRIPORA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MANDURI' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MARABA PAULISTA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MARACAI' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MARAPOAMA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MARIAPOLIS' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MARILIA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MARINOPOLIS' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MARTINOPOLIS' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MATAO' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MAUA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MENDONCA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MERIDIANO' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MESOPOLIS' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MIGUELOPOLIS' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MINEIROS DO TIETE' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MIRA ESTRELA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MIRACATU' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MIRANDOPOLIS' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MIRANTE DO PARANAPANEMA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MIRASSOL' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MIRASSOLANDIA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MOCOCA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MOGI GUACU' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MOJI DAS CRUZES' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MOJI-MIRIM' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MOMBUCA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MONCOES' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MONGAGUA' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MONTE ALEGRE DO SUL' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MONTE ALTO' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MONTE APRAZIVEL' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MONTE AZUL PAULISTA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MONTE CASTELO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MONTE MOR' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MONTEIRO LOBATO' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MORRO AGUDO' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MORUNGABA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MOTUCA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('MURUTINGA DO SUL' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NANTES' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NARANDIBA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NATIVIDADE DA SERRA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NAZARE PAULISTA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NEVES PAULISTA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NHANDEARA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NIPOA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NOVA ALIANCA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NOVA CAMPINA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NOVA CANAA PAULISTA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NOVA CASTILHO' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NOVA EUROPA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NOVA GRANADA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NOVA GUATAPORANGA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NOVA INDEPENDENCIA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NOVA LUZITANIA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NOVA ODESSA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NOVAIS' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NOVO HORIZONTE' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('NUPORANGA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('OCAUCU' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('OLEO' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('OLIMPIA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ONDA VERDE' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ORIENTE' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ORINDIUVA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ORLANDIA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('OSASCO' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('OSCAR BRESSANE' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('OSVALDO CRUZ' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('OURINHOS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('OURO VERDE' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('OUROESTE' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PACAEMBU' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PALESTINA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PALMARES PAULISTA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PALMEIRA DO OESTE' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PALMITAL' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PANORAMA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PARAGUACU PAULISTA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PARAIBUNA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PARAISO' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PARANAPANEMA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PARANAPUA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PARAPUA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PARDINHO' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PARIQUERA-ACU' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PARISI' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PATROCINIO PAULISTA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PAULICEIA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PAULINIA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PAULISTANIA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PAULO DE FARIA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PEDERNEIRAS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PEDRA BELA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PEDRANOPOLIS' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PEDREGULHO' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PEDREIRA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PEDRINHAS PAULISTA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PEDRO DE TOLEDO' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PENAPOLIS' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PEREIRA BARRETO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PEREIRAS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PERUIBE' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PIACATU' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PIEDADE' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PILAR DO SUL' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PINDAMONHANGABA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PINDORAMA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PINHALZINHO' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PIQUEROBI' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PIQUETE' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PIRACAIA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PIRACICABA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PIRAJU' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PIRAJUI' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PIRANGI' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PIRAPORA DO BOM JESUS' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PIRAPOZINHO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PIRASSUNUNGA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PIRATININGA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PITANGUEIRAS' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PLANALTO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PLATINA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('POA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('POLONI' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('POMPEIA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PONGAI' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PONTAL' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PONTALINDA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PONTES GESTAL' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('POPULINA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PORANGABA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PORTO FELIZ' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PORTO FERREIRA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('POTIM' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('POTIRENDABA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PRACINHA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PRADOPOLIS' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PRAIA GRANDE' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PRATANIA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PRESIDENTE ALVES' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PRESIDENTE BERNARDES' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PRESIDENTE EPITACIO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PRESIDENTE PRUDENTE' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PRESIDENTE VENCESLAU' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('PROMISSAO' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('QUADRA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('QUATA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('QUEIROZ' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('QUELUZ' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('QUINTANA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RAFARD' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RANCHARIA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('REDENCAO DA SERRA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('REGENTE FEIJO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('REGINOPOLIS' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('REGISTRO' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RESTINGA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RIBEIRA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RIBEIRAO BONITO' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RIBEIRAO BRANCO' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_OPERADORA_DDD ( ESTADO_DDD, CD_DDD, SEQ_DDD, CD_OPERADORA) VALUES ('SP' ,15 ,SEQ_LOC_DDD.CURRVAL, 1 );
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RIBEIRAO CORRENTE' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RIBEIRAO DO SUL' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RIBEIRAO DOS INDIOS' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RIBEIRAO GRANDE' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RIBEIRAO PIRES' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RIBEIRAO PRETO' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RIFAINA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RINCAO' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RINOPOLIS' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RIO CLARO' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RIO DAS PEDRAS' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RIO GRANDE DA SERRA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RIOLANDIA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RIVERSUL' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ROSANA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('ROSEIRA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RUBIACEA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('RUBINEIA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SABINO' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAGRES' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SALES' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SALES OLIVEIRA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SALESOPOLIS' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SALMOURAO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SALTINHO' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SALTO' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SALTO DE PIRAPORA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SALTO GRANDE' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANDOVALINA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA ADELIA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA ALBERTINA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA BARBARA DO OESTE' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA BRANCA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA CLARA DO OESTE' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA CRUZ DA CONCEICAO' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA CRUZ DA ESPERANCA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA CRUZ DAS PALMEIRAS' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA CRUZ DO RIO PARDO' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA ERNESTINA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA FE DO SUL' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA GERTRUDES' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA ISABEL' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA LUCIA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA MARIA DA SERRA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA MERCEDES' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA RITA DO PASSA QUATRO' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA RITA DO OESTE' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA ROSA DE VITERBO' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTA SALETE' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTANA DA PONTE PENSA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTANA DE PARNAIBA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTO ANASTACIO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTO ANDRE' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTO ANTONIO DA ALEGRIA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTO ANTONIO DE POSSE' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTO ANTONIO DO ARACANGUA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTO ANTONIO DO JARDIM' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTO ANTONIO DO PINHAL' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTO EXPEDITO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTOPOLIS DO AGUAPEI' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SANTOS' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO BENTO DO SAPUCAI' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO BERNARDO DO CAMPO' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO CAETANO DO SUL' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO CARLOS' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO FRANCISCO' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO JOAO DA BOA VISTA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO JOAO DAS DUAS PONTES' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO JOAO DE IRACEMA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO JOAO DO PAU DALHO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO JOAQUIM DA BARRA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO JOSE DA BELA VISTA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO JOSE DO BARREIRO' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO JOSE DO RIO PARDO' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO JOSE DO RIO PRETO' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO JOSE DOS CAMPOS' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO LOURENCO DA SERRA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO LUIS DO PARAITINGA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO MANUEL' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO MIGUEL ARCANJO' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO PAULO' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO PEDRO' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO PEDRO DO TURVO' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO ROQUE' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO SEBASTIAO' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO SEBASTIAO DA GRAMA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO SIMAO' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SAO VICENTE' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SARAPUI' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SARUTAIA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SEBASTIANOPOLIS DO SUL' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SERRA AZUL' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SERRA NEGRA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SERRANA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SERTAOZINHO' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SETE BARRAS' ,'SP' ,13 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SEVERINIA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SILVEIRAS' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SOCORRO' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SOROCABA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SUD MENNUCCI' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SUMARE' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SUZANAPOLIS' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('SUZANO' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TABAPUA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TABATINGA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TABOAO DA SERRA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TACIBA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TAGUAI' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TAIACU' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TAIUVA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TAMBAU' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TANABI' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TAPIRAI' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TAPIRATIBA' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TAQUARAL' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TAQUARITINGA' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TAQUARITUBA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TAQUARIVAI' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TARABAI' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TARUMA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TATUI' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TAUBATE' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TEJUPA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TEODORO SAMPAIO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TERRA ROXA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TIETE' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TIMBURI' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TORRE DE PEDRA' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TORRINHA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TRABIJU' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TREMEMBE' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TRES FRONTEIRAS' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TUIUTI' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TUPA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TUPI PAULISTA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TURIUBA' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('TURMALINA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('UBARANA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('UBATUBA' ,'SP' ,12 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('UBIRAJARA' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('UCHOA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('UNIAO PAULISTA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('URANIA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('URU' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('URUPES' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('VALENTIM GENTIL' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('VALINHOS' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('VALPARAISO' ,'SP' ,18 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('VARGEM' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('VARGEM GRANDE DO SUL' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('VARGEM GRANDE PAULISTA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('VARZEA PAULISTA' ,'SP' ,11 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('VERA CRUZ' ,'SP' ,14 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('VINHEDO' ,'SP' ,19 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('VIRADOURO' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('VISTA ALEGRE DO ALTO' ,'SP' ,16 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('VITORIA BRASIL' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('VOTORANTIM' ,'SP' ,15 ,SEQ_LOC_DDD.NEXTVAL); 
INSERT INTO LOC_DDD (CIDADE_DDD, ESTADO_DDD, CD_DDD,  SEQ_DDD) VALUES ('VOTUPORANGA' ,'SP' ,17 ,SEQ_LOC_DDD.NEXTVAL); 
--


-- Carregar Departamento --
insert into loc_depto values (    0, 'Conselho Acionistas');
insert into loc_depto values (   10, 'Financeiro');
insert into loc_depto values (   31, 'Vendas - Regi�o Norte');
insert into loc_depto values (   32, 'Vendas - Regi�o Sul');
insert into loc_depto values (   33, 'Vendas - Regi�o Sudeste');
insert into loc_depto values (   34, 'Vendas - Regi�o Nordeste');
insert into loc_depto values (   35, 'Vendas - Regiao Centro Oeste');
insert into loc_depto values (   41, 'Operacional - Regi�o Norte');
insert into loc_depto values (   42, 'Operacional - Regi�o Sul');
insert into loc_depto values (   43, 'Operacional - Regi�o Sudeste');
insert into loc_depto values (   44, 'Operacional - regi�o Nordeste');
insert into loc_depto values (   45, 'Operacional - Regi�o Centro Oeste');
insert into loc_depto VALUES (   50, 'Administracao Geral');
insert into loc_depto VALUES (   51, 'Prospeccao de Clientes');

-- Carregar Funcionario --
insert into loc_funcionario values ( 1,  'Yuri Gagari', to_date('01011999','ddmmyyyy'), null, null, 23567.98, 25, 50,2);
insert into loc_funcionario values ( 2,  'Maria Oliveira',  	to_date('0101200','ddmmyyyy'), 1 , null, 12258.45, 10, 50,2);
insert into loc_funcionario values ( 3,  'Simone Batista'	, 	to_date('18122000','ddmmyyyy'), 2 , null, 6985.63, 7, 50,5);
insert into loc_funcionario values ( 4,  'Adriana Doretto'	, 	to_date('18052001','ddmmyyyy'), 3 , null, 2145.74, 3, 42,3); 
insert into loc_funcionario values ( 5,  'MariaLinda Sauro'	, 	to_date('13032001','ddmmyyyy'), 3 , null, 2145.74, 3, 42,4);
insert into loc_funcionario values ( 6,  'Marinaldo de Souza', 	to_date('13032002','ddmmyyyy'), 3 , null, 2145.74, 3, 42,5);
insert into loc_funcionario values ( 7,  'Jose Carlos da Silva', 	to_date('13042003','ddmmyyyy'), 3 , null, 2145.74, 3, 42,6);
insert into loc_funcionario values ( 8,  'Paulo Norberto',   	to_date('13032002','ddmmyyyy'), 3 , null, 2145.74, 3,  50,7);
insert into loc_funcionario values ( 9,  'Carlo Noronha',     	to_date('13032002','ddmmyyyy'), 3 , null, 2145.74, 3, 42,8);
insert into loc_funcionario values ( 10, 'Diogo Sanguino',  	to_date('13032002','ddmmyyyy'), 3 , null, 2145.74, 3, 10,9);
insert into loc_funcionario values ( 11, 'Eleonora Sintra', 	to_date('13032002','ddmmyyyy'), 3 , null, 2145.74, 3, 10,1);
insert into loc_funcionario values ( 12, 'Helio Gomes',     	to_date('13032002','ddmmyyyy'), 3 , null, 5145.74, 3, 10,2);
insert into loc_funcionario values ( 13, 'Rogerio Reis Lima', 	to_date('13032002','ddmmyyyy'), 3 , null, 5145.74, 3, 33,2);
insert into loc_funcionario values ( 14, 'Geraldo Reis Lima',  	to_date('13032002','ddmmyyyy'), 3 , null, 5145.74, 3, 33,3);
insert into loc_funcionario values ( 15, 'Eduardo Satoru Sakai', 	to_date('13032002','ddmmyyyy'), 3 , null, 2145.74, 3, 33,2);
insert into loc_funcionario values ( 16, 'Daiane dos Santos',  	to_date('13032002','ddmmyyyy'), 3 , null, 4145.74, 3, 35,3);
insert into loc_funcionario values ( 17, 'Aline de Oliveira', 	to_date('13032002','ddmmyyyy'), 3 , null, 2145.74, 3, 35,5);
insert into loc_funcionario values ( 18, 'Jozivaldo Abreu',  	to_date('13032002','ddmmyyyy'), 3 , null, 3145.74, 3, 34,5);
insert into loc_funcionario values ( 19, 'Ricardo Genaro',  	to_date('13032002','ddmmyyyy'), 3 , null, 1145.00, 3, 44,4);
insert into loc_funcionario values ( 20, 'Marcos da Cunha', 	to_date('11012000','ddmmyyyy'), 3 , null, 2145.74, 3, 44,4);
insert into loc_funcionario values ( 21, 'Gustavo Lopes', 	to_date('15122008','ddmmyyyy'), null , 08352851488, 22541, 21, 50,3);
-- Ultima vers�o - Atualiza��o
alter table loc_funcionario add nm_cargo varchar2(30);

update loc_funcionario set nm_cargo = 'Presidente' where cd_func=1;
update loc_funcionario set nm_cargo = 'Diretor Operacional' where cd_func=2; 
update loc_funcionario set nm_cargo = 'Gerente de Atendimento' where cd_func=3;
update loc_funcionario set nm_cargo = 'Analista de Atendimento Sr' where cd_func between 4 and 11;
update loc_funcionario set nm_cargo = 'Supervisor de Atendimento' where cd_func = 12;
update loc_funcionario set nm_cargo = 'Supervisor de Atendimento' where cd_func = 13;
update loc_funcionario set nm_cargo = 'Supervisor de Atendimento' where cd_func = 14;
update loc_funcionario set nm_cargo = 'Analista de Atendimento Sr' where cd_func between 15 and 18;
update loc_funcionario set nm_cargo = 'Motoboy' where cd_func = 19;
update loc_funcionario set nm_cargo = 'Analista de Atendimento Sr' where cd_func  = 21;


--Prompt "Pedido de Locacao"
declare
v_dat_pedido date := to_date('19/01/2010','dd/mm/yyyy');
v_valor 			 	number(10,2) := 133.00;
qtd        number := 0;
begin
   for x in 
   (select c.cd_cliente from loc_cliente c where cd_cliente < 59)
   loop
	v_dat_pedido := to_date('19/01/2017','dd/mm/yyyy');
        for y in 1..3 loop
	  insert into loc_pedido_locacao 
             values( x.cd_cliente,seq_loc_pedido_locacao.nextval, v_dat_pedido, 2, 
                     v_valor, 'PG', 'DI', v_dat_pedido, v_dat_pedido+2, 4, NULL,NULL,'SP'); 
	  v_dat_pedido 	:= v_dat_pedido + 2;
	  v_valor 	:= v_valor      + 42;
	end loop;
    qtd := qtd + 1;
    if qtd = 1000 then
       commit;
       qtd := 0;
    end if;
    end loop;
    commit;
end;
/

--Prompt "Item Pedido de Locacao"
declare
v_item				number 	     := 00;
v_val    			number(11,2) := 00;
qtd                             number := 0;
begin
   for x in 
   (select p.nr_pedido, p.dt_retirada, p.dt_entrega, p.qt_dias 
    from loc_pedido_locacao p) loop
      v_item := 0;
      for y in (select v.nr_placa, g.vl_locacao_diaria val 
                from loc_veiculo v, loc_grupo g 
                where g.cd_grupo = v.cd_grupo and v.nr_placa <> 'PLO1200' and rownum < 8)
   	loop
		v_item := v_item + 1;
		v_val  := round(dbms_random.value*200,2);
		insert into loc_item_locacao  values( x.dt_retirada, v_item, x.dt_entrega, x.qt_dias,
                    v_val,   y.nr_placa, nvl(x.qt_dias,0) * v_val, x.nr_pedido);
        qtd   := qtd + 1;
        if qtd = 1000 then
            commit;
            qtd := 0;
        end if;           
	end loop;
    end loop;
    commit;
end;
/
--Prompt "Carga inicial realizada com sucesso"



declare
/*----------------------------------------------------------------------------
 Objetivo   : Popular a tabela loc_pedido_locacao com 10.000 Linhas
              e a tabela de item de loca��o com 30.000 linhas
 Autor      : Gustav Padlipskas
 Dt Cria��o : 01/08/2010
------------------------------------------------------------------------------
 Data Ult Alt 	Autor 			Descri��o
  15/09/2009    Salvio Padlipskas	Inser��o de coment�rios e revis�o do procedimento
-----------------------------------------------------------------------------*/
-- Cria as estruturas do tipo  tables records Cliente, Funcionario e Veiculo
type ecd_cliente IS table of loc_cliente.cd_cliente%type  index by binary_integer;
type ecd_func 	 IS table of loc_funcionario.cd_func%type index by binary_integer;
type enr_placa  IS table of loc_veiculo.nr_placa%type 	 index by binary_integer;

-- Cria as vari�vies de tables records Cliente, Funcionario e Veiculo
acd_cliente	ecd_cliente;
acd_func 	ecd_func;
anr_placa 	enr_placa;

-- Cria o collection do pedido de loca��o
type tarray is table of loc_pedido_locacao%rowtype index by binary_integer;
varrayped tarray;

-- Cria o collection do item de pedido de loca��o
type tarrayloc is table of loc_item_locacao%rowtype index by binary_integer;
varrayitem tarrayloc;

-- Estruturas do tipo VArrays para conte�dos com limites de tamanho
type edt_locacao    	is varray(7) of date;
type eqt_dias 		is varray(7) of number(5);
type etp_pagto		is varray(7) of varchar2(2);
type estatus		is varray(7) of char(2);

-- VArrays associadas as estruturas
adt_locacao   	edt_locacao;
aqt_dias 	eqt_dias;
atp_pagto	etp_pagto;
astatus		estatus;

-- Cria um cnotador para o pedido de loca��o
v_contador  number(10) := 00;

-- Cria um contador para o item de pedido de locacao
v_contador_ip  number(10) := 00;

-- Cria a faixa de pedido com N n�meros
vFaixaIni number(5):= 1000;
vFaixaFim number(5):= 11000;

begin

  begin   
    -- 1o passo: carrega os dados do cliente em uma table record
   v_contador :=00; -- antes de entrar no loop zera o contador principal.
   for c in ( select cd_cliente  from loc_cliente where cd_cliente < 59)
   loop
     v_contador := v_contador + 1;
     acd_cliente(v_contador) := c.cd_cliente;
   end loop;

   
    -- 2o passo: carrega os dados do funcionario em uma table record
   v_contador :=00; -- antes de entrar no loop zera o contador principal.
   for c in ( select cd_func from loc_funcionario where cd_func > 1 )
   loop
     v_contador := v_contador + 1;
     acd_func(v_contador) := c.cd_func;
   end loop;  


    -- 3o passo: carrega as placas de veiculo em uma table record
   v_contador :=00; -- antes de entrar no loop zera o contador principal.
   for c in ( select nr_placa from loc_veiculo where nr_placa <> 'PLO1200')
   loop
     v_contador := v_contador + 1;
     anr_placa(v_contador) := c.nr_placa;
   end loop;  

    -- 4o passo: Carrega as VArrays com tamanhos fixos de 7 posi��es. Para os conte�dos inferiores a isso assume-se conteudos duplicados
    adt_locacao := edt_locacao(
    to_date('07/08/2010', 'DD/MM/YYYY'), to_date('05/07/2010', 'DD/MM/YYYY'), to_date('31/08/2010', 'DD/MM/YYYY'),
    to_date('18/12/2010', 'DD/MM/YYYY'), to_date('31/07/2010', 'DD/MM/YYYY'), to_date('25/12/2010', 'DD/MM/YYYY'),
    to_date('13/05/2010', 'DD/MM/YYYY')
    );

    astatus   := estatus  ('PG', 'AB', 'CC','PG', 'AB', 'CC','AB');
    atp_pagto := etp_pagto('BB', 'CH', 'DI', 'DC', 'NP',  'CC', 'DI');
    aqt_dias  := eqt_dias (3,7,11,13,17,23,37);

    v_contador    :=00; -- antes de entrar no loop zera o contador principal do pedido de locacao.
    v_contador_ip :=00; -- antes de entrar no loop zera o contador principal do item de locacao.

    -- 4o passo: carrega o array principal (Pedido Loca��o) com 7.000 linhas
    for g in vFaixaIni..vFaixaFim
    loop


      -- Para cada linha do loop, carrega o array de pedido de locacao com os valores solicitados
      v_contador  := v_contador  + 1; 

      varrayped(v_contador).cd_cliente	:= acd_cliente(dbms_random.value(1, acd_cliente.count));
      varrayped(v_contador).nr_pedido	:= g;

      varrayped(v_contador).dt_locacao  := adt_locacao(dbms_random.value(1, adt_locacao.count));
      varrayped(v_contador).qt_dias	:= aqt_dias(dbms_random.value(1, aqt_dias.count));
      varrayped(v_contador).status	:= astatus(dbms_random.value(1, astatus.count));
      varrayped(v_contador).tp_pagto	:= atp_pagto(dbms_random.value(1, atp_pagto.count));
      varrayped(v_contador).dt_retirada	:= varrayped(v_contador).dt_locacao +7;

      varrayped(v_contador).dt_entrega	:= (varrayped(v_contador).dt_locacao +7 )+ varrayped(v_contador).qt_dias;
      varrayped(v_contador).cd_func	:= acd_func(dbms_random.value(1, acd_func.count));

      -- Agora para cada pedido carregado no array � necess�rio carregar 3 linhas no array de item de locacao
      for item in 1..3
      loop   
      
	  v_contador_ip   := v_contador_ip  + 1; 


          varrayitem(v_contador_ip).nr_placa  := anr_placa(dbms_random.value(1, anr_placa.count));

          varrayitem(v_contador_ip).nr_pedido:=  g;
          varrayitem(v_contador_ip).nr_item:= item;
          varrayitem(v_contador_ip).dt_retirada:= varrayped(v_contador).dt_retirada; -- Chamada de array Pai (loca��o)
          varrayitem(v_contador_ip).dt_entrega := varrayped(v_contador).dt_entrega; -- Chamada de array Pai (loca��o)
          varrayitem(v_contador_ip).qt_dias    := varrayped(v_contador).qt_dias;    -- Chamada de array Pai (loca��o)
          varrayitem(v_contador_ip).vl_locacao := trunc(dbms_random.value(400, 800));
          varrayitem(v_contador_ip).vl_total   := varrayped(v_contador).qt_dias * varrayitem(v_contador_ip).vl_locacao;  -- Chamada de array Pai (loca��o)  

       end loop; -- loop item locacao

     end loop;  -- loop pedido locacao

     -- Elimina as linhas j� carregadas  	 
     delete from loc_item_locacao where nr_pedido >= vFaixaIni and nr_pedido <= vFaixaFim;
     delete from loc_pedido_locacao where nr_pedido >= vFaixaIni and nr_pedido <= vFaixaFim;

     -- Descarrega o array populado na tabela de Pedido de Loca��o	
     forall y in varrayped.first..varrayped.last
     insert into loc_pedido_locacao values varrayped(y);

     -- Descarrega o array populado na tabela de Item de Pedido de Loca��o      
     forall item_locacao in varrayitem.first..varrayitem.last
     insert into loc_item_locacao values varrayitem(item_locacao);
     commit;

  exception
    when others then
    	raise_application_error( -20003, 'Erro cr�tico na procedure prc_carrega_pedido_locacao  ! ' || SQLErrM);    
  end;  

end;  
/

-- Ajustes finais do script de carga
update loc_item_locacao set qt_dias= 12 where nr_pedido between 3600 and 3601;

update loc_pedido_locacao p set p.vl_total =
(
select 	sum(i.vl_total)
from 	loc_item_locacao i 
where 	i.nr_pedido between 3700 and 3800
and 	i.nr_pedido = p.nr_pedido)
where 	p.nr_pedido between 3700 and 3800;

commit;



/*Regra de calculo do imposto do Carloca:
Pesquisar na tabela LOC_IMPOSTOS pela aliquota do imposto ISS + cidade + estado.
Aplicar a aliquota sobre o valor total de loca��o do ve�culo.
Descontar o valor da aliquota do valor total de locacao
Desse valor total 80% � do proprietario e 20% � do Carloca.
Sendo assim, o valor do lucro do Carloca corresponde a 20% sobre o valor total de locacao do ve�culo descontado
a aliquota do imposto
*/
-- 1a etapa: Ajustar a estrutura da tabela de impostos
delete from loc_impostos;
alter table loc_impostos modify aliquota number(8,2);
alter table loc_impostos drop constraint PK_LOC_IMPOSTOS;
alter table loc_impostos add constraint PK_LOC_IMPOSTOS  primary key (CD_IMPOSTO,CD_ESTADO,CD_CIDADE,DT_INI_VIGENCIA);
--
	  
-- 2a etapa: gerar a massa de dados dos impostos
declare
v_rec_imposto loc_impostos%rowtype;
begin
for x in 
	(	select distinct cd_cidade, cd_estado 
		from loc_cidade
	)
loop
   if x.cd_estado = 'RJ' then
      v_rec_imposto.aliquota := 19.2;
   elsif x.cd_estado = 'SP' then
      v_rec_imposto.aliquota := 18;
   elsif x.cd_estado = 'BA' then
      v_rec_imposto.aliquota := 12;
   else
      v_rec_imposto.aliquota := 16;
   end if;
   
   v_rec_imposto.cd_imposto 		:= 'ISS';
   v_rec_imposto.dt_ini_vigencia 	:= to_date('01/01/2000','dd/mm/yyyy');
   v_rec_imposto.dt_fin_vigencia 	:= null;
   v_rec_imposto.cd_cidade			:= x.cd_cidade;
   v_rec_imposto.cd_estado			:= x.cd_estado;
   
   insert into loc_impostos values v_rec_imposto;
   
   
end loop;
   commit;
end;
/




insert into loc_cliente values ( seq_loc_cli.nextval,'PAPEL E CELULOSE LTDA','J',null, null, NULL, 03521874252);
insert into loc_cliente values ( seq_loc_cli.nextval,'FAMILIA POMPOSO','F',NULL,NULL,NULL, 854785625);
insert into loc_cliente values ( seq_loc_cli.nextval,'FAZBEM S/A','J',NULL,NULL,NULL, 36582147252);
insert into loc_cliente values ( seq_loc_cli.nextval,'ALEGRIA GERAL ASSOCIADOS','J',NULL,NULL,NULL, 63585257458);
insert into loc_cliente values ( seq_loc_cli.nextval,'VEM QUE VOU ME','J',NULL,NULL,NULL, 0225587452122);
insert into loc_cliente values ( seq_loc_cli.nextval,'OS ANONIMOS ME','J',NULL,NULL,NULL, 36251478582);
insert into loc_cliente values ( seq_loc_cli.nextval,'EU E VOCE LTDA','J',NULL,NULL,NULL, 9658745215);
insert into loc_cliente values ( seq_loc_cli.nextval,'GUGBLAUS SWERATZWKS','F',NULL,NULL,NULL, 251424872525);
insert into loc_cliente values ( seq_loc_cli.nextval,'RUICHAPEU SHOW','J',NULL,NULL,NULL, 52147852555);
insert into loc_cliente values ( seq_loc_cli.nextval,'MARTE VENUS S/A','J',NULL,NULL,NULL, 2102698575);
commit;


drop table loc_feriado;

create table loc_feriado
( dt date,
 descricao varchar2(50)
);

delete from loc_feriado;

-- 2010
insert into loc_feriado values ( to_date('01/01/2010','dd/mm/yyyy'), 'Confraterniza��o Universal');
insert into loc_feriado values ( to_date('16/02/2010','dd/mm/yyyy'), 'Anivers�rio de S�o Paulo'  );
insert into loc_feriado values ( to_date('02/04/2010','dd/mm/yyyy'), 'Carnaval');
insert into loc_feriado values ( to_date('21/04/2010','dd/mm/yyyy'), 'Tiradentes');
insert into loc_feriado values ( to_date('01/05/2010','dd/mm/yyyy'), 'Dia do Trabalho');
insert into loc_feriado values ( to_date('03/06/2010','dd/mm/yyyy'), 'Corpus Christi');
insert into loc_feriado values ( to_date('07/09/2010','dd/mm/yyyy'), 'Independ�ncia do Brasil');
insert into loc_feriado values ( to_date('12/10/2010','dd/mm/yyyy'), 'Nossa Senhora Aparecida');
insert into loc_feriado values ( to_date('02/11/2010','dd/mm/yyyy'), 'Finados');
insert into loc_feriado values ( to_date('15/11/2010','dd/mm/yyyy'), 'Proclama��o da Rep�blica');
insert into loc_feriado values ( to_date('25/12/2010','dd/mm/yyyy'), 'Natal');
-- 2011
insert into loc_feriado values ( to_date('01/01/2011','dd/mm/yyyy'), 'Confraterniza��o Universal');
insert into loc_feriado values ( to_date('25/01/2011','dd/mm/yyyy'), 'Anivers�rio de S�o Paulo'  );
insert into loc_feriado values ( to_date('08/03/2011','dd/mm/yyyy'), 'Carnaval');
insert into loc_feriado values ( to_date('21/04/2011','dd/mm/yyyy'), 'Tiradentes');
insert into loc_feriado values ( to_date('22/04/2011','dd/mm/yyyy'), 'Sexta-feira da Paix�o');
insert into loc_feriado values ( to_date('01/05/2011','dd/mm/yyyy'), 'Dia do Trabalho');
insert into loc_feriado values ( to_date('23/06/2011','dd/mm/yyyy'), 'Corpus Christi');
insert into loc_feriado values ( to_date('07/09/2011','dd/mm/yyyy'), 'Independ�ncia do Brasil');
insert into loc_feriado values ( to_date('12/10/2011','dd/mm/yyyy'), 'Nossa Senhora Aparecida');
insert into loc_feriado values ( to_date('02/11/2011','dd/mm/yyyy'), 'Finados');
insert into loc_feriado values ( to_date('15/11/2011','dd/mm/yyyy'), 'Proclama��o da Rep�blica');
insert into loc_feriado values ( to_date('25/12/2011','dd/mm/yyyy'), 'Natal');

insert into loc_feriado values ( to_date('01/01/2012','dd/mm/yyyy'), 'Confraterniza��o Universal');
insert into loc_feriado values ( to_date('21/02/2012','dd/mm/yyyy'), 'Anivers�rio de S�o Paulo'  );
insert into loc_feriado values ( to_date('06/04/2012','dd/mm/yyyy'), 'Carnaval');
insert into loc_feriado values ( to_date('21/04/2012','dd/mm/yyyy'), 'Tiradentes');
insert into loc_feriado values ( to_date('01/05/2012','dd/mm/yyyy'), 'Dia do Trabalho');
insert into loc_feriado values ( to_date('07/06/2012','dd/mm/yyyy'), 'Corpus Christi');
insert into loc_feriado values ( to_date('07/09/2012','dd/mm/yyyy'), 'Independ�ncia do Brasil');
insert into loc_feriado values ( to_date('12/10/2012','dd/mm/yyyy'), 'Nossa Senhora Aparecida');
insert into loc_feriado values ( to_date('02/11/2012','dd/mm/yyyy'), 'Finados');
insert into loc_feriado values ( to_date('15/11/2012','dd/mm/yyyy'), 'Proclama��o da Rep�blica');
insert into loc_feriado values ( to_date('25/12/2012','dd/mm/yyyy'), 'Natal');

insert into loc_feriado values ( to_date('01/01/2013','dd/mm/yyyy'), 'Confraterniza��o Universal');
insert into loc_feriado values ( to_date('25/01/2013','dd/mm/yyyy'), 'Anivers�rio de S�o Paulo'  );
insert into loc_feriado values ( to_date('12/02/2013','dd/mm/yyyy'), 'Carnaval');
insert into loc_feriado values ( to_date('29/03/2013','dd/mm/yyyy'), 'Carnaval');
insert into loc_feriado values ( to_date('21/04/2013','dd/mm/yyyy'), 'Tiradentes');
insert into loc_feriado values ( to_date('01/05/2013','dd/mm/yyyy'), 'Dia do Trabalho');
insert into loc_feriado values ( to_date('30/05/2013','dd/mm/yyyy'), 'Corpus Christi');
insert into loc_feriado values ( to_date('07/09/2013','dd/mm/yyyy'), 'Independ�ncia do Brasil');
insert into loc_feriado values ( to_date('12/10/2013','dd/mm/yyyy'), 'Nossa Senhora Aparecida');
insert into loc_feriado values ( to_date('02/11/2013','dd/mm/yyyy'), 'Finados');
insert into loc_feriado values ( to_date('15/11/2013','dd/mm/yyyy'), 'Proclama��o da Rep�blica');
insert into loc_feriado values ( to_date('25/12/2013','dd/mm/yyyy'), 'Natal');



-- Criar o sexo do cliente na tabela loc_cli_fisica
alter table loc_cli_fisica add dm_sexo char(1) CHECK ( dm_sexo IN ('F', 'M', 'H') );
update loc_cli_fisica set dm_sexo = 'F' where cd_cliente in (56,58,59,60);
update loc_cli_fisica set dm_sexo = 'M' where cd_cliente in (57);


--
alter table loc_estado add nm_regiao varchar2(30);
update loc_estado set nm_regiao = 'Centro Oeste'
where  cd_estado in ('DF','GO', 'MS','MT');

update loc_estado set nm_regiao = 'Norte'
where  cd_estado in ('AC','AP','AM','PA','RO','RR','TO');

update loc_estado set nm_regiao = 'Nordeste'
where  cd_estado in ('AL','BA','CE','MA','PB','PE','PI','RN','SE');

update loc_estado set nm_regiao = 'Sudeste'
where  cd_estado in ('ES','MG','RJ','SP');

update loc_estado set nm_regiao = 'Sul'
where  cd_estado in ('PR','SC','RS');

 
-- Carrega os dados de clientes pessoa fisica e seu respectivo endereco
--
declare v_rec_cliente loc_cliente%rowtype;
        v_rec_endcli  loc_endereco_cliente%rowtype;
        v_dt_nascimento date;
        v_sexo       char(1);
	      type esexo		is varray(2) of char(1);	
        
asexo esexo;        
begin

asexo := esexo('F', 'M');

for x in 1..1000 
loop
   select nvl(max(cd_cliente),0) + 1 
   into   v_rec_cliente.cd_cliente
   from   loc_cliente;

    select  DBMS_RANDOM.STRING('A', 20), 
			'F', 
			3
	into    v_rec_cliente.nm_cliente, v_rec_cliente.tp_cliente,  v_rec_cliente.nr_estrelas
	from    dual;

   insert into loc_cliente(cd_cliente, nm_cliente, tp_cliente, nr_estrelas)
   values (v_rec_cliente.cd_cliente, v_rec_cliente.nm_cliente, v_rec_cliente.tp_cliente,  v_rec_cliente.nr_estrelas);
   

   select nvl(max(cd_end_cli),0) + 1 
   into   v_rec_endcli.cd_end_cli
   from   loc_endereco_cliente
   where  cd_cliente = v_rec_cliente.cd_cliente;
   

   select  DBMS_RANDOM.STRING('A', 50), 
           DBMS_RANDOM.STRING('A', 40), 
		   03809152,
		   'R'
   into    v_rec_endcli.logradouro,
           v_rec_endcli.bairro,
		   v_rec_endcli.cep,
		   v_rec_endcli.tp_endereco
	from  dual;

	begin
	   select cd_cidade, cd_estado
	   into   v_rec_endcli.cd_cidade, v_rec_endcli.cd_estado
	   from   loc_cidade
	   where  cd_cidade = trunc(dbms_random.value(1,40))
     and rownum < 2;
	exception
		when no_data_found then
		     v_rec_endcli.cd_cidade := 1;
			 v_rec_endcli.cd_estado := 'SP';
    end;	   
    
    insert into loc_endereco_cliente (cd_cliente, cd_end_cli, logradouro, bairro, cep, tp_endereco, cd_cidade, cd_estado)
    values (v_rec_cliente.cd_cliente, v_rec_endcli.cd_end_cli, v_rec_endcli.logradouro, v_rec_endcli.bairro, v_rec_endcli.cep, v_rec_endcli.tp_endereco, v_rec_endcli.cd_cidade, v_rec_endcli.cd_estado);

   v_sexo := asexo(dbms_random.value(1, asexo.count));
   
  select to_date(trunc(dbms_random.value(2447511,2448241)),'J')
   into v_dt_nascimento
  from dual;
  
	insert into loc_cli_fisica(cd_cliente, nr_cpf, dm_sexo, dt_nascimento, nr_rg)
	values ( v_rec_cliente.cd_cliente, 9030900909, v_sexo, v_dt_nascimento, 123456);
		
end loop;
  commit;
end;
/




declare

/*----------------------------------------------------------------------------
 Objetivo   : Popular a tabela loc_pedido_locacao com 1.000.000 Linhas
              e a tabela de item de loca��o com 4.000.000 linhas utilizando
			  a t�cnica de Random
 Autor      : Gustav Padlipskas
 Dt Cria��o : 01/08/2010
------------------------------------------------------------------------------
 Data Ult Alt 	Autor 			Descri��o
  15/09/2009    Salvio Padlipskas	Inser��o de coment�rios e revis�o do procedimento
  18/01/2011    Gustavo Padlipskas 	Ajustes no script para realizar cargas em intervalos de valores
  05/09/2012    Oivlas Sakspildap   Melhoria no c�digo fonte para garantir a carga de 4.000.000 no Carloca
-----------------------------------------------------------------------------*/
-- Cria a faixa de pedido com N n�meros
vFaixaIni number(8):= 10000;
vFaixaFim number(8):= 20000;
--
-- Cria as estruturas do tipo  tables records Cliente, Funcionario e Veiculo
type ecd_cliente IS table of loc_cliente.cd_cliente%type  index by binary_integer;
type ecd_func 	 IS table of loc_funcionario.cd_func%type index by binary_integer;
type enr_placa  IS table of loc_veiculo.nr_placa%type 	 index by binary_integer;

-- Cria as vari�vies de tables records Cliente, Funcionario e Veiculo
acd_cliente	ecd_cliente;
acd_func 	ecd_func;
anr_placa 	enr_placa;

-- Cria o collection do pedido de loca��o
type tarray is table of loc_pedido_locacao%rowtype index by binary_integer;
varrayped tarray;

-- Cria o collection do item de pedido de loca��o
type tarrayloc is table of loc_item_locacao%rowtype index by binary_integer;
varrayitem tarrayloc;

-- Estruturas do tipo VArrays para conte�dos com limites de tamanho
type edt_locacao    	is varray(7) of date;
type eqt_dias 		is varray(7) of number(5);
type etp_pagto		is varray(7) of varchar2(2);
type estatus		is varray(7) of char(2);

-- VArrays associadas as estruturas
--adt_locacao   	edt_locacao;
--aqt_dias 	eqt_dias;
atp_pagto	etp_pagto;
astatus		estatus;

-- Cria um cnotador para o pedido de loca��o
v_contador  number(10) := 00;

-- Cria um contador para o item de pedido de locacao
v_contador_ip  number(10) := 00;


begin

  begin   
    -- 1o passo: carrega os dados do cliente em uma table record
   v_contador :=00; -- antes de entrar no loop zera o contador principal.
   for c in ( select cd_cliente  from loc_cliente where cd_cliente < 59)
   loop
     v_contador := v_contador + 1;
     acd_cliente(v_contador) := c.cd_cliente;
   end loop;

   
    -- 2o passo: carrega os dados do funcionario em uma table record
   v_contador :=00; -- antes de entrar no loop zera o contador principal.
   for c in ( select cd_func from loc_funcionario where cd_func > 1 )
   loop
     v_contador := v_contador + 1;
     acd_func(v_contador) := c.cd_func;
   end loop;  


    -- 3o passo: carrega as placas de veiculo em uma table record
   v_contador :=00; -- antes de entrar no loop zera o contador principal.
   for c in ( select nr_placa from loc_veiculo where nr_placa <> 'PLO1200')
   loop
     v_contador := v_contador + 1;
     anr_placa(v_contador) := c.nr_placa;
   end loop;  

    -- 4o passo: Carrega as VArrays com tamanhos fixos de 7 posi��es. Para os conte�dos inferiores a isso assume-se conteudos duplicados
   -- adt_locacao := edt_locacao(
   -- to_date('07/08/2010', 'DD/MM/YYYY'), to_date('05/07/2010', 'DD/MM/YYYY'), to_date('31/08/2010', 'DD/MM/YYYY'),
   -- to_date('18/12/2010', 'DD/MM/YYYY'), to_date('31/07/2010', 'DD/MM/YYYY'), to_date('25/12/2010', 'DD/MM/YYYY'),
   -- to_date('13/05/2010', 'DD/MM/YYYY')
   -- );

    astatus   := estatus  ('PG', 'AB', 'CC','PG', 'AB', 'CC','AB');
    atp_pagto := etp_pagto('BB', 'CH', 'DI', 'DC', 'NP',  'CC', 'DI');
    --aqt_dias  := eqt_dias (3,7,11,13,17,23,37);

    v_contador    :=00; -- antes de entrar no loop zera o contador principal do pedido de locacao.
    v_contador_ip :=00; -- antes de entrar no loop zera o contador principal do item de locacao.

    -- 4o passo: carrega o array principal (Pedido Loca��o) com 7.000 linhas
    for g in vFaixaIni..vFaixaFim
    loop


      -- Para cada linha do loop, carrega o array de pedido de locacao com os valores solicitados
      v_contador  := v_contador  + 1; 

      varrayped(v_contador).cd_cliente	:= acd_cliente(dbms_random.value(1, acd_cliente.count));
      varrayped(v_contador).nr_pedido	:= g;

      --varrayped(v_contador).dt_locacao:= adt_locacao(dbms_random.value(1, adt_locacao.count));
	    varrayped(v_contador).dt_locacao 	:= to_date(trunc(dbms_random.value(2447511,2448241)),'J');
      --varrayped(v_contador).qt_dias	:= aqt_dias(dbms_random.value(1, aqt_dias.count));
	    varrayped(v_contador).qt_dias		:= trunc(dbms_random.value(1, 31));
      varrayped(v_contador).status		:= astatus(dbms_random.value(1, astatus.count));
      varrayped(v_contador).tp_pagto	:= atp_pagto(dbms_random.value(1, atp_pagto.count));
      varrayped(v_contador).dt_retirada	:= varrayped(v_contador).dt_locacao + trunc(dbms_random.value(1,4));

      varrayped(v_contador).dt_entrega	:= (varrayped(v_contador).dt_retirada) + varrayped(v_contador).qt_dias;
      varrayped(v_contador).cd_func		:= acd_func(dbms_random.value(1, acd_func.count));

      -- Agora para cada pedido carregado no array � necess�rio carregar at� 6 linhas no array de item de locacao
      for item in 1..trunc(dbms_random.value(2,6))
      loop   
      
	  v_contador_ip   := v_contador_ip  + 1; 


          varrayitem(v_contador_ip).nr_placa  := anr_placa(dbms_random.value(1, anr_placa.count));

          varrayitem(v_contador_ip).nr_pedido:=  g;
          varrayitem(v_contador_ip).nr_item:= item;
          varrayitem(v_contador_ip).dt_retirada:= varrayped(v_contador).dt_retirada; -- Chamada de array Pai (loca��o)
          varrayitem(v_contador_ip).dt_entrega := varrayped(v_contador).dt_entrega; -- Chamada de array Pai (loca��o)
          varrayitem(v_contador_ip).qt_dias    := varrayped(v_contador).qt_dias;    -- Chamada de array Pai (loca��o)
          varrayitem(v_contador_ip).vl_locacao := trunc(dbms_random.value(400, 800));
          varrayitem(v_contador_ip).vl_total   := varrayped(v_contador).qt_dias * varrayitem(v_contador_ip).vl_locacao;  -- Chamada de array Pai (loca��o)  

       end loop; -- loop item locacao

     end loop;  -- loop pedido locacao

     -- Elimina as linhas j� carregadas  	 
     delete from loc_item_locacao where nr_pedido >= vFaixaIni and nr_pedido <= vFaixaFim;
     delete from loc_pedido_locacao where nr_pedido >= vFaixaIni and nr_pedido <= vFaixaFim;

     -- Descarrega o array populado na tabela de Pedido de Loca��o	
     forall y in varrayped.first..varrayped.last
     insert into loc_pedido_locacao values varrayped(y);

     -- Descarrega o array populado na tabela de Item de Pedido de Loca��o      
     forall item_locacao in varrayitem.first..varrayitem.last
     insert into loc_item_locacao values varrayitem(item_locacao);
     commit;

  exception
    when others then
    	raise_application_error( -20003, 'Erro cr�tico na procedure prc_carrega_pedido_locacao  ! ' || SQLErrM);    
  end;  


update loc_item_locacao p set p.vl_total =
p.qt_dias * p.vl_locacao
where 	p.nr_pedido between vFaixaIni and vFaixaFim;  
  
  
update loc_pedido_locacao p set p.vl_total =
(
select 	sum(i.vl_total)
from 	loc_item_locacao i 
where 	i.nr_pedido between vFaixaIni and vFaixaFim
and 	i.nr_pedido = p.nr_pedido)
where 	p.nr_pedido between vFaixaIni and vFaixaFim;

commit;

end;
/

SELECT count(*) FROM LOC_ITEM_LOCACAO;

SELECT * FROM LOC_PEDIDO_LOCACAO where nr_pedido=43;

SELECT * FROM LOC_ITEM_LOCACAO where nr_pedido =43;

