INSERT INTO roles (nombre) VALUES ('Cliente'), ('Agente'), ('Proveedor'), ('Administrador');

INSERT INTO usuarios (nombre, correo, contraseña, rol_id)
VALUES ('Juan Pérez', 'juanperez@email.com', 'clave123', 1),
       ('María Gómez', 'maria.gomez@email.com', 'pass456', 2);

INSERT INTO proveedores (nombre, tipo, contacto)
VALUES ('Hotel Caribe', 'hotel', 'hotelcaribe@correo.com'),
       ('Aerolínea Veloz', 'aerolinea', 'contacto@velozair.com');

INSERT INTO hoteles (nombre, direccion, estrellas, proveedor_id)
VALUES ('Hotel Caribe', 'Av. Principal 123, Cartagena', 4, 1),
       ('Hotel Sol', 'Calle del Sol 456, Santa Marta', 5, 1);

INSERT INTO habitaciones (hotel_id, tipo, capacidad, precio)
VALUES (1, 'Suite', 2, 300.00),
       (2, 'Estándar', 4, 150.00);

INSERT INTO aeropuertos (nombre, ciudad, codigo)
VALUES ('Aeropuerto El Dorado', 'Bogotá', 'BOG'),
       ('Aeropuerto Rafael Núñez', 'Cartagena', 'CTG');

INSERT INTO vuelos (numero_vuelo, origen_id, destino_id, proveedor_id, fecha_salida, fecha_llegada, asientos_disponibles, precio)
VALUES ('VL123', 1, 2, 2, '2025-05-01 08:00:00', '2025-05-01 09:30:00', 100, 220.00),
       ('VL456', 2, 1, 2, '2025-05-05 17:00:00', '2025-05-05 18:30:00', 90, 230.00);

INSERT INTO paquetes (nombre, descripcion, precio_total, hotel_id, vuelo_id)
VALUES ('Plan Cartagena Premium', 'Incluye vuelo ida y vuelta + hotel 4 estrellas', 800.00, 1, 1),
       ('Plan Sol y Playa', 'Alojamiento + vuelo a Santa Marta', 700.00, 2, 2);

INSERT INTO promociones (nombre, descuento, fecha_inicio, fecha_fin, paquete_id)
VALUES ('Descuento de Temporada', 20.00, '2025-04-01', '2025-04-30', 1),
       ('Oferta Verano', 15.00, '2025-06-01', '2025-06-30', 2);

INSERT INTO reservas (usuario_id, paquete_id, fecha_reserva, estado, total_pago)
VALUES (1, 1, '2025-04-10', 'confirmada', 640.00),
       (1, 2, '2025-04-12', 'pendiente', 595.00);

INSERT INTO pagos (reserva_id, fecha_pago, monto, metodo_pago, estado_pago)
VALUES (1, '2025-04-10 10:00:00', 640.00, 'Tarjeta', 'exitoso'),
       (2, '2025-04-12 15:00:00', 595.00, 'PSE', 'exitoso');