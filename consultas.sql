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


-- Reunion natural por la izquierda --


-- Reunion natural por la derecha --


-- Producto cartesiano --


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
