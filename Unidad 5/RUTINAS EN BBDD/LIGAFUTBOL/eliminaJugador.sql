/*procedimietno que elimina a los jugadores y el equipo entero*/

DROP PROCEDURE IF EXISTS eliminaequipo;

DELIMITER $$

CREATE PROCEDURE eliminaequipo(equi CHAR(50))

BEGIN 

	DELETE FROM jugadores
	WHERE equipo=(SELECT codEquipo FROM equipos WHERE nombre=equi);
	DELETE FROM equipos
	WHERE nombre=equi;
	

END $$

DELIMITER ;

CALL eliminaequipo("Valencia CF");