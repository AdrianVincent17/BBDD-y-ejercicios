
DROP PROCEDURE IF EXISTS fechaNextDay;

DELIMITER $$

CREATE PROCEDURE fechaNextDay(d INT,m INT,a INT)

BEGIN 
	DECLARE diasmes INT;
	IF(fechaOk(d,m,a)=0) THEN
		SELECT CONCAT(d,"/",m,"/",a, "no es correcto");
	ELSE
		SET diasmes=31;
			IF(m=2) THEN
				SET diasmes=28;
			END IF;
			IF(m=4 OR m=6 OR m=9 OR m=11) THEN
				SET diasmes=30;
			END IF;
			
		SET d=d+1;
	IF(d>diasmes) THEN
		SET m=m+1;
		SET d=1;
		
		IF(m>12) THEN
			SET a=a+1;
			SET m=1;
		END IF;
	END IF;
	IF (a=0) THEN
		SET a=a+1;	
	END IF;
	
	SELECT CONCAT(d,"/",m,"/",a) AS "FECHA_CORRECTA";
END IF;
END $$

DELIMITER ;

CALL diasNextDay();