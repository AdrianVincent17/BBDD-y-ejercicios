/*restando minuto*/


DROP PROCEDURE IF EXISTS horaminminus;

DELIMITER $$

CREATE PROCEDURE horaminminus(h INT,m INT,s INT)
BEGIN
	DECLARE horamin VARCHAR(20);
	
	
	IF horaOK(h,m,s)=0 THEN 
		SELECT "MAL" AS "HOra introducida incorrecta";
	ELSE 
		SET m=m-1; 
		
		IF m<=0 THEN 
			SET m=59;
			SET h=h-1;
		IF h<=0 THEN 
			SET h=23;
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


CALL horaminminus(23,0,20);
CALL horaminminus(0,0,23);
CALL horaminminus(10,0,23); 

