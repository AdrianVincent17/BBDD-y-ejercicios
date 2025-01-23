

DROP DATABASE IF EXISTS ligabasket2025;
CREATE DATABASE ligabasket2025;
use ligabasket2025;

CREATE TABLE Equipos(

id_equipo 		INTEGER 			AUTO_INCREMENT,
nombre 			VARCHAR(50) 		NOT NULL,
ciudad 			VARCHAR(50) 		NOT NULL,
pabellon 		VARCHAR(100),

PRIMARY KEY(id_equipo)
);

CREATE TABLE Partidos(

id_partido 		INTEGER 			AUTO_INCREMENT,
elocal 			INTEGER 			NOT NULL,
evisit 			INTEGER 			NOT NULL,
puntosL 		INTEGER 			NOT NULL,
puntosV 		INTEGER 			NOT NULL,
fecha 			DATE,

PRIMARY KEY(id_partido),

FOREIGN KEY(elocal) REFERENCES 	Equipos(id_equipo)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	
FOREIGN KEY(evisit) REFERENCES 	Equipos(id_equipo)
	ON DELETE CASCADE
	ON UPDATE CASCADE

);

CREATE TABLE Jugadores(

id_jugador 		INTEGER 			AUTO_INCREMENT,
nombre 			VARCHAR(50) 		NOT NULL,
apellido 		VARCHAR(50) 		NOT NULL,
puesto 			VARCHAR(50) 		NOT NULL,
salario 		INTEGER 			NOT NULL,
altura 			FLOAT, 
id_capitan 		INTEGER, 
equipo 			INTEGER 			NOT NULL,

PRIMARY KEY(id_jugador),

FOREIGN KEY(id_capitan) REFERENCES Jugadores(id_jugador)
	ON DELETE CASCADE
	ON UPDATE SET NULL,
FOREIGN KEY(equipo) REFERENCES Equipos(id_equipo)
	ON UPDATE CASCADE
);

#---INSERT
	
#--Inserccion de registros uno a uno 
	
#--No hace falta que pongas el esquema despues de meter la tabla(es solo para acordarte que los datos si se meten en orden)
INSERT INTO Equipos(id_equipo, nombre, ciudad, pabellon) VALUES(0, 'Real Madrid', 'Madrid', 'Movistar Arena'); 
INSERT INTO Equipos VALUES(0, 'FC Barcelona', 'Barcelona', 'Palau Blaugrana');

#--Insertamos varios registros
INSERT INTO Equipos VALUES (0, 'UCAM Murcia', 'Murcia', 'Palacion de los deportes'),(0, 'Valencia Basket', 'Valencia', 'Fonteta');


#--Insertamos un registro que contiene un campo nulo

#--si metemos menos campos porque alguno acepta nulos entonces si tienes que poner el esquema detras de tabla corresponiente

INSERT INTO Equipos(id_equipo, nombre, ciudad) VALUES (0, 'Unicaja', 'Malaga');

#-- Insertamos un registro especificando el nombre y el valor de las columnas con SET 

INSERT INTO Equipos SET nombre='Baskonia', ciudad='Vitoria';

#--Insercciones de valores procedentes de una consulta SELECT 
#--Insertar el equipo "Estudiantes" que juega en la misma ciudad y pabellon que el Real Madrid

INSERT INTO Equipos
SELECT 0, 'Estudiantes', ciudad, pabellon
FROM Equipos
WHERE nombre LIKE 'Real Madrid';


#--Insertamos registros en la tabla Partidos

INSERT INTO Partidos VALUES(0,1,2,78,75,'2025-01-11');
INSERT INTO Partidos VALUES(0,3,4,82,85,'2025-01-12');
INSERT INTO Partidos VALUES(0,5,6,91,92,'2025-01-14');
INSERT INTO Partidos VALUES(0,1,6,80,72,CURRENT_DATE());


#--Insertar el partido jugado hoy entre el Real Madrid y Unicaja con resultado 75-74

INSERT INTO Partidos

