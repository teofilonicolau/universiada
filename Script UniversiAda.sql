-- Criando as tabelas
CREATE TABLE alunos (
  mat INTEGER PRIMARY KEY,
  nome CHARACTER VARYING(100),
  endereco CHARACTER VARYING(255),
  cidade CHARACTER VARYING(255)
);

CREATE TABLE professores (
  cod_prof INTEGER PRIMARY KEY,
  nome CHARACTER VARYING(100),
  endereco CHARACTER VARYING(255),
  cidade CHARACTER VARYING(255)
);

CREATE TABLE disciplinas (
  cod_disc CHARACTER VARYING(10) PRIMARY KEY,
  nome_disc CHARACTER VARYING(255),
  carga_horaria INTEGER
);

CREATE TABLE turmas (
  cod_turma INTEGER PRIMARY KEY,
  cod_disc CHARACTER VARYING(10) REFERENCES disciplinas(cod_disc),
  cod_prof INTEGER REFERENCES professores(cod_prof),
  ano INTEGER,
  horario CHARACTER VARYING(50)
);

CREATE TABLE historicos (
  cod_hist INTEGER PRIMARY KEY,
  mat INTEGER REFERENCES alunos(mat),
  cod_disc CHARACTER VARYING(10) REFERENCES disciplinas(cod_disc),
  cod_turma INTEGER REFERENCES turmas(cod_turma),
  cod_prof INTEGER REFERENCES professores(cod_prof),
  ano INTEGER,
  frequencia INTEGER,
  nota INTEGER);
  
--Script DML (para inserçao de dados nas tabelas):

-- Inserçao de dados na tabela alunos
INSERT INTO alunos VALUES
(2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'),
(2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA'),
(2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),
(2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA'),
(2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL'),
(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');

-- Inserçao de dados na tabela disciplinas
INSERT INTO disciplinas VALUES
('BD', 'BANCO DE DADOS', 100),
('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 100),
('WEB', 'AUTORIA WEB', 50),
('ENG', 'ENGENHARIA DE SOFTWARE', 80);

-- Inserçao de dados na tabela professores
INSERT INTO professores VALUES
(212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA'),
(122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL'),
(192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');

-- Inserçao de dados na tabela turmas
INSERT INTO turmas VALUES
(1, 'BD', 212131, 2015, '11H-12H'),
(2, 'BD', 212131, 2015, '13H-14H'),
(1, 'POO', 192011, 2015, '08H-09H'),
(1, 'WEB', 192011, 2015, '07H-08H'),
(1, 'ENG', 122135, 2015, '10H-11H');

__ERROR:  Key (cod_turma)=(1) already exists.duplicate key value violates unique constraint "turmas_pkey" 

-- Inserçao de dados na tabela turmas
INSERT INTO turmas VALUES
(1, 'BD', 212131, 2015, '11H-12H'),
(2, 'BD', 212131, 2015, '13H-14H'),
(3, 'POO', 192011, 2015, '08H-09H'),  -- Mudança no codigo da turma para evitar duplicatas
(4, 'WEB', 192011, 2015, '07H-08H'),  -- Mudança no cpdigo da turma para evitar duplicatas
(5, 'ENG', 122135, 2015, '10H-11H');


-- Inserçao de dados na tabela historicos
-- Notas variando de 0 a 10
INSERT INTO historicos VALUES
(1, 2015010101, 'BD', 1, 212131, 2015, NULL, 8),
(2, 2015010102, 'BD', 1, 212131, 2015, NULL, 7),
(3, 2015010103, 'BD', 1, 212131, 2015, NULL, 5),
(4, 2015010104, 'BD', 1, 212131, 2015, NULL, 9),
(5, 2015010105, 'BD', 1, 212131, 2015, NULL, 6),
(6, 2015010106, 'BD', 1, 212131, 2015, NULL, 8),
(7, 2015010101, 'POO', 1, 192011, 2015, NULL, 9),
(8, 2015010102, 'POO', 1, 192011, 2015, NULL, 8),
(9, 2015010103, 'POO', 1, 192011, 2015, NULL, 7),
(10, 2015010104, 'POO', 1, 192011, 2015, NULL, 6),
(11, 2015010105, 'POO', 1, 192011, 2015, NULL, 8),
(12, 2015010106, 'POO', 1, 192011, 2015, NULL, 9),
(13, 2015010101, 'WEB', 1, 192011, 2015, NULL, 7),
(14, 2015010102, 'ENG', 1, 122135, 2015, NULL, 8),
(15, 2015010103, 'ENG', 1, 122135, 2015, NULL, 9),
(16, 2015010104, 'ENG', 1, 122135, 2015, NULL, 6),
(17, 2015010105, 'ENG', 1, 122135, 2015, NULL, 7),
(18, 2015010106, 'ENG', 1, 122135, 2015, NULL, 8);


--Script DQL


-- a) Encontre a MAT dos alunos com nota em BD em 2015 menor que 5
SELECT DISTINCT h.mat
FROM historicos h
WHERE h.cod_disc = 'BD' AND h.ano = 2015 AND h.nota < 5;

-- b) Encontre a MAT e calcule a media das notas dos alunos na disciplina de POO em 2015.
SELECT h.mat, AVG(h.nota) AS media_notas
FROM historicos h
WHERE h.cod_disc = 'POO' AND h.ano = 2015
GROUP BY h.mat;

-- c) Encontre a MAT e calcule a media das notas dos alunos na disciplina de POO em 2015 e
-- que esta media seja superior a 6.
SELECT h.mat, AVG(h.nota) AS media_notas
FROM historicos h
WHERE h.cod_disc = 'POO' AND h.ano = 2015
GROUP BY h.mat
HAVING AVG(h.nota) > 6;

-- d) Encontre quantos alunos nao sao de Natal.
SELECT COUNT(*) AS total_alunos_nao_natal
FROM alunos
WHERE cidade <> 'NATAL';
  
  
  
  
  
  
  
  
  
  
  

	