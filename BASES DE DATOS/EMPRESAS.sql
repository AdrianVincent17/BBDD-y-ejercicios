

/*CONSULTAS EMPRESA 2024*/

#--1. Apellido y sueldo incrementado un 10% de los empleados con oficio de vendedor.

	SELECT apellido, salario*1.10 AS "Incremento de suelto"
	FROM EMPLEADOS
	WHERE UPPER(oficio) LIKE 'VENDEDOR';

#--2. Apellido, salario, comisión y total a cobrar por cada empleado, suponiendo que se trata de sumar su salario a la correspondiente comisión, si la tuviera.

	SELECT apellido, salario, comision, salario+NVL(comision,0) AS importe_total
	FROM EMPLEADOS;

#--3. Datos de todos aquellos empleados cuya comisión sea nula.
	
	SELECT *
	FROM EMPLEADOS
	WHERE comision IS NULL;
	
#--4. Datos de los empleados con oficio de vendedor y salario entre 1750 y 2000 €.

	SELECT *
	FROM EMPLEADOS
	WHERE UPPER(oficio) LIKE 'VENDEDOR' AND salario BETWEEN 1750 AND 2000;

#--5. Datos de los empleados cuyo oficio no sea el de vendedor, cuyo apellido comience por ‘G’ y que tengan un sueldo superior a 2500 €.

	SELECT *
	FROM EMPLEADOS
	WHERE UPPER(oficio) NOT LIKE 'VENDEDOR' AND UPPER(apellido) LIKE 'G*' AND salario>2500;

#--6. Seleccionar los empleados existentes en los departamentos 10 y 30. Mostrar su número de empleado, su apellido, y el número del departamento.

	SELECT emp_no, apellido, dep_no
	FROM EMPLEADOS
	WHERE dep_no IN ('10','30');

#--7. Listar los empleados por departamentos en orden descendente de salarios. Mostrar el número de departamento, el apellido y el salario.

	SELECT dep_no, apellido, salario
	FROM EMPLEADOS
	ORDER BY salario DESC;

#--8. Obtener los salarios máximo, mínimo y la diferencia existente entre ambos.

	SELECT MAX(salario) AS "MAXIMO", MIN(salario) AS "MINIMO", MAX(salario) - MIN(salario) AS "DIFERENCIA"
	FROM EMPLEADOS;

#--9. Calcular el salario medio de los empleados.

	SELECT AVG(salario) AS "SALARIO MEDIO"
	FROM EMPLEADOS;

#--10. Obtener los salarios medios por departamento.

	SELECT dep_no AS dpto, AVG(salario) AS "SALARIO MEDIO DPTO"
	FROM EMPLEADOS
	GROUP BY dep_no;
	
#--11. Obtener cuántos empleados hay en cada departamento.

	SELECT dep_no AS dpto, COUNT(*) AS "Numero empleados"
	FROM EMPLEADOS
	GROUP BY dep_no;

#--12. Seleccionar el mayor salario dentro de cada oficio, excluyendo el del presidente.

	SELECT oficio, MAX(salario) AS "Maximo salario"
	FROM EMPLEADOS
	WHERE UPPER(oficio) NOT LIKE 'PRESIDENTE'
	GROUP BY oficio;

#--13. Seleccionar los oficios que tengan dos o más empleados.

	SELECT oficio, COUNT(*) AS "Nº empleados"
	FROM EMPLEADOS
	GROUP BY oficio
	HAVING COUNT(*)>=2;

#--14. Seleccionar los oficios que tengan dos o más empleados, cuyo salario supere los 1400 €.

	SELECT oficio, COUNT(*) AS "Nº empleados"
	FROM EMPLEADOS
	WHERE salario>1400
	GROUP BY oficio
	HAVING COUNT(*)>=2;

#--15. Obtener todos los empleados (indicando no empleado y apellido) con su nombre de departamento y su localidad.

	SELECT DISTINCT emp_no, apellido, dnombre, localidad 
	FROM EMPLEADOS Em, DEPARTAMENTOS De
	WHERE Em.dep_no=De.dep_no;

