USE master;
GO
IF DB_ID (N'Paqueteria') IS NOT NULL
DROP DATABASE Paqueteria;
CREATE DATABASE Paqueteria
ON
( NAME = Paqueteria_dat,
    FILENAME = 'C:\samples\Paqueteria.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 )
LOG ON
( NAME = Paqueteria_log,
    FILENAME = 'C:\samples\Paqueteria.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB ) ;
GO
USE Paqueteria;
GO
CREATE TABLE Aduana
(
idAduana INT NOT NULL,
descripcion VARCHAR NOT NULL,
codigo VARCHAR NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Almacen
(
idAlmacen INT NOT NULL,
espaciosDisponibles VARCHAR NOT NULL,
productos VARCHAR NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Camion
(
idCamion INT NOT NULL,
Modelo VARCHAR NOT NULL,
Marca VARCHAR NOT NULL,
Matricula VARCHAR NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Camionero
(
idCamionero INT NOT NULL,
idCamion INT NOT NULL,
Nombre VARCHAR NOT NULL,
Apellido VARCHAR NOT NULL,
rfc VARCHAR NOT NULL,
telefono VARCHAR NOT NULL,
Direccion VARCHAR NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Categoria
(
idCategoria INT NOT NULL,
descripcion VARCHAR NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Cliente
(
idCliente INT NOT NULL,
nombre VARCHAR NOT NULL,
apellido VARCHAR NOT NULL,
direccion VARCHAR NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Embalaje
(
idEmbalaje INT NOT NULL,
idPaquete INT NOT NULL,
descripcion VARCHAR NOT NULL,
fecha DATETIME NOT NULL,
codigo VARCHAR NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Paquete
(
idPaquete INT NOT NULL,
idProveedor INT NOT NULL,
idAlmacen INT NOT NULL,
idSucursal INT NOT NULL,
idVentaProducto INT NOT NULL,
idCamionero INT NOT NULL,
descripcion VARCHAR NOT NULL,
destinatario VARCHAR NOT NULL,
codigo VARCHAR NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Proveedor
(
idProveedor INT NOT NULL,
Nombre VARCHAR NOT NULL,
rfc VARCHAR NOT NULL,
descripcion VARCHAR NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Sucursal
(
idSucursal INT NOT NULL,
codigo VARCHAR NOT NULL,
descripcion VARCHAR NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE VentaProducto
(
idVentaProducto INT NOT NULL,
idCliente INT NOT NULL,
idCamionero INT NOT NULL,
descripcion VARCHAR NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE AduanaPaquete
(
idAduanaPaquete INT NOT NULL,
idPaquete INT NOT NULL,
idAduana INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE CategoriaPaquete
(
idCategoriaPaquete INT NOT NULL,
idCategoria INT NOT NULL,
idPaquete INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO

--LlavesPrimarias
ALTER TABLE Aduana ADD CONSTRAINT PK_Aduana PRIMARY KEY(idAduana)
ALTER TABLE Almacen ADD CONSTRAINT PK_Almacen PRIMARY KEY(idAlmacen)
ALTER TABLE Camion ADD CONSTRAINT PK_Camion PRIMARY KEY(idCamion)
ALTER TABLE Camionero ADD CONSTRAINT PK_Camionero PRIMARY KEY(idCamionero)
ALTER TABLE Categoria ADD CONSTRAINT PK_Categoria PRIMARY KEY(idCategoria)
ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY(idCliente)
ALTER TABLE Embalaje ADD CONSTRAINT PK_Embalaje PRIMARY KEY(idEmbalaje)
ALTER TABLE Paquete ADD CONSTRAINT PK_Paquete PRIMARY KEY(idPaquete)
ALTER TABLE Proveedor ADD CONSTRAINT PK_Proveedor PRIMARY KEY(idProveedor)
ALTER TABLE Sucursal ADD CONSTRAINT PK_Sucursal PRIMARY KEY(idSucursal)
ALTER TABLE VentaProducto ADD CONSTRAINT PK_VentaProducto PRIMARY KEY(idVentaProducto)
ALTER TABLE AduanaPaquete ADD CONSTRAINT PK_AduanaPaquete PRIMARY KEY(idAduanaPaquete)
ALTER TABLE CategoriaPaquete ADD CONSTRAINT PK_CategoriaPaquete PRIMARY KEY(idCategoriaPaquete)

--Llaves Foranea
--Camionero
ALTER TABLE Camionero ADD CONSTRAINT FK_CamioneroCamion FOREIGN KEY(idCamion) REFERENCES Camion(idCamion)
--Embalaje
ALTER TABLE Embalaje ADD CONSTRAINT FK_EmbalajePaquete FOREIGN KEY(idPaquete) REFERENCES Paquete(idPaquete)
--Paquete
ALTER TABLE Paquete ADD CONSTRAINT FK_PaqueteProveedor FOREIGN KEY(idProveedor) REFERENCES Proveedor(idProveedor)
ALTER TABLE Paquete ADD CONSTRAINT FK_PaqueteAlmacen FOREIGN KEY(idAlmacen) REFERENCES Almacen(idAlmacen)
ALTER TABLE Paquete ADD CONSTRAINT FK_PaqueteSucursal FOREIGN KEY(idSucursal) REFERENCES Sucursal(idSucursal)
ALTER TABLE Paquete ADD CONSTRAINT FK_PaqueteVentaProducto FOREIGN KEY(idVentaProducto) REFERENCES VentaProducto(idVentaProducto)
ALTER TABLE Paquete ADD CONSTRAINT FK_PaqueteCamionero FOREIGN KEY(idCamionero) REFERENCES Camionero(idCamionero)
--VentaProducto
ALTER TABLE VentaProducto ADD CONSTRAINT FK_VentaProductoCliente FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente)
ALTER TABLE VentaProducto ADD CONSTRAINT FK_VentaProductoCamionero FOREIGN KEY(idCamionero) REFERENCES Camionero(idCamionero)
--AduanaPaquete
ALTER TABLE AduanaPaquete ADD CONSTRAINT FK_AduanaPaquetePaquete FOREIGN KEY(idPaquete) REFERENCES Paquete(idPaquete)
ALTER TABLE AduanaPaquete ADD CONSTRAINT FK_AduanaPaqueteAduana FOREIGN KEY(idAduana) REFERENCES Aduana(idAduana)
--CategoriaPaquete
ALTER TABLE CategoriaPaquete ADD CONSTRAINT FK_CategoriPaquetePaquete FOREIGN KEY(idPaquete) REFERENCES Paquete(idPaquete)
ALTER TABLE CategoriaPaquete ADD CONSTRAINT FK_CategoriaPaqueteCategoria FOREIGN KEY(idCategoria) REFERENCES Categoria(idCategoria)

--Indices
CREATE INDEX TX_Aduana ON Aduana(idAduana)
CREATE INDEX TX_Almacen ON Almacen(idAlmacen)
CREATE INDEX TX_Camion ON Camion(idCamion)
CREATE INDEX TX_Camionero ON Camionero(idCamionero)
CREATE INDEX TX_Categoria ON Categoria(idCategoria)
CREATE INDEX TX_Cliente ON Cliente(idCliente)
CREATE INDEX TX_Embalaje ON Embalaje(idEmbalaje)
CREATE INDEX TX_Paquete ON Paquete(idPaquete)
CREATE INDEX TX_Proveedor ON Proveedor(idProveedor)
CREATE INDEX TX_Sucursal ON Sucursal(idSucursal)
CREATE INDEX TX_VentaProducto ON VentaProducto(idVentaProducto)
CREATE INDEX TX_CategoriaPaquete ON CategoriaPaquete(idCategoriaPaquete)