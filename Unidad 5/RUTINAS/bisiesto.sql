#--Funcion que recibe como parametro un año e indique si se trata o no de un año bisiesto
#-- Un año es bisiesto si cumple con los siguientes requisitos:

#-- a) Es divisible entre 4
#-- b) si termina en 00, es divisible entre 400(2000 y 2400 si son bisiestos, 2100, 2200, 2300 no)


DROP FUNCTION IF EXISTS bisiesto;

DELIMITER $$

CREATE FUNCTION bisiesto(a INT) RETURNS BOOLEAN

BEGIN


	IF(a%4!=0) THEN 
		RETURN FALSE;
		
	ELSE 
		IF(a%100=0) THEN 
			IF(a%400=0) THEN 
				RETURN TRUE;
			ELSE
				RETURN FALSE;
			END IF;
		ELSE
			RETURN TRUE;
		END IF;
	END IF;	

END $$

DELIMITER ;

SELECT bisiesto() AS 'BISIESTO'; 