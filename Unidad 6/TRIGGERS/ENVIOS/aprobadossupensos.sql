

DROP DATABASE IF EXISTS notas;

CREATE DATABASE notas;

USE notas;

CREATE TABLE Asignatura(
codAsig 	VARCHAR(10),
nomAsig 	VARCHAR(50) NOT NULL,
curso 		VARCHAR(10) NOT NULL,
horas 		INTEGER,
PRIMARY KEY(codAsig)
);

INSERT INTO Asignatura VALUES("BBDD","BASES DE DATOS","1o DAW",6);
INSERT INTO Asignatura VALUES("SSII","SISTEMAS INFORMATICOS","1o DAW",8);
INSERT INTO Asignatura VALUES("EEDD","ENTORNOS DE DESARROLLO","2o DAW",3);
INSERT INTO Asignatura VALUES("DIW","DISEÑO INTERFACES WEB","2o DAW",6);

SELECT * FROM Asignatura;

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



INSERT INTO Nota VALUES(1,"BBDD",5);
INSERT INTO Nota VALUES(4,"BBDD",9);
INSERT INTO Nota VALUES(3,"BBDD",6);
INSERT INTO Nota VALUES(2,"BBDD",4);

INSERT INTO Nota VALUES(1,"SSII",4);
INSERT INTO Nota VALUES(4,"SSII",8);
INSERT INTO Nota VALUES(3,"SSII",2);
INSERT INTO Nota VALUES(2,"SSII",5);

INSERT INTO Nota VALUES(1,"DIW",8);
INSERT INTO Nota VALUES(4,"DIW",5);
INSERT INTO Nota VALUES(3,"DIW",9);
INSERT INTO Nota VALUES(2,"DIW",5);

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
	END IF;
END $$

DELIMITER ;

DELETE FROM Nota WHERE codAsig LIKE "SSII";
SELECT @aprobados;
SELECT @suspensos;

DELIMITER $$

CREATE TRIGGER evaluar_actualizar
BEFORE UPDATE ON Nota
FOR EACH ROW 
BEGIN 
	IF OLD.nota >= 5 THEN
		IF NEW.nota < 5 THEN
			SET @aprobados=@aprobados-1;
			SET @suspensos=@suspensos+1;
		END IF;
	ELSE
		IF NEW.nota >= 5 THEN
			SET @aprobados=@aprobados+1;
			SET @suspensos=@suspensos-1;
		END IF;
	END IF;
END $$

DELIMITER ;

UPDATE Nota
SET nota=4
WHERE codAlum=1;

SELECT @aprobados;
SELECT @suspensos;

UPDATE Nota
SET nota=nota+1
WHERE codAlum=2;

SELECT @aprobados;
SELECT @suspensos;
