/*1*/

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

/*2*/

USE `peliculas`;
DROP function IF EXISTS `contar_copias_por_titulo`;

DELIMITER $$
USE `peliculas`$$
CREATE FUNCTION contar_copias_por_titulo(titulo_p VARCHAR(50)) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM copias as c
    JOIN pelicula as p ON c.id_pelicula = p.id_pelicula
    WHERE p.titulo = titulo_p;
    RETURN total;
END$$

DELIMITER ;

/*3*/

USE `peliculas`;
DROP function IF EXISTS `dias_retraso`;

DELIMITER $$
USE `peliculas`$$
CREATE FUNCTION dias_retraso(id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE retraso INT;
    SELECT DATEDIFF(fecha_entrega, fecha_tope) INTO retraso
    FROM prestamos
    WHERE id_prestamo = id;

    IF retraso < 0 THEN
        SET retraso = 0;
    END IF;

    RETURN retraso;
END$$

DELIMITER ;

/*4*/

USE `peliculas`;
DROP function IF EXISTS `nombre_completo_cliente`;

DELIMITER $$
USE `peliculas`$$
CREATE FUNCTION nombre_completo_cliente(id INT) 
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE nombre_completo VARCHAR(50);
    SELECT CONCAT(nombre, ' ', apellido) INTO nombre_completo
    FROM clientes
    WHERE id_cliente = id;
    RETURN nombre_completo;
END$$

DELIMITER ;

/*5*/

USE `peliculas`;
DROP function IF EXISTS `total_recaudo_por_pelicula`;

DELIMITER $$
USE `peliculas`$$
CREATE FUNCTION total_recaudo_por_pelicula(idPeli INT) 
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE total DOUBLE;
    SELECT SUM(precio_alquiler) INTO total
    FROM copias
    WHERE id_pelicula = idPeli;
    
    IF total IS NULL THEN
        SET total = 0;
    END IF;
    
    RETURN total;
END$$

DELIMITER ;