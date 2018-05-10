---se crea el procedimiento almacenado
create procedure agregarbus
---se declaran los parametros que usaremos
@patente varchar(6), @id_marca_bus int, @id_oficina int, @apodo varchar(20), @capacidad int, @estado bit
as
---se hace un insert a la tabla usuarios y se envian los parametros
INSERT INTO BUS(PATENTE, ID_MARCA_BUS, ID_OFICINA, APODO_BUS, CAPACIDAD_BUS, ESTADO_BUS)
VALUES(@patente, @id_marca_bus, @id_oficina, @apodo, @capacidad, @estado)
