USE `peliculas`;
DROP function IF EXISTS `fn_dias_retraso`;

DELIMITER $$
USE `peliculas`$$
CREATE FUNCTION fn_dias_retraso(fecha_tope DATE, fecha_entrega DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE dias INT;
    SET dias = DATEDIFF(fecha_entrega, fecha_tope);
    RETURN IF(dias > 0, dias, 0);
END$$

DELIMITER ;