

DROP FUNCTION IF EXIST fechaOk;

DELIMITER $$

CREATE FUNCTION fechaOk(d INT,m INT,a INT) RETURNS BOOLEAN

BEGIN 
	DECLARE diasmes INT;
		IF(a=0) THEN 
			RETURN FALSE;
		END IF;
		IF(m<1 OR m>12) THEN
			RETURN FALSE;
		END IF;
		
		SET diasmes=31;
		
		IF(m=4 OR m=6 OR m=9 OR m=11) THEN
			SET diasmes=30;
		END IF;
		
		IF(m=2) THEN
			SET diasmes=28;
		END IF;
		
		IF(d<1 OR d>diasmes)THEN 
			RETURN FALSE;
		END IF;
		
		RETURN TRUE;

END $$

DELIMITER ;

SELECT fechaOk() AS "FECHA_CORRECTA";