SELECT 0,E1.id_equipo, E2.id_equipo, 75,74, CURRENT_DATE()
FROM Equipos E1, Equipos E2
WHERE E1.nombre LIKE 'Real Madrid' AND E2.nombre LIKE 'Unicaja';

#--Insertar el partido jugado hoy entre los quipos 1 y 4
#-- con el mismo resultado que el partido jugado entre UCAM Murcia y Valencia Basket 

INSERT INTO Partidos
SELECT 0,1,4,puntosL, puntosV,CURRENT_DATE()
FROM Partidos
WHERE elocal IN(SELECT id_equipo FROM Equipos WHERE nombre LIKE 'UCAM Murcia') AND evisit IN(SELECT id_equipo FROM Equipos WHERE nombre LIKE 
'Valencia Basket');

#--REPLACE

REPLACE INTO Partidos VALUES(1,1,2,79,76,'2025-01-11');

#--IMPORTAR DATOS(CARGA MASIVA)

LOAD DATA INFILE 'C:\\Users\\AdrianV\\Downloads\\Jugadores.txt' INTO TABLE Jugadores;

#-- UPDATE (MODIFICACIONES)

#--Establecer como pabellon de Unicaja el 'Martin Carpena'

UPDATE Equipos
SET pabellon='Martin Carpena'
WHERE nombre LIKE 'Unicaja';

#--Establecer com pabellon de Baskonia el 'Buesa Arena'

UPDATE equipos
SET pabellon='Buesa Arena'
WHERE nombre LIKE 'Baskonia';

#--Cambiar el resultado del partido jugado entre los equipos 3 y 4, con resultado 84-86

UPDATE Partidos
SET puntosL=84, puntosV=86
WHERE elocal=3 AND evisit=4;

#--aumentar el salario de todos los jugadores 1000

UPDATE Jugadores
SET salario=salario+1000;

#--Bajar el salario 1000€ a los jugadores del Madrid

UPDATE Jugadores
SET salario=salario-1000
WHERE equipo IN (SELECT id_equipo FROM Equipos WHERE nombre LIKE '%Madrid%');

#--Borrado de registros:  DELETE

DELETE FROM Jugadores
WHERE nombre LIKE 'Markus' AND apellido LIKE 'Howard';

#--Eliminar los partidos donde Unicaja haya jugado como equipo visitante

DELETE FROM Partidos
WHERE evisit IN (SELECT id_equipo FROM Equipos WHERE nombre LIKE 'Unicaja');

#--eliminar todos los partidos de UCAM Murcia

DELETE FROM Partidos 
WHERE evisit IN (SELECT id_equipo FROM Equipos WHERE nombre LIKE 'UCAM Murcia') OR elocal IN (SELECT id_equipo FROM Equipos WHERE nombre LIKE 'UCAM Murcia');

#--1) BORRADO RESTRINGIDO / BORRADO CASCADA

#--Intentamos borrar al Baskonia, pero no nos dejara por que tiene restriccion por borrado restringido(en la tabla Jugadores)

DELETE FROM Equipos
WHERE nombre LIKE 'Baskonia';

#--Para borrarlo, antes necesitamos borrar (o cambiar de equipo) todos los jugadores de ese equipo

DELETE FROM Jugadores
WHERE equipo IN (SELECT id_equipo FROM Equipos WHERE nombre LIKE 'Baskonia');

#--Borramos el equipo Baskonia qu ehora si nos tiene que dejar borrar y ademas se borraran todos sus partidos (por el borrado en cascada)

DELETE FROM Equipos
WHERE nombre LIKE 'Baskonia';

#--Resultados
#-- 1) Borra al Baskonia de la tabla Equipos
#-- 2) Borra todos los partidos del Baskonia en la tabla Partidos (B:C)

SELECT * FROM Partidos;
SELECT * FROM Equipos;
SELECT * FROM Jugadores;

#-- 2) BORRADO ANULAR (SET NULL)

#--Borramos a Sergio Llul que es el capitan del Real Madrid

DELETE FROM Jugadores
WHERE nombre LIKE 'Sergio' AND apellido LIKE 'Llull';


