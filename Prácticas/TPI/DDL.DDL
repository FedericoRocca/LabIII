use master
GO

drop database TPII_LABIII
GO

create database TPII_LABIII
GO

use TPII_LABIII
GO

-- Creo las tablas
create table Paises
(
	IdPais INT Primary Key Identity(1, 1),
	Nombre varchar(50) NOT NULL
)

create table Generos
(
	IdGenero INT Primary Key Identity(1, 1),
	Nombre varchar(50) NOT NULL
)

create table Calificaciones
(
	IdCalificacion int primary key identity(1, 1),
	Nombre varchar(50) NOT NULL
)

create table Actores
(
	IdActor INT Primary Key identity(1, 1),
	Apellido varchar(50) not null,
	Nombre varchar(50) not null,
	Fecha_Nacimiento date not null,
	IdPais int not null foreign key (IdPais) references Paises(IdPais)
)

create table Peliculas
(
	IdPelicula INT Primary key Identity(1, 1),
	IdPais INT foreign key (IdPais) references Paises(IdPais),
	Titulo varchar(50) not null,
	Inversion money not null,
	Recaudacion money not null,
	Tickets_Vendidos INT not null,
	IdGenero INT not null foreign key (IdGenero) references Generos(IdGenero),
	Fecha_Estreno date not null,
	Duracion smallint not null,
	IdCalificacion INT not null foreign key (IdCalificacion) references Calificaciones(IdCalificacion),
	Puntaje float not null
)

create table Actores_x_Pelicula
(
	IdPelicula INT not null foreign key (IdPelicula) references Peliculas(IdPelicula),
	IdActor INT not null foreign key (IdActor) references Actores(IdActor)
)
GO