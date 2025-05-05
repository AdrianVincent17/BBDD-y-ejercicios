

DROP PROCEDURE IF EXISTS horacanaria;

DELIMITER $$

CREATE PROCEDURE horacanaria()

BEGIN 
	DECLARE h, m, s int;
	DECLARE resh,resm,resS VARCHAR(30);
	set h=HOUR(NOW());
	set m=MINUTE(NOW());
	set s=SECOND(NOW());
	
	
	IF h<10 THEN
		SET resh=CONCAT(0,h,":");
	ELSE
		SET resh=CONCAT(h,":");
	END IF;
	
	IF m<10 THEN
		SET resm=CONCAT(0,m,":");
	ELSE
		SET resm=CONCAT(m,":");
	END IF;
		
	IF s<10 THEN 
		SET resS=CONCAT(0,s);
	ELSE
		SET resS=CONCAT(s);
	END IF;

	select concat("Hora en canarias: ",resh-1,":",resm,resS) as hora_canaria, concat("hora normal: ",resh,resm,resS) as hora_normal;


END $$

DELIMITER ;

call horacanaria();