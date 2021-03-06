/*    ==Параметры сценариев==

    Версия исходного сервера : SQL Server 2017 (14.0.1000)
    Выпуск исходного ядра СУБД : Выпуск Microsoft SQL Server Express Edition
    Тип исходного ядра СУБД : Изолированный SQL Server

    Версия целевого сервера : SQL Server 2012
    Выпуск целевого ядра СУБД : Выпуск Microsoft SQL Server Standard Edition
    Тип целевого ядра СУБД : Изолированный SQL Server
*/
USE [master]
GO
/****** Object:  Database [KCM_MGMT_DB]    Script Date: 30.09.2018 12:01:17 ******/
CREATE DATABASE [KCM_MGMT_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KCM_MGMT_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\KCM_MGMT_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KCM_MGMT_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\KCM_MGMT_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [KCM_MGMT_DB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KCM_MGMT_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KCM_MGMT_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [KCM_MGMT_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KCM_MGMT_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KCM_MGMT_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KCM_MGMT_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KCM_MGMT_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [KCM_MGMT_DB] SET  MULTI_USER 
GO
ALTER DATABASE [KCM_MGMT_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KCM_MGMT_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KCM_MGMT_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KCM_MGMT_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [KCM_MGMT_DB]
GO
/****** Object:  User [alex]    Script Date: 30.09.2018 12:01:17 ******/
CREATE USER [alex] FOR LOGIN [alex] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [alex]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [alex]
GO
/****** Object:  Table [dbo].[Budget]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Budget](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[budget_sum] [money] NULL,
 CONSTRAINT [PK_Budget] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[employee_name] [nchar](60) NULL,
	[positionID] [int] NULL,
	[salary] [money] NULL,
	[address] [nchar](60) NULL,
	[phone] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinishedProducts]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinishedProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nchar](60) NULL,
	[unitID] [int] NULL,
	[sum] [money] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_FinishedProducts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [int] NULL,
	[raw_name] [int] NULL,
	[quantity] [decimal](12, 3) NULL,
 CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loans]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loans](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[sum] [money] NULL,
	[l_percent] [decimal](4, 2) NULL,
	[fine_perc] [decimal](4, 2) NULL,
	[duration] [int] NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_Loans] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoansRepayments]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoansRepayments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[loan_ID] [int] NULL,
	[rep_sum] [money] NULL,
	[proc_sum] [money] NULL,
	[fine_sum] [money] NULL,
	[date] [datetime] NULL,
	[residue] [money] NULL,
 CONSTRAINT [PK_LoansRepayments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManufactureHistory]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManufactureHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[prodID] [int] NULL,
	[rawMat] [int] NULL,
	[rawQuantity] [decimal](12, 3) NULL,
	[rawSum] [money] NULL,
 CONSTRAINT [PK_ManufactureHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufactures]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufactures](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[product_nameID] [int] NULL,
	[quantity] [int] NULL,
	[date] [datetime] NULL,
	[employeeID] [int] NULL,
	[man_sum] [money] NULL,
 CONSTRAINT [PK_Manufacture] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operations]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[operation] [nchar](45) NULL,
 CONSTRAINT [PK_Operations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[salary] [money] NULL,
	[bonus] [money] NULL,
	[sum] [money] NULL,
	[empl_name] [int] NULL,
	[year] [smallint] NULL,
	[month] [smallint] NULL,
	[count] [smallint] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[position] [nchar](60) NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Procents]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Procents](
	[ID] [int] NULL,
	[procent] [decimal](4, 2) NULL,
	[proc_type] [nchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsSales]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsSales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[product_nameID] [int] NULL,
	[quantity] [int] NULL,
	[date] [datetime] NULL,
	[emloyeeID] [int] NULL,
	[prod_sum] [money] NULL,
	[sale_percent] [money] NULL,
 CONSTRAINT [PK_ProductsSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RawMaterials]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RawMaterials](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[raw_name] [nchar](35) NULL,
	[unitID] [int] NULL,
	[sum] [money] NULL,
	[quantity] [decimal](12, 3) NULL,
 CONSTRAINT [PK_RawMaterials] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RawMatPurchases]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RawMatPurchases](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[raw_nameID] [int] NULL,
	[quantity] [decimal](12, 3) NULL,
	[sum] [money] NULL,
	[date] [datetime] NULL,
	[employee_nameID] [int] NULL,
 CONSTRAINT [PK_RawMatPurchase] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[unit_name] [nchar](10) NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[FP_Empl_View]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FP_Empl_View]
AS
SELECT        dbo.Employees.ID, dbo.Employees.employee_name, dbo.Positions.position, dbo.Employees.salary, dbo.Employees.address, dbo.Employees.phone
FROM            dbo.Employees INNER JOIN
                         dbo.Positions ON dbo.Employees.position = dbo.Positions.ID
GO
/****** Object:  View [dbo].[FP_EmplDataset]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FP_EmplDataset]
AS
SELECT        dbo.Manufacture.date as [Дата], dbo.Manufacture.employee as [Сотрудник]
FROM            dbo.Manufacture 
WHERE dbo.Manufacture.employee is not null
UNION ALL
SELECT        dbo.ProductsSale.date, dbo.ProductsSale.emloyee
FROM            dbo.ProductsSale 
WHERE dbo.ProductsSale.emloyee is not null
UNION ALL
SELECT        dbo.RawMatPurchase.date, dbo.RawMatPurchase.employee_name
FROM            dbo.RawMatPurchase
WHERE dbo.RawMatPurchase.employee_name is not null
GO
/****** Object:  View [dbo].[FP_Ingr_View]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FP_Ingr_View]
AS
SELECT        dbo.FinishedProducts.ID, dbo.FinishedProducts.product_name AS Продукт, dbo.FinishedProducts.sum AS Стоимость, dbo.FinishedProducts.quantity AS Количество, dbo.RawMaterials.ID AS [ID сырья], 
                         dbo.RawMaterials.raw_name AS Сырьё, dbo.Ingredients.quantity AS [Необх кол-во сырья], dbo.RawMaterials.quantity AS [Всего сырья], dbo.Units.unit_name AS Ед_изм, dbo.Budget.budget_sum AS Бюджет
FROM            dbo.FinishedProducts INNER JOIN
                         dbo.Ingredients ON dbo.FinishedProducts.ID = dbo.Ingredients.product_name AND dbo.FinishedProducts.ID = dbo.Ingredients.product_name INNER JOIN
                         dbo.RawMaterials ON dbo.Ingredients.raw_name = dbo.RawMaterials.ID INNER JOIN
                         dbo.Units ON dbo.RawMaterials.unit = dbo.Units.ID CROSS JOIN
                         dbo.Budget
GO
SET IDENTITY_INSERT [dbo].[Budget] ON 

INSERT [dbo].[Budget] ([ID], [budget_sum]) VALUES (1, 1075943.7000)
SET IDENTITY_INSERT [dbo].[Budget] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([ID], [employee_name], [positionID], [salary], [address], [phone]) VALUES (1, N'Никонов Демьян Митрофанович                                 ', 5, 25000.2500, N'Уличная 123                                                 ', 1222)
INSERT [dbo].[Employees] ([ID], [employee_name], [positionID], [salary], [address], [phone]) VALUES (2, N'Воронцова Тамара Альбертовна                                ', 1, 30000.0000, NULL, NULL)
INSERT [dbo].[Employees] ([ID], [employee_name], [positionID], [salary], [address], [phone]) VALUES (3, N'Коновалова Вероника Ильяовна                                ', 3, 20000.0000, NULL, NULL)
INSERT [dbo].[Employees] ([ID], [employee_name], [positionID], [salary], [address], [phone]) VALUES (4, N'Блинов Даниил Агафонович                                    ', 2, 20000.0000, NULL, NULL)
INSERT [dbo].[Employees] ([ID], [employee_name], [positionID], [salary], [address], [phone]) VALUES (5, N'Гусев Ириней Юлианович                                      ', 3, 10000.0000, NULL, NULL)
INSERT [dbo].[Employees] ([ID], [employee_name], [positionID], [salary], [address], [phone]) VALUES (6, N'Антонова Ксения Авксентьевна                                ', 3, 10000.7500, NULL, 111)
INSERT [dbo].[Employees] ([ID], [employee_name], [positionID], [salary], [address], [phone]) VALUES (7, N'Рогова Надежда Борисовна                                    ', 3, 10000.0000, NULL, NULL)
INSERT [dbo].[Employees] ([ID], [employee_name], [positionID], [salary], [address], [phone]) VALUES (8, N'Якушев Борис Протасьевич                                    ', 4, 15000.0000, NULL, NULL)
INSERT [dbo].[Employees] ([ID], [employee_name], [positionID], [salary], [address], [phone]) VALUES (9, N'Сидорова Лукия Денисовна                                    ', 4, 15000.0000, NULL, NULL)
INSERT [dbo].[Employees] ([ID], [employee_name], [positionID], [salary], [address], [phone]) VALUES (10, N'Жданов Сергей Максимович                                    ', 4, 15000.0000, NULL, NULL)
INSERT [dbo].[Employees] ([ID], [employee_name], [positionID], [salary], [address], [phone]) VALUES (11, N'Гуляева Алла Юрьевна                                        ', 4, 15000.0000, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[FinishedProducts] ON 

INSERT [dbo].[FinishedProducts] ([ID], [product_name], [unitID], [sum], [quantity]) VALUES (1, N'Изделие 1                                                   ', 2, 298000.0000, 110)
INSERT [dbo].[FinishedProducts] ([ID], [product_name], [unitID], [sum], [quantity]) VALUES (2, N'Изделие 2                                                   ', 2, 30961.7000, 53)
INSERT [dbo].[FinishedProducts] ([ID], [product_name], [unitID], [sum], [quantity]) VALUES (3, N'Изделие 3                                                   ', 2, 107700.0000, 170)
INSERT [dbo].[FinishedProducts] ([ID], [product_name], [unitID], [sum], [quantity]) VALUES (4, N'Изделие 4                                                   ', 2, 96900.0000, 130)
SET IDENTITY_INSERT [dbo].[FinishedProducts] OFF
SET IDENTITY_INSERT [dbo].[Ingredients] ON 

INSERT [dbo].[Ingredients] ([ID], [product_name], [raw_name], [quantity]) VALUES (1, 1, 3, CAST(0.500 AS Decimal(12, 3)))
INSERT [dbo].[Ingredients] ([ID], [product_name], [raw_name], [quantity]) VALUES (2, 1, 4, CAST(0.400 AS Decimal(12, 3)))
INSERT [dbo].[Ingredients] ([ID], [product_name], [raw_name], [quantity]) VALUES (3, 1, 5, CAST(0.300 AS Decimal(12, 3)))
INSERT [dbo].[Ingredients] ([ID], [product_name], [raw_name], [quantity]) VALUES (4, 3, 3, CAST(0.600 AS Decimal(12, 3)))
INSERT [dbo].[Ingredients] ([ID], [product_name], [raw_name], [quantity]) VALUES (5, 3, 5, CAST(0.800 AS Decimal(12, 3)))
INSERT [dbo].[Ingredients] ([ID], [product_name], [raw_name], [quantity]) VALUES (6, 4, 4, CAST(0.600 AS Decimal(12, 3)))
INSERT [dbo].[Ingredients] ([ID], [product_name], [raw_name], [quantity]) VALUES (7, 4, 5, CAST(0.700 AS Decimal(12, 3)))
INSERT [dbo].[Ingredients] ([ID], [product_name], [raw_name], [quantity]) VALUES (8, 2, 4, CAST(0.400 AS Decimal(12, 3)))
INSERT [dbo].[Ingredients] ([ID], [product_name], [raw_name], [quantity]) VALUES (9, 2, 5, CAST(0.900 AS Decimal(12, 3)))
SET IDENTITY_INSERT [dbo].[Ingredients] OFF
SET IDENTITY_INSERT [dbo].[Loans] ON 

INSERT [dbo].[Loans] ([ID], [sum], [l_percent], [fine_perc], [duration], [date]) VALUES (1, 1000000.0000, CAST(10.00 AS Decimal(4, 2)), CAST(0.50 AS Decimal(4, 2)), 3, CAST(N'2018-03-18T19:16:54.203' AS DateTime))
INSERT [dbo].[Loans] ([ID], [sum], [l_percent], [fine_perc], [duration], [date]) VALUES (3, 2500000.0000, CAST(12.00 AS Decimal(4, 2)), CAST(0.50 AS Decimal(4, 2)), 5, CAST(N'2018-03-22T00:31:32.227' AS DateTime))
INSERT [dbo].[Loans] ([ID], [sum], [l_percent], [fine_perc], [duration], [date]) VALUES (4, 15000.0000, CAST(12.00 AS Decimal(4, 2)), CAST(0.50 AS Decimal(4, 2)), 1, CAST(N'2018-03-22T10:21:50.603' AS DateTime))
INSERT [dbo].[Loans] ([ID], [sum], [l_percent], [fine_perc], [duration], [date]) VALUES (6, 25000.0000, CAST(12.00 AS Decimal(4, 2)), CAST(0.50 AS Decimal(4, 2)), 1, CAST(N'2018-05-09T20:37:20.073' AS DateTime))
INSERT [dbo].[Loans] ([ID], [sum], [l_percent], [fine_perc], [duration], [date]) VALUES (8, 50000.0000, CAST(12.00 AS Decimal(4, 2)), CAST(0.50 AS Decimal(4, 2)), 1, CAST(N'2018-05-09T20:38:35.780' AS DateTime))
SET IDENTITY_INSERT [dbo].[Loans] OFF
SET IDENTITY_INSERT [dbo].[LoansRepayments] ON 

INSERT [dbo].[LoansRepayments] ([ID], [loan_ID], [rep_sum], [proc_sum], [fine_sum], [date], [residue]) VALUES (1, 1, 30555.5555, 2777.7778, NULL, CAST(N'2018-03-28T00:00:00.000' AS DateTime), 972222.2223)
INSERT [dbo].[LoansRepayments] ([ID], [loan_ID], [rep_sum], [proc_sum], [fine_sum], [date], [residue]) VALUES (2, 1, 30555.5555, 2700.6173, NULL, CAST(N'2018-04-02T00:00:00.000' AS DateTime), 941666.6668)
INSERT [dbo].[LoansRepayments] ([ID], [loan_ID], [rep_sum], [proc_sum], [fine_sum], [date], [residue]) VALUES (8, 8, 5109.9999, 411.6667, 443.3333, CAST(N'2018-07-20T00:00:00.000' AS DateTime), 36500.0002)
INSERT [dbo].[LoansRepayments] ([ID], [loan_ID], [rep_sum], [proc_sum], [fine_sum], [date], [residue]) VALUES (9, 6, 3931.6666, 250.0000, 1598.3333, CAST(N'2018-10-23T00:00:00.000' AS DateTime), 22916.6667)
INSERT [dbo].[LoansRepayments] ([ID], [loan_ID], [rep_sum], [proc_sum], [fine_sum], [date], [residue]) VALUES (10, 6, 2368.3333, 229.1667, 35.0000, CAST(N'2018-11-25T00:00:00.000' AS DateTime), 20583.3334)
SET IDENTITY_INSERT [dbo].[LoansRepayments] OFF
SET IDENTITY_INSERT [dbo].[ManufactureHistory] ON 

INSERT [dbo].[ManufactureHistory] ([ID], [prodID], [rawMat], [rawQuantity], [rawSum]) VALUES (30, 12, 3, CAST(5.000 AS Decimal(12, 3)), 4000.0000)
INSERT [dbo].[ManufactureHistory] ([ID], [prodID], [rawMat], [rawQuantity], [rawSum]) VALUES (31, 12, 4, CAST(4.000 AS Decimal(12, 3)), 3600.0000)
INSERT [dbo].[ManufactureHistory] ([ID], [prodID], [rawMat], [rawQuantity], [rawSum]) VALUES (32, 12, 5, CAST(3.000 AS Decimal(12, 3)), 3000.0000)
INSERT [dbo].[ManufactureHistory] ([ID], [prodID], [rawMat], [rawQuantity], [rawSum]) VALUES (33, 12, 5, CAST(0.000 AS Decimal(12, 3)), 0.0000)
INSERT [dbo].[ManufactureHistory] ([ID], [prodID], [rawMat], [rawQuantity], [rawSum]) VALUES (34, 13, 3, CAST(5.000 AS Decimal(12, 3)), 4000.0000)
INSERT [dbo].[ManufactureHistory] ([ID], [prodID], [rawMat], [rawQuantity], [rawSum]) VALUES (35, 13, 4, CAST(4.000 AS Decimal(12, 3)), 3600.0000)
INSERT [dbo].[ManufactureHistory] ([ID], [prodID], [rawMat], [rawQuantity], [rawSum]) VALUES (36, 13, 5, CAST(3.000 AS Decimal(12, 3)), 3000.0000)
INSERT [dbo].[ManufactureHistory] ([ID], [prodID], [rawMat], [rawQuantity], [rawSum]) VALUES (37, 13, 5, CAST(0.000 AS Decimal(12, 3)), 0.0000)
INSERT [dbo].[ManufactureHistory] ([ID], [prodID], [rawMat], [rawQuantity], [rawSum]) VALUES (42, 15, 5, CAST(0.000 AS Decimal(12, 3)), 0.0000)
INSERT [dbo].[ManufactureHistory] ([ID], [prodID], [rawMat], [rawQuantity], [rawSum]) VALUES (43, 15, 5, CAST(0.000 AS Decimal(12, 3)), 0.0000)
INSERT [dbo].[ManufactureHistory] ([ID], [prodID], [rawMat], [rawQuantity], [rawSum]) VALUES (44, 15, 5, CAST(0.000 AS Decimal(12, 3)), 0.0000)
INSERT [dbo].[ManufactureHistory] ([ID], [prodID], [rawMat], [rawQuantity], [rawSum]) VALUES (45, 15, 5, CAST(0.000 AS Decimal(12, 3)), 0.0000)
INSERT [dbo].[ManufactureHistory] ([ID], [prodID], [rawMat], [rawQuantity], [rawSum]) VALUES (46, 16, 5, CAST(0.000 AS Decimal(12, 3)), 0.0000)
INSERT [dbo].[ManufactureHistory] ([ID], [prodID], [rawMat], [rawQuantity], [rawSum]) VALUES (47, 16, 5, CAST(0.000 AS Decimal(12, 3)), 0.0000)
INSERT [dbo].[ManufactureHistory] ([ID], [prodID], [rawMat], [rawQuantity], [rawSum]) VALUES (48, 16, 5, CAST(0.000 AS Decimal(12, 3)), 0.0000)
SET IDENTITY_INSERT [dbo].[ManufactureHistory] OFF
SET IDENTITY_INSERT [dbo].[Manufactures] ON 

INSERT [dbo].[Manufactures] ([ID], [product_nameID], [quantity], [date], [employeeID], [man_sum]) VALUES (15, 1, 30, CAST(N'2018-05-25T23:25:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Manufactures] ([ID], [product_nameID], [quantity], [date], [employeeID], [man_sum]) VALUES (16, 2, 30, CAST(N'2018-05-25T10:02:00.000' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[Manufactures] OFF
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([ID], [date], [salary], [bonus], [sum], [empl_name], [year], [month], [count]) VALUES (1, CAST(N'2018-03-18T17:24:58.680' AS DateTime), 15000.0000, 4500.0000, 19500.0000, 8, 2018, 1, 5)
INSERT [dbo].[Payments] ([ID], [date], [salary], [bonus], [sum], [empl_name], [year], [month], [count]) VALUES (2, CAST(N'2018-03-18T17:25:31.153' AS DateTime), 15000.0000, 4500.0000, 19500.0000, 8, 2018, 2, 5)
INSERT [dbo].[Payments] ([ID], [date], [salary], [bonus], [sum], [empl_name], [year], [month], [count]) VALUES (3, CAST(N'2018-03-18T18:54:36.020' AS DateTime), 15000.0000, 6562.5000, 21562.5000, 10, 2018, 2, 7)
INSERT [dbo].[Payments] ([ID], [date], [salary], [bonus], [sum], [empl_name], [year], [month], [count]) VALUES (4, CAST(N'2018-04-19T23:47:43.417' AS DateTime), 15000.0000, 0.0000, 15000.0000, 8, 2018, 3, 0)
INSERT [dbo].[Payments] ([ID], [date], [salary], [bonus], [sum], [empl_name], [year], [month], [count]) VALUES (5, CAST(N'2018-04-19T23:49:51.317' AS DateTime), 15000.0000, 0.0000, 15000.0000, 10, 2018, 3, 0)
INSERT [dbo].[Payments] ([ID], [date], [salary], [bonus], [sum], [empl_name], [year], [month], [count]) VALUES (6, CAST(N'2018-04-19T23:51:18.103' AS DateTime), 15000.0000, 0.0000, 15000.0000, 10, 2018, 4, 0)
INSERT [dbo].[Payments] ([ID], [date], [salary], [bonus], [sum], [empl_name], [year], [month], [count]) VALUES (7, CAST(N'2018-04-19T23:52:54.290' AS DateTime), 25000.2500, 10937.6092, 35937.8592, 1, 2018, 4, 7)
INSERT [dbo].[Payments] ([ID], [date], [salary], [bonus], [sum], [empl_name], [year], [month], [count]) VALUES (8, CAST(N'2018-04-19T23:53:09.093' AS DateTime), 25000.2500, 10937.6092, 35937.8592, 1, 2018, 3, 7)
INSERT [dbo].[Payments] ([ID], [date], [salary], [bonus], [sum], [empl_name], [year], [month], [count]) VALUES (9, CAST(N'2018-04-19T23:53:25.513' AS DateTime), 25000.2500, 10937.6092, 35937.8592, 1, 2018, 2, 7)
INSERT [dbo].[Payments] ([ID], [date], [salary], [bonus], [sum], [empl_name], [year], [month], [count]) VALUES (11, CAST(N'2018-04-19T23:53:50.167' AS DateTime), 25000.2500, 0.0000, 25000.2500, 1, 2017, 1, 0)
INSERT [dbo].[Payments] ([ID], [date], [salary], [bonus], [sum], [empl_name], [year], [month], [count]) VALUES (12, CAST(N'2018-04-19T23:55:36.347' AS DateTime), 25000.2500, 0.0000, 25000.2500, 1, 2017, 5, 0)
INSERT [dbo].[Payments] ([ID], [date], [salary], [bonus], [sum], [empl_name], [year], [month], [count]) VALUES (13, CAST(N'2018-04-19T23:55:53.320' AS DateTime), 25000.2500, 3125.0312, 28125.2812, 1, 2018, 5, 2)
INSERT [dbo].[Payments] ([ID], [date], [salary], [bonus], [sum], [empl_name], [year], [month], [count]) VALUES (14, CAST(N'2018-04-19T23:56:20.253' AS DateTime), 25000.2500, 7812.5780, 32812.8280, 1, 2018, 1, 5)
INSERT [dbo].[Payments] ([ID], [date], [salary], [bonus], [sum], [empl_name], [year], [month], [count]) VALUES (15, CAST(N'2018-05-08T09:31:19.887' AS DateTime), 10000.0000, 0.0000, 10000.0000, 7, 2018, 5, 0)
INSERT [dbo].[Payments] ([ID], [date], [salary], [bonus], [sum], [empl_name], [year], [month], [count]) VALUES (19, CAST(N'2018-05-10T09:47:55.297' AS DateTime), 10000.0000, 0.0000, 10000.0000, 7, 2018, 6, 0)
SET IDENTITY_INSERT [dbo].[Payments] OFF
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([ID], [position]) VALUES (1, N'Менеджер                                                    ')
INSERT [dbo].[Positions] ([ID], [position]) VALUES (2, N'Технолог производства                                       ')
INSERT [dbo].[Positions] ([ID], [position]) VALUES (3, N'Торговый агент                                              ')
INSERT [dbo].[Positions] ([ID], [position]) VALUES (4, N'Рабочий                                                     ')
INSERT [dbo].[Positions] ([ID], [position]) VALUES (5, N'Директор                                                    ')
SET IDENTITY_INSERT [dbo].[Positions] OFF
INSERT [dbo].[Procents] ([ID], [procent], [proc_type]) VALUES (1, CAST(30.00 AS Decimal(4, 2)), N'Процент с продаж                                  ')
INSERT [dbo].[Procents] ([ID], [procent], [proc_type]) VALUES (2, CAST(6.25 AS Decimal(4, 2)), N'Процент на оклад сотруднику                       ')
INSERT [dbo].[Procents] ([ID], [procent], [proc_type]) VALUES (3, CAST(0.50 AS Decimal(4, 2)), N'Пеня                                              ')
INSERT [dbo].[Procents] ([ID], [procent], [proc_type]) VALUES (4, CAST(12.00 AS Decimal(4, 2)), N'Процент по кредиту                                ')
SET IDENTITY_INSERT [dbo].[ProductsSales] ON 

INSERT [dbo].[ProductsSales] ([ID], [product_nameID], [quantity], [date], [emloyeeID], [prod_sum], [sale_percent]) VALUES (1, 1, 10, CAST(N'2018-05-23T15:06:40.817' AS DateTime), 1, 1950.0000, 450.0000)
INSERT [dbo].[ProductsSales] ([ID], [product_nameID], [quantity], [date], [emloyeeID], [prod_sum], [sale_percent]) VALUES (2, 2, 5, CAST(N'2018-05-23T15:06:51.947' AS DateTime), 2, 1300.0000, 300.0000)
INSERT [dbo].[ProductsSales] ([ID], [product_nameID], [quantity], [date], [emloyeeID], [prod_sum], [sale_percent]) VALUES (3, 3, 10, CAST(N'2018-05-23T15:06:58.493' AS DateTime), 3, 5200.0000, 1200.0000)
INSERT [dbo].[ProductsSales] ([ID], [product_nameID], [quantity], [date], [emloyeeID], [prod_sum], [sale_percent]) VALUES (7, 1, 10, CAST(N'2018-05-23T15:45:24.667' AS DateTime), 1, 1950.0000, 450.0000)
INSERT [dbo].[ProductsSales] ([ID], [product_nameID], [quantity], [date], [emloyeeID], [prod_sum], [sale_percent]) VALUES (10, 1, 100, CAST(N'2018-05-25T11:08:27.000' AS DateTime), 1, 75943.7000, 17525.4000)
SET IDENTITY_INSERT [dbo].[ProductsSales] OFF
SET IDENTITY_INSERT [dbo].[RawMaterials] ON 

INSERT [dbo].[RawMaterials] ([ID], [raw_name], [unitID], [sum], [quantity]) VALUES (3, N'Ткань 1                            ', 1, 8000.0000, CAST(10.000 AS Decimal(12, 3)))
INSERT [dbo].[RawMaterials] ([ID], [raw_name], [unitID], [sum], [quantity]) VALUES (4, N'Ткань 2                            ', 1, 29520.0000, CAST(32.800 AS Decimal(12, 3)))
INSERT [dbo].[RawMaterials] ([ID], [raw_name], [unitID], [sum], [quantity]) VALUES (5, N'Ткань 3                            ', 1, 11300.0000, CAST(11.300 AS Decimal(12, 3)))
SET IDENTITY_INSERT [dbo].[RawMaterials] OFF
SET IDENTITY_INSERT [dbo].[RawMatPurchases] ON 

INSERT [dbo].[RawMatPurchases] ([ID], [raw_nameID], [quantity], [sum], [date], [employee_nameID]) VALUES (1, 3, CAST(10.000 AS Decimal(12, 3)), 8000.0000, CAST(N'2018-05-22T22:37:48.810' AS DateTime), 1)
INSERT [dbo].[RawMatPurchases] ([ID], [raw_nameID], [quantity], [sum], [date], [employee_nameID]) VALUES (2, 4, CAST(10.000 AS Decimal(12, 3)), 9000.0000, CAST(N'2018-05-23T10:54:28.013' AS DateTime), 2)
INSERT [dbo].[RawMatPurchases] ([ID], [raw_nameID], [quantity], [sum], [date], [employee_nameID]) VALUES (3, 5, CAST(10.000 AS Decimal(12, 3)), 10000.0000, CAST(N'2018-05-22T22:38:11.817' AS DateTime), 3)
INSERT [dbo].[RawMatPurchases] ([ID], [raw_nameID], [quantity], [sum], [date], [employee_nameID]) VALUES (6, 3, CAST(100.000 AS Decimal(12, 3)), 80000.0000, CAST(N'2018-05-25T08:49:33.057' AS DateTime), 1)
INSERT [dbo].[RawMatPurchases] ([ID], [raw_nameID], [quantity], [sum], [date], [employee_nameID]) VALUES (7, 4, CAST(100.000 AS Decimal(12, 3)), 90000.0000, CAST(N'2018-05-25T08:49:44.597' AS DateTime), 2)
INSERT [dbo].[RawMatPurchases] ([ID], [raw_nameID], [quantity], [sum], [date], [employee_nameID]) VALUES (8, 5, CAST(100.000 AS Decimal(12, 3)), 100000.0000, CAST(N'2018-05-25T08:49:59.827' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[RawMatPurchases] OFF
SET IDENTITY_INSERT [dbo].[Units] ON 

INSERT [dbo].[Units] ([ID], [unit_name]) VALUES (1, N'кв.м.     ')
INSERT [dbo].[Units] ([ID], [unit_name]) VALUES (2, N'шт.       ')
SET IDENTITY_INSERT [dbo].[Units] OFF
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Positions] FOREIGN KEY([positionID])
REFERENCES [dbo].[Positions] ([ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Positions]
GO
ALTER TABLE [dbo].[FinishedProducts]  WITH CHECK ADD  CONSTRAINT [FK_FinishedProducts_Units] FOREIGN KEY([unitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[FinishedProducts] CHECK CONSTRAINT [FK_FinishedProducts_Units]
GO
ALTER TABLE [dbo].[Ingredients]  WITH CHECK ADD  CONSTRAINT [FK_Ingredients_FinishedProducts] FOREIGN KEY([product_name])
REFERENCES [dbo].[FinishedProducts] ([ID])
GO
ALTER TABLE [dbo].[Ingredients] CHECK CONSTRAINT [FK_Ingredients_FinishedProducts]
GO
ALTER TABLE [dbo].[Ingredients]  WITH CHECK ADD  CONSTRAINT [FK_Ingredients_RawMaterials1] FOREIGN KEY([raw_name])
REFERENCES [dbo].[RawMaterials] ([ID])
GO
ALTER TABLE [dbo].[Ingredients] CHECK CONSTRAINT [FK_Ingredients_RawMaterials1]
GO
ALTER TABLE [dbo].[LoansRepayments]  WITH CHECK ADD  CONSTRAINT [FK_LoansRepayments_Loans] FOREIGN KEY([loan_ID])
REFERENCES [dbo].[Loans] ([ID])
GO
ALTER TABLE [dbo].[LoansRepayments] CHECK CONSTRAINT [FK_LoansRepayments_Loans]
GO
ALTER TABLE [dbo].[ManufactureHistory]  WITH CHECK ADD  CONSTRAINT [FK_ManufactureHistory_RawMaterials] FOREIGN KEY([rawMat])
REFERENCES [dbo].[RawMaterials] ([ID])
GO
ALTER TABLE [dbo].[ManufactureHistory] CHECK CONSTRAINT [FK_ManufactureHistory_RawMaterials]
GO
ALTER TABLE [dbo].[Manufactures]  WITH CHECK ADD  CONSTRAINT [FK_Manufacture_FinishedProducts] FOREIGN KEY([product_nameID])
REFERENCES [dbo].[FinishedProducts] ([ID])
GO
ALTER TABLE [dbo].[Manufactures] CHECK CONSTRAINT [FK_Manufacture_FinishedProducts]
GO
ALTER TABLE [dbo].[Manufactures]  WITH CHECK ADD  CONSTRAINT [FK_Manufactures_Employees] FOREIGN KEY([employeeID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Manufactures] CHECK CONSTRAINT [FK_Manufactures_Employees]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Employees] FOREIGN KEY([empl_name])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Employees]
GO
ALTER TABLE [dbo].[ProductsSales]  WITH CHECK ADD  CONSTRAINT [FK_ProductsSale_Employees] FOREIGN KEY([emloyeeID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[ProductsSales] CHECK CONSTRAINT [FK_ProductsSale_Employees]
GO
ALTER TABLE [dbo].[ProductsSales]  WITH CHECK ADD  CONSTRAINT [FK_ProductsSale_FinishedProducts] FOREIGN KEY([product_nameID])
REFERENCES [dbo].[FinishedProducts] ([ID])
GO
ALTER TABLE [dbo].[ProductsSales] CHECK CONSTRAINT [FK_ProductsSale_FinishedProducts]
GO
ALTER TABLE [dbo].[RawMaterials]  WITH CHECK ADD  CONSTRAINT [FK_RawMaterials_Units1] FOREIGN KEY([unitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[RawMaterials] CHECK CONSTRAINT [FK_RawMaterials_Units1]
GO
ALTER TABLE [dbo].[RawMatPurchases]  WITH CHECK ADD  CONSTRAINT [FK_RawMatPurchase_Employees] FOREIGN KEY([employee_nameID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[RawMatPurchases] CHECK CONSTRAINT [FK_RawMatPurchase_Employees]
GO
ALTER TABLE [dbo].[RawMatPurchases]  WITH CHECK ADD  CONSTRAINT [FK_RawMatPurchase_RawMaterials1] FOREIGN KEY([raw_nameID])
REFERENCES [dbo].[RawMaterials] ([ID])
GO
ALTER TABLE [dbo].[RawMatPurchases] CHECK CONSTRAINT [FK_RawMatPurchase_RawMaterials1]
GO
/****** Object:  StoredProcedure [dbo].[FinProdProc]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FinProdProc] 
	@prod_ID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT        dbo.FinishedProducts.ID, dbo.FinishedProducts.product_name AS Продукт, dbo.FinishedProducts.sum AS Стоимость, dbo.FinishedProducts.quantity AS Количество, dbo.RawMaterials.ID AS [ID сырья], 
                         dbo.RawMaterials.raw_name AS Сырьё, dbo.Ingredients.quantity AS [Необх кол-во сырья], dbo.RawMaterials.quantity AS [Всего сырья], dbo.Units.unit_name AS Ед_изм, dbo.Budget.budget_sum AS Бюджет
FROM            dbo.FinishedProducts INNER JOIN
                         dbo.Ingredients ON dbo.FinishedProducts.ID = dbo.Ingredients.product_name AND dbo.FinishedProducts.ID = dbo.Ingredients.product_name INNER JOIN
                         dbo.RawMaterials ON dbo.Ingredients.raw_name = dbo.RawMaterials.ID INNER JOIN
                         dbo.Units ON dbo.RawMaterials.unitID = dbo.Units.ID CROSS JOIN
                         dbo.Budget
Where dbo.FinishedProducts.ID = @prod_ID

END
GO
/****** Object:  StoredProcedure [dbo].[GetProductIngredients]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProductIngredients] @product_id as int

AS
BEGIN
	
	SELECT        Ingredients.ID, FinishedProducts.product_name, RawMaterials.raw_name, Ingredients.quantity
	FROM            FinishedProducts INNER JOIN
							 Ingredients ON FinishedProducts.ID = Ingredients.product_name INNER JOIN
							 RawMaterials ON Ingredients.raw_name = RawMaterials.ID
	WHERE FinishedProducts.ID = @product_id

END
GO
/****** Object:  StoredProcedure [dbo].[LoanRepayment]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aleksandr S.>
-- Create date: <24.02.2018>
/** Description:
	Кредит выдается на определённый срок (неск. лет) под определённый процент, 
	кредит выплачивается раз в месяц (30 дней)
	если кредит не был выплачен вовремя,
	то к сумме просроченного платежа (основн. сумма + процент) прибавляется пеня (за кол-во просроченных дней)
*/
-- =============================================
CREATE PROCEDURE [dbo].[LoanRepayment] 
			@loan_id as int, @repayment_date as date, @statement nvarchar(100) output
AS
BEGIN	
	DECLARE @loan_sum			as money		--сумма займа(кредита)
		   ,@loan_percent		as dec(4,2)		--процент по займу
		   ,@fine_percent		as dec(4,2)		--пеня в процентах
		   ,@loan_duration		as int		    --длительность займа
		   ,@loan_date			as datetime		--дата займа

		   ,@rep_percent_sum	as money		--сумма по проценту, общая
		   ,@month_perc_sum		as money		--сумма по проценту, в месяц
		   ,@repayment_sum		as money		--выплачиваемая сумма, в месяц
		   ,@fine_sum			as money		--пеня, накопленная за несвоевременные выплаты

		   ,@last_rep_date		as date			--предыдущая дата выплаты
		   ,@residue			as money		--остаток (осталось выплатить)
		   ,@expired_days		as int			--просроченные дни

		   ,@rep_quntity		as int			--количество выплат
		   ,@rep_days_counter	as tinyint		--счетчик выплат за текущий день

	/**
	--SET @last_rep_date = (SELECT TOP(1) [date] FROM LoansRepayments WHERE loan_ID = 1 ORDER BY [date] DESC)
	--SET @expired_days = DATEDIFF(dd, N'2018-03-01', N'2018-03-25')
	--PRINT 'Разница в днях: {' + CAST(@expired_days As nvarchar) + '}'

	--SET @residue = (SELECT TOP(1) residue FROM LoansRepayments WHERE ID = 2 ORDER BY [date] DESC)
	--PRINT 'Остаток равен: {' + CAST(@residue As nvarchar) + '}'

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	*/

	SET NOCOUNT ON;

	SET @loan_sum		 = (SELECT Loans.[sum]		FROM Loans WHERE ID = @loan_id)
	SET @loan_percent	 = (SELECT Loans.l_percent  FROM Loans WHERE ID = @loan_id)
	SET @loan_duration	 = (SELECT Loans.duration	FROM Loans WHERE ID = @loan_id)
	SET @loan_date		 = (SELECT Loans.[date]		FROM Loans WHERE ID = @loan_id)
	SET @fine_percent	 = (SELECT Loans.fine_perc	FROM Loans WHERE ID = @loan_id)

	--SET @residue = ( SELECT residue FROM LoansRepayments WHERE loan_ID = 1 and [date] = (SELECT MAX([date]) FROM LoansRepayments) )
	--SET @residue = (SELECT TOP(1) residue FROM LoansRepayments WHERE loan_ID = @loan_id ORDER BY [date] DESC)

	SET @month_perc_sum = (@loan_sum / (@loan_duration * 12)) * (@loan_percent / 100)
	SET @repayment_sum = @month_perc_sum + (@loan_sum / (@loan_duration * 12))

	SET @rep_quntity = (SELECT COUNT(ID) FROM LoansRepayments WHERE loan_ID = @loan_id)
	
	--Если не существует ни одной выплаты
	IF not exists(SELECT ID FROM LoansRepayments WHERE loan_ID = @loan_id)
		BEGIN

			SET @expired_days  = DATEDIFF(dd, @loan_date, @repayment_date)
			SET @rep_percent_sum = (@loan_sum * @loan_percent / (@loan_duration * 12) / 100)

			SET @residue = (@loan_sum + @rep_percent_sum) - @repayment_sum
			--SET @repayment_sum += @rep_percent_sum	--плюсуем проценты к сумме выплаты

		END
	--Если существует хоть одна выплата
	ELSE IF exists(SELECT ID FROM LoansRepayments WHERE loan_ID = @loan_id)
		BEGIN
		
			SET @residue = (SELECT TOP(1) residue FROM LoansRepayments WHERE loan_ID = @loan_id ORDER BY [date] DESC)
			SET @rep_percent_sum = (@residue / (@loan_duration * 12)) * (@loan_percent / 100)

			SET @residue -= @repayment_sum	--вычитаем выплачиваемую сумму из остатка
			--SET @repayment_sum += @rep_percent_sum	--плюсуем проценты к сумме выплаты

			SET @last_rep_date = (SELECT TOP(1) [date] FROM LoansRepayments WHERE loan_ID = @loan_id ORDER BY [date] DESC)
			SET @expired_days  = DATEDIFF(dd, @last_rep_date, @repayment_date)

		END	
		
	/*если прошло больше 30ти дней с момента предыдущей оплаты, тогда начисляем пеню*/
	IF (@expired_days > 30)
		BEGIN

			SET @fine_sum = (@repayment_sum * @fine_percent / 100) * (@expired_days - 30)
			SET @repayment_sum += @fine_sum --плюсуем пеню к сумме выплаты

		END
	--PRINT 'Разница в днях: {' + CAST(@expired_days As nvarchar) + '}'

	--
	SET @rep_days_counter = (SELECT COUNT(ID) FROM LoansRepayments WHERE (YEAR	(@repayment_date) = YEAR([date]) and MONTH	(@repayment_date) = MONTH([date])))

	IF(@rep_days_counter > 0) BEGIN
		SET @statement = 'За указанный месяц выплата уже была произведена'
		PRINT 'За текущий день выплата уже была произведена'
		RETURN 3
	END

	/*Проверяем бюджет*/
	IF  ( (SELECT dbo.Budget.budget_sum FROM Budget) <= @repayment_sum ) BEGIN

		--ROLLBACK TRANSACTION	
		SET @statement = 'Недостаточно средств в бюджете для погашения займа'
		PRINT 'Недостаточно средств в бюджете для погашения займа'
		RETURN 1

	END
	/*Проверять по сумме выплаты*/
	ELSE IF (@rep_quntity = (@loan_duration * 12))/*Проверка на кол-во оставшихся выплат, если их нет то опрецию не проводить*/ BEGIN
	
		--ROLLBACK TRANSACTION	
		SET @statement = 'Данный займ погашен'
		PRINT 'Данный займ погашен'
		RETURN 2
			
	END
	ELSE BEGIN

		UPDATE Budget SET budget_sum -= @repayment_sum

		INSERT INTO [dbo].[LoansRepayments]
			   ([loan_ID]
			   ,[rep_sum]
			   ,[proc_sum]
			   ,[fine_sum]
			   ,[date]
			   ,[residue])
		VALUES
			   (@loan_id
			   ,@repayment_sum
			   ,@rep_percent_sum
			   ,@fine_sum
			   ,@repayment_date
			   ,@residue)
	 END

	 SET @statement = 'Выплата за текущий месяц успешна!'
	 RETURN 0

END
GO
/****** Object:  StoredProcedure [dbo].[LoanSet]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>

/** Description:

	Кредит выдается на определенный срок (неск. лет) под определнный процент, 
	кредит выплачивается раз в месяц, 1го числа
	если кредит не был выплачен вовремя,
	то к сумме просроченного платежа (основн. сумма + процент) прибавляется пеня (за кол-во просроченных дней)
	
	пеня начисляется так, если срок выплаты прошёл за каждый день к сумме выплаты прибавляется пеня

*/
-- =============================================

CREATE PROCEDURE [dbo].[LoanSet] 	
	 @loan_sum money
	,@duration int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	SET NOCOUNT ON;

	DECLARE  @loan_percent decimal(4,2) --процент по кредиту
			,@fine_percent decimal(4,2) --процент пени

	--проверить существование невыплаченного кредита   
	--проверить нач. и конечн. даты
	--Если невыпл. кр. нет, то добавить сумму к бюджету
	SET @fine_percent = (SELECT Procents.procent FROM Procents WHERE ID = 3) --пеня
	SET @loan_percent = (SELECT Procents.procent FROM Procents WHERE ID = 4) --процент по кредиту

	UPDATE Budget SET budget_sum += @loan_sum

	INSERT INTO [dbo].[Loans]
           ([sum]
           ,[l_percent]
           ,[fine_perc]
           ,[duration]
		   ,[date])
     VALUES
           (@loan_sum
		   ,@loan_percent
		   ,@fine_percent
		   ,@duration
		   ,SYSDATETIME())

END
GO
/****** Object:  StoredProcedure [dbo].[SalaryPayment]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	
--<написать процедуру, вычитающую зарплату из бюджета с учетом
--процента с каждой проданной еденицы товара за определнный месяц)>
--
--ограничить выплату зарпалаты учитывая текущий месяц и наличие записи о выплате в таблице БД
-- =============================================

CREATE PROCEDURE [dbo].[SalaryPayment] 

	@empl_id int, @month int, @year int, @statement nvarchar(100) output

AS
BEGIN

	SET NOCOUNT ON;

	DECLARE	  @operation nchar(60)
			, @payment_sum money
			, @empl_name nchar(60)
			, @percent money
			, @bonus int
			, @budget money
			, @salary money
			, @bonus_only_sum money

	SET		@budget			= (SELECT budget_sum FROM Budget)
	SET		@salary			= (SELECT salary FROM Employees WHERE (ID = @empl_id))

	SET		@percent		= (SELECT procent FROM Procents WHERE ID = 2)

	SET		@bonus			= null
	SET		@bonus			= (SELECT COUNT(ID) FROM ProductsSales WHERE emloyeeID = @empl_id and Month([date]) >= @month and Year([date]) <= @year)
	SET		@bonus			+= (SELECT COUNT(ID) FROM Manufactures WHERE employeeID = @empl_id and Month([date]) >= @month and Year([date]) <= @year)
	SET		@bonus			+= (SELECT COUNT(ID) FROM RawMatPurchases WHERE employee_nameID = @empl_id and Month([date]) >= @month and Year([date]) <= @year)
	
	SET		@payment_sum	= (@bonus * (@salary * @percent / 100)) + @salary
	SET		@empl_name		= (SELECT employee_name FROM Employees WHERE (ID = @empl_id))

	--Для вывода в таблицу только бонусной суммы, без учета основной зп
	SET @bonus_only_sum		= @bonus * (@salary * @percent / 100)


	--(SELECT COUNT(ID) FROM Payments WHERE empl_name = 8 and [month] = 2 and [year] = 2018)

	--print @bonus 
	--print @payment_sum
	--select * from Manufacture where [date] >= N'20180101' and [date] <= N'20180220'

	--Если есть выплата за уже выплаченный месяц и год(запись в табл.) то повторную выплату запретить 
	IF ( (SELECT COUNT(ID) FROM Payments WHERE empl_name = @empl_id and [month] = @month and [year] = @year) > 0 )
	BEGIN
		SET @statement = 'Зарплата, данному сотруднику за указанный период, уже была выплачена'
		PRINT 'Зарплата, данному сотруднику за указанный период, уже была выплачена'
		RETURN 1		
	END
	ELSE BEGIN
		IF (@budget >= @payment_sum)

			BEGIN

			UPDATE Budget SET budget_sum -= @payment_sum 

			INSERT INTO [dbo].[Payments]
					   ( [date]
						,[salary]
						,[bonus]
						,[sum]
						,[empl_name]
						,[year]
						,[month]
						,[count] )
			VALUES
					(SYSDATETIME(), @salary, @bonus_only_sum, @payment_sum, @empl_id, @year, @month, @bonus)

			SET @statement = 'Выплата успешна!'

			END

		ELSE BEGIN
			SET @statement = 'В бюджете недостаточно средств'
			PRINT 'В бюджете недостаточно средств'
			RETURN 2
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ProdManuf]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ProdManuf] 
@prod_ID as integer, @quantity as integer

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Manufactures(product_nameID, quantity, [date]) 
		Values (@prod_ID, @quantity, SYSDATETIME())  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ProdSale]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ProdSale] 
	-- Add the parameters for the stored procedure here
@prod_id as integer, @quantity as integer 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO ProductsSales(product_nameID, quantity) 
	VALUES (@prod_id, @quantity)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_RawMatPurch]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Alexandr S.>
-- Create date: <19.02.2018>
-- Description:	<Процедура закупа сырья>
-- =============================================
CREATE PROCEDURE [dbo].[SP_RawMatPurch] 

	  @mat_id integer					--ид материала
	, @quantity decimal(12, 3)			--количество закупаемого материала
	, @p_sum decimal(12, 3)				--стоимость закупаемого материала (вычитается из бюджета)

AS

BEGIN

SET NOCOUNT ON;

	---отключить триггер для RawMatPurchase
	DISABLE TRIGGER RawMaterials_Purchase ON RawMatPurchase

	declare @b_sum as decimal(12, 3)	--текущая сумма бюджета

	set @b_sum = (select budget_sum from Budget)

	if (@b_sum >= @p_sum)

	begin	

	UPDATE Budget set budget_sum = @b_sum - @p_sum
	UPDATE RawMaterials set [sum] = [sum] + @p_sum where (ID = @mat_id)
	UPDATE RawMaterials set quantity = quantity + @quantity where (ID = @mat_id)

	---!!!---
	---!!!---изменить параметр внесения нулевого значения поля employee_name в RawMatPurch
	---!!!---

	INSERT INTO RawMatPurchase (raw_name, quantity, [sum], [date]) 
		Values (@mat_id, @quantity, @p_sum, SYSDATETIME())  

	--включить триггер для RawMatPurchase
	Alter table RawMatPurchase ENABLE TRIGGER RawMaterials_Purchase

	end	

	else

	rollback transaction
	print '"В бюджете недостаточно средств"'

END

GO
/****** Object:  Trigger [dbo].[M_Delete]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE trigger [dbo].[M_Delete] on [dbo].[Manufactures]
for delete
AS 
BEGIN

		declare
		@lastProductionID as int, --ID производства для ведения истории
		@rawIDInHistory as int, --ID сырья в таблице истории
		@rawQuantInHistory as decimal(12, 3), --Количество сырья в таблице истории
		@rawSumInHistory as money, --Сумма сырья в таблице истории
		@productionSumTotal as money, --Всего на сумму
		@flag as tinyint,
		@productQuantTotal as int, --Всего количество
		@productID as int, --ID продукции
		@adecvate_prod_sum as money

	set @lastProductionID = (select ID from deleted) 
	set @productionSumTotal = (select man_sum from deleted)
	set @productQuantTotal = (select Quantity from deleted)
	set @productID = (select product_nameID from deleted)

	set @adecvate_prod_sum = (select SUM(rawSum) from ManufactureHistory where prodID = @lastProductionID) 

DECLARE curs CURSOR FOR
	SELECT rawMat, rawQuantity, rawSum FROM ManufactureHistory WHERE prodID = @lastProductionID
	OPEN curs 
	WHILE @@FETCH_STATUS = 0
	BEGIN

	FETCH NEXT FROM curs INTO @rawIDInHistory, @rawQuantInHistory, @rawSumInHistory
		
		BEGIN
			
		set @flag = 1

		Update RawMaterials set quantity += @rawQuantInHistory where ID = @rawIDInHistory
		Update RawMaterials set [sum] += @rawSumInHistory where ID = @rawIDInHistory

		END
	END

	if @flag = 1
	begin

	Update [Finishedproducts] set [sum] -= @adecvate_prod_sum where ID = @productID
	Update [Finishedproducts] set quantity = quantity - @productQuantTotal where ID = @productID

	DELETE FROM ManufactureHistory where prodID = @lastProductionID
	
	end

	CLOSE curs;
	DEALLOCATE curs;

	--включаем триггер
	ENABLE TRIGGER M_Update ON [dbo].[Manufactures];

end
GO
ALTER TABLE [dbo].[Manufactures] ENABLE TRIGGER [M_Delete]
GO
/****** Object:  Trigger [dbo].[M_Update]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE trigger [dbo].[M_Update] on [dbo].[Manufactures] 
for update
as
BEGIN

declare @manuf_quantity as decimal(12, 3),			--объем сырья, необх-го для произв-ва
		@raw_quantity as decimal(12, 3),			--объем сырья на складе
		@prod_id as integer,						--ид производимой продукции
		@rawMat_sum_per_unit as money,				--сумма за ед. материала
		@sum_per_unit_prod as money,				--сумма за ед. продукта
		@sum_for_all_prod as money,					--сумма за весь товар
		@finally_sum as money,						--Итоговая сумма производства
		@prod_quantity as decimal(12, 3),			--Количество произведенной продукции
		@rawSumAtLeast as money,					--Всего сырья на складе на сумму
		@rawSumAveragePrice as money,				--Средняя стоимость сырья
		@flag as tinyint,
		@lastProductionID as int,					--ID производства для ведения истории
		@rawQuantForHistory as decimal(12, 3),		--Количество сырья для ведения истории
		@rawSumForHistory as decimal(12, 3),		--Сумма сырья для ведения истории
		@productionSumTotal as decimal(12, 3),		--Общая сумма производства
		@newQuantity as int							--Новое количество

SET @prod_id = (SELECT product_nameID FROM deleted)
set @prod_quantity = (select quantity from deleted)
set @lastProductionID = (select ID from deleted) 
set @newQuantity = (select quantity from inserted)

	--SET NOCOUNT ON;

declare @ingr_p_name as int,
		@ingr_r_name as int,
		@ingr_quantity as decimal(12, 3)

	DECLARE curu CURSOR FOR
	SELECT raw_name, quantity FROM Ingredients WHERE product_name = @prod_id
	OPEN curu 
	WHILE @@FETCH_STATUS = 0
	BEGIN

		set @ingr_quantity = 0
		set @raw_quantity = 0
		set @rawSumAtLeast = 0
		set @rawSumAveragePrice = 0
		set @flag = 0

	FETCH NEXT FROM curu INTO @ingr_r_name, @ingr_quantity

		SET @raw_quantity = (SELECT quantity FROM RawMaterials WHERE ID = @ingr_r_name) --количество сырья

		IF ( (@ingr_quantity * @newQuantity) <= @raw_quantity ) --если к-во_сырья_необх-го_для_произв-ва_продукта <= количество доступного сырья		
		BEGIN
			
		set @flag = 1

		/*Расчет суммы готового продукта*/
		set @raw_quantity = (select quantity from RawMaterials where ID = @ingr_r_name)	--количество сырья в данный момент
		set @rawSumAtLeast = (select [sum] from RawMaterials where ID = @ingr_r_name)	--сумма за сырьё в данный момент
		set @rawSumAveragePrice = @rawSumAtLeast / @raw_quantity						--сумма за ед. сырья
		set @finally_sum += @rawSumAveragePrice
		/*---------------------------------*/

		set @rawQuantForHistory = @ingr_quantity * @newQuantity
		set @rawSumForHistory = @rawSumAveragePrice * @ingr_quantity * @newQuantity

		/*Обновление количества сырья и его стоимости*/		
		if (@newQuantity > @prod_quantity)	--Если новое количество больше прежнего					
		Update RawMaterials set quantity -= @ingr_quantity * (@newQuantity - @prod_quantity) where ID = @ingr_r_name
		if (@newQuantity < @prod_quantity)	--Если новое количество меньше прежнего
		Update RawMaterials set quantity += @ingr_quantity * (@prod_quantity - @newQuantity) where ID = @ingr_r_name

		if (@newQuantity > @prod_quantity)	--Если новое количество больше прежнего	
		Update RawMaterials set [sum] = @rawSumAtLeast - @rawSumAveragePrice * @ingr_quantity * (@newQuantity - @prod_quantity) where (ID = @ingr_r_name)
		if (@newQuantity < @prod_quantity)  --Если новое количество меньше прежнего
		Update RawMaterials set [sum] = @rawSumAtLeast + @rawSumAveragePrice * @ingr_quantity * (@prod_quantity - @newQuantity) where (ID = @ingr_r_name)

		if (@newQuantity > @prod_quantity)	--Если новое количество больше прежнего	
		Update [FinishedProducts] set [sum] += (@ingr_quantity * @rawSumAveragePrice * (@newQuantity -  @prod_quantity)) where (ID = @prod_id)
		if (@newQuantity < @prod_quantity)	--Если новое количество меньше прежнего
		Update [FinishedProducts] set [sum] -= (@ingr_quantity * @rawSumAveragePrice * (@prod_quantity -  @newQuantity)) where (ID = @prod_id)
		/*---------------------------------*/

		Update ManufactureHistory set rawMat = @ingr_r_name, rawQuantity = @rawQuantForHistory, RawSum = @rawSumForHistory where prodID = @lastProductionID
		
		if (@newQuantity > @prod_quantity)
		Update Manufactures set [man_sum] += (@ingr_quantity * @rawSumAveragePrice *  (@newQuantity - @prod_quantity)) where ID = @lastProductionID
		if (@newQuantity < @prod_quantity)
		Update Manufactures set [man_sum] += (@ingr_quantity * @rawSumAveragePrice *  (@prod_quantity - @newQuantity)) where ID = @lastProductionID
		END

	END

	CLOSE curu;
	DEALLOCATE curu;
	if (@newQuantity > @prod_quantity)	--Если новое количество больше прежнего
	Update [FinishedProducts] set quantity += (@newQuantity - @prod_quantity) where (ID = @prod_id)
	if (@newQuantity < @prod_quantity)	--Если новое количество меньше прежнего
	Update [FinishedProducts] set quantity -= (@prod_quantity - @newQuantity) where (ID = @prod_id)
END
GO
ALTER TABLE [dbo].[Manufactures] ENABLE TRIGGER [M_Update]
GO
/****** Object:  Trigger [dbo].[ProductManufacture]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<AleksandrS>
-- Create date: <18.11.2017>
-- Description:	<Триггер производство продута>
-- =============================================
/*
	При Производстве Готовой продукции автоматически уменьшается
	склад Сырья и увеличивается склад Готовой продукции согласно таблице «Производство»
	(как и для предыдущего пункта, производится проверка имеющегося объема
	сырья для производства необходимой продукции). Кроме этого стоимость
	сырья должна переходить в себестоимость продукции, что достигается 
	уменьшением в сырье и увеличением суммы в готовой продукции с вычислением средней стоимости сырья 
	и умножением на количество производимой продукции
*/
CREATE TRIGGER [dbo].[ProductManufacture]
   ON [dbo].[Manufactures] FOR INSERT
   --NOT FOR REPLICATION
AS 
BEGIN

declare @manuf_quantity as decimal(12, 3),			--объем сырья, необх-го для произв-ва
		@raw_quantity as decimal(12, 3),			--объем сырья на складе
		@prod_id as integer,						--ид производимой продукции
		@rawMat_sum_per_unit as money,				--сумма за ед. материала
		@sum_per_unit_prod as money,				--сумма за ед. продукта
		@sum_for_all_prod as money,					--сумма за весь товар
		@finally_sum as money,						--Итоговая сумма производства
		@prod_quantity as decimal(12, 3),			--Количество произведенной продукции
		@rawSumAtLeast as money,					--Всего сырья на складе на сумму
		@rawSumAveragePrice as money,				--Средняя стоимость сырья
		@flag as tinyint,
		@lastProductionID as int,					--ID производства для ведения истории
		@rawQuantForHistory as decimal(12, 3),		--Количество сырья для ведения истории
		@rawSumForHistory as money,					--Сумма сырья для ведения истории
		@productionSumTotal as money				--Общая сумма производства

SET @prod_id = (SELECT product_nameID FROM inserted)
set @prod_quantity = (select quantity from inserted)
set @lastProductionID = (select ID from inserted) 

	SET NOCOUNT ON;
	SET CURSOR_CLOSE_ON_COMMIT ON;

declare @ingr_p_name as int,
		@ingr_r_name as int,
		@ingr_quantity as decimal(12, 3)

	DECLARE cur CURSOR FOR
	SELECT raw_name, quantity FROM Ingredients WHERE product_name = @prod_id
	OPEN cur 
	WHILE @@FETCH_STATUS = 0
	BEGIN

		set @ingr_quantity = 0
		set @raw_quantity = 0
		set @rawSumAtLeast = 0
		set @rawSumAveragePrice = 0
		set @flag = 0

	FETCH NEXT FROM cur INTO @ingr_r_name, @ingr_quantity

		SET @raw_quantity = (SELECT quantity FROM RawMaterials WHERE ID = @ingr_r_name) --количество сырья

		IF ( (@ingr_quantity * @prod_quantity) <= @raw_quantity ) --если к-во_сырья_необх-го_для_произв-ва_продукта <= количество доступного сырья
		
		BEGIN
			
		set @flag = 1

		/*Расчет суммы готового продукта*/
		set @raw_quantity = (select quantity from RawMaterials where ID = @ingr_r_name)	--количество сырья в данный момент
		set @rawSumAtLeast = (select [sum] from RawMaterials where ID = @ingr_r_name)	--сумма за сырьё в данный момент
		set @rawSumAveragePrice = @rawSumAtLeast / @raw_quantity						--сумма за ед. сырья
		set @finally_sum += @rawSumAveragePrice
		/*---------------------------------*/

		set @rawQuantForHistory = @ingr_quantity * @prod_quantity
		set @rawSumForHistory = @rawSumAveragePrice * @ingr_quantity * @prod_quantity

		/*Обновление количества сырья и его стоимости*/								
		Update RawMaterials set quantity = @raw_quantity - @ingr_quantity * @prod_quantity where ID = @ingr_r_name
		Update RawMaterials set [sum] = @rawSumAtLeast - @rawSumAveragePrice * @ingr_quantity * @prod_quantity where (ID = @ingr_r_name)
		Update FinishedProducts set [sum] += (@ingr_quantity * @rawSumAveragePrice * @prod_quantity) where (ID = @prod_id)
		/*---------------------------------*/

		Insert into ManufactureHistory(prodID, rawMat, rawQuantity, rawSum) 
		values (@lastProductionID, @ingr_r_name, @rawQuantForHistory, @rawSumForHistory)
		
		Update Manufactures set man_sum += (@ingr_quantity * @rawSumAveragePrice * @prod_quantity) where ID = @lastProductionID

		END

		ELSE
		ROLLBACK TRANSACTION
		PRINT '"Недостаточно сырья"'
	END

	if @flag = 1
	begin

	Update FinishedProducts set quantity += (select quantity from inserted) where (ID = @prod_id)
	
	end

	CLOSE cur;
	DEALLOCATE cur;

END

GO
ALTER TABLE [dbo].[Manufactures] ENABLE TRIGGER [ProductManufacture]
GO
/****** Object:  Trigger [dbo].[ProductSale]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<AleksandrS>
-- Create date: <26.11.2017>
-- Description:	
-- <3.	При реализации продукции проверяется наличие данного объема продукции,
-- если да, то автоматически уменьшается склад продукции, увеличивается бюджет соответственно
-- стоимости реализованной продукции. Аналогично описанному выше алгоритму уменьшается сумма,
-- заложенная в продукцию.>
-- =============================================
CREATE TRIGGER [dbo].[ProductSale] 
   ON  [dbo].[ProductsSales] for insert
AS 
BEGIN
	--SET NOCOUNT ON added to prevent extra result sets from
	--interfering with SELECT statements.
	--SET NOCOUNT ON;

	declare   @cur_ID					as integer		--id требуемого продукта
			, @id						as integer		--id текущей запсиси
			, @available_prod_quantity	as integer		--количество доступного продукта
			, @сurent_prod_quantity		as integer		--количество требуемого продукта
			, @sum_per_unit				as money		--сумма за единицу товара
			, @sum_with_percent			as money		--сумма за ед. с учетом процента
			, @percent					as integer		--наценочный процент 

	set @id = (select id from inserted)
	set @cur_ID = (select product_nameID from inserted) --10.02.2018 - изменил @cur_ID = (select product_name from inserted)
	set @available_prod_quantity = (select quantity from FinishedProducts where ID = @cur_ID)
	set @сurent_prod_quantity = (select quantity from inserted)
	set @percent = (select procent from [Procents] where ID = 1)

	--если доступного продукта больше чем требуемого
	if (@available_prod_quantity >= @сurent_prod_quantity)
		begin

		set @sum_per_unit = ((select [sum] from FinishedProducts where ID = @cur_ID) / (select quantity from FinishedProducts where ID = @cur_ID))
		set @sum_with_percent = (@sum_per_unit / 100 * @percent) + @sum_per_unit

		update ProductsSales set prod_sum = @sum_with_percent * @сurent_prod_quantity where (ID = @id)
		update ProductsSales set sale_percent = ((@sum_per_unit / 100 * @percent) * @сurent_prod_quantity) where (ID = @id)
		update ProductsSales set [date] = SYSDATETIME() where (ID = @id)

		update FinishedProducts set quantity -= @сurent_prod_quantity where (ID = @cur_ID)
		update FinishedProducts set [sum] -= (@sum_per_unit * @сurent_prod_quantity) where (ID = @cur_ID)

		update Budget set budget_sum += @sum_with_percent * @сurent_prod_quantity

		end
	else
		begin

		rollback transaction
		print '"Требуемой продукции недостаточно"'

		end
END
GO
ALTER TABLE [dbo].[ProductsSales] ENABLE TRIGGER [ProductSale]
GO
/****** Object:  Trigger [dbo].[PS_Delete]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[PS_Delete] ON [dbo].[ProductsSales] FOR DELETE
AS 
BEGIN

	Declare @del_sum as money,			--удаляемая сумма
			@del_quantity as integer,	--удаляемое количество
			@sale_percent as integer	--процент с продаж
	SET NOCOUNT ON;

	SET @sale_percent = (SELECT sale_percent FROM deleted)
	SET @del_sum = (SELECT prod_sum FROM deleted)
	SET @del_quantity = (SELECT quantity FROM deleted)

	UPDATE FinishedProducts SET [sum] += (@del_sum - @sale_percent)
	UPDATE FinishedProducts SET quantity += @del_quantity
	UPDATE Budget SET budget_sum -= @del_sum

END
GO
ALTER TABLE [dbo].[ProductsSales] ENABLE TRIGGER [PS_Delete]
GO
/****** Object:  Trigger [dbo].[PS_Update]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[PS_Update] ON [dbo].[ProductsSales] AFTER Update
AS 
begin
declare   @cur_ID	as integer		--id требуемого продукта
	, @id	as integer		--id текущей запсиси
	, @available_prod_quantity	as integer	--количество доступного продукта
	, @сurent_prod_quantity as integer		--количество требуемого продукта
	, @sum_per_unit	as money		--сумма за единицу товара
	, @sum_with_percent	as money		--сумма за ед. с учетом процента
	, @percent		as integer		--наценочный процент 
	, @newQuantity	as integer		--новое количество

	set @id = (select id from inserted)
	set @cur_ID = (select product_nameID from inserted)
	set @available_prod_quantity = (select quantity from [FinishedProducts] where ID = @cur_ID)
	set @сurent_prod_quantity = (select quantity from deleted)
	set @percent = (select [procent] from [Procents] where ID = 1)
	set @newQuantity = (select [Quantity] from inserted)

	--если доступного продукта больше чем требуемого
	if (@available_prod_quantity >= @newQuantity)
		begin

		set @sum_per_unit = ((select [sum] from [FinishedProducts] where ID = @cur_ID) / (select quantity from [FinishedProducts] where ID = @cur_ID))
		set @sum_with_percent = (@sum_per_unit /100 * @percent) + @sum_per_unit

		--Если новое количество больше прежнего
		if (@newQuantity > @сurent_prod_quantity)	
		update [ProductsSales] set [prod_sum] = @sum_with_percent * @newQuantity where (ID = @id)
		
		if (@newQuantity > @сurent_prod_quantity)
		update [FinishedProducts] set quantity -= (@newQuantity - @сurent_prod_quantity) where (ID = @cur_ID)

		if (@newQuantity > @сurent_prod_quantity)
		update [FinishedProducts] set [sum] -= (@sum_per_unit * (@newQuantity - @сurent_prod_quantity)) where (ID = @cur_ID)

		if (@newQuantity > @сurent_prod_quantity)
		update Budget set [Budget_sum] += @sum_with_percent * (@newQuantity - @сurent_prod_quantity)
		
		--Если новое количество меньше прежнего
		if (@сurent_prod_quantity > @newQuantity)
		update [ProductsSales] set [prod_sum] = @sum_with_percent * @newQuantity where (ID = @id)

		if (@сurent_prod_quantity > @newQuantity)
		update [FinishedProducts] set quantity += (@сurent_prod_quantity - @newQuantity) where (ID = @cur_ID)

		if (@сurent_prod_quantity > @newQuantity)
		update [FinishedProducts] set [sum] += (@sum_per_unit * (@сurent_prod_quantity - @newQuantity)) where (ID = @cur_ID)

		if (@сurent_prod_quantity > @newQuantity)
		update Budget set [Budget_sum] -= @sum_with_percent * (@сurent_prod_quantity - @newQuantity)

		end
	else
		begin

		rollback transaction
		print '"Требуемой продукции недостаточно"'

		end
		end

GO
ALTER TABLE [dbo].[ProductsSales] ENABLE TRIGGER [PS_Update]
GO
/****** Object:  Trigger [dbo].[RM_Purchase]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<AleksandrS>
-- Create date: <17.11.2017>
-- Description:	<Триггер на закуп сырья>
-- =============================================
CREATE TRIGGER [dbo].[RM_Purchase]
   ON [dbo].[RawMatPurchases] FOR Insert
   not for replication
AS 
BEGIN

declare @b_sum as money,				--сумма бюджета
		@p_sum as money,				--сумма закупа
		@quantity as decimal(12, 3),	--кол-во сырья
		@cur_ID as integer				--текущий ID

set @b_sum = (select budget_sum from Budget)
set @p_sum = (select [sum] from inserted)
set @quantity = (select quantity from inserted)
set @cur_ID = (select raw_nameID from inserted)

	SET NOCOUNT ON;

	if (@b_sum >= @p_sum)

		begin

		UPDATE Budget set budget_sum = @b_sum - @p_sum
		UPDATE RawMaterials set [sum] = [sum] + @p_sum where (ID = @cur_ID)
		UPDATE RawMaterials set quantity = quantity + @quantity where (ID = @cur_ID)

		UPDATE RawMatPurchases set [date] = SYSDATETIME() where (ID = (select ID from inserted))
		print 'Покупка прошла успешно!'

		end

	else
	rollback transaction
	print '"В бюджете недостаточно средств"'

END
GO
ALTER TABLE [dbo].[RawMatPurchases] ENABLE TRIGGER [RM_Purchase]
GO
/****** Object:  Trigger [dbo].[RM_Update]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[RM_Update] ON [dbo].[RawMatPurchases] FOR UPDATE
AS 
BEGIN
	declare @b_sum as money,				--сумма бюджета
			@p_sum as money,				--сумма закупа
			@quantity as decimal(12, 3),	--кол-во сырья
			@cur_ID as integer,				--текущий ID
			@last_sum as money,				--старая сумма закупа
			@last_quantity as decimal(12, 3) --старое кол-во сырья

	set @b_sum = (select budget_sum from Budget)	
	set @p_sum = (select [sum] from inserted)
	set @quantity = (select quantity from inserted)
	set @cur_ID = (select raw_nameID from inserted)

	set @last_sum = (select [sum] from deleted)
	set @last_quantity = (select quantity from deleted)

	SET NOCOUNT ON;

		if (@b_sum >= @p_sum)

		begin

		UPDATE Budget set budget_sum += (@last_sum - @p_sum)
		UPDATE RawMaterials set [sum] += (@p_sum - @last_sum) where (ID = @cur_ID)
		UPDATE RawMaterials set quantity += (@quantity - @last_quantity) where (ID = @cur_ID)

		UPDATE RawMatPurchases set [date] = SYSDATETIME() where (ID = (select ID from inserted))
		print 'Покупка прошла успешно!'

		end

	else
	rollback transaction
	print '"В бюджете недостаточно средств"'

END
GO
ALTER TABLE [dbo].[RawMatPurchases] ENABLE TRIGGER [RM_Update]
GO
/****** Object:  Trigger [dbo].[RMDelete_Purchase]    Script Date: 30.09.2018 12:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Данный триггер производит откат заупленного сырья, 
-- путем возврата средств в бюджет, количества и стоимости сырья>
-- =============================================
CREATE TRIGGER [dbo].[RMDelete_Purchase] ON [dbo].[RawMatPurchases] FOR DELETE
AS 
BEGIN
	Declare  @del_sum as money					--удаляемая сумма закупа
			,@del_quantity as decimal(12, 3)	--удаляемое кол-во сырья
			,@del_rm_id as int					--ID удаляемого сырья

	SET NOCOUNT ON;
	
	set @del_rm_id = (select raw_nameID from deleted)
	set @del_sum = (select [sum] from deleted)
	set @del_quantity = (select [quantity] from deleted)

	update RawMaterials set quantity -= @del_quantity where (ID = @del_rm_id)
	update RawMaterials set [sum] -= @del_sum where (ID = @del_rm_id)
	update Budget set budget_sum += @del_sum

END
GO
ALTER TABLE [dbo].[RawMatPurchases] ENABLE TRIGGER [RMDelete_Purchase]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employees"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 192
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Positions"
            Begin Extent = 
               Top = 17
               Left = 397
               Bottom = 152
               Right = 571
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 690
         Width = 3270
         Width = 2385
         Width = 1305
         Width = 1425
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FP_Empl_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FP_Empl_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2595
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FP_EmplDataset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FP_EmplDataset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[31] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "FinishedProducts"
            Begin Extent = 
               Top = 19
               Left = 29
               Bottom = 175
               Right = 204
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ingredients"
            Begin Extent = 
               Top = 111
               Left = 286
               Bottom = 243
               Right = 471
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RawMaterials"
            Begin Extent = 
               Top = 194
               Left = 602
               Bottom = 330
               Right = 776
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Units"
            Begin Extent = 
               Top = 254
               Left = 285
               Bottom = 364
               Right = 477
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Budget"
            Begin Extent = 
               Top = 209
               Left = 824
               Bottom = 311
               Right = 1015
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 540
         Width = 1515
         Width = 1275
         Width = 1245
         Width = 990
         Width = 1890
         Width = 1845
         Width = 1200
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin Column' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FP_Ingr_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Widths = 11
         Column = 1440
         Alias = 2085
         Table = 2100
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FP_Ingr_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'FP_Ingr_View'
GO
USE [master]
GO
ALTER DATABASE [KCM_MGMT_DB] SET  READ_WRITE 
GO
