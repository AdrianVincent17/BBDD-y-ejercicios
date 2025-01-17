
/*Consultas ligabasket*/

#--1

SELECT *
FROM equipos
WHERE ciudad NOT LIKE 'M%';

#--2

SELECT *
FROM jugadores
WHERE salario >=ALL(SELECT MAX(salario) 
					FROM jugadores);

#--3

SELECT equipo, SUM(altura) AS "SUMA TOTAL ALTURAS"
FROM jugadores
GROUP BY equipo;

#--4

SELECT equipo, SUM(salario) AS "salario total"
FROM jugadores
GROUP BY equipo;

#--5

SELECT equipo, SUM(salario)
FROM jugadores			  
GROUP BY equipo
ORDER BY SUM(salario) DESC
LIMIT 1;
			   
#--6 

SELECT elocal AS "equipo local", COUNT(*) AS "numero de partidos"
FROM partidos
WHERE elocal=3;

#--7

SELECT COUNT(*) AS "numero de partidos"
FROM partidos
WHERE elocal IN(SELECT id_equipo
				FROM equipos
				WHERE nombre
				LIKE '%Valencia%');

#--8

SELECT nombre, apellido
FROM jugadores
WHERE equipo IN(SELECT id_equipo 
				FROM equipos 
				WHERE nombre 
				LIKE '%Madrid%');

#--9

SELECT nombre, apellido
FROM jugadores
WHERE id_jugador IN(SELECT DISTINCT (id_capitan) 
					FROM jugadores);

#--10

SELECT equipo
FROM jugadores
GROUP BY equipo
HAVING COUNT(*)>3;
