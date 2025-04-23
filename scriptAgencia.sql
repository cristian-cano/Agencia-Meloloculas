drop database AgenciaViajes;
create database AgenciaViajes;
use AgenciaViajes;

CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    rol_id INT,
    FOREIGN KEY (rol_id) REFERENCES roles(id)
);

CREATE TABLE proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo ENUM('hotel', 'aerolinea') NOT NULL,
    contacto VARCHAR(100)
);


CREATE TABLE hoteles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion TEXT,
    estrellas INT,
    proveedor_id INT,
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
);


CREATE TABLE habitaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id INT,
    tipo VARCHAR(50),
    capacidad INT,
    precio DECIMAL(10,2),
    FOREIGN KEY (hotel_id) REFERENCES hoteles(id)
);


CREATE TABLE aeropuertos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(100),
    codigo VARCHAR(10) UNIQUE
);

CREATE TABLE vuelos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_vuelo VARCHAR(20) UNIQUE,
    origen_id INT,
    destino_id INT,
    proveedor_id INT,
    fecha_salida DATETIME,
    fecha_llegada DATETIME,
    asientos_disponibles INT,
    precio DECIMAL(10,2),
    FOREIGN KEY (origen_id) REFERENCES aeropuertos(id),
    FOREIGN KEY (destino_id) REFERENCES aeropuertos(id),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
);

CREATE TABLE paquetes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio_total DECIMAL(10,2),
    hotel_id INT,
    vuelo_id INT,
    FOREIGN KEY (hotel_id) REFERENCES hoteles(id),
    FOREIGN KEY (vuelo_id) REFERENCES vuelos(id)
);

CREATE TABLE promociones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descuento DECIMAL(5,2),
    fecha_inicio DATE,
    fecha_fin DATE,
    paquete_id INT,
    FOREIGN KEY (paquete_id) REFERENCES paquetes(id)
);

CREATE TABLE reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    paquete_id INT,
    fecha_reserva DATE,
    estado ENUM('pendiente', 'confirmada', 'cancelada'),
    total_pago DECIMAL(10,2),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (paquete_id) REFERENCES paquetes(id)
);


CREATE TABLE pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reserva_id INT,
    fecha_pago DATETIME,
    monto DECIMAL(10,2),
    metodo_pago VARCHAR(50),
    estado_pago ENUM('exitoso', 'rechazado'),
    FOREIGN KEY (reserva_id) REFERENCES reservas(id) ON DELETE CASCADE
);
