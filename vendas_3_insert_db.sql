##VENDAS DE UM MERCADO
INSERT INTO venda(id_venda,quantidade,preco,total,desconto,acrescimo,situacao,id_cliente,id_atendente)
values(1,0,25.00,22.50,2.50,null,'Finalizado',3,1),
(2,0,30,30,null,null,'Finalizado',3,1),
(3,0,15,15,null,null,'Finalizado',2,3);
INSERT INTO venda (id_venda, quantidade, preco, total, desconto, acrescimo, situacao, id_cliente, id_atendente)
VALUES
(4, 0, 35.00, 34.50, 0.50, null, 'Finalizado', 1, 2),  -- Venda do cliente 1 com atendente 2
(5, 0, 28.00, 28.00, null, null, 'Finalizado', 2, 3),  -- Venda do cliente 2 com atendente 3
(6, 0, 40.00, 39.50, 0.00, 0.50, 'Finalizado', 1, 1);  -- Venda do cliente 1 com atendente 1

INSERT INTO item_venda (id_item_venda, quantidade, preco, desconto, acrescimo, valor_bruto, valor_total, cancelado, id_venda, id_produto)
VALUES
(1, 2, 8.50, 0.00, 0.00, 17.00, 17.00, 'Não', 1, 1),  -- Coca-Cola 2L
(2, 1, 4.80, 0.50, 0.00, 4.80, 4.30, 'Não', 1, 2),    -- Leite Integral 1L
(3, 3, 2.50, 0.00, 0.00, 7.50, 7.50, 'Não', 2, 5),    -- Sabonete 90g
(4, 1, 20.00, 2.00, 0.00, 20.00, 18.00, 'Não', 2, 3), -- Queijo Mussarela 500g
(5, 2, 15.00, 0.00, 1.00, 30.00, 31.00, 'Não', 3, 8), -- Papel Higiênico 12 rolos
(6, 4, 3.00, 0.00, 0.00, 12.00, 12.00, 'Não', 3, 6),  -- Água Mineral 1,5L
(7, 1, 12.50, 1.50, 0.00, 12.50, 11.00, 'Não', 4, 4), -- Shampoo 400ml
(8, 2, 7.00, 0.00, 0.50, 14.00, 14.50, 'Não', 4, 9),  -- Suco de Laranja 1L
(9, 1, 10.00, 0.00, 0.00, 10.00, 10.00, 'Não', 5, 10),-- Manteiga 200g
(10, 1, 3.50, 0.00, 0.00, 3.50, 3.50, 'Não', 5, 7);   -- Iogurte Natural 170g


INSERT INTO pessoa (id_pessoa, nome, idade, cpf, situacao)
VALUES 
(1, 'João Silva', 30, '123.456.789-00', 'Cliente'),
(2, 'Maria Oliveira', 25, '987.654.321-00', 'Cliente'),
(3, 'Carlos Souza', 40, '456.123.789-00', 'Cliente'),
(4, 'Ana Lima', 35, '321.654.987-00', 'Atendente'),
(5, 'Paulo Mendes', 28, '654.321.123-00', 'Atendente'),
(6, 'Beatriz Costa', 32, '789.456.123-00', 'Atendente');

INSERT INTO cliente (id_cliente, telefone, saldo, email, situacao, id_pessoa)
VALUES 
(1, '99999-1234', 150.75, 'joao.silva@email.com', 'Ativo', 1), #João
(2, '99999-5678', 250.00, 'maria.oliveira@email.com', 'Ativo', 2),#Maria
(3, '99999-9876', 80.50, 'carlos.souza@email.com', 'Ativo', 3);#Carlos

INSERT INTO atendente (id_atendente, matricula, salario, situacao, id_pessoa)
VALUES 
(1, 'A001', 2500.00, 'Ativo', 4),
(2, 'A002', 2200.00, 'Ativo', 5),
(3, 'A003', 2400.00, 'Ativo', 6);

INSERT INTO categoria (id_categoria, descricao)
VALUES 
(1, 'Bebidas'),
(2, 'Frios e Laticínios'),
(3, 'Higiene Pessoal');

ALTER TABLE produto CHANGE situacao situacao VARCHAR(25) NOT NULL;
INSERT INTO produto (id_produto, codigo, descricao, preco, situacao, quantidade_estoque, id_categoria)
VALUES
(1, '001', 'Coca-Cola 2L', 8.50, 'Disponível', 50, 1), #categoria bebidas
(2, '002', 'Leite Integral 1L', 4.80, 'Disponível', 30, 2), #categoria frios e laticínios
(3, '003', 'Queijo Mussarela 500g', 20.00, 'Disponível', 15, 2), #categoria frios e laticínios
(4, '004', 'Shampoo 400ml', 12.50, 'Disponível', 25, 3), #higiene pessoal
(5, '005', 'Sabonete 90g', 2.50, 'Disponível', 100, 3),#higiene pessoal
(6, '006', 'Água Mineral 1,5L', 3.00, 'Disponível', 40, 1), #categoria bebidas
(7, '007', 'Iogurte Natural 170g', 3.50, 'Disponível', 20, 2),#categoria frios e laticínios
(8, '008', 'Papel Higiênico 12 rolos', 15.00, 'Disponível', 60, 3),#higiene pessoal
(9, '009', 'Suco de Laranja 1L', 7.00, 'Disponível', 35, 1),#categoria bebidas
(10, '010', 'Manteiga 200g', 10.00, 'Disponível', 18, 2);#categoria frios e laticínios
/*
	id_venda x
    id_produto x
    nome_do_produto x
	produto x
	cliente x
	atendente
*/
SELECT iv.id_venda, iv.id_produto, pr.descricao AS nome_do_produto, ve.id_cliente, pe.nome as nome_cliente,at.id_atendente,pat.nome as nome_atendente
FROM item_venda iv
INNER JOIN produto pr ON pr.id_produto = iv.id_produto
INNER JOIN venda ve ON ve.id_venda = iv.id_venda
INNER JOIN cliente c ON ve.id_cliente = c.id_cliente
INNER JOIN pessoa pe ON c.id_pessoa = pe.id_pessoa
INNER JOIN atendente at on at.id_atendente = ve.id_atendente
INNER JOIN pessoa pat on at.id_pessoa = pat.id_pessoa
;

