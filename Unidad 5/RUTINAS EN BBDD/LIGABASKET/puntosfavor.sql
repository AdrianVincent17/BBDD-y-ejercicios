

DROP FUNCTION IF EXISTS puntosfavor;

DELIMITER $$

CREATE FUNCTION puntosfavor(equipo INT) RETURNS INT 

BEGIN

	DECLARE sumaL, sumaV INT;
	
	SET sumaL=(SELECT SUM(PuntosL) FROM Partidos WHERE elocal=equipo);
	SET sumaV=(SELECT SUM(PuntosV) FROM Partidos WHERE evisit=equipo);
	
	RETURN IFNULL(sumaL,0)+IFNULL(sumaV,0);
	
END $$

DELIMITER ;

SELECT puntosfavor(1) AS "TOTAL PUNTOS";