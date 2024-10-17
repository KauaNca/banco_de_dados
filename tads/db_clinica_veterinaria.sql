create database clinica_veterinaria;
use clinica_veterinaria;

create table pessoa(
	id_pessoa int primary key auto_increment,
    nome varchar(40) not null,
    idade int(3) null,
    cpf varchar(14) not null,
    rg varchar(9) not null,
    situacao varchar(15)
);

ALTER TABLE pessoa CHANGE rg rg varchar(15);
create table endereco(
	id_endereco int primary key auto_increment,
    situacao varchar(10) not null,
    cep varchar(10) not null,
    cidade varchar(25) not null,
    rua varchar(15) not null,
	bairro varchar(15) null,
    uf char(2),
   id_pessoa int not null,
   foreign key(id_pessoa) references pessoa(id_pessoa)
);

create table tutor(
id_tutor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
 situacao VARCHAR(10) NOT NULL,  
 quantidade_animais INT NOT NULL,  
 id_pessoa INT NOT NULL,  
 FOREIGN KEY(id_pessoa) REFERENCES pessoa(id_pessoa)
);

CREATE TABLE animal 
( 
 id_animal INT PRIMARY KEY AUTO_INCREMENT,  
 nome VARCHAR(40) NOT NULL,  
 idade INT,  
 tipo_animal VARCHAR(15) NOT NULL,  
 situacao VARCHAR(10) NOT NULL,  
 rg_pet VARCHAR(10),  
 id_tutor INT NOT NULL, 
 FOREIGN KEY (id_tutor) REFERENCES tutor(id_tutor),
 UNIQUE (rg_pet)
);

CREATE TABLE veterinario 
( 
 id_veterinario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
 matricula VARCHAR(10) NOT NULL,  
 salario DECIMAL(8,2),  
 crmv VARCHAR(10) NOT NULL,  
 especialidade VARCHAR(20) NOT NULL,  
 id_pessoa INT NOT NULL,  
 UNIQUE (matricula,crmv)
); 
ALTER TABLE veterinario ADD FOREIGN KEY(id_pessoa) REFERENCES pessoa (id_pessoa);


CREATE TABLE consulta 
( 
 id_consulta INT PRIMARY KEY AUTO_INCREMENT,  
 id_animal INT NOT NULL,  
 id_tutor INT NOT NULL,  
 id_veterinario INT NOT NULL,  
 data_hora DATE NOT NULL,  
 status VARCHAR(10) NOT NULL,  
 tipo_consulta VARCHAR(15) NOT NULL,  
 valor_consulta FLOAT NOT NULL,  
 FOREIGN KEY (id_tutor) REFERENCES tutor(id_tutor),
 FOREIGN KEY (id_animal) REFERENCES animal(id_animal),
FOREIGN KEY (id_veterinario) REFERENCES veterinario(id_veterinario)
); 

CREATE TABLE receita_medica 
( 
 id_receita INT PRIMARY KEY AUTO_INCREMENT,  
 id_animal INT NOT NULL,  
 id_veterinario INT NOT NULL,  
 data_prescricao DATE NOT NULL,  
 medicamento VARCHAR(15) NOT NULL,  
 instrucoes text,  
 observacoes text,  
 id_consulta INT NOT NULL,  
 FOREIGN KEY (id_animal) REFERENCES animal(id_animal),
 FOREIGN KEY (id_veterinario) REFERENCES veterinario(id_veterinario),
 FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
);
ALTER TABLE receita_medica CHANGE medicamento medicamento TEXT NULL;

CREATE TABLE historico_medico 
( 
 id_historico INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
 id_animal INT NOT NULL,  
 id_veterinario INT NOT NULL,  
 diagnostico TEXT NOT NULL,  
 data_inicio_tratamento DATE NOT NULL,  
 data_fim_tratamento DATE NULL,  
 exames_realizados VARCHAR(30) NULL,  
 observacoes text NULL,  
 ultima_atualizacao DATE NOT NULL,  
 FOREIGN KEY (id_animal) REFERENCES animal(id_animal),
 FOREIGN KEY (id_veterinario) REFERENCES veterinario(id_veterinario)
);  

-- INSERINDO REGISTROS

-- Inserindo tutores
INSERT INTO pessoa(id_pessoa, nome, idade, cpf, rg, situacao)
VALUES
(1, 'João Silva', 35, '123.456.789-00', '12.345.678-9', 'Tutor'),
(2, 'Maria Oliveira', 29, '987.654.321-00', '98.765.432-1', 'Tutor'),
(3, 'Carlos Pereira', 42, '111.222.333-44', '11.223.344-5', 'Tutor'),
(4, 'Ana Costa', 27, '222.333.444-55', '22.334.455-6', 'Tutor'),
(5, 'Lucas Martins', 31, '333.444.555-66', '33.445.566-7', 'Tutor'),
(6, 'Paula Souza', 40, '444.555.666-77', '44.556.667-8', 'Tutor');

