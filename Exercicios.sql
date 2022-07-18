-- Count por registros distintos
SELECT customer_state
     , count(*) AS 'Quantidade'  
FROM customers c  
GROUP BY customer_state 
ORDER BY 2 DESC 

select order_id
     , pedido.order_status
	 , cliente.customer_id
	 , cliente.customer_city
	 , cliente.customer_state
from orders pedido inner join customers cliente
on pedido.customer_id = cliente.customer_id 
order by cliente.customer_state

SELECT name
     , providers.name
     , categories.id
FROM products inner join providers
ON products.id = providers.id = categories.id
WHERE categories.id = 6

--1. CONTA A QUANTIDADE DE PEDIDOS E AGRUPE POR CIDADE (UTILIZE AS TABELAS ORDERS E CUSTOMERS)
SELECT customers.customer_city AS 'Cidade'
	  ,COUNT(orders.order_id) AS 'Contagem'
FROM orders INNER JOIN customers
on orders.customer_id = customers.customer_id
GROUP BY customers.customer_city 

-- 2. SELECTIONE O ID DO PEDIDO, O STATUS, O ID DO CLIENTE, A CIDADE DO CLIENTE E O ESTADO MESMO QUE ESTE NÃO ESTEJA PRESENTE NA TABELA CUSTOMER
SELECT orders.order_id 
	  ,orders.order_status 
	  ,customers.customer_id 
	  ,customers.customer_city 
	  ,customers.customer_state 
FROM orders inner join customers
ON orders.customer_id = customers.customer_id

-- FUNÇÕES

PRAGMA TABLE_INFO(ORDER_ITEMS); --Informaões sobre a tablea

SELECT CAST (PRICE AS INT) --Transforma o tipo do dados
FROM order_items
WHERE PRICE > 100