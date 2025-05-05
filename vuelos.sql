

DROP DATABASE IF EXISTS vuelos;

CREATE DATABASE vuelos;

USE vuelos;

CREATE TABLE companias(

id_compania 				VARCHAR(50),
nombre 						VARCHAR(50)  			NOT NULL,
nacionalidad   				VARCHAR(50) 			NOT NULL,
PRIMARY KEY(id_compañia)
);

LOAD DATA INFILE "C:\\" INTO TABLE companias;

SELECT * FROM companias;

CREATE TABLE clientes(

nif  						VARCHAR(9),
apellido1  					VARCHAR(50) 			NOT NULL,
apellido2     				VARCHAR(50) 			NOT NULL,
nombre   					VARCHAR(50)  			NOT NULL,
poblacion   				VARCHAR(50) 			NOT NULL,
PRIMARY KEY(nif)
);

LOAD DATA INFILE "C:\\clientes.txt" INTO TABLE clientes;

CREATE TABLE vuelos(

vuelo  						INT,
id_compania 				VARCHAR(50)    			NOT NULL,
fecha    					DATE  					NOT NULL,
origen    					VARCHAR(50)    			NOT NULL,
destino 					VARCHAR(50)   			NOT NULL,
plazas 						INT   					NOT NULL,

PRIMARY KEY(vuelo),
UNIQUE(origen,destino,fecha),
UNIQUE(vuelo,id_compañia,fecha),
FOREIGN KEY(id_compania) REFERENCES companias(id_compania)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

LOAD DATA INFILE "C:\\vuelos.txt" INTO TABLE vuelos;

SELECT * FROM vuelos;

CREATE TABLE ocupacion_vuelos(

vuelo   					INT,
pasajero   					VARCHAR(9),	
asiento   					VARCHAR(3),
observaciones  				VARCHAR(50),
PRIMARY KEY(vuelo),
UNIQUE(vuelo,asiento),
FOREIGN KEY(vuelo) REFERENCES vuelos(vuelo)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
FOREIGN KEY(pasajero) REFERENCES clientes(nif)
	ON DELETE CASCADE
	ON UPDATE CASCADE

);

CREATE TABLE reservas(

vuelo   					INT,
pasajero   					VARCHAR(9),	
fecha_reserva 				DATE,
PRIMARY KEY(vuelo, pasajero,fecha_reserva),
FOREIGN KEY(vuelo) REFERENCES vuelos(vuelo)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
FOREIGN KEY(pasajero) REFERENCES clientes(nif)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

SELECT * from companias;
SELECT * from clientes;
SELECT * from vuelos;
SELECT * from ocupacion_vuelos;
SELECT * from reservas;

DROP TRIGGER IF EXISTS reserva_vuelo;
CREATE TRIGGER reserva_vuelo
AFTER INSERT ON ocupacion_vuelos
FOR EACH ROW
INSERT INTO reservas(vuelo, pasajero,fecha_reserva) VALUES (NEW.vuelo,NEW.pasajero,NOW());

UPDATE ocupacion_vuelos
SET asiento="2C"
WHERE pasajero=478523585 AND vuelo=4712;

INSERT INTO ocupacion_vuelos (vuelo,pasajeros)
SELECT vuelo,"12547854F"
FROM vuelos
where origen="BERLIN" AND destino="DUBLIN";

UPDATE ocupacion_vuelos
SET asiento="4B"
WHERE vuelo in(select vuelo FROM vuelos WHERE origen="BERLIN" AND destino="DUBLIN") AND pasajero="12547854F";


SELECT * 
FROM clientes
where nif in(SELECT pasajeros FROM ocupacion_vuelos where vuelo in (
			select vuelo FROM vuelos WHERE origen="MADRID" and destino="LONDRES" AND DAY(fecha)=23 AND month(fecha)=4 AND YEAR(fecha)=2024);

SELECT *
from vuelos
where (month(fecha)=5 OR MONTH(fecha)=6) AND year(fecha)=2024;

CREATE TRIGGER quita_vuelos
BEFORE DELETE ON ocupacion_vuelos
for each ROW
delete from reservas
where old.vuelo=vuelo AND OLD.pasajero=pasajero;

DELETE FROM vuelos
where origen="SEVILLA" AND destino="BARCELONA";



 