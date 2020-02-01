USE [master]
GO
/****** Object:  Database [TRAVELAGENCY]    Script Date: 12/24/2019 10:23:55 PM ******/
CREATE DATABASE [TRAVELAGENCY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TRAVELAGENCY', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TRAVELAGENCY.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TRAVELAGENCY_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TRAVELAGENCY_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TRAVELAGENCY] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TRAVELAGENCY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TRAVELAGENCY] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET ARITHABORT OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TRAVELAGENCY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TRAVELAGENCY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TRAVELAGENCY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TRAVELAGENCY] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET RECOVERY FULL 
GO
ALTER DATABASE [TRAVELAGENCY] SET  MULTI_USER 
GO
ALTER DATABASE [TRAVELAGENCY] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TRAVELAGENCY] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TRAVELAGENCY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TRAVELAGENCY] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TRAVELAGENCY] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TRAVELAGENCY', N'ON'
GO
ALTER DATABASE [TRAVELAGENCY] SET QUERY_STORE = OFF
GO
USE [TRAVELAGENCY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[outcome_id] [int] NULL,
	[status_id] [int] NULL,
	[travel_agency_id] [int] NULL,
	[date_of_booking] [datetime] NULL,
	[booking_details] [varchar](100) NULL,
 CONSTRAINT [Booking_PK] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [int] NOT NULL,
	[booking_id] [int] NULL,
	[payment_amount] [float] NULL,
	[payment_date] [datetime] NULL,
	[other_details] [varchar](100) NULL,
 CONSTRAINT [Payment_PK] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Revenue_of_Each_Agency]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Revenue_of_Each_Agency] AS
