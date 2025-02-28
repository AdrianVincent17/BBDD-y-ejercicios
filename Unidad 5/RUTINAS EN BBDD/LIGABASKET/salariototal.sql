
/*Fucion que devuelve el salatio total de un equipo pasado como parametro*/

DROP FUNCTION IF EXISTS salariototal;

DELIMITER $$

CREATE FUNCTION salariototal(equi CHAR(50)) RETURNS INT

BEGIN 
	 RETURN (SELECT SUM(salario) FROM jugadores WHERE equipo=(SELECT id_equipo FROM equipos WHERE nombre=equi));

END $$

DELIMITER ;

SELECT salariototal("Real Madrid") AS "Salario total";