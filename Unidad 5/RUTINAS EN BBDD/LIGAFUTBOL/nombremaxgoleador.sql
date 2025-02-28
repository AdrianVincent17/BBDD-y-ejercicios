
DROP FUNCTION IF EXISTS nombregoleador;

DELIMITER $$

CREATE FUNCTION nombregoleador(equi CHAR(50)) RETURNS CHAR(50)

BEGIN 
	RETURN (SELECT J.nombre
			FROM jugadores J, goles G, equipos E
			WHERE J.codJugador=G.jugador AND E.codEquipo=equipo AND E.nombre=equi
			GROUP BY J.nombre
			HAVING COUNT(*)
			ORDER BY COUNT(*) DESC
			LIMIT 1);

END $$

DELIMITER ;

SELECT nombregoleador("FC Barcelona") AS "Max goleador Equipo";

