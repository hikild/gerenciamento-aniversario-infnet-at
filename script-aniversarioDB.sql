USE [master]
GO
/****** Object:  Database [AniversarioDB]    Script Date: 28/06/2021 20:28:47 ******/
CREATE DATABASE [AniversarioDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AniversarioDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HIKILD\MSSQL\DATA\AniversarioDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AniversarioDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HIKILD\MSSQL\DATA\AniversarioDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AniversarioDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AniversarioDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AniversarioDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AniversarioDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AniversarioDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AniversarioDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AniversarioDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AniversarioDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AniversarioDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AniversarioDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AniversarioDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AniversarioDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AniversarioDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AniversarioDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AniversarioDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AniversarioDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AniversarioDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AniversarioDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AniversarioDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AniversarioDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AniversarioDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AniversarioDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AniversarioDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AniversarioDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AniversarioDB] SET RECOVERY FULL 
GO
ALTER DATABASE [AniversarioDB] SET  MULTI_USER 
GO
ALTER DATABASE [AniversarioDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AniversarioDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AniversarioDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AniversarioDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AniversarioDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AniversarioDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AniversarioDB', N'ON'
GO
ALTER DATABASE [AniversarioDB] SET QUERY_STORE = OFF
GO
USE [AniversarioDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 28/06/2021 20:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoa]    Script Date: 28/06/2021 20:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Sobrenome] [varchar](50) NOT NULL,
	[DataDeAniversario] [datetime] NOT NULL,
 CONSTRAINT [PK_Pessoa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoas]    Script Date: 28/06/2021 20:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](max) NULL,
	[Sobrenome] [nvarchar](max) NULL,
	[DataNascimento] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Pessoas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[DeletePessoa]    Script Date: 28/06/2021 20:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeletePessoa]
	-- Add the parameters for the stored procedure here
	@IdPessoa int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM dbo.Pessoa
	WHERE Id = @IdPessoa
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPessoa]    Script Date: 28/06/2021 20:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertPessoa]
	-- Add the parameters for the stored procedure here
	@Nome varchar(50),
	@Sobrenome varchar(50),
	@DataDeAniversario datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO dbo.Pessoa(Nome, Sobrenome, DataDeAniversario)
	VALUES (@Nome, @Sobrenome, @DataDeAniversario);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllPessoa]    Script Date: 28/06/2021 20:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllPessoa]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Pessoa
END
GO
/****** Object:  StoredProcedure [dbo].[SelectNomePessoa]    Script Date: 28/06/2021 20:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectNomePessoa]
	-- Add the parameters for the stored procedure here
	@NomePessoa varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Pessoa
	WHERE Nome = @NomePessoa
END
GO
/****** Object:  StoredProcedure [dbo].[SelectPessoaById]    Script Date: 28/06/2021 20:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectPessoaById]
	-- Add the parameters for the stored procedure here
	@IdPessoa int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Pessoa
	WHERE Id = @IdPessoa
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePessoa]    Script Date: 28/06/2021 20:28:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePessoa]
	-- Add the parameters for the stored procedure here
	@Nome varchar(50),
	@Sobrenome varchar(50),
	@DataDeAniversario datetime,
	@IdPessoa int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE dbo.Pessoa 

	SET Nome = @Nome,
		Sobrenome = @Sobrenome,
		DataDeAniversario = @DataDeAniversario

	WHERE @IdPessoa = Id;

END

GO
USE [master]
GO
ALTER DATABASE [AniversarioDB] SET  READ_WRITE 
GO
