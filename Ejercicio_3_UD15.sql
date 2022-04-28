
INSERT INTO CIENTIFICOS (DNI, NOMBRE_APELLIDOS) VALUES ('74182541X' , 'Gerard Sanchez');
INSERT INTO CIENTIFICOS (DNI, NOMBRE_APELLIDOS) VALUES ('78965457P' , 'Constantin Vlad');
INSERT INTO CIENTIFICOS (DNI, NOMBRE_APELLIDOS) VALUES ('25836974P' , 'Aida Querald');
INSERT INTO CIENTIFICOS (DNI, NOMBRE_APELLIDOS) VALUES ('12378956O' , 'Gerard Viñuelas');
INSERT INTO CIENTIFICOS (DNI, NOMBRE_APELLIDOS) VALUES ('19537582Y' , 'Antonio Garcia');
INSERT INTO CIENTIFICOS (DNI, NOMBRE_APELLIDOS) VALUES ('75198463H' , 'Marta Lara');
INSERT INTO CIENTIFICOS (DNI, NOMBRE_APELLIDOS) VALUES ('15738968M' , 'Sara Carrillo');
INSERT INTO CIENTIFICOS (DNI, NOMBRE_APELLIDOS) VALUES ('81926374G' , 'Maria del Monte');
INSERT INTO CIENTIFICOS (DNI, NOMBRE_APELLIDOS) VALUES ('14825936Q' , 'Antonio Velasco');
INSERT INTO CIENTIFICOS (DNI, NOMBRE_APELLIDOS) VALUES ('46791328Ñ' , 'Sofia Madrid');

INSERT INTO PROYECTO (ID, NOMBRE, HORAS) VALUES ('ID01' , 'Proyecto X' , 70);
INSERT INTO PROYECTO (ID, NOMBRE, HORAS) VALUES ('ID02' , 'Proyecto Y' , 40);
INSERT INTO PROYECTO (ID, NOMBRE, HORAS) VALUES ('ID03' , 'Proyecto Z' , 30);
INSERT INTO PROYECTO (ID, NOMBRE, HORAS) VALUES ('ID04' , 'Proyecto Q' , 120);
INSERT INTO PROYECTO (ID, NOMBRE, HORAS) VALUES ('ID05' , 'Proyecto F' , 180);
INSERT INTO PROYECTO (ID, NOMBRE, HORAS) VALUES ('ID06' , 'Proyecto M' , 190);
INSERT INTO PROYECTO (ID, NOMBRE, HORAS) VALUES ('ID07' , 'Proyecto N' , 240);
INSERT INTO PROYECTO (ID, NOMBRE, HORAS) VALUES ('ID08' , 'Proyecto L' , 305);
INSERT INTO PROYECTO (ID, NOMBRE, HORAS) VALUES ('ID09' , 'Proyecto Ñ' , 450);
INSERT INTO PROYECTO (ID, NOMBRE, HORAS) VALUES ('ID10' , 'Proyecto R' , 500);

INSERT INTO ASIGNADO_A (CIENTIFICO, PROYECTO) VALUES ('74182541X', 'ID01');
INSERT INTO ASIGNADO_A (CIENTIFICO, PROYECTO) VALUES ('78965457P', 'ID02');
INSERT INTO ASIGNADO_A (CIENTIFICO, PROYECTO) VALUES ('25836974P', 'ID03');
INSERT INTO ASIGNADO_A (CIENTIFICO, PROYECTO) VALUES ('12378956O', 'ID04');
INSERT INTO ASIGNADO_A (CIENTIFICO, PROYECTO) VALUES ('19537582Y', 'ID05');
INSERT INTO ASIGNADO_A (CIENTIFICO, PROYECTO) VALUES ('75198463H', 'ID06');
INSERT INTO ASIGNADO_A (CIENTIFICO, PROYECTO) VALUES ('15738968M', 'ID07');
INSERT INTO ASIGNADO_A (CIENTIFICO, PROYECTO) VALUES ('81926374G', 'ID08');
INSERT INTO ASIGNADO_A (CIENTIFICO, PROYECTO) VALUES ('14825936Q', 'ID09');
INSERT INTO ASIGNADO_A (CIENTIFICO, PROYECTO) VALUES ('46791328Ñ', 'ID10');

SELECT * FROM CIENTIFICOS;
SELECT * FROM PROYECTO; 
SELECT * FROM ASIGNADO_A;