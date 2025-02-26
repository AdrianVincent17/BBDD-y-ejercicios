

DROP FUNCTION IF EXISTS puntoscontra;

DELIMITER $$

CREATE FUNCTION puntoscontra(equipo INT) RETURNS INT 

BEGIN

	DECLARE recibidoL, recibidoV INT;
	
	SET recibidoL=(SELECT SUM(PuntosV) FROM Partidos WHERE elocal=equipo);
	SET recibidoV=(SELECT SUM(PuntosL) FROM Partidos WHERE evisit=equipo);
	
	RETURN IFNULL(recibidoL,0)+IFNULL(recibidoV,0);
	
END $$

DELIMITER ;

SELECT puntoscontra(1) AS "TOTAL PUNTOS";