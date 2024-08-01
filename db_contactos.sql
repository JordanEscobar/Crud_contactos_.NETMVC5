USE [master]
GO
/****** Object:  Database [dbcontactos]    Script Date: 31-07-2024 21:38:39 ******/
CREATE DATABASE [dbcontactos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbcontactos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbcontactos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbcontactos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbcontactos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbcontactos] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbcontactos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbcontactos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbcontactos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbcontactos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbcontactos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbcontactos] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbcontactos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbcontactos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbcontactos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbcontactos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbcontactos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbcontactos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbcontactos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbcontactos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbcontactos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbcontactos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbcontactos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbcontactos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbcontactos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbcontactos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbcontactos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbcontactos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbcontactos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbcontactos] SET RECOVERY FULL 
GO
ALTER DATABASE [dbcontactos] SET  MULTI_USER 
GO
ALTER DATABASE [dbcontactos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbcontactos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbcontactos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbcontactos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbcontactos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbcontactos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbcontactos', N'ON'
GO
ALTER DATABASE [dbcontactos] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbcontactos] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbcontactos]
GO
/****** Object:  Table [dbo].[contactos]    Script Date: 31-07-2024 21:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[apellidos] [varchar](100) NULL,
	[correo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizar]    Script Date: 31-07-2024 21:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_actualizar] 
@id int,
@nombre varchar(100),
@apellidos varchar(100),
@correo varchar(100)
AS BEGIN
UPDATE contactos SET nombre = @nombre, apellidos = @apellidos,correo = @correo
WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_crear]    Script Date: 31-07-2024 21:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_crear] 
@nombre varchar(100),
@apellidos varchar(100),
@correo varchar(100)
AS BEGIN
INSERT INTO contactos(nombre,apellidos,correo) VALUES (@nombre,@apellidos,@correo)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar]    Script Date: 31-07-2024 21:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_eliminar]
@id int
AS BEGIN
DELETE FROM contactos
WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_listar]    Script Date: 31-07-2024 21:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_listar] 
AS BEGIN
SELECT * FROM contactos
END
GO
USE [master]
GO
ALTER DATABASE [dbcontactos] SET  READ_WRITE 
GO
