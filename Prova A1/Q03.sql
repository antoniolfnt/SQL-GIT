CREATE TABLE `disciplina`(
	`codigo` CHAR (4) NOT NULL ,
	`nome` CHAR (50) NOT NULL 
);

CREATE TABLE `inscricao` ( 
	`numero` CHAR(7) NOT NULL , 
	`coddisc` CHAR(4) NOT NULL , 
	`ano` YEAR (4) NOT NULL ,
	`semestre` INT (1) NOT NULL , 
	`aprovado` BOOLEAN () NOT NULL ,
	`classif` SMALLINT () NOT NULL
);

