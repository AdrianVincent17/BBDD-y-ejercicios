

DROP PROCEDURE IF EXISTS fechaOKI;

DELIMITER $$

CREATE PROCEDURE fechaOKI(d INT,m INT,a INT)

BEGIN 
	DECLARE fechita, bisiesto, mayoredad BOOLEAN;
	DECLARE dia, mes, anio, diasmes,edad INT;
	
	SET dia=DAY(now());
	SET mes=MONTH(now());
	SET anio=YEAR(now());
	SET edad=anio-a;
	
	IF a%4!=0 THEN 
		SET bisiesto=FALSE;
	ELSE	
		IF a%100=0 THEN
			IF a%400=0 THEN
				SET bisiesto=TRUE;
			ELSE
				SET bisiesto=FALSE;
			END IF;
		ELSE
			SET bisiesto=TRUE;
		END IF;
	END IF;
	IF a=0 THEN
		SELECT "El año 0 no existe";
		SET fechita=FALSE;
	ELSE
		
		IF m<1 OR m >12 THEN
			SELECT "El mes es incorrecto";
			SET fechita=FALSE;
		ELSE	
			
			IF m=2 THEN 
				IF bisiesto THEN
				SET diasmes=29;
				ELSE
					SET diasmes=28;
				END IF;
			ELSEIF m IN(4,6,9,11) THEN 
				SET diasmes=30;
			ELSE 
				SET diasmes=31;
			END IF;
			IF d<1 OR d>diasmes THEN
				SELECT "El dia del mes no es correcto";
				SET fechita=FALSE;
			ELSE
				SET fechita=TRUE;
			END IF;
		SET fechita=TRUE;
		END IF;
	
	IF fechita THEN
	 IF (mes < m) OR (mes = m AND dia < d) THEN
            SET edad = edad - 1;
        END IF;
	END IF;
		
			IF edad>=18 THEN
				SELECT CONCAT(edad," años") as edad;
			ELSE
				SELECT CONCAT("no es mayor de edad") as edad;
			END IF;	
	END IF;
	
END $$

DELIMITER ;

call fechaOKI(28,02,2000);
call fechaOKI(29,02,2000);
call fechaOKI(1,02,0);
call fechaOKI(3,2,2100);