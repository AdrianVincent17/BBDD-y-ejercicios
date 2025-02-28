/*procedimiento que inserta un jugador en un equipo*/

DROP PROCEDURE IF EXISTS insertajugador;

DELIMITER $$

CREATE PROCEDURE insertajugador(nom CHAR(30), pos CHAR(20), equi INT)

BEGIN
	IF equi IS NOT NULL THEN
	INSERT INTO jugadores VALUES(0,nom,pos,equi);
	END IF;
END $$

DELIMITER ;

CALL insertajugador("Luka Modric","Centrocampista",1);