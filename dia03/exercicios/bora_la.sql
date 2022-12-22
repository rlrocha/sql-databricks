-- Databricks notebook source
SELECT *
FROM silver_olist.products
LIMIT 3

-- COMMAND ----------

SELECT *
FROM silver_olist.order_items
LIMIT 3

-- COMMAND ----------

-- Qual categoria tem mais produtos vendidos?

SELECT 
       T2.descCategoryName,
       COUNT(*) AS Qtd -- contagem de linhas (* -> T1.idOrder)

FROM silver_olist.order_items AS T1 -- tabela de vendas

LEFT JOIN silver_olist.products AS T2 -- tabela de produtos
ON T1.idProduct = T2.idProduct

GROUP BY T2.descCategoryName -- agrupa por categoria
ORDER BY Qtd DESC

-- se a coluna existe em uma das tabelas, não precisa especificar a tabela (é bom deixar explicito)

-- COMMAND ----------

-- Qual categoria tem produtos mais caros, em média?

SELECT T2.descCategoryName,
       AVG(T1.vlPrice),
       MAX(T1.vlPrice) -- produto mais caro (não é pedido)

FROM silver_olist.order_items AS T1 -- tabela de vendas

LEFT JOIN silver_olist.products AS T2 -- tabela de produtos
ON T1.idProduct = T2.idProduct

GROUP BY T2.descCategoryName
ORDER BY AVG(T1.vlPrice) DESC

-- COMMAND ----------

-- Qual categoria tem maiores fretes, em média?

-- COMMAND ----------



-- COMMAND ----------

-- O clientes de qual estado pagam mais frente?

SELECT 
--        T1.idOrder,
--        T1.vlFreight,
--        T2.idCustomer,
       T3.descUF, -- verificar, pois está em inglês
       AVG(T1.vlFreight) AS avgFrete

FROM silver_olist.order_items AS T1 -- tabela de vendas

LEFT JOIN silver_olist.orders AS T2 -- tabela de pedidos
ON T1.idOrder = T2.idOrder

LEFT JOIN silver_olist.customers AS T3
ON T2.idCustomer T3.idCustomer

GROUP BY T3.descUF, -- verificar, pois está em inglês

HAVING AVG(T1.vlFreight) > 40 -- funciona somente com avgFrete no order by (só funciona com alias)

ORDER BY avgFrete DESC
