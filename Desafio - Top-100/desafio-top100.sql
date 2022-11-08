-- 1. Crear base de datos llamada películas.
-- CREATE DATABASE 'peliculas';

-- 2. Cargar ambos archivos a su tabla correspondiente.
CREATE TABLE peliculas (
	id SMALLINT PRIMARY KEY,
	pelicula VARCHAR(100),
	anio_estreno VARCHAR(4),
	director VARCHAR(50)
);

CREATE TABLE reparto (
	id SMALLINT,
	actor VARCHAR(50),
	FOREIGN KEY (id) REFERENCES peliculas(id)
);

-- Comando para cargar la data en la tabla peliculas
-- \copy peliculas FROM 'directorio/peliculas.csv' csv header;

-- Agregarle header al archivo reparto.csv y después cargar la data en la tabla reparto
-- \copy reparto FROM 'directorio/reparto.csv' csv header;

-- Consultar datos cargados
-- SELECT * FROM peliculas;
-- SELECT * FROM reparto;


-- 3. Obtener el ID de la película “Titanic”.
SELECT id FROM peliculas WHERE pelicula = 'Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT actor FROM reparto WHERE id = 2;

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT COUNT(actor) AS cantidad_peliculas
FROM reparto
WHERE actor = 'Harrison Ford';

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de
-- manera ascendente.
SELECT pelicula, anio_estreno
FROM peliculas 
WHERE anio_estreno >= '1990' AND anio_estreno <= '1999'
ORDER BY pelicula ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
-- nombrado para la consulta como “longitud_titulo”.
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo
FROM peliculas;


-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(pelicula)) AS longitud_mas_grande
FROM peliculas;
