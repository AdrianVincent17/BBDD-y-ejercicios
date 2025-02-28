DROP FUNCTION IF EXISTS bisiesto2;

DELIMITER $$

CREATE FUNCTION bisiesto2(a INT) RETURNS BOOLEAN

BEGIN
    
	#--El año 0 no existe y por tanto no deberia de valer o deber ser falso
    IF a <= 0 THEN
        RETURN FALSE;
   #--si no es divisivle por 4 no es bisiesto
    ELSEIF a % 4 != 0 THEN
        RETURN FALSE;
   #--si es divisible por 100 y no por 400 no es bisiesto pero en caso contrario si seria bisiesto
    ELSEIF a % 100 = 0 AND a % 400 != 0 THEN
        RETURN FALSE;
    #--osea que si es divisible por 4 y por 400 pero no por 100 seria bisiesto
    ELSE
        RETURN TRUE;
    END IF;
END $$

DELIMITER ;

SELECT bisiesto2(1904);
