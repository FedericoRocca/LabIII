-- Subconsultas
    -- 1) Las actividades con el mayor costo.
        select * from Actividades where Costo = 
        (
            Select MAX(Costo) from Actividades
        )
        
    -- 2) Los pagos con el menor importe.
        select * from Pagos where Importe =
        (
            select min(Importe) from Pagos
        )

    -- 3) Las actividades cuyo precio sea mayor al precio promedio (XLS).
        select * from Actividades where Costo >
        (
            select AVG(Costo) from Actividades
        )

    -- 4) Los socios que no se inscribieron a ninguna actividad (XLS).
        select * from Socios where Legajo not in
        (
            select distinct Legajo from Inscripciones
        )

    -- 5) Las actividades que no registran ningún socio inscripto.
        select * from Actividades where ID not in
        (
            select distinct IDActividad from Inscripciones
        )

    -- 6) Las actividades que no registran ningún socio becado (XLS).
        select * from Actividades where ID not in
        (
            select IDActividad from Inscripciones where Becado = 1
        )

    -- 7) Las actividades cuyo costo sea mayor a alguna actividad que requiera Apto Médico (XLS).
        select * from Actividades where Costo > some
        (
            select Costo from Actividades where AptoMedico = 1
        )

    -- 8) Las actividades cuyo costo sea menor a cualquier actividad que requiera Apto Médico (XLS).
        select * from Actividades where Costo > all
        (
            select Costo from Actividades where AptoMedico = 1
        )

    -- 9) Las actividades cuyo costo sea mayor a cualquier actividad que se realice en la Sede 2.
        select * from Actividades where Costo > all
        (
            Select Costo from Actividades where IDSede = 2
        )

    -- 10) Por cada actividad, el nombre y la cantidad de inscriptos de género masculino y la cantidad de inscriptos de género femenino.
        select Actividades.Nombre as 'Actividad',
        (
            select count (distinct Socios.Legajo) from Socios
            inner join Inscripciones on Socios.Legajo = Inscripciones.Legajo
            where Socios.Genero = 'M' and Inscripciones.IDActividad = Actividades.ID
        ) as 'Masculinos',
        (
            select count (distinct Socios.Legajo) from Socios
            inner join Inscripciones on Socios.Legajo = Inscripciones.Legajo
            where Socios.Genero = 'F' and Inscripciones.IDActividad = Actividades.ID
        ) as 'Femeninos'
        from Actividades

    -- 11) Por cada socio, la cantidad de actividades que requieren apto médico que realiza y la cantidad de actividades que no requieren apto médico (XLS).
        select Apellidos, Nombres,
        (
            select COUNT(*) from Inscripciones
            inner join Actividades ON Inscripciones.IDActividad = Actividades.ID
            where AptoMedico = 0 and Inscripciones.Legajo = Socios.Legajo
        ) as 'No requiere',
        (
            select COUNT(*) from Inscripciones
            inner join Actividades ON Inscripciones.IDActividad = Actividades.ID
            where AptoMedico = 1 and Inscripciones.Legajo = Socios.Legajo
        ) as 'Requiere'
        from Socios

    -- 12) La cantidad de actividades que registraron la misma cantidad de socios de género masculino que socios de género femenino.
        select count(*) from
        (
            select Actividades.Nombre,
            (
                select count( distinct Socios.Legajo ) from Socios
                inner join Inscripciones on Socios.Legajo = Inscripciones.Legajo
                where Socios.Genero = 'M' and Inscripciones.IDActividad = Actividades.ID
            ) as cantM,
            (
                select count( distinct Socios.Legajo ) from Socios
                inner join Inscripciones on Socios.Legajo = Inscripciones.Legajo
                where Socios.Genero = 'F' and Inscripciones.IDActividad = Actividades.ID
            ) as cantF from Actividades
        ) as Aux
        where cantF = cantM

    -- 13) El porcentaje de inscripciones realizadas en el año actual con respecto al total de inscripciones.
        select count(*) from Inscripciones

    -- 14) Las actividades que registran la misma cantidad de socios de género masculino que socios de género femenino.
        

    -- 15) Los socios que realizan únicamente actividades que no requiere apto médico.
        

    -- 16) Los socios que realicen más actividades que requieren apto médico que actividades que no lo requieran y que al menos realicen una actividad que no requiera apto médico (XLS).