-- Databricks notebook source
SELECT *

FROM silver_olist.pedido
-- leia-se: selecione tudo da tabela silver_olist.pedido

-- COMMAND ----------

SELECT idPedido

FROM silver_olist.pedido

-- leia-se: selectione a coluna idPedido da tabela silver_olist.pedido

-- COMMAND ----------

SELECT idPedido,
       descSituacao

FROM silver_olist.pedido

-- leia-se: selectione as colunas idPedido e descSituacao da tabela silver_olist.pedido

-- COMMAND ----------

SELECT idPedido,
       descSituacao

FROM silver_olist.pedido

LIMIT 5

-- leia-se: selectione as colunas idPedido e descSituacao da tabela silver_olist.pedido

-- COMMAND ----------

SELECT idPedido,
       DATEDIFF(dtEstimativaEntrega, dtEntregue) AS qtDiasPromessaEntrega

FROM silver_olist.pedido

LIMIT 5
