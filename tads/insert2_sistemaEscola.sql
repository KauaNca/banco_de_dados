select *from pessoa;
insert into pessoa (nome,cpf,idade,situacao) values 
('Kauã','000000000',17,'A'),
('Gabriel','000005000',25,'I'),
('Lucas','000008880',30,'A'),
('Ana','0000007895',25,'A'),
('Cristina','000110000',31,'I'),
('Rodrigo','000000011',19,'A');

select*from aluno;
insert into aluno(id_pessoa,matricula,situacao) values
(1,'5555mmm','A'),(3,'5555AAA','I'),(6,'5555BBB','A');

select * from professor;
insert into professor(matricula, id_pessoa,situacao)values
('AAAAAGH5',2,'I'),('AAACCGH5',4,'A'),('AABBGH5',5,'A');

select * from endereco;
insert into endereco(cidade,rua,bairro,cep,uf,situacao,id_pessoa) values 
('Samambaia','123','SãoPaulo','0100001','SP','A',1),
('Avenida','453','Copacabana','0100002','RJ','A',2),
('Liberdade','623','Kaiju','0100500','MG','A',3),
('Palmeiras','723','Curitiba','0100050','SP','A',4),
('Paulista','823','São Paulo','0101100','SP','A',5),
('Paulista','5523','São Paulo','0108900','SC','A',6);

select * from curso;
insert into curso(descricao,carga_horaria,data_inicio,data_fim,id_aluno)values
('ADS',2000,'2024-2-25','2026-1-31',1),
('Administracao',1200,'2024-2-25','2024-12-20',2),
('TI',1200,'2024-2-25','2025-12-20',3);

insert into turma(numero_sala,capacidade,id_aluno,id_professor,id_curso,situacao)
values(15,30,1,2,1,'A'),
(20,35,2,1,2,'A'),
(14,20,3,3,3,'A');

use sistemaEscola;
select a.id_aluno, p.id_pessoa,nome from aluno a,pessoa p where p.id_pessoa <4;


