#Categorias
SELECT products.id
      ,products.name
FROM products right join categories
ON (products.id_categories = categories.id)
WHERE categories.name like '%super%';

#Cidades em Ordem Alfabética sem repetição
SELECT DISTINCT city
FROM providers

#Maior e Menor Preço
SELECT max(price), min(price) 
FROM products;

#Produtos por Categorias
SELECT categories."name" 
      ,sum(products.amount)
FROM categories inner join products
ON products.id_categories = categories.id
group by categories."name"

#Valor Médio dos Produtos
SELECT ROUND(AVG(price),2)
FROM products

SELECT movies.id
      ,movies.name
      ,prices.value
FROM movies inner join prices
on movies.id_prices = prices.id
WHERE prices.value < 2

SELECT customers.name
      ,rentals.rentals_date
FROM customers inner join rentals
ON customers.id = rentals.id_customers
where rentals.rentals_date BETWEEN '2016-09-01' AND '2016-09-30'

SELECT customers.id, customers.name
FROM customers 
WHERE customers.id NOT IN(
    SELECT locations.id_customers
    FROM locations
    WHERE locations.id_customers = customers.id
);

SELECT products.name
      ,providers.name
      ,categories.name
FROM products 
inner join providers ON products.id_providers = providers.id 
inner join categories ON products.id_categories = categories.id
WHERE providers.name = 'Sansul SA' AND categories.name = 'Imported'

SELECT products.name
FROM products INNER JOIN providers
ON providers.id = products.id_providers  
WHERE providers.name like 'P%' AND products.amount BETWEEN '10' AND '20' 

--nome dos clientes que sejam pessoa jurídica.
SELECT customers.name
FROM customers 
WHERE customers.id IN(
    SELECT legal_person.id_customers
    FROM legal_person 
    WHERE legal_person.id_customers = customers.id
);

-- count por registros distintos
SELECT sn_prematuro
	  ,COUNT(*)
FROM admissao_co
group by sn_prematuro
order by 2 desc

--produtos cuja quantidade seja maior que 100 e o código da categoria seja 1,2,3,6 ou 9
SELECT products.name
      ,categories.name
FROM products INNER JOIN categories
ON categories.id = products.id_categories 
WHERE products.amount > 100 AND categories.id IN (1, 2, 3, 6, 9)

--Quantidades de Cidades por Clientes
select COUNT(distinct(city))
from customers 

--Máscara de CPF
SELECT SUBSTRING(cpf, 1, 3) || '.' ||
       SUBSTRING(cpf, 4, 3) || '.' ||
       SUBSTRING(cpf, 7, 3) || '-' ||
       SUBSTRING(cpf, 10, 2)
FROM natural_person;

-- nome do advogado que tem menos e mais clientes e a média de clientes dos advogados.
(SELECT name, customers_number
FROM lawyers
ORDER BY customers_number DESC
LIMIT 1)

UNION ALL

(SELECT name, customers_number
FROM lawyers
ORDER BY customers_number ASC
LIMIT 1)

UNION ALL

(SELECT 'Average', round(AVG(customers_number), 0)
FROM lawyers)

-- nome e pontuação final(com duas casas) ordenado + to -
SELECT candidate.name,
    round((score.math*2 + score.specific*3 + score.project_plan*5) / 10.0, 2)
    AS avg FROM candidate, score
    WHERE candidate.id = score.candidate_id ORDER BY avg DESC;

-- selecionar os nomes e o dia do mês que cada cliente deve pagar sua parcela.	
SELECT name
	  ,CAST(extract(day from payday) as INTEGER) as day 
FROM loan;

-- substituir todo caractere 'H1' ( Hemaglutinina ) por 'X' ( Xenomorphina ).
select replace(name, 'H1', 'X') 
from virus

-- selecionar o id, a senha atual e a senha transformada em MD5.
select id
      ,password
	  ,md5(password) as "MD5"
from account 

-- Quanto ganha um médico?
SELECT
	doctors.name,
	ROUND(SUM((attendances.hours * 150)+((attendances.hours * 15)*work_shifts.bonus)*.1), 1) AS salary
FROM doctors, attendances, work_shifts
WHERE
	doctors.id=attendances.id_doctor
    AND work_shifts.id=attendances.id_work_shift
GROUP BY doctors.name
ORDER BY salary DESC;


-- Qual é o valor atributo mais frequente, ou seja, a moda estatística desses valores?
SELECT amount AS most_frequent_value 
from value_table
GROUP BY amount 
ORDER BY COUNT(*) DESC LIMIT 1;

-- Retirar aspas das palavras
select replace(_regiao, "'","") as Região
	   ,count(*) as qtd
from Covid.dados_covid_nacional
group by 1;

-- inserindo campos nulos
INSERT INTO core.tb_param_alert (cd_cliente, cliente, cd_erro01, pct_erro01, cd_erro02, pct_erro02, cd_erro03, pct_erro03, cd_erro04, pct_erro04, cd_erro05, pct_erro05)
values (1, 'bafgt', 'fl_check_nr', 0.02,'fl_check_nr_inv', 0.02, 'fl_check_cdcust', 0.02, null, null, null, null);
