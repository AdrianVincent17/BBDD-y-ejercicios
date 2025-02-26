

DROP FUNCTION IF EXISTS victorias;

DELIMITER $$

CREATE FUNCTION victorias(equipo INT) RETURNS INT 

BEGIN

	DECLARE contaL, contaV INT;
	
	SET contaL=(SELECT COUNT(*) FROM Partidos WHERE elocal=equipo AND puntosL>puntosV);
	SET contaV=(SELECT COUNT(*) FROM Partidos WHERE evisit=equipo AND puntosL<puntosV);
	RETURN contaL+contaV;
	
END $$

DELIMITER ;

SELECT victorias(1);