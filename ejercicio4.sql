-- EJERCICIO 1
CREATE DATABASE tp4Eje1;
USE tp4Eje1;

CREATE TABLE ALUMNO (
  Cod_Matrícula INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL,
  DNI VARCHAR(45) NOT NULL,
  FechaNacimiento VARCHAR(45) DEFAULT NULL,
  email VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (Cod_Matrícula)
  );

CREATE TABLE CURSO (
  Cód_Curso INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (Cód_Curso)
  );

CREATE TABLE PROFESOR (
  Id_Profesor INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL,
  Especialidad VARCHAR(45) NULL DEFAULT NULL,
  email VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (Id_Profesor)
  );

CREATE TABLE ALUMNO_CURSO (
  ALUMNO_Cod_Matrícula INT NOT NULL,
  CURSO_Cód_Curso INT NOT NULL,
  PRIMARY KEY (ALUMNO_Cod_Matrícula, CURSO_Cód_Curso),
  FOREIGN KEY (ALUMNO_Cod_Matrícula) REFERENCES ALUMNO(Cod_Matrícula) ON UPDATE CASCADE,  
  FOREIGN KEY (CURSO_Cód_Curso) REFERENCES CURSO(Cód_Curso) ON UPDATE CASCADE
  );
  CREATE INDEX `CURSO_Cód_Curso` ON `tp4eje1`.`alumno_curso` (`CURSO_Cód_Curso` ASC) VISIBLE;

  CREATE TABLE PROFESOR_CURSO (
  PROFESOR_Id_Profesor INT NOT NULL,
  CURSO_Cód_Curso INT NOT NULL,
  PRIMARY KEY (PROFESOR_Id_Profesor, CURSO_Cód_Curso),
  FOREIGN KEY (PROFESOR_Id_Profesor) REFERENCES PROFESOR(Id_Profesor) ON UPDATE CASCADE,  
  FOREIGN KEY (CURSO_Cód_Curso) REFERENCES CURSO(Cód_Curso) ON UPDATE CASCADE
  );
  CREATE INDEX `CURSO_Cód_Curso` ON `tp4eje1`.`profesor_curso` (`CURSO_Cód_Curso` ASC) VISIBLE;
  

INSERT INTO alumno (Nombre,DNI,email) VALUES ('Gonzalo','35697789','gonza78@email.com');
INSERT INTO alumno (Nombre,DNI,FechaNacimiento,email) VALUES ('Karla',41654123,10/02/1972,'kar5468@email.com');
INSERT INTO alumno (Nombre,DNI,FechaNacimiento,email) VALUES ('Sandra',40987147,10/02/1988,'sandra456@email.com');
INSERT INTO alumno (Nombre,DNI,FechaNacimiento,email) VALUES ('Lucas',23456369,10/02/1985,'luki468@email.com');

INSERT INTO curso (Cód_Curso,Nombre) VALUES (1,'Desarrollo Web Java');
INSERT INTO curso (Cód_Curso,Nombre) VALUES (2,'Desarrollo Web JavaScript');
INSERT INTO curso (Cód_Curso,Nombre) VALUES (3,'Introduccion a Python');
INSERT INTO curso (Cód_Curso,Nombre) VALUES (4,'Base de Datos');

INSERT INTO alumno_curso (ALUMNO_Cod_Matrícula,CURSO_Cód_Curso) VALUES (1,3);
INSERT INTO alumno_curso (ALUMNO_Cod_Matrícula,CURSO_Cód_Curso) VALUES (1,2);
INSERT INTO alumno_curso (ALUMNO_Cod_Matrícula,CURSO_Cód_Curso) VALUES (3,3);
INSERT INTO alumno_curso (ALUMNO_Cod_Matrícula,CURSO_Cód_Curso) VALUES (4,1);

INSERT INTO profesor (Nombre,Especialidad,email) VALUES ('Juan','Programacion','juandevops@gmail.com');
INSERT INTO profesor (Nombre,Especialidad,email) VALUES ('Pablo','Programacion','pablito46@gmail.com');
INSERT INTO profesor (Nombre,Especialidad,email) VALUES ('Maria','Programacion','maryprogam@gmail.com');
INSERT INTO profesor (Nombre,Especialidad,email) VALUES ('Lucia','Seguridad en la Nube','lucicloud@gmail.com');

