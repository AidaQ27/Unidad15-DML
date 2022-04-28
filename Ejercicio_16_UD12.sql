CREATE DATABASE  IF NOT EXISTS `twitter`;
USE `twitter`;

DROP TABLE IF EXISTS `Cuenta`;

CREATE TABLE `Cuenta` (
  `Usuario` varchar(40) NOT NULL,
  `CONTRASEÑA` varchar(20) NOT NULL,
  PRIMARY KEY (`Usuario`);

LOCK TABLES `Cuenta` WRITE;
INSERT INTO `Cuenta` VALUES ('JavierElLoco','1234'),('Juanillo12','BootCamp2022'),('Miguel34','miguelito1999'),('Pepito23','Albaricoque'),('Vanesa99','4321');


DROP TABLE IF EXISTS `Enviar`;

CREATE TABLE `Enviar` (
  `IdEnviar` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(40) NOT NULL,
  `IdMensaje` int DEFAULT NULL,
  PRIMARY KEY (`IdEnviar`),
  KEY `Usuario` (`Usuario`),
  KEY `IdMensaje` (`IdMensaje`),
  CONSTRAINT `Enviar_ibfk_1` FOREIGN KEY (`Usuario`) REFERENCES `Cuenta` (`Usuario`),
  CONSTRAINT `Enviar_ibfk_2` FOREIGN KEY (`IdMensaje`) REFERENCES `Mensaje` (`IdMensaje`) ON DELETE CASCADE ON UPDATE CASCADE
);


LOCK TABLES `Enviar` WRITE;

INSERT INTO `Enviar` VALUES (1,'Vanesa99',1),(2,'Pepito23',2),(3,'Vanesa99',3);


DROP TABLE IF EXISTS `Mensaje`;

CREATE TABLE `Mensaje` (
  `IdMensaje` int NOT NULL AUTO_INCREMENT,
  `Destinatario` varchar(20) DEFAULT NULL,
  `Texto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IdMensaje`)
);


LOCK TABLES `Mensaje` WRITE;

INSERT INTO `Mensaje` VALUES (1,'Pepito23','Hola Pepe. ¿Que tal estas?'),(2,'Vanesa99','¿Te apetece quedar mañana?'),(3,'JavierElLoco','Muchas gracias por tu ayuda Javier');


DROP TABLE IF EXISTS `Notificación`;

CREATE TABLE `Notificación` (
  `IdNotificación` int NOT NULL AUTO_INCREMENT,
  `Comentarios` varchar(255) DEFAULT NULL,
  `TweetsFavoritos` varchar(255) DEFAULT NULL,
  `Retweets` varchar(255) DEFAULT NULL,
  `Usuario` varchar(40) NOT NULL,
  PRIMARY KEY (`IdNotificación`),
  KEY `Usuario` (`Usuario`),
  CONSTRAINT `Notificación_ibfk_1` FOREIGN KEY (`Usuario`) REFERENCES `Cuenta` (`Usuario`) ON DELETE CASCADE ON UPDATE CASCADE
);


LOCK TABLES `Notificación` WRITE;

INSERT INTO `Notificación` VALUES (1,'Vanesa99 comentó tu tweet','A Pepito23 le gusta tu tweet','Juanillo12 hizo retweet','JavierElLoco'),(2,'Pepito23 comentó tu tweet','A JavierElLoco le gusta tu tweet','Vanesa99 hizo retweet','Juanillo12'),(3,'Juanillo12 comentó tu tweet','A Pepito23 le gusta tu tweet','JavierElLoco hizo retweet','Vanesa99');


DROP TABLE IF EXISTS `Perfil`;

CREATE TABLE `Perfil` (
  `Nick` varchar(20) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Seguidores` int DEFAULT NULL,
  `Usuario` varchar(40) NOT NULL,
  PRIMARY KEY (`Nick`),
  KEY `Usuario` (`Usuario`),
  CONSTRAINT `Perfil_ibfk_1` FOREIGN KEY (`Usuario`) REFERENCES `Cuenta` (`Usuario`) ON DELETE CASCADE ON UPDATE CASCADE
);


LOCK TABLES `Perfil` WRITE;

INSERT INTO `Perfil` VALUES ('JavierElLoco','Javier','Martinez',2000,'JavierElLoco'),('Juanillo12','Juan','Martin',400,'Juanillo12'),('Pepito23','Pepe','Garcia',250,'Pepito23'),('Vanesa99','Vanesa','Ramirez',1000,'Vanesa99');
UNLOCK TABLES;


DROP TABLE IF EXISTS `Tweet`;

CREATE TABLE `Tweet` (
  `IdTweet` int NOT NULL AUTO_INCREMENT,
  `Texto` varchar(255) DEFAULT NULL,
  `Comentario` varchar(255) DEFAULT NULL,
  `Usuario` varchar(40) NOT NULL,
  PRIMARY KEY (`IdTweet`),
  KEY `Usuario` (`Usuario`),
  CONSTRAINT `Tweet_ibfk_1` FOREIGN KEY (`Usuario`) REFERENCES `Cuenta` (`Usuario`) ON DELETE CASCADE ON UPDATE CASCADE
);


LOCK TABLES `Tweet` WRITE;

INSERT INTO `Tweet` VALUES (1,'Hoy he tenido el mejor dia que recuerdo','','Pepito23'),(2,'Buen partido del Valencia, una lastima perder por penaltis','','JavierElLoco'),(3,'He empezado hoy un BootCamp de Programación y estoy muy contenta y animada','','Vanesa99');

