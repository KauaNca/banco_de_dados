CREATE DATABASE kaua_sistema_biblioteca;
USE kaua_sistema_biblioteca;
create table pessoa(
	id_pessoa int primary key auto_increment,
    nome varchar(45) not null,
    idade int not null,
	cpf_cnpj varchar(18) not null,
    email varchar(45) not null,
    telefone varchar(13) null,
    situacao char(1) not null
);

create table usuario(
	id_usuario int primary key auto_increment,
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa),
    livros_pendentes boolean null
);

CREATE TABLE categoria ( id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY, categoria VARCHAR(255) NOT NULL );

create table livro(
	id_livro int primary key auto_increment,
    titulo varchar(45) not null,
    sinopse text not null,
    ano int null,
    valor float null,
    id_categoria int not null,
    foreign key (id_categoria) references categoria(id_categoria)
);

create table pedido(
	id_usuario int not null,
    foreign key (id_usuario) references usuario(id_usuario),
    situacao varchar(1) not null,
    data_hora DATETIME NOT NULL DEFAULT NOW()
);

create table reserva(
	id_reserva int primary key auto_increment,
    id_usuario int not null,
    foreign key (id_usuario) references usuario(id_usuario),
    id_livro int not null,
    foreign key (id_livro) references livro(id_livro)
);

CREATE TABLE login (
    id_login INT PRIMARY KEY AUTO_INCREMENT,
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa),
    usuario VARCHAR(45) NOT NULL UNIQUE,
    senha VARCHAR(60) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


DROP DATABASE kaua_sistema_biblioteca;

INSERT INTO categoria (categoria) VALUES 
('Ficção Científica'),
('Fantasia'),
('Romance'),
('Mistério'),
('Terror'),
('História'),
('Biografia'),
('Autobiografia'),
('Negócios'),
('Desenvolvimento Pessoal'),
('Autoajuda'),
('Tecnologia'),
('Ciência'),
('Filosofia'),
('Religião'),
('Espiritualidade'),
('Poesia'),
('Teatro'),
('Clássicos'),
('Jovem Adulto');

SELECT * FROM categoria;
