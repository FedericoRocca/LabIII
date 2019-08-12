-- Me conecto a Master para desconectarme de la DDBB si está en uso
USE MASTER
GO

-- Si existe la DDBB la dropeo, si no existe la creo
If(db_id(N'ClaseI') IS NULL)
BEGIN
	CREATE DATABASE ClaseI
END
ELSE
BEGIN
	DROP DATABASE ClaseI
END
GO

-- Me conecto a la DDBB
USE ClaseI;
GO

-- Creo la tabla de Sedes
CREATE TABLE Sedes
(
	ID INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR (50) NOT NULL,
	Localidad VARCHAR (50) NOT NULL,
	Provincia VARCHAR (50) NOT NULL,
	Direccion VARCHAR (50) NOT NULL,
	CodPostal INT NOT NULL,
	Telefono INT,
	Mail VARCHAR (50)
)
GO

-- Creo la tabla de actividades
CREATE TABLE Actividades
(
	ID INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR (50) NOT NULL,
	Costo MONEY NOT NULL check(Costo > 0),
	ReqAptoMedico BIT NOT NULL,
	Sede INT NOT NULL FOREIGN KEY (Sede) REFERENCES Sedes (ID)
)
GO

-- Creo la tabla actividades por socio
CREATE TABLE ActividadesPorSocio
(
	Legajo INT,
	Actividad INT NOT NULL FOREIGN KEY (Actividad) REFERENCES Actividades (ID),
	Becado BIT NOT NULL,
	PRIMARY KEY (Legajo, Actividad)
)
GO

-- Creo la tabla Socios
CREATE TABLE Socios
(
	Legajo INT NOT NULL PRIMARY KEY FOREIGN KEY (Legajo) REFERENCES ActividadesPorSocio (Legajo),
	Apellido VARCHAR (50) NOT NULL,
	Nombres VARCHAR (50) NOT NULL,
	Edad TINYINT NOT NULL CHECK( Edad > 0 ),
	FechaNacimiento DATE NOT NULL CHECK( FechaNacimiento < '01/01/2010' ),
	Genero CHAR
)

-- Insert de datos en la tabla de sedes
INSERT INTO Sedes VALUES ('Norte', 'San Fernando', 'Buenos Aires', 'Presidente Simón 4400', '1111', '14141414', 'norte@lab3.com' )
INSERT INTO Sedes VALUES ('Sur', 'Lanús', 'Capital Federal', 'Dr Kloster 1080', '2222', '15151515', 'sur@lab3.com' )
INSERT INTO Sedes VALUES ('Microestadio', 'Tigre', 'Buenos Aires', 'Virrey Calabuig 1350', '3333', NULL, 'micro@lab3.com' )
INSERT INTO Sedes VALUES ('Microestadio II', 'Pilar', 'Buenos Aires', 'Almirante de Amos 3200', '2222', '13131313', NULL )
INSERT INTO Sedes VALUES ('Norte II', 'San Fernando', 'Buenos Aires', 'Av. Codeblocks', '1111', '90909090', NULL )
GO

-- Insert de datos en la tabla de Actividades
INSERT INTO Actividades VALUES ('Ajedrez', '250', '0', '1')
INSERT INTO Actividades VALUES ('Voley', '450', '1', '3')
INSERT INTO Actividades VALUES ('Handball', '450', '1', '3')
INSERT INTO Actividades VALUES ('Fútbol', '500', '1', '4')
INSERT INTO Actividades VALUES ('Natación', '1850', '1', '4')
INSERT INTO Actividades VALUES ('Yoga', '500', '1', '2')
INSERT INTO Actividades VALUES ('Taller literario', '100', '0', '1')
INSERT INTO Actividades VALUES ('Fortnite', '1850', '0', '1')
INSERT INTO Actividades VALUES ('Programación', '1400', '0', '1')
INSERT INTO Actividades VALUES ('Doom', '500', '0', '2')
GO

-- Insert de datos en la tabla de actividades por socio
INSERT INTO ActividadesPorSocio VALUES ('1000', '1', '0')
INSERT INTO ActividadesPorSocio VALUES ('1000', '3', '0')
INSERT INTO ActividadesPorSocio VALUES ('1000', '2', '0')
INSERT INTO ActividadesPorSocio VALUES ('2000', '1', '0')
INSERT INTO ActividadesPorSocio VALUES ('3000', '3', '0')
INSERT INTO ActividadesPorSocio VALUES ('3000', '2', '1')
INSERT INTO ActividadesPorSocio VALUES ('5000', '4', '1')
INSERT INTO ActividadesPorSocio VALUES ('6000', '1', '0')
INSERT INTO ActividadesPorSocio VALUES ('6000', '3', '1')
INSERT INTO ActividadesPorSocio VALUES ('6000', '2', '0')
INSERT INTO ActividadesPorSocio VALUES ('7000', '4', '0')
INSERT INTO ActividadesPorSocio VALUES ('8000', '10', '1')
GO

-- Insert de datos en la tabla de actividades
INSERT INTO Actividades VALUES ('1', 'Ajedrez', '250', 'No', '1')
INSERT INTO Actividades VALUES ('2', 'Voley', '450', 'Sí', '3')
INSERT INTO Actividades VALUES ('3', 'Handball', '450', 'Sí', '3')
INSERT INTO Actividades VALUES ('4', 'Fútbol', '500', 'Sí', '4')
INSERT INTO Actividades VALUES ('5', 'Natación', '1850', 'Sí', '4')
INSERT INTO Actividades VALUES ('6', 'Yoga', '500', 'Sí', '2')
INSERT INTO Actividades VALUES ('7', 'Taller literario', '100', 'No', '1')
INSERT INTO Actividades VALUES ('8', 'Fortnite', '1850', 'No', '1')
INSERT INTO Actividades VALUES ('9', 'Programación', '1400', 'No', '1')
INSERT INTO Actividades VALUES ('10', 'Doom', '500', 'No', '2')
GO

-- Insert de datos en la tabla de socios
INSERT INTO Socios VALUES ('1000', 'Angelelli', 'Javier', DATEDIFF(yy, '1/1/1990', CURRENT_TIMESTAMP), '1/1/1990', 'M')
INSERT INTO Socios VALUES ('2000', 'Baires', 'Belén', DATEDIFF(yy, '2/2/1998', CURRENT_TIMESTAMP), '2/2/1998', 'F')
INSERT INTO Socios VALUES ('3000', 'Corrionero', 'Juan', DATEDIFF(yy, '3/3/2004', CURRENT_TIMESTAMP), '3/3/2004', 'M')
INSERT INTO Socios VALUES ('5000', 'Garcia', 'Oriana', DATEDIFF(yy, '4/4/1986', CURRENT_TIMESTAMP), '4/4/1986', 'F')
INSERT INTO Socios VALUES ('6000', 'Kusters', 'Kevin', DATEDIFF(yy, '5/5/2000', CURRENT_TIMESTAMP), '5/5/2000', 'M')
INSERT INTO Socios VALUES ('7000', 'Lacioppa', 'Ignacio', DATEDIFF(yy, '6/6/2000', CURRENT_TIMESTAMP), '6/6/2000', 'M')
INSERT INTO Socios VALUES ('8000', 'Rocca', 'Federico', DATEDIFF(yy, '7/7/1960', CURRENT_TIMESTAMP), '7/7/1960', 'M')
INSERT INTO Socios VALUES ('9000', 'Albornoz', 'Magalí', DATEDIFF(yy, '8/8/1990', CURRENT_TIMESTAMP), '8/8/1990', 'F')
GO