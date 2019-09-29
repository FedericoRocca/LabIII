-- Funciones de resumen
    -- 1) La cantidad de socios.
        select count(*) as 'Total de socios' from Socios

    -- 2) La cantidad de socios que se identifican con el sexo femenino (XLS).
        select count(*) as 'Total de femeninos' from Socios where Genero = 'F'

    -- 3) La cantidad de socios que nacieron en el año 1990.
        select count(*) as 'Total de socios que nacieron en el año 1990' from Socios where YEAR(FechaNacimiento) = 1990

    -- 4) El promedio de los importes de todos los pagos.
        select AVG(Importe) as 'Promedio de pagos' from Pagos

    -- 5) El promedio de los importes de todos los pagos realizados este año (XLS).
        select AVG(Importe) as 'Promedio' from Pagos where Pagos.Anio = YEAR(GETDATE())

    -- 6) La sumatoria de importes de todos los pagos.
        select SUM(Importe) as 'Suma' from Pagos

    -- 7) La sumatoria de importes de todos los pagos con estado 2 y 3 (XLS).
        select SUM(Importe) as 'Suma' from Pagos where Pagos.Estado in ('2', '3')

    -- 8) El importe máximo entre todos los pagos (XLS).
        select MAX(Importe) as 'Pago máximo' from Pagos

    -- 9) La cantidad de actividades que requieran apto médico en la sede 2.
        select count(*) as 'Cantidad de actividades' from Actividades where AptoMedico = 1 and IDSede = 2

    -- 10) El costo promedio de las actividades que no requieren apto médico.
        select AVG(Costo) as 'Costo promedio de actividades sin apto médico' from Actividades where AptoMedico = 0

    -- 11) El costo mínimo entre todas las actividades (XLS).
        select MIN(Costo) as 'Costo máximo' from Actividades

    -- 12) La cantidad de actividades por sede. Listar el nombre de la sede y la cantidad de actividades realizadas allí. (XLS)
        select Sedes.Nombre, count (*) as 'Cantidad' from Actividades
        inner join Sedes on Actividades.IDSede = Sedes.ID
        group by Sedes.Nombre

    -- 13) La sumatoria de importes pagados por cada socio. Listar el apellido y nombres de todos los socios y el total abonado. (XLS)
        select Socios.Apellidos, Socios.Nombres, sum(Pagos.Importe) as 'Total abonado' from Socios
        inner join Pagos on Socios.Legajo = Pagos.Legajo
        group by Socios.Apellidos, Socios.Nombres

    -- 14) El importe abonado por cada socio en cada año. Listar el apellido y nombres de todos los socios y el total abonado por cada año.
        select Socios.Nombres, Socios.Apellidos, YEAR(Pagos.Fecha) as 'Año', SUM(Pagos.Importe) as 'Total abonado' from Socios
        inner join Pagos on Socios.Legajo = Pagos.Legajo
        group by Socios.Nombres, Socios.Apellidos, YEAR(Pagos.fecha)

    -- 15) La cantidad de actividades realizadas por socio. Listar el apellido y nombres de todos los socios y la cantidad de actividades en las que se encuentra inscripto. Si un socio no se encuentra inscripto a ninguna actividad debe figurar en el listado contabilizando 0. (XLS)
        select Socios.Apellidos, Socios.Nombres, COUNT(Inscripciones.IDActividad) as 'Cantidad' from Socios
        left join Inscripciones on Socios.Legajo = Inscripciones.Legajo
        group by Socios.Apellidos, Socios.Nombres

    -- 16) El costo de actividad más alto por cada sede. Listar el nombre de la sede y el importe de la actividad más cara que se realiza allí (XLS).
        select Sedes.Nombre, max(Actividades.Costo) as 'Costo' from Actividades
        inner join Sedes on Actividades.IDSede = Sedes.ID
        group by Sedes.Nombre

    -- 17) La cantidad de becados por género. Listar el género y la cantidad de becados de cada género.
        select Socios.Genero, COUNT(Inscripciones.Becado) as 'Cantidad' from Inscripciones
        inner join Socios on Inscripciones.Legajo = Socios.Legajo
        where Inscripciones.Becado = 1
        group by Socios.Genero

    -- 18) Por cada socio la cantidad de sedes distintas a las que asiste. Indicar el apellido y nombre del socio y la cantidad calculada (XLS).
        select Socios.Apellidos, Socios.Nombres, count( distinct Actividades.IDSede ) as 'Cantidad' from Socios
        inner join Inscripciones on Socios.Legajo = Inscripciones.Legajo
        inner join Actividades on Inscripciones.IDActividad = Actividades.ID
        group by Socios.Apellidos, Socios.Nombres

    -- 19) La cantidad de pagos de distinto importe registrados.
        select count(distinct Importe) as 'Cantidad' from Pagos

    -- 20) La sumatoria de importes abonados por cada socio. Listar el apellido y nombres de los socios y el total abonado. Sólo listar los socios que hayan abonado más de $3000 en total. (XLS)
        select Socios.Apellidos, Socios.Nombres, SUM(Pagos.Importe) as 'Importe' from Socios
        inner join Pagos on Socios.Legajo = Pagos.Legajo
        group by Socios.Apellidos, Socios.Nombres
        having SUM(Pagos.Importe) > 3000

    -- 21) La sumatoria de importes menores a $1000 abonados por cada socio. Listar el apellido y nombres de los socios y el total abonado. 
    -- Sólo listar los socios que hayan abonado más de $3000. (XLS)
        select Socios.Apellidos, Socios.Nombres, SUM(Pagos.Importe) as 'Importe' from Socios
        inner join Pagos on Socios.Legajo = Pagos.Legajo
        where Pagos.Importe < 1000
        group by Socios.Apellidos, Socios.Nombres
        having sum(Pagos.Importe) > 3000

    -- 22) La cantidad de actividades realizadas por socio. Listar el apellido y nombres de todos los socios y la cantidad de actividades en las que se encuentra inscripto. Sólo listar los socios que realicen más de una actividad.
        select Socios.Apellidos, Socios.Nombres, COUNT(Inscripciones.IDActividad) as 'Cantidad de actividades' from Socios
        left join Inscripciones on Socios.Legajo = Inscripciones.Legajo
        group by Socios.Apellidos, Socios.Nombres
        having count(*) > 1

    -- 23) La cantidad de socios por actividad. Listar el nombre de la actividad y la cantidad de socios inscriptos a ella.
        select Actividades.Nombre as 'Actividad', COUNT(distinct Inscripciones.Legajo) as 'Cantidad de socios' from Actividades
        inner join Inscripciones on Actividades.ID = Inscripciones.IDActividad
        group by Actividades.Nombre

    -- 24) Las actividades que no posean socios inscriptos. Listar el nombre de la actividad.
        select Actividades.Nombre as 'Actividad' from Actividades
        left join Inscripciones on Actividades.ID = Inscripciones.IDActividad
        group by Actividades.Nombre
        having COUNT(Inscripciones.IDActividad) = 0