#DROP DATABASE logistica;
CREATE DATABASE logistica;

USE logistica;

CREATE TABLE trucks (
	placas INT AUTO_INCREMENT,
    modelo VARCHAR(10),
    tipo VARCHAR(20),
    potencia INT,
    PRIMARY KEY (placas)
);

CREATE TABLE driver (
	rf INT AUTO_INCREMENT,
    placas INT,
    nombre VARCHAR(10),
    telefono INT,
    direccion VARCHAR(20),
    salario INT,
    poblacion VARCHAR(10),
    PRIMARY KEY (rf),
    FOREIGN KEY (placas) REFERENCES trucks(placas) #hago fk plcas referencia tabla camiones placas.
);


CREATE TABLE paquetes(
	codigo_paquete INT AUTO_INCREMENT,
    rf INT,
    descripcion VARCHAR(60),
    destino VARCHAR(10),
    dir_destinatario VARCHAR(60),
    PRIMARY KEY (codigo_paquete),
	FOREIGN KEY (rf) REFERENCES driver(rf) #hago fk referencia a la tabla driver rf
);

CREATE TABLE city(
    apartado_postal INT,
    codigo_paquete INT,
    nombre  VARCHAR(10),
    PRIMARY KEY (apartado_postal),
    FOREIGN KEY (codigo_paquete) REFERENCES paquetes(codigo_paquete) #hago fk referencia a la tabla paquetes/codigo Paquetes
);