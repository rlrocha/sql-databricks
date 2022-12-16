-- Databricks notebook source
SELECT COUNT(*) AS nrLinhasNaoNulas -- linhas não nulas
FROM silver_olist.cliente

-- COMMAND ----------

SELECT
  COUNT(*) AS nrLinhasNaoNulas, -- linhas não nulas
  COUNT(idCliente) AS nrIdClientesNaoNulo -- id de clientes não nulos

FROM silver_olist.cliente

-- COMMAND ----------

SELECT
  COUNT(*) AS nrLinhasNaoNulas, -- linhas não nulas
  COUNT(idCliente) AS nrIdClientesNaoNulo, -- id de clientes não nulos
  COUNT(distinct idCliente) AS nrIdClienteDistintos -- id de clientes dist

FROM silver_olist.cliente

-- COMMAND ----------

SELECT
  COUNT(*) AS nrLinhasNaoNulas, -- linhas não nulas
  COUNT(idCliente) AS nrIdClientesNaoNulo, -- id de clientes não nulos
  COUNT(DISTINCT idCliente) AS nrIdClienteDistintos, -- id de clientes distintos
  COUNT(idClienteUnico) AS nrIdClienteUnicoDistintos, -- id de clientes únicos
  COUNT(DISTINCT idClienteUnico) AS nrIdClienteUnicoDistintos -- id de clientes únicos distintos

FROM silver_olist.cliente

-- COMMAND ----------

-- Quantos clientes são da cidade de presidente prudente

SELECT
  COUNT(*)

FROM silver_olist.cliente

WHERE descCidade = 'presidente prudente'

-- COMMAND ----------

SELECT
  COUNT(*) AS qtLinhas,
  COUNT(DISTINCT idCliente) AS qtClientes,
  COUNT(DISTINCT idClienteUnico) AS  qtClientesUnicos

FROM silver_olist.cliente

WHERE descCidade IN ('presidente prudente', 'curitiba')

-- COMMAND ----------

SELECT
  ROUND(AVG(vlPreco), 2) AS avgPreco, -- média da coluna vlPreco (preço médio dos produtos)
  
  INT(PERCENTILE(vlPreco, 0.5)) AS medianPreco,  -- preço mediano dos produtos
  
  MAX(vlPreco) AS maxPreco, -- máximo da coluna vlPreco
  AVG(vlFrete) AS avgFrete, -- média da coluna vlFrete (preço médio dos fretes)
  MAX(vlFrete) AS maxFrete, -- máximo da coluna vlFrete
  MIN(vlFrete) AS mibFrete -- minímo da coluna vlFrete
   
FROM silver_olist.item_pedido

-- trunc(preco, 0) | CAST(preco) AS INT -> número inteiro, sem casa decimal

-- COMMAND ----------

SELECT *

FROM silver_olist.cliente

WHERE descUF = 'SC' -- SP, SC, MT
