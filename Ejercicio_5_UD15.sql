DROP DATABASE IF EXISTS ej08;
CREATE DATABASE ej08;

USE ej08;

/* Crear la tabla Piezas*/
CREATE TABLE piezas(
codigo_pieza int AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100)
);


/* Crear la tabla Proveedores*/
CREATE TABLE proveedores(
id_proveedor CHAR(4) PRIMARY KEY,
nombre VARCHAR(100)
);


/*Crear la tabla suministra*/
CREATE TABLE suministra (
codigo_pieza int NOT NULL,
id_proveedor CHAR(4) NOT NULL, 
PRIMARY KEY (codigo_pieza, id_proveedor),
FOREIGN KEY (codigo_pieza) REFERENCES piezas(codigo_pieza)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
ON DELETE CASCADE ON UPDATE CASCADE,
precio int
);

INSERT INTO piezas(nombre) VALUES
("tuerca"),
("arrandela"),
("tornillo"),
("clavo"),
("pastillas de freno"),
("filtro aceite"),
("filtro de aire"),
("alternador"),
("fusible");

INSERT INTO proveedores VALUES
('A',"TA"),
('B',"TB"),
('C',"TC"),
('D',"TE"),
('E',"TF"),
('F',"TG"),
('G',"TI"),
('H',"TJ"),
('I',"TK");

INSERT INTO suministra (codigo_pieza, id_proveedor) VALUES 
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E'),
(6, 'F'),
(7, 'G'),
(8, 'H'),
(9, 'I');
