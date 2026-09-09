----Consulta 1 — Resumen ejecutivo mensual---

SELECT 
    MONTH (fecha_venta) AS Mes,  ----El comando EXTRACT no esta disponible--
    SUM(cantidad * precio_unitario) AS Total_facturado,
    COUNT(*) AS Cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS Ticket_promedio
FROM dbo.ventas
GROUP BY  MONTH (fecha_venta) 
ORDER BY mes;

---Consulta 2 — Ranking de productos ----

SELECT TOP 5 -- el comando LIMIT no esta disponible se ingresa TOP--
    id_producto,
    SUM(cantidad) AS Unidades_vendidas,
    SUM(cantidad * precio_unitario) AS Total_generado
FROM dbo.ventas
GROUP BY id_producto
ORDER BY Total_generado DESC;

----Consulta 3 — Clientes recurrentes----

SELECT 
    id_cliente,
    COUNT(*) AS Cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS Total_gastado
FROM DBO.ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;

----Consulta 4 — Meses por encima/por debajo del promedio----

WITH Total_por_mes AS (
    SELECT 
        MONTH(fecha_venta) AS Mes, 
        SUM(cantidad * precio_unitario) AS Total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)
SELECT 
    Mes,
    Total_facturado,
    CASE 
        WHEN Total_facturado > (SELECT AVG(Total_facturado) FROM Total_por_mes) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS Rendimiento_vs_promedio
FROM Total_por_mes
ORDER BY Mes;

---HALLAZGOS---

---CONSULTA 1.RESUMEN EJECUTIVO POR MES: solo se realiza del mes de marzo ya que es el único mes con registos en la base de datos
---En el mes de marzo se facturó $6,444.00 equivalente a 10 pedidos,  lo que establece un ticket promedio 
---por transacción de $644.40--

--CONSULTA 2. RAKING DE PRODUCTOS: El producto 1 con solo 3 unidades vendidas genera más del 50% de las ventas a 
--comparación de los otros productos, y a pesar de que el producto 2 es el más vendido.

--CONSULTA 4.MESES POR ENCIMA O POR DEBAJO DEL PROMEDIO: Nos da como resultado por debajo del promedio ya que 
--solo se tiene  registro de 1 mes, se necesitan más datos historicos de varios meses para sacar una estadistica 
--real