-- Inserindo veterinários
INSERT INTO pessoa(id_pessoa, nome, idade, cpf, rg, situacao)
VALUES
(7, 'Dr. Pedro Lima', 38, '555.666.777-88', '55.667.778-9', 'Veterinário'),
(8, 'Dra. Camila Rocha', 34, '666.777.888-99', '66.778.889-0', 'Veterinário'),
(9, 'Dr. Marcos Silva', 45, '777.888.999-00', '77.889.990-1', 'Veterinário'),
(10, 'Dra. Fernanda Alves', 32, '888.999.000-11', '88.990.001-2', 'Veterinário');


INSERT INTO tutor(id_tutor, situacao, quantidade_animais, id_pessoa)
VALUES
(1, 'Ativo', 2, 1),  -- João Silva
(2, 'Ativo', 3, 2),  -- Maria Oliveira
(3, 'Inativo', 1, 3),  -- Carlos Pereira
(4, 'Ativo', 4, 4),  -- Ana Costa
(5, 'Ativo', 1, 5),  -- Lucas Martins
(6, 'Ativo', 5, 6);  -- Paula Souza


INSERT INTO animal(id_animal, nome, idade, tipo_animal, situacao, rg_pet, id_tutor)
VALUES
(1, 'Rex', 5, 'Cachorro', 'Ativo', 'PET-001', 1),  -- João Silva
(2, 'Mia', 3, 'Gato', 'Ativo', 'PET-002', 1),      -- João Silva
(3, 'Thor', 2, 'Cachorro', 'Ativo', 'PET-003', 2), -- Maria Oliveira
(4, 'Luna', 1, 'Coelho', 'Ativo', 'PET-004', 2),   -- Maria Oliveira
(5, 'Bela', 4, 'Cachorro', 'Ativo', 'PET-005', 2), -- Maria Oliveira
(6, 'Spike', 6, 'Cachorro', 'Inativo', 'PET-006', 3),  -- Carlos Pereira
(7, 'Tom', 2, 'Gato', 'Ativo', 'PET-007', 4),      -- Ana Costa
(8, 'Snow', 1, 'Gato', 'Ativo', 'PET-008', 4),     -- Ana Costa
(9, 'Blue', 3, 'Cachorro', 'Ativo', 'PET-009', 4), -- Ana Costa
(10, 'Buddy', 2, 'Cachorro', 'Ativo', 'PET-010', 4), -- Ana Costa
(11, 'Toby', 4, 'Cachorro', 'Ativo', 'PET-011', 5), -- Lucas Martins
(12, 'Daisy', 5, 'Cachorro', 'Ativo', 'PET-012', 6); -- Paula Souza

INSERT INTO veterinario(id_veterinario, matricula, salario, crmv, especialidade, id_pessoa)
VALUES
(1, 'VET123', 7500.00, 'CRMV123456', 'Clínica Geral', 7),  -- Dr. Pedro Lima
(2, 'VET124', 8000.00, 'CRMV234567', 'Cirurgia', 8),      -- Dra. Camila Rocha
(3, 'VET125', 8200.00, 'CRMV345678', 'Dermatologia', 9),  -- Dr. Marcos Silva
(4, 'VET126', 7700.00, 'CRMV456789', 'Cardiologia', 10);  -- Dra. Fernanda Alves

INSERT INTO consulta(id_consulta, id_animal, id_tutor, id_veterinario, data_hora, status, tipo_consulta, valor_consulta)
VALUES
(1, 1, 1, 1, '2024-09-15 10:30:00', 'Concluída', 'Rotina', 150.00),  -- Rex (João Silva) atendido por Dr. Pedro Lima
(2, 2, 1, 1, '2024-09-20 14:00:00', 'Concluída', 'Vacinação', 120.00),  -- Mia (João Silva) atendida por Dr. Pedro Lima
(3, 3, 2, 2, '2024-10-01 09:30:00', 'Concluída', 'Emergência', 300.00),  -- Thor (Maria Oliveira) atendido por Dra. Camila Rocha
(4, 4, 2, 2, '2024-10-05 11:00:00', 'Concluída', 'Rotina', 150.00),  -- Luna (Maria Oliveira) atendida por Dra. Camila Rocha
(5, 5, 2, 3, '2024-10-12 15:00:00', 'Pendente', 'Dermatologia', 200.00),  -- Bela (Maria Oliveira) atendida por Dr. Marcos Silva
(6, 7, 4, 4, '2024-09-30 16:00:00', 'Concluída', 'Cardiologia', 250.00),  -- Tom (Ana Costa) atendido por Dra. Fernanda Alves
(7, 11, 5, 3, '2024-10-07 08:45:00', 'Concluída', 'Rotina', 150.00);  -- Toby (Lucas Martins) atendido por Dr. Marcos Silva

