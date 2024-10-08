select nome, id_turma, turno, c.id_curso,descricao,carga_horaria
from turma 
inner join curso c on turma.id_curso=c.id_curso
inner join aluno on turma.id_aluno = aluno.id_aluno
inner join pessoa on aluno.id_pessoa = pessoa.id_pessoa;
