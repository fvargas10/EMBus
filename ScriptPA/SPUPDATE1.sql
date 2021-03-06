USE [EMBUS]
GO
/****** Object:  StoredProcedure [dbo].[agregarauxiliar]    Script Date: 20/10/2017 22:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[agregarauxiliar]
---se declaran los parametros que usaremos
@rut varchar(10), @id_tipo_usuario int, @id_oficina int, @nombre varchar(50), @telefono int, @estado bit
as
---se hace un insert a la tabla auxiliar y se envian los parametros
INSERT INTO AUXILIAR(RUT_AUX, ID_TIPO_USUARIO, ID_OFICINA, NOM_AUX, TEL_AUX, ESTADO_AUX)
VALUES(@rut, @id_tipo_usuario, @id_oficina, @nombre, @telefono, @estado)


GO
/****** Object:  StoredProcedure [dbo].[agregarbus]    Script Date: 20/10/2017 22:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[agregarbus]
---se declaran los parametros que usaremos
@patente varchar(6), @id_marca_bus int, @id_oficina int, @apodo varchar(20), @capacidad int, @estado bit
as
---se hace un insert a la tabla usuarios y se envian los parametros
INSERT INTO BUS(PATENTE, ID_MARCA_BUS, ID_OFICINA, APODO_BUS, CAPACIDAD_BUS, ESTADO_BUS)
VALUES(@patente, @id_marca_bus, @id_oficina, @apodo, @capacidad, @estado)



GO
/****** Object:  StoredProcedure [dbo].[agregarconductor]    Script Date: 20/10/2017 22:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[agregarconductor]
---se declaran los parametros que usaremos
@rut varchar(10), @id_oficina int, @id_tipo_usuario int, @nombre varchar(50), @telefono int, @estado bit
as
---se hace un insert a la tabla CONDUCTOR y se envian los parametros
INSERT INTO CONDUCTOR(RUT_CON, ID_OFICINA, ID_TIPO_USUARIO, NOM_CON, TEL_CON, ESTADO_CON)
VALUES(@rut, @id_oficina, @id_tipo_usuario, @nombre, @telefono, @estado)


GO
/****** Object:  StoredProcedure [dbo].[agregarturno]    Script Date: 20/10/2017 22:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
CREATE procedure [dbo].[agregarturno]
---se declaran los parametros que usaremos
@numero_turno int, @rut_auxiliar varchar(10), @rut_conductor varchar(10), @patente varchar(6), @fecha_turno date
as
---se hace un insert a la tabla turnos y se envian los parametros
INSERT INTO TURNOS(NUMERO_TURNO, RUT_AUX, RUT_CON, PATENTE, FECHA_TURNO)
VALUES(@numero_turno, @rut_auxiliar, @rut_conductor, @patente, @fecha_turno)


GO
/****** Object:  StoredProcedure [dbo].[loginusuario]    Script Date: 20/10/2017 22:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[loginusuario]
---se declaran los parametros que usaremos
@rut varchar(10),@clave varchar(50)
as
---se hace un insert a la tabla usuarios y se envian los parametros
SELECT * FROM USUARIO WHERE RUT_USUARIO=@rut AND CLAVE_USUARIO=@clave



GO
/****** Object:  StoredProcedure [dbo].[obteneridoficina]    Script Date: 20/10/2017 22:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[obteneridoficina]
---se declaran los parametros que usaremos
@direccion varchar(50)
as
---se hace un select a la tabla oficina y se envian los parametros
SELECT ID_OFICINA FROM OFICINA WHERE DIR_OFICINA=@direccion


GO
/****** Object:  StoredProcedure [dbo].[obteneridpornombre]    Script Date: 20/10/2017 22:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[obteneridpornombre]
---se declaran los parametros que usaremos
@nombreusuario varchar(50)
as
---se hace un insert a la tabla usuarios y se envian los parametros
SELECT ID_TIPO_USUARIO FROM USUARIO WHERE NOM_USUARIO=@nombreusuario



GO
/****** Object:  StoredProcedure [dbo].[obteneridtipousuario]    Script Date: 20/10/2017 22:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[obteneridtipousuario]
---se declaran los parametros que usaremos
@rut varchar(10)
as
---se hace un insert a la tabla usuarios y se envian los parametros
SELECT ID_TIPO_USUARIO FROM USUARIO WHERE RUT_USUARIO=@rut


GO
/****** Object:  StoredProcedure [dbo].[obteneridtipousuariofinal]    Script Date: 20/10/2017 22:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[obteneridtipousuariofinal]
---se declaran los parametros que usaremos
@rut varchar(10), @clave varchar(50) 
as
---se hace un insert a la tabla usuarios y se envian los parametros
SELECT ID_TIPO_USUARIO FROM USUARIO WHERE RUT_USUARIO=@rut and CLAVE_USUARIO=@clave


GO
/****** Object:  StoredProcedure [dbo].[obtenernombrelogin]    Script Date: 20/10/2017 22:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[obtenernombrelogin]
---se declaran los parametros que usaremos
@rut varchar(10),@clave varchar(50)
as
---se hace un select a la tabla usuarios y se envian los parametros
SELECT NOM_USUARIO FROM USUARIO 
WHERE RUT_USUARIO=@rut AND CLAVE_USUARIO=@clave


GO
