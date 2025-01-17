
#-- Creamos y cargamos la base de datos
DROP DATABASE IF EXISTS ligabasket; 
CREATE DATABASE ligabasket;
use ligabasket;

SOURCE C://Users//AdrianV//Desktop//BASES DE DATOS//BD_ligabasket.sql;

#-- Visualizamos todas la tablas con toda su informacion
SELECT *
FROM equipos;

SELECT *
FROM jugadores;

SELECT *
FROM partidos;

#-- Visualizar solo el nombre de todos los equipos.

SELECT nombre
FROM equipos;

#-- Visualizar nombre de equipo con alias

SELECT nombre AS "nombre de equipo"
FROM equipos;

#-- Visualizar nombre y la ciudad de cada equipo

SELECT nombre AS nombre_equipo, ciudad AS "Ciudad del equipo"
FROM equipos;

#-- mostrar el resultado de todos los partidos

SELECT puntosL AS "puntos local","-", puntosV AS "puntos visitante"
FROM partidos;

#-- selecciona nombres y apellidos de todos los jugadores

SELECT nombre, apellido
FROM jugadores;

#-- selecciona nombres y apellidos de todos los jugadores de forma ordenada por apellido de forma descendente

SELECT nombre, apellido
FROM jugadores
ORDER BY apellido DESC;

#-- seleccionar los nombres y apellidos de todos los jugadores ordenados por posicion y apellido (en orden descendente y ascendente)

SELECT nombre, apellido, puesto
FROM jugadores
ORDER BY puesto DESC, apellido;

#-- Mostrar nombre, apellidos y altura de jguadores ordenados desde el mas alto al mas bajo 

SELECT nombre, apellido, altura
FROM jugadores
ORDER BY altura DESC;

#-- Mostrar nombre y apuellido del jugador mas alto

SELECT nombre, apellido
FROM jugadores
ORDER BY altura DESC
LIMIT 1;

#-- #-- Mostrar nombre y apuellido de los 5 jugadorores mas altos

SELECT nombre, apellido
FROM jugadores
ORDER BY altura DESC
LIMIT 5;

#-- Mostrar nombre, apellido y sueldo de los 5 jugadores que mas cobran 

SELECT nombre, apellido, salario
FROM jugadores
ORDER BY salario DESC
LIMIT 5;

#-- Mostrar las distintas posiciones de juego

SELECT DISTINCT puesto
FROM jugadores
ORDER BY puesto;

#-- Calcular el salario neto anual a percibir por cada jugador suponiendo que el irpf es un 18%

SELECT nombre, apellido, salario*0.82 AS salario_neto
FROM jugadores
ORDER BY salario DESC;

#-- Mostrar la fecha actual del sistema

SELECT CURRENT_DATE() AS "fecha Actual";

#-- Mostrar la fecha y hora actual del sistema 

SELECT NOW() AS "fecha y hora acutal";

#-- Nombre y apellidos en un solo campo

SELECT CONCAT(nombre," ", apellido) AS "Datos del jugador"
FROM jugadores
ORDER BY nombre;

#-- Mostrar nombre y apellidos de los jugadores que sean pivot

SELECT nombre, apellido
FROM jugadores
WHERE puesto="pivot";

--Funciona tambien con comillas simples

SELECT nombre, apellido
FROM jugadores
WHERE puesto='pivot';

--tambien con la clausula "LIKE" podremos filtarlo

SELECT nombre, apellido
FROM jugadores
WHERE puesto LIKE 'pivot';


#-- Mostrar datos de los jugadores que sean pivots y gann mas de 100000 euros

SELECT *
FROM jugadores
WHERE puesto LIKE 'pivot' AND salario>100000
ORDER BY salario DESC;

#-- mostrar nombre, apellidos y altura de los jugadores que superen los 2.05 metros

SELECT nombre, apellido, altura
FROM jugadores
WHERE altura>2.05
ORDER BY altura DESC;

#-- datos de los jugadores que pertenezcan al equipo 3
SELECT *
FROM jugadores
WHERE equipo=3
ORDER BY nombre;

#-- datos de los jugadores que NO pertenezcan al equipo 3

SELECT *
FROM jugadores
WHERE equipo!=3
ORDER BY nombre;

--otra forma de poner distino seria con el <>

SELECT *
FROM jugadores
WHERE equipo<>3
ORDER BY equipo;

#-- Fechas

SELECT day(now()) AS "dia actual";
SELECT MONTH(now()) AS "mes actual";
SELECT year(now()) AS "año actual";

