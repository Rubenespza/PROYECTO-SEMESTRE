USE master;
GO
IF DB_ID (N'Boliche') IS NOT NULL
DROP DATABASE Boliche;
CREATE DATABASE Boliche
ON
( NAME = Boliche_dat,
    FILENAME = 'C:\samples\Boliche.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 )
LOG ON
( NAME = Boliche_log,
    FILENAME = 'C:\samples\Boliche.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB ) ;
GO
USE Boliche;
GO
CREATE TABLE Almacen
(
idAlmacen INT IDENTITY (1,1) NOT NULL,
productos VARCHAR(20) NOT NULL,
slots VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO Almacen(productos, slots) values('pinata', '5')
GO
UPDATE Almacen SET productos = 'Desechables' WHERE idAlmacen = 1
GO
DELETE FROM Almacen WHERE idAlmacen = 1
SELECT *FROM Almacen
GO
CREATE TABLE ApoyoFundaciones
(
idApoyoFundaciones INT IDENTITY(1,1) NOT NULL,
idSucursal INT NOT NULL,
Nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
Matricula VARCHAR(30) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE AreaFumadores
(
idAreaFumadores INT IDENTITY(1,1) NOT NULL,
descripcion VARCHAR (50)NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO AreaFumadores(Descripcion) values('personas')
GO
UPDATE AreaFumadores SET descripcion = 'Se registra todo en orden' WHERE idAreaFumadores = 1
GO
DELETE FROM AreaFumadores WHERE idAreaFumadores = 1
SELECT *FROM AreaFumadores
GO
CREATE TABLE AreaSocial
(
idAreaSocial INT IDENTITY(1,1) NOT NULL,
idApoyoFundaciones INT NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Bar
(
idBar INT IDENTITY(1,1) NOT NULL,
nombre VARCHAR(20) NOT NULL,
slots VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO Bar(nombre, slots, descripcion) values('Alcohol', '8','Soako')
GO
UPDATE Bar SET nombre = 'Vino' WHERE idBar = 1
GO
DELETE FROM Bar WHERE idBar = 1
SELECT *FROM Bar
GO
CREATE TABLE Basketball
(
idBasketball INT IDENTITY(1,1) NOT NULL,
rondasJugadas VARCHAR(10) NOT NULL,
puntuacion VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
)
GO
INSERT INTO Basketball(rondasJugadas, puntuacion) values('6', '50')
GO
UPDATE Basketball SET rondasJugadas = '3' WHERE idBasketball = 1
GO
DELETE FROM Basketball WHERE idBasketball = 1
SELECT *FROM Basketball
GO
CREATE TABLE Billar
(
idBillar INT IDENTITY(1,1) NOT NULL,
puntuacion VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO Billar(puntuacion) values('20')
GO
UPDATE Billar SET puntuacion = '3' WHERE idBillar = 1
GO
DELETE FROM Billar WHERE idBillar = 1
SELECT *FROM Billar
GO
CREATE TABLE Boleto
(
idBoleto INT IDENTITY(1,1) NOT NULL,
idEmpleado INT NOT NULL,
codigo VARCHAR(15) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
precio VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Camion
(
idCamion INT IDENTITY(1,1) NOT NULL,
modelo VARCHAR(15) NOT NULL,
matricula VARCHAR(10) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO Camion(modelo, matricula) values('DHL','45785')
GO
UPDATE Camion SET modelo = '3' WHERE idCamion = 1
GO
DELETE FROM Camion WHERE idCamion = 1
SELECT *FROM Camion
GO
CREATE TABLE Camionero
(
idCamionero INT IDENTITY(1,1) NOT NULL,
idCamion INT NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Telefono VARCHAR(10) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE CargoEmpleado
(
idCargoEmpleado INT IDENTITY(1,1) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
productosDanados VARCHAR(10) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO CargoEmpleado(descripcion, productosDanados) values('platos rotos', '7')
GO
UPDATE CargoEmpleado SET descripcion = 'vasos rotos' WHERE idCargoEmpleado = 1
GO
DELETE FROM CargoEmpleado WHERE idCargoEmpleado = 1
SELECT *FROM CargoEmpleado
GO
CREATE TABLE Cliente
(
idCliente INT IDENTITY(1,1) NOT NULL,
idBoleto INT NOT NULL,
idMembresia INT NOT NULL,
idReserva INT NOT NULL,
Nombre VARCHAR (20)NOT NULL,
Apellido VARCHAR (20)NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Domiciliacion
(
idDomiciliacion INT IDENTITY(1,1) NOT NULL,
idRestaurante INT NOT NULL,
Direccion VARCHAR(20) NOT NULL,
Codigo VARCHAR(20) NOT NULL,
EntregaPedido VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Empleado
(
idEmpleado INT IDENTITY(1,1) NOT NULL,
idPuesto INT NOT NULL,
idHorario INT NOT NULL,
idRestaurante INT NOT NULL,
idCargoEmpleado INT NOT NULL,
idBar INT NOT NULL,
idSucursal INT NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Apellido VARCHAR(20) NOT NULL,
Rfc VARCHAR(20) NOT NULL,
Direccion VARCHAR(30) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Equipamento
(
idEquipamento INT IDENTITY(1,1)NOT NULL,
talla VARCHAR(10) NOT NULL,
Disponibilidad VARCHAR(30) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
Codigo VARCHAR(15) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO Equipamento(talla, Disponibilidad, Descripcion, Codigo) values('5','4 disponibles','Color Negro','4582')
GO
UPDATE Equipamento SET talla = '3' WHERE idEquipamento = 1
GO
DELETE FROM Equipamento WHERE idEquipamento = 1
SELECT *FROM Equipamento
GO
CREATE TABLE Equipo
(
idEquipo INT IDENTITY(1,1)NOT NULL,
Nombre VARCHAR(50) NOT NULL,
numJugadores VARCHAR(50) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO Equipamento(talla, Disponibilidad, Descripcion, Codigo) values('5','4 disponibles','Color Negro','4582')
GO
UPDATE Equipamento SET talla = '3' WHERE idEquipamento = 1
GO
DELETE FROM Equipamento WHERE idEquipamento = 1
SELECT *FROM Equipamento
GO
CREATE TABLE Estacionamiento
(
idEstacionamiento INT IDENTITY(1,1) NOT NULL,
Disponibilidad VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO Estacionamiento(Disponibilidad) values('Disponible')
GO
UPDATE Estacionamiento SET Disponibilidad = 'NoDisponible' WHERE idEstacionamiento = 1
GO
DELETE FROM Estacionamiento WHERE idEstacionamiento = 1
SELECT *FROM Estacionamiento
GO
CREATE TABLE Eventos
(
idEventos INT IDENTITY(1,1) NOT NULL,
idSucursal INT NOT NULL,
idPremio INT NOT NULL,
idProyeccionDeportes INT NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Fecha VARCHAR(20) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Festejos
(
idFestejos INT IDENTITY(1,1) NOT NULL,
idPaqCumpleanos INT NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Fecha VARCHAR(15) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE HORARIO 
(
idHorario INT IDENTITY(1,1) NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
Turno VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Jugadas
(
idJugadas INT IDENTITY(1,1) NOT NULL,
idTurno INT NOT NULL,
idEquipo INT NOT NULL,
numPartidas VARCHAR(20) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Jugadores
(
idJugadores INT IDENTITY(1,1) NOT NULL,
idTorneo INT NOT NULL,
idMedalla INT NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Apellido VARCHAR(20) NOT NULL,
ApodoEquipo VARCHAR(15) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE MaquinaMonedas
(
idMaquinaMonedas INT IDENTITY(1,1) NOT NULL,
idZonaJuegos INT NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Codigo VARCHAR(15) NOT NULL,
Ganancia VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Membresia
(
idMembresia INT IDENTITY(1,1) NOT NULL,
idSucursal INT NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Matricula VARCHAR(15) NOT NULL,
Vigencia VARCHAR(20) NOT NULL,
Precio VARCHAR(30) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Medalla
(
idMedalla INT IDENTITY(1,1) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO Medalla(descripcion) values('1lUGAR')
GO
UPDATE Medalla SET Descripcion = '2LUGAR' WHERE idMedalla = 1
GO
DELETE FROM Medalla WHERE idMedalla = 1
SELECT *FROM Medalla
GO
CREATE TABLE OrdenCompra
(
idOrdenCompra INT IDENTITY(1,1) NOT NULL,
idSucursal INT NOT NULL,
Nombre VARCHAR(50) NOT NULL,
Codigo VARCHAR(20) NOT NULL,
Fecha VARCHAR(30) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE OrdenEntrega
(
idOrdenEntrega INT IDENTITY(1,1) NOT NULL,
idSucursal INT NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Codigo VARCHAR(15) NOT NULL,
Fecha VARCHAR(30) NOT NULL,
Factura VARCHAR(20) NOT NULL,
Estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE PaqCumpleanos
(
idPaqCumpleanos INT IDENTITY(1,1) NOT NULL,
Nombre VARCHAR(20) NOT NULL,
precio VARCHAR(20) NOT NULL,
codigo VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO PaqCumpleanos(nombre, precio, codigo) values('SuperEspecial', '50','15482')
GO
UPDATE PaqCumpleanos SET nombre = 'Premium' WHERE idPaqCumpleanos = 1
GO
DELETE FROM PaqCumpleanos WHERE idPaqCumpleanos = 1
SELECT *FROM PaqCumpleanos
GO
CREATE TABLE PersonalizacionProd
(
idPersonalizacionProd INT IDENTITY(1,1) NOT NULL,
Nombre VARCHAR(20) NOT NULL,
categoria VARCHAR(30) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
GO
INSERT INTO PersonalizacionProd(nombre, categoria) values('pinata', 'tipoC')
GO
UPDATE PersonalizacionProd SET nombre = 'Maquina' WHERE idPersonalizacionProd = 1
GO
DELETE FROM PersonalizacionProd WHERE idPersonalizacionProd = 1
SELECT *FROM PersonalizacionProd
GO
CREATE TABLE Premio
(
idPremio INT IDENTITY(1,1) NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO Premio(nombre) values('Videojuego')
GO
UPDATE Premio SET nombre = 'Tarjeta Regalo' WHERE idPremio = 1
GO
DELETE FROM Premio WHERE idPremio = 1
SELECT *FROM Premio
GO
CREATE TABLE TarjetaRegalo
(
idTarjetaRegalo INT IDENTITY(1,1) NOT NULL,
CantidadMonto VARCHAR(20) NOT NULL,
codigo VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO TarjetaRegalo(CantidadMonto, codigo) values('50', '58762')
GO
UPDATE TarjetaRegalo SET CantidadMonto = '100' WHERE idTarjetaRegalo = 1
GO
DELETE FROM TarjetaRegalo WHERE idTarjetaRegalo = 1
SELECT *FROM TarjetaRegalo
GO
CREATE TABLE Productos
(
idProductos INT IDENTITY(1,1) NOT NULL,
idVentaProducto INT NOT NULL,
idPersonalizacionProd INT NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Cantidad VARCHAR(20) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
Codigo VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Promocion
(
idPromocion INT IDENTITY(1,1) NOT NULL,
idTemporadas INT NOT NULL,
Fecha VARCHAR(20) NOT NULL,
Descuento VARCHAR(20) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Proveedores
(
idProveedores INT IDENTITY(1,1) NOT NULL,
idSucursal INT NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Rfc VARCHAR(20) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE ProyeccionDeportes
(
idProyeccionDeportes INT IDENTITY(1,1) NOT NULL,
idSucursal INT NOT NULL,
idVideoJuegos INT NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Puesto
(
idPuesto INT IDENTITY(1,1) NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Codigo VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Reserva
(
idReserva INT IDENTITY(1,1) NOT NULL,
Descripcion VARCHAR(30) NOT NULL,
Fecha VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Restaurante
(
idRestaurante INT IDENTITY(1,1) NOT NULL,
ProdDisponible VARCHAR(50) NOT NULL,
Producto VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Resultado
(
idResultado INT IDENTITY(1,1) NOT NULL,
Nombre VARCHAR(50) NOT NULL,
PartidasJugadas VARCHAR(20) NOT NULL,
PuntuajeAlto VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Servicio
(
idServicio INT IDENTITY(1,1) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Sucursal
(
idSucursal INT IDENTITY(1,1) NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Telefono VARCHAR(15) NOT NULL,
Direccion VARCHAR(50) NOT NULL,
Estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE TarjetaPuntos
(
idTarjetaPuntos INT IDENTITY(1,1) NOT NULL,
Fecha VARCHAR(20) NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Temporadas
(
idTemporadas INT IDENTITY(1,1) NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Fecha VARCHAR(20) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO Temporadas(nombre, Fecha, descripcion) values('Hallowen', '30Oct','DiadelTerror')
GO
UPDATE Temporadas SET nombre = 'Navidad' WHERE idTemporadas = 1
GO
DELETE FROM Temporadas WHERE idTemporadas = 1
SELECT *FROM Temporadas
CREATE TABLE TicketEstacionamiento
(
idTicketEstacionamiento INT IDENTITY(1,1) NOT NULL,
codigo VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO TicketEstacionamiento(codigo) values('5421')
GO
UPDATE TicketEstacionamiento SET codigo = '5428' WHERE idTicketEstacionamiento = 1
GO
DELETE FROM TicketEstacionamiento WHERE idTicketEstacionamiento = 1
SELECT *FROM TicketEstacionamiento
GO
CREATE TABLE TiendaRegalos
(
idTiendaRegalos INT IDENTITY(1,1) NOT NULL,
Productos VARCHAR(15) NOT NULL,
ProdDisponibles VARCHAR(20) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
Estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO TiendaRegalos(Productos,ProdDisponibles,Descripcion) values('Peluches','5','Color Azul')
GO
UPDATE TiendaRegalos SET Productos = 'Jugetes' WHERE idTiendaRegalos = 1
GO
DELETE FROM TiendaRegalos WHERE idTiendaRegalos = 1
SELECT *FROM TiendaRegalos
GO
CREATE TABLE Torneo
(
idTorneo INT IDENTITY(1,1)NOT NULL,
idSucursal INT NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
FechaComienzo VARCHAR(30) NOT NULL,
FechaFinalizada VARCHAR(30) NOT NULL,
Estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Turno
(
idTurno INT IDENTITY(1,1) NOT NULL,
Nombre VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO Turno(Nombre) values('Oscar')
GO
UPDATE Turno SET Nombre = 'Ruben' WHERE idTurno = 1
GO
DELETE FROM Turno WHERE idTurno = 1
SELECT *FROM Turno
GO
CREATE TABLE VentaProducto
(
idVentaProducto INT IDENTITY(1,1) NOT NULL,
idCamionero INT NOT NULL,
idAlmacen INT NOT NULL,
Precio VARCHAR(15) NOT NULL,
EstadoProducto VARCHAR(20) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
Estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE Videojuegos
(
idVideojuegos INT IDENTITY(1,1) NOT NULL,
Nombre VARCHAR(30) NOT NULL,
tipoJuego VARCHAR(20) NOT NULL,
FinTiempo VARCHAR(20) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO Videojuegos(Nombre, TipoJuego, FinTiempo) values('LuigiMansion','Horror', '10min')
GO
UPDATE Videojuegos SET Nombre = 'ResidentEvil' WHERE idVideojuegos = 1
GO
DELETE FROM Videojuegos WHERE idVideojuegos = 1
SELECT *FROM Videojuegos
GO
CREATE TABLE ZonaJuegos
(
idZonaJuegos INT IDENTITY(1,1) NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
Estatus BIT DEFAULT 1 NOT NULL
)
GO
INSERT INTO ZonaJuegos(Descripcion) values('Instalaciones Funcionando')
GO
UPDATE ZonaJuegos SET Descripcion = 'Intalaciones Danadas' WHERE idZonaJuegos = 1
GO
DELETE FROM ZonaJuegos WHERE idZonaJuegos = 1
SELECT *FROM ZonaJuegos
GO
CREATE TABLE ProyeccionBSKTB
(
idProyeccionBSKTB INT NOT NULL,
idProyeccionDeportes INT NOT NULL,
idBasketball INT NOT NULL,
Estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE ProyeccionBillar
(
idProyeccionBillar INT NOT NULL,
idProyeccionDeportes INT NOT NULL,
idBillar INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE TarjetaJuegos
(
idTarjetaJuegos INT NOT NULL,
idTarjetaPuntos INT NOT NULL,
idZonaJuegos INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE ZonaJuegosSucursal
(
idZonaJuegosSucursal INT NOT NULL,
idZonaJuegos INT NOT NULL,
idSucursal INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE AlmacenSucursal
(
idAlmacenSucursal INT NOT NULL,
idAlmacen INT NOT NULL,
idSucursal INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE BarSucursal
(
idBarSucursal INT NOT NULL,
idBar INT NOT NULL,
idSucursal INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE PromocionSucursal
(
idPromocionSucursal INT NOT NULL,
idPromocion INT NOT NULL,
idSucursal INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE FestejosPaqCumpleanos
(
idFestejosPaqCumpleanos INT NOT NULL,
idFestejos INT NOT NULL,
idPaqCumpleanos INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE PaqCumpleanosTarjeta
(
idPaqCumpleanosTarjeta INT NOT NULL,
idPaqCumpleanos INT NOT NULL,
idTarjetaRegalo INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE EmpleadoServicio
(
idEmpleadoServicio INT NOT NULL,
idEmpleado INT NOT NULL,
idServicio INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE ResultadoTurno
(
idResultadoTurno INT NOT NULL,
idTurno INT NOT NULL,
idResultado INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE EquipamentoEquipo
(
idEquipamentoEquipo INT NOT NULL,
idEquipamento INT NOT NULL,
idEquipo INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE ClienteJugadas
(
idClienteJugadas INT NOT NULL,
idCliente INT NOT NULL,
idJugadas INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE ClienteOcompra
(
idClienteOcompra INT NOT NULL,
idCliente INT NOT NULL,
idOrdenCompra INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE ClienteOentrega
(
idClienteOentrega INT NOT NULL,
idCliente INT NOT NULL,
idOrdenEntrega INT NOT NULL
)
GO
CREATE TABLE EstacionamientoSucursal
(
idEstacionamientoSucursal INT NOT NULL,
idEstacionamiento INT NOT NULL,
idSucursal INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE EstacionamientoTicket
(
idEstacionamientoTicket INT NOT NULL,
idEstacionamiento INT NOT NULL,
idTicketEstacionamiento INT NOT NULL,  
Estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE AreaFumSucursal
(
idAreaFumSucursal INT NOT NULL,
idAreaFumadores INT NOT NULL,
idSucursal INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE TRegalosSucursal
(
idTRegalosSucursal INT NOT NULL,
idTiendaRegalos INT NOT NULL,
idSucursal INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
CREATE TABLE PromocionFestejos
(
idPromocionFestejos INT NOT NULL,
idPromocion INT NOT NULL,
idFestejos INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
)
GO
--LlavesPrimarias
ALTER TABLE Almacen ADD CONSTRAINT PK_Almacen PRIMARY KEY(idAlmacen)
ALTER TABLE ApoyoFundaciones ADD CONSTRAINT PK_ApoyoFundaciones PRIMARY KEY(idApoyoFundaciones)
ALTER TABLE AreaFumadores ADD CONSTRAINT PK_AreaFumadores PRIMARY KEY(idAreaFumadores)
ALTER TABLE AreaSocial ADD CONSTRAINT PK_AreaSocial PRIMARY KEY(idAreaSocial)
ALTER TABLE Bar ADD CONSTRAINT PK_Bar PRIMARY KEY(idBar)
ALTER TABLE Basketball ADD CONSTRAINT PK_Basketball PRIMARY KEY(idBasketball)
ALTER TABLE Billar ADD CONSTRAINT PK_Billar PRIMARY KEY(idBillar)
ALTER TABLE Boleto ADD CONSTRAINT PK_Boleto PRIMARY KEY(idBoleto)
ALTER TABLE Camion ADD CONSTRAINT PK_Camion PRIMARY KEY(idCamion)
ALTER TABLE Camionero ADD CONSTRAINT PK_Camionero PRIMARY KEY(idCamionero)
ALTER TABLE CargoEmpleado ADD CONSTRAINT PK_CargoEmpleado PRIMARY KEY(idCargoEmpleado)
ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY(idCliente)
ALTER TABLE Domiciliacion ADD CONSTRAINT PK_Domiciliacion PRIMARY KEY(idDomiciliacion)
ALTER TABLE Empleado ADD CONSTRAINT PK_Empleado PRIMARY KEY(idEmpleado)
ALTER TABLE Equipamento ADD CONSTRAINT PK_Equipamento PRIMARY KEY(idEquipamento)
ALTER TABLE Equipo ADD CONSTRAINT PK_Equipo PRIMARY KEY(idEquipo)
ALTER TABLE Estacionamiento ADD CONSTRAINT PK_Estacionamiento PRIMARY KEY(idEstacionamiento)
ALTER TABLE Eventos ADD CONSTRAINT PK_Eventos PRIMARY KEY(idEventos)
ALTER TABLE Festejos ADD CONSTRAINT PK_Festejos PRIMARY KEY(idFestejos)
ALTER TABLE Horario ADD CONSTRAINT PK_Horario PRIMARY KEY(idHorario)
ALTER TABLE Jugadas ADD CONSTRAINT PK_Jugadas PRIMARY KEY(idJugadas)
ALTER TABLE Jugadores ADD CONSTRAINT PK_Jugadores PRIMARY KEY(idJugadores)
ALTER TABLE MaquinaMonedas ADD CONSTRAINT PK_MaquinaMonedas PRIMARY KEY(idMaquinaMonedas)
ALTER TABLE Membresia ADD CONSTRAINT PK_Membresia PRIMARY KEY(idMembresia)
ALTER TABLE Medalla ADD CONSTRAINT PK_Medalla PRIMARY KEY(idMedalla)
ALTER TABLE OrdenCompra ADD CONSTRAINT PK_OrdenCompra PRIMARY KEY(idOrdenCompra)
ALTER TABLE OrdenEntrega ADD CONSTRAINT PK_OrdenEntrega PRIMARY KEY(idOrdenEntrega)
ALTER TABLE PaqCumpleanos ADD CONSTRAINT PK_PaqCumpleanos PRIMARY KEY(idPaqCumpleanos)
ALTER TABLE PersonalizacionProd ADD CONSTRAINT PK_PersonalizacionProd PRIMARY KEY(idPersonalizacionProd)
ALTER TABLE Premio ADD CONSTRAINT PK_Premio PRIMARY KEY(idPremio)
ALTER TABLE TarjetaRegalo ADD CONSTRAINT PK_TarjetaRegalo PRIMARY KEY(idTarjetaRegalo)
ALTER TABLE Productos ADD CONSTRAINT PK_Productos PRIMARY KEY(idProductos)
ALTER TABLE Promocion ADD CONSTRAINT PK_Promocion PRIMARY KEY(idPromocion)
ALTER TABLE Proveedores ADD CONSTRAINT PK_Proveedores PRIMARY KEY(idProveedores)
ALTER TABLE ProyeccionDeportes ADD CONSTRAINT PK_ProyeccionDeportes PRIMARY KEY(idProyeccionDeportes)
ALTER TABLE Puesto ADD CONSTRAINT PK_Puesto PRIMARY KEY(idPuesto)
ALTER TABLE Reserva ADD CONSTRAINT PK_Reserva PRIMARY KEY(idReserva)
ALTER TABLE Restaurante ADD CONSTRAINT PK_Restaurante PRIMARY KEY(idRestaurante)
ALTER TABLE Resultado ADD CONSTRAINT PK_Resultado PRIMARY KEY(idResultado)
ALTER TABLE Servicio ADD CONSTRAINT PK_Servicio PRIMARY KEY(idServicio)
ALTER TABLE Sucursal ADD CONSTRAINT PK_Sucursal PRIMARY KEY(idSucursal)
ALTER TABLE TarjetaPuntos ADD CONSTRAINT PK_TarjetaPuntos PRIMARY KEY(idTarjetaPuntos)
ALTER TABLE Temporadas ADD CONSTRAINT PK_Temporadas PRIMARY KEY(idTemporadas)
ALTER TABLE TicketEstacionamiento ADD CONSTRAINT PK_TicketEstacionamiento PRIMARY KEY(idTicketEstacionamiento)
ALTER TABLE TiendaRegalos ADD CONSTRAINT PK_TiendaRegalos PRIMARY KEY(idTiendaRegalos)
ALTER TABLE Torneo ADD CONSTRAINT PK_Torneo PRIMARY KEY(idTorneo)
ALTER TABLE Turno ADD CONSTRAINT PK_Turno PRIMARY KEY(idTurno)
ALTER TABLE VentaProducto ADD CONSTRAINT PK_VentaProducto PRIMARY KEY(idVentaProducto)
ALTER TABLE VideoJuegos ADD CONSTRAINT PK_VideoJuegos PRIMARY KEY(idVideoJuegos)
ALTER TABLE ZonaJuegos ADD CONSTRAINT PK_ZonaJuegos PRIMARY KEY(idZonaJuegos)
ALTER TABLE ProyeccionBSKTB ADD CONSTRAINT PK_ProyeccionBSKTB PRIMARY KEY(idProyeccionBSKTB)
ALTER TABLE ProyeccionBillar ADD CONSTRAINT PK_ProyeccionBillar PRIMARY KEY(idProyeccionBillar)
ALTER TABLE TarjetaJuegos ADD CONSTRAINT PK_TarjetaJuegos PRIMARY KEY(idTarjetaJuegos)
ALTER TABLE ZonaJuegosSucursal ADD CONSTRAINT PK_ZonaJuegosSucursal PRIMARY KEY(idZonaJuegosSucursal)
ALTER TABLE AlmacenSucursal ADD CONSTRAINT PK_AlmacenSucursal PRIMARY KEY(idAlmacenSucursal)
ALTER TABLE BarSucursal ADD CONSTRAINT PK_BarSucursal PRIMARY KEY(idBarSucursal)
ALTER TABLE PromocionSucursal ADD CONSTRAINT PK_PromocionSucursal PRIMARY KEY(idPromocionSucursal)
ALTER TABLE FestejosPaqCumpleanos ADD CONSTRAINT PK_FestejosPaqCumpleanos PRIMARY KEY(idFestejosPaqCumpleanos)
ALTER TABLE PaqCumpleanosTarjeta ADD CONSTRAINT PK_PaqCumpleanosTarjeta PRIMARY KEY(idPaqCumpleanosTarjeta)
ALTER TABLE EmpleadoServicio ADD CONSTRAINT PK_EmpleadoServicio PRIMARY KEY(idEmpleadoServicio)
ALTER TABLE ResultadoTurno ADD CONSTRAINT PK_ResultadoTurno PRIMARY KEY(idResultadoTurno)
ALTER TABLE EquipamentoEquipo ADD CONSTRAINT PK_EquipamentoEquipo PRIMARY KEY(idEquipamentoEquipo)
ALTER TABLE ClienteJugadas ADD CONSTRAINT PK_ClienteJugadas PRIMARY KEY(idClienteJugadas)
ALTER TABLE ClienteOCompra ADD CONSTRAINT PK_ClienteOCompra PRIMARY KEY(idClienteOCompra)
ALTER TABLE ClienteOEntrega ADD CONSTRAINT PK_ClienteOEntrega PRIMARY KEY(idClienteOEntrega)
ALTER TABLE EstacionamientoSucursal ADD CONSTRAINT PK_EstacionamientoSucursal PRIMARY KEY(idEstacionamientoSucursal)
ALTER TABLE EstacionamientoTicket ADD CONSTRAINT PK_EstacionamientoTicket PRIMARY KEY(idEstacionamientoTicket)
ALTER TABLE AreaFumSucursal ADD CONSTRAINT PK_AreaFumSucursal PRIMARY KEY(idAreaFumSucursal)
ALTER TABLE TRegalosSucursal ADD CONSTRAINT PK_TRegalosSucursal PRIMARY KEY(idTRegalosSucursal)
ALTER TABLE PromocionFestejos ADD CONSTRAINT PK_PromocionFestejos PRIMARY KEY(idPromocionFestejos)


--LlavesForaneas
--ApoyoFundaciones
ALTER TABLE ApoyoFundaciones ADD CONSTRAINT FK_ApoyoFundacionesSucursal FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal)
--AreaSocial
ALTER TABLE AreaSocial ADD CONSTRAINT FK_AreaSocialApoyoFundaciones FOREIGN KEY(idApoyoFundaciones) REFERENCES ApoyoFundaciones(idApoyoFundaciones)
--Boleto
ALTER TABLE Boleto ADD CONSTRAINT FK_BoletoEmpleado FOREIGN KEY(idEmpleado) REFERENCES Empleado(idEmpleado)
--Camionero
ALTER TABLE Camionero ADD CONSTRAINT FK_CamioneroCamion FOREIGN KEY(idCamion) REFERENCES Camion(idCamion)
--Cliente
ALTER TABLE Cliente ADD CONSTRAINT FK_ClienteBoleto FOREIGN KEY(idBoleto) REFERENCES Boleto(idBoleto)
ALTER TABLE Cliente ADD CONSTRAINT FK_ClienteMembresia FOREIGN KEY(idMembresia) REFERENCES Membresia(idMembresia)
ALTER TABLE Cliente ADD CONSTRAINT FK_ClienteReserva FOREIGN KEY(idReserva) REFERENCES Reserva(idReserva)
--Domiciliacion
ALTER TABLE Domiciliacion ADD CONSTRAINT FK_DomiciliacionRestaurante FOREIGN KEY(idRestaurante) REFERENCES Restaurante(idRestaurante)
--Empleado
ALTER TABLE Empleado ADD CONSTRAINT FK_EmpleadoPuesto FOREIGN KEY(idPuesto) REFERENCES Puesto(idPuesto)
ALTER TABLE Empleado ADD CONSTRAINT FK_EmpleadoHorario FOREIGN KEY(idHorario) REFERENCES Horario(idHorario)
ALTER TABLE Empleado ADD CONSTRAINT FK_EmpleadoRestaurante FOREIGN KEY(idRestaurante) REFERENCES Restaurante(idRestaurante)
ALTER TABLE Empleado ADD CONSTRAINT FK_EmpleadoCargoEmpleado FOREIGN KEY(idCargoEmpleado) REFERENCES CargoEmpleado(idCargoEmpleado)
ALTER TABLE Empleado ADD CONSTRAINT FK_EmpleadoBar FOREIGN KEY(idBar) REFERENCES Bar(idBar)
ALTER TABLE Empleado ADD CONSTRAINT FK_EmpleadoSucursal FOREIGN KEY(idSucursal) REFERENCES Sucursal(idSucursal)
--Eventos
ALTER TABLE Eventos ADD CONSTRAINT FK_EventosSucursal FOREIGN KEY(idSucursal) REFERENCES Sucursal(idSucursal)
ALTER TABLE Eventos ADD CONSTRAINT FK_EventosPremio FOREIGN KEY(idPremio) REFERENCES Premio(idPremio)
ALTER TABLE Eventos ADD CONSTRAINT FK_EventosProyeccionDeportes FOREIGN KEY(idProyeccionDeportes) REFERENCES ProyeccionDeportes(idProyeccionDeportes)
--Jugadas
ALTER TABLE Jugadas ADD CONSTRAINT FK_JugadasTurno FOREIGN KEY(idTurno) REFERENCES Turno(idTurno)
ALTER TABLE Jugadas ADD CONSTRAINT FK_JugadasEquipo FOREIGN KEY(idEquipo) REFERENCES Equipo(idEquipo)
--Jugadores
ALTER TABLE Jugadores ADD CONSTRAINT FK_JugadoresTorneo FOREIGN KEY(idTorneo) REFERENCES Torneo(idTorneo)
ALTER TABLE Jugadores ADD CONSTRAINT FK_JugadoresMedalla FOREIGN KEY(idMedalla) REFERENCES Medalla(idMedalla)
--MaquinaMonedas
ALTER TABLE MaquinaMonedas ADD CONSTRAINT FK_MaquinaMonedasZonaJuegos FOREIGN KEY(idZonaJuegos) REFERENCES ZonaJuegos(idZonaJuegos)
--Membresia
ALTER TABLE Membresia ADD CONSTRAINT FK_MembresiaSucursal FOREIGN KEY(idSucursal) REFERENCES Sucursal(idSucursal)
--OrdenCompra
ALTER TABLE OrdenCompra ADD CONSTRAINT FK_OrdenCompraSucursal FOREIGN KEY(idSucursal) REFERENCES Sucursal(idSucursal)
--OrdenEntrega
ALTER TABLE OrdenEntrega ADD CONSTRAINT FK_OrdenEntregaSucursal FOREIGN KEY(idSucursal) REFERENCES Sucursal(idSucursal)
--Productos
ALTER TABLE Productos ADD CONSTRAINT FK_ProductosVentaProducto FOREIGN KEY(idVentaProducto) REFERENCES VentaProducto(idVentaProducto)
ALTER TABLE Productos ADD CONSTRAINT FK_ProductosPersonalizacionProd FOREIGN KEY(idPersonalizacionProd) REFERENCES PersonalizacionProd(idPersonalizacionProd)
--Promocion
ALTER TABLE Promocion ADD CONSTRAINT FK_PromocionTemporadas FOREIGN KEY(idTemporadas) REFERENCES Temporadas(idTemporadas)

--Proveedores
ALTER TABLE Proveedores ADD CONSTRAINT FK_ProveedoresSucursal FOREIGN KEY(idSucursal) REFERENCES Sucursal(idSucursal)
--ProyeccionDeportes
ALTER TABLE ProyeccionDeportes ADD CONSTRAINT FK_ProyeccionDeportesVideoJuegos FOREIGN KEY(idVideojuegos) REFERENCES Videojuegos(idVideojuegos)
--Torneo
ALTER TABLE Torneo ADD CONSTRAINT FK_TorneoSucursal FOREIGN KEY(idSucursal) REFERENCES Sucursal(idSucursal)
--VentaProducto
ALTER TABLE VentaProducto ADD CONSTRAINT FK_VentaProductoCamionero FOREIGN KEY(idCamionero) REFERENCES Camionero(idCamionero)
ALTER TABLE VentaProducto ADD CONSTRAINT FK_VentaProductoAlmacen FOREIGN KEY(idAlmacen) REFERENCES Almacen(idAlmacen)
--ProyeccionBSKTB
ALTER TABLE ProyeccionBSKTB ADD CONSTRAINT FK_ProyeccionBSKTBProyeccionDeportes FOREIGN KEY(idProyeccionDeportes) REFERENCES ProyeccionDeportes(idProyeccionDeportes)
ALTER TABLE ProyeccionBSKTB ADD CONSTRAINT FK_ProyeccionBSKTBBasketball FOREIGN KEY(idBasketball) REFERENCES Basketball(idBasketball)

--ProyeccionBillar
ALTER TABLE ProyeccionBillar ADD CONSTRAINT FK_ProyeccionBillarBillar FOREIGN KEY(idBillar) REFERENCES Billar(idBillar)
ALTER TABLE ProyeccionBillar ADD CONSTRAINT FK_ProyeccionBillarProyeccionDeportes FOREIGN KEY(idProyeccionDeportes) REFERENCES ProyeccionDeportes(idProyeccionDeportes)

--TarjetaJuegos
ALTER TABLE TarjetaJuegos ADD CONSTRAINT FK_TarjetaJuegosTarjetaPuntos FOREIGN KEY(idTarjetaPuntos) REFERENCES TarjetaPuntos(idTarjetaPuntos)
ALTER TABLE TarjetaJuegos ADD CONSTRAINT FK_TarjetaJuegosZonaJuegos FOREIGN KEY(idZonaJuegos) REFERENCES ZonaJuegos(idZonaJuegos)

--ZonaJuegosSucursal
ALTER TABLE ZonaJuegosSucursal ADD CONSTRAINT FK_ZonaJuegosSucursalZonaJuegos FOREIGN KEY(idZonaJuegos) REFERENCES ZonaJuegos(idZonaJuegos)
ALTER TABLE ZonaJuegosSucursal ADD CONSTRAINT FK_ZonaJuegosSucursalSucursal FOREIGN KEY(idSucursal) REFERENCES Sucursal (idSucursal)

--AlmacenSucursal
ALTER TABLE AlmacenSucursal ADD CONSTRAINT FK_AlmacenSucursalAlmacen FOREIGN KEY(idAlmacen) REFERENCES Almacen(idAlmacen)
ALTER TABLE AlmacenSucursal ADD CONSTRAINT FK_AlmacenSucursalSucursal FOREIGN KEY(idSucursal) REFERENCES Sucursal(idSucursal)
--BarSucursal
ALTER TABLE BarSucursal ADD CONSTRAINT FK_BarSucursalBar FOREIGN KEY(idBar) REFERENCES Bar(idBar)
ALTER TABLE BarSucursal ADD CONSTRAINT FK_BarSucursalSucursal FOREIGN KEY(idSucursal) REFERENCES Sucursal(idSucursal)
--PromocionSucursal
ALTER TABLE PromocionSucursal ADD CONSTRAINT FK_PromocionSucursalPromocion FOREIGN KEY(idPromocion) REFERENCES Promocion(idPromocion)
ALTER TABLE PromocionSucursal ADD CONSTRAINT FK_PromocionSucursalSucursal FOREIGN KEY(idSucursal) REFERENCES Sucursal(idSucursal)
--FestejosPaqCumpleaños
ALTER TABLE FestejosPaqCumpleanos ADD CONSTRAINT FK_FestejosPaqCumpleanosFestejos FOREIGN KEY(idFestejos) REFERENCES Festejos(idFestejos)
ALTER TABLE FestejosPaqCumpleanos ADD CONSTRAINT FK_FestejosPaqCumpleanosPaqCumpleanos FOREIGN KEY(idPaqCumpleanos) REFERENCES PaqCumpleanos(idPaqCumpleanos)
--PaqCumpleanosTarjeta
ALTER TABLE PaqCumpleanosTarjeta ADD CONSTRAINT FK_PaqCumpleanosTarjetaPaqCumpleanos FOREIGN KEY(idPaqCumpleanos) REFERENCES PaqCumpleanos(idPaqCumpleanos)
ALTER TABLE PaqCumpleanosTarjeta ADD CONSTRAINT FK_PaqCumpleanosTarjetaTarjeta FOREIGN KEY(idTarjetaRegalo) REFERENCES TarjetaRegalo(idTarjetaRegalo)
--EmpleadoServicio
ALTER TABLE EmpleadoServicio ADD CONSTRAINT FK_EmpleadoServicioEmpleado FOREIGN KEY(idEmpleado) REFERENCES Empleado(idEmpleado)
ALTER TABLE EmpleadoServicio ADD CONSTRAINT FK_EmpleadoServicioServicio FOREIGN KEY(idServicio) REFERENCES Servicio(idServicio)
--ResultadoTurno
ALTER TABLE ResultadoTurno ADD CONSTRAINT FK_ResultadoTurnoResultado FOREIGN KEY(idResultado) REFERENCES Resultado(idResultado)
ALTER TABLE ResultadoTurno ADD CONSTRAINT FK_ResultadoTurnoTurno FOREIGN KEY(idTurno) REFERENCES Turno(idTurno)
--EquipamentoEquipo
ALTER TABLE EquipamentoEquipo ADD CONSTRAINT FK_EquipamentoEquipoEquipamento FOREIGN KEY(idEquipamento) REFERENCES Equipamento(idEquipamento)
ALTER TABLE EquipamentoEquipo ADD CONSTRAINT FK_EquipamentoEquipoEquipo FOREIGN KEY(idEquipo) REFERENCES Equipo(idEquipo)
--ClienteJugadas
ALTER TABLE ClienteJugadas ADD CONSTRAINT FK_ClienteJugadasCliente FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente)
ALTER TABLE ClienteJugadas ADD CONSTRAINT FK_ClienteJugadasJugadas FOREIGN KEY(idJugadas) REFERENCES Jugadas(idJugadas)
--ClienteOcompra
ALTER TABLE ClienteOcompra ADD CONSTRAINT FK_ClienteOcompraCliente FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente)
ALTER TABLE ClienteOcompra ADD CONSTRAINT FK_ClienteOcompraOcompra FOREIGN KEY(idOrdenCompra) REFERENCES OrdenCompra(idOrdenCompra)
--ClienteOEntrega
ALTER TABLE ClienteOEntrega ADD CONSTRAINT FK_ClienteOEntregaCliente FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente)
ALTER TABLE ClienteOEntrega ADD CONSTRAINT FK_ClienteOEntregaOrdenEntrega FOREIGN KEY(idOrdenEntrega) REFERENCES OrdenEntrega(idOrdenEntrega)
--EstacionamientoSurcusal
ALTER TABLE EstacionamientoSucursal ADD CONSTRAINT FK_EstacionamientoSurcusalEstacionamiento FOREIGN KEY(idEstacionamiento) REFERENCES Estacionamiento(idEstacionamiento)
ALTER TABLE EstacionamientoSucursal ADD CONSTRAINT FK_EstacionamientoSurcusalSucursal FOREIGN KEY(idSucursal) REFERENCES Sucursal(idSucursal)
--EstacionamientoTicket
ALTER TABLE EstacionamientoTicket ADD CONSTRAINT FK_EstacionamientoTicketEstacionamiento FOREIGN KEY(idEstacionamiento) REFERENCES Estacionamiento(idEstacionamiento)
ALTER TABLE EstacionamientoTicket ADD CONSTRAINT FK_EstacionamientoTicketTicket FOREIGN KEY(idticketEstacionamiento) REFERENCES ticketEstacionamiento(idticketEstacionamiento)
--AreaFumSucursal
ALTER TABLE AreaFumSucursal ADD CONSTRAINT FK_AreaFumSucursalAreaFumadores FOREIGN KEY(idAreaFumadores) REFERENCES AreaFumadores(idAreaFumadores)
ALTER TABLE AreaFumSucursal ADD CONSTRAINT FK_AreaFumSucursalSucursal FOREIGN KEY(idSucursal) REFERENCES Sucursal(idSucursal)
--TRegalosSucursal
ALTER TABLE TRegalosSucursal ADD CONSTRAINT FK_TRegalosSucursalTiendaRegalos FOREIGN KEY(idTiendaRegalos) REFERENCES TiendaRegalos(idTiendaRegalos)
ALTER TABLE TRegalosSucursal ADD CONSTRAINT FK_TRegalosSucursalSucursal FOREIGN KEY(idSucursal) REFERENCES Sucursal(idSucursal)
--PromocionFestejos
ALTER TABLE PromocionFestejos ADD CONSTRAINT FK_PromocionFestejosPromocion FOREIGN KEY(idPromocion) REFERENCES Promocion(idPromocion)
ALTER TABLE PromocionFestejos ADD CONSTRAINT FK_PromocionFestejosFestejos FOREIGN KEY(idFestejos) REFERENCES Festejos(idFestejos)




--Indices
CREATE INDEX TX_Almacen ON Almacen(idAlmacen)
CREATE INDEX TX_ApoyoFundaciones ON ApoyoFundaciones(idApoyoFundaciones)
CREATE INDEX TX_AreaFumadores ON AreaFumadores(idAreaFumadores)
CREATE INDEX TX_AreaSocial ON  AreaSocial(idAreaSocial)
CREATE INDEX TX_Bar ON Bar(idBar)
CREATE INDEX TX_Basketball ON Basketball(idBasketball)
CREATE INDEX TX_Billar ON Billar(idBillar)
CREATE INDEX TX_Boleto ON Boleto(idBoleto)
CREATE INDEX TX_Camion ON Camion(idCamion)
CREATE INDEX TX_Camionero ON Camionero(idCamionero)
CREATE INDEX TX_CargoEmpleado ON CargoEmpleado(idCargoEmpleado)
CREATE INDEX TX_Cliente ON Cliente(idCliente)
CREATE INDEX TX_Domiciliacion ON Domiciliacion(idDomiciliacion)
CREATE INDEX TX_Empleado ON Empleado(idEmpleado)
CREATE INDEX TX_Equipamento ON Equipamento(idEquipamento)
CREATE INDEX TX_Equipo ON Equipo(idEquipo)
CREATE INDEX TX_Estacionamiento ON Estacionamiento(idEstacionamiento)
CREATE INDEX TX_Eventos ON Eventos(idEventos)
CREATE INDEX TX_Festejos ON Festejos(idFestejos)
CREATE INDEX TX_Horari ON Horario(idHorario)
CREATE INDEX TX_Jugadas ON Jugadas(idJugadas)
CREATE INDEX TX_Jugadores ON Jugadores(idJugadores)
CREATE INDEX TX_MaquinaMonedas ON MaquinaMonedas(idMaquinaMonedas)
CREATE INDEX TX_Membresia ON Membresia(idMembresia)
CREATE INDEX TX_Medalla ON Medalla(idMedalla)
CREATE INDEX TX_OrdenCompra ON OrdenCompra(idOrdenCompra)
CREATE INDEX TX_OrdenEntrega ON OrdenEntrega(idOrdenEntrega)
CREATE INDEX TX_PaqCumpleanos ON PaqCumpleanos(idPaqCumpleanos)
CREATE INDEX TX_PersonalizacionProd ON PersonalizacionProd(idPersonalizacionProd)
CREATE INDEX TX_Premio ON Premio(idPremio)
CREATE INDEX TX_TarjetaRegalo ON TarjetaRegalo(idTarjetaRegalo)
CREATE INDEX TX_Productos ON Productos(idProductos)
CREATE INDEX TX_Promocion ON Promocion(idPromocion)
CREATE INDEX TX_Proveedores ON Proveedores(idProveedores)
CREATE INDEX TX_ProyeccionDeportes ON ProyeccionDeportes(idProyeccionDeportes)
CREATE INDEX TX_Puesto ON Puesto(idPuesto)
CREATE INDEX TX_Reserva ON Reserva(idReserva)
CREATE INDEX TX_Restaurante ON Restaurante(idRestaurante)
CREATE INDEX TX_Resultado ON Resultado(idResultado)
CREATE INDEX TX_Servicio ON Servicio(idServicio)
CREATE INDEX TX_Sucursal ON Sucursal(idSucursal)
CREATE INDEX TX_TarjetaPuntos ON TarjetaPuntos(idTarjetaPuntos)
CREATE INDEX TX_Temporadas ON Temporadas(idTemporadas)
CREATE INDEX TX_TicketEstacionamiento ON TicketEstacionamiento(idTicketEstacionamiento)
CREATE INDEX TX_TiendaRegalos ON TiendaRegalos(idTiendaRegalos)
CREATE INDEX TX_Torneo ON Torneo(idTorneo)
CREATE INDEX TX_Turno ON Turno(idTurno)
CREATE INDEX TX_VentaProducto ON VentaProducto(idVentaProducto)
CREATE INDEX TX_VideoJuegos ON VideoJuegos(idVideoJuegos)
CREATE INDEX TX_ZonaJuegos ON ZonaJuegos(idZonaJuegos)
CREATE INDEX TX_ProyeccionBSKTB ON ProyeccionBSKTB(idProyeccionBSKTB)
CREATE INDEX TX_ProyeccionBillar ON ProyeccionBillar(idProyeccionBillar)
CREATE INDEX TX_TarjetaJuegos ON TarjetaJuegos(idTarjetaJuegos)
CREATE INDEX TX_ZonaJuegosSucursal ON ZonaJuegosSucursal(idZonaJuegosSucursal)
CREATE INDEX TX_AlmacenSucursal ON AlmacenSucursal(idAlmacenSucursal)
CREATE INDEX TX_BarSucursal ON BarSucursal(idBarSucursal)
CREATE INDEX TX_PromocionSucursal ON PromocionSucursal(idPromocionSucursal)
CREATE INDEX TX_FestejosPaqCumpleanos ON FestejosPaqCumpleanos(idFestejosPaqCumpleanos)
CREATE INDEX TX_PaqCumpleanosTarjeta ON PaqCumpleanosTarjeta(idPaqCumpleanosTarjeta)
CREATE INDEX TX_EmpleadoServicio ON EmpleadoServicio(idEmpleadoServicio)
CREATE INDEX TX_ResultadoTurno ON ResultadoTurno(idResultadoTurno)
CREATE INDEX TX_EquipamentoEquipo ON EquipamentoEquipo(idEquipamentoEquipo)
CREATE INDEX TX_ClienteJugadas ON ClienteJugadas(idClienteJugadas)
CREATE INDEX TX_ClienteOcompra ON ClienteOcompra(idClienteOcompra)
CREATE INDEX TX_ClienteOEntrega ON ClienteOEntrega(idClienteOEntrega)
CREATE INDEX TX_EstacionamientoSucursal ON EstacionamientoSucursal(idEstacionamientoSucursal)
CREATE INDEX TX_EstacionamientoTicket ON EstacionamientoTicket(idEstacionamientoTicket)
CREATE INDEX TX_AreaFumSucursal ON AreaFumSucursal(idAreaFumSucursal)
CREATE INDEX TRegalosSucursal ON TRegalosSucursal(idTRegalosSucursal)









































