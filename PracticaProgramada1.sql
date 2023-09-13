--- Creación de la base de datos
CREATE DATABASE PracticaProgramada
go

--- Uso de la base
use PracticaProgramada

--- Creación de tablas para cada entidad 

CREATE TABLE Territorio (
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    provincia VARCHAR(50) NOT NULL,
    canton VARCHAR(50) NOT NULL,
    distrito VARCHAR(50) NOT NULL
)

CREATE TABLE Proveedor (
    cedula VARCHAR(20) NOT NULL PRIMARY KEY,
    tipocedula BINARY NOT NULL,
	nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(30),
    telefono VARCHAR(20),
    idTerritorio INT NOT NULL, 
    CONSTRAINT FK_TERRITORIO FOREIGN KEY (idTerritorio) REFERENCES Territorio(ID)
)


CREATE TABLE Categoria (
    ID INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(30) NOT NULL
)

CREATE TABLE Subcategoria (
    ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    nombre VARCHAR(30) NOT NULL,
	idcategoria INT NOT NULL,
	CONSTRAINT FK_CATEGORIA FOREIGN KEY (idcategoria) REFERENCES Categoria(ID)
)

CREATE TABLE Cliente (
    ID INT PRIMARY KEY IDENTITY(1,1),
    cedula VARCHAR(30) NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    direccionfisica VARCHAR(200) NOT NULL,
    correoelectronico VARCHAR(40) NOT NULL
)

CREATE TABLE Producto (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
    IDUniversal VARCHAR(15) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    precio FLOAT NOT NULL,
    tamano VARCHAR(30) NOT NULL,
    color VARCHAR(15) NOT NULL,
	idProveedor VARCHAR(20) NOT NULL,
	idSubcategoria INT NOT NULL, 
	CONSTRAINT FK_PROVEEDOR FOREIGN KEY (idProveedor) REFERENCES Proveedor(cedula),
	CONSTRAINT FK_SUBCATEGORIA FOREIGN KEY (idSubcategoria) REFERENCES Subcategoria(ID),
)

CREATE TABLE Factura (
    ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	fechacompra DATE NOT NULL, 
	impuesto FLOAT NOT NULL,  
    descuento FLOAT NOT NULL, 
    unidadescompradas INT NOT NULL, 
	info VARCHAR(50) NOT NULL, 
	precio FLOAT NOT NULL, 
	idCliente INT NOT NULL,  
    CONSTRAINT FK_CLIENTE FOREIGN KEY (idCliente) REFERENCES Cliente(ID),
)

CREATE TABLE detallefactura (
    idProducto INT NOT NULL,
    idFactura INT NOT NULL,
	cantidadproducto INT NOT NULL,
	total FLOAT NOT NULL,
    CONSTRAINT FK_DETALLEPRODUCTO FOREIGN KEY (idProducto) REFERENCES Producto(ProductoID),
    CONSTRAINT FK_DETALLEFACTURA FOREIGN KEY (idFactura) REFERENCES Factura(ID)
);

--- Proveo los datos para cada tabla usando INSERT INTO 

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('San José', 'San José', 'Catedral')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('San José', 'San José', 'Escazú')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('San José', 'Desamparados', 'San Miguel')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('San José', 'Desamparados', 'San Juan de Dios')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Alajuela', 'Alajuela', 'Alajuela')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Alajuela', 'San Carlos', 'Ciudad Quesada')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Alajuela', 'Grecia', 'Grecia')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Alajuela', 'Grecia', 'San Isidro')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Heredia', 'Heredia', 'Heredia')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Heredia', 'Heredia', 'Mercedes')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Heredia', 'Santo Domingo', 'Santo Domingo')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Heredia', 'Santo Domingo', 'San Vicente')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Cartago', 'Cartago', 'Cartago')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Cartago', 'Cartago', 'Oriente')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Cartago', 'La Unión', 'La Unión')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Cartago', 'La Unión', 'Tres Ríos')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Guanacaste', 'Liberia', 'Liberia')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Guanacaste', 'Liberia', 'Mayorga')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Guanacaste', 'Santa Cruz', 'Santa Cruz')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Guanacaste', 'Santa Cruz', 'Bolsón')

