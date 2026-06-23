-- Parte 1 · Reconhecimento do banco (10 pts) --

-- Q01 --
SHOW DATABASES;

-- Q02 --
SHOW TABLES;

-- Q03 --
DESCRIBE alunos;

-- Q04 --
SELECT COUNT(*) AS total_pagamentos
FROM pagamentos;

-- Q05 --
SELECT *
FROM planos
ORDER BY duracao_meses DESC;

-- Parte 2 · DDL: CREATE, ALTER, DROP (15 pts) --

-- Q06 --
CREATE TABLE equipamentos(
	id			INT 			PRIMARY KEY AUTO_INCREMENT,
    nome		VARCHAR(60)		NOT NULL,
    marca		VARCHAR(40),
    data_compra	DATE,
    em_uso		BOOLEAN			DEFAULT TRUE
) COMMENT = 'Controle de equipamentos novos.';

-- Q07 --
ALTER TABLE alunos ADD COLUMN telefone VARCHAR(15) NULL;

-- Q08 --
DROP TABLE IF EXISTS equipamentos;

--  Parte 3 · DML: INSERT, UPDATE, DELETE e transações (15 pts) --

-- Q09 --
INSERT INTO alunos(id, nome, email, data_matricula, data_nascimento, plano_id, ativo, telefone)
VALUES (DEFAULT, 'Maria', 'maria.r@email.com', CURDATE(), '1995-06-15', 2, TRUE, NULL);

-- Q10 --
UPDATE instrutores
SET salario = salario * 1.08
WHERE salario < 3700;

-- Q11 --
START TRANSACTION;

UPDATE inscricoes
SET status = 'cancelada'
WHERE aluno_id = 4;
SELECT *
FROM inscricoes
WHERE aluno_id = 4;
COMMIT;

--  Parte 4 · SELECT, WHERE e ORDER BY (20 pts) --

-- Q12 --
SELECT nome, email, data_matricula
FROM alunos
WHERE ativo = TRUE
ORDER BY data_matricula DESC;

-- Q13 --
SELECT nome, salario, especialidade
FROM instrutores
WHERE especialidade != 'yoga'
ORDER BY salario ASC;

-- Q14 --
SELECT nome, valor_mensal
FROM planos
WHERE valor_mensal
BETWEEN 100 AND 200;

-- Q15 --
SELECT nome
FROM alunos
WHERE nome LIKE 'A%'
OR nome LIKE '% Souza%';

--  Parte 5 · JOINs (15 pts) --

-- Q16 --
SELECT a.nome, p.nome
FROM alunos a
LEFT JOIN planos p
ON a.id = p.id;

-- Q17 --
SELECT 
    a.nome, i.nome
FROM aulas a
JOIN instrutores i
ON a.instrutor_id = i.id
ORDER BY a.nome;

-- Q18 --
SELECT al.nome, au.nome, inr.nome
FROM inscricoes ins
JOIN alunos al
ON ins.aluno_id = al.id
JOIN aulas au
ON ins.aula_id = au.id
JOIN instrutores inr
ON au.instrutor_id = inr.id
WHERE ins.status = 'ativa'
ORDER BY al.nome;

-- Q18 --
SELECT p.nome, COUNT(a.id) AS quantidade_alunos
FROM planos p
JOIN alunos a
ON a.plano_id = p.id
GROUP BY p.id, p.nome
ORDER BY quantidade_alunos DESC;

-- Q19 --
SELECT especialidade, ROUND(AVG(salario), 2) AS media_salarial
FROM instrutores
GROUP BY especialidade;

-- Q20 --
