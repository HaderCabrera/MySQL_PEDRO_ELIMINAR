show databases;

create database parquesNaturales;
use parquesNaturales;

show tables;


create table if not exists tipoEspecie(
    id_tipoEspecie INT  primary key AUTO_INCREMENT,
    descripcion varchar(200) not null
);
    

create table if not exists parqueNatural(
    id_parque INT  primary key AUTO_INCREMENT,
    name_parque varchar(100) not null,
    fapertura_ruta DATETIME not null
);


create table if not exists entidad(
    id_entidad INT  primary key AUTO_INCREMENT,
    name_entidad varchar(100) not null
);


create table if not exists departamento(
    id_dept INT  AUTO_INCREMENT,
    name_dept varchar(100) not null,
    id_entidad INT,
    primary key(id_dept, id_entidad),
	foreign key (id_entidad) references entidad(id_entidad)
);

CREATE TABLE IF NOT EXISTS parquesDepartamento(
	id_parquesDepartamento INT,
	id_dept INT,
	id_parque INT,
	primary key(id_parquesDepartamento, id_dept, id_parque),
	foreign key (id_dept) references departamento(id_dept),
	foreign key (id_parque) references parqueNatural(id_parque)
);

create table if not exists areaParque(
    id_areaParque INT  AUTO_INCREMENT,
    name_area varchar(100) not null,
    extension_area DOUBLE NOT NULL,
    id_parque INT,
    primary key(id_areaParque, id_parque),
	foreign key (id_parque) references parqueNatural(id_parque)
);

create table if not exists especie(
    id_especie INT  AUTO_INCREMENT,
    name_cientifico varchar(100) not null,
    name_vulgar varchar(100) NOT NULL,
    poblacion_especie INT NOT NULL,
    id_tipoEspecie INT,
    id_areaParque INT,
    primary key(id_especie, id_tipoEspecie, id_areaParque),
	foreign key (id_tipoEspecie) references tipoEspecie(id_tipoEspecie),
	foreign key (id_areaParque) references areaParque(id_areaParque)
);

create table if not exists trabajador(
    id_trab INT  AUTO_INCREMENT,
    name_trab varchar(45)  null,
    cedula_trab INT NOT NULL,
    direccion_trab VARCHAR(45)  NULL,
    sueldo DOUBLE NULL,
    id_parque INT,
    primary key(id_trab, id_parque),
	foreign key (id_trab) references parqueNatural(id_parque)
);

create table if not exists telefono(
    id_telf INT  AUTO_INCREMENT,
    num_fijo INT NOT NULL,
    num_movil INT NOT NULL,
    id_trab INT,
    primary key(id_telf, id_trab),
	foreign key (id_trab) references trabajador(id_trab)
);

create table if not exists gestion_trabajador(
    id_gestionTrabajador INT  AUTO_INCREMENT,
    int_parque VARCHAR(45) NOT NULL,
    id_trab INT,
    id_areaParque INT,
    primary key(id_gestionTrabajador, id_trab, id_areaParque),
	foreign key (id_trab) references trabajador(id_trab),
	foreign key (id_areaParque) references areaParque(id_areaParque)
);

create table if not exists entrada(
    id_entrada INT  AUTO_INCREMENT,
    num_entrada INT NOT NULL,
    ubicacion VARCHAR(45),
    id_trab INT,
    primary key(id_entrada, id_trab),
	foreign key (id_trab) references parqueNatural(id_parque)
);


SHOW TABLES;

/*INSERTS*/

INSERT INTO tipoEspecie (descripcion) VALUES
('Mamíferos'),
('Aves'),
('Reptiles'),
('Anfibios'),
('Peces'),
('Invertebrados'),
('Plantas'),
('Hongos'),
('Algas'),
('Musgos'),
('Líquenes'),
('Árboles'),
('Hierbas'),
('Flores'),
('Helechos'),
('Cactus'),
('Bromelias'),
('Orquídeas'),
('Rosas'),
('Lirios'),
('Girasoles'),
('Margaritas'),
('Tulipanes'),
('Camelias'),
('Peonías'),
('Azaleas'),
('Hortensias'),
('Bambúes'),
('Robles'),
('Pinos'),
('Cedros'),
('Secoyas'),
('Palmas'),
('Coquitos'),
('Cerezos'),
('Manzanos'),
('Naranjos'),
('Limones'),
('Paltas'),
('Fresas'),
('Bananas'),
('Mangos'),
('Uvas'),
('Sandías'),
('Melones'),
('Piñas'),
('Kiwis'),
('Granadas'),
('Moras'),
('Frambuesas');