INSERT INTO Territorio 
(provincia, canton, distrito)
	VALUES ('Puntarenas', 'Puntarenas', 'Puntarenas')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Puntarenas', 'Puntarenas', 'El Roble')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Puntarenas', 'Golfito', 'Golfito')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Puntarenas', 'Golfito', 'Puerto Jiménez')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Limón', 'Limón', 'Limón')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Limón', 'Limón', 'Valle La Estrella')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Limón', 'Pococí', 'Guápiles')

INSERT INTO Territorio 
	(provincia, canton, distrito)
	VALUES ('Limón', 'Pococí', 'Rita')


INSERT INTO Proveedor (cedula, tipocedula, nombre, correo, telefono, idTerritorio)
VALUES
    ('123456789', 1, 'Dos Pinos S.A.', 'dospinos@example.com', '12345678', 1), 
    ('987654321', 0, 'Coca-Cola Costa Rica', 'cocacola@example.com', '87654321', 4), 
    ('111222333', 1, 'Pura Vida Suppliers', 'puravida@example.com', '85155955', 6), 
    ('444555666', 0, 'Tico Foods', 'ticofoods@example.com', '77777777', 9),
    ('777888999', 1, 'Costa Rica Beverages', 'crbeverages@example.com', '89899999', 14), 
    ('222333444', 0, 'Guanacaste Distributors', 'guanacastedist@example.com', '47487433', 19), 
    ('555666777', 1, 'Puntarenas Importers', 'puntarenasimp@example.com', '25116666', 22), 
    ('888999000', 0, 'Limón Exports', 'limonexports@example.com', '25112728', 27)  


INSERT INTO Categoria (nombre)
VALUES
    ('Electrónica'),
    ('Ropa'),
    ('Hogar'),
    ('Alimentos'),
    ('Juguetes'),
    ('Automotriz'),
    ('Deportes')

INSERT INTO Subcategoria (nombre, idcategoria)
VALUES
    ('Electrónica de Consumo', 1),  
    ('Ropa de Hombre', 2),          
    ('Electrodomésticos', 3),       
    ('Alimentos No Perecederos', 4),
    ('Juguetes Educativos', 5),     
    ('Piezas de Repuesto', 6),      
    ('Equipamiento Deportivo', 7)  

INSERT INTO Cliente (cedula, nombre, direccionfisica, correoelectronico)
VALUES
    ('123456789', 'Ana González', 'Avenida 1, San José', 'ana.gonzalez@example.com'),
    ('987654321', 'Carlos Rodríguez', 'Calle Principal, Alajuela', 'carlos.rodriguez@example.com'),
    ('456789123', 'María Fernández', 'Calle 2, Heredia', 'maria.fernandez@example.com'),
    ('789123456', 'Luis Sánchez', 'Avenida Central, Cartago', 'luis.sanchez@example.com'),
    ('234567890', 'Laura Morales', 'Calle 3, Guanacaste', 'laura.morales@example.com'),
    ('567890123', 'José Pérez', 'Avenida 4, Puntarenas', 'jose.perez@example.com'),
    ('345678912', 'Sofía Ramírez', 'Calle 5, Limón', 'sofia.ramirez@example.com')

