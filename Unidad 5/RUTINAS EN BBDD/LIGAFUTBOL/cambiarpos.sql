

DROP PROCEDURE IF EXISTS cambiarposicion;

DELIMITER $$

CREATE PROCEDURE cambiarposicion(nom CHAR(50),pos CHAR(20))

BEGIN
	UPDATE jugadores
	SET posicion=pos
	WHERE nombre=nom;
END $$

DELIMITER ;

CALL cambiarposicion("Jude Bellingham","Delantero");