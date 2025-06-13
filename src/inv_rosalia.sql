CREATE DATABASE IF NOT EXISTS inv_rosalia;
USE inv_rosalia;

-- Tabla cliente
CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    documento VARCHAR(30) NOT NULL,
    identificacion CHAR(30) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(100) NOT NULL
);

-- Tabla categoria
CREATE TABLE categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla color
CREATE TABLE color (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla tipo
CREATE TABLE tipo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

-- Tabla almacen
CREATE TABLE almacen (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    cantidad INT NOT NULL,
    precio_unidad FLOAT NOT NULL,
    color_id INT NOT NULL,
    tipo_id INT NOT NULL,
    categoria_id INT NOT NULL,
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (tipo_id) REFERENCES tipo(id),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

-- Tabla ventas
CREATE TABLE ventas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    estado_pago VARCHAR(50) NOT NULL,
    fecha_entrega DATE NOT NULL,
    fecha_contrato DATE NOT NULL,
    moneda VARCHAR(45) NOT NULL,
    monto FLOAT NOT NULL,
    metodo_pago VARCHAR(45) NOT NULL,
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

-- Tabla produccion
CREATE TABLE produccion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    estado_prenda VARCHAR(45) NOT NULL,
    metraje FLOAT NOT NULL,
    nombre_prenda VARCHAR(45) NOT NULL,
    almacen_id INT NOT NULL,
    ventas_id INT NOT NULL,
    FOREIGN KEY (almacen_id) REFERENCES almacen(id),
    FOREIGN KEY (ventas_id) REFERENCES ventas(id)
);

-- Tabla medidas
CREATE TABLE medidas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    busto VARCHAR(100) NOT NULL,
    seno VARCHAR(100) NOT NULL,
    cintura VARCHAR(100) NOT NULL,
    largo_brazo VARCHAR(100) NOT NULL,
    contorno_brazo VARCHAR(100) NOT NULL,
    contorno_pierna VARCHAR(100) NOT NULL,
    contorno_cuello VARCHAR(45) NOT NULL,
    espalda VARCHAR(45) NOT NULL,
    alto_cintura VARCHAR(45) NOT NULL,
    alto_cadera VARCHAR(45) NOT NULL,
    largo_prenda_inferior VARCHAR(45) NOT NULL,
    largo_prenda_superior VARCHAR(45) NOT NULL,
    sisas VARCHAR(45) NOT NULL,
    produccion_id INT NOT NULL,
    FOREIGN KEY (produccion_id) REFERENCES produccion(id)
);

-- Tabla contabilidad
CREATE TABLE contabilidad (
    id INT PRIMARY KEY AUTO_INCREMENT,
    confecciones_finalizadas VARCHAR(45) NOT NULL,
    cantidad_confecciones FLOAT NOT NULL,
    gastos_total FLOAT NOT NULL,
    ventas_total FLOAT NOT NULL,
    ganancias FLOAT NOT NULL,
    prenda_mas_vendida VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL
);