CREATE SCHEMA Ejercicio4_Empresa;
USE Ejercicio4_Empresa; 

-- Creo las tablas, primero aquellas que serviran como Foreign Key de la tabla Empleados, y luego Empleados
-- Creo la tabla Nacionalidad (FK de la tabla Empleados)
CREATE TABLE Nacionalidad (
    id_nacionalidad INT PRIMARY KEY AUTO_INCREMENT,
    nombre_nacionalidad VARCHAR(50) NOT NULL
);

-- Inserto datos en la tabla Nacionalidad
INSERT INTO Nacionalidad (nombre_nacionalidad) VALUES
('Argentina'),
('Brasil'),
('Chile'),
('Colombia'),
('Uruguay');

-- Visualizo los datos de la tabla Nacionalidad
SELECT * FROM Nacionalidad;


-- Creo la tabla Sucursal  (FK de la tabla Empleados)
CREATE TABLE Sucursal (
    id_sucursal INT PRIMARY KEY AUTO_INCREMENT,
    nombre_sucursal VARCHAR(50) NOT NULL
);

--  Inserto datos en la tabla Sucursal
INSERT INTO Sucursal (nombre_sucursal) VALUES
('Sucursal A'),
('Sucursal B'),
('Sucursal C');

-- Visualizo los datos de la tabla Sucursal
SELECT * FROM Sucursal;


-- Creo la tabla Puesto (FK de la tabla Empleados)
CREATE TABLE Puesto (
    id_puesto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_puesto VARCHAR(50) NOT NULL,
    descripcion_puesto VARCHAR(100) NOT NULL,
    departamento_puesto VARCHAR(50) NOT NULL,
    supervisor_puesto VARCHAR(50) NOT NULL
);

-- Inserto datos en la tabla Puesto
INSERT INTO Puesto (nombre_puesto, descripcion_puesto, departamento_puesto, supervisor_puesto)
VALUES
('Gerente', 'Encargado de la gestion general', 'Gerencia', 'Supervisor A'),
('Analista', 'Responsable del analisis de datos', 'Analisis', 'Supervisor B'),
('Desarrollador', 'Encargado del desarrollo de software', 'Tecnologia', 'Supervisor C');

-- Visualizo los datos de la tabla Puesto
SELECT * FROM Puesto;


-- Creo la tabla Rendimiento  (FK de la tabla Empleados)
CREATE TABLE Rendimiento (
    id_rendimiento INT PRIMARY KEY AUTO_INCREMENT,
    nivel_rendimiento VARCHAR(50) NOT NULL
);

-- Inserto datos en la tabla Rendimiento
INSERT INTO Rendimiento (nivel_rendimiento) VALUES
('Excelente'),
('Muy Bueno'),
('Bueno'),
('Regular');

-- Visualizo los datos de la tabla Rendimiento
SELECT * FROM Rendimiento;


-- Crear la tabla Empleados
CREATE TABLE Empleados (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre_empleado VARCHAR(50) NOT NULL,
    apellido_empleado VARCHAR(50) NOT NULL,
    dni_empleado VARCHAR(15) NOT NULL,
    cuil_empleado VARCHAR(20) NOT NULL,
    estadocivil_empleado VARCHAR (20) NOT NULL, 
    telefono_empleado VARCHAR(15),
    email_empleado VARCHAR(50),
    id_nacionalidad INT,
    id_rendimiento INT,
    id_sucursal INT,
    id_puesto INT,
    sueldo DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_nacionalidad) REFERENCES Nacionalidad(id_nacionalidad),
    FOREIGN KEY (id_rendimiento) REFERENCES Rendimiento(id_rendimiento),
    FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal),
    FOREIGN KEY (id_puesto) REFERENCES Puesto(id_puesto)
);

-- Insertar valores en la tabla Empleados
INSERT INTO Empleados (nombre_empleado, apellido_empleado, dni_empleado, cuil_empleado, estadocivil_empleado, telefono_empleado, email_empleado, id_nacionalidad, id_rendimiento, id_sucursal, id_puesto, sueldo) VALUES
('Juan', 'Perez', '12345678', '20345678901', 'soltero/a', '1122334455', 'juan.perez@email.com', 1, 1, 1, 1, 50000.00),
('Maria', 'Gomez', '87654321', '30345678901', 'casado/a', '5544332211', 'maria.gomez@email.com', 2, 2, 2, 2, 45000.00),
('Carlos', 'Lopez', '56789012', '40345678901', ' casado/a', '9988776655', 'carlos.lopez@email.com', 3, 3, 3, 3, 40000.00);

-- Visualizo los datos de la tabla Empleados
SELECT * FROM Empleados;


-- Actualizo sueldo en la tabla Empleados según el rendimiento
UPDATE Empleados
SET sueldo = sueldo * 1.15
WHERE id_rendimiento = 1; -- Excelente: Aumentar 15%

UPDATE Empleados
SET sueldo = sueldo * 1.10
WHERE id_rendimiento = 2; -- Muy Bueno: Aumentar 10%

UPDATE Empleados 
SET 
    sueldo = sueldo * 0.90
WHERE
    id_rendimiento = 4; -- Regular: Disminuir 10%

-- Visualizo los cambios en la tabla Empleados
SELECT * FROM Empleados;