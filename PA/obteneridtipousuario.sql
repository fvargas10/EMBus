---se crea el procedimiento almacenado
create procedure obteneridtipousuario
---se declaran los parametros que usaremos
@rut varchar(10)
as
---se hace un insert a la tabla usuarios y se envian los parametros
SELECT ID_TIPO_USUARIO FROM USUARIO WHERE RUT_USUARIO=@rut