-- Exercício 01 --
START TRANSACTION;

-- Erro de duplicação de ID --
INSERT INTO departments
	(department_id, department_name)
VALUES
	(80, 'Pesquisa');
COMMIT;

-- Departamento e ID criado com sucesso --
INSERT INTO departments
	(department_id, department_name)
VALUES
	(90, 'Pesquisa');
COMMIT;


-- Exercício 02 --
UPDATE employees
SET salary = salary * 1.15
WHERE employee_id = 60;

-- Exercício 03 --
INSERT INTO devs_backup
SELECT *
FROM employees
WHERE job_id LIKE 'IT_PROG';

-- Exercício 04 --
DELETE FROM departments
WHERE department_id = 90;

-- Exercício 05 --
START TRANSACTION;
SAVEPOINT salvaTabela;
UPDATE employees
SET salary = salary * 1.5;
ROLLBACK TO SAVEPOINT salvaTabela;
COMMIT;