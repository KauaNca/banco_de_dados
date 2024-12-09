CREATE DATABASE kaua_sistema_biblioteca;
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

CREATE TABLE enderecos (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(255) NOT NULL,
    numero INT,
    bairro VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(2),
    cep VARCHAR(9)
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