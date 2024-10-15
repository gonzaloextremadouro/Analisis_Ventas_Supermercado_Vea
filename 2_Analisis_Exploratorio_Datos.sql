-- ANÁLISIS EXPLORATORIO DE DATOS
-- Realizamos algunas consultas para orientarnos sobre qué información útil se puede trasladar al dashboard

-- 1. Identificamos potenciales KPIs
SELECT 
	ROUND(SUM(Sales), 0) AS Total_Sales, 
	COUNT(*) AS Number_Of_Items,
	ROUND(AVG(Sales), 2) AS Avg_Sales,
	AVG(Rating) AS Avg_Rating
FROM
	Analisis_Ventas_Vea

-- 2. Ventas por Ubicación
SELECT 
	Outlet_Location, 
	ROUND(SUM(Sales), 0) AS 'Profits'
FROM 
	Analisis_Ventas_Vea
GROUP BY 
	Outlet_Location

-- 3. Rendimiento de los productos bajos en grasa vs. los regulares
SELECT 
	Item_Fat_Content, 
	(ROUND(SUM(Sales), 0)) AS 'Total_Sales'
FROM 
	Analisis_Ventas_Vea
GROUP BY 
	Item_Fat_Content

-- 4. Rendimiento de los productos en general
SELECT 
	Item_Type, 
	ROUND(SUM(Sales), 0) AS 'Sales_Per_Item'
FROM 
	Analisis_Ventas_Vea
GROUP BY
	Item_Type
ORDER BY
	Sales_Per_Item DESC

-- 5. Ganancias por año y comparación YOY
SELECT
    Year,
    ROUND(SUM(Sales), 0) AS Sales_Year,
    ROUND(SUM(Sales), 0) - COALESCE(LAG(ROUND(SUM(Sales), 0), 1) OVER (ORDER BY Year), ROUND(SUM(Sales), 0)) AS Sales_YOY
FROM
    Analisis_Ventas_Vea
GROUP BY
    Year;