#-- Resultado de los partidos jugados en mayo

SELECT CONCAT(puntosL," - ", puntosV) AS resultados
FROM partidos
WHERE MONTH(fecha)=5;

#-- Resultado de los partidos jugados en enero de 2018

SELECT CONCAT(puntosL," - ", puntosV) AS resultados
FROM partidos
WHERE MONTH(fecha)=1 AND year(fecha)=2018;

#-- Datos de los jugadores con salario superior a 100000 ordenados de forma descendente

SELECT *
FROM jugadores
WHERE salario>100000
ORDER BY salario DESC;

#-- mostrar nombre de los equipos de los que se desconozca el nombre del pabellon

SELECT nombre AS "nombre equipos"
FROM equipos
WHERE pabellon IS NULL;

#-- mostrar nombre de los equipos de los que se conozca el nombre del pabellon

SELECT nombre AS "nombre equipos"
FROM equipos
WHERE pabellon IS NOT NULL;



#-- nombre y puesto de los jugadroes que no sean base

SELECT nombre, puesto
FROM jugadores
WHERE puesto!='base';

--otra forma seria 

SELECT nombre, puesto
FROM jugadores
WHERE  NOT puesto='base';

--y otra forma con el like o el not like

SELECT nombre, puesto
FROM jugadores
WHERE puesto NOT LIKE 'base';

#-- nombre y puesto de los jugadores que sean base o escolta

SELECT nombre , puesto
FROM jugadores
WHERE puesto LIKE'base' OR puesto LIKE'escolta'
ORDER BY puesto DESC;

--otra forma seria 

SELECT nombre , puesto
FROM jugadores
WHERE puesto IN('base','escolta')
ORDER BY puesto DESC;

#--nombre y puesto de los jugadores que no sean base ni escolta

SELECT nombre , puesto
FROM jugadores
WHERE puesto NOT IN('base','escolta')
ORDER BY puesto DESC;

--otra forma seria

SELECT nombre , puesto
FROM jugadores
WHERE puesto NOT LIKE'base' AND puesto NOT LIKE'escolta'
ORDER BY puesto;

--otra forma seria 

SELECT nombre , puesto
FROM jugadores
WHERE NOT (puesto='base' OR puesto='escolta')
ORDER BY puesto;

#-- nombre de los jugadores de los quiepos 1 y 2

SELECT nombre, equipo
FROM jugadores
WHERE equipo=1 OR equipo=2;

#-- nombre de los jugadores de los quiepos 1 y 2 y que jueguen como pivot

SELECT nombre, equipo
FROM jugadores
WHERE (equipo=1 OR equipo=2) AND puesto='pivot';

#--IMPORTANTE!! NO OLVIDES LO PARENTESIS CLAUSULAS OR!!!

SELECT nombre, equipo
FROM jugadores
WHERE equipo IN(1,2) AND puesto='pivot';

#-- Datos de los equipos menos los de valencia y madrid

SELECT *
FROM equipos
WHERE ciudad NOT IN('Valencia', 'Madrid');

#-- nombre y salario de los jugadores que cobren entre 60000 y 100000 euros

SELECT nombre, salario
FROM jugadores
WHERE salario BETWEEN 60000 AND 100000;

#-- nombre y salario de los jugadores que NO cobren entre 60000 y 100000 euros

SELECT nombre, salario
FROM jugadores
WHERE salario NOT BETWEEN 60000 AND 100000;

#--Resultado de los partidos jugados en enero de 2018

SELECT CONCAT(puntosL," - ",puntosV) AS Resultado
FROM partidos
WHERE fecha BETWEEN '2018-01-01' AND '2018-01-31';

#-- Calcular el salario medio de todos los jugadoes

SELECT AVG(salario) AS salario_medio
FROM jugadores;

#-- obtener salario maximo 

SELECT MAX(salario)
FROM jugadores;

#-- obtener salario minimo
SELECT MIN(salario)
FROM jugadores;

#-- calcular la media de altura de los jugadores del equipo 1

SELECT AVG(altura) AS media_altura
FROM jugadores
WHERE equipo=1;

#-- obtener el salario mas alto el mas bajo y la diferencia entre ambos

SELECT MAX(salario) AS maximo, MIN(salario) AS minimo, MAX(salario)-MIN(salario)AS diferencia
FROM jugadores;

#--Muestra el numero de jugadores por equipo

