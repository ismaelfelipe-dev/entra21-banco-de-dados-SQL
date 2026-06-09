-- exercise 01 --
SELECT * FROM hr.employees;

-- exercise02 --
SELECT department_name, location_id FROM hr.departments;

-- exercise03 --
SELECT job_id, job_title, max_salary FROM hr.jobs;

-- exercise04 --
SELECT job_title, max_salary, job_id FROM hr.jobs;

-- exercise05 --
SELECT first_name, last_name, email, phone_number FROM hr.employees;

-- exercise06 --
SELECT last_name, salary, salary + 500 FROM hr.employees;

-- exercise07 --
SELECT last_name, salary, salary * 12 FROM hr.employees;

-- exercise08 --
SELECT salary, salary * 12 + 1000 FROM hr.employees;

SELECT salary, salary * (12 + 1000) FROM hr.employees;

-- Calculo na segunda versão está sendo feito de forma errada, é feito primeiro a soma dentro dos parenteces e depois motiplicado pelo salario. --
-- O correto deve ser feito como na primeira versão, multiplicando o salario por 12 e somando o bônus. --

-- exercise09 --
SELECT last_name, job_id, salary, commission_pct, salary * 12 * commission_pct FROM hr.employees;

-- Nem todos os funcionarios são vendedores, então somente os vendedores iram ganhar comissão de acordo com sua porcentagem --
-- Sistema volta null por que qualquer operação com o valor null sempre retornara null --

-- exercise10 --
SELECT last_name AS "Sobrenome", salary AS "Salário Mensal", salary * 12 AS "Salário Anual" FROM hr.employees;


-- exercise11 --
SELECT
    CONCAT(first_name, ' ', last_name, ' (E-mail: ', email, ')') 
AS "Identificação"
FROM hr.employees;

-- exercise12 --
SELECT CONCAT(
					last_name,
					' trabalha no cargo ', job_id,
                    ' e ganha R$ ', salary, ' por mês.')
                    AS "Apresentação Do Funcionário"
FROM hr.employees;

-- exercise13 --
SELECT CONCAT(job_title, ': de R$ ', min_salary, ' até R$ ', max_salary) AS "Faixa Salarial" FROM hr.jobs;

-- exercise14 --
SELECT DISTINCT department_id FROM hr.employees;

-- exercise15 --
SELECT DISTINCT job_id FROM hr.employees;

-- exercise16 --
SELECT DISTINCT job_id, department_id FROM hr.employees;

-- exercise17 --
SELECT CONCAT
			(last_name, ' ', first_name) AS Funcionario,
            job_id AS Cargo,
            salary AS "Salário Mensal",
            salary * 12 AS "Salário Anual",
            salary * 12 * commission_pct AS "Comissão Anual",
            (salary * 12) + (salary * 12 * commission_pct) AS "Remuneração Anual Total"
FROM hr.employees;