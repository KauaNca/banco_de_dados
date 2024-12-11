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

create table categoria(
	id_categoria int not null primary key,
    categoria text not null
);
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

create table login(
    id_login int primary key auto_increment,
	id_usuario int not null,
    foreign key(id_usuario) references usuario(id_usuario),
    usuario varchar(45) not null unique,
    senha varchar(60) not null,
    data_criacao timestamp default current_timestamp,
    data_modificacao timestamp default current_timestamp on update current_timestamp
);

DROP DATABASE kaua_sistema_biblioteca;

SELECT * FROM pessoa;
SELECT * FROM login;

SELECT usuario,senha FROM login WHERE usuario = 'k' AND senha = MD5(MD5('K'));
