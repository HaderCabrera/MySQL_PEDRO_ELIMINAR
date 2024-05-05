
/*-----------------------------------------------------------*/
/* 					  SHOPINGMARKETONLINE					 */
/*-----------------------------------------------------------*/

CREATE DATABASE MyGuitarShop;
USE MyGuitarShop;

CREATE TABLE Categories (
  CategoryID        INT            PRIMARY KEY ,
  CategoryName      VARCHAR(255)   NOT NULL      UNIQUE
);

CREATE TABLE Products (
  ProductID         INT,
  CategoryID        INT, 
  ProductCode       VARCHAR(10)    NOT NULL      UNIQUE,
  ProductName       VARCHAR(255)   NOT NULL,
  Description       TEXT           NOT NULL,
  ListPrice         DOUBLE          NOT NULL,
  DiscountPercent   DOUBLE          NOT NULL      DEFAULT 0.00,
  DateAdded         DATETIME                     DEFAULT NULL,
  PRIMARY KEY (ProductID, CategoryID),
  FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Customers (
  CustomerID           INT            PRIMARY KEY,
  EmailAddress         VARCHAR(255)   NOT NULL      UNIQUE,
  Password             VARCHAR(60)    NOT NULL,
  FirstName            VARCHAR(60)    NOT NULL,
  LastName             VARCHAR(60)    NOT NULL,
  ShippingAddressID    INT                          DEFAULT NULL,
  BillingAddressID     INT                          DEFAULT NULL
);

CREATE TABLE Addresses (
  AddressID          INT             ,
  CustomerID         INT            REFERENCES Customers (CustomerID),
  Line1              VARCHAR(60)    NOT NULL,
  Line2              VARCHAR(60)                  DEFAULT NULL,
  City               VARCHAR(40)    NOT NULL,
  State              VARCHAR(2)     NOT NULL,
  ZipCode            VARCHAR(10)    NOT NULL,
  Phone              VARCHAR(12)    NOT NULL,
  Disabled           INT            NOT NULL      DEFAULT 0,
  PRIMARY KEY(AddressID, CustomerID),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) 
);

CREATE TABLE Orders (
  OrderID           INT            ,
  CustomerID        INT,
  OrderDate         DATETIME       NOT NULL,
  ShipAmount        DOUBLE          NOT NULL,
  TaxAmount         DOUBLE         NOT NULL,
  ShipDate          DATETIME                    DEFAULT NULL,
  ShipAddressID     INT            NOT NULL,
  CardType          VARCHAR(50)    NOT NULL,
  CardNumber        CHAR(16)       NOT NULL,
  CardExpires       CHAR(7)        NOT NULL,
  BillingAddressID  INT            NOT NULL,
  PRIMARY KEY (OrderID,CustomerID ),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) 
);

