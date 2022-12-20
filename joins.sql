-- Databricks notebook source
SELECT *

FROM silver_olist.orders

-- COMMAND ----------

SELECT *

FROM silver_olist.customers

-- COMMAND ----------

--  estado do cliente

SELECT T1.*, -- ei sql, me traz tudo da T1
       T2.descState

FROM silver_olist.orders AS T1

LEFT JOIN silver_olist.customers AS T2
ON T1.idCustomer = T2.idCustomer

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 
-- MAGIC ## Tabelas para o estudo dos joins

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Criação das tabelas

-- COMMAND ----------

-- MAGIC %python
-- MAGIC 
-- MAGIC import pandas as pd
-- MAGIC 
-- MAGIC cliente_data = [
-- MAGIC     {"idCliente": 1, "Nome": "Téo"},
-- MAGIC     {"idCliente": 2, "Nome": "Nah"},
-- MAGIC     {"idCliente": 3, "Nome": "Maria"},
-- MAGIC     {"idCliente": 4, "Nome": "José"},
-- MAGIC     {"idCliente": 5, "Nome": "Batman"}
-- MAGIC ]
-- MAGIC 
-- MAGIC # df = pd.DataFrame(data)
-- MAGIC # df.head()
-- MAGIC 
-- MAGIC df = spark.createDataFrame(pd.DataFrame(cliente_data))
-- MAGIC df.display()
-- MAGIC 
-- MAGIC df.createTempView("cliente")

-- COMMAND ----------

-- MAGIC %python
-- MAGIC 
-- MAGIC venda_data = [
-- MAGIC     {"idVenda": 1, "idCliente": 1, "vlVenda": 321},
-- MAGIC     {"idVenda": 2, "idCliente": 10, "vlVenda": 412},
-- MAGIC     {"idVenda": 3, "idCliente": 4, "vlVenda": 421},
-- MAGIC     {"idVenda": 4, "idCliente": 5, "vlVenda": 31},
-- MAGIC     {"idVenda": 5, "idCliente": 3, "vlVenda": 143},
-- MAGIC     {"idVenda": 6, "idCliente": 1, "vlVenda": 546},
-- MAGIC ]
-- MAGIC 
-- MAGIC df = spark.createDataFrame(pd.DataFrame(venda_data))
-- MAGIC df.display()
-- MAGIC 
-- MAGIC df.createTempView("venda")

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Left join

-- COMMAND ----------

SELECT *
FROM cliente AS T1
LEFT JOIN venda AS T2
ON T1.idCliente = T2.idCliente

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Right join

-- COMMAND ----------

SELECT *
FROM cliente AS T1
RIGHT JOIN venda AS T2
ON T1.idCliente = T2.idCliente

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC ### Inner join

-- COMMAND ----------

SELECT *
FROM cliente AS T1
INNER JOIN venda AS T2
ON T1.idCliente = T2.idCliente
