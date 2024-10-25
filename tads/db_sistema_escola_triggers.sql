/*
AULA 24/10/2024
Criar uma tabela de avaliação para fazer a avaliação do aluno, 
colocar as 4 avaliações, colocar a coluna media e a coluna resultado.
Fazer isso no banco de dados da Escola.
*/

/*CRIAÇÃO DA TABELA*/
CREATE TABLE avaliacao (
id_avaliacao int primary key,
id_aluno int not null,
foreign key (id_aluno) references aluno(id_aluno),
primeira_nota float,
segunda_nota float,
terceira_nota float,
quarta_nota float,
total float,
media float
);



DELIMITER //
CREATE TRIGGER media_avaliacao
BEFORE INSERT ON avaliacao
FOR EACH ROW
BEGIN
	IF(NEW.media >= 5) THEN
SET NEW.situacao = 'Aprovado';
    ELSE 
SET NEW.situacao = 'Reprovado';
    END IF;
END;
//

DELIMITER //

CREATE TRIGGER media
BEFORE INSERT ON avaliacao 
FOR EACH ROW
BEGIN
    SET NEW.total = NEW.primeira_nota + NEW.segunda_nota + NEW.terceira_nota + NEW.quarta_nota;
    SET NEW.media = (NEW.primeira_nota + NEW.segunda_nota + NEW.terceira_nota + NEW.quarta_nota) / 4;
END;
//

DELIMITER //
CREATE TRIGGER update_avaliacao
BEFORE UPDATE ON avaliacao
FOR EACH ROW
BEGIN
	IF(NEW.primeira_nota<>OLD.primeira_nota 
    OR NEW.segunda_nota <> OLD.segunda_nota 
    OR NEW.terceira_nota <> OLD.terceira_nota 
    OR NEW.quarta_nota <> OLD.quarta_nota) 
    THEN
    SET NEW.total = NEW.primeira_nota + NEW.segunda_nota + NEW.terceira_nota + NEW.quarta_nota;
    SET NEW.media = (NEW.primeira_nota + NEW.segunda_nota + NEW.terceira_nota + NEW.quarta_nota) / 4;
	SET NEW.situacao =	IF (NEW.media >= 5,'Aprovado','Reprovado');
    END IF;
END
//


/*----------------------------------------------------------------------------------------------------*/
/*TRIGGER mais compacta*/

DELIMITER //
CREATE TRIGGER media_situacao 
BEFORE INSERT ON avaliacao 
FOR EACH ROW
BEGIN
	SET NEW.total = NEW.primeira_nota + NEW.segunda_nota + NEW.terceira_nota + NEW.quarta_nota;
    SET NEW.media = (NEW.primeira_nota + NEW.segunda_nota + NEW.terceira_nota + NEW.quarta_nota) / 4;
    SET NEW.situacao = IF(NEW.media >=5,'Aprovado','Reprovado');
END;
//

/*OUTRA FORMA*/
DELIMITER //

CREATE TRIGGER media_avaliacao
BEFORE INSERT ON avaliacao
FOR EACH ROW
BEGIN
    SET NEW.situacao = CASE
        WHEN NEW.media >= 5 THEN 'Aprovado'
        ELSE 'Reprovado'
    END;
END;
//

DELIMITER ;

/*-------------------------------------------------------------------------------------------*/

/*Testando*/
SELECT*FROM avaliacao;
INSERT INTO avaliacao (id_avaliacao, id_aluno, primeira_nota, segunda_nota, terceira_nota, quarta_nota) VALUES
(1, 1, 8.5, 7.0, 9.0, 8.0),
(2, 2, 7.0, 6.5, 8.0, 7.5);

UPDATE avaliacao SET primeira_nota = 9 WHERE id_avaliacao = 1 ;


/*AULA 25/10/2024*/
/*Criar um relatório do aluno mostrando as notas dele, nome, media e se foi aprovado ou reprovado.*/

SELECT nome,primeira_nota,segunda_nota,terceira_nota,quarta_nota,media,avaliacao.situacao 
FROM aluno
INNER JOIN pessoa ON aluno.id_pessoa = pessoa.id_pessoa
INNER JOIN avaliacao on avaliacao.id_aluno = aluno.id_aluno;

