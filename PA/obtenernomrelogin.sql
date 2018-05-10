---se crea el procedimiento almacenado
create procedure obtenernombrelogin
---se declaran los parametros que usaremos
@rut varchar(10),@clave varchar(50)
as
---se hace un select a la tabla usuarios y se envian los parametros
SELECT NOM_USUARIO FROM USUARIO 
WHERE RUT_USUARIO=@rut AND CLAVE_USUARIO=@clave