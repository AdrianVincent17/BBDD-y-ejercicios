/*potencia*/
DROP FUNCTION IF EXISTS potencia;

DELIMITER $$

CREATE FUNCTION potencia(a INT,b INT)RETURNS INT
BEGIN 
	DECLARE res, conta INT;
		IF b=0 THEN
			Set res=1;
			return res;
		end if;
		set res=1;
		set conta=0;
		repeat 
			set res=a*res;
			set conta=conta+1;
		until(conta>=b)
		end repeat;
		return res;
END $$

DELIMITER ;

select potencia(5,0);
select potencia(3,2);
select potencia(4,1);
select potencia(2,9);