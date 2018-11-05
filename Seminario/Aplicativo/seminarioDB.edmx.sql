
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/03/2018 14:51:53
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

IF OBJECT_ID(N'[dbo].[FK_SecuenciadorClase]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Clases] DROP CONSTRAINT [FK_SecuenciadorClase];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioSecuenciador]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Secuenciadores] DROP CONSTRAINT [FK_UsuarioSecuenciador];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Ubicaciones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ubicaciones];
GO
IF OBJECT_ID(N'[dbo].[Secuenciadores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Secuenciadores];
GO
IF OBJECT_ID(N'[dbo].[Clases]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clases];
GO
IF OBJECT_ID(N'[dbo].[Usuarios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuarios];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Ubicaciones'
CREATE TABLE [dbo].[Ubicaciones] (
    [ubicacion_Id] int IDENTITY(1,1) NOT NULL,
    [ubicacion_categoria] nvarchar(max)  NOT NULL,
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

-- Creating table 'Secuenciadores'
CREATE TABLE [dbo].[Secuenciadores] (
    [secuenciador_id] int IDENTITY(1,1) NOT NULL,
    [usuario_id] int  NOT NULL,
    [secuenciador_publico] bit  NOT NULL,
    [secuenciador_datos_generales_nombre] nvarchar(max)  NOT NULL,
    [secuenciador_datos_generales_area] nvarchar(max)  NOT NULL,
    [secuenciador_datos_generales_asignatura] nvarchar(max)  NOT NULL,
    [secuenciador_datos_generales_curso] nvarchar(max)  NOT NULL,
    [secuenciador_datos_generales_institucion] nvarchar(max)  NOT NULL,
    [secuenciador_descripcion_tema_general] nvarchar(max)  NOT NULL,
    [secuenciador_descripcion_contenidos] nvarchar(max)  NOT NULL,
    [secuenciador_descripcion_numero_clases] nvarchar(max)  NOT NULL,
    [secuenciador_descripcion_autor] nvarchar(max)  NOT NULL,
    [secuenciador_descripcion_capacidades_a_desarrollar] nvarchar(max)  NOT NULL,
    [secuenciador_descripcion_propositos] nvarchar(max)  NOT NULL,
    [secuenciador_descripcion_objetivos] nvarchar(max)  NOT NULL,
    [secuenciador_descripcion_metodologia] nvarchar(max)  NOT NULL,
    [secuenciador_descripcion_orientaciones_generales_evaluacion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Clases'
CREATE TABLE [dbo].[Clases] (
    [secuenciador_id] int  NOT NULL,
    [clase_id] uniqueidentifier  NOT NULL,
    [clase_numero] nvarchar(max)  NOT NULL,
    [clase_actividades_apertura] nvarchar(max)  NOT NULL,
    [clase_actividades_desarrollo] nvarchar(max)  NOT NULL,
    [clase_actividades_cierre] nvarchar(max)  NOT NULL,
    [clase_evidencias_aprendizaje] nvarchar(max)  NOT NULL,
    [clase_recursos] nvarchar(max)  NOT NULL,
    [clase_bibliografia] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [usuario_id] int IDENTITY(1,1) NOT NULL,
    [usuario_perfil] nvarchar(max)  NOT NULL,
    [usuario_nombre_apellido] nvarchar(max)  NOT NULL,
    [usuario_email] nvarchar(max)  NOT NULL,
    [usuario_usuario] nvarchar(max)  NOT NULL,
    [usuario_clave] nvarchar(max)  NOT NULL
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

-- Creating primary key on [secuenciador_id] in table 'Secuenciadores'
ALTER TABLE [dbo].[Secuenciadores]
ADD CONSTRAINT [PK_Secuenciadores]
    PRIMARY KEY CLUSTERED ([secuenciador_id] ASC);
GO

-- Creating primary key on [clase_id] in table 'Clases'
ALTER TABLE [dbo].[Clases]
ADD CONSTRAINT [PK_Clases]
    PRIMARY KEY CLUSTERED ([clase_id] ASC);
GO

-- Creating primary key on [usuario_id] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([usuario_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [secuenciador_id] in table 'Clases'
ALTER TABLE [dbo].[Clases]
ADD CONSTRAINT [FK_SecuenciadorClase]
    FOREIGN KEY ([secuenciador_id])
    REFERENCES [dbo].[Secuenciadores]
        ([secuenciador_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SecuenciadorClase'
CREATE INDEX [IX_FK_SecuenciadorClase]
ON [dbo].[Clases]
    ([secuenciador_id]);
GO

-- Creating foreign key on [usuario_id] in table 'Secuenciadores'
ALTER TABLE [dbo].[Secuenciadores]
ADD CONSTRAINT [FK_UsuarioSecuenciador]
    FOREIGN KEY ([usuario_id])
    REFERENCES [dbo].[Usuarios]
        ([usuario_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioSecuenciador'
CREATE INDEX [IX_FK_UsuarioSecuenciador]
ON [dbo].[Secuenciadores]
    ([usuario_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------