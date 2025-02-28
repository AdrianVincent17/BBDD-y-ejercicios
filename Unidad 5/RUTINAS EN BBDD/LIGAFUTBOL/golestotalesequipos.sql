
/*procedimiento que muestra el numero de goles totales de cada equipo*/

DROP PROCEDURE IF EXISTS golestotalesequipo;

DELIMITER $$

CREATE PROCEDURE golestotalesequipo()

BEGIN 

	SELECT E.nombre, COUNT(*) AS "goles totales"
	FROM equipos E, jugadores J, goles G
	WHERE J.codJugador=G.jugador AND E.codEquipo=J.equipo
	GROUP BY E.nombre;
	
END $$

DELIMITER ;

call golestotalesequipo();