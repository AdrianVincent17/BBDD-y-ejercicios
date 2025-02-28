


DROP FUNCTION IF EXISTS goleador;

DELIMITER $$

CREATE FUNCTION goleador(jug CHAR(50)) RETURNS INT

BEGIN
	DECLARE golecitos INT;
		SET golecitos=(SELECT COUNT(*) 
					   FROM jugadores,goles 
					   WHERE nombre=jug AND codJugador=jugador
					   GROUP BY jugador);
	RETURN golecitos;
END $$

DELIMITER ;

SELECT goleador("Lamine yamal") AS "Goles jugador";