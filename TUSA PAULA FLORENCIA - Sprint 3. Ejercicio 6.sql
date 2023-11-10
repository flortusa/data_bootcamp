CREATE SCHEMA Ejercicio6;
USE Ejercicio6;

-- Creo la tabla de Producto (Tabla de Dimension, FK de Ventas)
CREATE TABLE Producto (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(50),
    categoria_producto VARCHAR(50),
    precio DECIMAL(10, 2)
);

-- Inserto valores de muestra en Producto
INSERT INTO Producto (nombre_producto, categoria_producto, precio) 
VALUES 
    ('Producto 1', 'Categoría A', 100.00),
    ('Producto 2', 'Categoría B', 59.70),
    ('Producto 3', 'Categoría A', 62.99),
    ('Producto 4', 'Categoría C', 32.50);

-- Visualizo los datos de la tabla Producto
SELECT * FROM Producto;


-- Creo la tabla Detalles_Tiempo (Subtabla dimension Tiempo, contiene atributos jerarquicos para un analisis mas detallado de la Fecha, FK de Tiempo)
CREATE TABLE Detalles_Tiempo (
    detallestiempo_id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    trimestre INT,
    mes INT,
    anio INT,
    dia_semana VARCHAR(15)
);

-- Inserto valores de muestra en Detalles_Tiempo
INSERT INTO Detalles_Tiempo (fecha, trimestre, mes, anio, dia_semana) 
VALUES 
    ('2023-01-01', 1, 1, 2023, 'Domingo'),
    ('2023-02-15', 1, 2, 2023, 'Miércoles'),
    ('2023-03-20', 1, 3, 2023, 'Lunes'),
    ('2023-04-05', 2, 4, 2023, 'Miércoles');

-- Visualizo los datos de la tabla Detalles_Tiempo
SELECT * FROM Detalles_Tiempo;


-- Creo la tabla de Tiempo (Tabla de Dimension, FK de Ventas)
CREATE TABLE Tiempo (
    tiempo_id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    festivo BOOLEAN,
    detallestiempo_id INT,
    FOREIGN KEY (detallestiempo_id) REFERENCES Detalles_Tiempo(detallestiempo_id)
);
 
-- Inserto valores de muestra en Tiempo
INSERT INTO Tiempo (fecha, festivo, detallestiempo_id) 
VALUES 
    ('2023-01-01', FALSE, 1),
    ('2023-02-15', FALSE, 2),
    ('2023-03-20', TRUE, 3),
    ('2023-04-05', FALSE, 4);

-- Visualizo los datos de la tabla Tiempo
SELECT * FROM Tiempo;


-- Creo la tabla Detalles_Ubicacion (Subtabla dimension Ubicacion, contiene atributos jerarquicos para un analisis mas detallado de la Ubicacion, FK de Ubicacion)
CREATE TABLE Detalles_Ubicacion (
    detallesubicacion_id INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(100),
    ciudad VARCHAR(50),
    estado_provincia VARCHAR(50),
    pais VARCHAR(50),
    cp VARCHAR(15),
    coordenadas_geograficas VARCHAR(50)
);

-- Inserto valores de muestra en Detalles_Ubicacion
INSERT INTO Detalles_Ubicacion (direccion, ciudad, estado_provincia, pais, cp, coordenadas_geograficas) 
VALUES 
    ('Av. Principal 123', 'Ciudad A', 'Estado A', 'País A', '123456', '40.7128° N, 74.0060° W'),
    ('Calle Secundaria 456', 'Ciudad B', 'Estado B', 'País B', '654321', '34.0522° N, 118.2437° W'),
    ('Avenida Central 789', 'Ciudad C', 'Estado C', 'País C', '789012', '51.5074° N, 0.1278° W'),
    ('Plaza Principal 100', 'Ciudad D', 'Estado D', 'País D', '010203', '48.8566° N, 2.3522° E');

-- Visualizo los datos de la tabla Detalles_Ubicacion
SELECT * FROM Detalles_Ubicacion;


-- Creo la tabla Contacto_Ubicacion (Subtabla dimension Ubicacion, contiene atributos jerarquicos para un analisis mas detallado de la Ubicacion, FK de Ubicacion)
CREATE TABLE Contacto_Ubicacion (
    contactoubicacion_id INT AUTO_INCREMENT PRIMARY KEY,
    nro_telefono VARCHAR(20),
    horario_atencion VARCHAR(100),
    mail_sucursal VARCHAR(50),
    gerente VARCHAR(50),
    mail_gerente VARCHAR(50)
);

