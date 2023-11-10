CREATE SCHEMA Ejercicio3_Biblioteca;
USE Ejercicio3_Biblioteca;

-- Paso 1: Creo la tabla Libros
CREATE TABLE Libros (
    ID INT AUTO_INCREMENT PRIMARY KEY, -- Clave primaria autoincremental
    Titulo VARCHAR(255),
    Autor VARCHAR(255), 
    AnioPublicacion INT, 
    Editorial VARCHAR(255)
);


-- Paso 2: Inserto datos
INSERT INTO Libros (Titulo, Autor, AnioPublicacion, Editorial)
VALUES
    ('Cien anos de soledad', 'Gabriel Garcia Marquez', 1967, 'Sudamericana'),
    ('Harry Potter y la piedra filosofal', 'J.K. Rowling', 1997, 'Salani'),
    ('Rayuela', 'Julio Cortazar', 1963, 'Alfaguara'),
    ('Caballo de Fuego', 'Florencia Bonelli', 2010, 'Suma de Letras'),
    ('Econometria', 'Jeffrey M. Wooldridge', 2009, 'Cengage Learning'),
    ('Historias de divan', 'Gabriel Rolon', 2005, 'Editorial Planeta'),
    ('La casa de los espiritus', 'Isabel Allende', 1982, 'Plaza & Janes'),
    ('Ficciones', 'Jorge Luis Borges', 1944, 'Sur'),
    ('El Aleph', 'Jorge Luis Borges', 1949, 'Losada'),
    ('Cien anos de perdon', 'Pablo De Santis', 2013, 'Editorial Sudamericana');

-- Visualizo los datos de la tabla Libros
SELECT * FROM Libros;


-- Paso 3: Consulto datos
-- a) Muestro todos los libros de la tabla Libros
SELECT * FROM Libros;

-- b) Muestro los libros publicados despues de 2010
SELECT * FROM Libros WHERE AnioPublicacion > 2010;

-- c) Muestro los libros escritos por J.K. Rowling
SELECT * FROM Libros WHERE Autor = 'J.K. Rowling';

-- d) Muestra los libros publicados por la editorial Alfaguara
SELECT * FROM Libros WHERE Editorial = 'Alfaguara';


-- Paso 4: Elimino datos
-- Elimino dos libros de la tabla Libros, el primero es Cien años de soledad, y el segundo es aquel libro que sea mas antiguo
DELETE FROM Libros 
WHERE ID = (SELECT ID FROM Libros WHERE Titulo = 'Cien años de soledad' LIMIT 1);

DELETE FROM Libros 
WHERE ID = (SELECT ID FROM Libros ORDER BY AnioPublicacion ASC LIMIT 1);

-- Visualizo los datos de la tabla Libros despues de la eliminacion
SELECT * FROM Libros;


-- Paso 5: Desafio adicional
-- 5.a. Agrego dos libros mas a la tabla
INSERT INTO Libros (Titulo, Autor, AnioPublicacion, Editorial)
VALUES
    ('Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones', 'James Clear', 2018, 'Avery'),
    ('Macroeconomics', 'N. Gregory Mankiw', 2018, 'Cengage Learning');

-- Visualizo los datos de la tabla Libros despues de la agregar datos
SELECT * FROM Libros;

-- 5.b. Muestro los libros escritos por Jorge Luis Borges o publicados despues de 2010:
SELECT * FROM Libros WHERE Autor = 'Jorge Luis Borges' OR AnioPublicacion > 2010;

-- 5.c. Muestro los libros escritos por  los autores argentinos Julio Cortazar, Gabriel Garcia Marquez e Isabel Allende y publicados antes de 2000:
SELECT * FROM Libros WHERE (Autor IN ('Julio Cortazar', 'Gabriel Garcia Marquez', 'Isabel Allende')) AND AnioPublicacion < 2000;

-- 5.d. Muestro los libros publicados por las editoriales Sur o Losada antes de 1950:
SELECT * FROM Libros WHERE (Editorial = 'Sur' OR Editorial = 'Losada') AND AnioPublicacion < 1950;
