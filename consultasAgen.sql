-- Paquetes con su hotel y vuelo incluido
SELECT p.nombre AS paquete, h.nombre AS hotel, v.numero_vuelo
FROM paquetes p
JOIN hoteles h ON p.hotel_id = h.id
JOIN vuelos v ON p.vuelo_id = v.id;

-- Reservas completas con información de cliente y paquete
SELECT r.id, u.nombre AS cliente, p.nombre AS paquete
FROM reservas r
JOIN usuarios u ON r.cliente_id = u.id
JOIN paquetes p ON r.paquete_id = p.id;

-- Vuelos con información de aerolínea y aeropuertos
SELECT v.numero_vuelo, pr.nombre AS aerolinea, a1.nombre AS origen, a2.nombre AS destino
FROM vuelos v
JOIN proveedores pr ON v.proveedor_id = pr.id
JOIN aeropuertos a1 ON v.origen_id = a1.id
JOIN aeropuertos a2 ON v.destino_id = a2.id;

-- Promociones aplicables a paquetes específicos
SELECT promo.nombre AS promocion, p.nombre AS paquete
FROM promociones promo
JOIN paquetes p ON promo.paquete_id = p.id;

-- Habitaciones reservadas con información de hotel y cliente
SELECT hab.tipo, h.nombre AS hotel, u.nombre AS cliente
FROM habitaciones_reservadas hr
JOIN habitaciones hab ON hr.habitacion_id = hab.id
JOIN hoteles h ON hab.hotel_id = h.id
JOIN usuarios u ON hr.cliente_id = u.id;

-- Paquetes con descuento mayor al 20%
SELECT p.nombre, promo.descuento
FROM promociones promo
JOIN paquetes p ON promo.paquete_id = p.id
WHERE promo.descuento > 20;



-- Vuelos con asientos disponibles
SELECT * FROM vuelos
WHERE asientos_disponibles > 0;

-- Hoteles con valoración mayor a 4 estrellas
SELECT * FROM hoteles
WHERE estrellas > 4;

-- Clientes con más de 5 reservas
SELECT u.nombre, COUNT(*) AS total_reservas
FROM reservas r
JOIN usuarios u ON r.cliente_id = u.id
GROUP BY u.nombre
HAVING COUNT(*) > 5;

-- Paquetes con precio superior al promedio
SELECT * FROM paquetes
WHERE precio_total > (SELECT AVG(precio_total) FROM paquetes);



-- Vuelos con ocupación superior al 80%
SELECT * FROM vuelos
WHERE (100 - asientos_disponibles) >= (0.8 * 100); -- Suponiendo capacidad = 100

-- Hoteles con todas sus habitaciones reservadas en una fecha
SELECT h.nombre FROM hoteles h
WHERE NOT EXISTS (
    SELECT * FROM habitaciones hab
    WHERE hab.hotel_id = h.id
    AND hab.id NOT IN (
        SELECT hr.habitacion_id FROM habitaciones_reservadas hr
        WHERE hr.fecha_reserva = '2025-05-01'
    )
);

-- Promociones que no han sido aplicadas
SELECT * FROM promociones
WHERE id NOT IN (
    SELECT promocion_id FROM reservas WHERE promocion_id IS NOT NULL
);
