---se crea el procedimiento almacenado
create procedure agregarauxiliar
---se declaran los parametros que usaremos
@rut varchar(10), @id_tipo_usuario int, @id_oficina int, @nombre varchar(50), @telefono int, @estado bit
as
---se hace un insert a la tabla auxiliar y se envian los parametros
INSERT INTO AUXILIAR(RUT_AUX, ID_TIPO_USUARIO, ID_OFICINA, NOM_AUX, TEL_AUX, ESTADO_AUX)
VALUES(@rut, @id_tipo_usuario, @id_oficina, @nombre, @telefono, @estado)
