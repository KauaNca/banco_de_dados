CREATE DATABASE green_line;
USE green_line;

CREATE TABLE pessoa (
    id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    cpf_cnpj VARCHAR(18) NOT NULL UNIQUE,
    rg VARCHAR(12) NULL,
    genero ENUM('M', 'F', 'NB', 'O') NULL,
    idade int null
);

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    id_pessoa INT NOT NULL UNIQUE, 
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa) ON DELETE CASCADE,
    tipo_usuario VARCHAR(15) NOT NULL DEFAULT 'Comum', 
    nivel_acesso VARCHAR(15) NOT NULL DEFAULT 'Sem acesso',
    situacao ENUM('A','I') NOT NULL,
    data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE acessos (
    id_acesso INT PRIMARY KEY AUTO_INCREMENT, 
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE enderecos (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    uf CHAR(2) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    bairro VARCHAR(50) NULL,
    apartamento VARCHAR(15) NULL,
    situacao CHAR(1) NOT NULL DEFAULT 'A' CHECK (situacao IN ('A', 'I')), -- evita que seja colocado outros valores fora do comum
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa) ON DELETE CASCADE
);






