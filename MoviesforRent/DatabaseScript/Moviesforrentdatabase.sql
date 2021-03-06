USE [master]
GO
/****** Object:  Database [Moviesforrentdatabase]    Script Date: 12/2/2020 11:55:49 AM ******/
CREATE DATABASE [Moviesforrentdatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Moviesforrentdatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Moviesforrentdatabase.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Moviesforrentdatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Moviesforrentdatabase_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Moviesforrentdatabase] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Moviesforrentdatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Moviesforrentdatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Moviesforrentdatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Moviesforrentdatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Moviesforrentdatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Moviesforrentdatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Moviesforrentdatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Moviesforrentdatabase] SET  MULTI_USER 
GO
ALTER DATABASE [Moviesforrentdatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Moviesforrentdatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Moviesforrentdatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Moviesforrentdatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Moviesforrentdatabase]
GO
/****** Object:  StoredProcedure [dbo].[DATAFORRENT]    Script Date: 12/2/2020 11:55:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[DATAFORRENT]
  @Number int
  AS
  SET NOCOUNT ON;
  SELECT * FROM Rdetail WHERE CMRId = @Number
GO
/****** Object:  Table [dbo].[Cdetail]    Script Date: 12/2/2020 11:55:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cdetail](
	[CMRId] [int] NOT NULL,
	[FstName] [varchar](200) NULL,
	[Surname] [varchar](200) NULL,
	[AddressInfo] [varchar](200) NULL,
	[Mob_no] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CMRId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mdetail]    Script Date: 12/2/2020 11:55:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mdetail](
	[MVSId] [int] NOT NULL,
	[MName] [varchar](200) NULL,
	[MRating] [int] NULL,
	[MGenre] [varchar](200) NULL,
	[Cavailable] [int] NULL,
	[MPlot] [varchar](200) NULL,
	[CostForR] [money] NULL,
	[MRelase_Date] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MVSId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rdetail]    Script Date: 12/2/2020 11:55:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rdetail](
	[RMId] [int] NOT NULL,
	[CMRId] [int] NULL,
	[MVSId] [int] NULL,
	[Daterent] [varchar](250) NULL,
	[Datereturn] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[RMId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Cdetail] ([CMRId], [FstName], [Surname], [AddressInfo], [Mob_no]) VALUES (1, N'Selina', N'Haner', N'225  Isis Street', 541245)
INSERT [dbo].[Cdetail] ([CMRId], [FstName], [Surname], [AddressInfo], [Mob_no]) VALUES (2, N'Sallie', N'Sanchez', N'134  Waikonini Place', 475258)
INSERT [dbo].[Cdetail] ([CMRId], [FstName], [Surname], [AddressInfo], [Mob_no]) VALUES (3, N'Dong', N'Lopez', N'254  Tawa Drive', 696356)
INSERT [dbo].[Cdetail] ([CMRId], [FstName], [Surname], [AddressInfo], [Mob_no]) VALUES (4, N'George', N'Brown', N'221  Nottingham Street', 124532)
INSERT [dbo].[Cdetail] ([CMRId], [FstName], [Surname], [AddressInfo], [Mob_no]) VALUES (5, N'Anna', N'Ball', N'9  Montgomery Place', 423854)
INSERT [dbo].[Cdetail] ([CMRId], [FstName], [Surname], [AddressInfo], [Mob_no]) VALUES (6, N'Jennifer', N'Jones', N'204  Kinloch Way', 978659)
INSERT [dbo].[Mdetail] ([MVSId], [MName], [MRating], [MGenre], [Cavailable], [MPlot], [CostForR], [MRelase_Date]) VALUES (1, N'Magic Camp', 7, N'Family film', 15, N'Theo Moses is an aspiring young magician', 5.0000, N'August 14 2020')
INSERT [dbo].[Mdetail] ([MVSId], [MName], [MRating], [MGenre], [Cavailable], [MPlot], [CostForR], [MRelase_Date]) VALUES (2, N'Immortals', 9, N'Fantasy action film', 7, N'Based on the Greek myth', 2.0000, N'November 11 2011')
INSERT [dbo].[Mdetail] ([MVSId], [MName], [MRating], [MGenre], [Cavailable], [MPlot], [CostForR], [MRelase_Date]) VALUES (3, N'Oblivion', 8, N'Action-adventure', 12, N'Few humans left on Earth', 2.0000, N'April 19 2013')
INSERT [dbo].[Mdetail] ([MVSId], [MName], [MRating], [MGenre], [Cavailable], [MPlot], [CostForR], [MRelase_Date]) VALUES (4, N'Bloodshot ', 8, N'Superhero film', 17, N'Axe executes Gina in front of him', 5.0000, N'March 13 2020')
INSERT [dbo].[Mdetail] ([MVSId], [MName], [MRating], [MGenre], [Cavailable], [MPlot], [CostForR], [MRelase_Date]) VALUES (5, N'Unbreakable', 9, N'Superhero thriller', 10, N'Theory based on comic book stories', 2.0000, N'November 22 2000')
INSERT [dbo].[Mdetail] ([MVSId], [MName], [MRating], [MGenre], [Cavailable], [MPlot], [CostForR], [MRelase_Date]) VALUES (6, N'Ouija', 8, N'Supernatural horror ', 13, N'Unknowingly contacts a spirit named Marcus', 5.0000, N'October 21 2016')
INSERT [dbo].[Rdetail] ([RMId], [CMRId], [MVSId], [Daterent], [Datereturn]) VALUES (1, 5, 3, N'1-11-2020', N'2-11-2020')
INSERT [dbo].[Rdetail] ([RMId], [CMRId], [MVSId], [Daterent], [Datereturn]) VALUES (2, 1, 5, N'1-11-2020', N'4-11-2020')
INSERT [dbo].[Rdetail] ([RMId], [CMRId], [MVSId], [Daterent], [Datereturn]) VALUES (3, 4, 2, N'4-11-2020', N'')
INSERT [dbo].[Rdetail] ([RMId], [CMRId], [MVSId], [Daterent], [Datereturn]) VALUES (4, 2, 1, N'5-11-2020', N'')
INSERT [dbo].[Rdetail] ([RMId], [CMRId], [MVSId], [Daterent], [Datereturn]) VALUES (5, 3, 2, N'6-11-2020', N'6-11-2020')
INSERT [dbo].[Rdetail] ([RMId], [CMRId], [MVSId], [Daterent], [Datereturn]) VALUES (6, 4, 4, N'9-11-2020', N'')
USE [master]
GO
ALTER DATABASE [Moviesforrentdatabase] SET  READ_WRITE 
GO
