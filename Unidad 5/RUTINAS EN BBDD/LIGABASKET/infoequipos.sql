

DROP PROCEDURE IF EXISTS infoequipo;

DELIMITER $$

CREATE PROCEDURE infoequipo(equipo INT)

BEGIN 
	
	DECLARE nombrequipo VARCHAR(50);
	DECLARE numvictorias INT;
	DECLARE numderrotas INT;
	DECLARE puntoF INT;
	DECLARE puntoC INT;
	DECLARE totaljugados INT;
	
	SET nombrequipo=(SELECT nombre FROM equipos WHERE id_equipo=equipo);
	SET numvictorias=victorias(equipo);
	SET totaljugados=(SELECT COUNT(*) FROM partidos WHERE elocal=equipo OR evisit=equipo);
	SET numderrotas=totaljugados-numvictorias;
	SET puntoF=puntosfavor(equipo);
	SET puntoC=puntoscontra(equipo);
	
	
	SELECT nombrequipo as "Nombre",numvictorias as "Victorias",numderrotas as "Derrotas",puntoF as "Puntos a favor",puntoC AS "Puntos en contra";
	
END $$

DELIMITER ;

CALL infoequipo(1);