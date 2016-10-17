USE [master]
GO
/****** Object:  Database [dogApp]    Script Date: 20/09/2016 20:55:55 ******/
CREATE DATABASE [dogApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dogApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dogApp.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dogApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dogApp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dogApp] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dogApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dogApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dogApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dogApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dogApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dogApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [dogApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dogApp] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [dogApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dogApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dogApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dogApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dogApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dogApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dogApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dogApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dogApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dogApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dogApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dogApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dogApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dogApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dogApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dogApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dogApp] SET RECOVERY FULL 
GO
ALTER DATABASE [dogApp] SET  MULTI_USER 
GO
ALTER DATABASE [dogApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dogApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dogApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dogApp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dogApp', N'ON'
GO
USE [dogApp]
GO
/****** Object:  Table [dbo].[BodyTypes]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BodyTypes](
	[bodytype_id] [int] IDENTITY(1,1) NOT NULL,
	[type_description] [varchar](250) NOT NULL,
	[type_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BodyTypes] PRIMARY KEY CLUSTERED 
(
	[bodytype_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClimateTypes]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClimateTypes](
	[climate_id] [int] IDENTITY(1,1) NOT NULL,
	[climate_type] [varchar](50) NOT NULL,
	[climate_description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_ClimateTypes] PRIMARY KEY CLUSTERED 
(
	[climate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CoatTypes]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CoatTypes](
	[coattype_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [varchar](50) NOT NULL,
	[type_description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_CoatTypes] PRIMARY KEY CLUSTERED 
(
	[coattype_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DispositionTypes]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DispositionTypes](
	[disposition_id] [int] IDENTITY(1,1) NOT NULL,
	[disposition_type] [varchar](50) NOT NULL,
	[disposition_description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_DispositionTypes] PRIMARY KEY CLUSTERED 
(
	[disposition_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DogAppearance]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DogAppearance](
	[appearance_id] [int] IDENTITY(1,1) NOT NULL,
	[bodytype_id] [int] NOT NULL,
	[eartype_id] [int] NOT NULL,
	[headtype_id] [int] NOT NULL,
	[coattype_id] [int] NOT NULL,
	[tailtype_id] [int] NOT NULL,
 CONSTRAINT [PK_DogAppearance] PRIMARY KEY CLUSTERED 
(
	[appearance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DogChildBehaviour]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DogChildBehaviour](
	[childB_id] [int] IDENTITY(1,1) NOT NULL,
	[childbehavior_type] [varchar](50) NOT NULL,
	[behaviour_description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_DogChildBehaviour] PRIMARY KEY CLUSTERED 
(
	[childB_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DogSizeTypes]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DogSizeTypes](
	[size_id] [int] IDENTITY(1,1) NOT NULL,
	[size_type] [varchar](50) NOT NULL,
	[size_description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_DogSizeTypes] PRIMARY KEY CLUSTERED 
(
	[size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DogSpecies]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DogSpecies](
	[species_id] [int] IDENTITY(1,1) NOT NULL,
	[species_name] [varchar](50) NOT NULL,
	[history_description] [varchar](800) NOT NULL,
	[about_description] [varchar](800) NOT NULL,
	[appearance_id] [int] NOT NULL,
	[origin_country] [varchar](50) NOT NULL,
	[species_age] [int] NOT NULL,
	[life_expectence] [varchar](50) NOT NULL,
	[dog_otherNames] [varchar](50) NOT NULL,
	[size_id] [int] NOT NULL,
	[livingspace_id] [int] NOT NULL,
	[trainingType_id] [int] NOT NULL,
	[exercise_id] [int] NOT NULL,
	[disposition_id] [int] NOT NULL,
	[shedding_id] [int] NOT NULL,
	[childB_id] [int] NOT NULL,
	[protection_id] [int] NOT NULL,
	[temprament_id] [int] NOT NULL,
	[climate_id] [int] NOT NULL,
 CONSTRAINT [PK_DogSpecies] PRIMARY KEY CLUSTERED 
(
	[species_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EarTypes]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EarTypes](
	[eartype_id] [int] IDENTITY(1,1) NOT NULL,
	[type_description] [varchar](250) NOT NULL,
	[type_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EarTypes] PRIMARY KEY CLUSTERED 
(
	[eartype_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExerciseTypes]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExerciseTypes](
	[exercise_id] [int] IDENTITY(1,1) NOT NULL,
	[exercise_type] [varchar](50) NOT NULL,
	[exercise_description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_ExerciseTypes] PRIMARY KEY CLUSTERED 
(
	[exercise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HeadTypes]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HeadTypes](
	[headtype_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [varchar](50) NOT NULL,
	[type_description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_HeadTypes] PRIMARY KEY CLUSTERED 
(
	[headtype_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LivingSpaceTypes]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LivingSpaceTypes](
	[livingspace_id] [int] IDENTITY(1,1) NOT NULL,
	[livingspace_type] [varchar](100) NOT NULL,
	[livingspace_description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_LivingSpaceTypes] PRIMARY KEY CLUSTERED 
(
	[livingspace_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProtectionBehaviour]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProtectionBehaviour](
	[protection_id] [int] IDENTITY(1,1) NOT NULL,
	[protection_type] [varchar](50) NOT NULL,
	[protection_description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_ProtectionBehaviour] PRIMARY KEY CLUSTERED 
(
	[protection_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SheddingTypes]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SheddingTypes](
	[shedding_id] [int] IDENTITY(1,1) NOT NULL,
	[shedding_type] [varchar](50) NOT NULL,
	[shedding_description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_SheddingTypes] PRIMARY KEY CLUSTERED 
(
	[shedding_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TailTypes]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TailTypes](
	[tailtype_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [varchar](50) NOT NULL,
	[type_description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_TailTypes] PRIMARY KEY CLUSTERED 
(
	[tailtype_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempramentTypes]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempramentTypes](
	[temprament_id] [int] IDENTITY(1,1) NOT NULL,
	[temprament_type] [varchar](50) NOT NULL,
	[temprament_description] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TempramentTypes] PRIMARY KEY CLUSTERED 
(
	[temprament_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrainingTypes]    Script Date: 20/09/2016 20:55:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrainingTypes](
	[trainingType_id] [int] IDENTITY(1,1) NOT NULL,
	[training_type] [varchar](50) NOT NULL,
	[training_description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_TrainingTypes] PRIMARY KEY CLUSTERED 
(
	[trainingType_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DogAppearance]  WITH CHECK ADD  CONSTRAINT [FK_DogAppearance_BodyTypes] FOREIGN KEY([bodytype_id])
REFERENCES [dbo].[BodyTypes] ([bodytype_id])
GO
ALTER TABLE [dbo].[DogAppearance] CHECK CONSTRAINT [FK_DogAppearance_BodyTypes]
GO
ALTER TABLE [dbo].[DogAppearance]  WITH CHECK ADD  CONSTRAINT [FK_DogAppearance_CoatTypes] FOREIGN KEY([coattype_id])
REFERENCES [dbo].[CoatTypes] ([coattype_id])
GO
ALTER TABLE [dbo].[DogAppearance] CHECK CONSTRAINT [FK_DogAppearance_CoatTypes]
GO
ALTER TABLE [dbo].[DogAppearance]  WITH CHECK ADD  CONSTRAINT [FK_DogAppearance_EarTypes] FOREIGN KEY([eartype_id])
REFERENCES [dbo].[EarTypes] ([eartype_id])
GO
ALTER TABLE [dbo].[DogAppearance] CHECK CONSTRAINT [FK_DogAppearance_EarTypes]
GO
ALTER TABLE [dbo].[DogAppearance]  WITH CHECK ADD  CONSTRAINT [FK_DogAppearance_HeadTypes] FOREIGN KEY([headtype_id])
REFERENCES [dbo].[HeadTypes] ([headtype_id])
GO
ALTER TABLE [dbo].[DogAppearance] CHECK CONSTRAINT [FK_DogAppearance_HeadTypes]
GO
ALTER TABLE [dbo].[DogAppearance]  WITH CHECK ADD  CONSTRAINT [FK_DogAppearance_TailTypes] FOREIGN KEY([tailtype_id])
REFERENCES [dbo].[TailTypes] ([tailtype_id])
GO
ALTER TABLE [dbo].[DogAppearance] CHECK CONSTRAINT [FK_DogAppearance_TailTypes]
GO
ALTER TABLE [dbo].[DogSpecies]  WITH CHECK ADD  CONSTRAINT [FK_DogSpecies_DogAppearance] FOREIGN KEY([appearance_id])
REFERENCES [dbo].[DogAppearance] ([appearance_id])
GO
ALTER TABLE [dbo].[DogSpecies] CHECK CONSTRAINT [FK_DogSpecies_DogAppearance]
GO
ALTER TABLE [dbo].[DogSpecies]  WITH CHECK ADD  CONSTRAINT [FK_DogSpecies_DispositionTypes] FOREIGN KEY([disposition_id])
REFERENCES [dbo].[DispositionTypes] ([disposition_id])
GO
ALTER TABLE [dbo].[DogSpecies] CHECK CONSTRAINT [FK_DogSpecies_DispositionTypes]
GO
ALTER TABLE [dbo].[DogSpecies]  WITH CHECK ADD  CONSTRAINT [FK_DogSpecies_DogChildBehaviour] FOREIGN KEY([childB_id])
REFERENCES [dbo].[DogChildBehaviour] ([childB_id])
GO
ALTER TABLE [dbo].[DogSpecies] CHECK CONSTRAINT [FK_DogSpecies_DogChildBehaviour]
GO
ALTER TABLE [dbo].[DogSpecies]  WITH CHECK ADD  CONSTRAINT [FK_DogSpecies_DogSizeTypes] FOREIGN KEY([size_id])
REFERENCES [dbo].[DogSizeTypes] ([size_id])
GO
ALTER TABLE [dbo].[DogSpecies] CHECK CONSTRAINT [FK_DogSpecies_DogSizeTypes]
GO
ALTER TABLE [dbo].[DogSpecies]  WITH CHECK ADD  CONSTRAINT [FK_DogSpecies_ExerciseTypes] FOREIGN KEY([exercise_id])
REFERENCES [dbo].[ExerciseTypes] ([exercise_id])
GO
ALTER TABLE [dbo].[DogSpecies] CHECK CONSTRAINT [FK_DogSpecies_ExerciseTypes]
GO
ALTER TABLE [dbo].[DogSpecies]  WITH CHECK ADD  CONSTRAINT [FK_DogSpecies_LivingSpaceTypes] FOREIGN KEY([livingspace_id])
REFERENCES [dbo].[LivingSpaceTypes] ([livingspace_id])
GO
ALTER TABLE [dbo].[DogSpecies] CHECK CONSTRAINT [FK_DogSpecies_LivingSpaceTypes]
GO
ALTER TABLE [dbo].[DogSpecies]  WITH CHECK ADD  CONSTRAINT [FK_DogSpecies_ProtectionBehaviour] FOREIGN KEY([protection_id])
REFERENCES [dbo].[ProtectionBehaviour] ([protection_id])
GO
ALTER TABLE [dbo].[DogSpecies] CHECK CONSTRAINT [FK_DogSpecies_ProtectionBehaviour]
GO
ALTER TABLE [dbo].[DogSpecies]  WITH CHECK ADD  CONSTRAINT [FK_DogSpecies_SheddingTypes] FOREIGN KEY([shedding_id])
REFERENCES [dbo].[SheddingTypes] ([shedding_id])
GO
ALTER TABLE [dbo].[DogSpecies] CHECK CONSTRAINT [FK_DogSpecies_SheddingTypes]
GO
ALTER TABLE [dbo].[DogSpecies]  WITH CHECK ADD  CONSTRAINT [FK_DogSpecies_TrainingTypes] FOREIGN KEY([trainingType_id])
REFERENCES [dbo].[TrainingTypes] ([trainingType_id])
GO
ALTER TABLE [dbo].[DogSpecies] CHECK CONSTRAINT [FK_DogSpecies_TrainingTypes]
GO
ALTER TABLE [dbo].[DogSpecies]  WITH CHECK ADD  CONSTRAINT [FK_DogSpecies_TempramentTypes] FOREIGN KEY([temprament_id])
REFERENCES [dbo].[TempramentTypes] ([temprament_id])
GO
ALTER TABLE [dbo].[DogSpecies] CHECK CONSTRAINT [FK_DogSpecies_TempramentTypes]
GO
ALTER TABLE [dbo].[DogSpecies]  WITH CHECK ADD  CONSTRAINT [FK_DogSpecies_ClimateTypes] FOREIGN KEY([climate_id])
REFERENCES [dbo].[ClimateTypes] ([climate_id])
GO
ALTER TABLE [dbo].[DogSpecies] CHECK CONSTRAINT [FK_DogSpecies_ClimateTypes]
GO
ALTER DATABASE [dogApp] SET  READ_WRITE 
GO
