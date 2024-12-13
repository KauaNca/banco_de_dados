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
    livros int not null
);

INSERT INTO pessoa (nome, idade, cpf_cnpj, email, telefone, situacao)
VALUES 
('João da Silva', 30, '123.456.789-00', 'joao.silva@email.com', '91234-5678', 'A'),
('Maria Oliveira', 28, '987.654.321-00', 'maria.oliveira@email.com', '98765-4321', 'A'),
('Carlos Souza', 35, '111.222.333-44', 'carlos.souza@email.com', '93322-4455', 'A'),
('Ana Costa', 26, '555.444.333-22', 'ana.costa@email.com', '93456-7788', 'A'),
('Roberto Pereira', 40, '222.333.444-55', 'roberto.pereira@email.com', '99887-6655', 'A'),
('Luciana Silva', 32, '333.444.555-66', 'luciana.silva@email.com', '97765-4433', 'A'),
('Eduardo Lima', 38, '444.555.666-77', 'eduardo.lima@email.com', '91234-7890', 'A'),
('Patricia Gomes', 45, '555.666.777-88', 'patricia.gomes@email.com', '98876-5544', 'A'),
('Ricardo Martins', 50, '666.777.888-99', 'ricardo.martins@email.com', '93334-5566', 'A'),
('Vanessa Rocha', 27, '777.888.999-00', 'vanessa.rocha@email.com', '91923-9876', 'A'),
('Fabio Oliveira', 29, '888.999.000-11', 'fabio.oliveira@email.com', '91234-6677', 'A'),
('Juliana Santos', 31, '999.000.111-22', 'juliana.santos@email.com', '92345-8899', 'A'),
('Leonardo Ferreira', 36, '000.111.222-33', 'leonardo.ferreira@email.com', '93456-1234', 'A'),
('Fernanda Alves', 33, '111.222.333-44', 'fernanda.alves@email.com', '91234-9876', 'A'),
('Rafael Costa', 41, '222.333.444-55', 'rafael.costa@email.com', '99876-5432', 'A');

INSERT INTO usuario (id_pessoa, livros)
VALUES 
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0);


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

create table compra(
	id_reserva int primary key auto_increment,
    id_usuario int not null,
    foreign key (id_usuario) references usuario(id_usuario),
    id_livro int not null,
    foreign key (id_livro) references livro(id_livro),
    tipoPagamento varchar(10) not null,
    valor float not null
);

