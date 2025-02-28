/*funcion de victorias del nombre de un equipo pasado como parametro*/

DROP FUNCTION IF EXISTS equipovictorias;

DELIMITER $$

CREATE FUNCTION equipovictorias(equi CHAR(50))RETURNS INT

BEGIN
	DECLARE vicL, vicV INT;
		SET vicL=(SELECT COUNT(*) FROM partidos WHERE eqlocal=(SELECT codEquipo FROM equipos WHERE nombre=equi) AND golesL>golesV);
		SET vicV=(SELECT COUNT(*) FROM partidos WHERE eqvisit=(SELECT codEquipo FROM equipos WHERE nombre=equi) AND golesL<golesV);
	RETURN vicL+vicV;
END $$

DELIMITER ;

SELECT equipovictorias("Real Madrid") AS "NUMERO VICTORIAS";