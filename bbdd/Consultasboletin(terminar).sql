 /* Boletin vuelta ciclista 2024*/
 
#--1 NOMBRE DEL CICLISTA Y SU EQUIPO QUE TENGAN CICLISTAS MAS DE 32 AÑOS DE EDAD

SELECT DISTINCT nombre, nomequipo
FROM Ciclista C, Puerto P
WHERE C.dorsal=P.dorsal AND edad>32;

#--2 NOMBRE DE LOS CICLISTAS QUE HAYAN GANADO ALGUNA ETAPA DE LA ETAPA MAS LARGA

SELECT nombre
FROM Ciclista C, Etapa E
WHERE E.numetapa=C.numetapa AND E.numetapa IN(SELECT numetapa FROM Etapa WHERE kms IN(SELECT max(kms) FROM Etapa));

#--3 NOMBRE DE LOS CICLISTAS QUE HAYAN GANADO MAS DE UNA ETAPA 

SELECT nombre
FROM Ciclista
WHERE dorsal IN(SELECT dorsal FROM Etapa) 


#--4 NOMBRE Y DIRECTOR DEL EQUIPO QUE SUS CICLISTAS HAYAN GANADO CON EL MAILLOT AMARILLO Y NUMERO DE ETAPAS GANADAS

SELECT E.nombre, E.director, COUNT(*) AS "Etapas ganadas"
FROM Equipo E, Ciclista C, Lleva LL, Maillot M
WHERE E.nomequipo=C.nomequipo AND C.dorsal=LL.dorsal AND LL.código=M.código AND M.color LIKE 'amarillo'
GROUP BY E.nombre, E.director, LL.numetapa;


#--5 MUESTRA LOS DATOS DE LAS ETAPAS QUE TENGAN PUERTO Y TENGAN LA SALIDA EN EL MISMO SITIO QUE LA LLEGADA 

SELECT DISTINCT E.*
FROM Etapa E, Puerto P
WHERE E.numetapa=P.numetapa AND E.numetapa IN(SELECT numetapa FROM Etapa WHERE llegada = salida);

#--6 MUESTRA LA SALIDA Y LA LLEGADA DE LOS PUERTOS QUE TENGAN MAXIMA ALTURA 

SELECT salida, llegada
FROM Etapa E, Puerto P
WHERE E.numetapa=P.numetapa AND P.numetapa IN(SELECT numetapa FROM Puerto GROUP BY numetapa HAVING MAX(altura));


#--7 NOMBRE DE LOS CICLISTAS QUE HAN GANADO ALGUNA ETAPA QUE NO TIENE PUERTO 

SELECT nombre
FROM Ciclista C, Etapa E, Puerto P
WHERE C.numetapa=E.numetapa AND C.dorsal=P.dorsal AND C.dorsal NOT IN(SELECT dorsal FROM Puerto);


#--8 NOMBRE DE LOS CICLISTASS QUE HAN GANADO MAS ETAPAS

SELECT nombre
FROM Ciclista
WHERE dorsal IN(SELECT dorsal FROM Etapa ORDER BY COUNT(*) DESC);

#--9 NUMERO DE PUERTOS QUE TIENE COMO SALIDA IGUALADA Y LLEGADA EN ANDORRA

SELECT COUNT(*) AS "Nº puertos"
FROM Puerto P, Etapa E
WHERE P.numetapa=E.numetapa AND salida LIKE 'Igualada' AND llegada LIKE 'Andorra';

#--10 NOMBRE DEL CICLISTA QUE HA GANAO ALGUNA ETAPA Y ALGUN PUERTO DE MAS DE 2000 METROS DE ALTURA

SELECT nombre
FROM Ciclista C, Etapa E, Puerto P
WHERE C.numetapa=E.numetapa AND C.dorsal=P.dorsal AND E.dorsal=P.dorsal AND P.altura IN(SELECT altura FROM Puerto WHERE altura>2000) 
AND P.altura NOT IN(SELECT altura FROM Puerto WHERE altura<=2000) 



	