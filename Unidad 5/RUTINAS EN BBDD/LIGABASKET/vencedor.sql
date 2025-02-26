#-- Procedimeinto que muestre por pantalla el nombre del equipo ganador de un partido
#-- El procedimiento recibira como parametro el identificador del partido


DROP PROCEDURE IF EXISTS ganador;

DELIMITER $$

CREATE PROCEDURE ganador(IN p INT)
BEGIN 
	DECLARE resL, resV, vencedor INT;
		SET resL=(SELECT puntosL FROM Partidos WHERE id_partido=p);
		SET resV=(SELECT puntosV FROM Partidos WHERE id_partido=p);

	IF(resL>resV) THEN 
		SET vencedor=(SELECT elocal FROM Partidos WHERE id_partido=p);
	ELSE
		SET vencedor=(SELECT evisit FROM Partidos WHERE id_partido=p);
	END IF;
		
	SELECT nombre AS ganador
	FROM Equipos
	WHERE id_equipo=vencedor;

END $$

DELIMITER ;