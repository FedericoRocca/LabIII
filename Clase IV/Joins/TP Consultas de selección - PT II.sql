use Club;
-- 1)
select Actividades.Nombre, Sedes.* from Actividades inner join Sedes on
Actividades.IDSede = Sedes.ID;

-- 2)
select Actividades.Nombre, Actividades.Costo, Sedes.Direccion, Sedes.IDLocalidad as 'Código postal', Sedes.Telefono 
from Actividades inner join Sedes on Actividades.IDSede = Sedes.ID;

-- 3)
select Actividades.Nombre, Actividades.Costo from Actividades
inner join Sedes on (Actividades.IDSede = Sedes.ID) and Sedes.IDLocalidad = 1111;

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

-- 9)
select Socios.Nombres as 'Nombre',
Socios.Apellidos as 'Apellido'
from Socios
left join Inscripciones
on (Socios.Legajo = Inscripciones.Legajo)
where Inscripciones.Legajo IS NULL;

-- 10)
select Socios.Nombres as 'Nombres',
Socios.Apellidos as 'Apellidos',
Actividades.Nombre as 'Actividad',
Actividades.Costo as 'Costo'
from Socios
inner join Inscripciones
on ( Socios.Legajo = Inscripciones.Legajo )
inner join Actividades
on ( Inscripciones.IDActividad = Actividades.ID )
where Inscripciones.Becado = 1 and Socios.Genero = 'F' and Actividades.AptoMedico = 1;

-- 11)
select 
Socios.Nombres as 'Nombres',
Socios.Apellidos as 'Apellidos',
Actividades.Nombre as 'Actividad',
Sedes.Nombre as 'Sede'
from Socios
inner join Inscripciones
on ( Socios.Legajo = Inscripciones.Legajo )
inner join Actividades
on ( Inscripciones.IDActividad = Actividades.ID )
inner join Sedes
on ( Sedes.ID = Actividades.IDSede )
where (Socios.Legajo = Inscripciones.Legajo) and Inscripciones.Becado = 1;

-- 12)
select 
Actividades.Nombre as 'Actividad',
Sedes.Nombre as 'Sede'
from Actividades
inner join Sedes
on Actividades.IDSede = Sedes.ID
order by Actividades.Nombre ASC;

-- 13)
select distinct
Socios.Nombres as 'Nombres',
Socios.Apellidos as 'Apellidos'
from Socios
inner join Inscripciones
on Socios.Legajo = Inscripciones.Legajo
inner join Actividades
on Inscripciones.IDActividad = Actividades.ID
inner join Sedes
on Actividades.ID = Sedes.ID
inner join Localidades
on Sedes.IDLocalidad = Localidades.ID
where Localidades.Nombre in ('San Fernando', 'Tigre');

-- 14)
select TOP 1
Socios.Nombres as 'Nombres',
Socios.Apellidos as 'Apellidos',
CONCAT(Pagos.Mes, '/' ,Pagos.Anio) as 'Periodo',
Pagos.Importe as 'Importe'
from Socios
inner join Pagos
on Socios.Legajo = Pagos.Legajo
order by Pagos.Importe DESC;

-- 15)
select 
Actividades.Nombre as 'Actividad'
from Socios
inner join Inscripciones
on Socios.Legajo = Inscripciones.Legajo
inner join Actividades
on Inscripciones.IDActividad = Actividades.ID
where Inscripciones.Becado = 1
order by Actividades.Costo DESC;

-- 16)


















