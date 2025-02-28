

DROP PROCEDURE IF EXISTS esconsonante2;

DELIMITER $$

CREATE PROCEDURE esconsonante2(letra CHAR)

BEGIN

	IF UPPER(letra) BETWEEN 'B' AND 'Z' AND UPPER(letra) NOT IN ('A','E','I','O','U') THEN 
		SELECT CONCAT("La letra ",letra," SI es una consonante") AS "CONSONANTE";
	ELSE
		SELECT CONCAT("La letra ",letra," NO es una consonante") AS "CONSONANTE";
	END IF;

END $$

DELIMITER ;

CALL esconsonante2('A');
CALL esconsonante2('b');
CALL esconsonante2('e');
CALL esconsonante2('Z');