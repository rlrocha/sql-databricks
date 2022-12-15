-- Databricks notebook source
SELECT *

FROM silver_olist.pedido

WHERE descSituacao = 'canceled' -- delivered, shipped, canceled

-- LIMIT 100

-- leia-se: selecione toodas as colunas da tabela silver_olist.pedido onde a situação do pedido seja entregue (delivered)

-- COMMAND ----------

SELECT *

FROM silver_olist.pedido

WHERE descSituacao = 'shipped' -- delivered, shipped, canceled
AND year(dtPedido) = '2018' -- month(dtPedido) = '12'

-- leia-se: selecione todas as colunas da tabela filtrando pedidos enviados de 2018

-- COMMAND ----------

SELECT *

FROM silver_olist.pedido

WHERE (descSituacao = 'shipped' OR descSituacao = 'canceled') -- delivered, shipped, canceled
AND year(dtPedido) = '2018'

-- leia-se: selecione todas as colunas da tabela filtrando pedidos (enviados OU cancelados) de 2018

-- COMMAND ----------

SELECT *

FROM silver_olist.pedido

WHERE descSituacao IN ('shipped', 'canceled') -- delivered, shipped, canceled
AND year(dtPedido) = '2018'

-- leia-se: selecione todas as colunas da tabela filtrando pedidos (enviados OU cancelados) de 2018

-- COMMAND ----------

SELECT *,
       DATEDIFF(dtEstimativaEntrega, dtAprovado) AS diffDatasAprovadoPrevisao

FROM silver_olist.pedido

WHERE descSituacao IN ('shipped', 'canceled') -- delivered, shipped, canceled
AND year(dtPedido) = '2018'
AND DATEDIFF(dtEstimativaEntrega, dtAprovado) > 30

-- leia-se: selecione todas as colunas da tabela filtrando pedidos (enviados OU cancelados) de 2018 cujos pedidos chegaram com mais de 30 dias
