CREATE DATABASE sistema_venda;
USE sistema_venda;
-- Tabela pessoa

CREATE TABLE pessoa (
    id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    idade INT,
    cpf_cnpj VARCHAR(25) NOT NULL,
    situacao VARCHAR(20) NOT NULL
);

-- Tabela atendente
CREATE TABLE atendente (
    id_atendente INT PRIMARY KEY AUTO_INCREMENT,
    matricula VARCHAR(45),
    salario DECIMAL(10,2),
    situacao VARCHAR(20),
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

-- Tabela cliente
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    telefone VARCHAR(45),
    saldo DECIMAL(10,2),
    email VARCHAR(45),
    situacao VARCHAR(20),
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);

-- Tabela categoria
CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(150)
);

-- Tabela produto
CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(45),
    descricao VARCHAR(45),
    preco DECIMAL(10,2),
    situacao VARCHAR(45),
    id_categoria INT NOT NULL,
    quantidade_estoque INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

-- Tabela alteracao_preco
CREATE TABLE alteracao_preco (
    id_alteracao_preco INT PRIMARY KEY AUTO_INCREMENT,
    preco_novo DECIMAL(10,2),
    preco_antigo DECIMAL(10,2),
    id_produto INT,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

-- Tabela venda
CREATE TABLE venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    total_bruto DECIMAL(10,2),
    desconto DECIMAL(10,2),
    acrescimo DECIMAL(10,2),
    valor_total DECIMAL(10,2),
    situacao CHAR(1),
    id_cliente INT NOT NULL,
    id_atendente INT NOT NULL,
    numero_cupom INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_atendente) REFERENCES atendente(id_atendente)
);

-- Tabela item_venda
CREATE TABLE item_venda (
    id_item_venda INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT,
    preco DECIMAL(10,2),
    total_bruto DECIMAL(10,2),
    desconto DECIMAL(10,2),
    acrescimo DECIMAL(10,2),
    valor_total DECIMAL(10,2),
    cancelado CHAR(1),
    id_produto INT NOT NULL,
    id_venda INT NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda)
);

/*INSERTs*/
INSERT INTO pessoa (id_pessoa, nome, idade, cpf_cnpj, situacao)
VALUES
(1, 'João Silva', 30, 12345678901, 'Atendente'),
(2, 'Maria Oliveira', 25, 98765432100, 'Cliente'),
(3, 'Carlos Pereira', 45, 11223344556, 'Cliente'),
(4, 'Ana Souza', 35, 22334455667, 'Atendente'),
(5, 'Pedro Santos', 28, 33445566778, 'Cliente'),
(6, 'Laura Costa', 40, 44556677889, 'Atendente');


SELECT*FROM pessoa;
INSERT INTO cliente (id_cliente, telefone, saldo, email, situacao, id_pessoa)
VALUES
(1, '11987654321', 150.00, 'maria.oliveira@email.com', 'Ativo', 2),
(2, '11965432198', 300.50, 'carlos.pereira@email.com', 'Ativo', 3),
(3, '11954321678', 120.75, 'pedro.santos@email.com', 'Ativo', 5);

INSERT INTO atendente (id_atendente, matricula, salario, situacao, id_pessoa)
VALUES
(1, 'A001', 2500.00, 'Ativo', 1),
(2, 'A002', 2700.00, 'Ativo', 4),
(3, 'A003', 3000.00, 'Ativo', 6);

INSERT INTO categoria (id_categoria, descricao) VALUES 
(1, 'Alimentos e Bebidas'),
(2, 'Vestuário e Acessórios'),
(3, 'Eletrônicos e Eletrodomésticos'),
(4, 'Saúde e Beleza'),
(5, 'Casa e Decoração'),
(6, 'Esportes e Lazer'),
(7, 'Automotivo'),
(8, 'Tecnologia e Informática'),
(9, 'Móveis'),
(10, 'Brinquedos e Jogos');

INSERT INTO produto (id_produto, codigo, descricao, preco, situacao, id_categoria, quantidade_estoque) VALUES 
(1, 'A001', 'Arroz Branco 5kg', 19.99, 'Disponível', 1, 50),
(2, 'A002', 'Feijão Preto 1kg', 7.99, 'Disponível', 1, 40),
(3, 'A003', 'Açúcar Cristal 1kg', 3.99, 'Disponível', 1, 60),
(4, 'A004', 'Óleo de Soja 900ml', 6.49, 'Disponível', 1, 25),
(5, 'A005', 'Macarrão Espaguete 500g', 2.99, 'Disponível', 1, 70),
(6, 'A006', 'Leite Integral 1L', 4.49, 'Disponível', 1, 30),
(7, 'B001', 'Camisa Polo Masculina', 49.90, 'Disponível', 2, 30),
(8, 'E001', 'Smartphone XYZ', 999.99, 'Disponível', 3, 20),
(9, 'S001', 'Creme Hidratante Facial', 39.90, 'Disponível', 4, 40),
(10, 'D001', 'Sofá Retrátil 3 Lugares', 1299.99, 'Disponível', 5, 10);