INSERT INTO Producto (IDUniversal, nombre, precio, tamano, color, idProveedor, idSubcategoria)
VALUES
    ('A123', 'Televisor LED 55 pulgadas', 599.99, '55x30x5 cm', 'Negro', '123456789', 1),  
    ('B456', 'Laptop HP Envy', 899.00, '13.3 pulgadas', 'Plateado', '987654321', 1),     
    ('C789', 'Refrigeradora Samsung', 799.99, '180x70x70 cm', 'Blanco', '456789123', 2),
    ('D101', 'Teléfono inteligente iPhone 12', 799.00, '6.1 pulgadas', 'Gris Espacial', '789123456', 1), 
    ('E202', 'Lavadora LG', 499.99, '85x60x60 cm', 'Plateado', '234567890', 2),           
    ('F303', 'Tablet Samsung Galaxy Tab', 249.00, '10.1 pulgadas', 'Negro', '567890123', 1),
    ('G404', 'Cámara Canon EOS Rebel', 649.00, '18 MP', 'Negro', '345678912', 3);         

INSERT INTO Factura (fechacompra, impuesto, descuento, unidadescompradas, info, precio, idCliente)
VALUES
    ('2023-09-01', 15.00, 10.00, 3, 'Compra de productos electrónicos', 599.99, 1), 
    ('2023-09-02', 25.00, 5.00, 2, 'Compra de electrodomésticos', 899.00, 2),        
    ('2023-09-03', 10.00, 0.00, 1, 'Compra de teléfono inteligente', 799.00, 3),    
    ('2023-09-04', 20.00, 15.00, 2, 'Compra de lavadora', 499.99, 4),                
    ('2023-09-05', 8.00, 5.00, 1, 'Compra de tablet', 249.00, 5),                  
    ('2023-09-06', 12.00, 8.00, 1, 'Compra de cámara', 649.00, 6);                  


INSERT INTO detallefactura (idProducto, idFactura, cantidadproducto, total)
VALUES
    (1, 1, 2, 1199.98),  
    (2, 1, 1, 899.00),  
    (3, 2, 1, 799.99),   
    (4, 2, 2, 1598.00),  
    (5, 3, 3, 1499.97),  
    (6, 3, 2, 498.00),   
    (7, 4, 1, 649.00);   


--- Consultas

--- ¿Cuánto dinero se ha vendido en total por mes?
SELECT
    MONTH(fechacompra) AS Mes,
    YEAR(fechacompra) AS Año,
    SUM(precio) AS TotalVentas
FROM Factura
GROUP BY YEAR(fechacompra), MONTH(fechacompra)
ORDER BY Año, Mes;


--- ¿Cuántos productos diferentes tiene la empresa?
SELECT COUNT(DISTINCT ProductoID) AS TotalProductosDiferentes
FROM Producto;

--- ¿Cuáles son los proveedores a los que más unidades de productos se les compra?
SELECT
    P.nombre AS Proveedor,
    SUM(DF.cantidadproducto) AS TotalUnidadesCompradas
FROM Proveedor P
INNER JOIN Producto PR ON P.cedula = PR.idProveedor   -- combina registros de dos o más tablas en función de la condición. 
INNER JOIN detallefactura DF ON PR.ProductoID = DF.idProducto
GROUP BY P.nombre
ORDER BY TotalUnidadesCompradas DESC;


--- ¿Cuáles son los clientes a los que más unidades de productos se les vende?
SELECT
    C.nombre AS Cliente,
    SUM(DF.cantidadproducto) AS TotalUnidadesVendidas
FROM Cliente C
INNER JOIN Factura F ON C.ID = F.idCliente
INNER JOIN detallefactura DF ON F.ID = DF.idFactura
GROUP BY C.nombre
ORDER BY TotalUnidadesVendidas DESC;

--- ¿Qué categoría de producto vende menos?

SELECT
    C.nombre AS Categoria,
    COALESCE(SUM(DF.cantidadproducto), 0) AS TotalUnidadesVendidas
FROM Categoria C
LEFT JOIN Subcategoria SC ON C.ID = SC.idcategoria
LEFT JOIN Producto P ON SC.ID = P.idSubcategoria
LEFT JOIN detallefactura DF ON P.ProductoID = DF.idProducto
GROUP BY C.nombre
ORDER BY TotalUnidadesVendidas ASC;

