create database empreiteiras ;
use empreiteiras;

create table pessoa(
	id_pessoa int primary key auto_increment,
    nome varchar(30) not null,
    cnpj_cpf varchar(18) not null,
    nome_fantasia varchar(40) null,
    telefone varchar(12) null,
    email varchar(20) null,
    situacao char(1) #A -> ATIVO, I -> INATIVO
);
create table endereco(
	id_endereco int primary key auto_increment,
    rua varchar(15) not null,
    cidade varchar(20) not null,
    uf char(2) not null,
    bairro varchar(20) not null,
    cep char(8) not null,
    situacao char(1) not null, #A -> ATIVO, I -> INATIVO
    id_pessoa int not null,
    foreign key (id_pessoa) references pessoa(id_pessoa)
);
create table empreiteira(
	id_empreiteira int primary key auto_increment,
    area_atuacao varchar(15) not null,
    tipo_contrato varchar(15) not null,
    situacao char(1) not null, #A -> ATIVO, I -> INATIVO
    id_pessoa int not null,
    foreign key (id_pessoa) references pessoa(id_pessoa)
);
create table colaborador(
	id_colaborador int primary key auto_increment,
    funcao varchar(15) not null,
    matricula varchar(20) not null,
    salario decimal(8,2) null,
    tipo_contrato varchar(15) not null,
     situacao char(1) not null, #A -> ATIVO, I -> INATIVO
    id_pessoa int not null,
    foreign key (id_pessoa) references pessoa(id_pessoa)
    
);
create table projeto(
	id_projeto int primary key auto_increment,
    valor decimal(10,2) not null,
    tipo_projeto varchar(15) not null,
    nome_projeto varchar(25) not null,
    data_inicio date not null,
    previsao varchar(20) null,
    data_fim date null,
    status char(1) not null, #A -> ATIVO, I -> INATIVO
    id_colaborador int not null,
    foreign key (id_colaborador) references colaborador (id_colaborador)
);
create table obra(
	id_obra int primary key auto_increment,
    valor decimal(10,2) not null,
    data_inicio date not null,
    previsao varchar(15) null,
    data_fim date null,
    status char(1) not null,#A -> ATIVO, I -> INATIVO
    id_empreiteira int not null,
    id_projeto int not null,
    id_colaborador int not null,
    foreign key(id_empreiteira) references empreiteira(id_empreiteira),
	foreign key(id_projeto) references projeto(id_projeto),
	foreign key(id_colaborador) references colaborador(id_colaborador)
);

alter table pessoa change telefone telefone varchar(16);
alter table pessoa change email email varchar(25);

##3 empresas
INSERT INTO pessoa (nome, cnpj_cpf, nome_fantasia, telefone, email, situacao) VALUES
('Empresa A Ltda', '12.345.678/0001-90', 'Empresa A', '11-91234-5678', 'contato@empresaaltda.com', 'A'),
('Empresa B S.A.', '98.765.432/0001-01', 'Empresa B', '21-98765-4321', 'info@empresabsa.com', 'A'),
('Empresa C Comércio', '23.456.789/0001-02', 'Empresa C', '31-95678-1234', 'suporte@empresac.com', 'A');

INSERT INTO pessoa (nome, cnpj_cpf, telefone, email, situacao) VALUES
('João da Silva', '123.456.789-00', '11-99876-5432', 'joao@empresa.com', 'A'),
('Maria Oliveira', '987.654.321-11', '21-93456-7890', 'maria@empresa.com', 'A'),
('Carlos Souza', '234.567.890-22', '31-91234-6789', 'carlos@empresa.com', 'A'),
('Ana Costa', '345.678.901-33', '41-92345-6789', 'ana@empresa.com', 'A'),
('Pedro Santos', '456.789.012-44', '51-93456-7891', 'pedro@empresa.com', 'A'),
('Fernanda Lima', '567.890.123-55', '61-94567-8910', 'fernanda@empresa.com', 'A');

INSERT INTO pessoa (nome, cnpj_cpf, telefone, email, situacao) VALUE ('Alexandre','987.654.321-10','31-91234-6789','alexandre@empresa','A');

alter table endereco change cep cep char(9);-- alterar o cep 

