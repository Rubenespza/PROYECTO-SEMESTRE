--SQL
USE master;
GO
IF DB_ID (N'ServicioMilitar') IS NOT NULL
DROP DATABASE ServicioMilitar;
CREATE DATABASE ServicioMilitar
ON
( NAME = ServicioMilitar_dat,
    FILENAME = 'C:\samples\ServicioMilitar.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 )
LOG ON
( NAME = ServicioMilitar_log,
    FILENAME = 'C:\samples\ServicioMilitar.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB ) ;
GO
USE ServicioMilitar;
GO
CREATE TABLE Compania
(
idCompania INT NOT NULL,
actividad VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE Cuartel
(
idCuartel INT NOT NULL,
codigo VARCHAR(10) NOT NULL,
direccion VARCHAR (50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);

GO
CREATE TABLE Cuerpo
(
idCuerpo INT NOT NULL,
denominacion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE Servicio
(
idServicio INT NOT NULL,
codigo VARCHAR (10) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE Soldado
(
idSoldado INT NOT NULL,
idCompania INT NOT NULL,
idCuartel INT NOT NULL,
idCuerpo INT NOT NULL,
codigo VARCHAR(10) NOT NULL,
nombre VARCHAR(10) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE CompaniaCuartel
(
idCompaniaCuartel INT NOT NULL,
idCompania INT NOT NULL,
idCuartel INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE ServicioSoldado
(
idServicioSoldado INT NOT NULL,
idSoldado INT NOT NULL,
idServicio INT NOT NULL,
fehcaRealizacion DATETIME NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
GO

--Llaves Primarias

ALTER TABLE Compania ADD CONSTRAINT PK_Compania PRIMARY KEY(idCompania)
ALTER TABLE Cuartel ADD CONSTRAINT PK_Caurtel PRIMARY KEY(idCuartel)
ALTER TABLE Cuerpo ADD CONSTRAINT PK_Cuerpo PRIMARY KEY(idCuerpo)
ALTER TABLE Servicio ADD CONSTRAINT PK_Servicio PRIMARY KEY(idServicio)
ALTER TABLE Soldado ADD CONSTRAINT  PK_Soldado PRIMARY KEY(idSoldado)
ALTER TABLE CompaniaCuartel ADD CONSTRAINT PK_CompaniaCuartel PRIMARY KEY(idCompaniaCuartel)
ALTER TABLE ServicioSoldado ADD CONSTRAINT PK_ServicioSoldado PRIMARY KEY(idServicioSoldado)

--Llaves Foraneas
--Soldado
ALTER TABLE Soldado ADD CONSTRAINT FK_SoldadoCompania FOREIGN KEY(idCompania) REFERENCES Compania(idCompania)
ALTER TABLE Soldado ADD CONSTRAINT FK_SoldadoCuartel FOREIGN KEY(idCuartel) REFERENCES Cuartel(idCuartel)
ALTER TABLE Soldado ADD CONSTRAINT FK_SoldadoCuerpo FOREIGN KEY (idCuerpo) REFERENCES Cuerpo(idCuerpo)

--CompaniaCuartel
ALTER TABLE CompaniaCuartel ADD CONSTRAINT FK_CompaniaCuartelCompania FOREIGN KEY (idCompania) REFERENCES Compania(idCompania)
ALTER TABLE CompaniaCuartel ADD CONSTRAINT FK_CompaniaCuartelCuartel FOREIGN KEY (idCuartel) REFERENCES Cuartel(idCuartel)

--ServicioSoldado
ALTER TABLE ServicioSoldado ADD CONSTRAINT FK_ServicioSoldadoServicio FOREIGN KEY (idServicio) REFERENCES Servicio(idServicio)
ALTER TABLE ServicioSoldado ADD CONSTRAINT FK_ServicicioSoldadoSoldado FOREIGN KEY (idSoldado) REFERENCES Soldado(idSoldado)

--Indices 
CREATE INDEX IX_Compania ON Compania(idCompania)
CREATE INDEX IX_Cuartel ON  Cuartel(idCuartel)
CREATE INDEX IX_Cuerpo ON Cuerpo(idCuerpo)
CREATE INDEX IX_Servicio ON Servicio(idServicio)
CREATE INDEX IX_Soldado ON Soldado(idSoldado)
CREATE INDEX IX_CompaniaCuartel ON CompaniaCuartel(idCompaniaCuartel)
CREATE INDEX IX_ServicioSoldado ON ServicioSoldado(idServicioSoldado)