CREATE TABLE OrderItems (
  ItemID             INT           ,
  OrderID            INT,           
  ProductID          INT ,          
  ItemPrice          DOUBLE  NOT NULL,
  DiscountAmount     DOUBLE  NOT NULL,
  Quantity           INT            NOT NULL,
    PRIMARY KEY (ItemID,OrderID, ProductID ),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Administrators (
  AdminID           INT            PRIMARY KEY,
  EmailAddress      VARCHAR(255)   NOT NULL,
  Password          VARCHAR(255)   NOT NULL,
  FirstName         VARCHAR(255)   NOT NULL,
  LastName          VARCHAR(255)   NOT NULL
);

/*INSERTS*/

INSERT INTO Categories (CategoryID, CategoryName) VALUES
(11111, 'Guitars'),
(22222, 'Basses'),
(33333, 'Drums'), 
(44444, 'Keyboards');

INSERT INTO Products (ProductID, CategoryID, ProductCode, ProductName, Description, ListPrice, DiscountPercent, DateAdded) VALUES
(199, 11111, 'strat', 'Fender Stratocaster', 'The Fender Stratocaster is the electric guitar design that changed the world. New features include a tinted neck, parchment pickguard and control knobs, and a ''70s-style logo. Includes select alder body, 21-fret maple neck with your choice of a rosewood or maple fretboard, 3 single-coil pickups, vintage-style tremolo, and die-cast tuning keys. This guitar features a thicker bridge block for increased sustain and a more stable point of contact with the strings. At this low price, why play anything but the real thing?\r\n\r\nFeatures:\r\n\r\n* New features:\r\n* Thicker bridge block\r\n* 3-ply parchment pick guard\r\n* Tinted neck', '699.00', '30.00', '2011-10-30 09:32:40'),
(299, 11111, 'les_paul', 'Gibson Les Paul', 'This Les Paul guitar offers a carved top and humbucking pickups. It has a simple yet elegant design. Cutting-yet-rich tone?the hallmark of the Les Paul?pours out of the 490R and 498T Alnico II magnet humbucker pickups, which are mounted on a carved maple top with a mahogany back. The faded finish models are equipped with BurstBucker Pro pickups and a mahogany top. This guitar includes a Gibson hardshell case (Faded and satin finish models come with a gig bag) and a limited lifetime warranty.\r\n\r\nFeatures:\r\n\r\n* Carved maple top and mahogany back (Mahogany top on faded finish models)\r\n* Mahogany neck, ''59 Rounded Les Paul\r\n* Rosewood fingerboard (Ebony on Alpine white)\r\n* Tune-O-Matic bridge with stopbar\r\n* Chrome or gold hardware\r\n* 490R and 498T Alnico 2 magnet humbucker pickups (BurstBucker Pro on faded finish models)\r\n* 2 volume and 2 tone knobs, 3-way switch', '1199.00', '30.00', '2011-12-05 16:33:13'),
(399, 11111, 'sg', 'Gibson SG', 'This Gibson SG electric guitar takes the best of the ''62 original and adds the longer and sturdier neck joint of the late ''60s models. All the classic features you''d expect from a historic guitar. Hot humbuckers go from rich, sweet lightning to warm, tingling waves of sustain. A silky-fast rosewood fretboard plays like a dream. The original-style beveled mahogany body looks like a million bucks. Plus, Tune-O-Matic bridge and chrome hardware. Limited lifetime warranty. Includes hardshell case.\r\n\r\nFeatures:\r\n\r\n* Double-cutaway beveled mahogany body\r\n* Set mahogany neck with rounded ''50s profile\r\n* Bound rosewood fingerboard with trapezoid inlays\r\n* Tune-O-Matic bridge with stopbar tailpiece\r\n* Chrome hardware\r\n* 490R humbucker in the neck position\r\n* 498T humbucker in the bridge position\r\n* 2 volume knobs, 2 tone knobs, 3-way switch\r\n* 24-3/4" scale', '2517.00', '52.00', '2015-02-04 11:04:31'),
(499, 11111, 'fg700s', 'Yamaha FG700S', 'The Yamaha FG700S solid top acoustic guitar has the ultimate combo for projection and pure tone. The expertly braced spruce top speaks clearly atop the rosewood body. It has a rosewood fingerboard, rosewood bridge, die-cast tuners, body and neck binding, and a tortoise pickguard.\r\n\r\nFeatures:\r\n\r\n* Solid Sitka spruce top\r\n* Rosewood back and sides\r\n* Rosewood fingerboard\r\n* Rosewood bridge\r\n* White/black body and neck binding\r\n* Die-cast tuners\r\n* Tortoise pickguard\r\n* Limited lifetime warranty', '489.99', '38.00', '2015-06-01 11:12:59'),
(599, 11111, 'washburn', 'Washburn D10S', 'The Washburn D10S acoustic guitar is superbly crafted with a solid spruce top and mahogany back and sides for exceptional tone. A mahogany neck and rosewood fingerboard make fretwork a breeze, while chrome Grover-style machines keep you perfectly tuned. The Washburn D10S comes with a limited lifetime warranty.\r\n\r\nFeatures:\r\n\r\n    * Spruce top\r\n    * Mahogany back, sides\r\n    * Mahogany neck Rosewood fingerboard\r\n    * Chrome Grover-style machines', '299.00', '0.00', '2015-07-30 13:58:35'),
(699, 11111, 'rodriguez', 'Rodriguez Caballero 11', 'Featuring a carefully chosen, solid Canadian cedar top and laminated bubinga back and sides, the Caballero 11 classical guitar is a beauty to behold and play. The headstock and fretboard are of Indian rosewood. Nickel-plated tuners and Silver-plated frets are installed to last a lifetime. The body binding and wood rosette are exquisite.\r\n\r\nThe Rodriguez Guitar is hand crafted and glued to create precise balances. From the invisible careful sanding, even inside the body, that ensures the finished instrument''s purity of tone, to the beautifully unique rosette inlays around the soundhole and on the back of the neck, each guitar is a credit to its luthier and worthy of being handed down from one generation to another.\r\n\r\nThe tone, resonance and beauty of fine guitars are all dependent upon the wood from which they are made. The wood used in the construction of Rodriguez guitars is carefully chosen and aged to guarantee the highest quality. No wood is purchased before the tree has been cut down, and at least 2 years must elapse before the tree is turned into lumber. The wood has to be well cut from the log. The grain must be close and absolutely vertical. The shop is totally free from humidity.', '415.00', '39.00', '2015-07-30 14:12:41'),
(799, 22222, 'precision', 'Fender Precision', 'The Fender Precision bass guitar delivers the sound, look, and feel today''s bass players demand. This bass features that classic P-Bass old-school design. Each Precision bass boasts contemporary features and refinements that make it an excellent value. Featuring an alder body and a split single-coil pickup, this classic electric bass guitar lives up to its Fender legacy.\r\n\r\nFeatures:\r\n\r\n* Body: Alder\r\n* Neck: Maple, modern C shape, tinted satin urethane finish\r\n* Fingerboard: Rosewood or maple (depending on color)\r\n* 9-1/2" Radius (241 mm)\r\n* Frets: 20 Medium-jumbo frets\r\n* Pickups: 1 Standard Precision Bass split single-coil pickup (Mid)\r\n* Controls: Volume, Tone\r\n* Bridge: Standard vintage style with single groove saddles\r\n* Machine heads: Standard\r\n* Hardware: Chrome\r\n* Pickguard: 3-Ply Parchment\r\n* Scale Length: 34" (864 mm)\r\n* Width at Nut: 1-5/8" (41.3 mm)\r\n* Unique features: Knurled chrome P Bass knobs, Fender transition logo', '799.99', '30.00', '2015-06-01 11:29:35'),
(899, 22222, 'hofner', 'Hofner Icon', 'With authentic details inspired by the original, the Hofner Icon makes the legendary violin bass available to the rest of us. Don''t get the idea that this a just a "nowhere man" look-alike. This quality instrument features a real spruce top and beautiful flamed maple back and sides. The semi-hollow body and set neck will give you the warm, round tone you expect from the violin bass.\r\n\r\nFeatures:\r\n\r\n* Authentic details inspired by the original\r\n* Spruce top\r\n* Flamed maple back and sides\r\n* Set neck\r\n* Rosewood fretboard\r\n* 30" scale\r\n* 22 frets\r\n* Dot inlay', '499.99', '25.00', '2015-07-30 14:18:33'),
(999, 33333, 'ludwig', 'Ludwig 5-piece Drum Set with Cymbals', 'This product includes a Ludwig 5-piece drum set and a Zildjian starter cymbal pack.\r\n\r\nWith the Ludwig drum set, you get famous Ludwig quality. This set features a bass drum, two toms, a floor tom, and a snare?each with a wrapped finish. Drum hardware includes LA214FP bass pedal, snare stand, cymbal stand, hi-hat stand, and a throne.\r\n\r\nWith the Zildjian cymbal pack, you get a 14" crash, 18" crash/ride, and a pair of 13" hi-hats. Sound grooves and round hammer strikes in a simple circular pattern on the top surface of these cymbals magnify the basic sound of the distinctive alloy.\r\n\r\nFeatures:\r\n\r\n* Famous Ludwig quality\r\n* Wrapped finishes\r\n* 22" x 16" kick drum\r\n* 12" x 10" and 13" x 11" toms\r\n* 16" x 16" floor tom\r\n* 14" x 6-1/2" snare drum kick pedal\r\n* Snare stand\r\n* Straight cymbal stand hi-hat stand\r\n* FREE throne', '699.99', '30.00', '2015-07-30 12:46:40'),
(1999, 33333, 'tama', 'Tama 5-Piece Drum Set with Cymbals', 'The Tama 5-piece Drum Set is the most affordable Tama drum kit ever to incorporate so many high-end features.\r\n\r\nWith over 40 years of experience, Tama knows what drummers really want. Which is why, no matter how long you''ve been playing the drums, no matter what budget you have to work with, Tama has the set you need, want, and can afford. Every aspect of the modern drum kit was exhaustively examined and reexamined and then improved before it was accepted as part of the Tama design. Which is why, if you start playing Tama now as a beginner, you''ll still enjoy playing it when you''ve achieved pro-status. That''s how good these groundbreaking new drums are.\r\n\r\nOnly Tama comes with a complete set of genuine Meinl HCS cymbals. These high-quality brass cymbals are made in Germany and are sonically matched so they sound great together. They are even lathed for a more refined tonal character. The set includes 14" hi-hats, 16" crash cymbal, and a 20" ride cymbal.\r\n\r\nFeatures:\r\n\r\n* 100% poplar 6-ply/7.5mm shells\r\n* Precise bearing edges\r\n* 100% glued finishes\r\n* Original small lugs\r\n* Drum heads\r\n* Accu-tune bass drum hoops\r\n* Spur brackets\r\n* Tom holder\r\n* Tom brackets', '799.99', '15.00', '2015-07-30 13:14:15');

INSERT INTO Customers (CustomerID, EmailAddress, Password, FirstName, LastName, ShippingAddressID, BillingAddressID) VALUES
(1, 'allan.sherwood@yahoo.com', '650215acec746f0e32bdfff387439eefc1358737', 'Allan', 'Sherwood', 11, 21),
(2, 'barryz@gmail.com', '3f563468d42a448cb1e56924529f6e7bbe529cc7', 'Barry', 'Zimmer', 31, 31),
(3, 'christineb@solarone.com', 'ed19f5c0833094026a2f1e9e6f08a35d26037066', 'Christine', 'Brown', 41, 41),
(4, 'david.goldstein@hotmail.com', 'b444ac06613fc8d63795be9ad0beaf55011936ac', 'David', 'Goldstein', 51, 61),
(5, 'erinv@gmail.com', '109f4b3c50d7b0df729d299bc6f8e9ef9066971f', 'Erin', 'Valentino', 71, 71),
(6, 'frankwilson@sbcglobal.net', '3ebfa301dc59196f18593c45e519287a23297589', 'Frank Lee', 'Wilson', 81, 81),
(7, 'gary_hernandez@yahoo.com', '1ff2b3704aede04eecb51e50ca698efd50a1379b', 'Gary', 'Hernandez', 91, 101),
(8, 'heatheresway@mac.com', '911ddc3b8f9a13b5499b6bc4638a2b4f3f68bf23', 'Heather', 'Esway', 111, 112);

INSERT INTO Addresses (AddressID, CustomerID, Line1, Line2, City, State, ZipCode, Phone, Disabled) VALUES
(11, 1, '100 East Ridgewood Ave.', '', 'Paramus', 'NJ', '07652', '201-653-4472', 0),
(21, 1, '21 Rosewood Rd.', '', 'Woodcliff Lake', 'NJ', '07677', '201-653-4472', 0),
(31, 2, '16285 Wendell St.', '', 'Omaha', 'NE', '68135', '402-896-2576', 0),
(41, 3, '19270 NW Cornell Rd.', '', 'Beaverton', 'OR', '97006', '503-654-1291', 0),
(51, 4, '186 Vermont St.', 'Apt. 2', 'San Francisco', 'CA', '94110', '415-292-6651', 0),
(61, 4, '1374 46th Ave.', '', 'San Francisco', 'CA', '94129', '415-292-6651', 0),
(71, 5, '6982 Palm Ave.', '', 'Fresno', 'CA', '93711', '559-431-2398', 0),
(81, 6, '23 Mountain View St.', '', 'Denver', 'CO', '80208', '303-912-3852', 0),
(91, 7, '7361 N. 41st St.', 'Apt. B', 'New York', 'NY', '10012', '212-335-2093', 0),
(101, 7, '3829 Broadway Ave.', 'Suite 2', 'New York', 'NY', '10012', '212-239-1208', 0),
(111, 8, '2381 Buena Vista St.', '', 'Los Angeles', 'CA', '90023', '213-772-5033', 0),
(112, 8, '291 W. Hollywood Blvd.', '', 'Los Angeles', 'CA', '90024', '213-391-2938', 0);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShipAmount, TaxAmount, ShipDate, ShipAddressID, CardType, CardNumber, CardExpires, BillingAddressID) VALUES
(1000, 1, '2015-02-28 09:40:28', '5.00', '32.32', '2015-02-28 15:32:51', 1, 'Visa', '4111111111111111', '04/2015', 2),
(2000, 2, '2015-02-28 11:23:20', '5.00', '0.00', '2015-02-28 12:52:14', 3, 'Visa', '4012888888881881', '08/2016', 3),
(3000, 1, '2015-02-25 09:44:58', '10.00', '89.92', '2015-02-27 9:11:41', 1, 'Visa', '4111111111111111', '04/2015', 2),
(4000, 3, '2015-02-28 15:22:31', '5.00', '0.00', '2015-03-03 16:32:21', 4, 'American Express', '3782822463100005', '04/2013', 4),
(5000, 4, '2015-02-28 05:43:11', '5.00', '0.00', '2015-03-02 14:21:12', 5, 'Visa', '4111111111111111', '04/2016', 6),
(6000, 5, '2015-02-28 18:37:22', '5.00', '0.00', NULL, 7, 'Discover', '6011111111111117', '04/2016', 7),
(7000, 6, '2015-03-01 23:11:12', '15.00', '0.00', '2015-03-03 10:21:35', 8, 'MasterCard', '5555555555554444', '04/2016', 8),
(8000, 7, '2015-03-02 11:26:38', '5.00', '0.00', NULL, 9, 'Visa', '4012888888881881', '04/2016', 10),
(9000, 4, '2015-03-03 12:22:31', '5.00', '0.00', NULL, 5, 'Visa', '4111111111111111', '04/2016', 6);

