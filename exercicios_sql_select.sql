-- exercise 01 --
SELECT *
FROM employees;

-- exercise02 --
SELECT department_name, location_id 
FROM departments;

-- exercise03 --
SELECT job_id, job_title, max_salary 
FROM jobs;

-- exercise04 --
SELECT job_title, max_salary, job_id 
FROM jobs;

-- exercise05 --
SELECT first_name, last_name, email, phone_number
FROM employees;

-- exercise06 --
SELECT last_name, salary, salary + 500
FROM employees;

-- exercise07 --
SELECT last_name, salary, salary * 12
FROM employees;

-- exercise08 --
SELECT salary, salary * 12 + 1000
FROM employees;

SELECT salary, salary * (12 + 1000)
FROM employees;

-- Calculo na segunda versão está sendo feito de forma errada, é feito primeiro a soma dentro dos parenteces e depois motiplicado pelo salario. --
-- O correto deve ser feito como na primeira versão, multiplicando o salario por 12 e somando o bônus. --

-- exercise09 --
SELECT last_name, job_id, salary, commission_pct, salary * 12 * commission_pct
FROM employees;

-- Nem todos os funcionarios são vendedores, então somente os vendedores iram ganhar comissão de acordo com sua porcentagem --
-- Sistema volta null por que qualquer operação com o valor null sempre retornara null --

-- exercise10 --
SELECT
		last_name 		AS Sobrenome,
		salary 			AS "Salário Mensal",
		salary * 12 	AS "Salário Anual"
FROM 	employees;


-- exercise11 --
SELECT
    CONCAT(first_name, ' ', last_name, ' (E-mail: ', email, ')') 
AS Identificação
FROM employees;

-- exercise12 --
SELECT CONCAT(
					last_name,
					' trabalha no cargo: ', job_id,
                    ' e ganha R$ ', salary, ' por mês.')
                    AS "Apresentação do funcionário"
FROM employees;

-- exercise13 --
SELECT CONCAT(
					job_title, ': de R$ ',
                    min_salary, ' até R$ ',
                    max_salary
					) AS "Faixa salarial"
FROM jobs;

-- exercise14 --
SELECT DISTINCT department_id
FROM employees;

-- exercise15 --
SELECT DISTINCT job_id
FROM employees;

-- exercise16 --
SELECT DISTINCT department_id, job_id
FROM employees;

-- exercise17 --
SELECT CONCAT
			(last_name, ', ', first_name) 								AS Funcionario,
            job_id 														AS Cargo,
            salary 														AS "Salário Mensal",
            salary * 12 												AS "Salário Anual",
            IFNULL(salary * 12 * commission_pct, 0) 					AS "Comissão Anual",
            IFNULL((salary * 12) + (salary * 12 * commission_pct), 0) 	AS "Remuneração Anual Total"
FROM employees;