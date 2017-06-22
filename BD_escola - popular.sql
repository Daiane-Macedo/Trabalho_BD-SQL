/*Populando o BD
Dupla: Bárbara e Daiane */

USE mapa_escola;

INSERT INTO CIDADE (Nome)
VALUES ('Rio de Janeiro'), ('Volta Redonda'), ('Rio das Ostras'), ('Niterói'); 

INSERT INTO PESSOA (CodCidade, Nome, Telefone)
VALUES 
( 1,'Bárbara','3821-9233'),( 1,'Caio Mendes','3234-9283'),
( 2,'João Da Silva','6789-1234'),( 3,'Ana Paula Souza','9873-2345'),
( 3,'Mariana Lima','9976-3345'),( 4,'José Lima','2234-2222'),
( 4,'Ronaldo Gonçalves','922-2311'),

( 1,'Mario Andrade','2345-1234'),
( 1,'Daniele Rodrigues','2321-0098'),( 1,'Yasmim Correia','2266-6676'),
( 1,'Alex Veiga','9973-9999'),( 1,'Tomas Azevedo','6674-9982'),
( 1,'Micaela Bento','8767-2346'),( 1,'Jorge Carvalho','3326-9871'),
( 1,'Rodrigo Suarez','7765-1298'),

( 2,'Maurício Santos','4563-7618'),
( 4,'Carla Schimidt','2234-8976'),( 2,'André Gomes','8756-2389'),
( 2,'Mariana Assunção','7865-3343'),( 2,'Paula Figueira','89987-3456'),
( 2,'Pedro Silveira','2131-4488'),( 2,'Vinicius Macedo','2345-6754'),
( 4,'Juliana Gomes','2345-3381'),

( 3,'Lorena Pereira','8765-1234'),
( 3,'Lara Alves','2253-6678'),( 3,'Maurício Carvalho','2674-3489'),
( 3,'Henrique Soares','9987-5567'),( 3,'Diego Marcondes','9973-1020'),
( 3,'Lara Limeira','8765-1234'),( 3,'Eduardo Castro Oliveira','2213-6512'),
( 3,'Eduarda  Oliveira','2637-3549'), ( 3,'Hugo Di Paula','2213-6512'),
( 3,'Ricardo  Limeira','2637-3549'), ( 3,'Letícia dos Santos','7865-1209'),
( 3,'Thiago Martins','9879-2398'),( 3,'Leila Ribeiro','2342-0000'),


( 2,'Jean Verona','23445-1289'),( 4,'Suzana Cabral','9878-5363'),
( 4,'Bruno Sena','9987-1266'),( 2,'Pennélope Batista','9987-9834'),
( 4,'Felipe Jimez','7833-9826'),( 4,'Jaqueline Barbosa','2234-7684'),
( 2,'Bruna Campos','8767-3478'),( 2,'Luis Brito','6753-8879'),
( 4,'Maycon Carvalho','8797-4554'),( 4,'Luana Mendes','2387-9845'),
( 2,'Joana Marques','9834-4353');


INSERT INTO DISCIPLINA (Nome) 
VALUES
('Estudos Sociais de Pescaria'), ('Fundamentos da Terra'), ('Álgebra Linear'),
('Geopolítica'), ('Lógica Matemática'), ('Yoga'),
('Artes Plásticas'), ('Biologia'), ('Desenvolvimento web'),
('Sociologia');


INSERT INTO PROFESSOR (CodPessoa, RG, CPF, Titulacao)
VALUES
(1,'29.293.483-6','349.028.237-43', 'Licenciado'),(2,'12-345-203-6','645-564-636-05','Mestre'),
(3,'56-234-345-0','783-452-987-11','Mestre'),(4,'56-132-087-1','234-003-234-44','Mestre'),
(5,'54.111.098-2','567.166.232-21','Licenciado'),(6,'54.678.567-5','435.465-234-12','Doutor'),
(7,'79.325.704-3','345.077.952-19','Licenciado');