INSERT INTO OrderItems (ItemID,OrderID, ProductID, ItemPrice, DiscountAmount, Quantity) VALUES
(1,1000, 299, '1199.00', '359.70', 1),
(2,2000, 499, '489.99', '186.20', 1),
(3,3000, 399, '2517.00', '1308.84', 1),
(4,3000, 699, '415.00', '161.85', 1),
(5,4000, 299, '1199.00', '359.70', 2),
(6,5000, 599, '299.00', '0.00', 1),
(7,6000, 599, '299.00', '0.00', 1),
(8,7000, 199, '699.00', '209.70', 1),
(9,7000, 799, '799.99', '240.00', 1),
(10,7000, 999, '699.99', '210.00', 1),
(11,8000, 1999, '799.99', '120.00', 1),
(12,9000, 1999, '699.00', '209.70', 1);

INSERT INTO Administrators (AdminID, EmailAddress, Password, FirstName, LastName) VALUES
(1, 'admin@myguitarshop.com', '6a718fbd768c2378b511f8249b54897f940e9022', 'Admin', 'User'),
(2, 'joel@murach.com', '971e95957d3b74d70d79c20c94e9cd91b85f7aae', 'Joel', 'Murach'),
(3, 'mike@murach.com', '3f2975c819cefc686282456aeae3a137bf896ee8', 'Mike', 'Murach');

