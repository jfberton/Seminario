
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/12/2018 15:16:52
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
IF OBJECT_ID(N'[dbo].[FK_Region_EducativaLocalidad_Region_Educativa]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Region_EducativaLocalidad] DROP CONSTRAINT [FK_Region_EducativaLocalidad_Region_Educativa];
GO
IF OBJECT_ID(N'[dbo].[FK_Region_EducativaLocalidad_Localidad]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Region_EducativaLocalidad] DROP CONSTRAINT [FK_Region_EducativaLocalidad_Localidad];
GO
IF OBJECT_ID(N'[dbo].[FK_Region_EducativaEstablecimiento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Establecimientos] DROP CONSTRAINT [FK_Region_EducativaEstablecimiento];
GO
IF OBJECT_ID(N'[dbo].[FK_LocalidadEstablecimiento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Establecimientos] DROP CONSTRAINT [FK_LocalidadEstablecimiento];
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
IF OBJECT_ID(N'[dbo].[Localidades]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Localidades];
GO
IF OBJECT_ID(N'[dbo].[Regiones_Educativas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Regiones_Educativas];
GO
IF OBJECT_ID(N'[dbo].[Establecimientos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Establecimientos];
GO
IF OBJECT_ID(N'[dbo].[Region_EducativaLocalidad]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Region_EducativaLocalidad];
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

-- Creating table 'Localidades'
CREATE TABLE [dbo].[Localidades] (
    [localidad_id] int IDENTITY(1,1) NOT NULL,
    [localidad_nombre] nvarchar(max)  NOT NULL,
    [localidad_departamento] nvarchar(max)  NOT NULL,
    [localidad_tipo] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Regiones_Educativas'
CREATE TABLE [dbo].[Regiones_Educativas] (
    [region_educativa_id] int IDENTITY(1,1) NOT NULL,
    [region_educativa_nombre] nvarchar(max)  NOT NULL,
    [region_educativa_produccion] nvarchar(max)  NOT NULL,
    [region_educativa_industria] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Establecimientos'
CREATE TABLE [dbo].[Establecimientos] (
    [establecimiento_id] int IDENTITY(1,1) NOT NULL,
    [region_educativa_id] int  NOT NULL,
    [establecimiento_nombre] nvarchar(max)  NOT NULL,
    [establecimiento_ambito] nvarchar(max)  NOT NULL,
    [establecimiento_modalidad] nvarchar(max)  NOT NULL,
    [establecimiento_sector] nvarchar(max)  NOT NULL,
    [localidad_id] int  NOT NULL,
    [establecimiento_direccion] nvarchar(max)  NOT NULL,
    [establecimiento_telefono] nvarchar(max)  NOT NULL,
    [establecimiento_mail] nvarchar(max)  NOT NULL,
    [establecimiento_web] nvarchar(max)  NOT NULL,
    [establecimiento_orientaciones] nvarchar(max)  NOT NULL,
    [establecimiento_longitud] nvarchar(max)  NOT NULL,
    [establecimiento_latitud] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Modalidades'
CREATE TABLE [dbo].[Modalidades] (
    [modalidad_id] int IDENTITY(1,1) NOT NULL,
    [modalidad_nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Ambitos'
CREATE TABLE [dbo].[Ambitos] (
    [ambito_id] int IDENTITY(1,1) NOT NULL,
    [ambito_nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Sectores'
CREATE TABLE [dbo].[Sectores] (
    [sector_id] int IDENTITY(1,1) NOT NULL,
    [sector_nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Orientaciones'
CREATE TABLE [dbo].[Orientaciones] (
    [orientacion_id] int IDENTITY(1,1) NOT NULL,
    [orientacion_nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Region_EducativaLocalidad'
CREATE TABLE [dbo].[Region_EducativaLocalidad] (
    [Region_EducativaLocalidad_Localidad_region_educativa_id] int  NOT NULL,
    [Localidades_localidad_id] int  NOT NULL
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

-- Creating primary key on [localidad_id] in table 'Localidades'
ALTER TABLE [dbo].[Localidades]
ADD CONSTRAINT [PK_Localidades]
    PRIMARY KEY CLUSTERED ([localidad_id] ASC);
GO

-- Creating primary key on [region_educativa_id] in table 'Regiones_Educativas'
ALTER TABLE [dbo].[Regiones_Educativas]
ADD CONSTRAINT [PK_Regiones_Educativas]
    PRIMARY KEY CLUSTERED ([region_educativa_id] ASC);
GO

-- Creating primary key on [establecimiento_id] in table 'Establecimientos'
ALTER TABLE [dbo].[Establecimientos]
ADD CONSTRAINT [PK_Establecimientos]
    PRIMARY KEY CLUSTERED ([establecimiento_id] ASC);
GO

-- Creating primary key on [modalidad_id] in table 'Modalidades'
ALTER TABLE [dbo].[Modalidades]
ADD CONSTRAINT [PK_Modalidades]
    PRIMARY KEY CLUSTERED ([modalidad_id] ASC);
GO

-- Creating primary key on [ambito_id] in table 'Ambitos'
ALTER TABLE [dbo].[Ambitos]
ADD CONSTRAINT [PK_Ambitos]
    PRIMARY KEY CLUSTERED ([ambito_id] ASC);
GO

-- Creating primary key on [sector_id] in table 'Sectores'
ALTER TABLE [dbo].[Sectores]
ADD CONSTRAINT [PK_Sectores]
    PRIMARY KEY CLUSTERED ([sector_id] ASC);
GO

-- Creating primary key on [orientacion_id] in table 'Orientaciones'
ALTER TABLE [dbo].[Orientaciones]
ADD CONSTRAINT [PK_Orientaciones]
    PRIMARY KEY CLUSTERED ([orientacion_id] ASC);
GO

-- Creating primary key on [Region_EducativaLocalidad_Localidad_region_educativa_id], [Localidades_localidad_id] in table 'Region_EducativaLocalidad'
ALTER TABLE [dbo].[Region_EducativaLocalidad]
ADD CONSTRAINT [PK_Region_EducativaLocalidad]
    PRIMARY KEY CLUSTERED ([Region_EducativaLocalidad_Localidad_region_educativa_id], [Localidades_localidad_id] ASC);
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

-- Creating foreign key on [Region_EducativaLocalidad_Localidad_region_educativa_id] in table 'Region_EducativaLocalidad'
ALTER TABLE [dbo].[Region_EducativaLocalidad]
ADD CONSTRAINT [FK_Region_EducativaLocalidad_Region_Educativa]
    FOREIGN KEY ([Region_EducativaLocalidad_Localidad_region_educativa_id])
    REFERENCES [dbo].[Regiones_Educativas]
        ([region_educativa_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Localidades_localidad_id] in table 'Region_EducativaLocalidad'
ALTER TABLE [dbo].[Region_EducativaLocalidad]
ADD CONSTRAINT [FK_Region_EducativaLocalidad_Localidad]
    FOREIGN KEY ([Localidades_localidad_id])
    REFERENCES [dbo].[Localidades]
        ([localidad_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Region_EducativaLocalidad_Localidad'
CREATE INDEX [IX_FK_Region_EducativaLocalidad_Localidad]
ON [dbo].[Region_EducativaLocalidad]
    ([Localidades_localidad_id]);
GO

-- Creating foreign key on [region_educativa_id] in table 'Establecimientos'
ALTER TABLE [dbo].[Establecimientos]
ADD CONSTRAINT [FK_Region_EducativaEstablecimiento]
    FOREIGN KEY ([region_educativa_id])
    REFERENCES [dbo].[Regiones_Educativas]
        ([region_educativa_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Region_EducativaEstablecimiento'
CREATE INDEX [IX_FK_Region_EducativaEstablecimiento]
ON [dbo].[Establecimientos]
    ([region_educativa_id]);
GO

-- Creating foreign key on [localidad_id] in table 'Establecimientos'
ALTER TABLE [dbo].[Establecimientos]
ADD CONSTRAINT [FK_LocalidadEstablecimiento]
    FOREIGN KEY ([localidad_id])
    REFERENCES [dbo].[Localidades]
        ([localidad_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LocalidadEstablecimiento'
CREATE INDEX [IX_FK_LocalidadEstablecimiento]
ON [dbo].[Establecimientos]
    ([localidad_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------