CREATE TABLE login (
    id_login INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    usuario VARCHAR(45) NOT NULL UNIQUE,
    senha VARCHAR(60) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

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

INSERT INTO livro (titulo, sinopse, ano, valor, id_categoria) VALUES
('Duna', 'Uma aventura épica em um deserto alienígena.', 1965, 29.99, 1),
('Neuromancer', 'Um clássico da ficção científica cyberpunk.', 1984, 24.99, 1),
('O Senhor dos Anéis', 'Uma jornada épica pela Terra Média.', 1954, 39.99, 2),
('Harry Potter e a Pedra Filosofal', 'A primeira aventura de Harry Potter.', 1997, 29.99, 2),
('Orgulho e Preconceito', 'Um romance clássico sobre amor e sociedade.', 1813, 19.99, 3),
('O Morro dos Ventos Uivantes', 'Uma história de amor e vingança.', 1847, 18.99, 3),
('O Código Da Vinci', 'Um mistério intrigante envolvendo símbolos e segredos.', 2003, 24.99, 4),
('Sherlock Holmes: O Cão dos Baskervilles', 'Um dos casos mais famosos de Sherlock Holmes.', 1902, 22.99, 4),
('It: A Coisa', 'Um grupo de amigos enfrenta um mal antigo.', 1986, 34.99, 5),
('O Iluminado', 'Um clássico do terror psicológico.', 1977, 29.99, 5),
('Sapiens', 'Uma visão abrangente da história da humanidade.', 2011, 29.99, 6),
('Guns, Germs, and Steel', 'Uma análise das forças que moldaram a história humana.', 1997, 27.99, 6),
('Steve Jobs', 'A biografia do fundador da Apple.', 2011, 24.99, 7),
('Leonardo da Vinci', 'Uma biografia do gênio renascentista.', 2017, 28.99, 7),
('Eu Sou Malala', 'A autobiografia de uma jovem ativista.', 2013, 19.99, 8),
('Long Walk to Freedom', 'A autobiografia de Nelson Mandela.', 1994, 23.99, 8),
('Pai Rico, Pai Pobre', 'Lições sobre finanças pessoais e investimentos.', 1997, 21.99, 9),
('O Investidor Inteligente', 'Um guia clássico sobre investimentos.', 1949, 25.99, 9),
('O Poder do Hábito', 'Como os hábitos moldam nossas vidas.', 2012, 22.99, 10),
('Mindset', 'Como a mentalidade influencia o sucesso.', 2006, 20.99, 10),
('Como Fazer Amigos e Influenciar Pessoas', 'Dicas de autoajuda para melhorar suas relações.', 1936, 18.99, 11),
('O Guia do Mochileiro das Galáxias', 'Uma aventura tecnológica e humorística pelo espaço.', 1979, 25.99, 12),
('Ready Player One', 'Uma aventura em um mundo virtual.', 2011, 24.99, 12),
('Breves Respostas para Grandes Questões', 'Reflexões sobre ciência e o futuro da humanidade.', 2018, 27.99, 13),
('Uma Breve História do Tempo', 'Uma introdução ao universo e suas leis.', 1988, 26.99, 13),
('A República', 'Um diálogo filosófico sobre justiça e sociedade.', 380, 19.99, 14),
('Assim Falou Zaratustra', 'Uma obra filosófica de Nietzsche.', 1883, 22.99, 14),
('A Bíblia', 'O texto sagrado do Cristianismo.', -500, 0.00, 15),
('O Alcorão', 'O texto sagrado do Islã.', 632, 0.00, 15),
('O Poder do Agora', 'Ensinamentos sobre espiritualidade e presença.', 1997, 23.99, 16),
('Os Quatro Compromissos', 'Um guia prático para a liberdade pessoal.', 1997, 21.99, 16),
('Antologia Poética', 'Uma coleção de poemas clássicos.', 1943, 17.99, 17),
('O Livro dos Poemas', 'Uma seleção de poesias de Fernando Pessoa.', 1934, 18.99, 17),
('Hamlet', 'Uma tragédia clássica de Shakespeare.', 1603, 14.99, 18),
('Romeu e Julieta', 'Uma das mais famosas tragédias de Shakespeare.', 1597, 13.99, 18),
('Dom Quixote', 'Um clássico da literatura mundial.', 1605, 19.99, 19),
('Moby Dick', 'A épica caçada à baleia branca.', 1851, 18.99, 19),
('Harry Potter e a Câmara Secreta', 'A segunda aventura de Harry Potter.', 1998, 29.99, 20),
('Jogos Vorazes', 'Uma distopia jovem adulta.', 2008, 24.99, 20),
('Percy Jackson e o Ladrão de Raios', 'A primeira aventura de Percy Jackson.', 2005, 22.99, 20),
('Divergente', 'Uma distopia jovem adulta.', 2011, 23.99, 20),
('A Culpa é das Estrelas', 'Um romance jovem adulto.', 2012, 21.99, 20),
('O Nome do Vento', 'A primeira parte da Crônica do Matador do Rei.', 2007, 29.99, 2),
('A Guerra dos Tronos', 'O primeiro livro da série As Crônicas de Gelo e Fogo.', 1996, 34.99, 2),
('1984', 'Uma distopia clássica sobre um regime totalitário.', 1949, 19.99, 1),
('Fahrenheit 451', 'Uma distopia sobre a censura e a queima de livros.', 1953, 18.99, 1),
('O Hobbit', 'A aventura de Bilbo Bolseiro na Terra Média.', 1937, 29.99, 2),
('A Menina que Roubava Livros', 'Uma história emocionante durante a Segunda Guerra Mundial.', 2005, 24.99, 3);

DELIMITER //

CREATE TRIGGER usuario_automatico
AFTER INSERT ON pessoa
FOR EACH ROW
BEGIN
    INSERT INTO usuario(id_pessoa, livros) VALUES (NEW.id_pessoa, 0);
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER senha
BEFORE INSERT ON login
FOR EACH ROW
BEGIN
    SET NEW.senha = MD5(MD5(NEW.senha));
END;

//

DELIMITER ;


SELECT * FROM compra;
SELECT * FROM usuario;
SELECT * FROM login;
SELECT * FROM livro;
SELECT*FROM pessoa;
SELECT*FROM compra;
SELECT id_livro FROM livro WHERE titulo = '1984';


DROP DATABASE kaua_sistema_biblioteca;