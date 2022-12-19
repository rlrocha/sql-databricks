-- Databricks notebook source
SELECT *
FROM silver_olist.customers

-- COMMAND ----------

SELECT
  descState,
  COUNT(DISTINCT idUniqueCustomer) AS qtCustomerState

FROM silver_olist.customers

GROUP BY descState
ORDER BY descState -- depois do group by

-- COMMAND ----------

SELECT
  descState,
  COUNT(DISTINCT idUniqueCustomer) AS qtCustomerState

FROM silver_olist.customers

GROUP BY descState
-- ORDER BY 2 -- 1: ordenar pela segundo coluna
ORDER BY qtCustomerState -- 2: ordenar pela nova coluna (só pode depoius do group by)
-- ORDER BY COUNT(DISTINCT idUniqueCustomer) -- 3: ordenar diretamente pela mesma expressão

-- COMMAND ----------

SELECT
  descState,
  COUNT(DISTINCT idUniqueCustomer) AS qtCustomerState

FROM silver_olist.customers

GROUP BY descState
ORDER BY qtCustomerState DESC -- depois do campo (order by)

LIMIT 1 -- apenas uma linha

-- COMMAND ----------

-- MAGIC %python
-- MAGIC 
-- MAGIC data = [
-- MAGIC     {"nome": "teo", "idade": 30},
-- MAGIC     {"nome": "rodrigo", "idade": 327},
-- MAGIC     {"nome": "victor", "idade":20},
-- MAGIC     {"nome": "gabriel", "idade":28},
-- MAGIC     {"nome": "carlos", "idade":27},
-- MAGIC     {"nome": "josé", "idade":24},
-- MAGIC     {"nome": "fernando", "idade":34},
-- MAGIC     {"nome": "bruno", "idade":37},
-- MAGIC     {"nome": "patrick", "idade":31},
-- MAGIC     {"nome": "dodo", "idade":31},
-- MAGIC     {"nome": "alessa", "idade":31},
-- MAGIC ]
-- MAGIC 
-- MAGIC import pandas as pd
-- MAGIC 
-- MAGIC # df = pd.DataFrame(data)
-- MAGIC # df.head()
-- MAGIC 
-- MAGIC df = spark.createDataFrame(pd.DataFrame(data))
-- MAGIC df.display()
-- MAGIC 
-- MAGIC df.createTempView("fodase")

-- COMMAND ----------

SELECT *

FROM fodase

-- não precisa estar com o group by
ORDER BY idade DESC, nome ASC -- começa pela idade, e o critério de desempate é o nome
