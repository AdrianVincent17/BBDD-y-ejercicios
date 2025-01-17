

/*FACTURACION 3*/

#--1 Importe de facturación (suma del producto de la cantidad por el precio de las líneas de factura) de aquellos artículos cuyo código contiene la letra “A”.

SELECT SUM(cant*precio) AS "Importe"
FROM LINEAS_FAC
WHERE codart LIKE '%A%';

#--2 Número de facturas para cada año.

SELECT COUNT(*)AS "Facturas cada año", YEAR(fecha) AS "Años"
FROM FACTURAS
GROUP BY YEAR(fecha)
ORDER BY YEAR(fecha);

#--3 Nombre de los pueblos en los que tenemos 2 o más clientes.

SELECT P.nombre AS "Nombre del pueblo"
FROM PUEBLOS P, CLIENTES C
WHERE P.codpue=C.codpue
GROUP BY P.nombre
HAVING COUNT(*)>2;

#--4 Cantidades totales vendidas para cada uno de los artículos cuyo código empiece por “V”.

SELECT COUNT(*) AS "CANTIDAD TOTAL VENDIDA", codart AS "ARTICULOS"
FROM LINEAS_FAC
WHERE UPPER(codart) LIKE 'V%' 
GROUP BY codart;

#--5 Código de aquellos artículos de los que se ha facturado más de 900 €.

SELECT codart 
FROM LINEAS_FAC
GROUP BY codart
HAVING SUM(cant*precio)>900;

#--6 Número de cliente y número de facturas para aquellos clientes que tengan una media superior al 15% de descuento en sus facturas, y que tengan más de una factura.

SELECT codcli, COUNT(*) AS "Nº facturas"
FROM FACTURAS
GROUP BY codcli
HAVING AVG(dto)>15 AND COUNT(*)>1;

#--7 Código, descripción y precio del artículo más caro.

SELECT codart, descrip, precio
FROM ARTICULOS
ORDER BY precio DESC
LIMIT 1;

#--8
#--9
#--10
#--11
#--12
#--13
#--14
#--15
#--16
#--17
#--18
#--19

