USE [master]
GO
/****** Object:  Database [YellowMoonDB]    Script Date: 10/18/2020 2:12:03 PM ******/
CREATE DATABASE [YellowMoonDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YellowMoonDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\YellowMoonDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YellowMoonDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\YellowMoonDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [YellowMoonDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YellowMoonDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YellowMoonDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YellowMoonDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YellowMoonDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YellowMoonDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YellowMoonDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [YellowMoonDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YellowMoonDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YellowMoonDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YellowMoonDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YellowMoonDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YellowMoonDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YellowMoonDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YellowMoonDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YellowMoonDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YellowMoonDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YellowMoonDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YellowMoonDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YellowMoonDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YellowMoonDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YellowMoonDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YellowMoonDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YellowMoonDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YellowMoonDB] SET RECOVERY FULL 
GO
ALTER DATABASE [YellowMoonDB] SET  MULTI_USER 
GO
ALTER DATABASE [YellowMoonDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YellowMoonDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YellowMoonDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YellowMoonDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YellowMoonDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'YellowMoonDB', N'ON'
GO
ALTER DATABASE [YellowMoonDB] SET QUERY_STORE = OFF
GO
USE [YellowMoonDB]
GO
/****** Object:  Table [dbo].[tblCake]    Script Date: 10/18/2020 2:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCake](
	[CakeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Image] [varchar](max) NOT NULL,
	[Description] [varchar](max) NULL,
	[Category] [int] NOT NULL,
	[Create Date] [date] NOT NULL,
	[Expiration Date] [date] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblCake] PRIMARY KEY CLUSTERED 
(
	[CakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 10/18/2020 2:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLog]    Script Date: 10/18/2020 2:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](500) NOT NULL,
	[CakeID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblLog] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 10/18/2020 2:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[OrderID] [int] NOT NULL,
	[UserID] [varchar](500) NULL,
	[Total] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Phone] [varchar](max) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[Payment Method] [varchar](max) NOT NULL,
	[Payment Status] [bit] NOT NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 10/18/2020 2:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[CakeID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalPrice] [float] NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 10/18/2020 2:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleID] [int] NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 10/18/2020 2:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[StatusID] [int] NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 10/18/2020 2:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserID] [varchar](500) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Phone] [varchar](max) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[Role] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblUser_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCake] ON 

INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (2, N'Salted Eggs Mooncake', N'lavamooncake.jpg', N'Salted Eggs', 3, CAST(N'2020-10-09' AS Date), CAST(N'2020-11-19' AS Date), 80, 25, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (3, N'Mixed Mooncake', N'mixed.png', N'Mixed', 1, CAST(N'2020-10-07' AS Date), CAST(N'2020-11-06' AS Date), 400, 8, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (4, N'Fried Mooncake', N'mixed.png', N'Fried', 2, CAST(N'2020-10-03' AS Date), CAST(N'2020-11-07' AS Date), 180, 31, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (7, N'Fried Mooncake Vip', N'lavamooncake.jpg', N'Frieded', 1, CAST(N'2020-09-27' AS Date), CAST(N'2020-11-27' AS Date), 70, 17, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (8, N'Fried Mooncake 2', N'fried.png', N'Friedasd', 1, CAST(N'2020-10-04' AS Date), CAST(N'2020-11-07' AS Date), 290, 61, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (9, N'Bean Mooncake', N'fried.png', N'Bean', 3, CAST(N'2020-10-11' AS Date), CAST(N'2020-11-13' AS Date), 760, 8, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (10, N'Chocolate Mooncake', N'fried.png', N'delete me', 1, CAST(N'2020-10-11' AS Date), CAST(N'2020-11-13' AS Date), 1000, 8, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (11, N'Vegan Mooncake', N'lavamooncake.jpg', N'With Salted Eggs', 2, CAST(N'2020-10-10' AS Date), CAST(N'2020-11-18' AS Date), 150, 12, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (13, N'Tiramisu Mooncake', N'lavamooncake.jpg', N'Demo', 4, CAST(N'2020-08-08' AS Date), CAST(N'2021-02-02' AS Date), 30, 5, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (14, N'Demo Mooncake', N'lavamooncake.jpg', N'Demo', 4, CAST(N'2020-09-09' AS Date), CAST(N'2021-01-02' AS Date), 40, 4, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (15, N'Matcha Mooncake', N'macha.png', N'Ngon', 3, CAST(N'2020-10-10' AS Date), CAST(N'2020-11-11' AS Date), 50, 6, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (16, N'Demo Mooncake', N'macha.png', N'Demo', 1, CAST(N'2020-01-10' AS Date), CAST(N'2021-01-11' AS Date), 10, 42, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (17, N'Lava Mooncake', N'lavamooncake.jpg', N'Demo', 4, CAST(N'2020-10-10' AS Date), CAST(N'2020-11-07' AS Date), 10, 4, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (18, N'Special Mooncake', N'lavamooncake.jpg', N'khong ngon', 4, CAST(N'2020-10-10' AS Date), CAST(N'2020-11-30' AS Date), 60, 14, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (19, N'Bruh Mooncake', N'mixed.png', N'By the beach', 4, CAST(N'2019-03-10' AS Date), CAST(N'2020-12-11' AS Date), 20, 26, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (20, N'Happy Mooncake', N'fried.png', N'On a dark desert highway, cool wind in my hair Warm smell of colitas, rising up through the air', 2, CAST(N'2020-09-10' AS Date), CAST(N'2020-11-10' AS Date), 110, 100, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (21, N'Salty Mooncake', N'lavamooncake.jpg', N'Salted Eggs', 3, CAST(N'2020-10-12' AS Date), CAST(N'2020-11-18' AS Date), 50, 12, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (22, N'Red Bull Mooncake', N'mixed.png', N'Gives you wings.', 4, CAST(N'2020-10-17' AS Date), CAST(N'2020-11-07' AS Date), 230, 7, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (23, N'Demo Mooncake', N'macha.png', N'delete me', 1, CAST(N'2020-10-16' AS Date), CAST(N'2020-12-04' AS Date), 20, 12, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (24, N'Demo Mooncake', N'lavamooncake.jpg', N'Demo', 1, CAST(N'2020-10-06' AS Date), CAST(N'2020-11-09' AS Date), 10, 13, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (25, N'Durian Mooncake', N'mixed.png', N'delete me', 3, CAST(N'2020-10-10' AS Date), CAST(N'2020-12-16' AS Date), 10, 18, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (26, N'Gold Mooncake', N'lavamooncake.jpg', N'Gold 9999', 3, CAST(N'2020-10-18' AS Date), CAST(N'2020-11-02' AS Date), 30, 6, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (27, N'Cream Mooncake', N'lavamooncake.jpg', N'Cat loaf', 3, CAST(N'2020-10-10' AS Date), CAST(N'2020-11-05' AS Date), 40, 35, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (28, N'Moon Mooncake', N'fried.png', N'Mlem', 2, CAST(N'2020-10-18' AS Date), CAST(N'2020-11-02' AS Date), 40, 14, 1)
INSERT [dbo].[tblCake] ([CakeID], [Name], [Image], [Description], [Category], [Create Date], [Expiration Date], [Price], [Quantity], [Status]) VALUES (29, N'DeleteMe Mooncake', N'macha.png', N'delete me', 2, CAST(N'2020-10-09' AS Date), CAST(N'2020-10-24' AS Date), 20, 12, 0)
SET IDENTITY_INSERT [dbo].[tblCake] OFF
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([CategoryID], [Name]) VALUES (1, N'Chewy')
INSERT [dbo].[tblCategory] ([CategoryID], [Name]) VALUES (2, N'Flaky')
INSERT [dbo].[tblCategory] ([CategoryID], [Name]) VALUES (3, N'Tender')
INSERT [dbo].[tblCategory] ([CategoryID], [Name]) VALUES (4, N'Bruh')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
SET IDENTITY_INSERT [dbo].[tblLog] ON 

INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (3, N'admin', 2, CAST(N'2020-10-16T21:44:59.563' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (4, N'admin', 8, CAST(N'2020-10-17T15:06:28.567' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (5, N'admin', 11, CAST(N'2020-10-17T15:07:20.067' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (6, N'admin', 8, CAST(N'2020-10-17T15:43:11.993' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (7, N'admin', 3, CAST(N'2020-10-17T15:45:38.277' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (8, N'admin', 2, CAST(N'2020-10-17T15:46:44.813' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (9, N'admin', 11, CAST(N'2020-10-17T17:37:47.360' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (10, N'admin', 2, CAST(N'2020-10-17T17:37:56.033' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (11, N'admin', 3, CAST(N'2020-10-17T17:38:00.293' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (12, N'admin', 3, CAST(N'2020-10-17T17:39:53.683' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (13, N'admin', 3, CAST(N'2020-10-17T17:39:55.587' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (14, N'admin', 3, CAST(N'2020-10-17T17:40:40.617' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (15, N'admin', 3, CAST(N'2020-10-17T17:41:21.230' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (16, N'admin', 3, CAST(N'2020-10-17T17:42:02.190' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (17, N'admin', 3, CAST(N'2020-10-17T17:42:34.997' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (18, N'admin', 3, CAST(N'2020-10-17T17:42:47.073' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (19, N'admin', 3, CAST(N'2020-10-17T17:43:02.920' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (20, N'admin', 3, CAST(N'2020-10-17T17:43:08.797' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (21, N'admin', 3, CAST(N'2020-10-17T17:43:14.330' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (22, N'admin', 8, CAST(N'2020-10-17T17:43:22.603' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (23, N'admin', 4, CAST(N'2020-10-17T17:43:27.100' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (24, N'admin', 7, CAST(N'2020-10-17T17:43:31.923' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (25, N'admin', 3, CAST(N'2020-10-17T17:48:13.670' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (26, N'admin', 17, CAST(N'2020-10-17T18:23:26.813' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (27, N'admin', 23, CAST(N'2020-10-17T21:11:43.760' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (28, N'admin', 22, CAST(N'2020-10-17T22:56:48.943' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (29, N'admin', 23, CAST(N'2020-10-17T23:40:38.857' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (30, N'admin', 22, CAST(N'2020-10-17T23:48:35.710' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (31, N'admin', 21, CAST(N'2020-10-17T23:48:47.333' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (32, N'admin1', 26, CAST(N'2020-10-18T06:51:23.090' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (33, N'admin1', 26, CAST(N'2020-10-18T06:51:44.493' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (34, N'admin1', 10, CAST(N'2020-10-18T06:53:51.597' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (35, N'admin1', 26, CAST(N'2020-10-18T06:55:03.710' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (36, N'admin1', 9, CAST(N'2020-10-18T06:56:01.627' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (37, N'admin1', 10, CAST(N'2020-10-18T06:56:37.033' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (38, N'admin1', 17, CAST(N'2020-10-18T06:57:05.967' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (39, N'admin1', 25, CAST(N'2020-10-18T06:57:47.423' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (40, N'admin1', 13, CAST(N'2020-10-18T06:59:03.057' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (41, N'admin', 26, CAST(N'2020-10-18T07:44:16.360' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (42, N'admin', 23, CAST(N'2020-10-18T07:45:07.620' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (43, N'admin1', 22, CAST(N'2020-10-18T07:59:07.687' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (44, N'admin', 26, CAST(N'2020-10-18T09:13:44.767' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (45, N'admin', 26, CAST(N'2020-10-18T09:59:44.447' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (46, N'admin', 28, CAST(N'2020-10-18T10:08:35.513' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (47, N'admin', 2, CAST(N'2020-10-18T10:10:55.603' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (48, N'admin', 16, CAST(N'2020-10-18T10:11:23.440' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (49, N'admin', 13, CAST(N'2020-10-18T10:11:40.230' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (50, N'admin', 14, CAST(N'2020-10-18T10:11:52.740' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (51, N'admin1', 29, CAST(N'2020-10-18T11:17:14.580' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (52, N'admin1', 29, CAST(N'2020-10-18T11:17:33.377' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (53, N'admin1', 29, CAST(N'2020-10-18T11:17:35.963' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (54, N'admin', 22, CAST(N'2020-10-18T11:36:40.193' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (55, N'admin1', 26, CAST(N'2020-10-18T13:35:51.980' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (56, N'admin1', 28, CAST(N'2020-10-18T13:35:58.033' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (57, N'admin1', 22, CAST(N'2020-10-18T13:36:04.147' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (58, N'admin1', 23, CAST(N'2020-10-18T13:36:11.567' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (59, N'admin1', 9, CAST(N'2020-10-18T13:36:21.733' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (60, N'admin1', 10, CAST(N'2020-10-18T13:36:29.560' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (61, N'admin1', 11, CAST(N'2020-10-18T13:36:38.200' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (62, N'admin1', 17, CAST(N'2020-10-18T13:36:46.913' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (63, N'admin1', 18, CAST(N'2020-10-18T13:36:56.060' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (64, N'admin1', 15, CAST(N'2020-10-18T13:37:03.950' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (65, N'admin1', 27, CAST(N'2020-10-18T13:37:14.490' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (66, N'admin1', 2, CAST(N'2020-10-18T13:37:23.463' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (67, N'admin1', 2, CAST(N'2020-10-18T13:38:03.110' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (68, N'admin1', 25, CAST(N'2020-10-18T13:38:15.543' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (69, N'admin1', 21, CAST(N'2020-10-18T13:38:25.167' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (70, N'admin1', 14, CAST(N'2020-10-18T13:44:19.777' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (71, N'admin1', 13, CAST(N'2020-10-18T13:44:27.090' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (72, N'admin1', 16, CAST(N'2020-10-18T13:44:35.727' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (73, N'admin1', 7, CAST(N'2020-10-18T13:44:48.570' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (74, N'admin1', 4, CAST(N'2020-10-18T13:45:01.457' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (75, N'admin1', 8, CAST(N'2020-10-18T13:45:11.737' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (76, N'admin1', 24, CAST(N'2020-10-18T13:45:24.007' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (77, N'admin1', 3, CAST(N'2020-10-18T13:45:33.767' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (78, N'admin', 22, CAST(N'2020-10-18T13:49:02.980' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (79, N'admin', 26, CAST(N'2020-10-18T14:00:00.123' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (80, N'admin', 28, CAST(N'2020-10-18T14:00:06.540' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (81, N'admin', 22, CAST(N'2020-10-18T14:00:13.183' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (82, N'admin', 21, CAST(N'2020-10-18T14:00:19.330' AS DateTime), 1)
INSERT [dbo].[tblLog] ([LogID], [UserID], [CakeID], [Date], [Status]) VALUES (83, N'admin', 9, CAST(N'2020-10-18T14:00:28.020' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblLog] OFF
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (1, N'member', 480, CAST(N'2020-10-15T18:07:27.220' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (2, N'member', 1130, CAST(N'2020-10-15T18:08:55.140' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (3, N'member', 370, CAST(N'2020-10-16T07:08:12.210' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (4, N'member', 870, CAST(N'2020-10-16T09:30:02.427' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (5, NULL, 560, CAST(N'2020-10-16T23:08:20.940' AS DateTime), N'Long', N'0123456789', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (6, N'member', 12050, CAST(N'2020-10-17T14:07:17.480' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (7, N'member', 1120, CAST(N'2020-10-17T16:50:17.563' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (8, NULL, 450, CAST(N'2020-10-17T17:31:17.930' AS DateTime), N'Beggar', N'0987654321', N'Viet Nam', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (9, N'member', 810, CAST(N'2020-10-17T23:19:57.643' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (10, NULL, 940, CAST(N'2020-10-18T07:11:11.760' AS DateTime), N'Traveller', N'0123456788', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (11, NULL, 1000, CAST(N'2020-10-18T07:12:11.900' AS DateTime), N'Traveller', N'0123456788', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (12, NULL, 460, CAST(N'2020-10-18T07:16:30.553' AS DateTime), N'Traveller', N'0123456788', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (13, NULL, 150, CAST(N'2020-10-18T07:22:59.873' AS DateTime), N'Wanderer', N'0123456787', N'Viet Nam', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (14, NULL, 300, CAST(N'2020-10-18T07:24:16.153' AS DateTime), N'Wanderer', N'0123456788', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (15, N'member1', 790, CAST(N'2020-10-18T07:36:44.837' AS DateTime), N'Watermelon', N'0900100020', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (16, N'member1', 20, CAST(N'2020-10-18T07:37:17.350' AS DateTime), N'Watermelon', N'0900100020', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (17, N'member1', 920, CAST(N'2020-10-18T08:00:58.940' AS DateTime), N'Watermelon', N'0900100020', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (18, NULL, 690, CAST(N'2020-10-18T08:25:56.060' AS DateTime), N'Wanderer', N'0123456787', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (19, N'member', 1910, CAST(N'2020-10-18T09:29:47.310' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (20, N'member', 230, CAST(N'2020-10-18T09:31:10.060' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (21, NULL, 2060, CAST(N'2020-10-18T09:56:38.340' AS DateTime), N'Traveller', N'0123456789', N'Viet Nam', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (22, N'member', 230, CAST(N'2020-10-18T09:58:30.130' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (23, NULL, 230, CAST(N'2020-10-18T10:05:04.557' AS DateTime), N'Cake Buyer', N'0123452780', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (24, NULL, 80, CAST(N'2020-10-18T10:20:11.323' AS DateTime), N'Traveller', N'1234567890', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (25, NULL, 40, CAST(N'2020-10-18T10:23:25.747' AS DateTime), N'Traveller', N'0123456788', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (26, NULL, 40, CAST(N'2020-10-18T10:30:00.373' AS DateTime), N'Traveller', N'1234567890', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (27, NULL, 3900, CAST(N'2020-10-18T10:58:30.893' AS DateTime), N'Traveller', N'0123452780', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (28, NULL, 270, CAST(N'2020-10-18T11:12:09.830' AS DateTime), N'Wanderer', N'0987654321', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (29, N'member', 920, CAST(N'2020-10-18T11:12:34.407' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (30, N'member1', 2210, CAST(N'2020-10-18T11:14:24.303' AS DateTime), N'Watermelon', N'0900100020', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (31, NULL, 790, CAST(N'2020-10-18T11:18:25.580' AS DateTime), N'Traveller', N'1234567890', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (32, NULL, 6440, CAST(N'2020-10-18T11:30:22.950' AS DateTime), N'Demo Mooncake', N'0123452780', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (33, NULL, 20, CAST(N'2020-10-18T12:05:09.613' AS DateTime), N'Traveller', N'0123452780', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (34, NULL, 690, CAST(N'2020-10-18T12:20:56.367' AS DateTime), N'Traveller', N'0123452780', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (35, NULL, 370, CAST(N'2020-10-18T12:26:12.970' AS DateTime), N'Bruh', N'0123452780', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (36, NULL, 640, CAST(N'2020-10-18T12:31:52.143' AS DateTime), N'Bruh', N'1234567890', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (37, NULL, 460, CAST(N'2020-10-18T12:37:40.560' AS DateTime), N'test', N'0123456787', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (38, NULL, 460, CAST(N'2020-10-18T12:37:56.350' AS DateTime), N'Traveller', N'0123452780', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (39, NULL, 150, CAST(N'2020-10-18T12:38:59.450' AS DateTime), N'Demo', N'0123452780', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (40, NULL, 200, CAST(N'2020-10-18T12:39:34.657' AS DateTime), N'Traveller', N'0987654321', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (41, NULL, 40, CAST(N'2020-10-18T12:41:02.357' AS DateTime), N'Demo', N'0987654321', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (42, NULL, 160, CAST(N'2020-10-18T12:43:35.260' AS DateTime), N'Demo', N'0123452780', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (43, NULL, 210, CAST(N'2020-10-18T12:45:45.083' AS DateTime), N'Traveller', N'0123456787', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (44, NULL, 0, CAST(N'2020-10-18T12:45:55.523' AS DateTime), N'Demo', N'1234567890', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (45, NULL, 120, CAST(N'2020-10-18T12:49:45.760' AS DateTime), N'Salted Egg Mooncake', N'1234567890', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (46, NULL, 0, CAST(N'2020-10-18T12:49:48.133' AS DateTime), N'Demo Mooncake', N'1234567890', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (47, NULL, 300, CAST(N'2020-10-18T12:59:22.460' AS DateTime), N'Traveller', N'0987654321', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (48, NULL, 10, CAST(N'2020-10-18T13:01:01.500' AS DateTime), N'Traveller', N'1234567890', N'California', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (49, N'member', 600, CAST(N'2020-10-18T13:01:50.150' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (50, N'member', 35440, CAST(N'2020-10-18T13:04:52.803' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (51, N'member', 1620, CAST(N'2020-10-18T13:10:46.840' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (52, N'member1', 2410, CAST(N'2020-10-18T13:17:05.543' AS DateTime), N'Watermelon', N'0900100020', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (53, N'member1', 58250, CAST(N'2020-10-18T13:20:58.390' AS DateTime), N'Watermelon', N'0900100020', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (54, N'member', 8390, CAST(N'2020-10-18T13:21:58.637' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (55, N'member1', 8390, CAST(N'2020-10-18T13:22:01.420' AS DateTime), N'Watermelon', N'0900100020', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (56, N'member1', 52010, CAST(N'2020-10-18T13:25:00.413' AS DateTime), N'Watermelon', N'0900100020', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (57, N'member1', 360, CAST(N'2020-10-18T13:34:26.650' AS DateTime), N'Watermelon', N'0900100020', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (58, N'member1', 1790, CAST(N'2020-10-18T13:48:26.250' AS DateTime), N'Watermelon', N'0900100020', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (59, N'member', 1910, CAST(N'2020-10-18T13:48:37.603' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (60, N'member1', 320, CAST(N'2020-10-18T13:58:19.717' AS DateTime), N'Watermelon', N'0900100020', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (61, N'member1', 3340, CAST(N'2020-10-18T13:58:52.620' AS DateTime), N'Watermelon', N'0900100020', N'Texas', N'Cash upon Delivery', 0)
INSERT [dbo].[tblOrder] ([OrderID], [UserID], [Total], [Date], [Name], [Phone], [Address], [Payment Method], [Payment Status]) VALUES (62, N'member', 2690, CAST(N'2020-10-18T13:59:17.233' AS DateTime), N'Shopper', N'0901234567', N'Viet Cong', N'Cash upon Delivery', 0)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (3, 1, 2, 1, 80)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (4, 1, 3, 1, 400)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (5, 2, 2, 1, 80)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (6, 2, 3, 1, 400)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (7, 2, 4, 2, 360)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (8, 2, 8, 1, 290)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (9, 3, 2, 1, 80)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (10, 3, 8, 1, 290)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (11, 4, 8, 3, 870)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (12, 5, 2, 2, 160)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (13, 5, 3, 1, 400)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (14, 6, 2, 1, 80)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (15, 6, 3, 12, 4800)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (16, 6, 7, 3, 210)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (17, 6, 8, 24, 6960)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (18, 7, 2, 14, 1120)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (19, 8, 11, 3, 450)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (20, 9, 21, 1, 50)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (21, 9, 22, 2, 460)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (22, 9, 11, 2, 300)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (23, 10, 22, 4, 920)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (24, 10, 26, 1, 20)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (25, 11, 10, 1, 1000)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (26, 12, 22, 2, 460)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (27, 13, 21, 3, 150)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (28, 14, 21, 6, 300)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (29, 15, 21, 2, 100)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (30, 15, 22, 3, 690)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (31, 16, 23, 1, 20)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (32, 17, 22, 4, 920)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (33, 18, 22, 3, 690)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (34, 19, 21, 6, 300)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (35, 19, 22, 7, 1610)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (36, 20, 22, 1, 230)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (37, 21, 19, 4, 80)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (38, 21, 22, 2, 460)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (39, 21, 9, 2, 1520)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (40, 22, 22, 1, 230)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (41, 23, 22, 1, 230)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (42, 24, 28, 2, 80)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (43, 25, 28, 1, 40)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (44, 26, 28, 1, 40)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (45, 27, 21, 32, 1600)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (46, 27, 22, 10, 2300)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (47, 28, 22, 1, 230)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (48, 28, 28, 1, 40)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (49, 29, 22, 4, 920)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (50, 30, 22, 3, 690)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (51, 30, 9, 2, 1520)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (52, 31, 21, 2, 100)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (53, 31, 22, 3, 690)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (54, 32, 22, 28, 6440)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (55, 33, 23, 1, 20)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (56, 34, 22, 3, 690)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (57, 35, 21, 2, 100)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (58, 35, 22, 1, 230)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (59, 35, 28, 1, 40)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (60, 36, 21, 2, 100)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (61, 36, 22, 2, 460)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (62, 36, 28, 2, 80)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (63, 37, 22, 2, 460)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (64, 38, 22, 2, 460)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (65, 39, 21, 3, 150)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (66, 40, 21, 4, 200)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (67, 41, 23, 2, 40)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (68, 42, 28, 4, 160)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (69, 43, 26, 7, 210)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (70, 44, 26, 0, 0)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (71, 45, 18, 2, 120)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (72, 47, 15, 6, 300)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (73, 48, 24, 1, 10)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (74, 49, 27, 8, 320)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (75, 49, 14, 7, 280)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (76, 50, 21, 30, 1500)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (77, 50, 22, 22, 5060)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (78, 50, 9, 38, 28880)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (79, 51, 21, 30, 1500)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (80, 51, 25, 12, 120)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (81, 52, 17, 25, 250)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (82, 52, 2, 27, 2160)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (83, 53, 10, 41, 41000)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (84, 53, 11, 115, 17250)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (85, 54, 4, 40, 7200)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (86, 54, 7, 17, 1190)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (87, 55, 4, 40, 7200)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (88, 55, 7, 17, 1190)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (89, 56, 3, 80, 32000)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (90, 56, 8, 69, 20010)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (91, 57, 16, 12, 120)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (92, 57, 13, 8, 240)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (93, 58, 21, 1, 50)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (94, 58, 22, 4, 920)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (95, 58, 9, 1, 760)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (96, 58, 26, 2, 60)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (97, 59, 22, 8, 1840)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (98, 59, 26, 1, 30)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (99, 59, 28, 1, 40)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (100, 60, 26, 4, 120)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (101, 60, 28, 5, 200)
GO
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (102, 61, 21, 6, 300)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (103, 61, 9, 4, 3040)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (104, 62, 22, 11, 2530)
INSERT [dbo].[tblOrderDetail] ([DetailID], [OrderID], [CakeID], [Quantity], [TotalPrice]) VALUES (105, 62, 23, 8, 160)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
INSERT [dbo].[tblRole] ([RoleID], [Name]) VALUES (1, N'Member')
INSERT [dbo].[tblRole] ([RoleID], [Name]) VALUES (2, N'Admin')
INSERT [dbo].[tblStatus] ([StatusID], [Name]) VALUES (0, N'Deactive')
INSERT [dbo].[tblStatus] ([StatusID], [Name]) VALUES (1, N'Active')
INSERT [dbo].[tblUser] ([UserID], [Password], [Name], [Phone], [Address], [Role], [Status]) VALUES (N'admin', N'1', N'Admin', N'0900069420', N'Viet Nam', 2, 1)
INSERT [dbo].[tblUser] ([UserID], [Password], [Name], [Phone], [Address], [Role], [Status]) VALUES (N'admin1', N'1', N'Manager', N'0906666666', N'California', 2, 1)
INSERT [dbo].[tblUser] ([UserID], [Password], [Name], [Phone], [Address], [Role], [Status]) VALUES (N'member', N'1', N'Shopper', N'0901234567', N'Viet Cong', 1, 1)
INSERT [dbo].[tblUser] ([UserID], [Password], [Name], [Phone], [Address], [Role], [Status]) VALUES (N'member1', N'1', N'Watermelon', N'0900100020', N'Texas', 1, 1)
ALTER TABLE [dbo].[tblCake]  WITH CHECK ADD  CONSTRAINT [FK_tblCake_tblCategory] FOREIGN KEY([Category])
REFERENCES [dbo].[tblCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[tblCake] CHECK CONSTRAINT [FK_tblCake_tblCategory]
GO
ALTER TABLE [dbo].[tblCake]  WITH CHECK ADD  CONSTRAINT [FK_tblCake_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusID])
GO
ALTER TABLE [dbo].[tblCake] CHECK CONSTRAINT [FK_tblCake_tblStatus]
GO
ALTER TABLE [dbo].[tblLog]  WITH CHECK ADD  CONSTRAINT [FK_tblLog_tblCake] FOREIGN KEY([CakeID])
REFERENCES [dbo].[tblCake] ([CakeID])
GO
ALTER TABLE [dbo].[tblLog] CHECK CONSTRAINT [FK_tblLog_tblCake]
GO
ALTER TABLE [dbo].[tblLog]  WITH CHECK ADD  CONSTRAINT [FK_tblLog_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusID])
GO
ALTER TABLE [dbo].[tblLog] CHECK CONSTRAINT [FK_tblLog_tblStatus]
GO
ALTER TABLE [dbo].[tblLog]  WITH CHECK ADD  CONSTRAINT [FK_tblLog_tblUser1] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblLog] CHECK CONSTRAINT [FK_tblLog_tblUser1]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser1] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser1]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblCake] FOREIGN KEY([CakeID])
REFERENCES [dbo].[tblCake] ([CakeID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblCake]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tblOrder] ([OrderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole] FOREIGN KEY([Role])
REFERENCES [dbo].[tblRole] ([RoleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblStatus]
GO
USE [master]
GO
ALTER DATABASE [YellowMoonDB] SET  READ_WRITE 
GO
