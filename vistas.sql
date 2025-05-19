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