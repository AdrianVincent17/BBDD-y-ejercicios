

/*EX RECUPERACION 1EV 2024*/

#--1. --

	SELECT P.nombre AS nombre, COUNT(C.codcli) AS "Nº CLIENTES"
	FROM PUEBLOS P, CLIENTES C
	WHERE P.codpue=C.codpue 
	GROUP BY P.nombre
	ORDER BY COUNT(*) DESC
	LIMIT 1;


#--2. --
	
	SELECT DISTINCT F.codfac AS Cliente, F.fecha As fecha
	FROM FACTURAS F, CLIENTES C, PUEBLOS P, PROVINCIAS PR
	WHERE F.codcli=C.codcli AND P.codpue=C.codpue AND P.codpro=PR.codpro AND MONTH(F.fecha) BETWEEN 8 AND 12 AND LOWER(PR.nombre) LIKE 'madrid' AND YEAR(F.fecha)=2008;


#--3. --
	
	SELECT COUNT(*) AS CLIENTES, P.nombre AS PUEBLOS, PR.nombre AS PROVINCIAS
	FROM CLIENTES C, PUEBLOS P, PROVINCIAS PR
	WHERE C.codpue=P.codpue AND P.codpro=PR.codpro AND UPPER(PR.nombre) IN('ALICANTE', 'CASTELLON', 'VALENCIA')
	GROUP BY P.nombre, PR.nombre
	ORDER BY P.nombre ;


#--4. --

	SELECT codcli AS CLIENTES, COUNT(*) AS "Nº facturas"
	FROM FACTURAS 
	WHERE  (dto=0 OR dto IS NULL OR iva=16) AND YEAR(fecha)=2009
	GROUP BY codcli
	HAVING COUNT(*)>2;



#--5. --

	SELECT PR.nombre AS "provincia", COUNT(C.codcli) AS "Nº clientes"
	FROM CLIENTES C, PUEBLOS P, PROVINCIAS PR
	WHERE C.codpue=P.codpue AND PR.codpro=P.codpro
	GROUP BY PR.nombre
	HAVING COUNT(C.codcli)>5;


#--6. **

	SELECT C.nombre 
	FROM CLIENTES C, LINEAS_FAC L, FACTURAS F
	WHERE C.codcli=F.codcli AND F.codfac=L.codfac AND L.codfac(SELECT codfac FROM LINEAS_FAC GROUP BY codfac HAVING SUM(precio*cantidad) in (select sum(precio*cant) FROM LINEAS_FAC order by sum(precio*cant) desc limit 1));



#--7. --

	SELECT C.codcli AS "Codigo", C.nombre AS "Nombre cliente"
	FROM LINEAS_FAC L, CLIENTES C, FACTURAS F
	WHERE L.codfac=F.codfac AND C.codcli=F.codcli
	GROUP BY C.codcli, C.nombre
	HAVING SUM(L.precio)<1;
	



#--8. --

	SELECT COUNT(*) AS "N ARTICULOS"
	FROM ARTICULOS 
	WHERE precio>100 and codart NOT IN (SELECT codart 
										FROM LINEAS_FAC 
										WHERE codfac IN(SELECT codfac 
														FROM FACTURAS 
														WHERE YEAR(fecha)=2009 AND MONTH(fecha) BETWEEN 1 AND 6));

#--9. --

	SELECT C.nombre AS nombre_cliente, COUNT(*) "Nº FACTURAS"
	FROM CLIENTES C, FACTURAS F
	WHERE C.codcli=F.codcli AND F.iva=16 AND YEAR(fecha)=2005
	GROUP BY C.nombre
	HAVING COUNT(*)>1;



#--10. --
	
	SELECT L.codart AS codigo_articulo, L.precio AS precio
	FROM LINEAS_FAC L, FACTURAS F
	WHERE L.codfac=F.codfac AND precio>50 AND L.codart IN (SELECT L.codart 
														   FROM FACTURAS F, LINEAS_FAC L
														   WHERE L.codfac=F.codfac AND year(fecha)=2009) and L.codart NOT IN (SELECT L.codart FROM FACTURAS F, LINEAS_FAC L WHERE L.codfac=F.codfac AND year(fecha)!=2009);

