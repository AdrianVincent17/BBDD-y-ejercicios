
DROP PROCEDURE IF EXISTS posneg;

DELIMITER $$

CREATE PROCEDURE posneg(num INT)

BEGIN 
	IF(num>0) THEN
		SELECT CONCAT(num," es positivo") AS "POSITIVO";
	ELSEIF(num=0) THEN 
		SELECT CONCAT(num," es cero") AS "CERO";
	ELSE
		SELECT CONCAT(num," es negativo") AS "NEGATIVO";
	END IF;

END $$

DELIMITER ;

call posneg(0);