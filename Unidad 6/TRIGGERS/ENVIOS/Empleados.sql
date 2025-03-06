/*Creamos la base de datos de empleados*/

DROP DATABASE IF EXISTS Empleados;

CREATE DATABASE Empleados;

USE Empleados;

CREATE TABLE empleado(
dni VARCHAR(10),
nomemp VARCHAR(20) NOT NULL,
salario FLOAT NOT NULL,
codjefe VARCHAR(10),
PRIMARY KEY(dni),
FOREIGN KEY(codjefe) REFERENCES empleado(dni)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE baja_empleado(
dni VARCHAR(10),
nomemp VARCHAR(20) NOT NULL,
salario FLOAT NOT NULL,
codjefe VARCHAR(10),
fecha DATE NOT NULL,
PRIMARY KEY(dni)
);

/*Hacemos inserciones sobre la tabla de empleado*/

INSERT INTO empleado VALUES ('52893997M', 'Mariano Gil' , 4500.0, NULL);
INSERT INTO empleado VALUES ('48893397T', 'Roberto Andrade' , 2500.0, '52893997M');
INSERT INTO empleado VALUES ('22893778G', 'Marta Benavide' , 2750.75, '52893997M');
INSERT INTO empleado VALUES ('43425395H', 'Jacinto Conesa' , 1500.45, '22893778G ');
INSERT INTO empleado VALUES ('42895597M', 'Antonio Diallo' , 1675.0, '22893778G ');
INSERT INTO empleado VALUES ('48397454B', 'Isabel Canillejas' , 3550.45, '52893997M');

SELECT * FROM empleado;

/*Creamos un trigger que insertara en la tabla baja_empleado todos aquellos enpleados que borremos(dados de baja)*/

DROP TRIGGER IF EXISTS bajas;
CREATE TRIGGER bajas
BEFORE DELETE ON empleado
FOR EACH ROW 
INSERT INTO baja_empleado VALUES(OLD.dni, OLD.nomemp, OLD.salario, OLD.codjefe, NOW());

SELECT * FROM baja_empleado;


/*Ahora hacemos un borrado de algun empleado para ver si funciona el trigger*/

DELETE FROM empleado WHERE dni='43425395H';
select * from empleado;
SELECT * FROM baja_empleado;

DELETE FROM empleado WHERE dni LIKE '48%';
SELECT * FROM empleado;
SELECT * FROM baja_empleado;

DELETE FROM empleado WHERE salario BETWEEN 2500.0 AND 4000.0;
SELECT * FROM empleado;
SELECT * FROM baja_empleado;
