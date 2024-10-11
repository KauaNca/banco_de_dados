create database empreiteira3;
use empreiteira3;

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
alter table endereco change cep cep char(9);-- alterar o cep 
alter table empreiteira change area_atuacao area_atuacao varchar(25);
alter table empreiteira change tipo_contrato tipo_contrato varchar(20);
alter table colaborador change funcao funcao varchar(25);
alter table projeto change status status varchar(15);
alter table obra change status status varchar(20);
alter table pessoa change situacao situacao varchar(20);
alter table pessoa change email email varchar(30);



#funcionarios
INSERT INTO pessoa (id_pessoa, nome, cnpj_cpf, nome_fantasia, telefone, email, situacao) VALUES
(1, 'João da Silva', '123.456.789-00', 'João Construções', '(11) 98765-4321', 'joao.silva@construcao.com', 'Ativo'),
(2, 'Maria Oliveira', '234.567.890-11', 'Maria Engenharia', '(11) 97654-3210', 'maria.oliveira@engenharia.com', 'Ativo'),
(3, 'Carlos Pereira', '345.678.901-22', 'Carlos Reformas', '(11) 96543-2109', 'carlos.pereira@reformas.com', 'Ativo'),
(4, 'Ana Souza', '456.789.012-33', 'Ana Projetos', '(11) 95432-1098', 'ana.souza@projetos.com', 'Ativo'),
(5, 'Pedro Santos', '567.890.123-44', 'Pedro Construção', '(11) 94321-0987', 'pedro.santos@construcao.com', 'Ativo'),
(6, 'Juliana Lima', '678.901.234-55', 'Juliana Obras', '(11) 93210-9876', 'juliana.lima@obras.com', 'Ativo'),
(7, 'Roberto Costa', '789.012.345-66', 'Roberto Arquitetura', '(11) 92109-8765', 'roberto.costa@arquitetura.com', 'Ativo'),
(8, 'Fernanda Alves', '890.123.456-77', 'Fernanda Construção', '(11) 91098-7654', 'fernanda.alves@construcao.com', 'Ativo'),
(9, 'Marcos Lima', '901.234.567-88', 'Marcos Projetos', '(11) 90987-6543', 'marcos.lima@projetos.com', 'Ativo'),
(10, 'Tatiane Rocha', '012.345.678-99', 'Tatiane Engenharia', '(11) 89876-5432', 'tatiane.rocha@engenharia.com', 'Ativo');

#empresas
INSERT INTO pessoa (id_pessoa, nome, cnpj_cpf, nome_fantasia, telefone, email, situacao) VALUES
(11, 'Construtora A', '12.345.678/0001-90', 'A Construções LTDA', '(11) 3000-0001', 'contato@construtoraA.com', 'Ativo'),
(12, 'Construtora B', '23.456.789/0001-01', 'B Engenharia S/A', '(11) 3000-0002', 'contato@construtoraB.com', 'Ativo'),
(13, 'Construtora C', '34.567.890/0001-12', 'C Reformas ME', '(11) 3000-0003', 'contato@construtoraC.com', 'Ativo'),
(14, 'Construtora D', '45.678.901/0001-23', 'D Obras LTDA', '(11) 3000-0004', 'contato@construtoraD.com', 'Ativo'),
(15, 'Construtora E', '56.789.012/0001-34', 'E Engenharia S/A', '(11) 3000-0005', 'contato@construtoraE.com', 'Ativo');

alter table endereco change rua rua varchar(35);
INSERT INTO endereco (id_endereco, rua, cidade, uf, bairro, cep, situacao, id_pessoa) VALUES
(1, 'Rua das Flores', 'São Paulo', 'SP', 'Jardim das Rosas', '01234-567', 'A', 1),  -- João da Silva
(2, 'Avenida Paulista', 'São Paulo', 'SP', 'Bela Vista', '01310-000', 'A', 2),  -- Maria Oliveira
(3, 'Rua da Independência', 'São Paulo', 'SP', 'Centro', '01045-678', 'A', 3),  -- Carlos Pereira
(4, 'Rua das Acácias', 'São Paulo', 'SP', 'Vila Mariana', '04100-000', 'A', 4),  -- Ana Souza
(5, 'Avenida Brigadeiro Faria Lima', 'São Paulo', 'SP', 'Itaim Bibi', '01452-000', 'A', 5),  -- Pedro Santos
(6, 'Rua dos Curiós', 'São Paulo', 'SP', 'Lapa', '05060-000', 'A', 6),  -- Juliana Lima
(7, 'Rua São Vicente', 'São Paulo', 'SP', 'Vila Madalena', '05410-000', 'A', 7),  -- Roberto Costa
(8, 'Rua dos Três Irmãos', 'São Paulo', 'SP', 'Pinheiros', '05422-000', 'A', 8),  -- Fernanda Alves
(9, 'Rua da Esperança', 'São Paulo', 'SP', 'Mooca', '03170-000', 'A', 9),  -- Marcos Lima
(10, 'Rua do Comércio', 'São Paulo', 'SP', 'Bom Retiro', '01140-000', 'A', 10),  -- Tatiane Rocha
(11, 'Rua dos Trabalhadores', 'São Paulo', 'SP', 'Vila Leopoldina', '05023-000', 'A', 11),  -- Construtora A
(12, 'Avenida dos Negócios', 'São Paulo', 'SP', 'Centro', '01314-000', 'A', 12),  -- Construtora B
(13, 'Rua da Engenharia', 'São Paulo', 'SP', 'Vila Maria', '02090-000', 'A', 13),  -- Construtora C
(14, 'Rua das Obras', 'São Paulo', 'SP', 'Itaquera', '08280-000', 'A', 14),  -- Construtora D
(15, 'Avenida da Construção', 'São Paulo', 'SP', 'Bela Vista', '01320-000', 'A', 15);  -- Construtora E

