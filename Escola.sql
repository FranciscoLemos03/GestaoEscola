create database dbescola
default character set utf8
default collate utf8_general_ci; -- adiciona caracteres especiais e acentuação

CREATE TABLE `aluno` (
	`id_aluno` int(11) NOT NULL AUTO_INCREMENT,
	`id_curso` int(11) NOT NULL,
	`id_pagamento` int(11) DEFAULT NULL,
	`nome` varchar(30) NOT NULL,
	`sexo` enum('M','F') NOT NULL,
	`data_nascimento` date NOT NULL,
	`nacionalidade` varchar(20) DEFAULT 'Portugal',
	`media` decimal(4,2) NOT NULL DEFAULT 0.00,
	PRIMARY KEY (`id_aluno`),
	KEY `id_curso` (`id_curso`),
	KEY `id_pagamento` (`id_pagamento`),
	CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
	CONSTRAINT `aluno_ibfk_2` FOREIGN KEY (`id_pagamento`) REFERENCES `tipo_pagamento` (`id_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8

CREATE TABLE `aluno_disciplina` (
	`id_aluno` int(11) NOT NULL,
	`id_disciplina` int(11) NOT NULL,
	`nota` decimal(4,2) NOT NULL,
	PRIMARY KEY (`id_aluno`,`id_disciplina`),
	KEY `id_disciplina` (`id_disciplina`),
	CONSTRAINT `aluno_disciplina_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`),
	CONSTRAINT `aluno_disciplina_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE `curso` (
	`id_curso` int(11) NOT NULL AUTO_INCREMENT,
	`nome_curso` varchar(30) NOT NULL,
	`data_inicio` date NOT NULL,
	`data_fim` date NOT NULL,
	`descricao_curso` text NOT NULL,
	PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8

CREATE TABLE `disciplina` (
	`id_disciplina` int(11) NOT NULL AUTO_INCREMENT,
	`id_curso` int(11) DEFAULT NULL,
	`id_professor` int(11) NOT NULL,
	`nome_disciplina` varchar(50) NOT NULL,
	PRIMARY KEY (`id_disciplina`),
	KEY `id_professor` (`id_professor`),
	KEY `id_curso` (`id_curso`),
	CONSTRAINT `disciplina_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id_professor`),
	CONSTRAINT `disciplina_ibfk_3` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8

CREATE TABLE `professor` (
	`id_professor` int(11) NOT NULL AUTO_INCREMENT,
	`nome_prof` varchar(50) NOT NULL,
	`idade_prof` int(11) NOT NULL,
	`area` varchar(50) NOT NULL,
	`data_nascimento` date NOT NULL,
	PRIMARY KEY (`id_professor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8

CREATE TABLE `tipo_pagamento` (
	`id_pagamento` int(11) NOT NULL AUTO_INCREMENT,
	`tipo_pagamento` varchar(50) NOT NULL,
	PRIMARY KEY (`id_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8

insert into aluno values
('1','2','8','Francisco Lemos','M','2003-04-15','Portugal','9.5','100'),
('2','9','18','Rui Carvalho','M','2003-03-25','Portugal','7.5','110'),
('3','11','9','Pedrao Almeida','M','2003-05-30','Portugal','16.5','120'),
('4','10','2','Joel Mendes','M','2003-04-29','Portugal','13.5','130'),
('5','10','3','Julio Martins','M','2003-01-16','Portugal','20','140'),
('6','2','4','Jonas J','M','2003-01-15','Portugal','19','110'),
('7','4','5','Michael Jackson','M','2003-07-20','America','12.5','100'),
('8','6','6','Louis Oui','M','2003-9-21','França','14.5','120'),
('9','4','7','Nuno Chokers','M','2003-10-22','Alemanha','1.5','140'),
('10','3','8','Tania Mendes','F','2003-11-25','Portugal','6.5','200'),
('11','9','1','Maria Joao','F','2003-12-11','Portugal','7.5','110'),
('12','16','10','Marie Mendes','F','2003-11-16','Reino Unido','16.5','120'),
('13','15','4','Monica Sonia','F','2003-10-19','brazil','16.5','140'),
('14','11','7','Julia Mendes','F','2003-01-12','Angola','2.5','160'),
('15','14','5','Kenny J','M','2003-09-04','Portugal','12.5','190'),
('16','13','6','Nanda Jackson','M','2003-06-05','America','11.5','200'),
('17','15','15','Filipa Certo','F','2003-02-09','Brazil','10.5','160'),
('18','16','20','Leandro Silva','F','2003-04-01','Portugal','15.5','140'),
('19','17','19','Roner Zara','M','2003-06-02','Romenia','12.5','130'),
('20','20','7','Joana Martins','F','2003-09-25','Portugal','11.5','120');

insert into aluno_disciplina values
('1','4','14'),
('2','3','12'),
('1','5','14'),
('2','7','15');

insert into curso values
('1','1','tecnologia e inovação informatica','2018-01-18','2020-01-18','Curso com duração de 2 anos onde vai puder aprender tudo sobre informatica'),
('2','7','Engenharia informatica','2018-01-18','2020-01-18','Curso com duração de 2 anos onde vai puder aprender tudo sobre informatica');

insert into disciplina values
('1','7','tecnologia e inovação informatica','2018-01-18','2020-01-18','Curso com duração de 2 anos onde vai puder aprender tudo sobre informatica'),
('2','5','Engenharia informatica','2018-01-18','2020-01-18','Curso com duração de 2 anos onde vai puder aprender tudo sobre informatica');

insert into aluno_disciplina values
('1','4','19'),
('2','7','12'),
('3','3','11');

insert into disciplina values
('1','2','2','ingles tecnico'),
('2','12','8','Programação');

insert into professor values
('1','Jonas Silva','27','Informatica'),
('2','Maria Mendes','33','Estudos do meio');

insert into tipo_pagamento values
('1','mbway'),
('2','visa');


-- Esta view mostra todos os alunos nas suas respetivas disciplinas

CREATE VIEW Aluno_por_disciplina AS
select al.id_aluno, al.nome, di.nome_disciplina from aluno al
join aluno_disciplina ad
on al.id_aluno = ad.id_aluno
join disciplina di
on ad.id_disciplina = di.id_disciplina
order by al.id_aluno;

-- Esta view vai listar todos os alunos com as seus respetivos cursos, disciplinas, e professores

CREATE VIEW aluno_curso_disciplina_prof AS
select al.id_aluno as 'id aluno', al.nome as 'nome do aluno', cu.nome_curso as 'nome do curso', di.nome_disciplina as 'nome da disciplina' ,pr.nome_prof as 'nome do professor' from aluno al
join Curso cu
on al.id_curso = cu.id_curso
join disciplina di
on cu.id_curso = di.id_curso
join professor pr
on di.id_professor = pr.id_professor
order by al.id_aluno;

-- Estas views vão listar todos os alunos que reprovaram e passaram

CREATE VIEW Reprovados AS
SELECT aluno.nome AS 'Nome do aluno', aluno.media AS 'Media do aluno'
FROM aluno
WHERE aluno.media < 10;

CREATE VIEW Aprovados AS
SELECT aluno.nome AS 'Nome do aluno', aluno.media AS 'Media do aluno'
FROM aluno
WHERE aluno.media > 10;

-- Esta view vai listar todas as disciplinas e o seu número de alunos

CREATE VIEW Aprovados AS
select di.nome_disciplina, count(*) as 'Numero de aluno' from aluno al
join aluno_disciplina ad
on al.id_aluno = ad.id_aluno
join disciplina di
on ad.id_disciplina = di.id_disciplina
group by di.nome_disciplina;

-- Esta view vai listar o aluno com a melhor nota

CREATE VIEW aluno_merito AS
SELECT id_aluno, nome, media
FROM aluno
WHERE media = (SELECT MAX(media) FROM aluno);

-- Este SP vai calcular a idade de um aluno pelo seu id

DELIMITER $$
CREATE PROCEDURE calcula_idade(id int)
BEGIN
declare data_nasc date;
select data_nascimento into data_nasc from aluno where id_aluno = id;
select TIMESTAMPDIFF(YEAR, data_nasc, CURDATE()) as idade;
END
$$
DELIMITER ;


-- Este SP vai calcular o tempo do curso pelo seu id

DELIMITER $$
CREATE PROCEDURE calcula_tempo_curso(id int)
BEGIN
declare data_in date;
declare data_fi date;
select data_inicio into data_in from curso where id_curso = id;
select data_fim into data_fi from curso where id_curso = id;
select TIMESTAMPDIFF(YEAR, data_in, data_fi) as 'tempo do curso';
END
$$
DELIMITER ;

-- Este Trigger vai inserir automaticamente a media do aluno na tabela aluno apos ser inserido notas na tabela aluno_disciplina

DELIMITER $$
CREATE TRIGGER media_das_notas AFTER INSERT ON aluno_disciplina
FOR EACH ROW
BEGIN
DECLARE media_notas float;
select avg(aluno_disciplina.nota) into media_notas from aluno_disciplina
where aluno_disciplina.id_aluno = new.id_aluno;
UPDATE aluno
SET aluno.media = media_notas
WHERE aluno.id_aluno = new.id_aluno;
END$$
DELIMITER ;

