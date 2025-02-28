/*1*/
SELECT E.nombre
FROM equipos E, partidos P
WHERE codEquipo=eqvisit 
GROUP BY E.nombre
HAVING SUM(golesV)>3;

/*2*/
SELECT nombre
FROM jugadores j, goles G
WHERE posicion='centrocampista' AND jugador=codJugador
GROUP BY nombre
ORDER BY COUNT(*) DESC
LIMIT 1;

/*3*/
SELECT COUNT(*) AS 'Partidos ganados por Real Madrid'
FROM equipos E, partidos P
WHERE eqlocal=codEquipo AND E.nombre='Real Madrid' AND golesL>golesV;

/*4*/
SELECT J.nombre
FROM jugadores J, goles G
WHERE G.jugador=codJugador
GROUP BY J.nombre
HAVING COUNT(*) > (SELECT COUNT(*) FROM goles, jugadores J 
					WHERE J.nombre='Nico Williams' 
					AND jugador=codJugador);
	
/*5*/	
SELECT COUNT(*) AS 'Goles de Lamine Yamal en primera parte'
FROM jugadores J, goles G
WHERE G.jugador=codJugador AND J.nombre='Lamine Yamal' AND minuto<=45;

/*6*/
SELECT COUNT(*) AS 'Nº goles Athletic'
FROM jugadores J, equipos E, goles G
WHERE codEquipo=J.equipo AND G.jugador=codJugador AND E.nombre='Athletic Club';

/*7*/
SELECT nombre
FROM equipos
WHERE nombre NOT IN (SELECT E.nombre
					FROM equipos E, partidos P
					WHERE codEquipo=eqlocal AND golesL>golesV);
					
/*8*/
SELECT DISTINCT E.nombre
FROM equipos E, partidos P
WHERE (codEquipo=eqlocal OR codEquipo=eqvisit) AND golesL=golesV;

/*9*/
SELECT J.nombre, COUNT(*) AS 'Nº goles'
FROM jugadores J, goles G
WHERE J.posicion='defensa' AND codJugador=jugador
GROUP BY J.nombre
HAVING COUNT(*)>1;

/*10*/
SELECT COUNT(*) AS 'Nº partidos jugados en noviembre ganados por visitante'
FROM Partidos
WHERE month(fecha)=11 AND golesV>golesL;
