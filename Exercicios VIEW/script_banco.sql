drop table tab_funcionario;

create table tab_funcionario 
	(idn number primary key, 
	 nome varchar2(100), 
	 doc_identificacao varchar2(100), 
	 dt_admissao date, 
	 dt_demissao date,  
	 vl_salario_atual number);

insert into tab_funcionario values (1,'Rogerio da Silva','FB973264',to_date('01/04/1999','dd/mm/yyyy'), null, 15750);
insert into tab_funcionario values (2,'Fátima Bernardes','8135681135',to_date('02/07/2001','dd/mm/yyyy'), null, 4000);
insert into tab_funcionario values (3,'Harry Potter','1518786545',to_date('01/04/2002','dd/mm/yyyy'), null, 4512);
insert into tab_funcionario values (4,'Reinaldo de Andrade','64684121554',to_date('07/05/2010','dd/mm/yyyy'), null, 8458);
insert into tab_funcionario values (5,'Vanessa Garcia','AX8415117',to_date('05/10/1984','dd/mm/yyyy'), to_date('14/02/2017','dd/mm/yyyy'), 12458);
insert into tab_funcionario values (6,'Leandro Souza','5417557151',to_date('06/09/2011','dd/mm/yyyy'), null, 4582);
insert into tab_funcionario values (7,'Bruno Santos Silva','24157158654',to_date('08/08/1997','dd/mm/yyyy'), null, 7541);
insert into tab_funcionario values (8,'Arthur Alves','545157516X',to_date('26/07/2004','dd/mm/yyyy'), null, 2253);
insert into tab_funcionario values (9,'Thiago Rodrigues da Silva','65498132545',to_date('09/05/2013','dd/mm/yyyy'), null, 15651);
insert into tab_funcionario values (10,'Luis Claudio Silva','65418158712',to_date('21/11/2000','dd/mm/yyyy'), null, 25341);
