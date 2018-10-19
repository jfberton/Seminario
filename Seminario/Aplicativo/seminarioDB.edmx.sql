
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/18/2018 20:09:46
-- Generated from EDMX file: D:\Desarrollo\Mios\Seminario\Seminario\Aplicativo\seminarioDB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SeminarioDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Ubicaciones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ubicaciones];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Ubicaciones'
CREATE TABLE [dbo].[Ubicaciones] (
    [ubicacion_Id] int IDENTITY(1,1) NOT NULL,
    [ubicacion_nombre_lugar] nvarchar(max)  NOT NULL,
    [ubicacion_descripcion] nvarchar(max)  NOT NULL,
    [ubicacion_direccion] nvarchar(max)  NOT NULL,
    [ubicacion_latitud] nvarchar(max)  NOT NULL,
    [ubicacion_longitud] nvarchar(max)  NOT NULL,
    [ubicacion_telefono] nvarchar(max)  NOT NULL,
    [ubicacion_web] nvarchar(max)  NOT NULL,
    [ubicacion_mail] nvarchar(max)  NOT NULL,
    [ubicacion_face] nvarchar(max)  NOT NULL,
    [ubicacion_twitter] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ubicacion_Id] in table 'Ubicaciones'
ALTER TABLE [dbo].[Ubicaciones]
ADD CONSTRAINT [PK_Ubicaciones]
    PRIMARY KEY CLUSTERED ([ubicacion_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------