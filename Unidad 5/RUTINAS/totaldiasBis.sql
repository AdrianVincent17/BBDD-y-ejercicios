
DROP FUNCTION IF EXISTS totaldiaBis;

DELIMITER $$

CREATE FUNCTION totaldiasBis(f DATE) RETURNS INT

BEGIN 
	DECLARE total INT;
	 SET total=totalDias(f);
	 IF(bisiesto(year(f))) THEN 
		IF MONTH(f)>2 THEN
			SET total=total+1;
		END IF;
	END IF;
	
	RETURN total;



END $$

DELIMITER ; 