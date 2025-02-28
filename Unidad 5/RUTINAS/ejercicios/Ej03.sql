
DROP FUNCTION IF EXISTS esdivisible;

DELIMITER $$

CREATE FUNCTION esdivisible(numerador INT, denominador INT) RETURNS BOOLEAN

BEGIN 

	IF (numerador%denominador=0) THEN
		 RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;
	
	
END $$

DELIMITER ;

SELECT esdivisible(5,6) as esdivisible;