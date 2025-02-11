
DROP PROCEDURE IF EXISTS diaSemana;

DELIMITER $$

CREATE PROCEDURE diaSemana(d INT)

BEGIN 

	CASE d
		WHEN 1 THEN SELECT 'Lunes' AS 'Dia de la semana';
		WHEN 2 THEN SELECT 'Martes' AS 'Dia de la semana';
		WHEN 3 THEN SELECT 'Miercoles' AS 'Dia de la semana';
		WHEN 4 THEN SELECT 'Jueves' AS 'Dia de la semana';
		WHEN 5 THEN SELECT 'Viernes' AS 'Dia de la semana';
		WHEN 6 THEN SELECT 'Sabado' AS 'Dia de la semana';
		WHEN 7 THEN SELECT 'Domingo' AS 'Dia de la semana';
		ELSE SELECT "No es un dia valido" AS "Error";
		END CASE;

END $$

DELIMITER ;

CALL diaSemana();