SELECT B.travel_agency_id, SUM(P.payment_amount) AS TotalAmount
FROM Booking AS B
LEFT OUTER JOIN Payment AS P ON P.booking_id = B.booking_id
GROUP BY  B.travel_agency_id;
GO
/****** Object:  View [dbo].[Paid_Payments]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Paid_Payments] AS
SELECT payment_id, other_details, payment_amount, payment_date
FROM Payment
WHERE other_details = 'Paid';
GO
/****** Object:  Table [dbo].[Address]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[address_id] [int] NOT NULL,
	[address_details] [varchar](100) NULL,
 CONSTRAINT [Address_PK] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airlines]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airlines](
	[airline_id] [int] NOT NULL,
	[airline_name] [varchar](100) NULL,
	[airline_ticket_price] [float] NULL,
 CONSTRAINT [Airline_PK] PRIMARY KEY CLUSTERED 
(
	[airline_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking_Log]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking_Log](
	[booking_id] [varchar](8) NOT NULL,
	[performed_action] [varchar](10) NULL,
	[action_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking_Outcome]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking_Outcome](
	[outcome_id] [int] NOT NULL,
	[outcome_status] [varchar](100) NULL,
 CONSTRAINT [Booking_Outcome_PK] PRIMARY KEY CLUSTERED 
(
	[outcome_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking_Status]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking_Status](
	[status_id] [int] NOT NULL,
	[status_description] [varchar](100) NULL,
 CONSTRAINT [Booking_Status_PK] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[car_id] [int] NOT NULL,
	[car_model] [varchar](60) NULL,
	[car_type] [varchar](60) NULL,
	[car_rent_price] [float] NULL,
 CONSTRAINT [Car_PK] PRIMARY KEY CLUSTERED 
(
	[car_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [varchar](20) NULL,
	[customer_surname] [varchar](20) NULL,
	[customer_phone_number] [varchar](20) NULL,
 CONSTRAINT [Customer_PK] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Address]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Address](
	[customer_address_id] [int] NOT NULL,
	[customer_id] [int] NULL,
	[address_id] [int] NULL,
	[date_from] [datetime] NULL,
	[date_to] [datetime] NULL,
 CONSTRAINT [Customer_Address_PK] PRIMARY KEY CLUSTERED 
(
	[customer_address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[hotel_id] [int] NOT NULL,
	[hotel_name] [varchar](60) NULL,
	[hotel_address] [varchar](100) NULL,
	[hotel_price] [float] NULL,
 CONSTRAINT [Hotel_PK] PRIMARY KEY CLUSTERED 
(
	[hotel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Railway]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Railway](
	[railway_id] [int] NOT NULL,
	[railway_name] [varchar](60) NULL,
	[railway_ticket_price] [float] NULL,
 CONSTRAINT [Railway_PK] PRIMARY KEY CLUSTERED 
(
	[railway_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[service_id] [int] NOT NULL,
	[service_details] [varchar](100) NULL,
 CONSTRAINT [Service_PK] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service_Booking]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_Booking](
	[service_id] [int] NOT NULL,
	[booking_id] [int] NOT NULL,
	[booking_start_date] [date] NULL,
	[booking_end_date] [date] NULL,
	[number_of_days]  AS (datediff(day,[booking_start_date],[booking_end_date])),
 CONSTRAINT [Service_Booking_PK] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC,
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Travel_Agency]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Travel_Agency](
	[travel_agency_id] [int] NOT NULL,
	[travel_agency_name] [varchar](50) NOT NULL,
 CONSTRAINT [Travel_Agency_PK] PRIMARY KEY CLUSTERED 
(
	[travel_agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Address] ([address_id], [address_details]) VALUES (41, N'711-2880 Nulla St.Mankato Mississippi 96522')
GO
INSERT [dbo].[Address] ([address_id], [address_details]) VALUES (42, N'935-9940 Tortor. Street Santa Rosa MN 98804')
GO
INSERT [dbo].[Address] ([address_id], [address_details]) VALUES (43, N'5587 Nunc. Avenue Erie Rhode Island 24975')
GO
INSERT [dbo].[Address] ([address_id], [address_details]) VALUES (44, N'P.O. Box 132 1599 Curabitur Rd. Bandera South Dakota 45149')
GO
INSERT [dbo].[Address] ([address_id], [address_details]) VALUES (45, N'347-7666 Iaculis St.Woodruff SC 49854')
GO
INSERT [dbo].[Address] ([address_id], [address_details]) VALUES (46, N'557-6308 Lacinia Road San Bernardino ND 09289')
GO
INSERT [dbo].[Address] ([address_id], [address_details]) VALUES (47, N'5543 Aliquet St.Fort Dodge GA 20783')
GO
INSERT [dbo].[Address] ([address_id], [address_details]) VALUES (48, N'5037 Diam Rd. Daly City Ohio 90255')
GO
INSERT [dbo].[Address] ([address_id], [address_details]) VALUES (49, N'935-1670 Neque. St.Centennial Delaware 48432')
GO
INSERT [dbo].[Address] ([address_id], [address_details]) VALUES (50, N'414-7533 Non Rd. Miami Beach North Dakota 58563')
GO
INSERT [dbo].[Airlines] ([airline_id], [airline_name], [airline_ticket_price]) VALUES (31, N'Turkish Airlines', 45)
GO
INSERT [dbo].[Airlines] ([airline_id], [airline_name], [airline_ticket_price]) VALUES (32, N'Pegasus Airlines', 35)
GO
INSERT [dbo].[Airlines] ([airline_id], [airline_name], [airline_ticket_price]) VALUES (33, N'SunExpress', 40)
GO
INSERT [dbo].[Airlines] ([airline_id], [airline_name], [airline_ticket_price]) VALUES (34, N'Air France', 42)
GO
INSERT [dbo].[Airlines] ([airline_id], [airline_name], [airline_ticket_price]) VALUES (35, N'British Airways', 40)
GO
INSERT [dbo].[Airlines] ([airline_id], [airline_name], [airline_ticket_price]) VALUES (36, N'Lufthansa', 45)
GO
INSERT [dbo].[Airlines] ([airline_id], [airline_name], [airline_ticket_price]) VALUES (37, N'Emirates', 50)
GO
INSERT [dbo].[Airlines] ([airline_id], [airline_name], [airline_ticket_price]) VALUES (38, N'Swiss', 40)
GO
INSERT [dbo].[Airlines] ([airline_id], [airline_name], [airline_ticket_price]) VALUES (39, N'Ryanair', 25)
GO
INSERT [dbo].[Airlines] ([airline_id], [airline_name], [airline_ticket_price]) VALUES (40, N'Delta Airlines', 35)
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 
GO
INSERT [dbo].[Booking] ([booking_id], [customer_id], [outcome_id], [status_id], [travel_agency_id], [date_of_booking], [booking_details]) VALUES (1, 2, 11, 21, 3, CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'Reserved')
GO
INSERT [dbo].[Booking] ([booking_id], [customer_id], [outcome_id], [status_id], [travel_agency_id], [date_of_booking], [booking_details]) VALUES (2, 5, 12, 22, 1, CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'Reserved')
GO
INSERT [dbo].[Booking] ([booking_id], [customer_id], [outcome_id], [status_id], [travel_agency_id], [date_of_booking], [booking_details]) VALUES (3, 1, 13, 23, 4, CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'Reserved')
GO
INSERT [dbo].[Booking] ([booking_id], [customer_id], [outcome_id], [status_id], [travel_agency_id], [date_of_booking], [booking_details]) VALUES (4, 7, 14, 24, 10, CAST(N'2019-10-11T00:00:00.000' AS DateTime), N'Reserved')
GO
INSERT [dbo].[Booking] ([booking_id], [customer_id], [outcome_id], [status_id], [travel_agency_id], [date_of_booking], [booking_details]) VALUES (5, 9, 15, 25, 1, CAST(N'2019-10-12T00:00:00.000' AS DateTime), N'Reserved')
GO
INSERT [dbo].[Booking] ([booking_id], [customer_id], [outcome_id], [status_id], [travel_agency_id], [date_of_booking], [booking_details]) VALUES (6, 3, 16, 26, 5, CAST(N'2019-10-13T00:00:00.000' AS DateTime), N'Reserved')
GO
INSERT [dbo].[Booking] ([booking_id], [customer_id], [outcome_id], [status_id], [travel_agency_id], [date_of_booking], [booking_details]) VALUES (7, 4, 17, 27, 4, CAST(N'2019-10-13T00:00:00.000' AS DateTime), N'Reserved')
GO
INSERT [dbo].[Booking] ([booking_id], [customer_id], [outcome_id], [status_id], [travel_agency_id], [date_of_booking], [booking_details]) VALUES (8, 6, 18, 28, 9, CAST(N'2019-10-17T00:00:00.000' AS DateTime), N'Reserved')
GO
INSERT [dbo].[Booking] ([booking_id], [customer_id], [outcome_id], [status_id], [travel_agency_id], [date_of_booking], [booking_details]) VALUES (9, 10, 19, 29, 2, CAST(N'2019-10-18T00:00:00.000' AS DateTime), N'Reserved')
GO
INSERT [dbo].[Booking] ([booking_id], [customer_id], [outcome_id], [status_id], [travel_agency_id], [date_of_booking], [booking_details]) VALUES (10, 8, 20, 30, 3, CAST(N'2019-10-19T00:00:00.000' AS DateTime), N'Reserved')
GO
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'1', N'Insert', CAST(N'2019-12-15T12:53:04.347' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'2', N'Insert', CAST(N'2019-12-15T12:53:04.347' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'3', N'Insert', CAST(N'2019-12-15T12:53:04.347' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'4', N'Insert', CAST(N'2019-12-15T12:53:04.347' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'5', N'Insert', CAST(N'2019-12-15T12:53:04.347' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'6', N'Insert', CAST(N'2019-12-15T12:53:04.347' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'7', N'Insert', CAST(N'2019-12-15T12:53:04.347' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'8', N'Insert', CAST(N'2019-12-15T12:53:04.347' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'9', N'Insert', CAST(N'2019-12-15T12:53:04.347' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'10', N'Insert', CAST(N'2019-12-15T12:53:04.347' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'25', N'Delete', CAST(N'2019-12-24T22:20:56.743' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'26', N'Delete', CAST(N'2019-12-24T22:20:56.750' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'27', N'Delete', CAST(N'2019-12-24T22:20:56.753' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'28', N'Delete', CAST(N'2019-12-24T22:20:56.760' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'29', N'Delete', CAST(N'2019-12-24T22:20:56.763' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'30', N'Delete', CAST(N'2019-12-24T22:20:56.770' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'31', N'Delete', CAST(N'2019-12-24T22:20:56.773' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'32', N'Delete', CAST(N'2019-12-24T22:20:56.780' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'33', N'Delete', CAST(N'2019-12-24T22:20:56.783' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'34', N'Delete', CAST(N'2019-12-24T22:20:56.790' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'35', N'Delete', CAST(N'2019-12-24T22:20:56.793' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'36', N'Delete', CAST(N'2019-12-24T22:20:56.800' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'37', N'Delete', CAST(N'2019-12-24T22:20:56.803' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'38', N'Delete', CAST(N'2019-12-24T22:20:56.810' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'39', N'Delete', CAST(N'2019-12-24T22:20:56.813' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'40', N'Delete', CAST(N'2019-12-24T22:20:56.817' AS DateTime))
GO
INSERT [dbo].[Booking_Log] ([booking_id], [performed_action], [action_date]) VALUES (N'41', N'Delete', CAST(N'2019-12-24T22:20:56.820' AS DateTime))
GO
INSERT [dbo].[Booking_Outcome] ([outcome_id], [outcome_status]) VALUES (11, N'Canceled')
GO
INSERT [dbo].[Booking_Outcome] ([outcome_id], [outcome_status]) VALUES (12, N'OK')
GO
INSERT [dbo].[Booking_Outcome] ([outcome_id], [outcome_status]) VALUES (13, N'OK')
GO
INSERT [dbo].[Booking_Outcome] ([outcome_id], [outcome_status]) VALUES (14, N'Canceled')
GO
INSERT [dbo].[Booking_Outcome] ([outcome_id], [outcome_status]) VALUES (15, N'OK')
GO
INSERT [dbo].[Booking_Outcome] ([outcome_id], [outcome_status]) VALUES (16, N'OK')
GO
INSERT [dbo].[Booking_Outcome] ([outcome_id], [outcome_status]) VALUES (17, N'Canceled')
GO
INSERT [dbo].[Booking_Outcome] ([outcome_id], [outcome_status]) VALUES (18, N'OK')
GO
INSERT [dbo].[Booking_Outcome] ([outcome_id], [outcome_status]) VALUES (19, N'Canceled')
GO
INSERT [dbo].[Booking_Outcome] ([outcome_id], [outcome_status]) VALUES (20, N'OK')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (21, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (22, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (23, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (24, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (25, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (26, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (27, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (28, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (29, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (30, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (31, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (32, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (33, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (34, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (35, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (36, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (37, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (38, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (39, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (40, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (41, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (42, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (43, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (44, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (45, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (46, N'Accepted')
GO
INSERT [dbo].[Booking_Status] ([status_id], [status_description]) VALUES (47, N'Accepted')
GO
INSERT [dbo].[Car] ([car_id], [car_model], [car_type], [car_rent_price]) VALUES (31, N'Mercedes-Benz', N'Coupe', 55)
GO
INSERT [dbo].[Car] ([car_id], [car_model], [car_type], [car_rent_price]) VALUES (32, N'BMW', N'Sedan', 50)
GO
INSERT [dbo].[Car] ([car_id], [car_model], [car_type], [car_rent_price]) VALUES (33, N'Audi', N'Hatchback', 45)
GO
INSERT [dbo].[Car] ([car_id], [car_model], [car_type], [car_rent_price]) VALUES (34, N'Honda', N'SUV', 36)
GO
INSERT [dbo].[Car] ([car_id], [car_model], [car_type], [car_rent_price]) VALUES (35, N'Jeep', N'SUV', 41)
GO
INSERT [dbo].[Car] ([car_id], [car_model], [car_type], [car_rent_price]) VALUES (36, N'Volkswagen', N'Hatchback', 39)
GO
INSERT [dbo].[Car] ([car_id], [car_model], [car_type], [car_rent_price]) VALUES (37, N'Volvo', N'Crossover', 35)
GO
INSERT [dbo].[Car] ([car_id], [car_model], [car_type], [car_rent_price]) VALUES (38, N'Opel', N'Sedan', 40)
GO
INSERT [dbo].[Car] ([car_id], [car_model], [car_type], [car_rent_price]) VALUES (39, N'Ford', N'Hatchback', 35)
GO
INSERT [dbo].[Car] ([car_id], [car_model], [car_type], [car_rent_price]) VALUES (40, N'Chevrolet', N'Sedan', 42)
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_surname], [customer_phone_number]) VALUES (1, N'Adria', N'Russell', N'5167454496')
GO
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_surname], [customer_phone_number]) VALUES (2, N'Hilda', N'Haynes', N'4569821457')
GO
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_surname], [customer_phone_number]) VALUES (3, N'Rebecca', N'Chambers', N'5353374113')
GO
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_surname], [customer_phone_number]) VALUES (4, N'Edward', N'Nieves', N'4361239678')
GO
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_surname], [customer_phone_number]) VALUES (5, N'Chester', N'Bennett', N'6045698452')
GO
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_surname], [customer_phone_number]) VALUES (6, N'David', N'Mathews', N'7094715687')
GO
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_surname], [customer_phone_number]) VALUES (7, N'Daniel', N'Bernard', N'05074457125')
GO
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_surname], [customer_phone_number]) VALUES (8, N'Lee', N'Preston', N'30371568927')
GO
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_surname], [customer_phone_number]) VALUES (9, N'Cara', N'Whitehead', N'4046514732')
GO
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_surname], [customer_phone_number]) VALUES (10, N'Kim', N'Fletcher', N'5341584263')
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[Customer_Address] ([customer_address_id], [customer_id], [address_id], [date_from], [date_to]) VALUES (51, 1, 41, CAST(N'2019-10-10T00:00:00.000' AS DateTime), CAST(N'2020-04-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer_Address] ([customer_address_id], [customer_id], [address_id], [date_from], [date_to]) VALUES (52, 2, 46, CAST(N'2019-10-10T00:00:00.000' AS DateTime), CAST(N'2020-04-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer_Address] ([customer_address_id], [customer_id], [address_id], [date_from], [date_to]) VALUES (53, 3, 49, CAST(N'2019-10-10T00:00:00.000' AS DateTime), CAST(N'2020-04-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer_Address] ([customer_address_id], [customer_id], [address_id], [date_from], [date_to]) VALUES (54, 4, 45, CAST(N'2019-10-11T00:00:00.000' AS DateTime), CAST(N'2020-04-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer_Address] ([customer_address_id], [customer_id], [address_id], [date_from], [date_to]) VALUES (55, 5, 43, CAST(N'2019-10-12T00:00:00.000' AS DateTime), CAST(N'2020-04-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer_Address] ([customer_address_id], [customer_id], [address_id], [date_from], [date_to]) VALUES (56, 6, 42, CAST(N'2019-10-13T00:00:00.000' AS DateTime), CAST(N'2020-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer_Address] ([customer_address_id], [customer_id], [address_id], [date_from], [date_to]) VALUES (57, 7, 48, CAST(N'2019-10-13T00:00:00.000' AS DateTime), CAST(N'2020-04-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer_Address] ([customer_address_id], [customer_id], [address_id], [date_from], [date_to]) VALUES (58, 8, 44, CAST(N'2019-10-17T00:00:00.000' AS DateTime), CAST(N'2020-04-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer_Address] ([customer_address_id], [customer_id], [address_id], [date_from], [date_to]) VALUES (59, 9, 50, CAST(N'2019-10-18T00:00:00.000' AS DateTime), CAST(N'2020-04-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer_Address] ([customer_address_id], [customer_id], [address_id], [date_from], [date_to]) VALUES (60, 10, 47, CAST(N'2019-10-19T00:00:00.000' AS DateTime), CAST(N'2020-04-19T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Hotel] ([hotel_id], [hotel_name], [hotel_address], [hotel_price]) VALUES (31, N'The Langham', N'282-8351 Tincidunt Ave Sedalia Utah 53700', 100)
GO
INSERT [dbo].[Hotel] ([hotel_id], [hotel_name], [hotel_address], [hotel_price]) VALUES (32, N'Mandarin Oriental', N'343-6527 Purus. Avenue Logan NV 12657', 120)
GO
INSERT [dbo].[Hotel] ([hotel_id], [hotel_name], [hotel_address], [hotel_price]) VALUES (33, N'Grand Hyatt', N'1964 Facilisis Avenue Bell Gardens Texas 87065', 150)
GO
INSERT [dbo].[Hotel] ([hotel_id], [hotel_name], [hotel_address], [hotel_price]) VALUES (34, N'Ace Hotel', N'430-985 Eleifend St. Duluth Washington 92611', 90)
GO
INSERT [dbo].[Hotel] ([hotel_id], [hotel_name], [hotel_address], [hotel_price]) VALUES (35, N'The Harbor Hotel', N'P.O. Box 399 4275 Amet Street West Allis NC 36734', 125)
GO
INSERT [dbo].[Hotel] ([hotel_id], [hotel_name], [hotel_address], [hotel_price]) VALUES (36, N'Grand Hotel', N'3415 Lobortis. Avenue Rocky Mount WA 48580', 200)
GO
INSERT [dbo].[Hotel] ([hotel_id], [hotel_name], [hotel_address], [hotel_price]) VALUES (37, N'The Bristol Hotel', N'7709 Justo. Ave Princeton TX 77987', 85)
GO
INSERT [dbo].[Hotel] ([hotel_id], [hotel_name], [hotel_address], [hotel_price]) VALUES (38, N'Radisson Hotel', N'1293 Tincidunt Street Atwater Pennsylvania 76865', 175)
GO
INSERT [dbo].[Hotel] ([hotel_id], [hotel_name], [hotel_address], [hotel_price]) VALUES (39, N'Wentworth Mansion', N'427-5827 Ac St. Schaumburg Arkansas 84872', 130)
GO
INSERT [dbo].[Hotel] ([hotel_id], [hotel_name], [hotel_address], [hotel_price]) VALUES (40, N'The Lowell', N'6059 Sollicitudin Road Burlingame Colorado 26278', 450)
GO
INSERT [dbo].[Payment] ([payment_id], [booking_id], [payment_amount], [payment_date], [other_details]) VALUES (111, 1, 100, CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'Paid')
GO
INSERT [dbo].[Payment] ([payment_id], [booking_id], [payment_amount], [payment_date], [other_details]) VALUES (222, 2, 275.5, CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'Paid')
GO
INSERT [dbo].[Payment] ([payment_id], [booking_id], [payment_amount], [payment_date], [other_details]) VALUES (333, 3, 150, CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'Paid')
GO
INSERT [dbo].[Payment] ([payment_id], [booking_id], [payment_amount], [payment_date], [other_details]) VALUES (444, 4, 399.9, CAST(N'2019-10-11T00:00:00.000' AS DateTime), N'Paid')
GO
INSERT [dbo].[Payment] ([payment_id], [booking_id], [payment_amount], [payment_date], [other_details]) VALUES (555, 5, 245.5, CAST(N'2019-10-12T00:00:00.000' AS DateTime), N'Paid')
GO
INSERT [dbo].[Payment] ([payment_id], [booking_id], [payment_amount], [payment_date], [other_details]) VALUES (666, 6, 85, CAST(N'2019-10-13T00:00:00.000' AS DateTime), N'Paid')
GO
INSERT [dbo].[Payment] ([payment_id], [booking_id], [payment_amount], [payment_date], [other_details]) VALUES (777, 7, 114.5, CAST(N'2019-10-13T00:00:00.000' AS DateTime), N'Paid')
GO
INSERT [dbo].[Payment] ([payment_id], [booking_id], [payment_amount], [payment_date], [other_details]) VALUES (888, 8, 800, CAST(N'2019-10-17T00:00:00.000' AS DateTime), N'Paid')
GO
INSERT [dbo].[Payment] ([payment_id], [booking_id], [payment_amount], [payment_date], [other_details]) VALUES (999, 9, 565.9, CAST(N'2019-10-18T00:00:00.000' AS DateTime), N'Paid')
GO
INSERT [dbo].[Payment] ([payment_id], [booking_id], [payment_amount], [payment_date], [other_details]) VALUES (1111, 10, 370, CAST(N'2019-10-19T00:00:00.000' AS DateTime), N'Paid')
GO
INSERT [dbo].[Railway] ([railway_id], [railway_name], [railway_ticket_price]) VALUES (31, N'National Rail', 10)
GO
INSERT [dbo].[Railway] ([railway_id], [railway_name], [railway_ticket_price]) VALUES (32, N'EuroStar', 15)
GO
INSERT [dbo].[Railway] ([railway_id], [railway_name], [railway_ticket_price]) VALUES (33, N'British Rail', 12)
GO
INSERT [dbo].[Railway] ([railway_id], [railway_name], [railway_ticket_price]) VALUES (34, N'Network Rail', 14)
GO
INSERT [dbo].[Railway] ([railway_id], [railway_name], [railway_ticket_price]) VALUES (35, N'Alsa', 9)
GO
INSERT [dbo].[Railway] ([railway_id], [railway_name], [railway_ticket_price]) VALUES (36, N'American Express', 17)
GO
INSERT [dbo].[Railway] ([railway_id], [railway_name], [railway_ticket_price]) VALUES (37, N'LNER', 6)
GO
INSERT [dbo].[Railway] ([railway_id], [railway_name], [railway_ticket_price]) VALUES (38, N'Italia Rail', 11)
GO
INSERT [dbo].[Railway] ([railway_id], [railway_name], [railway_ticket_price]) VALUES (39, N'Blue Train', 8)
GO
INSERT [dbo].[Railway] ([railway_id], [railway_name], [railway_ticket_price]) VALUES (40, N'Orient Express', 12)
GO
INSERT [dbo].[Service] ([service_id], [service_details]) VALUES (31, NULL)
GO
INSERT [dbo].[Service] ([service_id], [service_details]) VALUES (32, NULL)
GO
INSERT [dbo].[Service] ([service_id], [service_details]) VALUES (33, NULL)
GO
INSERT [dbo].[Service] ([service_id], [service_details]) VALUES (34, NULL)
GO
INSERT [dbo].[Service] ([service_id], [service_details]) VALUES (35, NULL)
GO
INSERT [dbo].[Service] ([service_id], [service_details]) VALUES (36, NULL)
GO
INSERT [dbo].[Service] ([service_id], [service_details]) VALUES (37, NULL)
GO
INSERT [dbo].[Service] ([service_id], [service_details]) VALUES (38, NULL)
GO
INSERT [dbo].[Service] ([service_id], [service_details]) VALUES (39, NULL)
GO
INSERT [dbo].[Service] ([service_id], [service_details]) VALUES (40, NULL)
GO
INSERT [dbo].[Service_Booking] ([service_id], [booking_id], [booking_start_date], [booking_end_date]) VALUES (31, 2, CAST(N'2020-01-22' AS Date), CAST(N'2020-01-23' AS Date))
GO
INSERT [dbo].[Service_Booking] ([service_id], [booking_id], [booking_start_date], [booking_end_date]) VALUES (32, 5, CAST(N'2019-11-10' AS Date), CAST(N'2019-11-11' AS Date))
GO
INSERT [dbo].[Service_Booking] ([service_id], [booking_id], [booking_start_date], [booking_end_date]) VALUES (33, 3, CAST(N'2019-11-14' AS Date), CAST(N'2019-11-15' AS Date))
GO
INSERT [dbo].[Service_Booking] ([service_id], [booking_id], [booking_start_date], [booking_end_date]) VALUES (34, 1, CAST(N'2019-12-21' AS Date), CAST(N'2019-12-22' AS Date))
GO
INSERT [dbo].[Service_Booking] ([service_id], [booking_id], [booking_start_date], [booking_end_date]) VALUES (35, 9, CAST(N'2019-12-07' AS Date), CAST(N'2019-12-11' AS Date))
GO
INSERT [dbo].[Service_Booking] ([service_id], [booking_id], [booking_start_date], [booking_end_date]) VALUES (36, 4, CAST(N'2019-12-25' AS Date), CAST(N'2019-12-29' AS Date))
GO
INSERT [dbo].[Service_Booking] ([service_id], [booking_id], [booking_start_date], [booking_end_date]) VALUES (37, 6, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-02' AS Date))
GO
INSERT [dbo].[Service_Booking] ([service_id], [booking_id], [booking_start_date], [booking_end_date]) VALUES (38, 10, CAST(N'2019-11-17' AS Date), CAST(N'2019-11-19' AS Date))
GO
INSERT [dbo].[Service_Booking] ([service_id], [booking_id], [booking_start_date], [booking_end_date]) VALUES (39, 7, CAST(N'2019-11-20' AS Date), CAST(N'2019-11-24' AS Date))
GO
INSERT [dbo].[Service_Booking] ([service_id], [booking_id], [booking_start_date], [booking_end_date]) VALUES (40, 8, CAST(N'2020-02-15' AS Date), CAST(N'2020-02-20' AS Date))
GO
INSERT [dbo].[Travel_Agency] ([travel_agency_id], [travel_agency_name]) VALUES (1, N'Booking.com')
GO
INSERT [dbo].[Travel_Agency] ([travel_agency_id], [travel_agency_name]) VALUES (2, N'Skyscanner')
GO
INSERT [dbo].[Travel_Agency] ([travel_agency_id], [travel_agency_name]) VALUES (3, N'Travelcations')
GO
INSERT [dbo].[Travel_Agency] ([travel_agency_id], [travel_agency_name]) VALUES (4, N'The Travel Connections')
GO
INSERT [dbo].[Travel_Agency] ([travel_agency_id], [travel_agency_name]) VALUES (5, N'Fox Travels')
GO
INSERT [dbo].[Travel_Agency] ([travel_agency_id], [travel_agency_name]) VALUES (6, N'Seven Seas Travel Agent')
GO
INSERT [dbo].[Travel_Agency] ([travel_agency_id], [travel_agency_name]) VALUES (7, N'TAG Group')
GO
INSERT [dbo].[Travel_Agency] ([travel_agency_id], [travel_agency_name]) VALUES (8, N'Stellar Travel')
GO
INSERT [dbo].[Travel_Agency] ([travel_agency_id], [travel_agency_name]) VALUES (9, N'Travel Tech')
GO
INSERT [dbo].[Travel_Agency] ([travel_agency_id], [travel_agency_name]) VALUES (10, N'Travel Express')
GO
/****** Object:  Index [UQ__Address__CAA247C919EAB746]    Script Date: 12/24/2019 10:23:55 PM ******/
ALTER TABLE [dbo].[Address] ADD UNIQUE NONCLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Airlines__A016BF818AF79134]    Script Date: 12/24/2019 10:23:55 PM ******/
ALTER TABLE [dbo].[Airlines] ADD UNIQUE NONCLUSTERED 
(
	[airline_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Booking__5DE3A5B0E33EB392]    Script Date: 12/24/2019 10:23:55 PM ******/
ALTER TABLE [dbo].[Booking] ADD UNIQUE NONCLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Booking___C2C15B76821BBA4D]    Script Date: 12/24/2019 10:23:55 PM ******/
ALTER TABLE [dbo].[Booking_Outcome] ADD UNIQUE NONCLUSTERED 
(
	[outcome_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Booking___3683B5307E600083]    Script Date: 12/24/2019 10:23:55 PM ******/
ALTER TABLE [dbo].[Booking_Status] ADD UNIQUE NONCLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Car__4C9A0DB23852AF5D]    Script Date: 12/24/2019 10:23:55 PM ******/
ALTER TABLE [dbo].[Car] ADD UNIQUE NONCLUSTERED 
(
	[car_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Customer__CD65CB849B4FE2C2]    Script Date: 12/24/2019 10:23:55 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [index_fullname]    Script Date: 12/24/2019 10:23:55 PM ******/
CREATE NONCLUSTERED INDEX [index_fullname] ON [dbo].[Customer]
(
	[customer_name] ASC,
	[customer_surname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Customer__6105FDF3FF188F95]    Script Date: 12/24/2019 10:23:55 PM ******/
ALTER TABLE [dbo].[Customer_Address] ADD UNIQUE NONCLUSTERED 
(
	[customer_address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Hotel__45FE7E276BC1DC78]    Script Date: 12/24/2019 10:23:55 PM ******/
ALTER TABLE [dbo].[Hotel] ADD UNIQUE NONCLUSTERED 
(
	[hotel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Payment__ED1FC9EBA8D379E8]    Script Date: 12/24/2019 10:23:55 PM ******/
ALTER TABLE [dbo].[Payment] ADD UNIQUE NONCLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Railway__5109BF395D49400C]    Script Date: 12/24/2019 10:23:55 PM ******/
ALTER TABLE [dbo].[Railway] ADD UNIQUE NONCLUSTERED 
(
	[railway_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Service__3E0DB8AE1EFAF5CB]    Script Date: 12/24/2019 10:23:55 PM ******/
ALTER TABLE [dbo].[Service] ADD UNIQUE NONCLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Service___3E0DB8AEDDDAC750]    Script Date: 12/24/2019 10:23:55 PM ******/
ALTER TABLE [dbo].[Service_Booking] ADD UNIQUE NONCLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Service___5DE3A5B06CB71239]    Script Date: 12/24/2019 10:23:55 PM ******/
ALTER TABLE [dbo].[Service_Booking] ADD UNIQUE NONCLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Travel_A__A5ECDBE48A9227E0]    Script Date: 12/24/2019 10:23:55 PM ******/
ALTER TABLE [dbo].[Travel_Agency] ADD UNIQUE NONCLUSTERED 
(
	[travel_agency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT (getdate()) FOR [date_of_booking]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT (getdate()) FOR [payment_date]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT (NULL) FOR [other_details]
GO
ALTER TABLE [dbo].[Airlines]  WITH CHECK ADD  CONSTRAINT [Airline_FK] FOREIGN KEY([airline_id])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[Airlines] CHECK CONSTRAINT [Airline_FK]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [Booking_FK1] FOREIGN KEY([travel_agency_id])
REFERENCES [dbo].[Travel_Agency] ([travel_agency_id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [Booking_FK1]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [Booking_FK2] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [Booking_FK2]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [Booking_FK3] FOREIGN KEY([outcome_id])
REFERENCES [dbo].[Booking_Outcome] ([outcome_id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [Booking_FK3]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [Booking_FK4] FOREIGN KEY([status_id])
REFERENCES [dbo].[Booking_Status] ([status_id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [Booking_FK4]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [Car_FK] FOREIGN KEY([car_id])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [Car_FK]
GO
ALTER TABLE [dbo].[Customer_Address]  WITH CHECK ADD  CONSTRAINT [Customer_Address_FK1] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Customer_Address] CHECK CONSTRAINT [Customer_Address_FK1]
GO
ALTER TABLE [dbo].[Customer_Address]  WITH CHECK ADD  CONSTRAINT [Customer_Address_FK2] FOREIGN KEY([address_id])
REFERENCES [dbo].[Address] ([address_id])
GO
ALTER TABLE [dbo].[Customer_Address] CHECK CONSTRAINT [Customer_Address_FK2]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [Hotel_FK] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [Hotel_FK]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [Payment_FK] FOREIGN KEY([booking_id])
REFERENCES [dbo].[Booking] ([booking_id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [Payment_FK]
GO
ALTER TABLE [dbo].[Railway]  WITH CHECK ADD  CONSTRAINT [Railway_FK] FOREIGN KEY([railway_id])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[Railway] CHECK CONSTRAINT [Railway_FK]
GO
ALTER TABLE [dbo].[Service_Booking]  WITH CHECK ADD  CONSTRAINT [Service_Booking_FK1] FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([service_id])
GO
ALTER TABLE [dbo].[Service_Booking] CHECK CONSTRAINT [Service_Booking_FK1]
GO
ALTER TABLE [dbo].[Service_Booking]  WITH CHECK ADD  CONSTRAINT [Service_Booking_FK2] FOREIGN KEY([booking_id])
REFERENCES [dbo].[Booking] ([booking_id])
GO
ALTER TABLE [dbo].[Service_Booking] CHECK CONSTRAINT [Service_Booking_FK2]
GO
ALTER TABLE [dbo].[Service_Booking]  WITH CHECK ADD CHECK  (([booking_end_date]>=[booking_start_date]))
GO
/****** Object:  StoredProcedure [dbo].[BookingsAboveSpecificNumberOfDays]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BookingsAboveSpecificNumberOfDays]
	@numberOfDay int
AS
SELECT booking_id, DATEDIFF(day , booking_start_date, booking_end_date) AS number_of_days, booking_start_date, booking_end_date 
FROM Service_Booking AS s
WHERE DATEDIFF(day , booking_start_date, booking_end_date) >= @numberOfDay;
GO
/****** Object:  StoredProcedure [dbo].[GetGreaterPayments]    Script Date: 12/24/2019 10:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGreaterPayments]
	@amount int
AS
SELECT * 
FROM Payment AS p
WHERE p.payment_amount >= @amount;
GO
USE [master]
GO
ALTER DATABASE [TRAVELAGENCY] SET  READ_WRITE 
GO