INSERT INTO ESCOLA (CodCidade, CodPessoa, Nome)
VALUES
(1, 2,'Sistema de Ensino Policarpo'),
(2, 1,'Centro de Estudos Júlio Verne'),
(3, 3,'Colégio Estadual Neymar Júnior'),
(4, 6,'Colégio Universitário Geraldo Reis');

INSERT INTO TURMA (CodEscola, Nome)
VALUES
(1,'Turma 3001'),(1,'Turma 3002'),
(2,'Turma 3003'),(2,'Turma 4005'),
(3,'Turma 401'),(3,'Turma 402'),
(4,'Turma 2001'),(4,'Turma 511'),
(4,'Turma 503');


INSERT INTO ALUNO (CodPessoa,  CodTurma, Matricula, Data_Nascimento)
VALUES
(8,1,678954,'2001-11-06'),(9,1,123456,'2002-02-24'),(10,1,745937,'2001-03-20'),(11,1,234958,'1999-12-11'),
(12,1,4560983,'2001-04-23'),(13,2,234654,'1998-11-14'),(14,2,243645,'2003-04-21'),
(15,2,123217,'2002-09-05'),
(16,3,987345,'1999-06-23'),(17,3,345987,'2001-01-01'),(18,3,456876,'2002-11-17'),(19,3,212094,'2000-12-04'),
(20,4,678456,'1998-02-18'),(21,4,234098,'1999-02-19'),(22,4,216789,'2001-02-28'),
(23,4,501987,'2001-03-30'),
(24,5,764509,'2000-12-03'),(25,5,345996,'2002-05-24'),(26,5,234987,'1999-07-03'),(27,5,346588,'2002-04-23'), 
(28,5,456987,'2001-11-05'),(29,5,111765,'1999-10-16'),(30,5,233457,'2002-04-09'),(31,5,234564,'2002-09-28'),
(32,6,345765,'2001-08-12'),(33,6,100945,'1999-11-27'),(34,6,487562,'2000-05-18'),(35,6,174683,'1999-03-12'),
(36,6,598734,'2002-01-23'),
(37,7,439876,'2000-03-16'), (38,7,876324,'1999-01-18'), (39,7,236052,'2000-03-16'),
(40,7,236984,'2002-03-28'), (41,7,265467,'2001-08-29'), (42,8,908234,'2000-07-02'), (43,8,987234,'1999-11-05'),
(44,8,123834,'2002-07-18'),(45,9,234456,'2000-01-31'),(46,9,672839,'2001-11-16'), (47,9,762190,'2001-05-27');



INSERT INTO CONTATO (Nome, CodPessoa, Telefone)
VALUES

('Maria Lima',8,'2313-4433'),('José Veiga Cruz',11,'8435-8856'),
('Leonardo Suarez',15,'9923-1018'),('Marina Shmidt',17,'9973-2245'),
('Luana Nunes',20,'99876-2345'),('José Carlos Figueira',20,'2345-0000'),
('Paula Mendes',21,'2998-3455'),('Nilton Macedo',22,'7863-2311'),
('Carla Gomes',23,'8874-2387'),('Padro Andrade',23,'2665-3498'),
('Fernando Ribeiro',28,'2345-2300'),('Daniele Souza',32,'9876-1234'),
('Marinna Carvalho',35,'99876-3456');

INSERT INTO MINISTRA_DISCIPLINA(CodPessoa,CodDisciplina)
VALUES
(1,1),(2,2),(2,3),(2,4),(3,4),
(4,6),(5,5),(5,7),(5,9),(6,8),
(7,9),(7,10);

INSERT INTO MINISTRA_TURMA(CodPessoa,CodDisciplina,CodTurma )
VALUES
(1,1,1),(1,1,2),(1,1,3),(2,2,3),(2,3,3),
(3,4,5),(4,6,5), (4,6,7),(5,7,4),(5,5,6),(5,9,1),(6,8,7),
(7,9,2),(7,10,2);

