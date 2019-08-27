use Club;
-- 1)
select [Actividades].Nombre, [Sedes].* from Actividades inner join Sedes on
[Actividades].IDSede = [Sedes].ID;

-- 2)
select [Actividades].Nombre, [Actividades].Costo, [Sedes].Direccion, [Sedes].IDLocalidad as 'Código postal', [Sedes].Telefono 
from Actividades inner join Sedes on [Actividades].IDSede = [Sedes].ID;

-- 3)
select [Actividades].Nombre, [Actividades].Costo from Actividades
inner join Sedes on ([Actividades].IDSede = [Sedes].ID) and [Sedes].IDLocalidad = 1111;

-- 4)
select Sedes.Nombre as 'Sede', 
Sedes.Direccion as 'Dirección', 
Localidades.Nombre as 'Localidad' 
from Sedes
right join Localidades on ( Sedes.IDLocalidad = Localidades.ID )

-- 5)
select Socios.Nombres as 'Nombre',
Socios.Apellidos as 'Apellido',
Socios.Genero as 'Género',
Inscripciones.FechaInscripcion
from Socios
inner join Inscripciones on 
( Socios.Legajo = Inscripciones.Legajo )
where Inscripciones.Becado = 1

-- 6)
select Actividades.Nombre, Inscripciones.Legajo from Actividades
inner join Inscripciones on ( Actividades.ID = Inscripciones.IDActividad )
where Inscripciones.Legajo = '1000'

-- 7)
select distinct Actividades.Nombre from Actividades
inner join Inscripciones on
( Inscripciones.IDActividad = Actividades.ID )
where YEAR( Inscripciones.FechaInscripcion ) = 2019

-- 8)
select Socios.Nombres as 'Nombre',
Socios.Apellidos as 'Apellido',
Inscripciones.IDInscripcion as 'Código de inscripción',
Inscripciones.FechaInscripcion as 'Fecha de inscripción'
from Socios
left join Inscripciones on
( Socios.Legajo = Inscripciones.Legajo )














