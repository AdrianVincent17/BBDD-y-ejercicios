
DROP FUNCTION IF EXISTS esdivisible;

DELIMITER $$

CREATE FUNCTION esdivisible(numerador INT, denominador INT) RETURNS BOOLEAN

BEGIN 
	DECLARE esdiv BOOLEAN;
	IF (numerador%denominador=0) THEN
		SET esdiv=TRUE;
	ELSE
		SET esdiv=FALSE;
	END IF;
	RETURN esdiv;
	
END $$

DELIMITER ;

SELECT esdivisible(5,6) as esdivisible;