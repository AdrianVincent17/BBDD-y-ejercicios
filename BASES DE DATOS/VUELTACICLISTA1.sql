


#--1 Nombre de los ciclistas mayores de 30 años.

SELECT Nombre
FROM ciclista
WHERE edad>30;

#--2 Cantidad de ciclistas mayores de 30 años.

SELECT COUNT(*) AS "Cantidad de ciclistas"
FROM ciclista
WHERE edad>30;

#--3 Cantidad de ciclistas por cada equipo.

SELECT nomequipo, COUNT(*) AS "Cantidad de ciclistas"
FROM ciclista
GROUP BY nomequipo;

#--4 Cantidad total de equipos.

#--5 Localidad de salida y de llegada de la segunda etapa.

#--6 Cantidad total de etapas.

#--7 Cantidad de etapas con salida desde Valladolid.

#--8 Cantidad de etapas que ha ganado el dorsal 1.

#--9 Nombre y altura de los puertos que superen los 1500 metros.

#--10 Cantidad de puertos cuya altura es superior a 1500 metros.

#--11 Para las etapas donde se suben puertos, mostrar el número de etapa y la cantidad de puertos que tiene.

#--12 Para las etapas donde se suben más de dos puertos, mostrar el número de etapa y la cantidad de puertos que tiene.

#--13 Dorsal de los ciclistas que hayan ganado alguna etapa, junto con la cantidad de etapas ganadas.

#--14 Dorsal de los ciclistas que hayan ganado más de una etapa, junto con la cantidad de etapas ganadas.

#--15 Dorsal del ciclista que haya ganado más etapas, junto con la cantidad de etapas ganadas.

#--16 Cantidad total de kilómetros recorridos al final de la vuelta.

#--17 Kilómetros de la etapa más larga.

#--18 Media de altura de los puertos.

#--19 Datos de los puertos que se suben en la etapa número 10.

#--20 Altura del puerto más alto que se sube en la etapa número 10.
