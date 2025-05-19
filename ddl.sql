create database peliculas;
use peliculas;

create table pelicula (
	id_pelicula int primary key auto_increment,
    titulo varchar (20),
    año time
);

create table copias (
	id_copia int primary key auto_increment,
    precio_alquiler double,
    id_pelicula int
);

create table clientes(
	id_cliente int primary key auto_increment,
    nombre varchar (20),
    apellido varchar (20),
    direccion varchar (20),
    email varchar (30)
);

create table prestamos (
	id_prestamo int primary key auto_increment,
    fecha_prestamo date,
    fecha_tope date,
    fecha_entrega date,
    id_cliente int,
    id_copia int  
);

alter table copias
add foreign key (id_pelicula) references pelicula(id_pelicula);

alter table prestamos
add foreign key (id_cliente) references clientes(id_cliente);
alter table prestamos
add foreign key (id_copia) references copias(id_copia);