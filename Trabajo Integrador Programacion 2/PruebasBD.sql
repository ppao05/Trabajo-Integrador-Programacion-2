-- Insertar datos de prueba
-- Si intentás insertar otro empleado con el mismo legajo_id, MySQL te rechazará el insert (por el UNIQUE),
-- garantizando la relación 1→1 real.
INSERT INTO legajo (nro_legajo, categoria, estado, fecha_alta)
VALUES ('TEC-002', 'Tecnico', 'INACTIVO', '2024-06-10');

INSERT INTO empleado (nombre, apellido, dni, email, fecha_ingreso, area, legajo_id)
VALUES ('Luis', 'Pérez', '28999888', 'luis.perez@empresa.com', '2021-02-15', 'Técnica', 2);

-- Muestra del resultado
SELECT e.id, e.nombre, e.apellido, l.nro_legajo, l.estado, e.eliminado
FROM empleado e
JOIN legajo l ON e.legajo_id = l.id;

-- Revertir el empleado eliminado, verificamos los empleados
SELECT id, nombre, apellido, dni, eliminado
FROM empleado; 

-- Cambiamos el valor 
UPDATE empleado
SET eliminado = FALSE
WHERE id = 3;

-- Consulta de legajo ROllback
SELECT * FROM legajo ORDER BY id DESC LIMIT 5;

-- Consulta de todos los empleados
select * from empleado