-- 1) rehacer
select PACIENTES.NOMBRE, PACIENTES.APELLIDO, count(*) from PACIENTES
inner join TURNOS on PACIENTES.IDPACIENTE = TURNOS.IDPACIENTE
group by PACIENTES.NOMBRE, PACIENTES.APELLIDO
order by count(*) DESC

-- 2) rehacer
select avg(MEDICOS.COSTO_CONSULTA) from ESPECIALIDADES
inner join MEDICOS on ESPECIALIDADES.IDESPECIALIDAD = MEDICOS.IDESPECIALIDAD
where ESPECIALIDADES.IDESPECIALIDAD = 10

--3) OK
select count(*) from MEDICOS
inner join TURNOS on MEDICOS.IDMEDICO = TURNOS.IDMEDICO
where MEDICOS.IDMEDICO = 41

-- 4) rehacer
select top 1 with ties * from MEDICOS where SEXO = 'M' order by FECHAINGRESO asc

-- 5) OK
select count(*) from MEDICOS where IDESPECIALIDAD in ('3', '4')

-- 6) rehacer, probar con 142
select count(distinct IDPACIENTE) from TURNOS where DURACION >
(
    select avg(DURACION) as Promedio from TURNOS
)

-- 7) rehacer
select count(*) from MEDICOS where COSTO_CONSULTA > 1000 and MEDICOS.SEXO = 'F'

select * from OBRAS_SOCIALES

--8) perfecta
select * from OBRAS_SOCIALES
inner join PACIENTES on OBRAS_SOCIALES.IDOBRASOCIAL = PACIENTES.IDOBRASOCIAL
inner join TURNOS on PACIENTES.IDPACIENTE = TURNOS.IDPACIENTE
inner join MEDICOS on Turnos.IDMEDICO = MEDICOS.IDMEDICO
where MEDICOS.IDESPECIALIDAD = 6 and OBRAS_SOCIALES.COBERTURA > 0.00

-- Cuánto tuvo que pagar la consulta el paciente con el turno nro 146?
-- costo consulta

-- 9) rehacer
select 
(
    select medicos.COSTO_CONSULTA from TURNOS 
    inner join MEDICOS on TURNOS.IDMEDICO = MEDICOS.IDMEDICO
    where Turnos.IDTURNO = 146
) 
-
(
    select medicos.COSTO_CONSULTA from TURNOS 
    inner join MEDICOS on TURNOS.IDMEDICO = MEDICOS.IDMEDICO
    where Turnos.IDTURNO = 146
)
*
(
    select COBERTURA from TURNOS 
    inner join PACIENTES on TURNOS.IDMEDICO= PACIENTES.IDPACIENTE
    inner join OBRAS_SOCIALES on PACIENTES.IDOBRASOCIAL = OBRAS_SOCIALES.IDOBRASOCIAL
    where Turnos.IDTURNO = 146

) as aux

--10) rehacer
select * from TURNOS
inner join PACIENTES on TURNOS.IDPACIENTE = PACIENTES.IDPACIENTE
where TURNOS.FECHAHORA != YEAR(2015)