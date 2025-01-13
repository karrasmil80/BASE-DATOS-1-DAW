-- Ejercicio 1: Creamos dos usuarios con contraseñas distintas
CREATE USER 'usuario_1'@'localhost' IDENTIFIED BY 'Contraseña1'; -- Creación de usuario1
CREATE USER 'usuario_2'@'localhost' IDENTIFIED BY 'Contraseña2'; -- Creación de usuario2

-- Ejercicio 2: Otorgarmos privilegio ALTER en la base de datos sql_como_ddl a usuario2
GRANT ALTER ON sql_como_ddl.* TO 'usuario2'@'localhost';

-- Ejercicio 3: Creamos rol Consulta y otorgar permiso SELECT
CREATE ROLE Consulta; -- Creación el rol Consulta
GRANT SELECT ON sql_como_ddl.* TO Consulta; -- Otorgarmos permiso de SELECT al rol Consulta

-- Ejercicio 4: Creamos el rol Desarrollador y otorgar permisos de INSERT, UPDATE, CREATE, DELETE, REFERENCES
CREATE ROLE Desarrollador; -- Creación del rol Desarrollador
GRANT INSERT, UPDATE, CREATE, DELETE, REFERENCES ON sql_como_ddl.* TO Desarrollador; -- Otorgar permisos al rol Desarrollador

-- Ejercicio 5: Creamos el rol Administrador y otorgar permisos de DELETE, CREATE y GRANT OPTION
CREATE ROLE Administrador; -- Creación del rol Administrador
GRANT DELETE, CREATE, GRANT OPTION ON sql_como_ddl.* TO Administrador; -- Otorgamos permisos al rol Administrador

-- Ejercicio 6: Asignar roles a los usuarios
GRANT Consulta TO 'usuario_1'@'localhost'; -- Asignamos rol Consulta a usuario1
GRANT Desarrollador TO 'usuario_2'@'localhost'; -- Asignamos rol Desarrollador a usuario2
GRANT Administrador TO 'usuario_2'@'localhost'; -- Asignamos rol Administrador a usuario2

-- Ejercicio 7: Modificamos la contraseña de usuario1 y establecer la caducidad a 20 días
ALTER USER 'usuario_1'@'localhost' IDENTIFIED BY 'Xx_usuario1_xX' PASSWORD EXPIRE INTERVAL 20 DAY;

-- Ejercicio 8: Limitamos conexiones y actualizaciones para usuario2
ALTER USER 'usuario_2'@'localhost' WITH MAX_CONNECTIONS_PER_HOUR 0 MAX_USER_CONNECTIONS 4; -- Limitar a 4 conexiones simultáneas
ALTER USER 'usuario_2'@'localhost' WITH MAX_UPDATES_PER_HOUR 35; -- Limitar a 35 actualizaciones por hora

-- Ejercicio 9: Eliminamos usuario1
DROP USER 'usuario_1'@'localhost';

-- Ejercicio 10: Revocamos privilegio ALTER en la base de datos test para usuario2
REVOKE ALTER ON sql_como_ddl.* FROM 'usuario_2'@'localhost';