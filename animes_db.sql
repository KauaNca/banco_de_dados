-- Criação do banco de dados
CREATE DATABASE anime_db;
USE anime_db;

-- Criação da tabela
CREATE TABLE animes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    genero VARCHAR(50),
    ano_lancamento YEAR,
    numero_episodios INT,
    nota DECIMAL(3, 1)
);
select nome from animes where nota >=8.8 and ano_lancamento > 2012 and numero_episodios > 20 ;
select nome from animes where numero_episodios between 100 and 300;

#testanto o in
select nome from animes where nota in (8.5);##não dá com gênero pois são várias dentro uma string só
select nome from animes where genero in ('Ação, Aventura');# perceba que ele só vai pegar Naruto
select nome from animes where nota in (8.5);

#testando o like
select nome from animes where nome like '%ra'; #terminam com ra
select nome from animes where nome like 'D%'; #começa com D
select nome from animes where nome like '%a_';#termina com 'a' e um caracter qualquer

#testando o order by
SELECT *FROM animes where nota > 8.5 order by nome desc, nota asc;

#testando o LIMIT e OFFSET
SELECT *FROM animes where nota > 8.5 order by nome desc, nota asc limit 5; #apenas 5 registros
SELECT *FROM animes where nota > 8.5 order by nome desc, nota asc limit 5 offset 7; #5 registros, mas começa do registro 7
SELECT *FROM animes where nota > 8.5 order by nome desc, nota asc limit 7,5; #mesma coisa da anterior, mas sintaxe enxuta

#testando funções de agregração 
SELECT nome, nota
FROM animes
WHERE nota = (SELECT MIN(nota) FROM animes);

SELECT count(nota) from animes where nota > 8.6;#8 animes



-- Inserção dos registros
INSERT INTO animes (nome, genero, ano_lancamento, numero_episodios, nota) VALUES
('Naruto', 'Ação, Aventura', 2002, 220, 8.3),
('One Piece', 'Ação, Aventura, Fantasia', 1999, 1000, 8.6),
('Attack on Titan', 'Ação, Drama, Fantasia', 2013, 75, 9.0),
('My Hero Academia', 'Ação, Escola', 2016, 88, 8.4),
('Death Note', 'Mistério, Psicológico', 2006, 37, 8.6),
('Fullmetal Alchemist: Brotherhood', 'Ação, Aventura, Fantasia', 2009, 64, 9.1),
('Demon Slayer', 'Ação, Fantasia', 2019, 26, 8.6),
('Sword Art Online', 'Ação, Fantasia, Aventura', 2012, 49, 7.6),
('Hunter x Hunter', 'Ação, Aventura, Fantasia', 2011, 148, 9.0),
('Tokyo Ghoul', 'Ação, Horror, Fantasia', 2014, 48, 7.9),
('Neon Genesis Evangelion', 'Ação, Mecha, Psicologia', 1995, 26, 8.4),
('One Punch Man', 'Ação, Comédia', 2015, 24, 8.8),
('Your Name', 'Drama, Romance, Fantasia', 2016, 1, 8.9),
('Spirited Away', 'Aventura, Fantasia', 2001, 1, 8.6),
('Cowboy Bebop', 'Ação, Aventura, Ficção Científica', 1998, 26, 8.9),
('Dragon Ball Z', 'Ação, Aventura, Fantasia', 1989, 291, 8.6),
('Steins;Gate', 'Ficção Científica, Drama', 2011, 24, 8.8),
('Code Geass', 'Ação, Mecha, Drama', 2006, 50, 8.7),
('Mob Psycho 100', 'Ação, Comédia, Fantasia', 2016, 25, 8.5),
('Fate/Zero', 'Ação, Fantasia, Drama', 2011, 25, 8.6),
('Re:Zero - Starting Life in Another World', 'Ação, Fantasia, Drama', 2016, 50, 8.4),
('Urusei Yatsura', 'Comédia, Romance, Fantasia', 1981, 195, 8.1);
