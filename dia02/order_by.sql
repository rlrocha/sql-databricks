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
