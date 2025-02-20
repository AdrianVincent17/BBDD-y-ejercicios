
DROP PROCEDURE IF EXISTS fechanow;

DELIMITER $$

CREATE PROCEDURE fechanow()
BEGIN

	DECLARE mes INT;
		CASE MONTH(NOW())
			WHEN 1 THEN SET mes="Enero";
			WHEN 2 THEN SET mes="Febrero";
			WHEN 3 THEN SET mes="Marzo";
			WHEN 4 THEN SET mes="Abril";
			WHEN 5 THEN SET mes="Mayo";
			WHEN 6 THEN SET mes="Junio";
			WHEN 7 THEN SET mes="Julio";
			WHEN 8 THEN SET mes="Agosto";
			WHEN 9 THEN SET mes="Septiembre";
			WHEN 10 THEN SET mes="Octubre";
			WHEN 11 THEN SET mes="Noviembre";
			WHEN 12 THEN SET mes="Diciembre";
		END CASE;
		
		SELECT CONCAT(day(now()),mes,year(now())) AS "FECHA_ACTUAL";
			

END $$

DELIMITER ;

CALL fechanow();