INSERT INTO colaborador (id_colaborador, funcao, matricula, salario, tipo_contrato, situacao, id_pessoa) VALUES
(1, 'Pedreiro', 'MTR001', 2500.00, 'CLT', 'A', 1),  -- João da Silva
(2, 'Arquiteta', 'MTR002', 3500.00, 'CLT', 'A', 2),  -- Maria Oliveira
(3, 'Técnico de Segurança', 'MTR003', 2800.00, 'CLT', 'A', 3),  -- Carlos Pereira
(4, 'Arquiteta', 'MTR004', 3600.00, 'CLT', 'A', 4),  -- Ana Souza
(5, 'Gerente de Projetos', 'MTR005', 4000.00, 'CLT', 'A', 5),  -- Pedro Santos
(6, 'Ajudante', 'MTR006', 2000.00, 'CLT', 'A', 6),  -- Juliana Lima
(7, 'Mestre de Obras', 'MTR007', 3200.00, 'CLT', 'A', 7),  -- Roberto Costa
(8, 'Assistente Administrativo', 'MTR008', 2200.00, 'CLT', 'A', 8),  -- Fernanda Alves
(9, 'Supervisor de Obras', 'MTR009', 3700.00, 'CLT', 'A', 9),  -- Marcos Lima
(10, 'Designer de Interiores', 'MTR010', 3300.00, 'CLT', 'A', 10);  -- Tatiane Rocha

INSERT INTO empreiteira (id_empreiteira, area_atuacao, tipo_contrato, situacao, id_pessoa) VALUES
(1, 'Construção Civil', 'CLT', 'A', 11),  -- Construtora A
(2, 'Engenharia', 'CLT', 'A', 12),  -- Construtora B
(3, 'Reformas e Manutenção', 'CLT', 'A', 13),  -- Construtora C
(4, 'Obras Públicas', 'CLT', 'A', 14),  -- Construtora D
(5, 'Construção Residencial', 'CLT', 'A', 15);  -- Construtora E

alter table projeto change nome_projeto nome_projeto varchar(35);
INSERT INTO projeto (id_projeto, valor, tipo_projeto, nome_projeto, data_inicio, previsao, data_fim, status, id_colaborador) VALUES
(1, 150000.00, 'Residencial', 'Construção de Residência A', '2024-01-01', '2024-06-30', '2024-07-15', 'Em Andamento', 5),  -- Gerente de Projetos (Pedro Santos)
(2, 200000.00, 'Comercial', 'Reforma do Prédio B', '2024-02-01', '2024-07-31', '2024-08-15', 'Planejado', 2),  -- Arquiteta (Maria Oliveira)
(3, 300000.00, 'Público', 'Construção de Escola C', '2024-03-01', '2024-12-15', '2025-01-15', 'Planejado', 4),  -- Arquiteta (Ana Souza)
(4, 180000.00, 'Comercial', 'Construção de Loja D', '2024-02-15', '2024-09-30', '2024-10-15', 'Em Andamento', 5);  -- Gerente de Projetos (Pedro Santos)

INSERT INTO obra (id_obra, valor, data_inicio, previsao, data_fim, status, id_empreiteira, id_projeto, id_colaborador) VALUES
(1, 150000.00, '2024-01-01', '2024-06-30', '2024-07-15', 'Em Andamento', 1, 1, 5),  -- Empreiteira A, Projeto 1, Gerente de Projetos (Pedro Santos)
(2, 200000.00, '2024-02-01', '2024-07-31', '2024-08-15', 'Planejado', 2, 2, 2),  -- Empreiteira B, Projeto 2, Arquiteta (Maria Oliveira)
(3, 300000.00, '2024-03-01', '2024-12-15', '2025-01-15', 'Planejado', 4, 3, 4),  -- Empreiteira D, Projeto 3, Arquiteta (Ana Souza)
(4, 180000.00, '2024-02-15', '2024-09-30', '2024-10-15', 'Em Andamento', 1, 4, 1),  -- Empreiteira A, Projeto 4, Pedreiro (João da Silva)
(5, 120000.00, '2024-03-15', '2024-10-30', '2024-11-15', 'Planejado', 3, 4, 6),  -- Empreiteira C, Projeto 5, Ajudante (Juliana Lima)
(6, 250000.00, '2024-04-01', '2024-08-15', '2024-09-30', 'Em Andamento', 2, 1, 7);  -- Empreiteira B, Projeto 1, Mestre de Obras (Roberto Costa)

