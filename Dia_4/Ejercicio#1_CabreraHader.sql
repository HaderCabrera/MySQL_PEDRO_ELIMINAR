-- ############################
-- ###### EJERCICIO DIA 4 #####
-- ############################

/* Creacion y uso de la BBDD "world"*/

CREATE DATABASE worldd ;
use worldd;

CREATE TABLE if not exists pais(
  id INT PRIMARY KEY,
  nombre VARCHAR(20),
  continente VARCHAR(50),
  poblacion INT
);

CREATE TABLE if not exists idioma(
  id INT PRIMARY KEY,
  idioma VARCHAR(50)
);

CREATE TABLE if not exists ciudad(
  id INT PRIMARY KEY,
  nombre VARCHAR(20),
  id_pais INT,
  Foreign Key (id_pais) REFERENCES pais(id)
);

CREATE TABLE if not exists idioma_pais(
  id_idioma INT,
  id_pais INT,
  es_oficial TINYINT(1),
  PRIMARY KEY (id_idioma, id_pais),
  Foreign Key (id_idioma) REFERENCES idioma(id),
  Foreign Key (id_pais) REFERENCES pais(id)
);

/* INSERTS*/

INSERT into pais values
(11,"luxemburgo","europa",653103),
(22,"japon","asia",125171000),
(33,"españa","europa",42780000),
(44,"china","asia",1411750000),
(55,"colombia","sur america",51870000),
(66,"brasil","sur america",215300000),
(77,"estados unidos","north america",333300000),
(88,"venezuela","sur america",28300000),
(99,"portugal","europa",10467366),
(111,"india","asia",1414555000);

INSERT into idioma values
(1,"Luxemburgo"),
(2,"Japones"),
(3,"Español"),
(4,"chino"),
(5,"Arabe"),
(6,"Portuguese"),
(7,"Ingles"),
(8,"Portuguese"),
(9,"Hindi"),
(11,"Ruso");

INSERT INTO ciudad VALUES
(1,"Wiltz",11),
(2,"Luxemburgo",11),
(3,"Pekin",44),
(4,"Chongping",44),
(5,"Agra",111),
(6,"Calcuta",111),
(7,"Brasilia",66),
(8,"Recife",66),
(9,"Piedecuesta",55),
(10,"Caracas",88);

INSERT INTO idioma_pais VALUES
(1,11,1),
(2,22,1),
(3,33,1),
(4,44,1),
(5,55,1),
(6,66,1),
(7,77,1),
(8,88,1),
(9,99,1),
(11,111,1);


-- Desarrolado por Hader Cabrera 
-- C.C: 1.1102.381.910


