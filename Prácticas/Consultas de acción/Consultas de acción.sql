-- Consultas de acción
    USE master
    GO

    Create Database MiniUTN
    GO

    USE MiniUTN
    GO

    create table Alumnos
    (
        Legajo int primary key identity (1,1),
        Apellidos varchar(50) not null,
        Nombres varchar(50) not null
    )

    create table Carreras
    (
        ID int primary key identity(1,1),
        Nombre varchar(100) not null,
        NombreCorto varchar(10) not null,
        Duracion tinyint not null
    )

    create table Materias
    (
        ID int primary key  identity(1,1),
        Nombre varchar(100) not null,
        IDCarrera int not null foreign key references Carreras (ID),
        Anio tinyint not null, 
        Cuatrimestre tinyint not null
    )

    create table Examenes
    (
        Legajo int foreign key references Alumnos (Legajo),
        IDMateria int foreign key references Materias (ID),
        Fecha Date,
        Nota tinyint null check( Nota >= 1 and nota <= 10)
        primary key (Legajo, IDMateria, Fecha)
    )

    create table Inscripciones
    (
        Legajo int,
        IDMateria int,
        Anio tinyint,
        Cuatrimestre tinyint,
        Estado char,
        IDInscripcion bigint identity (1,1),
        Fecha Datetime not null
    )

    alter table Inscripciones
    add constraint UQ_Inscripciones Unique(Legajo, IDMateria, Anio, Cuatrimestre)

    alter table Inscripciones
    add constraint FK_Legajo foreign key (Legajo) references Alumnos (Legajo)

    alter table Inscripciones
    add constraint FK_IDMateria foreign key (IdMateria) references Materias (ID)

    create table Bajas
    (
        Legajo int,
        IDCarrera int,
        Fecha date not null,
        Motivo varchar(2048) null
    )

    alter table Bajas
    add constraint UQ_Bajas Unique (Legajo, IDCarrera, Fecha)

    alter table Bajas
    add constraint FK_BajasLegajo foreign key (Legajo) references Alumnos (Legajo)

    alter table Bajas
    add constraint FK_IDCarrera foreign key (IDCarrera) references Carreras (ID)