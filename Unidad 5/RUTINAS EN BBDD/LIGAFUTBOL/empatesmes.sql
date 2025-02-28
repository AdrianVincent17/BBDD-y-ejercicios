/*funcion que devuelve el numero de empates en un mes*/

DROP FUNCTION IF EXISTS empatesmes;

DELIMITER $$

CREATE FUNCTION empatesmes(mes INT) RETURNS INT

BEGIN
	DECLARE emp INT;
		SET emp=(SELECT COUNT(*) FROM partidos WHERE golesL=golesV AND month(fecha)=mes);
	RETURN emp;

END $$

DELIMITER ;

SELECT empatesmes(2);