/*Sumando minuto*/


DROP PROCEDURE IF EXISTS horaminplus;

DELIMITER $$

CREATE PROCEDURE horaminplus(h INT,m INT,s INT)
BEGIN
	DECLARE horamin VARCHAR(20);
	
	
	IF horaOK(h,m,s)=0 THEN 
		SELECT "MAL" AS "HOra introducida incorrecta";
	ELSE 
		SET m=m+1; 
		
		IF m>59 THEN 
			SET m=0;
			SET h=h+1;
		IF h>23 THEN 
			SET h=0;
		END IF;
		END IF;
		
		IF h<10 THEN 
			SET horamin=CONCAT(0,h,':');
		ELSE 
			SET horamin=CONCAT(h,':');
		END IF;
	
		IF m<10 THEN 
			SET  horamin=CONCAT(horamin,0,m,':');
		ELSE
			SET  horamin=CONCAT(horamin,m,':');
		END IF;
		
		IF s<10 THEN 
			SET horamin=CONCAT(horamin,0,s);
		ELSE 
			SET horamin=CONCAT(horamin,s);
		END IF;
			
		SELECT horamin AS "Minuto después";
	END IF;
END $$
DELIMITER ;


CALL horaminplus(23,59,20);
CALL horaminplus(10,59,23);
CALL horaminplus(10,54,23); 