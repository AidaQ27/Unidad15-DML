CREATE DATABASE grandes_almacenes;

USE grandes_almacenes;

/*Crear tabla cajeros*/
CREATE TABLE cajeros (
codigo_cajero int AUTO_INCREMENT PRIMARY KEY, 
nom_apels VARCHAR(255) NOT NULL
);

/*Crear tabla productos*/
CREATE TABLE productos (
codigo_producto int AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
precio int NOT NULL
);

/*Crear tabla maquina resgistradora*/
CREATE TABLE maquina_resgistradora (
id_maquina int AUTO_INCREMENT PRIMARY KEY, 
piso int NOT NULL
);

/*Crear tabla ventas*/
CREATE TABLE venta (
codigo_cajero int NOT NULL,
codigo_producto int NOT NULL, 
id_maquina int NOT NULL,
PRIMARY KEY (codigo_cajero, codigo_producto, id_maquina),
FOREIGN KEY (codigo_cajero) REFERENCES cajeros(codigo_cajero)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_maquina) REFERENCES maquina_resgistradora(id_maquina)
ON DELETE CASCADE ON UPDATE CASCADE
);



/*Insercion de nuevas filas en la tabla cajeros OK*/
INSERT INTO cajeros (nom_apels) VALUES
('Maria Mendéz'),
('Juan Ochoa'),
('Sergio Mesa'),
('Trinidad Perez'),
('David Abelló'),
('Ines Bonet'),
('Cristian Imbernon'),
('Maria Jose Oporto'),
('Cristina Parisi'),
('Noa Farik');

/*Insercion de nuevas filas en la tabla productos OK*/
INSERT INTO productos (nombre, precio) VALUES
('Americana mujer', 100),
('Americana hombre', 100),
('Pantalon Palazzo', 50),
('Pantalon Skinny', 45),
('Pantalon Slimfit', 45),
('Vestido Doots', 60),
('Vestido Plisado', 65),
('Camiseta Lurex', 25),
('Camiseta Basic', 24),
('Parka blue', 70);

/*Insercion de nuevas filas en la tabla maquina registradora OK*/
INSERT INTO maquina_resgistradora (piso) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

/*Insertar en tabla venta*/
INSERT INTO venta (codigo_cajero, codigo_producto, id_maquina) VALUES
(2, 1, 3),
(5, 4, 9),
(2, 2, 5),
(7, 5, 1),
(1, 1 ,8),
(5, 4, 3),
(9, 7, 4),
(1, 4, 4),
(3, 2, 2),
(4, 6, 6);

