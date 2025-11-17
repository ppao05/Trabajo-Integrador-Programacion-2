-- Creacion de base de datos
CREATE DATABASE IF NOT EXISTS tpiprog2_empleado_legajo;
USE tpiprog2_empleado_legajo;


-- Creacion del usuario para coneccion
DROP USER IF EXISTS 'javauser'@'localhost';
CREATE USER 'javauser'@'localhost' IDENTIFIED BY 'java123';
GRANT ALL PRIVILEGES ON tpiprog2_empleado_legajo.* TO 'javauser'@'localhost';
FLUSH PRIVILEGES;

-- Verificar que el usuario tenga los permisos
SELECT user, host, plugin FROM mysql.user WHERE user = 'javauser';

SHOW GRANTS FOR 'javauser'@'localhost';

-- Creacion de la tabla Legajo 
CREATE TABLE IF NOT EXISTS legajo (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    eliminado BOOLEAN DEFAULT FALSE,

    nro_legajo VARCHAR(20) NOT NULL UNIQUE,
    categoria VARCHAR(30),
    estado ENUM('ACTIVO', 'INACTIVO') NOT NULL,
    fecha_alta DATE,
    observaciones VARCHAR(255)
);

-- Creacion de tabla Empleado 
-- La relación 1→1 se garantiza con una clave foránea única.
CREATE TABLE IF NOT EXISTS empleado (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    eliminado BOOLEAN DEFAULT FALSE,

    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    dni VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(120),
    fecha_ingreso DATE,
    area VARCHAR(50),

    legajo_id BIGINT UNIQUE,
    CONSTRAINT fk_empleado_legajo
        FOREIGN KEY (legajo_id)
        REFERENCES legajo(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- verificacion de la relación 1→1
DESCRIBE empleado;
DESCRIBE legajo;