DROP TRIGGER before_insert_item_venda;
DELETE FROM item_venda WHERE id_item_venda >=1;
SELECT*FROM item_venda;

SELECT*FROM venda;

/* TRIGGERS */
DELIMITER //
CREATE TRIGGER before_insert_item_venda
BEFORE INSERT ON item_venda /*antes de inserir na tabela*/
FOR EACH ROW
BEGIN
	SET NEW.preco = (SELECT preco FROM produto WHERE produto.id_produto = NEW.id_produto); /*puxar o preço do produto. PRECISA DO NEW pois se refere as novas linhas inseridas*/
    SET NEW.total_bruto = NEW.quantidade * NEW.preco; /*multiplicando com a quantidade que será inserida e o preço puxado*/
    SET NEW.valor_total = NEW.total_bruto - NEW.desconto + NEW.acrescimo;
	SET NEW.cancelado = 'N';
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_venda_after_item_insert /*após o insert em item_venda, quero que essas informações atualizem a venda*/
AFTER INSERT ON item_venda
FOR EACH ROW
BEGIN
    -- Verifica se todos os valores são maiores que 0
	IF ((SELECT COALESCE(SUM(total_bruto), 0) 
         FROM item_venda 
         WHERE item_venda.id_venda = NEW.id_venda AND item_venda.cancelado = 'N') > 0
        OR 
        (SELECT COALESCE(SUM(desconto), 0) 
         FROM item_venda 
         WHERE item_venda.id_venda = NEW.id_venda AND item_venda.cancelado = 'N') > 0
        OR
        (SELECT COALESCE(SUM(acrescimo), 0) 
         FROM item_venda 
         WHERE item_venda.id_venda = NEW.id_venda AND item_venda.cancelado = 'N') > 0
        OR
        (SELECT (COALESCE(SUM(total_bruto), 0) - COALESCE(SUM(desconto), 0) + COALESCE(SUM(acrescimo), 0))
         FROM item_venda 
         WHERE item_venda.id_venda = NEW.id_venda AND item_venda.cancelado = 'N') > 0) THEN
        -- Atualiza os valores da venda se uma condição for atendida
        UPDATE venda 
        SET 
            total_bruto = (SELECT COALESCE(SUM(total_bruto), 0) 
                           FROM item_venda 
                           WHERE item_venda.id_venda = venda.id_venda AND item_venda.cancelado = 'N'),
            desconto = (SELECT COALESCE(SUM(desconto), 0) 
                        FROM item_venda 
                        WHERE item_venda.id_venda = venda.id_venda AND item_venda.cancelado = 'N'),
            acrescimo = (SELECT COALESCE(SUM(acrescimo), 0) 
                         FROM item_venda 
                         WHERE item_venda.id_venda = venda.id_venda AND item_venda.cancelado = 'N'),
            valor_total = (total_bruto - desconto + acrescimo),
            situacao = 'S'
        WHERE id_venda = NEW.id_venda;
    
    ELSE
        -- Atualiza a situação para 'Pendente' caso a condição não seja atendida
        UPDATE venda 
        SET situacao = 'P'
        WHERE id_venda = NEW.id_venda;
	END IF;
END
//
DELIMITER ;

/* Inútil, pois quando utilizei o valor_total ficava em branco pois um trigger não consegue puxar de outro

DELIMITER //
CREATE TRIGGER puxar_preco
BEFORE INSERT ON item_venda
FOR EACH ROW
BEGIN
    SET NEW.preco = (SELECT preco FROM produto WHERE produto.id_produto = NEW.id_produto);
END;
//
DELIMITER ;
*/

DELIMITER //
CREATE TRIGGER diminuir_estoque
AFTER INSERT ON item_venda
FOR EACH ROW
BEGIN
	IF(NEW.cancelado = 'N') THEN
    UPDATE produto SET quantidade_estoque = quantidade_estoque - NEW.quantidade WHERE id_produto = NEW.id_produto;
    END IF;
END;
//

/*AUMENTAR_ESTOQUE MODO ERRADO

DELIMITER //
CREATE TRIGGER aumentar_estoque
AFTER UPDATE ON item_venda
FOR EACH ROW
BEGIN
	IF(cancelado = 'S') THEN
    UPDATE produto SET quantidade_estoque = quantidade_estoque + quantidade WHERE id.produto = item_venda.id_produto AND item_venda.cancelado = 'S';
    UPDATE venda SET total_bruto = total_bruto - (SELECT preco FROM item_venda WHERE id_venda = item_venda.id_venda AND item_venda.cancelado = 'S');
    UPDATE venda SET valor_total = valor_total - (SELECT preco FROM item_venda WHERE id_venda = item_venda.id_venda AND item_venda.cancelado = 'S') - (SELECT desconto FROM item_venda WHERE id_venda = item_venda.id_venda AND item_venda.cancelado = 'S') - (SELECT acrescimo FROM item_venda WHERE id_venda = item_venda.id_venda AND item_venda.cancelado = 'S');
    UPDATE venda SET desconto = desconto - (SELECT desconto FROM item_venda WHERE id_venda = item_venda.id_venda AND item_venda.cancelado = 'S');
    UPDATE venda SET acrescimo = acrescimo - (SELECT acrescimo FROM item_venda WHERE id_venda = item_venda.id_venda AND item_venda.cancelado = 'S');
    END IF;
END;
//

*/

