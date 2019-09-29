-- Joins
    -- 1) Listar para cada actividad, todos los datos de la sede donde se realiza la actividad.
        select Actividades.Nombre, Sedes.Direccion, Sedes.IDLocalidad as 'Localidad', Sedes.Mail, Sedes.Nombre, Sedes.Telefono from Actividades
        inner join Sedes on Sedes.ID = Actividades.IDSede

    -- 2) Listar el nombre y el costo de las actividades y la dirección, código postal y teléfono donde se realiza la actividad. (XLS)
        select Actividades.Nombre, Actividades.Costo, Sedes.Direccion, Sedes.IDLocalidad, Sedes.Telefono from Actividades
        inner join Sedes on Actividades.IDSede = Sedes.ID
        
    -- 3) Listar el nombre y costo de todas las actividades que se realicen en el Código Postal 1111.
        select Actividades.Nombre, Actividades.Costo from Actividades
        inner join Sedes on Actividades.IDSede = Sedes.ID
        where Sedes.IDLocalidad = 1111

    -- 4) Listar el nombre, dirección y nombre de la localidad de todas las sedes. Incluir en el listado aquellas localidades que no tengan una sede asociada completando con NULL los campos de la sede que no pudo asociarse a la localidad. (XLS).
        select Sedes.Nombre, Sedes.Direccion, Localidades.Nombre from Sedes
        right join Localidades on Sedes.IDLocalidad = Localidades.ID

    -- 5) Listar el apellido y nombre y género de los socios que se encuentren becados (XLS).
        select Socios.Apellidos, Socios.Nombres, Socios.Genero from Inscripciones
        inner join Socios on Inscripciones.Legajo = Socios.Legajo
        where Becado = 1

    -- 6) Listar el nombre de todas las actividades que realiza el socio con Legajo 1000.
        select Actividades.Nombre from Inscripciones
        inner join Actividades on Inscripciones.IDActividad = Actividades.ID
        where Inscripciones.Legajo = 1000

    -- 7) Listar el nombre de todas las actividades que tengan algún inscripto en el año 2019 (sin repeticiones).
        select distinct Actividades.Nombre from Actividades
        inner join Inscripciones on Actividades.ID = Inscripciones.IDActividad
        where YEAR(Inscripciones.FechaInscripcion) = 2019

    -- 8) Listar el nombre, apellido, código de inscripción y fecha de inscripción de las inscripciones que haya realizado un socio. Incluir en el listado a los socios que no poseen inscripciones completando con NULL los campos de la inscripción que no pudo asociarse al socio. (XLS)
        select distinct Socios.Nombres, Socios.Apellidos, Inscripciones.IDInscripcion, Inscripciones.FechaInscripcion from Socios
        left join Inscripciones on Socios.Legajo = Inscripciones.Legajo order by Socios.Apellidos desc

    -- 9) Listar el nombre y apellido de los socios que no realicen ninguna actividad (que no posean inscripciones) (XLS).
        select Socios.Nombres, Socios.Apellidos from Socios
        left join Inscripciones on Socios.Legajo = Inscripciones.Legajo
        where IDInscripcion is null

    -- 10) Listar el nombre y apellido del socio, nombre de actividad y costo de la actividad de todos los socios de sexo femenino que realicen actividades que requieren apto médico. (XLS)
        select Socios.Nombres, Socios.Apellidos, Actividades.Nombre, Actividades.Costo from Socios
        inner join Inscripciones on Socios.Legajo = Inscripciones.Legajo
        inner join Actividades on Inscripciones.IDActividad = Actividades.ID
        where Socios.Genero = 'F' and Actividades.AptoMedico = 1

    -- 11) Listar nombre y apellido del socio, nombre de la actividad y nombre de la sede donde la realiza de aquellos socios que se encuentren becados en dicha actividad.
        select Socios.Nombres, Socios.Apellidos, Actividades.Nombre, Sedes.Nombre from Socios
        inner join Inscripciones on Socios.Legajo = Inscripciones.Legajo
        inner join Actividades on Inscripciones.IDActividad = Actividades.ID
        inner join Sedes on Actividades.IDSede = Sedes.ID
        where Inscripciones.Becado = 1

    -- 12) Listar el nombre de la actividad y el nombre de la localidad donde se realiza ordenado ascendentemente por el nombre de la actividad.
        select Actividades.Nombre as 'Actividad', Localidades.Nombre as 'Localidad' from Actividades
        inner join Sedes on Actividades.IDSede = Sedes.ID
        inner join Localidades on Sedes.IDLocalidad = Localidades.ID
        order by Actividades.Nombre ASC

    -- 13) Listar el apellido y nombres de todos los socios (sin repeticiones) que realicen alguna actividad en San Fernando o Tigre.
        select distinct Socios.Apellidos, Socios.Nombres from Socios
        inner join Inscripciones on Socios.Legajo = Inscripciones.Legajo
        inner join Actividades on Inscripciones.IDActividad = Actividades.ID
        inner join Sedes on Actividades.IDSede = Sedes.ID
        inner join Localidades on Sedes.IDLocalidad = Localidades.ID
        where Localidades.ID in ('1111', '3333')

    -- 14) Listar el socio que haya pagado la cuota más cara indicando el apellido y nombre del socio, el período (Mes+Año) y el importe.
        select top 1 Socios.Apellidos, Socios.Nombres, concat(Pagos.Mes, '/', Pagos.Anio) as 'Periodo', Pagos.Importe  from Socios
        inner join Pagos on Socios.Legajo = Pagos.Legajo
        order by Pagos.Importe DESC

    -- 15) Listar el nombre de la actividad más cara que posea algún becado.
        select top 1 Actividades.Nombre from Actividades
        inner join Inscripciones on Actividades.ID = Inscripciones.IDActividad
        where Becado = 1
        order by Actividades.Costo DESC

    -- 16) Listar nombre y apellido del socio, nombre de la actividad y la cantidad de días transcurridos desde que se inscribió a dicha actividad. Ordenarlo por cantidad de días de manera descendente.
        select distinct Socios.Nombres, Socios.Apellidos, Actividades.Nombre,
        DATEDIFF(DAY, Inscripciones.FechaInscripcion, GETDATE()) as 'Días transcurridos'
        from Socios
        inner join Inscripciones on Socios.Legajo = Inscripciones.Legajo
        inner join Actividades on Inscripciones.IDActividad = Actividades.ID
        order by 4 DESC