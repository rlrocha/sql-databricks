-- Databricks notebook source
SELECT *,
       CASE
         WHEN descUF = 'SP' THEN 'paulista'
         WHEN descUF = 'RJ' THEN 'fluminense'
         WHEN descUF = 'PR' THEN 'paranaense'
         ELSE 'outros'
       END AS descNacionalidade
       
FROM silver_olist.cliente

-- valor do campo (string) é case sensitive

-- COMMAND ----------

SELECT *,

       -- coluna nova
       CASE
         WHEN descUF = 'SP' THEN 'paulista'
         WHEN descUF = 'RJ' THEN 'fluminense'
         WHEN descUF = 'PR' THEN 'paranaense'
         ELSE 'outros'
       END AS descNacionalidade,
       
       -- coluna nova
       CASE
         WHEN descCidade LIKE '%sao%' THEN 'Tem são no nome'
         ELSE 'Nâo tem são no nome'
       END AS descCidadeSao
       
FROM silver_olist.cliente

-- COMMAND ----------

SELECT *,

       CASE
         WHEN descUF IN ('SP', 'MG', 'RJ', 'ES') THEN 'sudeste'
         ELSE 'outra regiao'
       END AS descRegiao
       
FROM silver_olist.cliente

-- COMMAND ----------


