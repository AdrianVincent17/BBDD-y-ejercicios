/* calcular diferencia de goles*/

DROP FUNCTION IF EXISTS diferenciagoles;

DELIMITER $$

CREATE FUNCTION diferenciagoles(equi INT) RETURNS INT

BEGIN
	DECLARE golesFav, golesCon INT;
		SET golesFav=(SELECT SUM(golesL) FROM partidos WHERE eqlocal=equi)+(SELECT SUM(golesV) FROM partidos WHERE eqvisit=equi);
		SET golesCon=(SELECT SUM(golesL) FROM partidos WHERE eqvisit=equi)+(SELECT SUM(golesV) FROM partidos WHERE eqlocal=equi);
	RETURN golesFav-golesCon;
END $$

DELIMITER ;

SELECT diferenciagoles(1);