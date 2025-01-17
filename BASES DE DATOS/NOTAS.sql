
---base de datos de las notas de alumnos

DROP DATABASE IF EXISTS notas;
CREATE DATABASE notas;
USE notas;

CREATE TABLE modulo(

codmodulo 			VARCHAR(20),
nombre 				VARCHAR(30) 		NOT NULL,
horas 				DOUBLE 				NOT NULL,
PRIMARY KEY(codmodulo)
);

CREATE TABLE alumno(

codalumno 			VARCHAR(20),
nombre 				VARCHAR(30) 		NOT NULL,
apellidos 			VARCHAR(30) 		NOT NULL,
fechanac 			DATE 				NOT NULL,
PRIMARY KEY(codalumno)
);

CREATE TABLE profesor(

codprofesor 		VARCHAR(20),
nombre 				VARCHAR(30) 		NOT NULL,
apellidos 			VARCHAR(30) 		NOT NULL,
departamento 		VARCHAR(20) 		NOT NULL,
PRIMARY KEY(codprofesor)
);

CREATE TABLE alumno_nota_modulo(

codalumno 			VARCHAR(20),
codmodulo 			VARCHAR(20),
nota 				DOUBLE 				NOT NULL,
trimestre 			INTEGER,
PRIMARY KEY(codalumno,codmodulo,trimestre),
FOREIGN KEY(codalumno) REFERENCES alumno(codalumno)
	ON UPDATE CASCADE,
FOREIGN KEY(codmodulo) REFERENCES modulo(codmodulo)
	ON UPDATE CASCADE
);

CREATE TABLE modulo_profesor(

codprofesor 		VARCHAR(20),
codmodulo 			VARCHAR(20),
horas 				DOUBLE 				NOT NULL,
PRIMARY KEY(codprofesor,codmodulo),
FOREIGN KEY(codprofesor) REFERENCES profesor(codprofesor)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
FOREIGN KEY(codmodulo) REFERENCES modulo(codmodulo)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

show tables;
describe alumno;
describe profesor;
describe modulo;
describe modulo_profesor;
describe alumno_nota_modulo;


