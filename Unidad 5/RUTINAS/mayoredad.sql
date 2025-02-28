

DROP FUNCTION IF EXISTS mayoredad;

DELIMITER $$

CREATE FUNCTION mayoredad(d INT, m INT, a INT) RETURNS BOOLEAN

BEGIN

	DECLARE dia INT;
	DECLARE mes INT;
	DECLARE anio INT;
	SET anio=YEAR(NOW());
	SET dia=DAY(NOW());
	SET mes=MONTH(NOW());
	
	RETURN (anio-a>18) OR (anio-a = 18) AND (mes> m)  OR (anio-a = 18) AND (mes= m) AND (dia>=d); 
	
	/* IF anio-a>18 THEN
			RETURN FALSE;
		IF mes<m THEN
			RETURN FALSE;
			IF d<dia THEN
				RETURN FALSE;
			END IF;
		END IF;
	ELSE 
		RETURN TRUE;
	END IF; */
	
END $$
DELIMITER ;

SELECT mayoredad(1,2,2000);
SELECT mayoredad(1,1,2010);
SELECT mayoredad(31,12,2001);
SELECT mayoredad(2,2,2006);
SELECT mayoredad(1,3,2016);
SELECT mayoredad(28,2,2006);