SELECT equipo, COUNT(*) AS num_jugadores_equipo
FROM jugadores
GROUP BY equipo;

#--muestra la altura media por equipo

SELECT equipo, AVG(altura)  as "altura media"
FROM jugadores
GROUP BY equipo;

#--jugador que mas cobra de cada equipo

SELECT equipo, MAX(salario) AS "salario maximo"
FROM jugadores
GROUP BY equipo;

#--Muesra la mayor altura por posicion

SELECT puesto, MAX(altura) AS "mayor altura"
FROM jugadores
GROUP BY puesto
ORDER BY MAX(altura) desc;

#-- muestra la maxima al tura por cada posicion, 
#-- Pero solo para aquellas posiciones cuya altura media sea superior a 2.00m

SELECT puesto, MAX(altura) AS "mayor altura"
FROM jugadores
GROUP BY puesto
HAVING AVG(altura)>2.00
ORDER BY MAX(altura) desc;

#--Medai de altura para la posicion de alero

SELECT puesto,AVG(altura)
FROM jugadores
WHERE puesto="alero";

#--Salario medio para cada puesto,
#-- pero solo para aquellos puestos cuyo salario medio sea superior a 95000


SELECT puesto, avg(salario)
FROM jugadores
GROUP BY puesto
HAVING AVG(salario)>95000
order by AVG(salario) desc;

#-- salario medio de cada equipo pereo solo para qeullos equipo cuya media sea superior a 80000

SELECT equipo, avg(salario)
FROM jugadores
GROUP BY equipo
HAVING AVG(salario)>80000
order by AVG(salario) desc;

##-- SUBCONSULTAS

#--Datos de los jugadores cuyo salario sea mayor que el de llull

SELECT *
FROM jugadores
WHERE salario> (SELECT salario
				FROM jugadores
				WHERE apellido LIKE 'Llull');


--se resuelve de la siguiente manera en dos partes primero seria esta consulta

SELECT salario
FROM jugadores
WHERE apellido LIKE 'Llull';

--y despues esta otra consulta, unidas daria como resultado la consulta principal

SELECT *
FROM jugadores
WHERE salario>100000;

#--Mostrar el nombre, apellido y altura de los jugadores
#--qu midan lo mimso que Alberto diaz
#--a)Subconsulta
	
SELECT altura
FROM jugadores
WHERE nombre LIKE 'Alberto' AND apellido LIKE 'Diaz';

#--Consulta Final

SELECT nombre, apellido, altura
FROM jugadores
WHERE altura IN (SELECT altura
				 FROM jugadores
				 WHERE nombre LIKE 'Alberto' and apellido LIKE 'Diaz');
				 
#--Mostrar nombre y apellido de los jugadores
#--que jueguen en la misma posicion que Sergio llull
#--a)Subconsulta

SELECT puesto
FROM jugadores
WHERE nombre LIKE'Sergio' and apellido LIKE'Llull';

#--Consulta Final

SELECT nombre, apellido
FROM jugadores 
WHERE puesto IN (SELECT puesto
				 FROM jugadores
				 WHERE nombre LIKE'Sergio' and apellido LIKE'Llull' );
				 

#--#--Mostrar nombre y apellido de los jugadores
#--que jueguen en la misma posicion que Sergio llull
#--sin incluir a llull
#--a)Subconsulta

SELECT nombre, apellido
FROM jugadores 
WHERE puesto IN (SELECT puesto
				 FROM jugadores
				 WHERE nombre LIKE'Sergio' AND apellido LIKE'Llull' ) AND NOT (nombre LIKE'Sergio' AND apellido LIKE'Llull');

#-- Mostrar nombre y apellido de los compañeros de equipo de Rudy Fernanddez, sin incluirlo a el
#--a)Subconsulta

SELECT equipo
FROM jugadores
WHERE nombre LIKE 'Rudy' AND apellido LIKE 'Fernandez';

SELECT nombre, apellido
FROM jugadores
WHERE equipo IN(SELECT equipo
				FROM jugadores
				WHERE nombre LIKE 'Rudy' AND apellido LIKE 'Fernandez') AND NOT (nombre LIKE 'Rudy' AND apellido LIKE 'Fernandez');

#--Obterner el nombre, apellido y salario de los jugadores que cobren menos
#--que el salario medio de la liga
#-- subconsulta 

SELECT AVG(salario)
FROM jugadores;

#--consulta Final

