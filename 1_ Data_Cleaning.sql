SELECT *
FROM Ventas_Vea;

-- creamos una copia en la cual poder realizar el análisis
SELECT *
INTO Analisis_Ventas_Vea
FROM Ventas_Vea

-- eliminamos las columnas dirimidas innecesarias en el análisis
ALTER TABLE Analisis_Ventas_Vea
DROP COLUMN Item_Identifier, Outlet_Identifier, Item_Visibility, Item_Weight

-- chequeamos la integridad y coherencia de los valores en cada columna

SELECT *
FROM Analisis_Ventas_Vea

SELECT DISTINCT Outlet_Location
FROM Analisis_Ventas_Vea

SELECT DISTINCT Outlet_Establishment_Year
FROM Analisis_Ventas_Vea

SELECT DISTINCT Item_Type
FROM Analisis_Ventas_Vea

SELECT DISTINCT Item_Fat_Content
FROM Analisis_Ventas_Vea

-- realizamos la limpieza necesaria para corregir los valores 'reg' y 'LF'
UPDATE Analisis_Ventas_Vea
SET Item_Fat_Content = 'Low Fat'
WHERE Item_Fat_Content = 'LF'

UPDATE Analisis_Ventas_Vea
SET Item_Fat_Content = 'Regular'
WHERE Item_Fat_Content = 'reg'

-- chequeamos si el problema fue solucionado
SELECT DISTINCT Item_Fat_Content
FROM Analisis_Ventas_Vea