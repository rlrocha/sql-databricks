-- Databricks notebook source
-- DBTITLE 1,Exercício 1
-- 01 selecione todos os clientes paulistanos

SELECT *
FROM silver_olist.cliente
WHERE descCidade = 'sao paulo'

-- COMMAND ----------

-- DBTITLE 1,Exercício 2
-- 02 selecione todos os clientes paulistas

SELECT *
FROM silver_olist.cliente
WHERE descUF = 'SP'

-- COMMAND ----------

-- DBTITLE 1,Exercício 3
-- 03 selecione todos os vendedores cariocas e paulistas

SELECT *
FROM silver_olist.vendedor
WHERE descCidade = 'rio de janeiro'
OR descUF = 'SP'

-- COMMAND ----------

-- DBTITLE 1,Exercício 4
-- 04 selecione todos os produtos de perfumaria e bebes com altura maior que 5cm

SELECT *
FROM silver_olist.produto
WHERE descCategoria IN ('perfumaria', 'bebes')
AND vlAlturaCm> 5
