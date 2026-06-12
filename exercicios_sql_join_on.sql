-- Exercício 01 --
SELECT 	e.last_name AS Sobrenome,
		j.job_title AS Cargo,
		d.department_name AS Departamento
FROM	employees e
JOIN	departments d
ON		e.department_id = d.department_id
JOIN	jobs j
ON		j.job_id = e.job_id;

-- Exercício 02 --
SELECT 	e.last_name AS Sobrenome,
		d.department_name AS Departamento,
        l.city AS Cidade
FROM	employees e
JOIN	departments d
ON		e.department_id = d.department_id
JOIN 	locations l
ON		d.location_id = l.location_id;

-- Exercício 03 --
SELECT 				e.last_name AS Sobrenome,
					d.department_name 	AS Departamento
FROM				departments d
LEFT OUTER JOIN		employees e
ON					d.department_id = e.department_id;

-- Exercício 04 --
SELECT 	e.last_name AS "Nome do funcionário",
        m.last_name AS Chefe
FROM	employees e
JOIN	employees m
ON		e.employee_id = m.manager_id;

-- Exercício 05 --
SELECT 	e.last_name AS Sobrenome,
		e.salary AS Salário,
        (j.min_salary + j.max_salary) / 2 AS "Nível Salarial"
FROM	employees e
JOIN	jobs j
ON		e.salary
BETWEEN j.min_salary AND j.max_salary;