SELECT nombre, apellido, Salario
FROM jugadores
WHERE salario< (SELECT AVG(salario)
				FROM jugadores);
				
#-- obtener el nombre , apellido y sueldo del jugador que mas cobra de laa liga
#--primera solucion

SELECT nombre, apellido, salario
FROM jugadores
ORDER BY salario DESC
LIMIT 1;

#--segunda solucion

SELECT nombre, apellido, salario
FROM jugadores
WHERE salario IN(SELECT MAX(salario) FROM jugadores);

#--tercera solucion

SELECT nombre, apellido, salario
FROM jugadores
WHERE salario>=ALL(SELECT salario FROM jugadores);

#-- Nombre de los jugadores que ganen mas que todos los jugadores del equipo 3
#--a)Subconsulta
SELECT MAX(salario) FROM jugadores WHERE equipo=3;

#--Consulta final (version 1)

SELECT nombre, salario
FROM jugadores
WHERE salario>(SELECT MAX(salario)
			   FROM jugadores
			   WHERE equipo=3);

#--Consulta equivalente (version 2)

SELECT nombre
FROM jugadores
WHERE salario > ALL(SELECT salario
					FROM jugadores
					WHERE equipo=3);

#--Nombre y salario de los jugadores que ganen mas que algun jugador del equipo 2

#--Consulta final (version 1)

SELECT nombre, salario
FROM jugadores
WHERE salario>(SELECT MIN(salario)
			   FROM jugadores
			   WHERE equipo=2);
			   
#--Consulta equivalente (version 2)

SELECT nombre, salario
FROM jugadores
WHERE salario > ANY(SELECT salario
					FROM jugadores
					WHERE equipo=2);
					
#--Datos de los jugadores que midan los mismo que alguno del equipo 6

SELECT *
FROM jugadores
WHERE altura IN(SELECT altura FROM jugadores WHERE equipo=6);

#--La anterior pero sin incluir al equipo 6

SELECT *
FROM jugadores
WHERE altura IN(SELECT altura FROM jugadores WHERE equipo=6) AND NOT equipo=6;

#--datos de los jugadores que jueguen en madrid
#--a)subconsulta

SELECT id_equipo
FROM equipos
WHERE ciudad='Madrid';

#--Consulta final

SELECT *
FROM jugadores
WHERE equipo IN(SELECT id_equipo
				FROM equipos
				WHERE ciudad='Madrid');
				
#--PRODUCTO CARTESIANO
				
#--nombre, apellido y puesto de jugador junto al nombre del equipo en el que  juega

SELECT J.nombre AS "Nombre de jugador", apellido, puesto, E.Nombre AS "Nombre del equipo"
FROM jugadores J, equipos E				
WHERE J.equipo=E.id_equipo;

#-- Numero de jugadores de cada equipo indicando el nombre del equipo
SELECT E.nombre AS "Nombre de equipo", COUNT(*) AS "Numero de jugadores"
FROM jugadores J, equipos E
WHERE J.equipo=E.id_equipo
GROUP BY E.nombre;
				
#--numero de jugadores de equipos que la ciudad empiece por m

SELECT COUNT(*) AS "Numero de jugadores"
FROM jugadores J, equipos E
WHERE J.equipo=E.id_equipo and E.ciudad LIKE 'M%';

#--nombre y apellido de cada jugador junto con el nombre del equipo en el que juega

SELECT CONCAT(J.nombre," ",apellido) AS jugador, E.Nombre AS Equipo
FROM jugadores J, equipos E				
WHERE equipo=id_equipo;

#--CON INNER JOIN

SELECT CONCAT(jugadores.nombre," ",apellido) AS jugador, equipos.nombre AS Equipo
FROM jugadores INNER JOIN equipos ON equipo=id_equipo;	

#--nombre de cada equipo junto al numero de partidos que han disputado como locales

SELECT nombre, COUNT(*) AS "numero de partidos"
FROM equipos , partidos 
WHERE id_equipo=elocal
GROUP BY nombre;

#-- Nombre de cada equipo y salario maximo de entre todos sus jugadores

SELECT equipos.nombre, MAX(salario) AS "Salario maximo"
FROM equipos, jugadores
WHERE equipo=id_equipo
GROUP BY equipos.nombre;

#--CON INNER JOIN

SELECT equipos.nombre, MAX(salario) AS "salario maximo de todos los jugadores"
FROM equipos INNER JOIN jugadores ON equipo=id_equipo
GROUP BY equipos.nombre;

#--
				

				
