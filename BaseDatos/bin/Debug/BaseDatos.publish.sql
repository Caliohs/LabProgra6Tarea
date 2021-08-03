/*
Script de implementación para LaboratorioProgra6

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "LaboratorioProgra6"
:setvar DefaultFilePrefix "LaboratorioProgra6"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Quitando Índice [dbo].[Vehiculo].[IDX_Vechiculo_Matricula]...';


GO
DROP INDEX [IDX_Vechiculo_Matricula]
    ON [dbo].[Vehiculo];


GO
PRINT N'Creando Tabla [dbo].[Clientes]...';


GO
CREATE TABLE [dbo].[Clientes] (
    [ClientesId] INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]     VARCHAR (250) NOT NULL,
    [Direccion]  VARCHAR (500) NOT NULL,
    [Telefono]   VARCHAR (500) NOT NULL,
    [AgenciaId]  INT           NOT NULL,
    [Estado]     BIT           NULL,
    CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED ([ClientesId] ASC)
)
WITH (DATA_COMPRESSION = PAGE);


GO
PRINT N'Creando Tabla [dbo].[Usuarios]...';


GO
CREATE TABLE [dbo].[Usuarios] (
    [UsuariosId] INT             IDENTITY (1, 1) NOT NULL,
    [Usuario]    VARCHAR (250)   NOT NULL,
    [Nombre]     VARCHAR (500)   NOT NULL,
    [Contrasena] VARBINARY (MAX) NOT NULL,
    [Estado]     BIT             NOT NULL,
    CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED ([UsuariosId] ASC)
);


GO
PRINT N'Creando Índice [dbo].[Vehiculo].[IDX_Vehiculo_Matricula]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_Vehiculo_Matricula]
    ON [dbo].[Vehiculo]([Matricula] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
PRINT N'Creando Clave externa [dbo].[FK_Clientes_Angecias]...';


GO
ALTER TABLE [dbo].[Clientes] WITH NOCHECK
    ADD CONSTRAINT [FK_Clientes_Angecias] FOREIGN KEY ([AgenciaId]) REFERENCES [dbo].[Agencias] ([AgenciaId]);


GO
PRINT N'Modificando Procedimiento [dbo].[AgenciaActualizar]...';


GO
ALTER PROCEDURE dbo.AgenciaActualizar
    @AgenciaId INT,
	@Nombre VARCHAR(500),
	@IdCatalogoProvincia INT,
	@IdCatalogoCanton INT,
	@IdCatalogoDistrito INT,
    @Estado BIT
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY
	-- AQUI VA EL CODIGO
		
	UPDATE dbo.Agencias SET
	    Nombre=@Nombre,
		IdCatalogoProvincia=@IdCatalogoProvincia,
		IdCatalogoCanton=@IdCatalogoCanton,
		IdCatalogoDistrito=@IdCatalogoDistrito,
		Estado=@Estado

	WHERE AgenciaId=@AgenciaId

		COMMIT TRANSACTION TRASA
		
		SELECT 0 AS CodeError, '' AS MsgError



	END TRY

	BEGIN CATCH
		SELECT 
				ERROR_NUMBER() AS CodeError
			,	ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRASA
	END CATCH


END
GO
PRINT N'Modificando Procedimiento [dbo].[AgenciaEliminar]...';


GO
ALTER PROCEDURE [dbo].[AgenciaEliminar]
@AgenciaId INT
  
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY

		
	DELETE FROM Dbo.Agencias WHERE AgenciaId=@AgenciaId


		COMMIT TRANSACTION TRASA
		
		SELECT 0 AS CodeError, '' AS MsgError



	END TRY

	BEGIN CATCH
		SELECT 
				ERROR_NUMBER() AS CodeError
			,	ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRASA
	END CATCH


END
GO
PRINT N'Modificando Procedimiento [dbo].[AgenciaInsertar]...';


GO
ALTER PROCEDURE dbo.AgenciaInsertar
	@Nombre VARCHAR(500),
	@IdCatalogoProvincia INT,
	@IdCatalogoCanton INT,
	@IdCatalogoDistrito INT,
    @Estado BIT
	
	
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY

		
		INSERT INTO dbo.Agencias 
		(	       
	      Nombre,
		  IdCatalogoProvincia,
		  IdCatalogoCanton,
		  IdCatalogoDistrito,
		  Estado
		)
		VALUES
		(
		
	      @Nombre,
		  @IdCatalogoProvincia,
		  @IdCatalogoCanton,
		  @IdCatalogoDistrito,
		  @Estado
		)


		COMMIT TRANSACTION TRASA
		
		SELECT 0 AS CodeError, '' AS MsgError



	END TRY

	BEGIN CATCH
		SELECT 
				ERROR_NUMBER() AS CodeError
			,	ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRASA
	END CATCH


END
GO
PRINT N'Modificando Procedimiento [dbo].[AgenciaObtener]...';


GO
ALTER PROCEDURE [dbo].AgenciaObtener
@AgenciaId INT=NULL

AS BEGIN
	SET NOCOUNT ON

	SELECT
			A.AgenciaId
		,   A.Nombre
		,   A.Estado

		,   CP.IdCatalogoProvincia
		,	CP.NombreCatalogoProvincia

		,   CC.IdCatalogoCanton
		,	CC.NombreCatalogoCanton

		,   CD.IdCatalogoDistrito
		,	CD.NombreCatalogoDistrito
	
				

	FROM dbo.Agencias A
	 INNER JOIN dbo.CatalogoProvincia CP
         ON A.IdCatalogoProvincia = CP.IdCatalogoProvincia
     INNER JOIN dbo.CatalogoCanton CC
         ON A.IdCatalogoCanton = CC.IdCatalogoCanton
	 INNER JOIN dbo.CatalogoDistrito CD
         ON A.IdCatalogoDistrito = CD.IdCatalogoDistrito
	WHERE
	     (@AgenciaId IS NULL OR AgenciaId=@AgenciaId)

END
GO
PRINT N'Modificando Procedimiento [dbo].[CatalogoCantonLista]...';


GO
ALTER PROCEDURE [dbo].[CatalogoCantonLista]
@IdCatalogoProvincia INT=null
AS
	BEGIN
		SET NOCOUNT ON
		SELECT 
		IdCatalogoCanton,
		NombreCatalogoCanton

		FROM	
			dbo.CatalogoCanton

	    WHERE
		    IdCatalogoProvincia=@IdCatalogoProvincia


	END
GO
PRINT N'Modificando Procedimiento [dbo].[CatalogoDistritoLista]...';


GO
ALTER PROCEDURE [dbo].CatalogoDistritoLista
@IdCatalogoCanton INT=null
AS
	BEGIN
		SET NOCOUNT ON
		SELECT 
		IdCatalogoDistrito,
		NombreCatalogoDistrito

		FROM	
			dbo.CatalogoDistrito

	    WHERE
		    IdCatalogoCanton=@IdCatalogoCanton


	END
GO
PRINT N'Modificando Procedimiento [dbo].[CatalogoProvinciaLista]...';


GO
ALTER PROCEDURE [dbo].[CatalogoProvinciaLista]
AS
	BEGIN
		SET NOCOUNT ON



		SELECT 
		IdCatalogoProvincia,
		NombreCatalogoProvincia

		FROM	
			dbo.CatalogoProvincia

	


	END
GO
PRINT N'Modificando Procedimiento [dbo].[MarcaVehiculoActualizar]...';


GO
ALTER PROCEDURE [dbo].[MarcaVehiculoActualizar]
@MarcaVehiculoId INT,
@Descripcion VARCHAR(250),
@Estado BIT

AS
  BEGIN 
  SET NOCOUNT ON

    BEGIN TRANSACTION TRASA

    BEGIN TRY

       UPDATE MarcaVehiculo
       SET
       Descripcion=@Descripcion,
       Estado=@Estado
       WHERE 
           MarcaVehiculoId=@MarcaVehiculoId

       COMMIT TRANSACTION TRASA

          SELECT 0 AS CodeError, '' AS MsgError
    END TRY

    BEGIN CATCH
          SELECT 
                 ERROR_NUMBER() AS CodeError, 
                 ERROR_MESSAGE() AS MsgError
           ROLLBACK TRANSACTION TRASA    
    END CATCH

  END
GO
PRINT N'Modificando Procedimiento [dbo].[MarcaVehiculoEliminar]...';


GO
ALTER PROCEDURE [dbo].[MarcaVehiculoEliminar]
@MarcaVehiculoId INT
AS
  BEGIN 
  SET NOCOUNT ON

    BEGIN TRANSACTION TRASA

    BEGIN TRY
     
     DELETE FROM MarcaVehiculo
     WHERE
         MarcaVehiculoId=@MarcaVehiculoId

       COMMIT TRANSACTION TRASA

          SELECT 0 AS CodeError, '' AS MsgError

    END TRY

    BEGIN CATCH
          SELECT 
                 ERROR_NUMBER() AS CodeError, 
                 ERROR_MESSAGE() AS MsgError
           ROLLBACK TRANSACTION TRASA    
    END CATCH

  END
GO
PRINT N'Modificando Procedimiento [dbo].[MarcaVehiculoInsertar]...';


GO
ALTER PROCEDURE [dbo].[MarcaVehiculoInsertar]
@Descripcion VARCHAR(250),
@Estado BIT

AS
  BEGIN 
  SET NOCOUNT ON

    BEGIN TRANSACTION TRASA

    BEGIN TRY
       INSERT INTO MarcaVehiculo
       ( Descripcion, Estado)
       VALUES
       (@Descripcion, @Estado)


       COMMIT TRANSACTION TRASA

          SELECT 0 AS CodeError, '' AS MsgError
    END TRY

    BEGIN CATCH
          SELECT 
                 ERROR_NUMBER() AS CodeError, 
                 ERROR_MESSAGE() AS MsgError
           ROLLBACK TRANSACTION TRASA    
    END CATCH

  END
GO
PRINT N'Modificando Procedimiento [dbo].[MarcaVehiculoLista]...';


GO
ALTER PROCEDURE dbo.MarcaVehiculoLista

AS
	BEGIN
		SET NOCOUNT ON



		SELECT 
		MarcaVehiculoId,
		Descripcion

		FROM	
			dbo.MarcaVehiculo

			WHERE
					Estado=1






	END
GO
PRINT N'Modificando Procedimiento [dbo].[MarcaVehiculoObtener]...';


GO
ALTER PROCEDURE [dbo].[MarcaVehiculoObtener]
	@MarcaVehiculoId INT=NULL
AS
BEGIN
  SET NOCOUNT ON

SELECT 
      MarcaVehiculoId
	, Descripcion
	, Estado
FROM MarcaVehiculo
WHERE (@MarcaVehiculoId IS NULL OR MarcaVehiculoId=@MarcaVehiculoId)

END
GO
PRINT N'Modificando Procedimiento [dbo].[VehiculoActualizar]...';


GO
ALTER PROCEDURE dbo.VehiculoActualizar
	@VehiculoId INT,
	@MarcaVehiculoId INT,
    @Matricula VARCHAR(250),
	@Color VARCHAR(250),
	@Modelo VARCHAR(250),
	@Estado BIT,
	@FechaModelo DATE,
	@TieneDefectos BIT ,
	@Defectos VARCHAR(1000)= NULL
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY
	-- AQUI VA EL CODIGO
		
	UPDATE dbo.Vehiculo SET
	 MarcaVehiculoId=@MarcaVehiculoId,
	 Matricula=@Matricula,
	 Color=@Color,
	 Modelo=@Modelo,
	 Estado=@Estado,
	 FechaModelo=@FechaModelo,
	 TieneDefectos=@TieneDefectos,
	 Defectos=@Defectos

	WHERE VehiculoId=@VehiculoId

		COMMIT TRANSACTION TRASA
		
		SELECT 0 AS CodeError, '' AS MsgError



	END TRY

	BEGIN CATCH
		SELECT 
				ERROR_NUMBER() AS CodeError
			,	ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRASA
	END CATCH


END
GO
PRINT N'Modificando Procedimiento [dbo].[VehiculoEliminar]...';


GO
ALTER PROCEDURE dbo.VehiculoEliminar
 @VehiculoId INT
  
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY
	-- AQUI VA EL CODIGO
		
	DELETE FROM DBO.Vehiculo WHERE VehiculoId=@VehiculoId


		COMMIT TRANSACTION TRASA
		
		SELECT 0 AS CodeError, '' AS MsgError



	END TRY

	BEGIN CATCH
		SELECT 
				ERROR_NUMBER() AS CodeError
			,	ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRASA
	END CATCH


END
GO
PRINT N'Modificando Procedimiento [dbo].[VehiculoInsertar]...';


GO
ALTER PROCEDURE dbo.VehiculoInsertar
    @MarcaVehiculoId INT,
	@Matricula varchar(250)	,
	@Color varchar(250)	,
	@Modelo varchar(250),
	@Estado BIT,
	@FechaModelo DATE,
	@TieneDefectos BIT ,
	@Defectos VARCHAR(1000)= NULL
	
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY
	-- AQUI VA EL CODIGO
		
		INSERT INTO dbo.Vehiculo 
		(
	     MarcaVehiculoId
	    , Matricula 
	    , Color
	    , Modelo 
	    , Estado 
		, FechaModelo
		, TieneDefectos
		, Defectos
		)
		VALUES
		(
		 @MarcaVehiculoId
	    , @Matricula 
	    , @Color
	    , @Modelo 
	    , @Estado 
		, @FechaModelo
		, @TieneDefectos
		, @Defectos
		)


		COMMIT TRANSACTION TRASA
		
		SELECT 0 AS CodeError, '' AS MsgError



	END TRY

	BEGIN CATCH
		SELECT 
				ERROR_NUMBER() AS CodeError
			,	ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRASA
	END CATCH


END
GO
PRINT N'Modificando Procedimiento [dbo].[VehiculoObtener]...';


GO
ALTER PROCEDURE [dbo].VehiculoObtener
@VehiculoId INT=NULL

AS BEGIN
	SET NOCOUNT ON

	SELECT
			V.VehiculoId
		,   V.Matricula
		,   V.Color
		,   V.Modelo
		,   V.Estado
		,   V.FechaModelo
		,	V.TieneDefectos
		,   V.Defectos
		,   MV.MarcaVehiculoId
		,	MV.Descripcion
				

	FROM dbo.Vehiculo V
	 INNER JOIN dbo.MarcaVehiculo MV
         ON V.MarcaVehiculoId = MV.MarcaVehiculoId
	WHERE
	     (@VehiculoId IS NULL OR VehiculoId=@VehiculoId)

END
GO
PRINT N'Creando Procedimiento [dbo].[ClientesActualizar]...';


GO
CREATE PROCEDURE [dbo].ClientesActualizar
	@ClientesId INT,
	@Nombre VARCHAR(500),
	@Direccion varchar(250),
	@Telefono varchar(250),
	@AgenciaId INT,
    @Estado BIT
	
	
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY

		
		update dbo.Clientes set     
	      Nombre=@Nombre,
		  Direccion=@Direccion,
		  Telefono=@Telefono,
		  AgenciaId=@AgenciaId,
		  Estado=@Estado
		where ClientesId=@ClientesId


		COMMIT TRANSACTION TRASA
		
		SELECT 0 AS CodeError, '' AS MsgError



	END TRY

	BEGIN CATCH
		SELECT 
				ERROR_NUMBER() AS CodeError
			,	ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRASA
	END CATCH


END
GO
PRINT N'Creando Procedimiento [dbo].[ClientesEliminar]...';


GO
CREATE PROCEDURE [dbo].ClientesEliminar
@ClientesId int
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY

		
	DELETE FROM Dbo.Clientes WHERE ClientesId=@ClientesId


		COMMIT TRANSACTION TRASA
		
		SELECT 0 AS CodeError, '' AS MsgError



	END TRY

	BEGIN CATCH
		SELECT 
				ERROR_NUMBER() AS CodeError
			,	ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRASA
	END CATCH


END
GO
PRINT N'Creando Procedimiento [dbo].[ClientesInsertar]...';


GO
CREATE PROCEDURE [dbo].ClientesInsertar
		@Nombre VARCHAR(500),
	@Direccion varchar(250),
	@Telefono varchar(250),
	@AgenciaId INT,
    @Estado BIT
	
	
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY

		
		INSERT INTO dbo.Clientes 
		(	       
	      Nombre,
		  Direccion,
		  Telefono,
		  AgenciaId,
		  Estado
		)
		VALUES
		(
		
	      @Nombre,
		  @Direccion,
		  @Telefono,
		  @AgenciaId,
		  @Estado
		)


		COMMIT TRANSACTION TRASA
		
		SELECT 0 AS CodeError, '' AS MsgError



	END TRY

	BEGIN CATCH
		SELECT 
				ERROR_NUMBER() AS CodeError
			,	ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRASA
	END CATCH


END
GO
PRINT N'Creando Procedimiento [dbo].[ClientesObtener]...';


GO
CREATE PROCEDURE [dbo].ClientesObtener
	@ClientesId INT= null
AS
	begin
	SET NOCOUNT ON


	 SELECT
	 C.ClientesId,
	 C.Nombre,
	 C.Direccion,
	 C.Telefono,
	 C.Estado,
	 A.AgenciaId,
	 A.Nombre
	 FROM dbo.Clientes C
	 INNER JOIN dbo.Agencias A
			ON (C.AgenciaId=A.AgenciaId)
	 WHERE

	 (@ClientesId IS NULL OR ClientesId=@ClientesId)



	end
GO
PRINT N'Creando Procedimiento [dbo].[Login]...';


GO
CREATE PROCEDURE dbo.Login
@Usuario VARCHAR(250),
@Contrasena VARCHAR(250)
AS 
BEGIN
SET NOCOUNT  ON


DECLARE @ContrasenaSHA1 VARBINARY(MAX)=(SELECT HASHBYTES('SHA1',@Contrasena));

IF NOT EXISTS(SELECT * FROM Usuarios WHERE Usuario=@Usuario) BEGIN
	SELECT -1 AS CodeError, 'El nombre del usuario no existe' AS MsgError

END
ELSE IF EXISTS( SELECT * FROM Usuarios WHERE Usuario=@Usuario AND Estado =0) BEGIN
 
 SELECT -1 AS CodeError, 'El Usuario se encuentra inactivo!' AS MsgError
END
ELSE IF  NOT EXISTS( SELECT * FROM Usuarios WHERE Usuario=@Usuario and Contrasena=@ContrasenaSHA1 AND Estado =1) BEGIN
 
 SELECT -1 AS CodeError, 'La contraseña es incorrecta por favor volver a intentar!' AS MsgError
END
ELSE BEGIN

	SELECT 
	0 AS CodeError,
	UsuariosId,
	Usuario,
	Nombre

	FROM Usuarios 
		WHERE Usuario=@Usuario and Contrasena=@ContrasenaSHA1 

END



	

END
GO
PRINT N'Creando Procedimiento [dbo].[UsuarioRegistrar]...';


GO
CREATE PROCEDURE dbo.UsuarioRegistrar
@Usuario varchar(250),
@Nombre varchar(500),
@Contrasena VARCHAR(250)
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY
	-- AQUI VA EL CODIGO
		
DECLARE @ContrasenaSHA1 VARBINARY(MAX)=(SELECT HASHBYTES('SHA1',@Contrasena));

	IF NOT EXISTS( SELECT * FROM dbo.Usuarios WHERE @Usuario=Usuario) BEGIN

				INSERT INTO dbo.Usuarios
					(Usuario,Nombre,Contrasena,Estado)
					VALUES
					(@Usuario,@Nombre,@ContrasenaSHA1,1)

		
		
		SELECT 0 AS CodeError, '' AS MsgError

		END
		ELSE BEGIN 
		
			SELECT -1 AS CodeError, 'Este Usuario se encuentra en uso por favor ingresar otro usuario!' AS MsgError


		END


		COMMIT TRANSACTION TRASA


	END TRY

	BEGIN CATCH
		SELECT 
				ERROR_NUMBER() AS CodeError
			,	ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRASA
	END CATCH


END
GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Clientes] WITH CHECK CHECK CONSTRAINT [FK_Clientes_Angecias];


GO
PRINT N'Actualización completada.';


GO
