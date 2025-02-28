
/*FUNCION Total goles de un jugador*/

DROP FUNCTION IF EXISTS totalgoles;

DELIMITER $$

CREATE FUNCTION totalgoles(j INT) RETURNS INT

BEGIN
	DECLARE total INT;
		SET total=(SELECT COUNT(*) FROM goles WHERE jugador=j GROUP BY jugador);
	
	RETURN total;


END $$

DELIMITER ;

SELECT totalgoles(7);