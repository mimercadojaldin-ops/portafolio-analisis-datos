-- ============================================================
-- PORTAFOLIO DE ANÁLISIS DE DATOS - CONSULTAS SQL
-- Autor: Matias Ignacio
-- Proyecto: Análisis de Ventas de Tecnología
-- ============================================================

-- 1. Crear la tabla de ventas
CREATE TABLE ventas_tecnologia (
    id_transaccion VARCHAR(10) PRIMARY KEY,
    fecha DATE NOT NULL,
    categoria VARCHAR(50),
    producto VARCHAR(100),
    region VARCHAR(20),
    unidades INT,
    precio_unitario DECIMAL(10, 2)
);

-- 2. Consulta de Ventas Totales por Categoria y Región
SELECT 
    categoria,
    region,
    SUM(unidades) AS total_unidades,
    ROUND(SUM(unidades * precio_unitario), 2) AS venta_total_usd
FROM ventas_tecnologia
GROUP BY categoria, region
ORDER BY venta_total_usd DESC;

-- 3. Identificación de los 3 productos más vendidos
SELECT 
    producto,
    SUM(unidades) AS total_unidades_vendidas,
    ROUND(SUM(unidades * precio_unitario), 2) AS ingreso_generado
FROM ventas_tecnologia
GROUP BY producto
ORDER BY total_unidades_vendidas DESC
LIMIT 3;

-- 4. Cálculo del Ticket Promedio por Región
SELECT 
    region,
    COUNT(id_transaccion) AS numero_transacciones,
    ROUND(AVG(unidades * precio_unitario), 2) AS ticket_promedio
FROM ventas_tecnologia
GROUP BY region;