select*from pessoa;
select*from endereco;
select*from colaborador;
select*from empreiteira;
select*from obra;
select*from projeto;



/*
Nome do colaborador
Nome do Arquiteto
Qual obra a empresa está responsável 
*/
SELECT pessoa.nome as nome_colaborador,pessoa.nome as empresa_reponsavel,obra.data_inicio,obra.valor,nome_projeto,projeto.valor FROM obra
INNER JOIN projeto on projeto.id_projeto = obra.id_projeto
INNER JOIN empreiteira emp on emp.id_empreiteira = obra.id_empreiteira
INNER JOIN pessoa on  pessoa.id_pessoa = emp.id_pessoa
INNER JOIN colaborador on colaborador.id_pessoa = obra.id_colaborador
INNER JOIN pessoa on pessoa.id_pessoa = colaborador.id_pessoa;


CREATE VIEW relatorio_empreiteira AS
SELECT 
pe.nome AS nome_empresa,
pm.nome AS nome_mestre_obra,
p.nome AS nome_arquiteto,
pj.nome_projeto,
pj.valor AS valor_projeto,
o.valor AS valor_obra,
o.data_inicio AS data_inicio_obra

 FROM obra o #apenas indicando de onde vai se começar, ja dá para tirar o valor da obra,data_inicio
INNER JOIN projeto pj ON pj.id_projeto = o.id_projeto #aqui pega o nome do projeto e o valor
INNER JOIN colaborador c ON c.id_colaborador = pj.id_colaborador # fazendo a ligação da tabela colaborador-projeto e assim conseguir o nome_do para que faça uma escada para chegar a tabela pessoa
INNER JOIN pessoa p ON p.id_pessoa = c.id_pessoa #ligação colaborador-pessoa
INNER JOIN empreiteira ep ON ep.id_empreiteira = o.id_empreiteira # id_pessoa
INNER JOIN pessoa pe ON pe.id_pessoa = ep.id_pessoa
INNER JOIN colaborador cm ON cm.id_colaborador = o.id_colaborador
INNER JOIN pessoa pm ON pm.id_pessoa = cm.id_pessoa;

select rua,cep,cidade,uf from obra 
inner join colaborador c on c.id_colaborador = o.id_colaborador
inner join empreiteira e on e.id_empreiteira = o.id_empreiteira
inner join pessoa pco on pco.id_pessoa = c.id_pessoa
inner join pessoa pem on pem.id.pessoa = e.id_pessoa
inner join endereco en on pco.id_pessoa = enpco.id_pessoa
inner join endereco en on pem.id_pessoa = enpem.id_pessoa;














select pessoa.id_pessoa, nome, funcao from colaborador ##selecionando as colunas que quero da tabela colaborador, mas como não tem a coluna nome tem que fazer inner join
inner join pessoa on colaborador.id_pessoa = pessoa.id_pessoa; #o inner join procurará em pessoa a coluna nome mas quando o id de pessoa de colaborador for igual ao de pessoa

select nome_fantasia,rua,cidade,uf,telefone,nome_projeto,obra.data_inicio,obra.previsao,obra.data_fim,obra.valor from obra
inner join projeto on projeto.id_colaborador = obra.id_colaborador #primeiro puxo o nome do projeto, sendo id colaborador a coisa comum entre os dois
inner join empreiteira on obra.id_empreiteira = empreiteira.id_empreiteira #puxo a empreiteira para que assim eu possa buscar o nome da tabela pessoa
inner join pessoa on pessoa.id_pessoa = empreiteira.id_pessoa #com o id pessoa em empreiteira faz uma ligaçao e também posso puxar o endereço por meio desse id que também está presente em endereco
inner join endereco on endereco.id_pessoa = pessoa.id_pessoa;


select nome,nome_fantasia,tipo_projeto,projeto.valor,obra.valor,obra.data_inicio from projeto,empreiteira 
inner join obra on empreiteira.id_empreiteira = obra.id_empreiteira 
inner join pessoa on empreiteira.id_pessoa = pessoa.id_pessoa where nome_fantasia is not null
inner join colaborador on colaborador.id_pessoa = pessoa.id_pessoa;

select *from pessoa;
















