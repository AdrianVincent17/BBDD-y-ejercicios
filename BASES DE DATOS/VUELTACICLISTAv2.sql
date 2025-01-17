

/*Consultas vuelta ciclista v2*/

#--1

SELECT nombre
FROM Ciclista
WHERE dorsal IN(SELECT dorsal FROM Etapa)
ORDER BY nombre;


#--2

SELECT nombre, nomequipo
FROM Ciclista
WHERE dorsal IN(SELECT dorsal FROM Etapa) AND edad<30;

#--3

SELECT Ciclista.nombre,Ciclista.nomequipo AS "nombre del equipo"
FROM Ciclista, Lleva, Maillot, Etapa
WHERE Ciclista.dorsal=Etapa.dorsal AND Lleva.numetapa=Etapa.numetapa 
AND Ciclista.dorsal=Lleva.dorsal AND Maillot.código=Lleva.código AND color LIKE 'amarillo';

#--4

SELECT nombre,nomequipo AS "nombre del equipo"
FROM Ciclista
WHERE dorsal IN (SELECT dorsal FROM Lleva) OR dorsal IN (SELECT dorsal FROM Puerto);

#--5

SELECT dorsal, nombre, edad
FROM Lleva, Ciclista
WHERE Lleva.dorsal=Ciclista.dorsal
GROUP BY dorsal, numetapa, nombre, edad
HAVING COUNT(*)>=2;

#--6

SELECT Ciclista.nombre,Ciclista.nomequipo AS "nombre del equipo"
FROM Ciclista, Lleva, Maillot
WHERE Ciclista.dorsal=Lleva.dorsal AND Maillot.código=Lleva.código 
AND color LIKE 'amarillo' AND Lleva.numetapa IN(SELECT MAX(numetapa) FROM Etapa);

#--7

SELECT nombre
FROM Ciclista
WHERE dorsal IN(SELECT dorsal FROM Puerto WHERE altura IN (SELECT Max(altura) FROM Puerto));

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
#--20
#--21
#--22
#--23
#--24
#--25