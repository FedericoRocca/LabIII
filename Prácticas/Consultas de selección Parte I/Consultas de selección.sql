-- Consultas de selección
    -- 1) Listar el socio con el legajo 1000.
        select * from Socios where Legajo = '1000'

    -- 2) Listar los socios con los legajos 2000, 6000 y 3000.
        select * from Socios where Legajo in ('2000', '6000', '3000')

    -- 3) Listar todos los socios que posean legajos entre en el 2000 y 6000 (ambos inclusive).
        select * from Socios where Legajo >= 2000 and Legajo <= 6000

    -- 4) Listar todos los socios que no posean los legajos 2000, 6000, y 3000.
        select * from Socios where Legajo not in ('2000', '6000', '3000')

    -- 5) Listar todos los socios que no posean los legajos entre el 2000 y 6000 (ambos inclusive).
        select * from Socios where Legajo  < 2000 or Legajo > 6000

    -- 6) Listar todos las socios de sexo femenino.
        select * from Socios where Genero = 'F'

    -- 7) Listar todos los socios que hayan nacido en el año 2000.
        select * from Socios where YEAR(FechaNacimiento) = 2000

    -- 8) Listar todos los socios que hayan nacido luego del 01/04/1986
        select * from Socios where FechaNacimiento > '01/04/1986'

    -- 9) Listar el número de legajo, apellido y nombres y género de todos los socios ordenados ascendentemente por apellido.
        select Legajo, Apellidos, Nombres, Genero from Socios order by Apellidos ASC

    -- 10) Listar el apellido y nombres y fecha de nacimiento de todos los socios ordenados descendentemente por fecha de nacimiento
        select Apellidos, Nombres, FechaNacimiento from Socios order by FechaNacimiento DESC

    -- 11) Listar todos los socios cuyo nombre comience con vocal.
        select * from Socios where Nombres like '[aeiouAEIOU]%'

    -- 12) Listar todos los socios cuyo apellido empiece y termine con consonante.
        select * from Socios where Apellidos not like '[aeiouAEIOU]%' and Apellidos not like '%[aeiouAEIOU]'

    -- 13) Listar todos los socios cuyo apellido tenga seis caracteres y finalice con la A.
        select * from Socios where Apellidos like '_____[Aa]'

    -- 14) Listar el legajo, apellido, nombres y edad de cada socio.
        select Legajo, Apellidos, Nombres, FechaNacimiento from Socios

    -- 15) Listar todas las actividades que se realizan en la Sede 1.
        select * from Actividades where IDSede = '1'

    -- 16) Listar la actividad menos costosa.
        select top 1 * from Actividades order by Costo ASC

    -- 17) Listar la actividad más costosa. Listar todas las que cumplan dicha condición.
        select top 1 with ties * from Actividades order by Costo desc

    -- 18) Listar el ID, Nombre y Costo de todas las actividades cuyo costo supere los $500 y requieran apto médico.
        select ID, Nombre, Costo from Actividades where ( Costo > 500 and AptoMedico = 1 )

    -- 19) Listar el ID, Nombre y Costo de todas las actividades que se dicten en la Sede 2 y requieran apto médico o se dicten en la Sede 4 y superen los $1000.
        select ID, Nombre, Costo from Actividades where
        (
            ( IDSede = 2 and AptoMedico = 1 ) or
            ( IDSede = 4 and Costo > 1000 )
        )

    -- 20) Listar todas las sedes que posean teléfono.
        select * from Sedes where Telefono is null

    -- 21) Listar los domicilios de todas las sedes que no posean mail.
        select Direccion from Sedes where Mail is null

    -- 22) Listar el nombre, domicilio, código postal y la información de contacto de cada sede. La información de contacto es el número de teléfono en primer lugar y la dirección de correo electrónico en caso de no poseer teléfono.
        select Nombre, Direccion, IDLocalidad, Coalesce(Telefono, Mail) as contacto from Sedes

    -- 23) Listar los códigos postales de todas las sedes (sin repeticiones).
        select distinct IDLocalidad from Sedes

    -- 24) Listar el legajo, número de actividad y como Estado la palabra 'Becado' si el socio se encuentra becado, de lo contrario listar null en el Estado del socio.
        select Legajo, IDActividad, case when Becado = 1 then 'Becado' else null end as 'Estado' from Inscripciones