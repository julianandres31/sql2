DELIMITER $$

CREATE TRIGGER trg_validar_copia_disponible
BEFORE INSERT ON prestamos
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM prestamos
        WHERE id_copia = NEW.id_copia
        AND fecha_entrega IS NULL
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La copia ya está prestada y no ha sido devuelta';
    END IF;
END $$

DELIMITER ;
