CREATE DATABASE software;

USE software;

CREATE TABLE empresa(
codigo_interno_empresa VARCHAR(40) PRIMARY KEY,
 cif VARCHAR(15) NOT NULL,
 nombre VARCHAR(20) NOT NULL,
 direccion VARCHAR(70) NOT NULL,
 telefono VARCHAR(15) NOT NULL);

CREATE TABLE proyecto(
id_proyecto int NOT NULL AUTO_INCREMENT PRIMARY KEY,
codigo_interno_empresa VARCHAR(40) NOT NULL,
FOREIGN KEY (codigo_interno_empresa)  REFERENCES empresa (codigo_interno_empresa)
ON DELETE CASCADE ON UPDATE CASCADE,
fecha_inicio DATE NOT NULL,
fecha_provisional DATE NOT NULL,
fecha_finalizado DATE NULL);

CREATE TABLE trabajador(
codigo_trabajador VARCHAR(40) NOT NULL PRIMARY KEY,
nombre VARCHAR(40) NOT NULL,
descripcion VARCHAR(255) NULL,
dni VARCHAR(15) NOT NULL UNIQUE);

CREATE TABLE trabajar(
id int AUTO_INCREMENT PRIMARY KEY,
id_proyecto int NOT NULL,
codigo_trabajador VARCHAR(40) NOT NULL,
horas_trabajadas int NULL,
FOREIGN KEY (id_proyecto)  REFERENCES proyecto (id_proyecto)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (codigo_trabajador)  REFERENCES trabajador (codigo_trabajador)
ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE profesion(
codigo_profesion VARCHAR(5) PRIMARY KEY,
nombre VARCHAR(40)  NOT NULL,
descripcion VARCHAR(255) NULL);

CREATE TABLE ejercer(
id int AUTO_INCREMENT PRIMARY KEY,
codigo_profesion VARCHAR(40) NOT NULL,
codigo_trabajador VARCHAR(40) NOT NULL,
FOREIGN KEY (codigo_profesion)  REFERENCES profesion (codigo_profesion)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (codigo_trabajador)  REFERENCES trabajador (codigo_trabajador)
ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO empresa VALUES 
("350A", "24508352N", "CochesPesla", "Calle:/ABC nr 32", "+3458585858"),
("450A", "76958039Q", "LIOEP", "Calle:/Abcde nr 12", "+3458599958"),
("700B", "93305740F", "IonJuanAsociados", "Calle:/Aper nr 2", "625254512"),
("250E", "02132682F", "KopEro", "Calle:/Bertr nr 2", "648747512");

INSERT INTO proyecto (codigo_interno_empresa, fecha_inicio, fecha_provisional) VALUES
("250E", DATE '2022-07-26', DATE '2022-09-01'),
("350A", DATE '2022-04-26', DATE '2022-05-26'),
("350A", DATE '2022-05-26', DATE '2022-06-26');

INSERT INTO trabajador (codigo_trabajador, nombre, descripcion, dni) VALUES
("t229", "Juan", "El trabajador Juan", "88278774J"),
("t230", "Antonio", "El trabajador Antonio", "86260157Z"),
("t231", "Pepe", "El trabajador Pepe", "04278667T");

INSERT INTO trabajar (id_proyecto, codigo_trabajador, horas_trabajadas) VALUES
(1, "t229", 0),
(2, "t230", 0),
(3, "t231", 20);

INSERT INTO profesion (codigo_profesion, nombre) VALUES
("P1", "Programador"),
("P2", "Diseñador"),
("P3", "Jefe Equipo");

INSERT INTO ejercer (codigo_profesion, codigo_trabajador) VALUES
("P1", "t229"),
("P1", "t230"),
("P2", "t230"),
("P3", "t231");
