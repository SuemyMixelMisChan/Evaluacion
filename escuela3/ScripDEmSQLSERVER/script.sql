USE [master]
GO
/****** Object:  Database [escuela]    Script Date: 07/11/2019 13:40:08 ******/
CREATE DATABASE [escuela]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'escuela', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\escuela.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'escuela_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\escuela_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [escuela] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [escuela].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [escuela] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [escuela] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [escuela] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [escuela] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [escuela] SET ARITHABORT OFF 
GO
ALTER DATABASE [escuela] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [escuela] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [escuela] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [escuela] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [escuela] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [escuela] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [escuela] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [escuela] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [escuela] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [escuela] SET  ENABLE_BROKER 
GO
ALTER DATABASE [escuela] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [escuela] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [escuela] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [escuela] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [escuela] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [escuela] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [escuela] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [escuela] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [escuela] SET  MULTI_USER 
GO
ALTER DATABASE [escuela] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [escuela] SET DB_CHAINING OFF 
GO
ALTER DATABASE [escuela] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [escuela] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [escuela] SET DELAYED_DURABILITY = DISABLED 
GO
USE [escuela]
GO
/****** Object:  Table [dbo].[actividades]    Script Date: 07/11/2019 13:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[actividades](
	[idactividades] [int] IDENTITY(1,1) NOT NULL,
	[nombreActividad] [varchar](50) NULL,
	[bimestre] [varchar](50) NULL,
	[_profesoridprofesor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idactividades] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[alumnos]    Script Date: 07/11/2019 13:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[alumnos](
	[idalumnos] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idalumnos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[asignatura]    Script Date: 07/11/2019 13:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asignatura](
	[idasignatura] [int] IDENTITY(1,1) NOT NULL,
	[nombreAsignatura] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idasignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[asistencia]    Script Date: 07/11/2019 13:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asistencia](
	[idasistencia] [int] IDENTITY(1,1) NOT NULL,
	[grupo_idgrupo] [int] NOT NULL,
	[curso_idcurso] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idasistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[calificaciones]    Script Date: 07/11/2019 13:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calificaciones](
	[idcalificaciones] [int] IDENTITY(1,1) NOT NULL,
	[actividades_idactividades] [int] NOT NULL,
	[curso_idcurso] [int] NOT NULL,
	[calificacion] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idcalificaciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[curso]    Script Date: 07/11/2019 13:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[curso](
	[idcurso] [int] IDENTITY(1,1) NOT NULL,
	[alumnos_idalumnos] [int] NOT NULL,
	[asignatura_idasignatura] [int] NOT NULL,
	[grupo_idgrupo] [int] NOT NULL,
	[profesor_idprofesor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[grupo]    Script Date: 07/11/2019 13:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[grupo](
	[idgrupo] [int] IDENTITY(1,1) NOT NULL,
	[nombreGrupo] [varchar](50) NULL,
	[grado] [varchar](50) NULL,
	[turno] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idgrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[profesor]    Script Date: 07/11/2019 13:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[profesor](
	[idprofesor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
 CONSTRAINT [PK_profesor1] PRIMARY KEY CLUSTERED 
(
	[idprofesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[actividades]  WITH CHECK ADD  CONSTRAINT [FK_actividades_profesor] FOREIGN KEY([_profesoridprofesor])
REFERENCES [dbo].[profesor] ([idprofesor])
GO
ALTER TABLE [dbo].[actividades] CHECK CONSTRAINT [FK_actividades_profesor]
GO
ALTER TABLE [dbo].[asistencia]  WITH CHECK ADD FOREIGN KEY([curso_idcurso])
REFERENCES [dbo].[curso] ([idcurso])
GO
ALTER TABLE [dbo].[asistencia]  WITH CHECK ADD FOREIGN KEY([grupo_idgrupo])
REFERENCES [dbo].[grupo] ([idgrupo])
GO
ALTER TABLE [dbo].[calificaciones]  WITH CHECK ADD FOREIGN KEY([curso_idcurso])
REFERENCES [dbo].[curso] ([idcurso])
GO
ALTER TABLE [dbo].[curso]  WITH CHECK ADD FOREIGN KEY([alumnos_idalumnos])
REFERENCES [dbo].[alumnos] ([idalumnos])
GO
ALTER TABLE [dbo].[curso]  WITH CHECK ADD FOREIGN KEY([asignatura_idasignatura])
REFERENCES [dbo].[asignatura] ([idasignatura])
GO
ALTER TABLE [dbo].[curso]  WITH CHECK ADD FOREIGN KEY([grupo_idgrupo])
REFERENCES [dbo].[grupo] ([idgrupo])
GO
ALTER TABLE [dbo].[curso]  WITH CHECK ADD  CONSTRAINT [FK_curso_profesor] FOREIGN KEY([profesor_idprofesor])
REFERENCES [dbo].[profesor] ([idprofesor])
GO
ALTER TABLE [dbo].[curso] CHECK CONSTRAINT [FK_curso_profesor]
GO
USE [master]
GO
ALTER DATABASE [escuela] SET  READ_WRITE 
GO
