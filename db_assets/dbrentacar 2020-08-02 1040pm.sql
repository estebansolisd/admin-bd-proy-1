USE [master]
GO
/****** Object:  Database [dbRentCar]    Script Date: 8/2/2020 10:41:25 PM ******/
CREATE DATABASE [dbRentCar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbRentCar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbRentCar.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbRentCar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbRentCar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbRentCar] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbRentCar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbRentCar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbRentCar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbRentCar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbRentCar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbRentCar] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbRentCar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbRentCar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbRentCar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbRentCar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbRentCar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbRentCar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbRentCar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbRentCar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbRentCar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbRentCar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbRentCar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbRentCar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbRentCar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbRentCar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbRentCar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbRentCar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbRentCar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbRentCar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbRentCar] SET  MULTI_USER 
GO
ALTER DATABASE [dbRentCar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbRentCar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbRentCar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbRentCar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbRentCar] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbRentCar] SET QUERY_STORE = OFF
GO
USE [dbRentCar]
GO
/****** Object:  Table [dbo].[alquiler]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alquiler](
	[idAlquiler] [int] IDENTITY(1,1) NOT NULL,
	[idCoche] [int] NULL,
	[idCliente] [int] NULL,
	[idSeguro] [int] NULL,
	[duracion] [smallint] NULL,
	[monto] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAlquiler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[dni] [varchar](20) NULL,
	[nombre] [varchar](40) NULL,
	[direccion] [varchar](40) NULL,
	[telefono] [varchar](9) NULL,
	[tarjeta] [varchar](19) NULL,
 CONSTRAINT [PK__cliente__885457EE9A207257] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coche]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coche](
	[idCoche] [int] IDENTITY(1,1) NOT NULL,
	[matricula] [varchar](10) NULL,
	[grupo] [varchar](1) NULL,
	[marca] [varchar](20) NULL,
	[modelo] [varchar](10) NULL,
	[puertas] [tinyint] NULL,
	[plazas] [tinyint] NULL,
	[maletero] [smallint] NULL,
	[edadMinima] [tinyint] NULL,
	[idOficina] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCoche] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[failed_jobs]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[failed_jobs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[connection] [nvarchar](max) NOT NULL,
	[queue] [nvarchar](max) NOT NULL,
	[payload] [nvarchar](max) NOT NULL,
	[exception] [nvarchar](max) NOT NULL,
	[failed_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[h_alquiler]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[h_alquiler](
	[id_H_alquiler] [int] IDENTITY(1,1) NOT NULL,
	[idAlquiler] [int] NULL,
	[idCoche] [int] NULL,
	[idCliente] [int] NULL,
	[idSeguro] [int] NULL,
	[duracion] [smallint] NULL,
	[monto] [real] NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_H_alquiler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[h_cliente]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[h_cliente](
	[id_H_oficina] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NULL,
	[dni] [varchar](20) NULL,
	[nombre] [varchar](40) NULL,
	[direccion] [varchar](40) NULL,
	[telefono] [varchar](9) NULL,
	[tarjeta] [varchar](19) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_H_oficina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[h_coche]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[h_coche](
	[id_H_oficina] [int] IDENTITY(1,1) NOT NULL,
	[idCoche] [int] NULL,
	[matricula] [varchar](10) NULL,
	[grupo] [varchar](1) NULL,
	[marca] [varchar](20) NULL,
	[modelo] [varchar](10) NULL,
	[puertas] [tinyint] NULL,
	[plazas] [tinyint] NULL,
	[maletero] [smallint] NULL,
	[edadMinima] [tinyint] NULL,
	[idOficina] [int] NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_H_oficina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[h_oficina]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[h_oficina](
	[id_H_oficina] [int] IDENTITY(1,1) NOT NULL,
	[idOficina] [int] NULL,
	[ciudad] [varchar](20) NULL,
	[telefono] [varchar](9) NULL,
	[calleNumero] [varchar](9) NULL,
	[codigoPostal] [int] NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_H_oficina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[h_roles]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[h_roles](
	[IdRol] [bigint] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedOn] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[h_seguro]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[h_seguro](
	[id_H_seguro] [int] IDENTITY(1,1) NOT NULL,
	[idSeguro] [int] NULL,
	[tipoSeguro] [varchar](20) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_H_seguro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[h_users]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[h_users](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[email_verified_at] [datetime] NULL,
	[password] [nvarchar](255) NOT NULL,
	[remember_token] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[UpdatedOn] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[migrations]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[migration] [nvarchar](255) NOT NULL,
	[batch] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oficina]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oficina](
	[idOficina] [int] IDENTITY(1,1) NOT NULL,
	[ciudad] [varchar](20) NULL,
	[telefono] [varchar](9) NULL,
	[calleNumero] [varchar](9) NULL,
	[codigoPostal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idOficina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[password_resets]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[password_resets](
	[email] [nvarchar](255) NOT NULL,
	[token] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[IdRol] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seguro]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seguro](
	[idSeguro] [int] IDENTITY(1,1) NOT NULL,
	[tipoSeguro] [varchar](20) NULL,
 CONSTRAINT [PK__seguro__01109A400540385C] PRIMARY KEY CLUSTERED 
(
	[idSeguro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[email_verified_at] [datetime] NULL,
	[password] [nvarchar](255) NOT NULL,
	[remember_token] [nvarchar](100) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [password_resets_email_index]    Script Date: 8/2/2020 10:41:25 PM ******/
