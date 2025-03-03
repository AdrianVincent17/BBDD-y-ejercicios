/*procedimiento que muestre el resultado indicado por parametro el id del partido*/

DROP PROCEDURE IF EXISTS resultado;

DELIMITER $$

CREATE PROCEDURE resultado(parti INT)

BEGIN
	DECLARE equiL CHAR(20);
	DECLARE equiV CHAR(20);
	DECLARE resL INT;
	DECLARE resV INT;
	
	SET equiL=(SELECT nombre FROM equipos WHERE codEquipo=(select eqlocal FROM partidos WHERE codPartido=parti));
	SET equiV=(SELECT nombre FROM equipos WHERE codEquipo=(select eqvisit FROM partidos WHERE codPartido=parti));
	
	SET resL=(SELECT golesL from partidos where codPartido=parti);
	SET resV=(SELECT golesV from partidos where codPartido=parti);
	
	SELECT parti as "partido", concat(equiL," ",resL," - ",resV," ",equiV)as "resultado";
END $$

DELIMITER ;

call resultado(1);