-- Tabla: Miguel Rivas --


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


-- Tabla: Kelvia Neves --



-- Tabla: Manuel Muñoz --


--  Tabla: Carlos Alvarado --
