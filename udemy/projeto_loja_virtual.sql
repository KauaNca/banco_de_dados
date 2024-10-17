CREATE DATABASE loja_virtual;
use loja_virtual;

create table clientes(
	id_cliente int primary key auto_increment,
    nome varchar(100) not null,
    idade int null
);

create table pedidos(
	id_pedido int primary key auto_increment,
    id_cliente int not null,
    data_hora datetime default current_timestamp,
    foreign key(id_cliente) references clientes(id_cliente)
);

create table produto(
	id_produto int primary key auto_increment,
    produto varchar(100) not null,
    valor decimal(8,2) not null
);

create table descricoes_tecnicas(
	id_descricao_tecnica int auto_increment primary key,
    id_produto int not null,
    descricao text,
    foreign key(id_produto) references produto(id_produto)
);

create table pedidos_produtos(
	id_pedido int not null,
    id_produto int not null,
    foreign key(id_pedido) references pedidos(id_pedido),
    foreign key(id_produto) references produto(id_produto)
);

create table imagens(
	id_imagem int primary key auto_increment,
    id_produto int not null,
    url_imagem text,
    foreign key(id_produto) references produto(id_produto)
);

/*INSERINDO REGISTROS*/

INSERT INTO clientes (id_cliente, nome, idade) 
VALUES 
(1, 'João Silva', 30),
(2, 'Maria Oliveira', 25),
(3, 'Pedro Souza', 40),
(4, 'Cláudia Almeida', 32),
(5, 'Rafael Pereira', 27);

INSERT INTO pedidos (id_pedido, id_cliente, data_hora) 
VALUES 
(1, 1, '2024-10-01 14:30:00'),
(2, 2, '2024-10-02 16:45:00'),
(3, 3, '2024-10-03 09:20:00'),
(4, 4, '2024-10-04 11:15:00'),
(5, 5, '2024-10-05 18:50:00');

INSERT INTO produto (id_produto, produto, valor) 
VALUES 
(1, 'Smartphone', 2500.00),
(2, 'Laptop', 4500.00),
(3, 'Tablet', 1500.00),
(4, 'Smartwatch', 800.00),
(5, 'Fone de Ouvido Bluetooth', 300.00);

INSERT INTO descricoes_tecnicas (id_descricao_tecnica, id_produto, descricao) 
VALUES 
(1, 1, 'Smartphone com tela AMOLED de 6.5 polegadas, 128GB de armazenamento e câmera de 48MP'),
(2, 2, 'Laptop com processador Intel Core i7, 16GB de RAM, 512GB SSD e tela de 15.6 polegadas'),
(3, 3, 'Tablet com tela de 10.2 polegadas, 64GB de armazenamento e suporte a caneta digital'),
(4, 4, 'Smartwatch resistente à água, com monitoramento de batimentos cardíacos e GPS integrado'),
(5, 5, 'Fone de Ouvido Bluetooth com cancelamento de ruído ativo e bateria de longa duração');

INSERT INTO imagens (id_imagem, id_produto, url_imagem) 
VALUES 
(1, 1, 'https://example.com/images/smartphone_front.jpg'),
(2, 1, 'https://example.com/images/smartphone_back.jpg'),
(3, 2, 'https://example.com/images/laptop_open.jpg'),
(4, 2, 'https://example.com/images/laptop_closed.jpg'),
(5, 3, 'https://example.com/images/tablet.jpg'),
(6, 4, 'https://example.com/images/smartwatch.jpg'),
(7, 5, 'https://example.com/images/headphones_side.jpg'),
(8, 5, 'https://example.com/images/headphones_case.jpg');
/*PERCEBA QUE O ID-IMAGEM RODOU, MAS O ID_PRODUTO SE REPETIU POIS UM PRODUTO PODE
TER VÁRIAS IMAGENS*/

/*TABELA MUITOS PARA MUITOS*/
/*Perceba que pode ter um mesmo pedido e produtos diferentes e o mesmo produto em outros pedidos*/

INSERT INTO pedidos_produtos (id_pedido, id_produto) 
VALUES 
(1, 1),  -- Pedido 1 com o Smartphone
(1, 5),  -- Pedido 1 também inclui o Fone de Ouvido Bluetooth
(2, 2),  -- Pedido 2 com o Laptop
(3, 3),  -- Pedido 3 com o Tablet
(4, 4),  -- Pedido 4 com o Smartwatch
(5, 1),  -- Pedido 5 com outro Smartphone
(5, 5);  -- Pedido 5 também inclui o Fone de Ouvido Bluetooth

/*
	Neste exemplo, o Pedido 1 inclui dois produtos: um Smartphone e um Fone de Ouvido Bluetooth. 
    O mesmo ocorre com o Pedido 5, que também inclui um Smartphone e um Fone de Ouvido. 
    Isso mostra a flexibilidade de associar múltiplos produtos a um único pedido.
*/

/*ATIVIDADES DE FIXACAO DO CONTEÚDO*/
/*
1) Selecione todos os clientes com idade igual ou superior a 29. Os registros devem ser ordenados de
forma ascendente pela idade.
*/
SELECT * FROM clientes WHERE idade > 29 ORDER BY idade;

/*
2) Utilize instruções do subconjunto DDL do SQL para realizar a inclusão das colunas abaixo na tabela
tb_clientes:
• Adicine a coluna “sexo” do tipo string com tamanho fixo de 1 caractere. Coluna não pode ser
vazia na inserção (não pode ser null).
• Adicione a coluna “endereço” do tipo string com tamanho variado de até 150 caracteres. Coluna
pode ser vazia na inserção
*/

ALTER TABLE clientes ADD sexo CHAR(1) NOT NULL;
ALTER TABLE clientes ADD endereco VARCHAR(150) NULL;


/*
3) Efetue um update em tb_clientes dos registros de id_cliente igual a 1, 2, 3, 6 e 7, atualizando o sexo
para “M”. Utilize a instrução IN para este fim.

4) FOI A MESMA COISA
*/
UPDATE clientes 
SET sexo = (CASE WHEN RAND() < 0.5 THEN 'M' ELSE 'F' END)
WHERE id_cliente >= 1;

/*
RAND(): gera um número aleatório entre 0 e 1.
CASE WHEN RAND() < 0.5 THEN 'M' ELSE 'F' END: esta expressão atribui 'M' se o número gerado for menor que 0.5, e 'F' caso contrário.
*/
/*PRIMEIRO FOI ALEATÓRIO, AGORA ARRUMAR*/

UPDATE clientes SET 
sexo = 'M' WHERE sexo IN ('F');/*arrumando os homens*/

UPDATE clientes SET sexo = 'F' WHERE id_cliente = 2 OR id_cliente = 4;/*arrumando as mulheres*/

SELECT*FROM clientes;

/*
5) Selecione todos os registros de tb_clientes que possuam relação com tb_pedidos e com tb_pedidos
produtos (apenas registros com relacionamentos entre si). Recupe também os detalhes dos produtos da
tabela tb_produtos. A consulta deve retornar de tb_clientes as colunas “id_cliente”, “nome”, “idade” e
de tb_produtos deve ser retornado as colunas “produto” e “valor”.
*/

DELETE FROM pedidos WHERE id_cliente = 4;/*NÃO VAI CONSEGUIR POIS ESTÁ AMARRADO*/

SELECT clientes.id_cliente, nome, idade, produto, valor 
FROM clientes 
LEFT JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente
LEFT JOIN pedidos_produtos pp ON pedidos.id_pedido = pp.id_pedido
LEFT JOIN produto ON produto.id_produto = pp.id_produto;








