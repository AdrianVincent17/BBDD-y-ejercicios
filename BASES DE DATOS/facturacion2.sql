
/*FACTURACION 2*/

#--1

SELECT COUNT(*) AS "Numero de articulos"
FROM ARTICULOS
WHERE stock IS NULL;

#--2 

SELECT codcli, COUNT(*) AS "numero facturas"
FROM FACTURAS
WHERE iva=16
GROUP BY codcli
HAVING AVG(dto)>15;

#--3

SELECT COUNT(*) AS "Numero de facturas"
FROM FACTURAS
GROUP BY codcli
HAVING COUNT(*)>5;

#--4

SELECT codcli, iva, COUNT(*) AS "Numero de facturas"
FROM FACTURAS
WHERE codcli BETWEEN 240 AND 260
GROUP BY codcli, iva;

#--5

SELECT codart, descrip, precio
FROM ARTICULOS
ORDER BY precio DESC
LIMIT 10;

#--6

SELECT codart, SUM(cant) AS "Cantidad total"
FROM LINEAS_FAC
WHERE codart LIKE '%X_'
GROUP BY codart;

#--7

SELECT C.nombre, C.direccion, COUNT(*) AS "numero facturas"
FROM CLIENTES C, PUEBLOS P, PROVINCIAS PRO, FACTURAS F
WHERE C.codcli=F.codcli AND C.codpue=P.codpue AND P.codpro=PRO.codpro AND year(F.fecha)=2009 AND PRO.nombre LIKE 'CASTELLON'
GROUP BY C.nombre, C.direccion;

#--8

SELECT codfac, SUM(cant*precio) AS "Importe total"
FROM LINEAS_FAC
GROUP BY codfac
ORDER BY SUM(cant*precio) DESC
LIMIT 1;

#--9

SELECT C.codcli, C.nombre 
FROM CLIENTES C, FACTURAS F, LINEAS_FAC LF
WHERE C.codcli=F.codcli AND F.codfac=LF.codfac AND month(F.fecha)=12 AND year(F.fecha)=2009
GROUP BY C.codcli, C.nombre
HAVING SUM(cant*precio)>60;

#--10



#--11

#--12