INSERT INTO profesor_curso (PROFESOR_Id_Profesor,CURSO_Cód_Curso) VALUES (1,2);
INSERT INTO profesor_curso (PROFESOR_Id_Profesor,CURSO_Cód_Curso) VALUES (2,1);
INSERT INTO profesor_curso (PROFESOR_Id_Profesor,CURSO_Cód_Curso) VALUES (3,2);
INSERT INTO profesor_curso (PROFESOR_Id_Profesor,CURSO_Cód_Curso) VALUES (4,3);



-- EJERCICIO 3
CREATE DATABASE tp4Eje2;
USE tp4Eje2;








-- EJERCICIO 3
CREATE DATABASE tp4Eje3;
USE tp4Eje3;

CREATE TABLE CLIENTES (
  id_clientes INT NOT NULL,
  DNI VARCHAR(45) NULL,
  nombre VARCHAR(45) NULL,
  direccion TEXT(100) NULL,
  telefono VARCHAR(45) NULL,
  PRIMARY KEY (id_clientes)
);

CREATE TABLE RESERVAS (
  id_reservas INT NOT NULL,
  fecha_incio DATE NULL,
  fecha_final DATE NULL,
  precio_total VARCHAR(45) NULL,
  CLIENTES_id_clientes INT NOT NULL,
  PRIMARY KEY (id_reservas),
  CONSTRAINT fk_RESERVAS_CLIENTES
    FOREIGN KEY (CLIENTES_id_clientes) REFERENCES CLIENTES (id_clientes)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS COCHES (
  id_Coches INT NOT NULL,
  matricula VARCHAR(45) NULL,
  modelo VARCHAR(45) NULL,
  color VARCHAR(45) NULL,
  marca VARCHAR(45) NULL,
  precio_por hora VARCHAR(45) NULL,
  PRIMARY KEY (id_Coches)
);

CREATE TABLE IF NOT EXISTS Reservas_Coches (
  RESERVAS_id_reservas INT NOT NULL,
  COCHES_id_Coches INT NOT NULL,
  litros_gasolina VARCHAR(45) NULL,
  CONSTRAINT fk_Reservas_Coches_RESERVAS1
    FOREIGN KEY (RESERVAS_id_reservas) REFERENCES RESERVAS (id_reservas)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Reservas_Coches_COCHES1
    FOREIGN KEY (COCHES_id_Coches) REFERENCES COCHES (id_Coches)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE INDEX fk_Reservas_Coches_RESERVAS1_idx ON Reservas_Coches (RESERVAS_id_reservas ASC) VISIBLE;
CREATE INDEX fk_Reservas_Coches_COCHES1_idx ON Reservas_Coches (COCHES_id_Coches ASC) VISIBLE;


INSERT INTO pais (ID_pais,Nombre_pais) VALUES ('1','argentina');
INSERT INTO pais (ID_pais,Nombre_pais) VALUES ('2','brasil');
INSERT INTO pais (ID_pais,Nombre_pais) VALUES ('3','corea');
INSERT INTO pais (ID_pais,Nombre_pais) VALUES ('4','españa');

INSERT INTO provincia (ID_provincia,Nombre_provincia) VALUES ('1','rio negro');
INSERT INTO provincia (ID_provincia,Nombre_provincia) VALUES ('2','sao paulo');
INSERT INTO provincia (ID_provincia,Nombre_provincia) VALUES ('3','seul');
INSERT INTO provincia (ID_provincia,Nombre_provincia) VALUES ('4','misiones');

INSERT INTO localidad (codigo_localidad,Nombre,codigo_postal) VALUES ('1','las ilhas','3569');
INSERT INTO localidad (codigo_localidad,Nombre,codigo_postal) VALUES ('2','porto xavier','3364');
INSERT INTO localidad (codigo_localidad,Nombre,codigo_postal) VALUES ('3','25 de mayo','3357');
INSERT INTO localidad (codigo_localidad,Nombre,codigo_postal) VALUES ('4','trenque lauquen','4878');

INSERT INTO empleado (Id_empleado,DNI,Nombre,telefono,email,fecha_alta) VALUES ('1','45789963','Juan','3546789645','juandevops@gmail.com','2022-02-12');
INSERT INTO empleado (Id_empleado,DNI,Nombre,telefono,email,fecha_alta) VALUES ('2','45781233','carlos','3544689645','carlos45@gmail.com','2022-05-12');
INSERT INTO empleado (Id_empleado,DNI,Nombre,telefono,email,fecha_alta) VALUES ('3','45456963','diego','3546789685','diego78@gmail.com','2022-02-18');
INSERT INTO empleado (Id_empleado,DNI,Nombre,telefono,email,fecha_alta) VALUES ('4','45741963','leo','3546789622','leolio5@gmail.com','2023-02-12');






