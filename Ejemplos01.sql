DROP DATABASE IF EXISTS Museo;
CREATE DATABASE Museo;
USE Museo;

SOURCE C:\\Users\\Adrian Vincent\\Downloads\\museo.sql

SHOW TABLES;

DESCRIBE museo;
DESCRIBE pintor;
DESCRIBE cuadro;


#--1 inserta datos en la tabla museo
INSERT INTO museo VALUES(1,"Reina Sofia","Madrid","C/ Santa Isabel, 52",80000);
INSERT INTO museo VALUES(2,"Museo del Prado","Madrid","C/ Ruiz de Alarcon, 23",110000);
INSERT INTO museo VALUES(3,"Thyssen-Bornemisza","Madrid","Paseo del Prado, 8",NULL);

SELECT * FROM museo;

#--2 inserta datos en la tabla pintor
INSERT INTO pintor VALUES("Velazquez","España","Madrid",NULL,NULL,NULL);
INSERT INTO pintor VALUES("Picasso","España","Malaga",NULL,NULL,NULL);
INSERT INTO pintor VALUES("Goya","España","Zaragoza",NULL,NULL,NULL);

SELECT * FROM pintor;


#--3 inserta datos en la tabla cuadro
INSERT INTO cuadro VALUES(1,"Las Meninas",1656,"Oleo",2,"Velazquez");
INSERT INTO cuadro VALUES(2,"Guernica",1937,"Oleo",1,"Picasso");
INSERT INTO cuadro VALUES(3,"La vendimia",NULL,"Oleo",2,"Goya");
INSERT INTO cuadro VALUES(4,"El quitasol",1777,"Oleo",2,"Goya");

SELECT * FROM cuadro;

#--4 inserta en la tabla pintor a juan gris el cual tiene el mismo pais y ciudad que velazquez
INSERT INTO pintor(nomPin,paisPin,ciudadPin)
SELECT "Juan Gris",paisPin,ciudadPin
FROM pintor
WHERE paisPin=(SELECT paisPin FROM pintor WHERE nompin LIKE "Velazquez")
AND ciudadPin=(SELECT ciudadPin FROM pintor WHERE nompin LIKE "Velazquez");

SELECT * FROM pintor;

#--5 actualiza el museo Thyssen-Bornemisza y establece los metros en 95000
UPDATE museo
SET metros=95000
WHERE nomMuseo LIKE"Thyssen-Bornemisza";

SELECT * FROM museo;


#--6 añade a todos los museos 1500 metros
UPDATE museo
SET metros=metros+1500;

SELECT * FROM museo;

#--7 actualiza los datos de los maestros y pon los mismos que los nombres del pintor
UPDATE pintor
SET nomMaestro = nomPin;

SELECT * FROM pintor;

#--8 cambia el cuadro 'Las Meninas' de museo al Reina Sofia
UPDATE  cuadro
SET codMuseo=(SELECT codMuseo FROM Museo WHERE nomMuseo LIKE"Reina Sofia")
WHERE nomCuad LIKE "Las Meninas";

SELECT * FROM cuadro;


#--9 borra los cuadros que daten del año 1900 en adelante
BEGIN;

DELETE FROM cuadro
WHERE anho>1900;

SELECT * FROM cuadro;

ROLLBACK;

SELECT * FROM cuadro;

#--10 borra los cuadros los cuales la ciudad de sus pintores sea malaga
DELETE FROM cuadro
WHERE nomPintor = (SELECT nomPin FROM pintor WHERE ciudadPin LIKE "Malaga");

SELECT * FROM cuadro;