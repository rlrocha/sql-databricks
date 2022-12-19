-- Databricks notebook source
SHOW TABLE

-- COMMAND ----------

SELECT descUF,
       COUNT(idVendedor) AS qtVendedorUF

FROM silver_olist.vendedor

WHERE descUF in ('SP', 'MG', 'RJ', 'ES') -- sempre depois do from e antes do group by
-- é onde a gente passa o sarrafo

GROUP BY descUF

-- HAVING COUNT(idVendedor) > 100 -- filtro depois da agregação
HAVING qtVendedorUF > 100 -- filtro depois da agregação
-- aparar a grama

ORDER BY qtVendedorUF DESC
