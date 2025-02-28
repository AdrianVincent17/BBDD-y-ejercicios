/*Procedimiento que actualiza los goles local y visitante de un partido*/

DROP PROCEDURE IF EXIST actualizargoles;

DELIMITER $$

CREATE PROCEDURE actualizargoles(idpart INT, glocal INT, gvisit INT)

BEGIN 
	UPDATE partidos
	SET golesL=glocal, golesV=gvisit
	WHERE codPartido=idpart;
END $$

DELIMITER ;

CALL actualizargoles();