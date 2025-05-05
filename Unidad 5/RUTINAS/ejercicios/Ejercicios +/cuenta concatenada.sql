

DROP PROCEDURE IF EXISTS contardesdeNaN;

DELIMITER $$

CREATE PROCEDURE contardesdeNaN(a INT,b INT)
BEGIN
	DECLARE conta INT;
	DECLARE cad VARCHAR(50);
	set cad="";
	
	IF(a>b) THEN 
		SET conta=a;
		repeat 
			SET cad=concat(cad,conta," ");
			SET conta=conta-1;
		until(conta<b)
		end repeat;
		select trim(cad) as cuenta;
	END IF;
	
	IF(b>a) THEN
		SET conta=a;
		repeat 
			SET cad=concat(cad,conta," ");
			set conta=conta+1;
		until(conta>b)
		end repeat;
		select trim(cad) as cuenta;
	end if;
	
END $$

DELIMITER ;

call contardesdeNaN(10,1);