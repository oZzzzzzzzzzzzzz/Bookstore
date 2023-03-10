USE [master]
GO
/****** Object:  Database [dbBookstore]    Script Date: 15.01.2023 00:21:36 ******/
CREATE DATABASE [dbBookstore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbBookstore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbBookstore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbBookstore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbBookstore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbBookstore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbBookstore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbBookstore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbBookstore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbBookstore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbBookstore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbBookstore] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbBookstore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbBookstore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbBookstore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbBookstore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbBookstore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbBookstore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbBookstore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbBookstore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbBookstore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbBookstore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbBookstore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbBookstore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbBookstore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbBookstore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbBookstore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbBookstore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbBookstore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbBookstore] SET RECOVERY FULL 
GO
ALTER DATABASE [dbBookstore] SET  MULTI_USER 
GO
ALTER DATABASE [dbBookstore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbBookstore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbBookstore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbBookstore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbBookstore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbBookstore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbBookstore', N'ON'
GO
ALTER DATABASE [dbBookstore] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbBookstore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbBookstore]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 15.01.2023 00:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[BirthDate] [datetime2](7) NOT NULL,
	[Gender] [bit] NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 15.01.2023 00:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Rating] [decimal](18, 0) NOT NULL,
	[ISBN] [nvarchar](13) NOT NULL,
	[PublicationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_dbo.Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookAuthor]    Script Date: 15.01.2023 00:21:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthor](
	[BookId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Author] ([Id], [FirstName], [LastName], [BirthDate], [Gender]) VALUES (1, N'Andrzej', N'Sapkowski', CAST(N'1948-06-21T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Author] ([Id], [FirstName], [LastName], [BirthDate], [Gender]) VALUES (2, N'Stanisław', N'Lem', CAST(N'1921-09-12T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Author] ([Id], [FirstName], [LastName], [BirthDate], [Gender]) VALUES (3, N'Wisława', N'Szymborska', CAST(N'1923-07-02T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Book] ([Id], [Title], [Description], [Rating], [ISBN], [PublicationDate]) VALUES (1, N'Wiedźmin. Sezon burz', N'Oto nowy Sapkowski i nowy wiedźmin. Mistrz polskiej fantastyki znowu zaskakuje. Sezon burz nie opowiada bowiem o młodzieńczych latach białowłosego zabójcy potworów ani o jego losach po śmierci/nieśmierci kończącej ostatni tom sagi.', CAST(4 AS Decimal(18, 0)), N'9788375780598', CAST(N'2013-10-24T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Book] ([Id], [Title], [Description], [Rating], [ISBN], [PublicationDate]) VALUES (2, N'Wiedźmin. Miecz przeznaczenia', N'Wiedźmin Geralt przyłącza się jednak do zorganizowanej przez króla Niedamira wyprawy na smoka, który skrył się w jaskiniach Gór Pustulskich. Na swej drodze spotyka trubadura Jaskra oraz – jakżeby inaczej – czarodziejkę Yennefer. Wśród zaproszonych przez króla co sławniejszych smokobójców jest Eyck z Denesle, rycerz bez skazy i zmazy, Rębacze z Cinfrid i szóstka krasnoludów pod komendą Yarpena Zigrina. Motywacje są różne, ale cel jeden.', CAST(5 AS Decimal(18, 0)), N'9788375780642', CAST(N'2014-09-25T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Book] ([Id], [Title], [Description], [Rating], [ISBN], [PublicationDate]) VALUES (3, N'Solaris', N'W Solaris Stanisław Lem podejmuje jeden z najpopularniejszych tematów literatury fantastycznej - temat Kontaktu. Z obcą cywilizacją, odmienną formą życia, a może po prostu z Nieznanym, tego Lem jednoznacznie nie dopowiada. Być może dlatego Solaris po kilkudziesiąciu lat od pierwszego wydania wciąż fascynuje.', CAST(5 AS Decimal(18, 0)), N'9788308075197', CAST(N'2022-01-21T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Book] ([Id], [Title], [Description], [Rating], [ISBN], [PublicationDate]) VALUES (4, N'Opowieści o pilocie Pirxie', N'Stanisław Lem planował dwa, może trzy opowiadania o pilocie Pirxie. Ku radości czytelników powstało ich więcej. Dzięki temu możemy dziś obcować z jednym z najsłynniejszych bohaterów literatury science-fiction.', CAST(5 AS Decimal(18, 0)), N'9788308080078', CAST(N'2022-10-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Book] ([Id], [Title], [Description], [Rating], [ISBN], [PublicationDate]) VALUES (5, N'Chwila', N'Każdy z utworów zgromadzonych w tomie Chwila to krystalicznie czysty, precyzyjny i zwarty minitraktat: filozoficzny, metafizyczny, egzystencjalny. Szymborska mówi o sprawach najważniejszych w sposób skłaniający do odkrywczych medytacji i przemyśleń.', CAST(4 AS Decimal(18, 0)), N'9788324065226', CAST(N'2022-04-21T00:00:00.0000000' AS DateTime2))
GO
USE [master]
GO
ALTER DATABASE [dbBookstore] SET  READ_WRITE 
GO
