

DROP PROCEDURE IF EXISTS infofutbol;

DELIMITER $$

CREATE PROCEDURE infofutbol(equi INT)

BEGIN 
	DECLARE victorias INT;
	DECLARE derrotas INT;
	DECLARE empates INT;
	DECLARE puntos INT;
	DECLARE golesfavor INT;
	DECLARE golesLo INT;
	DECLARE golesVi INT;
	DECLARE golescontra INT;
	DECLARE golesLo2 INT;
	DECLARE golesVi2 INT;
	DECLARE golestotales INT;
	DECLARE totalpartidos INT;
	DECLARE nombres VARCHAR(50);
	DECLARE contaL, contaV INT;
	DECLARE maxgoleador VARCHAR(50);
	DECLARE golesjug INT;
	
	SET contaL=(SELECT COUNT(*) FROM partidos WHERE eqlocal=equi AND golesL>golesV);
	SET contaV=(SELECT COUNT(*) FROM partidos WHERE eqvisit=equi AND golesV>golesL);
	SET victorias=contaL+contaV;
	
	SET empates=(SELECT COUNT(*) FROM partidos WHERE (eqlocal=equi OR eqvisit=equi) AND golesL=golesV);
	SET totalpartidos=(SELECT COUNT(*) from partidos WHERE eqlocal=equi OR eqvisit=equi);
	SET derrotas=totalpartidos-victorias-empates;
	
	SET golesLo=(SELECT SUM(golesL) FROM partidos WHERE eqlocal=equi);
	SET golesVi=(SELECT SUM(golesV) FROM partidos WHERE eqvisit=equi);
	SET golesfavor=IFNULL(golesLo,0)+IFNULL(golesVi,0);
	
	SET golesLo2=(SELECT SUM(golesL) FROM partidos WHERE eqvisit=equi);
	SET golesVi2=(SELECT SUM(golesV) FROM partidos WHERE eqlocal=equi);
	SET golescontra=IFNULL(golesLo2,0)+IFNULL(golesVi2,0);
	
	SET golestotales=IFNULL(golesfavor,0)+IFNULL(golescontra,0);
	
	
	
	
	
	SET nombres=(SELECT nombre FROM equipos WHERE codEquipo=equi);
	SET puntos=(victorias*3)+empates;
	
	SET maxgoleador=(SELECT nombre
					 FROM goles, jugadores  
					 WHERE jugador = codJugador AND equipo=equi
					 GROUP BY jugador
					 ORDER BY COUNT(*) DESC
					 LIMIT 1);
					 
	SET golesjug=(SELECT COUNT(*)
					 FROM goles, jugadores  
					 WHERE jugador = codJugador AND equipo=equi
					 GROUP BY jugador
					 ORDER BY COUNT(*) DESC
					 LIMIT 1);
	
	SELECT nombres,puntos,totalpartidos,victorias,derrotas,empates,golesfavor,golescontra,golestotales,maxgoleador,golesjug;
	

END $$

DELIMITER ;

call infofutbol(1);