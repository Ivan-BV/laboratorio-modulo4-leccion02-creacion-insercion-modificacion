-- Ejercicio 1 

-- 1.
CREATE DATABASE logistica; -- También se puede crear con este comando pero en mi caso la he creado manualmente

-- 2.

-- Creación de la tabla clientes
CREATE TABLE clientes(
	id_cliente SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	direccion VARCHAR(100) NOT NULL,
	telefono INT NOT NULL,
	pais VARCHAR(100) NOT NULL
);

-- Creación de la tabla empleados
CREATE TABLE empleados(
	id_empleado SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	cargo VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL
);

-- Creación de la tabla proveedores
CREATE TABLE proveedores(
	id_proveedor SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	contacto VARCHAR(100) NOT NULL,
	telefono INT NOT NULL,
	direccion VARCHAR(100) NOT NULL
);

-- Creación de la tabla envios
CREATE TABLE envios(
	id_envio SERIAL PRIMARY KEY,
	id_cliente INT NOT NULL,
	id_empleado INT NOT NULL,
	id_proveedor INT NOT NULL,
	fecha_envio DATE NOT NULL,
	estado VARCHAR(100) NOT NULL,
	total INT UNIQUE NOT NULL,
	FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_empleado)
        REFERENCES empleados(id_empleado)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_proveedor)
        REFERENCES proveedores(id_proveedor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Creación de la tabla detalle_de_envios
CREATE TABLE detalle_de_envios(
	id_detalle SERIAL PRIMARY KEY,
	id_envio INT NOT NULL,
	producto VARCHAR(100) NOT NULL,
	cantidad INT NOT NULL,
	precio_unitario DECIMAL(5,2) NOT NULL,
	FOREIGN KEY (id_envio)
        REFERENCES envios(id_envio)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Creación de la tabla regiones
CREATE TABLE regiones(
	id_region SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	pais VARCHAR(100) NOT NULL
);

-- Ejercicio 2 

-- 1.
INSERT INTO clientes (nombre, email, direccion, telefono, pais)
VALUES 
('Juan Pérez', 'juan.perez@example.com', 'Calle 123, Ciudad A', 1234567, 'México'),
('María Gómez', 'maria.gomez@example.com', 'Avenida 456, Ciudad B', 2345678, 'España'),
('Carlos Rodríguez', 'carlos.rodriguez@example.com', 'Plaza 789, Ciudad C', 3456789, 'Argentina'),
('Ana Martínez', 'ana.martinez@example.com', 'Calle 101, Ciudad D', 4567890, 'Chile'),
('Luis Fernández', 'luis.fernandez@example.com', 'Avenida 202, Ciudad E', 5678901, 'Colombia'),
('Laura García', 'laura.garcia@example.com', 'Plaza 303, Ciudad F', 6789012, 'Perú'),
('Pedro Sánchez', 'pedro.sanchez@example.com', 'Calle 404, Ciudad G', 7890123, 'Uruguay'),
('Sofía Torres', 'sofia.torres@example.com', 'Avenida 505, Ciudad H', 8901234, 'Venezuela'),
('Diego Ramírez', 'diego.ramirez@example.com', 'Plaza 606, Ciudad I', 9012345, 'Ecuador'),
('Valeria López', 'valeria.lopez@example.com', 'Calle 707, Ciudad J', 123456, 'Bolivia');


-- 2.
INSERT INTO empleados (nombre, cargo, email)
VALUES 
('Roberto Díaz', 'Gerente de Ventas', 'roberto.diaz@empresa.com'),
('Elena Ramírez', 'Asistente de Recursos Humanos', 'elena.ramirez@empresa.com'),
('Miguel Torres', 'Desarrollador de Software', 'miguel.torres@empresa.com'),
('Sara López', 'Analista Financiero', 'sara.lopez@empresa.com'),
('Jorge Fernández', 'Director de Operaciones', 'jorge.fernandez@empresa.com');


-- 3.
INSERT INTO proveedores (nombre, contacto, telefono, direccion)
VALUES 
('TechDistribuciones S.A.', 'Luis Martínez', 9876543, 'Avenida Tecnológica 101, Ciudad X'),
('Proveedora Global', 'Claudia Hernández', 8765432, 'Calle Internacional 202, Ciudad Y'),
('Suministros del Norte', 'Ricardo Gómez', 7654321, 'Plaza Industrial 303, Ciudad Z');


-- 4.
INSERT INTO envios (id_cliente, id_empleado, id_proveedor, fecha_envio, estado, total)
VALUES 
(1, 2, 1, '2024-10-01', 'En tránsito', 1001),
(3, 1, 2, '2024-10-02', 'Entregado', 1002),
(2, 3, 3, '2024-10-03', 'En preparación', 1003),
(4, 2, 1, '2024-10-04', 'En tránsito', 1004),
(1, 4, 2, '2024-10-05', 'Entregado', 1005),
(3, 5, 3, '2024-10-06', 'Cancelado', 1006),
(2, 1, 1, '2024-10-07', 'En preparación', 1007),
(5, 3, 2, '2024-10-08', 'Entregado', 1008);


-- 5.
INSERT INTO detalle_de_envios (id_envio, producto, cantidad, precio_unitario)
VALUES 
(1, 'Laptop Dell XPS 13', 2, 950.00),
(2, 'Monitor Samsung 24"', 4, 180.00),
(3, 'Teclado Mecánico', 10, 50.00),
(4, 'Mouse Inalámbrico', 5, 25.00),
(5, 'Impresora HP LaserJet', 1, 350.00),
(6, 'Disco Duro Externo 1TB', 3, 75.00),
(7, 'Auriculares Sony WH-1000XM4', 2, 300.00),
(8, 'Silla Ergonómica', 1, 220.00);


-- 6.
INSERT INTO regiones (nombre, pais)
VALUES 
('Andalucía', 'España'),
('Baviera', 'Alemania'),
('Lombardía', 'Italia'),
('Queensland', 'Australia'),
('Ontario', 'Canadá');


-- Ejercicio 3 

-- 1.
UPDATE envios 
SET estado = 'Entregado'
WHERE id_envio = 3

-- 2.
UPDATE empleados 
SET cargo = 'Director de Datos'
WHERE id_empleado = 5

-- 3.
UPDATE detalle_de_envios 
SET precio_unitario = precio_unitario * 1.1
WHERE producto = 'Producto A'

-- 4.
UPDATE clientes 
SET direccion = 'Nueva Calle B, 123'
WHERE id_cliente = 2

--  5.
UPDATE envios 
SET id_proveedor = 3
WHERE id_envio = 4

--  6.
UPDATE detalle_de_envios 
SET  cantidad = 5
WHERE producto = 'Producto C'

-- 7.
UPDATE envios 
SET  total = 50
WHERE id_envio = 5

-- 8.
UPDATE proveedores 
SET  contacto = 'Nuevo Contacto 2'
WHERE id_proveedor = 2

-- 9.
UPDATE clientes 
SET  pais = 'Portugal'
WHERE id_cliente = 6

-- 10.
SELECT * FROM envios e 
UPDATE envios 
SET  fecha_envio = '2024-08-10'
WHERE id_envio = 7

-- Ejercicio 4 

-- 1.
ALTER TABLE clientes 
ADD COLUMN fecha_nacimiento DATE;

-- 2.
ALTER TABLE proveedores 
ADD COLUMN codigo_postal VARCHAR(10);

-- 3.
ALTER TABLE proveedores 
DROP COLUMN contacto;

-- 4.
ALTER TABLE regiones 
DROP COLUMN pais;

-- 5.
ALTER TABLE clientes 
ALTER COLUMN telefono TYPE VARCHAR(15);

-- 6.
ALTER TABLE envios 
ALTER COLUMN total TYPE NUMERIC(12, 2);

-- 7.
ALTER TABLE empleados 
ADD COLUMN fecha_contrato DATE;

-- 8.
ALTER TABLE envios 
DROP COLUMN estado;

-- 9.
ALTER TABLE empleados 
RENAME COLUMN nombre TO nombre_completo;

-- Ejercicio 5 

-- 1.
SELECT * FROM clientes c WHERE pais = 'España'

-- 2.
SELECT * FROM envios e WHERE id_empleado = 2

-- 3.
SELECT producto FROM detalle_de_envios dde WHERE id_envio = 1

-- 4.
SELECT * FROM proveedores p WHERE telefono = 8765432

-- 5.
SELECT * FROM empleados e WHERE cargo = 'Supervisor de Envios'

-- 6.
SELECT * FROM envios e WHERE id_cliente = 5

-- 7.
SELECT nombre, pais FROM regiones r -- Esto se haría así pero como hemos eliminado la columna pais da ERROR

SELECT nombre FROM regiones r -- En este caso voy a seleccionar solo el nombre de las regiones porque se pide en el ejercicio el nombre y el país

-- 8.
SELECT * FROM detalle_de_envios dde WHERE precio_unitario > 50

-- 9.
SELECT * FROM envios e WHERE fecha_envio = '2024-08-05'

-- 10. 
SELECT * FROM clientes c WHERE telefono LIKE '6003%'