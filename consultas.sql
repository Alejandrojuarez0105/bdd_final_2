DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_alejandro_juarez` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_alejandro_juarez`()
BEGIN

-- Consultas --

-- Unión --
SELECT * FROM habitacion WHERE codigo LIKE 'A%' UNION SELECT * FROM habitacion WHERE codigo LIKE 'D%';

-- Intersección --
SELECT * FROM habitacion WHERE codigo LIKE 'A%' INTERSECT SELECT * FROM habitacion WHERE capacidad_maxima = 1;

-- Diferencia --
SELECT * FROM habitacion WHERE codigo LIKE 'A%' EXCEPT SELECT * FROM habitacion WHERE estado = 'ocupada';

-- Agregación --
SELECT tipo, AVG(tarifa_por_noche) AS tarifa_promedio, COUNT(*) AS cantidad_habitaciones, MAX(tarifa_por_noche) AS tarifa_maxima FROM habitacion GROUP BY tipo;

-- Reunion natural --
SELECT * FROM reserva_habitacion NATURAL JOIN habitacion;

-- Reunion natural por la izquierda --
SELECT * FROM reserva_habitacion LEFT JOIN habitacion ON reserva_habitacion.habitacion_id = habitacion.habitacion_id;

-- Reunion natural por la derecha --
SELECT * FROM habitacion RIGHT JOIN reserva_habitacion ON habitacion.habitacion_id = reserva_habitacion.habitacion_id;

-- Producto cartesiano --
SELECT * FROM reserva_habitacion CROSS JOIN habitacion;


END //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_miguel_rivas` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_miguel_rivas`()
BEGIN

-- Consultas --
-- Interseccion --

-- Union --

-- Diferencia --

-- Agregacion --

-- Reunion Natural --

-- Reunion Natural por derecha --


-- Reunion Natural por izquierda --

-- Producto cartesiano --

END //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_kelvia_neves` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_kelvia_neves`()
BEGIN

-- Consultas --

-- Unión Kelvia –


-- Intersección Kelvia --


-- Diferencia Kelvia --


--  Agregación Kelvia --


-- Reunion natural Kelvia --


-- Reunion natural por la izquierda Kelvia --


-- Reunion natural por la derecha Kelvia --


-- Producto cartesiano Kelvia --



END //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_manuel_munoz` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_manuel_munoz`()
BEGIN

-- Consultas --

-- Intersect --

-- Union --


-- Diferencia --

-- Agregacion --

-- Natural Join --


-- Right Join --

-- Left Join --

--  P.Cartesiano -- 

END //

DELIMITER ;


DELIMITER //

DROP PROCEDURE IF EXISTS `consultas_carlos_alvarado` //

CREATE DEFINER=`root`@`%` PROCEDURE `consultas_carlos_alvarado`()
BEGIN

-- Consultas Carlos Alvarado --


-- Intersección --


-- Diferencia --


-- Unión --


-- Agregación --



-- Reunión Natural --


-- Reunión Natural Por la izquierda --


-- Reunión Natural Por la derecha --


-- Producto Cartesiano --



END //

DELIMITER ;



-- Triggers Alejandro Juarez --

-- Trigger Individual Alejandro Juarez --

DELIMITER $$
DROP TRIGGER IF EXISTS valida_habitaciones_numero_personas;
CREATE TRIGGER IF NOT EXISTS valida_habitaciones_numero_personas
BEFORE INSERT ON habitacion
FOR EACH ROW
BEGIN
    -- Validar que tarifa_por_noche no sea NULL si el estado es 'ocupada' o 'en mantenimiento'
    IF (NEW.estado IN ('ocupada', 'en mantenimiento') AND NEW.tarifa_por_noche IS NULL) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La tarifa_por_noche no puede ser NULL cuando el estado es "ocupada" o "en mantenimiento".';
    END IF;

    -- Validar que la capacidad_maxima sea mayor a 0
    IF (NEW.capacidad_maxima <= 0) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La capacidad_maxima debe ser mayor que 0.';
    END IF;
END$$

DELIMITER ;

-- Trigger Grupal Alejandro Juarez --

DELIMITER $$
DROP TRIGGER IF EXISTS after_insert_reserva_habitacion;
CREATE TRIGGER IF NOT EXISTS after_insert_reserva_habitacion
AFTER INSERT ON reserva_habitacion
FOR EACH ROW
BEGIN
    UPDATE habitacion
    SET estado = 'ocupada'
    WHERE habitacion_id = NEW.habitacion_id;
END$$
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS after_delete_reserva_habitacion;
CREATE TRIGGER IF NOT EXISTS after_delete_reserva_habitacion
AFTER DELETE ON reserva_habitacion
FOR EACH ROW
BEGIN
    UPDATE habitacion
    SET estado = 'disponible'
    WHERE habitacion_id = OLD.habitacion_id;
END$$
DELIMITER ;

