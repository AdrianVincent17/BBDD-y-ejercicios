#-- Funcion que recibe como parametro una fecha 
#-- y devuelve el numero de dias transcurridos desd que comenzo el año.
#-- Ejemplo:
#-- 5 enero: 5; 1 febrero: 32; 31 diciembre: 365;
#-- No se tendran en cuenta años bisiestos

DROP FUNCTION IF EXIST totalDias;

DELIMITER $$

CREATE FUNCTION totalDias(f DATE) RETURNS INT
	
BEGIN
	DECLARE total INT;
	
	CASE month(f)
		WHEN 1 THEN SET total=Day(f)+0;
		WHEN 2 THEN SET total=Day(f)+31;
		WHEN 3 THEN SET total=Day(f)+31+28;
		WHEN 4 THEN SET total=Day(f)+31+28+31;
		WHEN 6 THEN SET total=Day(f)+31+28+31+30+31;
		WHEN 7 THEN SET total=Day(f)+31+28+31+30+31+30;
		WHEN 8 THEN SET total=Day(f)+31+28+31+30+31+30+31;
		WHEN 9 THEN SET total=Day(f)+31+28+31+30+31+30+31+31;
		WHEN 10 THEN SET total=Day(f)+31+28+31+30+31+30+31+31+30;
		WHEN 11 THEN SET total=Day(f)+31+28+31+30+31+30+31+31+30+31;
		WHEN 12 THEN SET total=Day(f)+31+28+31+30+31+30+31+31+30+31+30;

	END CASE;

	RETURN total;

END $$

DELIMITER ;

SELECT totalDias() AS 'TOTAL DIAS TRANSCURRIDOS';