CREATE NONCLUSTERED INDEX [password_resets_email_index] ON [dbo].[password_resets]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [users_email_unique]    Script Date: 8/2/2020 10:41:25 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [users_email_unique] ON [dbo].[users]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[failed_jobs] ADD  DEFAULT (getdate()) FOR [failed_at]
GO
ALTER TABLE [dbo].[alquiler]  WITH CHECK ADD  CONSTRAINT [FK_alquiler_cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[cliente] ([idCliente])
GO
ALTER TABLE [dbo].[alquiler] CHECK CONSTRAINT [FK_alquiler_cliente]
GO
ALTER TABLE [dbo].[alquiler]  WITH CHECK ADD  CONSTRAINT [FK_alquiler_coche] FOREIGN KEY([idCoche])
REFERENCES [dbo].[coche] ([idCoche])
GO
ALTER TABLE [dbo].[alquiler] CHECK CONSTRAINT [FK_alquiler_coche]
GO
ALTER TABLE [dbo].[alquiler]  WITH CHECK ADD  CONSTRAINT [FK_alquiler_seguro] FOREIGN KEY([idSeguro])
REFERENCES [dbo].[seguro] ([idSeguro])
GO
ALTER TABLE [dbo].[alquiler] CHECK CONSTRAINT [FK_alquiler_seguro]
GO
ALTER TABLE [dbo].[coche]  WITH CHECK ADD  CONSTRAINT [FK_coche_oficina] FOREIGN KEY([idOficina])
REFERENCES [dbo].[oficina] ([idOficina])
GO
ALTER TABLE [dbo].[coche] CHECK CONSTRAINT [FK_coche_oficina]
GO
/****** Object:  StoredProcedure [dbo].[spGuardarAlquiler]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGuardarAlquiler] 
	@pidCoche int,
    @pidCliente int,
    @idSeguro int,
    @pduracion smallint,
	@pmonto real
as
Begin
  insert into Alquiler
	(idCoche, idCliente, idSeguro, duracion, monto)
  values
	(@pidCoche, @pidCliente,@idSeguro,@pduracion,@pmonto);
End;
GO
/****** Object:  StoredProcedure [dbo].[spGuardarCliente]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGuardarCliente] 
		@pdni varchar(20),
		@pnombre varchar(40),
		@pdireccion varchar(40),
		@ptelefono varchar(9),
		@ptarjeta varchar(19)
as
Begin
  insert into cliente
	(dni, nombre, direccion, telefono, tarjeta)
  values
	(@pdni, @pnombre, @pdireccion, @ptelefono, @ptarjeta);
End;
GO
/****** Object:  StoredProcedure [dbo].[spGuardarCoche]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGuardarCoche] 
		@pmatricula varchar(10),
		@pgrupo varchar(1),
		@pmarca varchar(20),
		@pmodelo varchar(10),
		@ppuertas tinyint,
		@pplazas tinyint,
		@pmaletero smallint,
		@pedadMinima tinyint,
		@pidOficina int
as
Begin
  insert into coche
	( matricula, grupo, marca, modelo, puertas, plazas, maletero, edadMinima, idOficina)
  values
	(@pmatricula, @pgrupo, @pmarca, @pmodelo,	@ppuertas, @pplazas, @pmaletero, @pedadMinima, @pidOficina);
End;
GO
/****** Object:  StoredProcedure [dbo].[spGuardarOficina]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spGuardarOficina] 
    
    @pciudad varchar(20),
    @ptelefono varchar(9),
    @calleNumero varchar(9),
    @pcodigoPostal int
as
Begin
  insert into oficina
	(ciudad,telefono,calleNumero,codigoPostal)
  values
	(@pCiudad, @ptelefono,@calleNumero,@pcodigoPostal);
End;
GO
/****** Object:  StoredProcedure [dbo].[spGuardarSeguro]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGuardarSeguro] 
		@pTipoSeguro varchar(20)
as
Begin
  insert into seguro
	(tipoSeguro)
  values
	(@pTipoSeguro);
End;
GO
/****** Object:  Trigger [dbo].[tgTblAlquilerAudit]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tgTblAlquilerAudit] on [dbo].[alquiler]
after INSERT, UPDATE, DELETE
as
begin
	if exists(Select * from inserted) 
	begin
	  insert into h_Alquiler
		(idAlquiler, idCoche, idCliente, idSeguro, duracion, monto, UpdatedBy, UpdatedOn )
	  select 
		idAlquiler, idCoche, idCliente, idSeguro, duracion, monto, SUSER_SNAME(), getdate()
	  from  
		inserted 
	end
	else
	begin
	  insert into h_Alquiler
		(idAlquiler, idCoche, idCliente, idSeguro, duracion, monto, UpdatedBy, UpdatedOn )
	  select 
		idAlquiler, idCoche, idCliente, idSeguro, duracion, monto, SUSER_SNAME(), getdate()
	  from  
		deleted 
	end
end
GO
ALTER TABLE [dbo].[alquiler] ENABLE TRIGGER [tgTblAlquilerAudit]
GO
/****** Object:  Trigger [dbo].[tgTblClienteAudit]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tgTblClienteAudit] on [dbo].[cliente]
after update, insert, delete
as
begin
	if exists(Select * from inserted) 
	begin
	  insert into h_cliente
		(idCliente,	dni, nombre, direccion, telefono, tarjeta, UpdatedBy, UpdatedOn)
	  select 
		idCliente,	dni, nombre, direccion, telefono, tarjeta, SUSER_SNAME(), getdate()
	  from  
		inserted 
	end
	else
	begin
	  insert into h_cliente
		(idCliente,	dni, nombre, direccion, telefono, tarjeta, UpdatedBy, UpdatedOn)
	  select 
		idCliente,	dni, nombre, direccion, telefono, tarjeta, SUSER_SNAME(), getdate()
	  from  
		deleted
	end
end
GO
ALTER TABLE [dbo].[cliente] ENABLE TRIGGER [tgTblClienteAudit]
GO
/****** Object:  Trigger [dbo].[tgTblCocheAudit]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[tgTblCocheAudit] on [dbo].[coche]
after update, insert, delete
as
begin
	if exists(Select * from inserted) 
	begin	 
	 insert into h_coche
		(idCoche, matricula, grupo, marca, modelo, puertas, plazas, maletero, edadMinima, idOficina, UpdatedBy, UpdatedOn )
	  select 
		idCoche, matricula, grupo, marca, modelo, puertas, plazas, maletero, edadMinima, idOficina, SUSER_SNAME(), getdate()
	  from  
		inserted
	end
	else
	begin
		 insert into h_coche
		(idCoche, matricula, grupo, marca, modelo, puertas, plazas, maletero, edadMinima, idOficina, UpdatedBy, UpdatedOn )
	  select 
		idCoche, matricula, grupo, marca, modelo, puertas, plazas, maletero, edadMinima, idOficina, SUSER_SNAME(), getdate()
	  from  
		deleted
	end
end
GO
ALTER TABLE [dbo].[coche] ENABLE TRIGGER [tgTblCocheAudit]
GO
/****** Object:  Trigger [dbo].[tgTblOficinaAudit]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[tgTblOficinaAudit] on [dbo].[oficina]
after INSERT, UPDATE, DELETE
as
begin
	if exists(Select * from inserted) 
	begin
	  insert into h_oficina
		(idOficina,ciudad,telefono,calleNumero,codigoPostal, UpdatedBy, UpdatedOn )
	  select 
		idOficina, ciudad,telefono,calleNumero,codigoPostal, SUSER_SNAME(), getdate()
	  from  
		inserted 
	end
	else
	begin
	  insert into h_oficina
		(idOficina,ciudad,telefono,calleNumero,codigoPostal, UpdatedBy, UpdatedOn )
	  select 
		idOficina, ciudad,telefono,calleNumero,codigoPostal, SUSER_SNAME(), getdate()
	  from  
		deleted 
	end
end
GO
ALTER TABLE [dbo].[oficina] ENABLE TRIGGER [tgTblOficinaAudit]
GO
/****** Object:  Trigger [dbo].[tgTblRolesAudit]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[tgTblRolesAudit] on [dbo].[roles]
after INSERT, UPDATE, DELETE
as
begin
	if exists(Select * from inserted) 
	begin
	  insert into h_roles
		(IdRol, Descripcion, UpdatedBy, UpdatedOn )
	  select 
		IdRol, Descripcion, SUSER_SNAME(), getdate()
	  from  
		inserted 
	end
	else
	begin
	  insert into h_roles
		(IdRol, Descripcion, UpdatedBy, UpdatedOn )
	  select 
		IdRol, Descripcion, SUSER_SNAME(), getdate()
	  from   
		deleted 
	end
end
GO
ALTER TABLE [dbo].[roles] ENABLE TRIGGER [tgTblRolesAudit]
GO
/****** Object:  Trigger [dbo].[tgTblSeguroAudit]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tgTblSeguroAudit] on [dbo].[seguro]
after update, insert, delete
as
begin
	if exists(Select * from inserted) 
	begin
	  insert into h_seguro
		(idSeguro,	tipoSeguro, UpdatedBy, UpdatedOn)
	  select 
		idSeguro,	tipoSeguro, SUSER_SNAME(), getdate()
	  from  
		inserted 
	end
	else
	begin
	  insert into h_seguro
		(idSeguro,	tipoSeguro, UpdatedBy, UpdatedOn)
	  select 
		idSeguro,	tipoSeguro, SUSER_SNAME(), getdate()
	  from  
		deleted
	end
end
GO
ALTER TABLE [dbo].[seguro] ENABLE TRIGGER [tgTblSeguroAudit]
GO
/****** Object:  Trigger [dbo].[tgTblUsersAudit]    Script Date: 8/2/2020 10:41:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[tgTblUsersAudit] on [dbo].[users]
after INSERT, UPDATE, DELETE
as
begin
	if exists(Select * from inserted) 
	begin
	  insert into h_users
		(id, name, email, email_verified_at, password, remember_token, UpdatedBy, UpdatedOn )
	  select 
		id, name, email, email_verified_at, password, remember_token, SUSER_SNAME(), getdate()
	  from  
		inserted 
	end
	else
	begin
	  insert into h_users
		(id, name, email, email_verified_at, password, remember_token, UpdatedBy, UpdatedOn )
	  select 
		id, name, email, email_verified_at, password, remember_token, SUSER_SNAME(), getdate()
	  from  
		deleted 
	end
end
GO
ALTER TABLE [dbo].[users] ENABLE TRIGGER [tgTblUsersAudit]
GO
USE [master]
GO
ALTER DATABASE [dbRentCar] SET  READ_WRITE 
GO
