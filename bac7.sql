USE [master]
GO
/****** Object:  Database [BAC Alcohol]    Script Date: 10/8/2020 1:10:56 PM ******/
CREATE DATABASE [BAC Alcohol]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BAC Alcohol', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BAC Alcohol.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BAC Alcohol_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BAC Alcohol_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BAC Alcohol] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BAC Alcohol].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BAC Alcohol] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BAC Alcohol] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BAC Alcohol] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BAC Alcohol] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BAC Alcohol] SET ARITHABORT OFF 
GO
ALTER DATABASE [BAC Alcohol] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BAC Alcohol] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BAC Alcohol] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BAC Alcohol] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BAC Alcohol] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BAC Alcohol] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BAC Alcohol] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BAC Alcohol] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BAC Alcohol] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BAC Alcohol] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BAC Alcohol] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BAC Alcohol] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BAC Alcohol] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BAC Alcohol] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BAC Alcohol] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BAC Alcohol] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BAC Alcohol] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BAC Alcohol] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BAC Alcohol] SET  MULTI_USER 
GO
ALTER DATABASE [BAC Alcohol] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BAC Alcohol] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BAC Alcohol] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BAC Alcohol] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BAC Alcohol] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BAC Alcohol] SET QUERY_STORE = OFF
GO
USE [BAC Alcohol]
GO
/****** Object:  Table [dbo].[Beer]    Script Date: 10/8/2020 1:10:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Alcohol Type] [nchar](10) NULL,
	[Alcohol Name] [nchar](20) NULL,
	[Fluid Ounces] [decimal](4, 2) NULL,
	[Alcohol Percentage] [decimal](4, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Liquor]    Script Date: 10/8/2020 1:10:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Liquor](
	[id] [int] NOT NULL,
	[Alcohol Name] [nchar](20) NULL,
	[Fluid Ounces] [decimal](4, 2) NULL,
	[Alcohol Percentage] [decimal](4, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seltzer]    Script Date: 10/8/2020 1:10:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seltzer](
	[id] [int] NOT NULL,
	[Alcohol Name] [nchar](20) NULL,
	[Fluid Ounces] [decimal](4, 2) NULL,
	[Alcohol Percentage] [decimal](4, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wine]    Script Date: 10/8/2020 1:10:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wine](
	[id] [int] NOT NULL,
	[Alcohol Name] [nchar](20) NULL,
	[Fluid Ounces] [decimal](4, 2) NULL,
	[Alcohol Percentage] [decimal](4, 2) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Beer] ON 

INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (3, N'Beer      ', N'Bud Light           ', CAST(12.00 AS Decimal(4, 2)), CAST(4.20 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (4, N'Beer      ', N'Natural Light       ', CAST(12.00 AS Decimal(4, 2)), CAST(4.20 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (5, N'Beer      ', N'Miller Light        ', CAST(12.00 AS Decimal(4, 2)), CAST(4.20 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (6, N'Beer      ', N'Genesee Light       ', CAST(12.00 AS Decimal(4, 2)), CAST(4.20 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (7, N'Beer      ', N'Blue Moon           ', CAST(12.00 AS Decimal(4, 2)), CAST(5.70 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (9, N'Beer      ', N'Budweiser           ', CAST(12.00 AS Decimal(4, 2)), CAST(5.00 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (10, N'Beer      ', N'Coors Light         ', CAST(12.00 AS Decimal(4, 2)), CAST(4.20 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (11, N'Beer      ', N'Michelob Ultra      ', CAST(12.00 AS Decimal(4, 2)), CAST(4.20 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (12, N'Beer      ', N'Corona Light        ', CAST(12.00 AS Decimal(4, 2)), CAST(4.10 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (13, N'Beer      ', N'Modelo              ', CAST(12.00 AS Decimal(4, 2)), CAST(4.40 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (14, N'Beer      ', N'Busch Light         ', CAST(12.00 AS Decimal(4, 2)), CAST(4.10 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (15, N'Beer      ', N'Heineken Light      ', CAST(12.00 AS Decimal(4, 2)), CAST(4.20 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (16, N'Beer      ', N'Keystone Light      ', CAST(12.00 AS Decimal(4, 2)), CAST(4.20 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (17, N'Beer      ', N'Bud Light Lime      ', CAST(12.00 AS Decimal(4, 2)), CAST(4.20 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (18, N'Beer      ', N'Guinness Draught    ', CAST(12.00 AS Decimal(4, 2)), CAST(4.27 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (19, N'Beer      ', N'Rolling Rock        ', CAST(12.00 AS Decimal(4, 2)), CAST(4.50 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (20, N'Beer      ', N'Coors Banquet       ', CAST(12.00 AS Decimal(4, 2)), CAST(5.00 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (21, N'Beer      ', N'Stella Artois       ', CAST(12.00 AS Decimal(4, 2)), CAST(5.20 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (22, N'Beer      ', N'Sam Adams Summer Ale', CAST(12.00 AS Decimal(4, 2)), CAST(5.30 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (23, N'Beer      ', N'PBR                 ', CAST(12.00 AS Decimal(4, 2)), CAST(4.74 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (24, N'Beer      ', N'Yuengling Lager     ', CAST(12.00 AS Decimal(4, 2)), CAST(4.50 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (25, N'Beer      ', N'Corona Extra        ', CAST(12.00 AS Decimal(4, 2)), CAST(4.60 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (26, N'Beer      ', N'Sam Adams Boston Ale', CAST(12.00 AS Decimal(4, 2)), CAST(5.40 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (29, N'Beer      ', N'Bass Ale            ', CAST(12.00 AS Decimal(4, 2)), CAST(5.00 AS Decimal(4, 2)))
INSERT [dbo].[Beer] ([Id], [Alcohol Type], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (30, N'Beer      ', N'Miller High Life    ', CAST(12.00 AS Decimal(4, 2)), CAST(4.60 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[Beer] OFF
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (1, N'Jack Daniels        ', CAST(1.50 AS Decimal(4, 2)), CAST(47.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (2, N'Bacardi 121         ', CAST(1.50 AS Decimal(4, 2)), CAST(61.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (3, N'Bacardi 151         ', CAST(1.50 AS Decimal(4, 2)), CAST(75.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (4, N'Bacardi 8           ', CAST(1.50 AS Decimal(4, 2)), CAST(40.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (5, N'Bacardi Carta Blanca', CAST(1.50 AS Decimal(4, 2)), CAST(40.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (6, N'Baileys             ', CAST(1.50 AS Decimal(4, 2)), CAST(17.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (7, N'Smirnoff            ', CAST(1.50 AS Decimal(4, 2)), CAST(40.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (8, N'Captain Morgan      ', CAST(1.50 AS Decimal(4, 2)), CAST(35.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (9, N'Kahlua              ', CAST(1.50 AS Decimal(4, 2)), CAST(20.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (10, N'Crown Royal         ', CAST(1.50 AS Decimal(4, 2)), CAST(40.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (11, N'Jim Beam            ', CAST(1.50 AS Decimal(4, 2)), CAST(40.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (12, N'Grey Goose          ', CAST(1.50 AS Decimal(4, 2)), CAST(40.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (13, N'Jose Cuervo         ', CAST(1.50 AS Decimal(4, 2)), CAST(38.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (14, N'Svedka              ', CAST(1.50 AS Decimal(4, 2)), CAST(40.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (15, N'Vladimir            ', CAST(1.50 AS Decimal(4, 2)), CAST(40.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (16, N'Absolut             ', CAST(1.50 AS Decimal(4, 2)), CAST(40.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (17, N'Hennesey            ', CAST(1.50 AS Decimal(4, 2)), CAST(40.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (18, N'Jameson             ', CAST(1.50 AS Decimal(4, 2)), CAST(40.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (19, N'Titos               ', CAST(1.50 AS Decimal(4, 2)), CAST(40.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (20, N'Jagermeister        ', CAST(1.50 AS Decimal(4, 2)), CAST(35.00 AS Decimal(4, 2)))
INSERT [dbo].[Liquor] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (21, N'Don Julio           ', CAST(1.50 AS Decimal(4, 2)), CAST(40.00 AS Decimal(4, 2)))
INSERT [dbo].[Seltzer] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (1, N'White Claw          ', CAST(12.00 AS Decimal(4, 2)), CAST(5.00 AS Decimal(4, 2)))
INSERT [dbo].[Seltzer] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (2, N'Truly               ', CAST(12.00 AS Decimal(4, 2)), CAST(5.00 AS Decimal(4, 2)))
INSERT [dbo].[Seltzer] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (3, N'Bud Light Seltzer   ', CAST(12.00 AS Decimal(4, 2)), CAST(5.00 AS Decimal(4, 2)))
INSERT [dbo].[Seltzer] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (4, N'Bon & Viv           ', CAST(12.00 AS Decimal(4, 2)), CAST(4.50 AS Decimal(4, 2)))
INSERT [dbo].[Seltzer] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (5, N'Smirnoff Seltzer    ', CAST(12.00 AS Decimal(4, 2)), CAST(4.50 AS Decimal(4, 2)))
INSERT [dbo].[Seltzer] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (6, N'Henrys              ', CAST(12.00 AS Decimal(4, 2)), CAST(4.20 AS Decimal(4, 2)))
INSERT [dbo].[Seltzer] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (7, N'Corona Seltzer      ', CAST(12.00 AS Decimal(4, 2)), CAST(4.50 AS Decimal(4, 2)))
INSERT [dbo].[Seltzer] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (8, N'Vizzy               ', CAST(12.00 AS Decimal(4, 2)), CAST(5.00 AS Decimal(4, 2)))
INSERT [dbo].[Seltzer] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (9, N'Press               ', CAST(12.00 AS Decimal(4, 2)), CAST(4.00 AS Decimal(4, 2)))
INSERT [dbo].[Seltzer] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (10, N'Barefoot            ', CAST(12.00 AS Decimal(4, 2)), CAST(4.00 AS Decimal(4, 2)))
INSERT [dbo].[Wine] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (1, N'White Zinfadel      ', CAST(5.00 AS Decimal(4, 2)), CAST(12.50 AS Decimal(4, 2)))
INSERT [dbo].[Wine] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (2, N'Moscato             ', CAST(5.00 AS Decimal(4, 2)), CAST(6.00 AS Decimal(4, 2)))
INSERT [dbo].[Wine] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (3, N'Merlot              ', CAST(5.00 AS Decimal(4, 2)), CAST(13.50 AS Decimal(4, 2)))
INSERT [dbo].[Wine] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (4, N'Cabernet Sauvignon  ', CAST(5.00 AS Decimal(4, 2)), CAST(13.50 AS Decimal(4, 2)))
INSERT [dbo].[Wine] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (5, N'Chardonnay          ', CAST(5.00 AS Decimal(4, 2)), CAST(14.00 AS Decimal(4, 2)))
INSERT [dbo].[Wine] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (6, N'Pinot Noir          ', CAST(5.00 AS Decimal(4, 2)), CAST(13.50 AS Decimal(4, 2)))
INSERT [dbo].[Wine] ([id], [Alcohol Name], [Fluid Ounces], [Alcohol Percentage]) VALUES (7, N'Sauvignon Blanc     ', CAST(5.00 AS Decimal(4, 2)), CAST(14.00 AS Decimal(4, 2)))
USE [master]
GO
ALTER DATABASE [BAC Alcohol] SET  READ_WRITE 
GO
