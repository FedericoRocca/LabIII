-- 1)
select Actividades.Nombre, Actividades.Costo
from Actividades
where Costo =
(
    select MAX(Costo) from Actividades
)

-- 2)
select * from Pagos
where Importe = 
(
    select MIN(Importe) from Pagos 
)

-- 3)
select Nombre, Costo| from Actividades
where Costo >
(
    select AVG(Costo) from Actividades
)

-- 4)
select * from Socios
where Legajo not in
(
    select distinct Legajo from Inscripciones
)

-- 5)
select * from Actividades
where ID not in
(
    select distinct IDActividad from Inscripciones
)

-- 6)
select * from Actividades
where Actividades.ID not in
(
    select IDActividad from Inscripciones where becado = 1
)

-- 7)
select * from Actividades where Costo >
(
    select min(Costo) from Actividades where AptoMedico = 1
)

-- 8)
select * from Actividades where Costo <
(
    select min(Costo) from Actividades where AptoMedico = 1
)

-- 10)
select Actividades.Nombre as 'Actividad',
(
    select count(*) from Inscripciones
    inner join Socios on Inscripciones.Legajo = Socios.Legajo
    where Socios.Genero = 'M' and Actividades.ID = Inscripciones.IDActividad
) as 'Cantidad masculinos', 
(
    select count(*) from Inscripciones
    inner join Socios on Inscripciones.Legajo = Socios.Legajo
    where Socios.Genero = 'F' and Actividades.ID = Inscripciones.IDActividad
) as 'Cantidad femeninos'
from Actividades

-- Ejemplo de subconsulta armando una tabla auxiliar
select * from 
(
    select Actividades.Nombre as 'Actividad',
    (
        select count(*) from Inscripciones
        inner join Socios on Inscripciones.Legajo = Socios.Legajo
        where Socios.Genero = 'M' and Actividades.ID = Inscripciones.IDActividad
    ) as 'Cantidad masculinos', 
    (
        select count(*) from Inscripciones
        inner join Socios on Inscripciones.Legajo = Socios.Legajo
        where Socios.Genero = 'F' and Actividades.ID = Inscripciones.IDActividad
    ) as 'Cantidad femeninos'
    from Actividades
) as aux
where aux.[Cantidad masculinos] > aux.[Cantidad femeninos] and aux.[Cantidad femeninos] > 0

-- 11)
select S.Legajo, S.Apellidos, S.Nombres,
(
    select count(*) from Inscripciones as I
    inner join Actividades as A on I.IDActividad = A.ID
    where A.AptoMedico = 1 and I.Legajo = S.Legajo
) as Requiere,
(
    select count(*) from Inscripciones as I
    inner join Actividades as A on I.IDActividad = A.ID
    where A.AptoMedico = 0 and I.Legajo = S.Legajo
) as NoRequiere
from Socios as S