INSERT INTO endereco (rua, cidade, uf, bairro, cep, situacao, id_pessoa) VALUES
('Rua A', 'São Paulo', 'SP', 'Centro', '01000-000', 'A', 1),  -- Endereço da Empresa A
('Rua B', 'São Paulo', 'SP', 'Jardins', '01400-000', 'A', 2),  -- Endereço da Empresa B
('Rua C', 'Rio de Janeiro', 'RJ', 'Copacabana', '22000-000', 'A', 3),  -- Endereço da Empresa C
('Rua D', 'Belo Horizonte', 'MG', 'Savassi', '30100-000', 'A', 4),  -- Endereço do João
('Rua E', 'Curitiba', 'PR', 'Centro', '80000-000', 'A', 5),  -- Endereço da Maria
('Rua F', 'Porto Alegre', 'RS', 'Centro Histórico', '90000-000', 'A', 6),  -- Endereço do Carlos
('Rua G', 'Salvador', 'BA', 'Pelourinho', '40000-000', 'A', 7),  -- Endereço da Ana
('Rua H', 'Fortaleza', 'CE', 'Centro', '60000-000', 'A', 8),  -- Endereço do Pedro
('Rua I', 'Manaus', 'AM', 'Centro', '69000-000', 'A', 9);  -- Endereço da Fernanda
alter table empreiteira change area_atuacao area_atuacao varchar(25);
alter table empreiteira change tipo_contrato tipo_contrato varchar(20);
select*from empreiteira;

INSERT INTO empreiteira (area_atuacao, tipo_contrato, situacao, id_pessoa) VALUES
('Construção Civil', 'Prestação de Serviço', 'A', 1),  -- Empresa A
('Infraestrutura', 'Empreitada', 'A', 2),  -- Empresa B
('Manutenção e Reformas', 'Convenção', 'A', 3);  -- Empresa C

INSERT INTO colaborador (funcao, matricula, salario, tipo_contrato, situacao) VALUES
('Engenheiro', 'M001', 7000.00, 'CLT', 'A'),  -- João
('Arquiteta', 'M002', 6000.00, 'CLT', 'A'),  -- Maria
('Técnico', 'M003', 4000.00, 'CLT', 'A'),    -- Carlos
('Assistente Administrativo', 'M004', 3000.00, 'CLT', 'A'),  -- Ana
('Analista de Projetos', 'M005', 5000.00, 'CLT', 'A'),  -- Pedro
('Designer', 'M006', 4500.00, 'CLT', 'A');  -- Fernanda

insert into pessoa (nome,cnpj_cpf,telefone,email,situacao) values ('Kauã','123.456.789-01','61-94567-8910','kaua@empresa.com','A');
alter table colaborador change funcao funcao varchar(25);

INSERT INTO colaborador (funcao, matricula, salario, tipo_contrato, situacao, id_pessoa) VALUES
('Engenheiro', 'M001', 7000.00, 'CLT', 'A', 4),  -- João
('Arquiteta', 'M002', 6000.00, 'CLT', 'A', 5),  -- Maria
('Técnico', 'M003', 4000.00, 'CLT', 'A', 6),    -- Carlos
('Assistente Administrativo', 'M004', 3000.00, 'CLT', 'A', 7),  -- Ana
('Analista de Projetos', 'M005', 5000.00, 'CLT', 'A', 8),  -- Pedro
('Designer', 'M006', 4500.00, 'CLT', 'A', 9),  -- Fernanda
('Pedreiro', 'M007', 3500.00, 'CLT', 'A', 10);  -- Kauã

INSERT INTO  colaborador (funcao, matricula, salario, tipo_contrato, situacao, id_pessoa) VALUE 
('Mestre de obras', 'M008','8000.00','CLT','A',11); -- Alexandre

alter table projeto change status status varchar(15);
select *from projeto;
select *from colaborador;

INSERT INTO projeto (valor, tipo_projeto, nome_projeto, data_inicio, status, data_fim, previsao, id_colaborador) VALUES
(250000.00, 'Construção', 'Construção do Novo Galpão', '2024-03-01', 'Em Andamento', '2024-08-31', '2024-07-15', 8);  -- Usando o colaborador com ID 8 (João)
INSERT INTO projeto (valor, tipo_projeto, nome_projeto, data_inicio, status, data_fim, previsao, id_colaborador) 
VALUES (10000.00, 'Arquitetura', 'Projeto Exemplo', '2024-10-01', 'Em andamento', '2025-01-01', '2025-01-15', 9);

select*from projeto;


alter table obra change status status varchar(15);
select *from empreiteira;
INSERT INTO obra (valor, data_inicio, previsao, data_fim, status, id_empreiteira, id_projeto, id_colaborador) VALUES
(300000.00, '2024-03-15', '2024-06-15', '2024-06-30', 'Em Andamento', 4, 7, 10);  -- Usando a empreiteira com ID 1, projeto com ID 1, e colaborador com ID 10

INSERT INTO obra (valor, data_inicio, previsao, data_fim, status, id_empreiteira, id_projeto, id_colaborador) VALUES 
(50000.00, '2024-10-01', '2025-02-01', '2025-02-15', 'Em andamento', 4, 8, 23);












