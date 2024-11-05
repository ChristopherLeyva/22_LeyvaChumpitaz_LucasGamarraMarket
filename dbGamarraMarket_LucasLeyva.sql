/* Crear base de datos dbGamarraMarket */
CREATE DATABASE dbGamarraMarket
default character SET utf8;

/* Poner en uso la base de datos dbGamarraMarket */
USE dbGamarraMarket;

/* Crear la tabla CLIENTE */
CREATE TABLE CLIENTE(
    id int auto_increment primary key,
    tipo_documento char(3),
    numero_documento char(9),
    nombres varchar(60),
    apellidos varchar(90),
    email varchar(80),
    celular char(9),
    fecha_nacimiento date,
    activo bool
);

/* Insertar datos a la tabla CLIENTE */
INSERT INTO CLIENTE (tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento, activo)
VALUES ('DNI', '334456543', 'Pablo', 'Lopez', 'pablo.lopez@gmail.com', '999999999', "2000-09-09", true);


/* Crear la tabla VENDEDOR */
CREATE TABLE VENDEDOR(
id int auto_increment primary key,
tipo_documento char(3),
numero_documento char(15),
nombres varchar(60),
apellidos varchar(90),
salario decimal(8, 2),
celular char(9),
email varchar(80),
activo bool
);


/* Insertar datos a la tabla VENDEDOR */
INSERT INTO VENDEDOR (tipo_documento, numero_documento, nombres, apellidos, salario, email, activo)
VALUES ('DNI', '60848402', 'Christobal', 'Ruiz', '3500.00', 'cristobal.ruiz@gmail.com', true);


/* Crear la tabla PRENDA */
CREATE TABLE PRENDA(
id int auto_increment primary key,
descripcion varchar(90),
marca varchar(60),
cantidad int,
talla varchar(10),
precio decimal(8, 2),
activo bool
);

/* Insertar datos a la tabla PRENDA */
INSERT INTO PRENDA (descripcion, marca, cantidad, talla, precio, activo) 
VALUES ('Polo Deportivo', 'Nike', 50, 'XL', 39.90, true);


/* Crear la tabla VENTA */
CREATE TABLE VENTA(
id int auto_increment primary key,
fecha_hora timestamp,
activo bool,
cliente_id int,
vendedor_id int,
foreign key (cliente_id) references CLIENTE(id),
foreign key (vendedor_id) references VENDEDOR(id)
);

/* Insertar datos a la tabla VENTA */
INSERT INTO VENTA (fecha_hora, activo, cliente_id, vendedor_id) 
VALUES (CURRENT_TIMESTAMP, true, 1, 1);


/* Crear la tabla VENTA DETALLE */

CREATE TABLE VENTA_DETALLE(
id int auto_increment primary key,
cantidad int,
venta_id int,
prenda_id int,
foreign key (venta_id) references VENTA(id),
foreign key (prenda_id) references PRENDA(id)
);


/* Insertar datos a la tabla VENTA DETALLE */
INSERT INTO VENTA_DETALLE (cantidad, venta_id, prenda_id) 
VALUES (2, 1, 1);

/*SELECION DE TABLAS*/

-- tabla cliente
SELECT * FROM CLIENTE;

-- tabla prenda
SELECT * FROM PRENDA;

-- tabla vendedor
SELECT * FROM VENDEDOR;

-- tabla venta
SELECT * FROM VENTA;

-- tabla venta detalle
SELECT * FROM VENTA_DETALLE;