#--16. Obtener la lista de los empleados con los nombres de sus directores.

	SELECT E1.emp_no, Em1.apellido, Em2.director, Em2.apellido
	FROM EMPLEADOS E1, EMPLEADOS E2
	WHERE E1.emp_no=E2.director;

#--17. Obtener los jefes de los empleados cuyo oficio sea el de ‘VENDEDOR’.

	SELECT E1.emp_no, E1.apellido, E2.director, E2.apellido
	FROM EMPLEADOS E1, EMPLEADOS E2
	WHERE E2.emp_no=E1.director AND UPPER(oficio) LIKE 'VENDEDOR';

#--18. Listar los empleados de los departamentos diferentes al de ‘VENTAS’.

	SELECT Em.emp_no AS empleado, Em.apellido AS apellido
	FROM EMPLEADOS Em, DEPARTAMENTOS De
	WHERE Em.dep_no=De.dep_no AND De.dnombre NOT LIKE 'VENTAS';

#--19. Listar los empleados cuyo salario supere el salario medio. Mostrar su número de departamento, apellido y salario.

	SELECT dep_no AS Numdpto, apellido AS Apellido, salario
	FROM EMPLEADOS
	WHERE salario>(SELECT MAX(salario) FROM EMPLEADOS);

#--20. Mostrar el apellido y número de todos los empleados que tienen el mismo oficio que ‘Alonso’.

	SELECT emp_no AS Numempleado, apellido AS apellido, oficio 
	FROM EMPLEADOS
	WHERE oficio IN (SELECT oficio FROM EMPLEADOS WHERE UPPER(apellido) LIKE 'ALONSO');

#--21. Obtener información de los empleados que ganan más que cualquier empleado del departamento 30.

	SELECT emp_no AS numempleado, apellido, oficio, salario
	FROM EMPLEADOS
	WHERE salario>(SELECT MAX(salario) FROM EMPLEADOS WHERE dep_no='30');

#--22. Visualizar el número de vendedores del departamento de VENTAS.


	SELECT COUNT(*) AS Numvendedores
	FROM DEPARTAMENTOS De, EMPLEADOS Em
	WHERE Em.dep_no=De.dep_no AND De.dnombre LIKE 'VENTAS' AND Em.oficio LIKE 'VENDEDOR';


#--23. Visualizar la suma de los salarios para cada oficio de los empleados del departamento de VENTAS.

	SELECT
	FROM

#--24. Listar, en orden alfabético, aquellos empleados que no trabajen ni en Madrid ni en Barcelona.

	SELECT
	FROM

#--25. Listar los nombres de los departamentos que tengan algún empleado con fecha de alta anterior a 1992.

	SELECT
	FROM

#--26. Obtener los departamentos y sus nombres, siempre que haya más de un empleado trabajando en ellos.

	SELECT
	FROM

#--27. Listar las localidades donde existan departamentos con empleados cuya comisión supere el 10% del salario.

	SELECT
	FROM

#--28. Seleccionar aquellos departamentos en los que al menos exista un empleado con comisión.

	SELECT
	FROM

#--29. Listar aquellos departamentos en los que todos sus empleados carezcan de información sobre su comisión.

	SELECT
	FROM

#--30. Obtener apellido y oficio de los empleados que tienen el mismo oficio que los que trabajan en el departamento de ‘INVESTIGACIÓN’.

	SELECT
	FROM

#--31. Visualizar el número de departamento con más empleados.

	SELECT
	FROM

#--32. Visualizar los números de departamentos en los que el salario medio de sus empleados sea mayor o igual que la media de todos los salarios.

	SELECT
	FROM

#--33. Visualizar el departamento con más presupuesto asignado para pagar el salario y la comisión de sus empleados.

	SELECT
	FROM

#--34. Visualizar el número de departamento, el oficio y el salario de los oficios con mayor salario de cada departamento.