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


#testando o GROUP BY
SELECT nota, ano_lancamento, COUNT(nota) AS TOTAL
FROM animes
GROUP BY nota,ano_lancamento;
/*Aqui ele vai selecionar a coluna nota e ano_lancamento e contar quantos notas repetidas tem naquele ano 
específico, todos vão dar 1*/

SELECT nota, COUNT(*) AS total
FROM animes
GROUP BY nota;
/*Aqui ele vai selecionar a nota e contar quantos notas, por exemplo, 8.4 tem na tabela*/

#testando group by e having
SELECT ano_lancamento,count(*)
FROM animes
WHERE ano_lancamento > 2000
GROUP BY ano_lancamento
HAVING ano_lancamento > 2005;
/*Perceba são 3 filtros, um com where, outro com group by e outro com having*/
/*Seleciona a coluna ano e contar todos da tabela animes onde o ano deve ser maior que 2000,
agrupado pelo ano e que o ano desse agrupamento tenha ano maior que 2005
*/
#testando o update
UPDATE animes SET nome = 'Those Obnoxious Aliens', ano_lancamento = 1981 where nome = "Urusei Yatsura";
UPDATE animes SET nota = 8.9 WHERE ano_lancamento > 2000;

SELECT * from animes;

#testando o delete

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

INSERT INTO animes (nome, genero, ano_lancamento, numero_episodios, nota) VALUES
('Bleach', 'Ação, Aventura, Sobrenatural', 2004, 366, 8.1),
('Fairy Tail', 'Ação, Aventura, Fantasia', 2009, 328, 8.0),
('Black Clover', 'Ação, Aventura, Fantasia', 2017, 170, 8.2),
('Haikyuu!!', 'Esportes, Ação, Drama', 2014, 85, 8.9),
('JoJos Bizarre Adventure', 'Ação, Aventura, Sobrenatural', 2012, 152, 8.7),
('Gintama', 'Ação, Comédia, Aventura', 2006, 367, 8.6),
('Sword of the Stranger', 'Ação, Aventura, Histórico', 2007, 1, 8.0),
('Trigun', 'Ação, Aventura, Ficção Científica', 1998, 26, 8.1),
('Parasyte: The Maxim', 'Ação, Horror, Ficção Científica', 2014, 24, 8.4),
('Violet Evergarden', 'Drama, Fantasia, Romance', 2018, 13, 8.6),
('Erased', 'Mistério, Drama, Fantasia', 2016, 12, 8.5),
('Made in Abyss', 'Aventura, Fantasia, Mistério', 2017, 13, 8.4),
('Your Lie in April', 'Drama, Romance, Música', 2014, 22, 8.7),
('Mob Psycho 100 II', 'Ação, Comédia, Fantasia', 2019, 13, 8.6),
('The Promised Neverland', 'Mistério, Horror, Suspense', 2019, 12, 8.5),
('Kaguya-sama: Love Is War', 'Comédia, Romance, Escolar', 2019, 24, 8.6),
('Berserk', 'Ação, Fantasia, Horror', 1997, 25, 8.6),
('JoJos Bizarre Adventure: Golden Wind', 'Ação, Aventura, Sobrenatural', 2018, 39, 8.5),
('No Game No Life', 'Fantasia, Aventura, Estratégia', 2014, 12, 8.2),
('Kill la Kill', 'Ação, Comédia, Drama', 2013, 24, 8.1),
('Psycho-Pass', 'Ficção Científica, Ação, Policial', 2012, 41, 8.4),
('Angel Beats!', 'Ação, Drama, Sobrenatural', 2010, 13, 8.3),
('Toradora!', 'Romance, Comédia, Escolar', 2008, 25, 8.3),
('Clannad: After Story', 'Drama, Romance, Sobrenatural', 2008, 24, 8.7),
('Nana', 'Drama, Romance, Musical', 2006, 47, 8.1),
('Black Lagoon', 'Ação, Crime, Seinen', 2006, 24, 8.0),
('Durarara!!', 'Ação, Misterioso, Sobrenatural', 2010, 24, 8.0),
('Gurren Lagann', 'Ação, Aventura, Mecha', 2007, 27, 8.7),
('Samurai Champloo', 'Ação, Aventura, Samurai', 2004, 26, 8.5),
('Anohana: The Flower We Saw That Day', 'Drama, Sobrenatural, Escolar', 2011, 11, 8.6),
('Danganronpa: The Animation', 'Mistério, Ação, Suspense', 2013, 12, 8.0),
('Nichijou', 'Comédia, Slice of Life', 2011, 26, 8.5),
('Rurouni Kenshin', 'Ação, Histórico, Drama', 1996, 94, 8.3),
('The Seven Deadly Sins', 'Ação, Aventura, Fantasia', 2014, 100, 8.2),
('Magi: The Labyrinth of Magic', 'Ação, Aventura, Fantasia', 2012, 25, 8.1),
('K-On!', 'Comédia, Slice of Life, Música', 2009, 43, 8.0),
('Assassination Classroom', 'Ação, Comédia, Escolar', 2015, 47, 8.3),
('Blue Exorcist', 'Ação, Fantasia, Sobrenatural', 2011, 25, 7.9),
('Devilman Crybaby', 'Ação, Horror, Sobrenatural', 2018, 10, 7.7),
('Land of the Lustrous', 'Fantasia, Ação, Drama', 2017, 12, 8.1),
('The Ancient Magus Bride', 'Fantasia, Romance, Sobrenatural', 2017, 24, 8.2),
('Little Witch Academia', 'Fantasia, Aventura, Comédia', 2017, 25, 8.0),
('Beastars', 'Drama, Mistério, Slice of Life', 2019, 12, 8.0),
('Dororo', 'Ação, Aventura, Sobrenatural', 2019, 24, 8.0),
('Legend of the Galactic Heroes', 'Ficção Científica, Drama, Militar', 1988, 110, 8.7),
('Overlord', 'Ação, Fantasia, Sobrenatural', 2015, 13, 7.9),
('Kurokos Basketball', 'Esportes, Ação, Escolar', 2012, 75, 8.3),
('Devilman: The Birth', 'Ação, Horror, Sobrenatural', 2018, 1, 7.5),
('Re:Creators', 'Ação, Aventura, Fantasia', 2017, 24, 7.9),
('Boku no Hero Academia: Heroes Rising', 'Ação, Aventura, Escolar', 2019, 1, 8.1),
('The Rising of the Shield Hero', 'Ação, Aventura, Fantasia', 2019, 25, 7.9),
('Violet Evergarden: The Movie', 'Drama, Fantasia, Romance', 2020, 1, 8.5),
('Sword Art Online: Alicization', 'Ação, Fantasia, Aventura', 2018, 50, 7.7),
('Kill la Kill: If', 'Ação, Comédia, Drama', 2019, 1, 7.8),
('Steins;Gate 0', 'Ficção Científica, Drama, Romance', 2018, 23, 8.2),
('Goblin Slayer', 'Ação, Fantasia, Aventura', 2018, 12, 7.9),
('Little Witch Academia: The Enchanted Parade', 'Fantasia, Aventura, Comédia', 2018, 1, 7.9),
('Dororo', 'Ação, Aventura, Sobrenatural', 2019, 24, 8.0),
('The God of High School', 'Ação, Artes Marciais, Supernatural', 2020, 8, 7.5),
('Dr. Stone', 'Aventura, Ficção Científica, Drama', 2019, 24, 8.2),
('To Your Eternity', 'Fantasia, Drama, Aventura', 2021, 20, 8.1),
('Spy x Family', 'Ação, Comédia, Família', 2022, 25, 8.5),
('Chainsaw Man', 'Ação, Horror, Sobrenatural', 2022, 12, 8.3),
('Vinland Saga', 'Ação, Aventura, Histórico', 2019, 24, 8.8),
('Jujutsu Kaisen 0', 'Ação, Fantasia, Sobrenatural', 2021, 1, 8.3),
('Record of Ragnarok', 'Ação, Fantasia, Mitologia', 2021, 12, 7.8),
('Demon Slayer: Mugen Train', 'Ação, Fantasia, Aventura', 2020, 1, 8.2),
('Ranking of Kings', 'Fantasia, Aventura, Drama', 2021, 25, 8.3),
('86', 'Ação, Ficção Científica, Drama', 2021, 12, 7.9),
('Fruits Basket', 'Drama, Romance, Sobrenatural', 2019, 63, 8.1),
('The Rising of the Shield Hero Season 2', 'Ação, Aventura, Fantasia', 2022, 13, 7.8),
('Mob Psycho 100 III', 'Ação, Comédia, Fantasia', 2023, 12, 8.4);

SELECT nota FROM animes WHERE nota = 8.4;
CREATE INDEX nota ON animes(nota);

