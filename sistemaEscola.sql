create database sistemaEscola;
use sistemaEscola;
create table curso(
	id_curso int primary key auto_increment,
    descricao varchar(50) not null,
    carga_horaria varchar(6) not null,
    data_inicio date not null,
    data_fim date,
    id_aluno int not null,
    foreign key(id_aluno) references aluno(id_aluno)
);

create table pessoa(
	id_pessoa int primary key auto_increment,
    nome varchar(40) not null,
    cpf varchar(14) not null,
    idade int,
    situacao char(1)
);
create table aluno (
	id_aluno int primary key auto_increment,
	id_pessoa int not null,
    matricula varchar(10),
    situacao char(1),
    foreign key(id_pessoa) references pessoa(id_pessoa)
);
create table endereco(
	id_endereco int primary key auto_increment,
    cidade varchar(10) not null,
    rua varchar(10) not null,
    bairro varchar(10) not null,
    cep varchar(8) not null,
    uf char(2) not null,
    id_pessoa int not null,
    situacao char(1) not null,
    foreign key (id_pessoa) references pessoa(id_pessoa)    
);

create table professor(
	id_professor int primary key auto_increment,
    matricula varchar(10) not null,
    id_pessoa int not null,
    foreign key (id_pessoa) references pessoa(id_pessoa),
    situacao char(1)
);
create table turma(
	id_turma int primary key auto_increment,
    numero_sala int not null,
    capacidade int not null,
    id_aluno int not null,
    id_professor int not null,
    id_curso int not null,
    foreign key (id_aluno) references aluno(id_aluno),
    foreign key (id_professor) references professor(id_professor),
    foreign key (id_curso) references curso(id_curso),
    situacao char(1)
);