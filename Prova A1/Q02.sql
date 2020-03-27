CREATE TABLE `BANCO`. `banco` (
    `codigo` INT (10) NOT NULL,
    `nome` CHAR (100) NOT NULL
    CONSTRAINT `codigo` PRIMARY KEY (`codigo`)
);

CREATE TABLE `BANCO`.`agencia` (
    `cod_banco` INT (10) NOT NULL,
    `numero_agencia` INT (10) NOT NULL,
    `endereco` VARCHAR (200) NOT NULL,
    CONSTRAINT `num_agencia` PRIMARY KEY (`num_agencia`),
    FOREIGN KEY (`cod_banco`) REFERENCES `banco` (`codigo`)
);

CREATE TABLE `BANCO`.`cliente` (
	`cpf` INT (11) NOT NULL,
	`nome` CHAR (100) NOT NULL,
	`sexo` SMALLINT (2) NOT NULL,
	`endereco` VARCHAR (200) NOT NULL,
	CONSTRAINT `cpf` PRIMARY KEY (`cpf`)
);

CREATE TABLE `BANCO`.`conta`(
	`numero_conta` INT (10) NOT NULL,
	`saldo` INT () NOT NULL,
	`tipo_conta` VARCHAR (20) NOT NULL,
	`num_agencia` INT (10) NOT NULL,
	CONSTRAINT `num_conta` PRIMARY KEY (`num_conta`),
	FOREIGN KEY (`num_agencia`) REFERENCES `agencia`(`num_agencia`)
);

CREATE TABLE `BANCO`.`historico`(
	`cpf_cliente` INT (11) NOT NULL,
	`num_conta` INT (10) NOT NULL,
	`data_inicio` DATE NOT NULL,
	CONSTRAINT cpf_cliente PRIMARY KEY (`cpf_cliente`),
	FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente`(`cpf`),
	FOREIGN KEY (`num_conta`) REFERENCES `conta` (`numero_conta`)
);

CREATE TABLE `BANCO`. `telefone_cliente`(
	`cpf_cli` INT () NOT NULL,
	`telefone` INT (15) NOT NULL,
	CONSTRAINT `cpf_cli` PRIMARY KEY (`cpf_cli`),
	FOREIGN KEY	(`cpf_cli`) REFERENCES `cliente` (`cpf`)
);
'''
:OBS:
Nesse só consegui fazer os relacionamentos. 
Não consegui fazer: 
1) Especificar as restrições
de atributo;  
2) Ações disparadas por
integridade referencial.

'''