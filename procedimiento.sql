USE `peliculas`;
DROP procedure IF EXISTS `sp_registrar_prestamo`;

DELIMITER $$
USE `peliculas`$$
CREATE PROCEDURE sp_registrar_prestamo (
    IN p_fecha_prestamo DATE,
    IN p_fecha_tope DATE,
    IN p_id_cliente INT,
    IN p_id_copia INT
)
BEGIN
    INSERT INTO prestamos (
        fecha_prestamo,
        fecha_tope,
        fecha_entrega,
        id_cliente,
        id_copia
    )
    VALUES (
        p_fecha_prestamo,
        p_fecha_tope,
        NULL,
        p_id_cliente,
        p_id_copia
    );
END$$

DELIMITER ;