INSERT INTO parqueNatural (name_parque, fapertura_ruta) VALUES
('Parque Nacional Natural Tayrona', '2023-06-12 08:00:00'),
('Parque Nacional Natural Sierra Nevada de Santa Marta', '2022-11-25 09:30:00'),
('Parque Nacional Natural Los Nevados', '2023-04-18 07:45:00'),
('Parque Nacional Natural Cocuy', '2022-12-05 10:15:00'),
('Parque Nacional Natural Chiribiquete', '2023-09-08 08:30:00'),
('Parque Nacional Natural El Tuparro', '2023-03-20 09:00:00'),
('Parque Nacional Natural Gorgona', '2022-10-30 08:45:00'),
('Parque Nacional Natural Utría', '2023-07-17 10:00:00'),
('Parque Nacional Natural Corales del Rosario y San Bernardo', '2023-05-22 09:15:00'),
('Parque Nacional Natural Amacayacu', '2023-01-14 07:30:00'),
('Parque Nacional Natural Tayrona', '2022-11-12 08:00:00'),
('Parque Nacional Natural Sierra Nevada de Santa Marta', '2023-08-25 09:30:00'),
('Parque Nacional Natural Los Nevados', '2023-03-28 07:45:00'),
('Parque Nacional Natural Cocuy', '2023-10-05 10:15:00'),
('Parque Nacional Natural Chiribiquete', '2022-12-18 08:30:00'),
('Parque Nacional Natural El Tuparro', '2023-07-30 09:00:00'),
('Parque Nacional Natural Gorgona', '2023-05-14 08:45:00'),
('Parque Nacional Natural Utría', '2022-09-07 10:00:00'),
('Parque Nacional Natural Corales del Rosario y San Bernardo', '2023-02-19 09:15:00'),
('Parque Nacional Natural Amacayacu', '2023-11-02 07:30:00'),
('Parque Nacional Natural Tayrona', '2023-12-10 08:00:00'),
('Parque Nacional Natural Sierra Nevada de Santa Marta', '2023-06-22 09:30:00'),
('Parque Nacional Natural Los Nevados', '2023-01-18 07:45:00'),
('Parque Nacional Natural Cocuy', '2023-09-15 10:15:00'),
('Parque Nacional Natural Chiribiquete', '2022-10-28 08:30:00'),
('Parque Nacional Natural El Tuparro', '2023-08-03 09:00:00'),
('Parque Nacional Natural Gorgona', '2022-12-27 08:45:00'),
('Parque Nacional Natural Utría', '2022-05-11 10:00:00'),
('Parque Nacional Natural Corales del Rosario y San Bernardo', '2023-03-24 09:15:00'),
('Parque Nacional Natural Amacayacu', '2023-02-06 07:30:00'),
('Parque Nacional Natural Tayrona', '2023-05-14 08:00:00'),
('Parque Nacional Natural Sierra Nevada de Santa Marta', '2023-02-16 09:30:00'),
('Parque Nacional Natural Los Nevados', '2023-10-25 07:45:00'),
('Parque Nacional Natural Cocuy', '2022-08-28 10:15:00'),
('Parque Nacional Natural Chiribiquete', '2023-07-01 08:30:00'),
('Parque Nacional Natural El Tuparro', '2023-04-13 09:00:00'),
('Parque Nacional Natural Gorgona', '2023-11-30 08:45:00'),
('Parque Nacional Natural Utría', '2023-01-05 10:00:00'),
('Parque Nacional Natural Corales del Rosario y San Bernardo', '2022-06-08 09:15:00'),
('Parque Nacional Natural Amacayacu', '2023-09-19 07:30:00'),
('Parque Nacional Natural Tayrona', '2022-10-02 08:00:00'),
('Parque Nacional Natural Sierra Nevada de Santa Marta', '2023-12-04 09:30:00'),
('Parque Nacional Natural Los Nevados', '2023-07-28 07:45:00'),
('Parque Nacional Natural Cocuy', '2023-04-01 10:15:00'),
('Parque Nacional Natural Chiribiquete', '2023-01-15 08:30:00'),
('Parque Nacional Natural El Tuparro', '2022-11-21 09:00:00'),
('Parque Nacional Natural Gorgona', '2023-09-24 08:45:00'),
('Parque Nacional Natural Utría', '2023-06-10 10:00:00'),
('Parque Nacional Natural Corales del Rosario y San Bernardo', '2023-02-15 09:15:00'),
('Parque Nacional Natural Amacayacu', '2022-12-12 07:30:00');

INSERT INTO entidad (name_entidad) VALUES
('Entidad A'),
('Entidad B'),
('Entidad C'),
('Entidad D'),
('Entidad E');

-- Insertar registros en la tabla 'departamento'
INSERT INTO departamento (name_dept, id_entidad) VALUES
('Departamento de Seguridad', 1),
('Departamento de Geología', 2),
('Departamento de Botánica', 3),
('Departamento de Zoología', 4),
('Departamento de Ecología', 5),
('Departamento de Conservación', 3),
('Departamento de Educación Ambiental', 2),
('Departamento de Recursos Naturales', 1),
('Departamento de Turismo Sostenible', 1),
('Departamento de Investigación', 5);

