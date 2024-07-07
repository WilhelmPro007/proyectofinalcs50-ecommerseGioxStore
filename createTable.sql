-- Crear tabla 'cliente'
CREATE TABLE cliente (
    clienteId INTEGER PRIMARY KEY,
    correo TEXT NOT NULL,
    usuario TEXT NOT NULL,
    hash TEXT NOT NULL,
    ultimaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fechaRegistro DATE
);

-- Crear tabla 'categoria'
CREATE TABLE categoria (
    categoriaId INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    descripcion TEXT
);

-- Crear tabla 'producto'
CREATE TABLE producto (
    productoId INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    descripcion TEXT,
    precio DECIMAL NOT NULL,
    cantidadStock INTEGER NOT NULL,
    productoAgregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ultimaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    categoriaId INTEGER,
    FOREIGN KEY (categoriaId) REFERENCES categoria(categoriaId)
);

-- Crear tabla 'carrito'
CREATE TABLE factura (
    facturaId INTEGER PRIMARY KEY,
    clienteId INTEGER,
    facturaCreada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (clienteId) REFERENCES cliente(clienteId)
);

-- Crear tabla 'articulo_carrito'
CREATE TABLE detalleVenta (
    detalleVentaId INTEGER,
    productoId INTEGER,
    facturaId INTEGER,
    cantidad INTEGER NOT NULL,
    detalleCreado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (detalleVentaId, productoId),
    FOREIGN KEY (facturaId) REFERENCES factura(facturaId),
    FOREIGN KEY (productoId) REFERENCES producto(productoId)
);