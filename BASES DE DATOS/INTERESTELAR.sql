

DROP IF EXISTS DATABASE interestelar;
CREATE DATABASE interestelar;
USE interestelar;

CREATE TABLE lugar(

idlugar 			VARCHAR(20),
nombre 				VARCHAR(20) 			NOT NULL,
tipo 				VARCHAR(10) 			NOT NULL,
distancia 			DOUBLE 					NOT NULL,
superficie 			DOUBLE 					NOT NULL,
coordenadas 		VARCHAR(40),
PRIMARY KEY(idlugar),
UNIQUE(coordenadas)
);

CREATE TABLE nave(

matricula 			VARCHAR(30),
capacidad 			INTEGER 				NOT NULL,
piloto 				VARCHAR(50) 			NOT NULL,
PRIMARY KEY(matricula)
);

CREATE TABLE viaje(

idviaje 			VARCHAR(20),
origen 				VARCHAR(20) 			NOT NULL,
destino 			VARCHAR(20) 			NOT NULL,
nave 				VARCHAR(30),
duracion 			VARCHAR(15),
fechasalida 		DATE 					NOT NULL,	
fechallegada 		DATE,
numpasajeros 		INTEGER 				NOT NULL,

PRIMARY KEY(idviaje),
FOREIGN KEY(origen) REFERENCES lugar(idlugar)
	ON UPDATE CASCADE,
FOREIGN KEY(destino) REFERENCES lugar(idlugar)
	ON UPDATE CASCADE,
FOREIGN KEY(nave) REFERENCES nave(matricula)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);