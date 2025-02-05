
#--funcion que calcula el area de un rectangulo
#--Area=a*b siendo a y b los dos lados diferentes del rectangulo


DROP FUNCTION IF EXISTS arearectangulo;

DELIMITER $$

CREATE FUNCTION arearectangulo(a INT, b INT) RETURNS INT  #--En sql el tipo devuelto en una funcion se pone con el RETURNS al final

BEGIN
	DECLARE area INT;  #--declaramos la variable
	SET area=a*b; 	   #--inicializamos la variable con el SET
	RETURN area;	   #-- como es una funcion nos tiene que devolver un int que se devuelve con el RETURN

END $$

DELIMITER ;

SELECT arearectangulo(5,6) AS "Area";  #--En una funcion a diferencia de un procedimiento se llama a la funcion con un SELECT

