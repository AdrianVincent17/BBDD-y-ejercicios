
DROP DATABASE IF EXISTS alumnado;

CREATE DATABASE alumnado;

USE alumnado;

CREATE TABLE alumno(
id INTEGER AUTO_INCREMENT,
nomAlumno VARCHAR(40) NOT NULL,
nota FLOAT,
PRIMARY KEY(id)
);

/*Trigger 1- comprobar antes de insertar una nota*/

DELIMITER $$

CREATE TRIGGER comprobar_insertar_nota
BEFORE INSERT ON alumno
FOR EACH ROW 
BEGIN
	IF(NEW.nota<0) THEN
		SET  NEW.nota=0;
	ELSEIF(NEW.nota>10) THEN
		SET NEW.nota=10;
	END IF;
END $$

DELIMITER ;

INSERT INTO alumno VALUES(0,'norman redus',11.5);
INSERT INTO alumno VALUES(0,'marlon brando',10.0);
INSERT INTO alumno VALUES(0,'morgan freeman',5);
INSERT INTO alumno VALUES(0,'silvester stalone',-1.5);

/*Trigger 2 comprobar antes de actualizar nota*/

DELIMITER $$

CREATE TRIGGER comprobar_cambiar_nota
BEFORE UPDATE ON alumno
FOR EACH ROW 
BEGIN
	IF NEW.nota<0 THEN
		SET NEW.nota=0;
	ELSEIF NEW.nota>10 THEN
		SET NEW.nota=10;
	END IF;

END $$

DELIMITER ;

select * from alumno;

UPDATE alumno SET nota=11.5 WHERE id=1;
UPDATE alumno SET nota=-1.5 WHERE id=2;
UPDATE alumno SET nota=9 WHERE id=3;

SELECT * FROM alumno;
