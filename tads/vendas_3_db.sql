INSERT INTO pessoa (id_pessoa, nome, idade, cpf, situacao)
VALUES 
(1, 'João Silva', 30, '123.456.789-00', 'Cliente'),
(2, 'Maria Oliveira', 25, '987.654.321-00', 'Cliente'),
(3, 'Carlos Souza', 40, '456.123.789-00', 'Cliente'),
(4, 'Ana Lima', 35, '321.654.987-00', 'Atendente'),
(5, 'Paulo Mendes', 28, '654.321.123-00', 'Atendente'),
(6, 'Beatriz Costa', 32, '789.456.123-00', 'Atendente');

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
