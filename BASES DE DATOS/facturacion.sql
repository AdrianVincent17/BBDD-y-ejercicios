#--1

SELECT codfac, fecha, dto*2 as "descuento doble"
FROM FACTURAS
WHERE iva=0;

#--2

SELECT codfac, fecha
FROM FACTURAS
WHERE iva is null;


#--3

SELECT codfac, fecha
FROM FACTURAS
WHERE iva is null OR iva=0;

#--4

SELECT codfac, codart
FROM LINEAS_FAC
WHERE cant>5 AND dto>=28%;


#--5

SELECT DISTINCT codfac, codart
FROM LINEAS_FAC
WHERE cant<5 AND dto>=25;


#--6

SELECT DISTINCT  iva 
FROM FACTURAS;

#--7

SELECT codart, descrip, stock_min
FROM ARTICULOS
WHERE stock is null;


#--8

SELECT descrip
FROM ARTICULOS
WHERE precio>6 AND stock>stock_min*3;

#--9

SELECT DISTINCT codart
FROM LINEAS_FAC
WHERE codfac BETWEEN 8 AND 10;

#--10

SELECT nombre
FROM PROVINCIAS
WHERE UPPER(nombre) like '?O%';

#--11

SELECT codfac, fecha
FROM FACTURAS
WHERE year(fecha)=2008;

#--12

SELECT codfac, fecha
FROM FACTURAS
WHERE codcli BETWEEN 50 AND 100 AND year(fecha)!=2009;

#--13

SELECT codfac, fecha
FROM FACTURAS
WHERE month(fecha)=3 and year(fecha) BETWEEN 2007 AND 2009;

#--14

SELECT codfac, fecha 
FROM FACTURAS
WHERE year(fecha)=2009 AND day(fecha)BETWEEN 1 AND 20 AND month(fecha)=1 AND codcli BETWEEN 100 AND 250;

#--15

SELECT nombre
FROM PROVINCIAS
WHERE nombre like'*S';

#--16

SELECT nombre
FROM CLIENTES
WHERE codpostal LIKE '02*' OR codpostal LIKE '11*' OR codpostal LIKE '21*';

#--17

SELECT *
FROM ARTICULOS
WHERE stock NOT BETWEEN stock_min-500 AND stock_min+500;

#--18

SELECT nombre
FROM PROVINCIAS
WHERE nombre LIKE '%MA%';

#--19

SELECT nombre
FROM PROVINCIAS
WHERE codpro LIKE '33%';

#--20

SELECT nombre
FROM PUEBLOS
WHERE codpue IN (SELECT codpue FROM PUEBLOS WHERE codpro IN (SELECT codpro FROM PROVINCIAS WHERE nombre like 'LEON'));

#--21

SELECT SUM(precio*stock) AS "IMPORTE TOTAL"
FROM ARTICULOS;

#--22

SELECT AVG(precio) AS "Precio medio"
FROM ARTICULOS
WHERE stock>10;

#--23

SELECT COUNT(*) AS "numero de pueblos"
FROM PUEBLOS
WHERE codpro like'12%';

#--24

SELECT COUNT(*) AS "numero de clientes"
FROM FACTURAS
WHERE iva=16
GROUP BY codcli;

#--25

SELECT codart, descrip, precio, precio*0.85 AS "Precio promocion"
FROM ARTICULOS
WHERE (precio>30 AND (stock*precio>300)) OR (precio<=30 AND (stock*precio>150));
