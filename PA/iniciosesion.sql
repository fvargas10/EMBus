---se crea el procedimiento almacenado
create procedure iniciosesion
---se declaran los parametros que usaremos
@rut varchar(10),@clave varchar(50)
as
---se hace un insert a la tabla usuarios y se envian los parametros
(SELECT COUNT(*) FROM ADMINISTRADOR WHERE RUT_ADMIN=@rut and CLAVE_ADMIN=@clave
UNION ALL SELECT COUNT(*) FROM CONTADOR WHERE RUT_CONT=@rut and CLAVE_CONT=@clave)
