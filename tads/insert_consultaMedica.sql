INSERT INTO pessoa (nome, idade, cpf, situacao, telefone, email, genero, rg) VALUES
('Ana Silva', 30, '12345678900', 'Ativo', '99999-0000', 'ana.silva@email.com', 'F', '12345678'),
('Carlos Souza', 45, '98765432100', 'Ativo', '98888-0000', 'carlos.souza@email.com', 'M', '23456789'),
('Mariana Costa', 28, '45612378900', 'Ativo', '97777-0000', 'mariana.costa@email.com', 'F', '34567890'),
('João Pereira', 50, '32165498700', 'Ativo', '96666-0000', 'joao.pereira@email.com', 'M', '45678901'),
('Dr. Roberto Lima', 40, '11122233344', 'Ativo', '95555-0000', 'roberto.lima@email.com', 'M', '55678912'),
('Dra. Fernanda Alves', 35, '44455566677', 'Ativo', '94444-0000', 'fernanda.alves@email.com', 'F', '66789023');

INSERT INTO paciente (situacao, numero_sus, tipo_plano, observacoes, id_pessoa) VALUES
('Ativo', '12345678', 'P', 'Nenhuma observação', 7),  -- Ana Silva - P = PARTICULAR
('Ativo', '98765432', 'C', 'Acompanhamento psicológico', 8),  -- Carlos Souza C - CONVÊNIO
('Ativo', '45678912', 'P', 'Consulta de rotina', 9),  -- Mariana Costa
('Inativo', '3210987', 'C', 'Intervenção cirúrgica realizada', 10);  -- João Pereira

INSERT INTO medico (especialidade, situacao, matricula, salario, crm, id_pessoa) VALUES
('Clínico Geral', 'Ativo', 'M123456', 15000.00, '12345', 11),  -- Dr. Roberto Lima
('Pediatra', 'Ativo', 'M654321', 16000.00, '67890', 12);  -- Dra. Fernanda Alves

INSERT INTO consulta (tipo,tipo_consulta,status,id_paciente,id_medico,id_pessoa) values 
('presencial','Clínica Médica','A',9,1,7),('online','Pediatra','F',10,2,8);
