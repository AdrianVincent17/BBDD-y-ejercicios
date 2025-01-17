

/*Consultas spsp2*/

#--1

SELECT pnombre
FROM P
WHERE color like 'rojo' AND peso>15;

#--2

SELECT DISTINCT ciudad
FROM S
WHERE ciudad IN(SELECT ciudad FROM P);

#--3

SELECT DISTINCT ciudad
FROM S
WHERE ciudad NOT IN(SELECT ciudad FROM P);

#--4

SELECT pnombre
FROM P
WHERE pnombre like'p*';


#--5

SELECT pnombre, color, peso
FROM P
WHERE peso>12 AND (LOWER(pnombre) LIKE'*a' OR LOWEr(pnombre) LIKE'*o')
ORDER BY color ASC, peso DESC;

#--6

SELECT COUNT(pn)
FROM SP
WHERE sn LIKE'S2'
GROUP BY sn;



#--7
#--8
#--9
#--10
#--11
#--12
#--13
#--14
#--15
