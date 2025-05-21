/*1 prestamo*/

USE `peliculas`;
DROP procedure IF EXISTS `registrar_prestamo`;

DELIMITER $$
USE `peliculas`$$
CREATE PROCEDURE registrar_prestamo (
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


/*2 clientes*/


USE `peliculas`;
DROP procedure IF EXISTS `registro_cliente`;

DELIMITER $$
USE `peliculas`$$
CREATE PROCEDURE registro_cliente (
    IN c_nombre varchar(20),
    IN c_apellido varchar(20),
    IN c_direccion varchar(20),
    IN c_email varchar(30)
)
BEGIN
    INSERT INTO clientes (
	nombre, 
	apellido, 
	direccion, 
	email
    )
    VALUES (
		c_nombre, 
		c_apellido, 
		c_direccion, 
        NULL,
        c_email
    );
END$$

DELIMITER ;

/*3 copias*/

USE `peliculas`;
DROP procedure IF EXISTS `registro_copias`;

DELIMITER $$
USE `peliculas`$$
CREATE PROCEDURE registro_copias (
    IN co_precio_alquiler double,
    IN co_id_pelicula int
)
BEGIN
    INSERT INTO copias (
	precio_alquiler,
    id_pelicula
    )
    VALUES (
		co_precio_alquiler,
		co_id_pelicula
    );
END$$

DELIMITER ;

/*4 pelicula*/

USE `peliculas`;
DROP procedure IF EXISTS `registro_pelicula`;

DELIMITER $$
USE `peliculas`$$
CREATE PROCEDURE registro_pelicula (
    IN pe_titulo varchar(20),
    IN pe_año date
)
BEGIN
    INSERT INTO pelicula (
	titulo,
    año
    )
    VALUES (
		pe_titulo,
		pe_año
    );
END$$

DELIMITER ;

/*5 actor*/

USE `peliculas`;
DROP PROCEDURE IF EXISTS `registrar_actor`;

DELIMITER $$
CREATE PROCEDURE registrar_actor (
    IN p_nombre VARCHAR(100),
    IN p_nacionalidad VARCHAR(50),
    IN p_fecha_nacimiento DATE
)
BEGIN
    INSERT INTO actores (
        nombre,
        nacionalidad,
        fecha_nacimiento
    )
    VALUES (
        p_nombre,
        p_nacionalidad,
        p_fecha_nacimiento
    );
END$$
DELIMITER ;