-- Insertar registros en la tabla 'parquesDepartamento'
INSERT INTO parquesDepartamento (id_parquesDepartamento, id_dept, id_parque) VALUES
(1, 11, 1),
(1, 12, 2),
(1, 12, 3),
(1, 14, 4),
(1, 15, 5),
(1,11, 6),
(1, 17, 7),
(1, 11, 8),
(1, 19, 9),
(1, 20, 10);

select * from trabajador  ;

-- Insertar registros en la tabla 'areaParque'
INSERT INTO areaParque (name_area, extension_area, id_parque) VALUES
('Área de Bosque', 1000.5, 1),
('Área de Montaña', 750.3, 2),
('Área de Humedal', 500.2, 3),
('Área de Sabana', 900.8, 4),
('Área de Desierto', 300.6, 5),
('Área de Playa', 600.4, 6),
('Área de Río', 400.7, 7),
('Área de Selva', 1200.9, 8),
('Área de Manglar', 800.1, 9),
('Área de Volcán', 700.0, 10);

-- Insertar registros en la tabla 'especie'
INSERT INTO especie (name_cientifico, name_vulgar, poblacion_especie, id_tipoEspecie, id_areaParque) VALUES
('Canis lupus', 'Lobo Gris', 50, 1, 1),
('Panthera onca', 'Jaguar', 30, 2, 2),
('Phoenicopterus ruber', 'Flamenco', 100, 3, 3),
('Equus ferus caballus', 'Caballo', 200, 4, 4),
('Tursiops truncatus', 'Delfín Nariz de Botella', 80, 5, 5),
('Ursus arctos', 'Oso Pardo', 40, 6, 6),
('Chelonia mydas', 'Tortuga Verde', 150, 7, 7),
('Orcaella brevirostris', 'Delfín Irrawaddy', 70, 8, 8),
('Crocodylus porosus', 'Cocodrilo de Agua Salada', 90, 9, 9),
('Ailuropoda melanoleuca', 'Panda Gigante', 20, 10, 10);

-- Insertar registros en la tabla 'trabajador'
INSERT INTO trabajador (name_trab, cedula_trab, direccion_trab, sueldo, id_parque) VALUES
('Juan Perez', 12345678, 'Calle Principal 123', 1500.50, 1),
('María Rodriguez', 87654321, 'Avenida Central 456', 1600.75, 2),
('Pedro Gomez', 98765432, 'Calle Secundaria 789', 1400.25, 3),
('Ana Martinez', 23456789, 'Plaza Mayor 101', 1550.30, 4),
('Carlos Lopez', 54321678, 'Paseo del Bosque 202', 1450.60, 5),
('Laura Fernandez', 34567890, 'Carrera 5 303', 1650.40, 6),
('David Sanchez', 65432187, 'Avenida de la Playa 404', 1520.80, 7),
('Elena Torres', 45678901, 'Calle del Río 505', 1580.90, 8),
('Miguel Perez', 76543210, 'Camino del Manglar 606', 1470.70, 9),
('Sofia Rodriguez', 56789012, 'Paseo del Volcán 707', 1620.35, 10);

-- Insertar registros en la tabla 'telefono'
INSERT INTO telefono (num_fijo, num_movil, id_trab) VALUES
(123456789, 987654321, 1),
(234567890, 876543210, 2),
(345678901, 765432109, 3),
(456789012, 654321098, 4),
(567890123, 543210987, 5),
(678901234, 432109876, 6),
(789012345, 321098765, 7),
(890123456, 210987654, 8),
(901234567, 109876543, 9),
(102345678, 098765432, 10);

-- Insertar registros en la tabla 'gestion_trabajador'
INSERT INTO gestion_trabajador (int_parque, id_trab, id_areaParque) VALUES
('Gestión de Recursos Naturales', 1, 1),
('Gestión de Conservación', 2, 2),
('Gestión de Educación Ambiental', 3, 3),
('Gestión de Turismo Sostenible', 4, 4),
('Gestión de Investigación', 5, 5),
('Gestión de Fauna y Flora', 6, 6),
('Gestión de Mantenimiento', 7, 7),
('Gestión de Visitantes', 8, 8),
('Gestión de Ecosistemas Acuáticos', 9, 9),
('Gestión de Protección Volcánica', 10, 10);

-- Insertar registros en la tabla 'entrada'
INSERT INTO entrada (num_entrada, ubicacion, id_trab) VALUES
(1, 'Entrada Principal', 1),
(2, 'Entrada Norte', 2),
(3, 'Entrada Sur', 3),
(4, 'Entrada Este', 4),
(5, 'Entrada Oeste', 5),
(6, 'Entrada Principal', 6),
(7, 'Entrada Central', 7),
(8, 'Entrada Este', 8),
(9, 'Entrada Oeste', 9),
(10, 'Entrada Principal', 10);

