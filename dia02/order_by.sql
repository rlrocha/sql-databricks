-- Databricks notebook source
SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qtClienteEstado

FROM silver_olist.cliente

GROUP BY descUF
ORDER BY descUF -- depois do group by

-- COMMAND ----------

SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qtClienteEstado

FROM silver_olist.cliente

GROUP BY descUF
-- ORDER BY 2 -- 1: ordenar pela segundo coluna
-- ORDER BY qtClienteEstado -- 2: ordenar pela nova coluna (só pode depoius do group by)
ORDER BY COUNT(DISTINCT idClienteUnico)qtClienteEstado -- 3: ordenar diretamente pela mesma expressão

-- COMMAND ----------

SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qtClienteEstado

FROM silver_olist.cliente

GROUP BY descUF
ORDER BY qtClienteEstado DESC -- depois do campo (order by)

LIMIT 1 -- apenas uma linha

-- COMMAND ----------

-- MAGIC % python
-- MAGIC 
-- MAGIC data = [
-- MAGIC     
-- MAGIC     "nome": "teo", "idade": 30,
-- MAGIC     "nome": "rodrigo", "idade": 327,
-- MAGIC     "nome": "victor", "idade":20,
-- MAGIC     "nome": "gabriel", "idade":28,
-- MAGIC     "nome": "carlos", "idade":27,
-- MAGIC     "nome": "josé", "idade":24,
-- MAGIC     "nome": "fernando", "idade":34,
-- MAGIC     "nome": "bruno", "idade":37,
-- MAGIC     "nome": "patrick", "idade":31,
-- MAGIC     "nome": "dodo", "idade":31,
-- MAGIC     "nome": "alessa", "idade":31,
-- MAGIC     
-- MAGIC ]
-- MAGIC 
-- MAGIC import pandas as pd
-- MAGIC 
-- MAGIC -- df = pd.DataFrame(data)
-- MAGIC -- df.head()
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
