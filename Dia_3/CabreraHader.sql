create database collage;
use collage;

CREATE table if not exists persona (
	id INT PRIMARY KEY,
	nif VARCHAR(9),
	nombre VARCHAR(25) NOT NULL,
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50),
	ciudad VARCHAR(25) NOT NULL,
	direccion VARCHAR(50) NOT NULL,
	telefono VARCHAR(9),
	fecha_nacimiento DATE NOT NULL,
	sexo ENUM('H','M') NOT NULL,
	tipo ENUM('a','b')
);

CREATE TABLE IF NOT EXISTS departamneto(
	id INT(10) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS profesor(
	id_profesor INT(10),
	id INT(10),
	PRIMARY KEY(id_profesor, id),
	FOREIGN KEY(id) REFERENCES departamneto(id)
);

CREATE TABLE IF NOT EXISTS grado(
	id INT(10) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL
);


CREATE table if not exists asignatura (
	id INT ,
	nombre VARCHAR(100) NOT NULL,
	creditos FLOAT NOT NULL,
	tipo ENUM('A','B'),
	curso TINYINT(3),
	cuatrimestre TINYINT(3),
	id_profesor INT(10),
	id_grado INT(10),
	PRIMARY KEY(id, id_grado),
	FOREIGN KEY(id_profesor) REFERENCES profesor(id_profesor),
	FOREIGN KEY(id_grado) REFERENCES grado(id)
);

CREATE table if not exists curso_escolar (
	id INT PRIMARY KEY,
	anyo_inicio YEAR(4),
	anyo_fin YEAR(4)
);

CREATE table if not exists alumno_se_matricula_asignatura (
	id_alumno INT(10),
	id_asignatura INT(10),
	id_curso_escolar INT(10),
	PRIMARY KEY(id_alumno, id_asignatura, id_curso_escolar),
	FOREIGN KEY(id_alumno) REFERENCES persona(id),
	FOREIGN KEY(id_asignatura) REFERENCES asignatura(id),
	FOREIGN KEY(id_curso_escolar) REFERENCES curso_escolar(id)
);

show tables;


