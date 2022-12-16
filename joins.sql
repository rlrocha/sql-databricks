-- Databricks notebook source
--  estado do cliente

SELECT T1.*, -- ei sql, me traz tudo da T1
       T2.desUF 

FROM silver_olist.pedido AS T1

LEFT JOIN silver_olist.cliente AS T2
ON T1.idCliente = T2.idCliente
