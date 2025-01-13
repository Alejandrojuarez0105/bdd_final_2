-- Tabla: Miguel Rivas --
DROP TABLE IF EXISTS servicio_adicional;
CREATE TABLE servicio_adicional (
    servicio_adicional_id INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    tarifa DECIMAL(10, 2),
    reserva_id INT,
    PRIMARY KEY (servicio_adicional_id)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO servicio_adicional (nombre, descripcion, tarifa, reserva_id) VALUES
('Desayuno', 'Buffet desayuno incluido', 15.00, 1),
('Spa', NULL, 50.00, 2),
('Transporte', 'Traslado al aeropuerto', NULL, 3),
('Cena Romántica', NULL, 75.00, NULL),
('Tour Guiado', 'Excursión a sitios turísticos', 30.00, NULL);

DROP TABLE IF EXISTS reserva_servicio_adicional;
CREATE TABLE reserva_servicio_adicional (
    reserva_servicio_adicional_id INT AUTO_INCREMENT NOT NULL,
    reserva_id INT NOT NULL,
    servicio_adicional_id INT NOT NULL,
    PRIMARY KEY (reserva_servicio_adicional_id)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
INSERT INTO reserva_servicio_adicional (reserva_id, servicio_adicional_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(1, 3);

--  Tabla: Alejandro Juarez --

DROP TABLE IF EXISTS habitacion;
CREATE TABLE IF NOT EXISTS `habitacion` (
    `habitacion_id` INT AUTO_INCREMENT PRIMARY KEY,
    `codigo` CHAR(5) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL UNIQUE,
    `tipo` ENUM('individual', 'doble', 'suite') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
    `tarifa_por_noche` DECIMAL(10, 2) DEFAULT NULL,
    `estado` ENUM('disponible', 'ocupada', 'en mantenimiento') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
    `capacidad_maxima` INT NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO `habitacion` (`codigo`, `tipo`, `tarifa_por_noche`, `estado`, `capacidad_maxima`) VALUES
('A001', 'individual', 50.00, 'disponible', 1),
('B002', 'doble', NULL, 'ocupada', 2),
('C003', 'suite', 150.00, 'en mantenimiento', 4),
('D004', 'doble', NULL, 'disponible', 2),
('E005', 'individual', 45.00, 'ocupada', 1);



-- Tabla: Kelvia Neves –

DROP TABLE IF EXISTS huesped;
CREATE TABLE IF NOT EXISTS  huesped (
    huesped_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_unico VARCHAR(50) UNIQUE,
    nombre_completo VARCHAR(100),
    numero_identificacion VARCHAR(50) UNIQUE,
    telefono VARCHAR(20),
    correo_electronico VARCHAR(100)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO huesped (codigo_unico, nombre_completo, numero_identificacion, telefono, correo_electronico) 
VALUES
    ('HUE001', 'Carlos Perez', 'DNI12345678', '+34123456789', 'carlos.perez@example.com'),
    ('HUE002', 'Ana Lopez', 'DNI87654321', '+34123456780', 'ana.lopez@example.com'),
    ('HUE003', 'John Smith', 'PAS987654321', '+44123456789', 'john.smith@example.com'),
    ('HUE004', 'Maria Gonzalez', 'DNI11223344', '+34123456781', 'maria.gonzalez@example.com'),
    ('HUE005', 'Sophie Martin', 'PAS1123581321', '+33123456789', 'sophie.martin@example.com'),
    ('HUE006', 'Liam Brown', 'PAS6677889900', '+44123456790', 'liam.brown@example.com'),
    ('HUE007', 'Isabella Garcia', 'DNI55667788', '+34123456782', 'isabella.garcia@example.com'),
    ('HUE008', 'Emma Martinez', 'DNI33445566', '+34123456783', 'emma.martinez@example.com'),
    ('HUE009', 'James Wilson', 'PAS4455667788', '+44123456791', 'james.wilson@example.com'),
    ('HUE010', 'Oliver Davis', 'PAS9988776655', '+44123456792', 'oliver.davis@example.com');

-- Tabla: Manuel Muñoz --

DROP TABLE IF EXISTS pago;
CREATE TABLE IF NOT EXISTS pago (
pago_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
codigo_unico char(5) NOT NULL,
reserva_id INT UNSIGNED NOT NULL,
monto decimal(8,2),
fecha_de_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
metodo_de_pago ENUM("tarjeta", "efectivo", "transferencia"),
PRIMARY KEY (pago_id),
UNIQUE(codigo_unico))
ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO pago (codigo_unico, reserva_id, monto, metodo_de_pago) 
VALUES
('A1234', 1, 150.500, 'tarjeta'),
('B5678', 2, 200.750, 'efectivo'),
('C9101', 3, NULL, 'transferencia'),
('D1121', 4, 180.000, NULL),
('E3141', 5, 250.300, 'tarjeta'),
('F5161', 6, 100.000, 'efectivo'),
('G7181', 7, 175.250, NULL),
('H9202', 8, NULL, 'transferencia'),
('I1233', 9, 300.000, 'tarjeta'),
('J4567', 10, NULL, NULL);





--  Tabla: Carlos Alvarado --
DROP TABLE IF EXISTS reserva;
CREATE TABLE IF NOT EXISTS reserva (
   reserva_id int PRIMARY KEY AUTO_INCREMENT,
   codigo_unico CHAR(5) UNIQUE NOT NULL,
   fecha_entrada date NOT NULL,
   fecha_salida date NOT NULL,
   estado ENUM("Confirmada", "Pendiente", "Cancelada"),
   costo decimal(10,2)
) ENGINE=MyISAM CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO reserva (codigo_unico, fecha_entrada, fecha_salida, estado, costo)
VALUES ('AB102', '2024-12-25', '2025-12-31', "Confirmada", 1105.50),
      ('AB103', '2025-01-01', '2025-02-01', "Confirmada", 105.50),
      ('AB104', '2025-01-01', '2025-02-01', "Confirmada", 155.50),
      ('AB105', '2025-01-05', '2025-02-05', "Pendiente", 125.00),
      ('AB106', '2025-03-05', '2025-03-10', "Cancelada", 100.00);

   DROP TABLE IF EXISTS reserva_huesped;
   CREATE TABLE IF NOT EXISTS reserva_huesped (
   reserva_huesped_id int PRIMARY KEY AUTO_INCREMENT,
   reserva_id int NOT NULL,
   huesped_id int NOT NULL
) ENGINE=MyISAM CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO reserva_huesped (reserva_id, huesped_id)
VALUES (1, 1),
      (2, 2),
      (3, 3),
      (4, 4),
      (5, 5);

   DROP TABLE IF EXISTS reserva_habitacion;
   CREATE TABLE IF NOT EXISTS reserva_habitacion (
   reserva_habitacion_id int PRIMARY KEY AUTO_INCREMENT,
   reserva_id int NOT NULL,
   habitacion_id int NOT NULL
   ) ENGINE=MyISAM CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO reserva_habitacion (reserva_id, habitacion_id)
VALUES (1, 1),
      (2, 2),
      (3, 3),
      (4, 4),
      (5, 5);

