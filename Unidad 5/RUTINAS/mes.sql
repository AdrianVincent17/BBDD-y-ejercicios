DROP PROCEDURE IF EXISTS mes;

DELIMITER $$

CREATE PROCEDURE mes(m INT)

BEGIN 
	CASE m
		WHEN 1 THEN SELECT 'Enero' AS 'Mes del año';
		WHEN 2 THEN SELECT 'Febrero' AS 'Mes del año';
		WHEN 3 THEN SELECT 'Marzo' AS 'Mes del año';
		WHEN 4 THEN SELECT 'Abril' AS 'Mes del año';
		WHEN 5 THEN SELECT 'Mayo' AS 'Mes del año';
		WHEN 6 THEN SELECT 'Junio' AS 'Mes del año';
		WHEN 7 THEN SELECT 'Julio' AS 'Mes del año';
		WHEN 8 THEN SELECT 'Agosto' AS 'Mes del año';
		WHEN 9 THEN SELECT 'Septiembre' AS 'Mes del año';
		WHEN 10 THEN SELECT 'Octube' AS 'Mes del año';
		WHEN 11 THEN SELECT 'Noviembre' AS 'Mes del año';
		WHEN 12 THEN SELECT 'Diciembre' AS 'Mes del año';
		ELSE SELECT "No es un mes del año" AS "Error";
	END CASE;
	

END $$

DELIMITER ;

CALL mes();