INSERT INTO receita_medica(id_receita, id_animal, id_veterinario, data_prescricao, medicamento, instrucoes, observacoes, id_consulta)
VALUES
(1, 1, 1, '2024-09-15', 'Antibiótico X', 'Administrar 2 vezes ao dia por 7 dias', 'Reavaliar em 1 semana', 1),  -- Rex, Dr. Pedro Lima
(2, 2, 1, '2024-09-20', 'Vacina V8', 'Aplicar dose única', 'Revisão em 1 ano', 2),  -- Mia, Dr. Pedro Lima
(3, 3, 2, '2024-10-01', 'Anti-inflamatório Y', 'Dar 1 comprimido após refeição por 5 dias', 'Descanso absoluto', 3),  -- Thor, Dra. Camila Rocha
(4, 5, 3, '2024-10-12', 'Pomada Z', 'Aplicar 2 vezes ao dia na pele por 10 dias', 'Evitar exposição solar', 5),  -- Bela, Dr. Marcos Silva
(5, 7, 4, '2024-09-30', 'Cardiotônico W', 'Tomar 1 comprimido de manhã por tempo indeterminado', 'Monitorar sinais de cansaço', 6);  -- Tom, Dra. Fernanda Alves

INSERT INTO historico_medico(id_historico, id_animal, id_veterinario, diagnostico, data_inicio_tratamento, data_fim_tratamento, exames_realizados, observacoes, ultima_atualizacao)
VALUES
(1, 1, 1, 'Infecção bacteriana', '2024-09-15', '2024-09-22', 'Hemograma completo', 'Reavaliar em 1 semana', '2024-09-22'),  -- Rex (Consulta 1)
(2, 2, 1, 'Vacinação para V8', '2024-09-20', NULL, 'Vacina V8', 'Acompanhar reações', '2024-09-20'),  -- Mia (Consulta 2)
(3, 3, 2, 'Fratura na pata', '2024-10-01', NULL, 'Radiografia', 'Necessário repouso absoluto', '2024-10-01'),  -- Thor (Consulta 3)
(4, 4, 2, 'Problemas respiratórios', '2024-10-05', '2024-10-12', 'Exame de sangue, Raio X', 'Acompanhamento em 7 dias', '2024-10-12'),  -- Luna (Consulta 4)
(5, 5, 3, 'Dermatite', '2024-10-12', NULL, 'Exame de pele', 'Reavaliar em 14 dias', '2024-10-12'),  -- Bela (Consulta 5)
(6, 7, 4, 'Cardiopatia', '2024-09-30', NULL, 'Eletrocardiograma', 'Monitorar sinais de cansaço', '2024-09-30'),  -- Tom (Consulta 6)
(7, 11, 3, 'Rinite alérgica', '2024-10-07', '2024-10-14', 'Exame alérgico', 'Acompanhamento necessário', '2024-10-14');  -- Toby (Consulta 7)

INSERT INTO endereco(id_endereco, situacao, cep, cidade, rua, bairro, uf, id_pessoa)
VALUES
(1, 'Ativo', '70000-000', 'Brasília', 'Quadra 1', 'Plano Piloto', 'DF', 1),  -- João Silva
(2, 'Ativo', '70001-001', 'Brasília', 'Quadra 2', 'Asa Sul', 'DF', 2),  -- Maria Oliveira
(3, 'Ativo', '70002-002', 'Brasília', 'Quadra 3', 'Asa Norte', 'DF', 3),  -- Carlos Santos
(4, 'Ativo', '70003-003', 'Brasília', 'Quadra 4', 'Taguatinga', 'DF', 4),  -- Ana Costa
(5, 'Ativo', '70004-004', 'Brasília', 'Quadra 5', 'Ceilândia', 'DF', 5),  -- Lucas Martins
(6, 'Ativo', '70005-005', 'Brasília', 'Quadra 6', 'Águas Claras', 'DF', 6),  -- Dr. Pedro Lima
(7, 'Ativo', '70006-006', 'Brasília', 'Quadra 7', 'Guará', 'DF', 7),  -- Dra. Camila Rocha
(8, 'Ativo', '70007-007', 'Brasília', 'Quadra 8', 'Brazlândia', 'DF', 8),  -- Dr. Marcos Silva
(9, 'Ativo', '70008-008', 'Brasília', 'Quadra 9', 'Sobradinho', 'DF', 9),  -- Dra. Fernanda Alves
(10, 'Ativo', '70009-009', 'Brasília', 'Quadra 10', 'Samambaia', 'DF', 10);  -- Lucas Martins (veterinário)








