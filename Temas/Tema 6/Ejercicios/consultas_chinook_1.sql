-- Muestra toda la informacion de la tabla Customer donde el pais no sea USA (46 filas)

SELECT * FROM customers
WHERE Country NOT LIKE 'USA';

-- Muestra el nombre completo y el ID de los clientes que sean de Brasil (5 filas)

SELECT CONCAT(FirstName, ' ', LastName) AS nombre_completo, customerId
FROM customer
WHERE Country LIKE 'Brasil';

-- Muestra el nombre completo de los empleados que sean Sales Support Agent (3 filas)

SELECT CONCAT(FirstName, ' ', LastName) AS employee
FROM employee
WHERE Title LIKE 'Sale Suport Agent';

-- Muestra el nombre de las canciones que duren mas de 3 minutos ordenadas alfabeticamente (3023 filas)

SELECT name FROM track
WHERE Milliseconds > (3*60*1000); --18000 miliseconds

-- Muestra el nombre de las canciones del compositor Jagger/Richards ordenadas alfabeticamente de forma descendente (35 filas)

SELECT name FROM track
WHERE Composer LIKE 'Jagger/Richards'
ORDER BY name DESC;

-- Muestra el nombre y el compositor de las canciones que valgan mas de 1 dolar (213 filas)

SELECT name, Composer FROM track
WHERE UnitPrice > 1;

-- Muestra el nombre de las canciones que contengan la palabra "Love" (114 filas)

SELECT nombre FROM track
WHERE name LIKE '%Love%';

-- Muestra el nombre de los albumes que empiecen por la letra "B" (35 filas)

SELECT title FROM album
WHERE title LIKE 'B%';

-- Muestra el nombre de los artistas que empiecen por la letra "C" (20 filas)

SELECT name FROM Artist
WHERE name LIKE 'C%';

-- Muestra el nombre completo y fecha de nacimiento como texto en castellano de los empleados que nacieron antes de 1969 (5 filas)

SET LC_TIME_NAMES = 'es_ES'
SELECT  CONCAT(FirstName, ' ', LastName) AS nombre_complete
DATE_FORMAT(BirthDate, '%W', '%d', de '%M', del '%Y' ) AS fecha_completa
FROM employee
WHERE YEAR(BirthDate < 1969;)