/*-----------------------------------------------------------*/
/* 					  PARUQES NATURALES						 */
/*-----------------------------------------------------------*/

create database parquesNaturales;
use parquesNaturales;

CREATE  table if not exists tipoEspecie (
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

/*-----------------------------------------------------------*/
/* 					  EJERCICIO2 FILTRO						 */
/*-----------------------------------------------------------*/

CREATE DATABASE downloadsUser;
use downloadsUser;

CREATE TABLE product (
  IdProduct         INT            PRIMARY KEY ,
  NameProduct       VARCHAR(100)   NOT NULL           
);

CREATE TABLE user (
    userId         INT            PRIMARY KEY ,
    EmailAddress   VARCHAR(100)   NOT NULL,
    FirstName      VARCHAR(100)   NOT NULL,
    LastName       VARCHAR(100)   NOT NULL          
);
CREATE TABLE download (
  IdDownload   INT,
  FileName     VARCHAR(100)     NOT NULL,
  timeDownload DATETIME         NOT NULL,
  IdProduct INT,
  userId    INT,
  PRIMARY key (IdDownload, IdProduct, userId),
  FOREIGN KEY (IdProduct) REFERENCES product(IdProduct),     
  FOREIGN KEY (userId) REFERENCES user(userId)
);

/*INSERTS */

INSERT INTO product (IdProduct, NameProduct) VALUES
	(1, 'Product 1'),
	(2, 'Product 2'),
	(3, 'Product 3'),
	(4, 'Product 4'),
	(5, 'Product 5'),
	(6, 'Product 6'),
	(7, 'Product 7'),
	(8, 'Product 8'),
	(9, 'Product 9'),
	(10, 'Product 10');

INSERT INTO user (userId, EmailAddress, FirstName, LastName) VALUES
	(1, 'user1@example.com', 'John', 'Doe'),
	(2, 'user2@example.com', 'Jane', 'Smith'),
	(3, 'user3@example.com', 'Michael', 'Johnson'),
	(4, 'user4@example.com', 'Emily', 'Brown'),
	(5, 'user5@example.com', 'William', 'Wilson'),
	(6, 'user6@example.com', 'Sophia', 'Lee'),
	(7, 'user7@example.com', 'Daniel', 'Anderson'),
	(8, 'user8@example.com', 'Olivia', 'Martinez'),
	(9, 'user9@example.com', 'Alexander', 'Taylor'),
	(10, 'user10@example.com', 'Isabella', 'Garcia');

INSERT INTO download (IdDownload, FileName, timeDownload, IdProduct, userId) VALUES
	(1, 'file1.txt', '2024-05-05 10:00:00', 1, 1),
	(2, 'file2.txt', '2024-05-05 10:05:00', 2, 2),
	(3, 'file3.txt', '2024-05-05 10:10:00', 3, 3),
	(4, 'file4.txt', '2024-05-05 10:15:00', 4, 4),
	(5, 'file5.txt', '2024-05-05 10:20:00', 5, 5),
	(6, 'file6.txt', '2024-05-05 10:25:00', 6, 6),
	(7, 'file7.txt', '2024-05-05 10:30:00', 7, 7),
	(8, 'file8.txt', '2024-05-05 10:35:00', 8, 8),
	(9, 'file9.txt', '2024-05-05 10:40:00', 9, 9),
	(10, 'file10.txt', '2024-05-05 10:45:00', 10, 10);