-- Inserto valores en la tabla Contacto_Ubicacion
INSERT INTO Contacto_Ubicacion (nro_telefono, horario_atencion, mail_sucursal, gerente, mail_gerente) 
VALUES 
    ('123-456-7890', 'Lun-Vie 9am-6pm', 'sucursalA@mail.com', 'Juan Pérez', 'juan.perez@mail.com'),
    ('987-654-3210', 'Lun-Sáb 10am-8pm', 'sucursalB@mail.com', 'María García', 'maria.garcia@mail.com'),
    ('111-222-3333', 'Lun-Dom 8am-10pm', 'sucursalC@mail.com', 'Pedro Martínez', 'pedro.martinez@mail.com'),
    ('444-555-6666', 'Lun-Vie 8:30am-7pm', 'sucursalD@mail.com', 'Luisa Rodríguez', 'luisa.rodriguez@mail.com');

-- Visualizo los datos de la tabla Contacto_Ubicacion
SELECT * FROM Contacto_Ubicacion;


-- Creación de la tabla Ubicacion (Tabla de Dimension, FK de Ventas)
CREATE TABLE Ubicacion (
    ubicacion_id INT AUTO_INCREMENT PRIMARY KEY,
    tienda VARCHAR(50),
    detallesubicacion_id INT,
    contactoubicacion_id INT,
    FOREIGN KEY (detallesubicacion_id) REFERENCES Detalles_Ubicacion(detallesubicacion_id),
    FOREIGN KEY (contactoubicacion_id) REFERENCES Contacto_Ubicacion(contactoubicacion_id)
);

-- Inserto valores de muestra en Ubicacion
INSERT INTO Ubicacion (tienda, detallesubicacion_id, contactoubicacion_id) 
VALUES 
    ('Tienda 1', 1, 1),
    ('Tienda 2', 2, 2),
    ('Tienda 3', 3, 3),
    ('Tienda 4', 4, 4);

-- Visualizo los datos de la tabla Ubicacion
SELECT * FROM Ubicacion;


-- Creo la tabla de Cliente (Tabla de Dimension, FK de Ventas)
CREATE TABLE Cliente (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(50),
    segmento_cliente VARCHAR(50)
);

-- Inserto los valores de muestra en Cliente
INSERT INTO Cliente (nombre_cliente, segmento_cliente) 
VALUES 
    ('Cliente 1', 'Segmento A'),
    ('Cliente 2', 'Segmento B'),
    ('Cliente 3', 'Segmento A'),
    ('Cliente 4', 'Segmento C');

-- Visualizo los datos de la tabla Cliente
SELECT * FROM Cliente;


-- Creo la tabla de Ventas (Tabla de Hechos)
CREATE TABLE Ventas (
    venta_id INT AUTO_INCREMENT PRIMARY KEY,
	cantidad_ventas INT,
    ingresos_ventas DECIMAL(10, 2),
    producto_id INT,
    tiempo_id INT,
    ubicacion_id INT,
    cliente_id INT,
    FOREIGN KEY (producto_id) REFERENCES Producto(producto_id),
    FOREIGN KEY (tiempo_id) REFERENCES Tiempo(tiempo_id),
    FOREIGN KEY (ubicacion_id) REFERENCES Ubicacion(ubicacion_id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Inserto los valores de muestra en Ventas
INSERT INTO Ventas (producto_id, tiempo_id, ubicacion_id, cliente_id, cantidad_ventas, ingresos_ventas)
VALUES
    (1, 1, 1, 1, 5, 500.00),
    (2, 2, 2, 2, 3, 179.10),
    (3, 3, 3, 3, 2, 125.98),
    (4, 4, 4, 4, 1, 32.50);

-- Visualizo los datos de la tabla Ventas
SELECT * FROM Ventas;



-- Agregaciones y medidas calculadas
-- Total de ingresos:
SELECT SUM(ingresos_ventas) AS total_ingresos FROM Ventas;

-- Promedio de ingresos por transacción:
SELECT AVG(ingresos_ventas) AS promedio_ingresos_por_transaccion FROM Ventas;

-- Cantidad total de productos vendidos:
SELECT SUM(cantidad_ventas) AS total_productos_vendidos FROM Ventas;

-- Ventas por producto:
SELECT Producto.nombre_producto, SUM(Ventas.cantidad_ventas) AS total_ventas
FROM Ventas
JOIN Producto ON Ventas.producto_id = Producto.producto_id
GROUP BY Producto.nombre_producto;

-- Ventas por ubicacion:
SELECT Ubicacion.tienda, SUM(Ventas.cantidad_ventas) AS total_ventas
FROM Ventas
JOIN Ubicacion ON Ventas.ubicacion_id = Ubicacion.ubicacion_id
GROUP BY Ubicacion.tienda;

-- Ventas segun periodo de tiempo, año y mes, para encontrar estacionalidad:
SELECT Detalles_Tiempo.anio, Detalles_Tiempo.mes, SUM(Ventas.cantidad_ventas) AS total_ventas
FROM Ventas
JOIN Tiempo ON Ventas.tiempo_id = Tiempo.tiempo_id
JOIN Detalles_Tiempo ON Tiempo.detallestiempo_id = Detalles_Tiempo.detallestiempo_id
GROUP BY Detalles_Tiempo.anio, Detalles_Tiempo.mes;

