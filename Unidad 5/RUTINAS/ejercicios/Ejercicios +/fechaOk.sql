

DROP FUNCTION IF EXISTS fechaOk;

DELIMITER $$

CREATE FUNCTION fechaOk(d INT,m INT,a INT)RETURNS BOOLEAN

BEGIN 
	DECLARE diasmes iNT;
	#--El año 0 no existe y por tanto no es valido
	IF a=0 THEN 
		RETURN FALSE;
	END IF;
		#--Establecemos como base los dias del mes en 31
		SET diasmes=31;
	#--para el mes de febrero solo llega a 28
	IF m=2 THEN 
		SET diasmes=28;
		
			IF(a%4=0 AND a%100!=0) OR (a%400=0) THEN 
				SET diasmes=29;
		END IF;
	END IF;
		
	IF m IN (4, 6, 9, 11) THEN
		
		SET diasmes=30;
	
	END IF;
	
	IF (m>0 AND m<=12) THEN
		IF (d>0 AND d<=diasmes) THEN
			RETURN TRUE;
		END IF;
	ELSE 
		RETURN FALSE;
	END IF;
	
	RETURN FALSE;
	
END $$

DELIMITER ;

SELECT fechaOK(25,2,2025);
SELECT fechaOK(25,2,0);
SELECT fechaOK(29,2,2025);