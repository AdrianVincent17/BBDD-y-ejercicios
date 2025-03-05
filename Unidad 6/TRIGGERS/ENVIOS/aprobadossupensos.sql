

DROP DATABASE IF EXISTS notas;

CREATE DATABASE notas;

USE notas;

CREATE TABLE Asignatura(
codAsig 	VARCHAR(10),
nomAsig 	VARCHAR(20) NOT NULL,
curso 		VARCHAR(10) NOT NULL,
horas 		INTEGER,
PRIMARY KEY(codAsig)
);

CREATE TABLE Alumno(
codAlum 	INTEGER 	AUTO_INCREMENT,
nomAlum 	VARCHAR(40) NOT NULL,
fechanac 	DATE,
PRIMARY KEY(codAlum)
);

INSERT INTO Alumno VALUES(0,"Jesus Carrasco","1998-02-01");
INSERT INTO Alumno VALUES(0,"Adrian Vicente","1991-02-19");
INSERT INTO Alumno VALUES(0,"Elena Lopez","2002-03-09");
INSERT INTO Alumno VALUES(0,"Uriel Martinez","2000-03-09");

SELECT * FROM Alumno;


CREATE TABLE Nota(
codAlum INTEGER,
codAsig VARCHAR(10),
nota INTEGER,
PRIMARY KEY(codAlum, codAsig),
FOREIGN KEY(codAlum) REFERENCES Alumno(codAlum)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
FOREIGN KEY(codAsig) REFERENCES Asignatura(codAsig)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
/*Creamos triggers*/

SET @aprobados=0;
SET @suspensos=0;

DELIMITER $$

CREATE TRIGGER evaluar_insertar
AFTER INSERT ON Nota
FOR EACH ROW 
BEGIN 
	IF NEW.nota BETWEEN 5 AND 10 THEN
		SET @aprobados=@aprobados+1;
	ELSE
		SET @suspensos=@suspensos+1;
	END IF;
END $$

DELIMITER ;

INSERT INTO Nota VALUES(1,"BD",5);
INSERT INTO Nota VALUES(4,"BD",9);
INSERT INTO Nota VALUES(3,"BD",6);
INSERT INTO Nota VALUES(2,"BD",4);

INSERT INTO Nota VALUES(1,"SI",4);
INSERT INTO Nota VALUES(4,"SI",8);
INSERT INTO Nota VALUES(3,"SI",2);
INSERT INTO Nota VALUES(2,"SI",5);

INSERT INTO Nota VALUES(1,"PR",8);
INSERT INTO Nota VALUES(4,"PR",5);
INSERT INTO Nota VALUES(3,"PR",9);
INSERT INTO Nota VALUES(2,"PR",5);

SELECT @aprobados;
SELECT @suspensos;

DELIMITER $$

CREATE TRIGGER evaluar_eliminar
BEFORE DELETE ON Nota
FOR EACH ROW 
BEGIN 
	IF OLD.nota BETWEEN 5 AND 10 THEN 
		SET @aprobados=@aprobados-1;
	ELSE 
		SET @suspensos=@suspensos-1;
END $$

DELIMITER ;

DELETE FROM Nota WHERE codAsig LIKE "SI";
SELECT @aprobados;
SELECT @suspensos;

DELIMITER $$

CREATE TRIGGER evaluar_actualizar
BEFORE UPDATE ON Nota
FOR EACH ROW 
BEGIN 
	IF (OLD.nota BETWEEN 5 AND 10) AND (NEW.nota <5) THEN
		SET @aprobados=@aprobados-1;
		SET @suspensos=@suspensos+1;
	ELSE 
		SET @aprobados=@aprobados+1;
		SET @suspensos=@suspensos-1;
	END IF;
END $$

DELIMITER ;