DELIMITER //

CREATE TRIGGER aumentar_estoque
AFTER UPDATE ON item_venda
FOR EACH ROW
BEGIN
    IF NEW.cancelado = 'S' THEN
        -- Atualiza o estoque do produto
        UPDATE produto 
        SET quantidade_estoque = quantidade_estoque + NEW.quantidade 
        WHERE id_produto = NEW.id_produto;

        -- Atualiza os valores na tabela venda
        UPDATE venda 
        SET total_bruto = total_bruto - NEW.preco,
			desconto = desconto - NEW.desconto,
            acrescimo = acrescimo - NEW.acrescimo,
            valor_total = valor_total - (NEW.preco + NEW.desconto + NEW.acrescimo)
        WHERE id_venda = NEW.id_venda;
    END IF;
END;

//

DELIMITER ;


/*TESTANDO */
INSERT INTO venda(id_venda,total_bruto,desconto,acrescimo,valor_total,situacao,id_cliente,id_atendente,numero_cupom)
values(1,0,0,0,0,'N',1,1,1);

INSERT INTO item_venda(id_item_venda,quantidade,desconto,acrescimo,id_produto,id_venda)
values(1,2,10.00,0,7,1), (2,1,0,0,9,1);


SELECT*FROM venda;
SELECT*FROM produto;
SELECT*FROM item_venda;

INSERT INTO venda (total_bruto,desconto,acrescimo,valor_total,situacao, id_cliente,id_atendente,numero_cupom) values(0,0,0,0,'P',2,3,2),(0,0,0,0,'P',2,3,2);
INSERT INTO item_venda(quantidade,desconto,id_produto,id_venda) VALUES (5,0,3,2), (10,15.00,3,2),(1,200,10,3);

UPDATE item_venda SET cancelado = 'S' WHERE id_item_venda = 17


DELIMITER //
CREATE TRIGGER historico_preco
AFTER UPDATE ON produto -- acessar tabela produto
FOR EACH ROW
BEGIN
	IF(NEW.preco <> OLD.preco) THEN -- se após a atualizacao o preço 
    INSERT INTO alteracao_preco(preco_novo,preco_antigo,id_produto)
    VALUES (NEW.preco,OLD.preco,NEW.id_produto);
    END IF;
END;
//

SELECT * FROM alteracao_preco;
SELECT*FROM produto;
UPDATE produto SET preco = 8.10 WHERE id_produto = 2;


/*AUDITORIA */
CREATE TABLE auditoria(
id_auditoria int primary key auto_increment,
nome varchar(30), 
cpf varchar(16),
situacao varchar(15),
id_pessoa int,
foreign key(id_pessoa) references pessoa(id_pessoa)
);
DROP TABLE auditoria;

DELIMITER //
CREATE TRIGGER before_delete_pessoa
AFTER DELETE ON pessoa FOR EACH ROW
BEGIN
	INSERT INTO auditoria(nome,cpf,situacao,id_pessoa) VALUES(OLD.nome,OLD.cpf_cnpj,'DELETADO',OLD.id_pessoa);
END;
//

DELIMITER //
CREATE TRIGGER after_insert_pessoa
AFTER INSERT ON pessoa FOR EACH ROW
BEGIN
	INSERT INTO auditoria(nome,cpf,situacao,id_pessoa) VALUES(NEW.nome,NEW.cpf_cnpj,'INSERIDO',NEW.id_pessoa);
END;
//

DELIMITER //
CREATE TRIGGER update_pessoa_after
BEFORE INSERT ON pessoa FOR EACH ROW
BEGIN
	UPDATE pessoa SET situacao = 'Ativo';
END;
//

DROP TRIGGER before_delete_pessoa;
DROP TRIGGER after_insert_pessoa;


/*TESTANDO TRIGGER DA TABELA AUDITORIA - CADASTRO*/
ALTER TABLE pessoa CHANGE situacao tipo VARCHAR(15) NOT NULL;
ALTER TABLE pessoa CHANGE situacao situacao VARCHAR(15);


SELECT*FROM pessoa;
INSERT INTO pessoa (nome,idade,cpf_cnpj,tipo) VALUES ('Isabel',18,'000000001','Cliente');
SELECT * FROM auditoria;


DELETE FROM pessoa WHERE id_pessoa = 7;



