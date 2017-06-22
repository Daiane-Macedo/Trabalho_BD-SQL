/*Consultas e alterações
Dupla: Bárbara e Daiane */

USE mapa_escola;

/*-------- CONSULTAS ------*/

/* 1) Listar o nome e a cidade das escolas onde todos os alunos residam na mesma cidade
 onde a escola está localizada. */

SELECT escola.nome as 'Escola', cidade.nome as 'Cidade'
FROM cidade, escola
WHERE NOT EXISTS(
				SELECT *
				FROM aluno, turma, pessoa
				WHERE aluno.codTurma = turma.codTurma AND
					  aluno.codPessoa = pessoa.CodPessoa
					  AND turma.codEscola = escola.codEscola AND
					  escola.codCidade != pessoa.codCidade 
				)AND escola.codCidade = cidade.codCidade;
                

/* 2) Listar o nome e matrícula dos alunos sem nenhum contato cadastrado.*/

SELECT nome, matricula
FROM pessoa, aluno
WHERE matricula NOT IN (
   SELECT matricula
   FROM aluno, contato
   WHERE aluno.CodPessoa = contato.CodPessoa
) AND aluno.CodPessoa = pessoa.CodPessoa;

/* 3) Listar o código e nome das turmas com mais de 5 alunos.*/

SELECT turma.CodTurma, turma.nome
FROM aluno, turma
WHERE aluno.CodTurma = turma.codTurma
GROUP BY turma.nome
HAVING COUNT(aluno.matricula) > 5;

/* 4) Listar o código, nome e titulação dos professores que ministram aulas para
pelo menos três turmas diferentes.*/

SELECT professor.CodPessoa, nome, titulacao
FROM ministra_turma, professor, pessoa
WHERE professor.CodPessoa = pessoa.CodPessoa AND
	  professor.CodPessoa = ministra_turma.CodPessoa
GROUP BY professor.CodPessoa
HAVING COUNT(DISTINCT ministra_turma.CodTurma) >= 3;

/* 5)Listar por disciplina o número de professores que podem ministrá-la e quantos
efetivamente ministram a mesma para uma turma.*/

SELECT disciplina.nome disciplina, COUNT(distinct professor.CodPessoa) 'Pode Ministrar',
COUNT(distinct ministra_turma.codPessoa) 'Está ministrando'
FROM disciplina
LEFT JOIN ministra_disciplina  ON disciplina.CodDisciplina = ministra_disciplina.CodDisciplina
LEFT JOIN professor ON ministra_disciplina.CodPessoa = professor.CodPessoa
LEFT JOIN ministra_turma ON disciplina.CodDisciplina = ministra_turma.CodDisciplina
GROUP BY disciplina.nome;

/*6)Listar o nome da escola e o nome dos diretores de escola que residem em cidades
diferentes da cidade da escola.*/

SELECT E.NOME, P.NOME
FROM ESCOLA AS E, PESSOA AS P, PROFESSOR AS PR

WHERE E.CodPessoa = PR.CodPessoa AND
	  P.CodPessoa = PR.CodPessoa AND	
	  E.CodCidade <> P.CodCidade;
      
/*7)Listar por escola o número de turmas e o número de professores que ministram
 alguma disciplina para turmas da escola em questão.*/
 
SELECT E.Nome, COUNT(T.CodTurma) 'Número de Turmas', temp.ProfessoresMinistram
FROM Turma as T JOIN Escola as E on T.CodEscola = E.CodEscola JOIN (
        SELECT E.CodEscola IdEscola, COUNT(DISTINCT P.CodPessoa) ProfessoresMinistram
        FROM Professor as P
        JOIN ministra_turma as MT
        	ON P.CodPessoa = MT.CodPessoa
        JOIN Turma as T
        	ON T.CodTurma = MT.CodTurma
        JOIN escola as e
        	ON E.CodEscola = T.CodEscola
        GROUP BY IdEscola) temp
    ON IdEscola = E.CodEscola
    GROUP BY E.Nome;

/*8) Listar por escola a razão entre o número de alunos da escola e o número de professores
que ministram alguma disciplina na escola em questão.*/

SELECT E.NOME, ( temp.QtdAlunos / COUNT(DISTINCT PR.CODPESSOA) ) RazaoProfAluno
FROM PROFESSOR AS PR JOIN MINISTRA_TURMA AS MT
	ON PR.CODPESSOA = MT.CODPESSOA
JOIN TURMA AS T
	ON T.CODTURMA = MT.CODTURMA
JOIN ESCOLA AS E
	ON E.CODESCOLA = T.CODESCOLA
JOIN (SELECT ESC.CODESCOLA, COUNT(DISTINCT A.CODPESSOA) QtdAlunos
		FROM ALUNO AS A JOIN TURMA AS T
      		ON T.CODTURMA = A.CODTURMA
		JOIN ESCOLA AS ESC
      		ON ESC.CODESCOLA = T.CODESCOLA
		GROUP BY ESC.CODESCOLA) temp
    ON temp.CODESCOLA = E.CODESCOLA
GROUP BY E.CODESCOLA;

/*9)Listar todos os contatos dos alunos informando a matrícula e nome do aluno, nome e
telefone do contato, ordenado por matrícula do aluno e nome do contato.*/

SELECT A.Matricula, P.Nome, C.Nome, C.Telefone
FROM CONTATO AS C, ALUNO AS A, PESSOA AS P
WHERE A.CodPessoa = P.CodPessoa AND
	  A.CodPessoa = C.CodPessoa
ORDER BY A.Matricula, C.Nome;

/*10) Listar todos os professores que ministram disciplinas para apenas uma turma.*/

SELECT 
    P.NOME, P.CodPessoa
FROM
    PESSOA AS P,
    PROFESSOR AS PR,
    MINISTRA_TURMA AS MT
WHERE
    PR.CODPESSOA = MT.CODPESSOA
        AND P.CODPESSOA = PR.CODPESSOA
GROUP BY P.NOME
HAVING COUNT(DISTINCT MT.CODTURMA) = 1;


 /* ---------------------UPDATES-------------------------*/
 
/* 1) Alterar todos os contatos vinculados a um aluno A para um aluno B.*/
UPDATE contato 
SET contato.CodPessoa = 18
WHERE contato.CodPessoa = 20;

/*2) Forneça um conjunto de instruções SQL para remover da base de dados um professor qualquer.
Caso o professor seja diretor de uma escola um novo diretor deverá ser definido.*/

-- Definir novo diretor
UPDATE escola
SET codPessoa = 1 -- id novo diretor
WHERE CodPessoa = 4; -- id antigo diretor

-- Remover o professor
DELETE FROM professor 
WHERE
    professor.CodPessoa = 4;
    
    
/*3) Considerando que um Professor P1 precisou sair de licença médica, substituí-lo por
outro Professor P2 em todas as turmas onde P1 ministra disciplinas.*/

-- Inserir disciplinas que professor substituto não lecionava
INSERT IGNORE INTO MINISTRA_DISCIPLINA(CodDisciplina, CodPessoa)
SELECT CodDisciplina, 6 -- professor substituto
FROM MINISTRA_DISCIPLINA
WHERE CodPessoa = 2; -- professor afastado

-- Setar disciplinas do professor afastado para o professor novo
UPDATE MINISTRA_TURMA
SET CodPessoa = 6
WHERE CodPessoa = 2;
SELECT* FROM ministra_turma;
