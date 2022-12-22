(1)
(A)'''Criar as tabelas Aluno, Disciplina, Historico e Professor definindo SOMENTE as restrições de
chave primária.(campos sublinhados).
'''
#Criação da tabela aluno
CREATE TABLE aluno
(
	matricula NUMERIC(4),
	nome VARCHAR(20),
	escola VARCHAR (20),
	CONSTRAINT PRIMARY KEY (matricula)
);
#Criação da tabela disciplina
CREATE TABLE disciplina 
(
	codigo CHAR(5),
	nome VARCHAR (20),
	registro CHAR (5),
	escola VARCHAR (20),
	CONSTRAINT PRIMARY KEY (codigo)
);
#Criação tabela Histórico
CREATE TABLE historico (
	matricula NUMERIC (4),
	codigo CHAR (5),
	nota NUMERIC (3.1),
	CONSTRAINT PRIMARY KEY (matricula)
);
#Criação da tabela Professor
CREATE TABLE professor (
	registro CHAR (5),
	nome VARCHAR (20),
	admissao INTEGER,
	CONSTRAINT PRIMARY KEY (registro)
);

(B)#Alterar a tabela Aluno, adicionando uma coluna telefone char (8).
ALTER TABLE aluno ADD telefone CHAR (8);

C)#Alterar a tabela Aluno excluindo a coluna telefone.
ALTER TABLE aluno DROP telefone; 

D)# Criar os relacionamentos (FOREIGN KEY) entre a tabela Historico e as tabelas Aluno e Disciplina.
ALTER TABLE historico ADD CONSTRAINT aluno
FOREIGN KEY(matricula) REFERENCES aluno(matricula);

ALTER TABLE historico ADD CONSTRAINT disciplina
FOREIGN KEY(codigo) REFERENCES disciplina(codigo);

E)#Criar uma restrição que não permita notas menores que "0".
ALTER TABLE HISTORICO ADD CONSTRAINT nota CHECK(nota>=0)



