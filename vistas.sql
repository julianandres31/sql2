/*1*/

USE `peliculas`;
CREATE  OR REPLACE VIEW vista_prestamos_activos AS
SELECT 
    cl.id_cliente,
    cl.nombre,
    cl.apellido,
    pr.id_prestamo,
    pr.fecha_prestamo,
    pr.fecha_tope,
    c.id_copia,
    p.titulo AS pelicula
FROM prestamos pr
JOIN clientes cl ON pr.id_cliente = cl.id_cliente
JOIN copias c ON pr.id_copia = c.id_copia
JOIN pelicula p ON c.id_pelicula = p.id_pelicula
WHERE pr.fecha_entrega IS NULL;;

/*2*/

USE `peliculas`;
CREATE  OR REPLACE VIEW vista_peliculas_con_precios AS
SELECT 
    p.id_pelicula,
    p.titulo,
    c.id_copia,
    c.precio_alquiler
FROM 
    pelicula p
JOIN 
    copias c ON p.id_pelicula = c.id_pelicula;;

/*3*/    
    
    USE `peliculas`;
CREATE  OR REPLACE VIEW vista_historial_prestamos AS
SELECT 
    pr.id_prestamo,
    cl.nombre,
    cl.apellido,
    p.titulo,
    pr.fecha_prestamo,
    pr.fecha_tope,
    pr.fecha_entrega
FROM 
    prestamos pr
JOIN 
    clientes cl ON pr.id_cliente = cl.id_cliente
JOIN 
    copias c ON pr.id_copia = c.id_copia
JOIN 
    pelicula p ON c.id_pelicula = p.id_pelicula;;

/*4*/

    USE `peliculas`;
CREATE  OR REPLACE VIEW vista_clientes_con_prestamos_vencidos AS
SELECT 
    cl.id_cliente,
    cl.nombre,
    cl.apellido,
    p.titulo,
    pr.fecha_prestamo,
    pr.fecha_tope
FROM 
    prestamos pr
JOIN 
    clientes cl ON pr.id_cliente = cl.id_cliente
JOIN 
    copias c ON pr.id_copia = c.id_copia
JOIN 
    pelicula p ON c.id_pelicula = p.id_pelicula
WHERE 
    pr.fecha_entrega IS NULL
    AND pr.fecha_tope < CURDATE();;
    
/*5*/

USE `peliculas`;
CREATE  OR REPLACE VIEW vista_total_copias_por_pelicula AS
SELECT 
    p.id_pelicula,
    p.titulo,
    COUNT(c.id_copia) AS total_copias
FROM 
    pelicula p
LEFT JOIN 
    copias c ON p.id_pelicula = c.id_pelicula
GROUP BY 
    p.id_pelicula, p.titulo;;