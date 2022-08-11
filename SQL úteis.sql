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
