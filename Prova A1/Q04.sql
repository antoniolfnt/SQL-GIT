# Adicione uma nova coluna : morada - alfanumérico com tamanho fixo de 50 caracteres
ALTER TABLE `aluno` ADD `morada` CHAR(50) NOT NULL ;
# altere a coluna morada para ter tamanho variável
ALTER TABLE `aluno` CHANGE `morada` `morada` INT NOT NULL;