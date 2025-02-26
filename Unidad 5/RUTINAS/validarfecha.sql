DROP PROCEDURE IF EXISTS validarfecha;

DELIMITER $$

CREATE PROCEDURE validarfecha(d INT,m INT,a INT)
BEGIN
	IF fechaok(d,m,a)=1 AND mayoredad(d,m,a)=1 THEN
		SELECT CONCAT(d,"/",m,"/",a) AS MAYOR_EDAD;
	ELSE
		SELECT CONCAT(d,"/",m,"/",a) AS MENOR_EDAD;
	END IF;	
END $$
DELIMITER ;