

DROP PROCEDURE IF EXISTS totalgolesjug;

DELIMITER $$

CREATE PROCEDURE totalgolesjug(jug INT)

BEGIN 
	DECLARE goles INT;
	DECLARE nombrecito CHAR(20);
		SET goles=(SELECT COUNT(*) 
				   FROM goles 
				   WHERE jugador=jug
				   GROUP BY jugador);
				   
		SET nombrecito=(SELECT nombre FROM jugadores
						WHERE codJugador=jug);
		
	SELECT nombrecito,goles;
	
END $$

DELIMITER ;

CALL totalgolesjug(4);