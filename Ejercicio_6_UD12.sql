CREATE DATABASE biblioteca;

/*Usa la base de datos Biblioteca*/
USE biblioteca;

/*Crear la tabla socio*/
CREATE TABLE socio (
codigo_socio int AUTO_INCREMENT PRIMARY KEY NOT NULL, 
dni VARCHAR(10) NOT NULL,
nombre CHAR(30) NOT NULL,
apellido CHAR(30) NOT NULL,
direccion CHAR(50), 
telefono VARCHAR(10) 
);

/* Crear la tabla Prestamo*/
CREATE TABLE prestamo (
id_prestamo int AUTO_INCREMENT PRIMARY KEY NOT NULL, 
fecha_inicial DATE NOT NULL,
fecha_devolucion DATE,
fecha_maxima DATE NOT NULL, 
codigo_socio int NOT NULL,
FOREIGN KEY (codigo_socio) REFERENCES socio(codigo_socio)
ON DELETE CASCADE ON UPDATE CASCADE
);


/*Crear tabla Obra*/
CREATE TABLE obra (
id_obra int AUTO_INCREMENT PRIMARY KEY NOT NULL,
deteriorado BOOLEAN,
comentario TEXT(100),
nombre TEXT(50) NOT NULL,
año YEAR,
resumen TEXT(100) 
);

/*Crear tabla Incluye*/
CREATE TABLE incluye (
id_incluye int AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_prestamo int NOT NULL, 
FOREIGN KEY (id_prestamo) REFERENCES prestamo(id_prestamo)
ON DELETE CASCADE ON UPDATE CASCADE,
id_obra int NOT NULL,
FOREIGN KEY (id_obra) REFERENCES obra(id_obra)
ON DELETE CASCADE ON UPDATE CASCADE
);

/*Crear la tabla Autor*/
CREATE TABLE autor (
id_autor int AUTO_INCREMENT PRIMARY KEY NOT NULL,
nombre TEXT(20),
pais TEXT(20)
);

/* Crear la tabla crea*/
CREATE TABLE crea (
id_crea int AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_autor int NOT NULL,
FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
ON DELETE CASCADE ON UPDATE CASCADE,
id_obra int NOT NULL,
FOREIGN KEY (id_obra) REFERENCES obra(id_obra)
ON DELETE CASCADE ON UPDATE CASCADE
);

/*Crear la tabla libro*/
CREATE TABLE libros (
id_libro int AUTO_INCREMENT PRIMARY KEY NOT NULL, 
id_obra int NOT NULL,
FOREIGN KEY (id_obra) REFERENCES obra(id_obra)
ON DELETE CASCADE ON UPDATE CASCADE,
autor CHAR(30),
numero_paginas int
);

/*Crear la tabla pelicula*/
CREATE TABLE pelicula (
id_pelicula int AUTO_INCREMENT PRIMARY KEY NOT NULL, 
id_obra int NOT NULL,
FOREIGN KEY (id_obra) REFERENCES obra(id_obra)
ON DELETE CASCADE ON UPDATE CASCADE,
director CHAR(30),
duracion int
);

/*Crear la tabla cd*/
CREATE TABLE cd (
id_cd int AUTO_INCREMENT PRIMARY KEY NOT NULL, 
id_obra int NOT NULL,
FOREIGN KEY (id_obra) REFERENCES obra(id_obra)
ON DELETE CASCADE ON UPDATE CASCADE,
autor CHAR(30),
n_canciones int
);

/*Insertar nuevas filas*/
INSERT INTO socio (dni, nombre, apellido, direccion, telefono) VALUES 
('39905523M', 'Maria', 'Peña', 'Plaza Mayor n11, Reus', '652252525'),
('39904123M', 'Marina', 'Dalmau', 'Calle Monterols 12, Reus', '6522962525');

/*Eliminar filas*/
DELETE FROM socio WHERE codigo_socio=2 ;

/*Insertar nuevas filas en socio*/
INSERT INTO socio (dni, nombre, apellido, direccion, telefono) VALUES 
('39904123M', 'Natalia', 'Dalmau', 'Calle Monterols 12, Reus', '652457812'),
('39952512S', 'Gerard', 'Oller', 'Plaça Abad Oliva n13 Reus', '652565656');

/*Insertar nuevas filas en prestamo*/
INSERT INTO prestamo (fecha_inicial, fecha_devolucion, fecha_maxima, codigo_socio) VALUES
('2022-04-27', '2022-05-02', date_add('2022-04-27', interval 30 day), 4),
('2022-04-28', '2022-05-03', date_add('2022-04-28', interval 30 day), 3),
('2022-04-29', '2022-05-04', date_add('2022-04-29', interval 30 day), 1);

INSERT INTO obra(deteriorado, comentario, nombre) VALUES
(true, 'dañada la ultima pagina', 'Harry Potter, La piedra de Azkaban'),
(true, 'portada rayada', 'Encuentra tu persona vitamina' );

INSERT INTO obra(nombre, año) VALUES
('El libro Negro de las horas', '2022'),
('El Señor de los Anillos', '1954'),
('El codigo DaVinci', '2003'),
('El Padrino', '1972'),
('El mago de Oz', '1979'),
('ET, el extraterrestre', '1982'),
('Absolution - MUSE', '2003'),
('Thriller - Michael Jackson', '1987'),
('Mi Vida - Julio Iglesias', '1998');

DELETE FROM obra WHERE id_obra=2;

INSERT INTO incluye(id_prestamo, id_obra) VALUES
(1, 3),
(2, 4),
(3, 8);

INSERT INTO autor(nombre, pais) VALUES
('Joanne Rowling', 'Reino Unido'),
('Marian Rojas', 'España'),
('Eva Garcia Saens', 'España'),
('John R.R. Tolkien', 'Reino Unido'),
('Dam Brown', 'EE.UU'),
('Francis Ford Coppola','EE.UU'),
('Victor Fleming', 'EE.UU'),
('Steven Spielberg','EE.UU'),
('MUSE', 'Reino Unido'),
('Michael Jackson', 'EE.UU'),
('Julio Iglesias', 'España');

INSERT INTO crea(id_autor, id_obra) VALUES
(1, 1),
(2, 3),
(3, 4), 
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(11, 12); 

INSERT INTO libros(id_obra, autor, numero_paginas) VALUES
(1,'Joanne Rowling', 340),
(3, 'Marian Rojas', 220),
(4, 'Eva Garcia Saens', 325),
(5, 'John R.R. Tolkien', 326),
(6, 'Dam Brown', 411);

INSERT INTO pelicula(id_obra, director, duracion) VALUES
(7, 'Francis Ford Coppola', 122),
(8, 'Victor Fleming', 129),
(9, 'Steven Spielberg', 184);

INSERT INTO cd (id_obra, autor, n_canciones) VALUES
(10, 'MUSE', 12),
(11, 'Michael Jackson', 10),
(12, 'Julio Iglesias', 13);



