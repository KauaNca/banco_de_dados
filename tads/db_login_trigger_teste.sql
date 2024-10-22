CREATE DATABASE login;
USE login;

-- Criação da tabela 'usuario'
CREATE TABLE usuario(
	id_usuario  int primary key auto_increment,
    nome varchar(15) not null,
    email varchar(25) not null
);

-- Criação da tabela 'log_acoes'
CREATE TABLE log_acoes(
	id_log int primary key auto_increment,
    id_usuario int not null,
    email varchar(25) not null
);
-- INTERESSANTE NÃO PRECISAR DE CHAVE ESTRANGEIRA

-- Definindo um novo delimitador
DELIMITER //

-- Criando o trigger 'usuario_login'
CREATE TRIGGER usuario_login       -- nome do gatilho
AFTER INSERT ON usuario				-- essa trigger pertence a tabela usuário, que após inserir dados, vai fazer uma ação
FOR EACH ROW
BEGIN
   INSERT INTO log_acoes(id_usuario, email) VALUES (NEW.id_usuario, NEW.email);  -- esses NEW é pegando da tabela usuário
END
//

-- Voltando ao delimitador padrão
DELIMITER ;

-- Inserindo os dados na tabela 'usuario'
INSERT INTO usuario (id_usuario, nome, email)
VALUES 
(1, 'João Silva', 'joao.silva@example.com'),
(2, 'Maria Oliveira', 'maria.oliveira@example.com'),
(3, 'Carlos Santos', 'carlos.santos@example.com');

-- Selecionando os registros da tabela 'log_acoes'
SELECT * FROM log_acoes;
