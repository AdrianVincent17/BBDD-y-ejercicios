/*Funcion de ganador de partidos como local o visitante*/

DROP FUNCTION IF EXISTS numvictorias;

DELIMITER $$

CREATE FUNCTION numvictorias(equi INT) RETURNS INT

BEGIN
	DECLARE vicL, vicV INT;
		SET vicL=(SELECT COUNT(*) FROM partidos WHERE eqlocal=equi AND golesL>golesV);
		SET vicV=(SELECT COUNT(*) FROM partidos WHERE eqvisit=equi AND golesV>golesL);
	RETURN vicL+vicV;

END $$

DELIMITER ;

SELECT numvictorias(1) AS "Victorias";