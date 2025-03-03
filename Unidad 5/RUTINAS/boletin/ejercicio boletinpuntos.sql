

DROP FUNCTION IF EXISTS punticos;

DELIMITER $$

CREATE FUNCTION punticos(equi INT)RETURNS INT

BEGIN
	DECLARE vicL, vicV, victorias, empates INT;
	
	SET vicL=(SELECT COUNT(*) FROM partidos WHERE eqlocal=equi AND golesL>golesV);
	SET vicV=(SELECT COUNT(*) FROM partidos WHERE eqvisit=equi AND golesL<golesV);
	SET victorias=IFNULL(vicL,0)+IFNULL(vicV,0);
	SET empates=(SELECT COUNT(*) from partidos WHERE (eqlocal=equi OR eqvisit=equi) AND golesL=golesV);
	
	RETURN victorias*3+empates;

END $$

DELIMITER ;

select punticos(1) as "puntos";