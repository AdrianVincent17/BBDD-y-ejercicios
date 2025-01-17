

EJERCICIOS SPSP

#-- 1 Mostrar los nombres de los proveedores

SELECT snombre
FROM S;

#-- 2 Mostrar los datos de la tabla proveedores

SELECT *
FROM P;

#-- 3 Visualiza nombre y color de las piezas con peso superior a 15

SELECT nombre,color
FROM P
WHERE peso>15;

#-- 4 nombre y ciudad donde se almacenan las piezas de color azul

SELECT nombre,ciudad
FROM P
where color LIKE 'azul';

#-- 5 Nombre y color de las piezas con peso entre 15 y 20

SELECT nombre, color
FROM P
WHERE peso BETWEEN 15 AND 20;

#-- 6 Nombre y color de las piezas con un peso que no este entre 15 y 20

SELECT nombre, color
FROM P
WHERE peso NOT BETWEEN 15 AND 20;

#-- 7 Nombre de piezas que terminen en A

SELECT pnombre
FROM P
WHERE pnombre LIKE'%a';

#-- 8 Nombre de los proveedores que no empiecen por b

SELECT snombre
FROM S
WHERE snombre NOT LIKE 'B%';

#-- 9 Ciudades donde se almacenan piezas

SELECT DISTINCT ciudad
FROM P;

#-- 10 Codigo y nombre de los proveedores de londres

SELECT sn, snombre
FROM S
WHERE ciudad LIKE'Londres';


#-- 11 nombre de las piezas ordenadas por ciudad y peso (descendente)

SELECT pnombre
FROM P
ORDER BY ciudad DESC, peso DESC;

#-- 12 datos de los proveedores cuyo estado es nulo

SELECT *
FROM S
WHERE estado IS NULL;

#-- 13 datos de los proveedores cuyo estado no es nulo

SELECT *
FROM S
WHERE estado IS NOT NULL;

#-- 14 nombre de las piezas almacenadas en Londres o Roma

SELECT DISTINCT pnombre
FROM P
where ciudad IN('Londres','Roma');

#-- 15 Codigo de las piezas que no sean ni rojas ni verdes

SELECT DISTINCT pnombre
FROM P
WHERE color NOT IN('rojo','verde');

#-- 16 numero total de proveedores

SELECT COUNT(*) AS total_proveedores
FROM S;


#-- 17 Peso minimo entre todas las piezas

SELECT pnombre,MIN(peso) AS Peso_minimo
FROM P
GROUP BY pnombre
LIMIT 1;

#-- 18 Cantidad total de envíos por proveedor.

SELECT sn,SUM(cant) AS cantidad_envios
FROM SP
GROUP BY sn;

#-- 19 Número de piezas de cada color.

SELECT DISTINCT color, COUNT(color) AS "Numero de piezas"
FROM P
GROUP BY color;


#-- 20 Código de los proveedores que en total envíen 1000 o más piezas.

SELECT sn, SUM(cant) AS "Cantidad total envios"
FROM SP
GROUP BY sn
HAVING SUM(cant)>=1000;





