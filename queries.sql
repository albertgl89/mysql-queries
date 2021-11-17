SELECT * FROM `tienda`.`producto`;
SELECT `nombre`,`precio` FROM `tienda`.`producto`;
SHOW COLUMNS FROM `tienda`.`producto`;
SELECT `nombre`,`precio`, CAST(`precio`*1.14 AS DECIMAL(6,2)) FROM `tienda`.`producto`;
SELECT `nombre` AS `nom de producto`,`precio` AS `euros`, CAST(`precio`*1.14 AS DECIMAL(6,2)) AS `dolars` FROM `tienda`.`producto`;
SELECT UPPER(`nombre`),`precio` FROM `tienda`.`producto`;
SELECT LOWER(`nombre`),`precio` FROM `tienda`.`producto`;
SELECT `nombre`,SUBSTRING(UPPER(`nombre`),1,2) FROM `tienda`.`fabricante`;
SELECT `nombre`,CEILING(`precio`) FROM `tienda`.`producto`;
SELECT `nombre`,TRUNCATE(`precio`,0) FROM `tienda`.`producto`;
SELECT `fabricante`.`codigo` FROM `tienda`.`fabricante` JOIN `tienda`.`producto` WHERE `producto`.`codigo_fabricante` = `fabricante`.`codigo`;
SELECT DISTINCT `fabricante`.`codigo` FROM `tienda`.`fabricante` JOIN `tienda`.`producto` WHERE `producto`.`codigo_fabricante` = `fabricante`.`codigo`;
SELECT `fabricante`.`nombre` FROM `tienda`.`fabricante` ORDER BY `nombre` ASC;
SELECT `fabricante`.`nombre` FROM `tienda`.`fabricante` ORDER BY `nombre` DESC;
SELECT `nombre`, `precio` FROM `tienda`.`producto` ORDER BY 1 ASC,2 DESC;
SELECT * FROM `tienda`.`fabricante` LIMIT 5;
SELECT * FROM `tienda`.`fabricante` LIMIT 3 OFFSET 3;
SELECT `nombre`, `precio` FROM `tienda`.`producto` ORDER BY 2 ASC LIMIT 1;
SELECT `nombre`, `precio` FROM `tienda`.`producto` ORDER BY 2 DESC LIMIT 1;
SELECT `nombre` FROM `tienda`.`producto` WHERE `codigo_fabricante` = 2;
SELECT `producto`.`nombre`,`producto`.`precio`,`fabricante`.`nombre` AS `fabricante` FROM `tienda`.`producto` JOIN `tienda`.`fabricante` ON `producto`.`codigo_fabricante` = `fabricante`.`codigo`;
SELECT `producto`.`nombre`,`producto`.`precio`,`fabricante`.`nombre` AS `fabricante` FROM `tienda`.`producto` JOIN `tienda`.`fabricante` ON `producto`.`codigo_fabricante` = `fabricante`.`codigo` ORDER BY 3 ASC;
SELECT `producto`.`codigo` AS `codigo producto`,`producto`.`nombre` AS `producto`,`producto`.`codigo_fabricante` AS `codigo fabricante`, `fabricante`.`nombre` AS `fabricante` FROM `tienda`.`producto` JOIN `tienda`.`fabricante` ON `producto`.`codigo_fabricante` = `fabricante`.`codigo`;
SELECT `producto`.`nombre` AS `producto`,`producto`.`precio`,`fabricante`.`nombre` AS `fabricante` FROM `tienda`.`producto` JOIN `tienda`.`fabricante` ON `producto`.`codigo_fabricante` = `fabricante`.`codigo` WHERE (SELECT MIN(`precio`) FROM `producto`) = `producto`.`precio` ;
SELECT `producto`.`nombre` AS `producto`,`producto`.`precio`,`fabricante`.`nombre` AS `fabricante` FROM `tienda`.`producto` JOIN `tienda`.`fabricante` ON `producto`.`codigo_fabricante` = `fabricante`.`codigo` WHERE (SELECT MAX(`precio`) FROM `producto`) = `producto`.`precio` ;
SELECT * FROM `tienda`.`producto` WHERE `producto`.`codigo_fabricante` = (SELECT `codigo` FROM `tienda`.`fabricante` WHERE `nombre` = 'Lenovo');
SELECT * FROM `tienda`.`producto` WHERE (`producto`.`codigo_fabricante` = (SELECT DISTINCT `fabricante`.`codigo` FROM `tienda`.`fabricante` JOIN `tienda`.`producto` ON `producto`.`codigo_fabricante` = `fabricante`.`codigo` WHERE `fabricante`.`nombre` = 'Crucial')  AND `producto`.`precio` > 200);
SELECT * FROM `tienda`.`producto` WHERE `producto`.`codigo_fabricante` = (SELECT DISTINCT `fabricante`.`codigo` FROM `tienda`.`fabricante` JOIN `tienda`.`producto` ON `producto`.`codigo_fabricante` = `fabricante`.`codigo`  WHERE `fabricante`.`nombre` = ('Asus')) OR `producto`.`codigo_fabricante` = (SELECT DISTINCT `fabricante`.`codigo` FROM `tienda`.`fabricante` JOIN `tienda`.`producto` ON `producto`.`codigo_fabricante` = `fabricante`.`codigo`  WHERE `fabricante`.`nombre` = ('Hewlett-Packard')) OR `producto`.`codigo_fabricante` = (SELECT DISTINCT `fabricante`.`codigo` FROM `tienda`.`fabricante` JOIN `tienda`.`producto` ON `producto`.`codigo_fabricante` = `fabricante`.`codigo`  WHERE `fabricante`.`nombre` = ('Seagate'));
SELECT * FROM `tienda`.`producto` WHERE `producto`.`codigo_fabricante` IN (SELECT DISTINCT `fabricante`.`codigo` FROM `tienda`.`fabricante` WHERE `fabricante`.`nombre` IN ('Asus','Hewlett-Packard','Seagate'));
SELECT `producto`.`nombre`, `producto`.`precio` FROM `tienda`.`producto` WHERE `producto`.`codigo_fabricante` IN (SELECT DISTINCT `fabricante`.`codigo` FROM `tienda`.`fabricante`  WHERE SUBSTR(`fabricante`.`nombre`,-1,1) = 'e');
SELECT `producto`.`nombre`, `producto`.`precio` FROM `tienda`.`producto` WHERE `producto`.`codigo_fabricante` IN (SELECT DISTINCT `fabricante`.`codigo` FROM `tienda`.`fabricante`  WHERE `fabricante`.`nombre` LIKE '%w%');
SELECT `producto`.`nombre`, `producto`.`precio`, `fabricante`.`nombre` FROM `tienda`.`producto` JOIN `tienda`.`fabricante` ON `producto`.`codigo_fabricante` = `fabricante`.`codigo` WHERE `producto`.`precio` >= 180 ORDER BY 2 DESC, 1 ASC ;
SELECT DISTINCT `fabricante`.`codigo`, `fabricante`.`nombre` FROM `tienda`.`fabricante` JOIN `tienda`.`producto` ON `producto`.`codigo_fabricante` = `fabricante`.`codigo` ;
SELECT DISTINCT `fabricante`.`codigo`, `fabricante`.`nombre`, `producto`.`nombre` FROM `tienda`.`fabricante` LEFT JOIN `tienda`.`producto` ON `producto`.`codigo_fabricante` = `fabricante`.`codigo`;
SELECT DISTINCT `fabricante`.`codigo`, `fabricante`.`nombre`, `producto`.`nombre` FROM `tienda`.`fabricante` LEFT JOIN `tienda`.`producto` ON `producto`.`codigo_fabricante` = `fabricante`.`codigo` WHERE `producto`.`codigo` IS NULL;
SELECT * FROM `tienda`.`producto` WHERE `producto`.`codigo_fabricante` = (SELECT `fabricante`.`codigo` FROM `tienda`.`fabricante` WHERE `fabricante`.`nombre` = 'Lenovo');
SELECT * FROM `tienda`.`producto` WHERE `producto`.`precio` = (SELECT MAX(`producto`.`precio`) FROM `tienda`.`producto` WHERE `producto`.`codigo_fabricante` = (SELECT `codigo` FROM `tienda`.`fabricante` WHERE `fabricante`.`nombre` = 'Lenovo')) AND `producto`.`codigo_fabricante` NOT IN (SELECT `codigo` FROM `tienda`.`fabricante` WHERE `nombre` = 'Lenovo');
SELECT `producto`.`nombre` FROM `tienda`.`producto` INNER JOIN `tienda`.`fabricante` ON `producto`.`codigo_fabricante` = `fabricante`.`codigo` WHERE `fabricante`.`nombre` = 'Lenovo' AND `producto`.`precio` = (SELECT MAX(`producto`.`precio`) FROM `tienda`.`producto` WHERE `producto`.`codigo_fabricante` = (SELECT `codigo` FROM `tienda`.`fabricante` WHERE `nombre` = 'Lenovo'));
SELECT `producto`.`nombre` FROM `tienda`.`producto` INNER JOIN `tienda`.`fabricante` ON `producto`.`codigo_fabricante` = `fabricante`.`codigo` WHERE `fabricante`.`nombre` = 'Hewlett-Packard' AND `producto`.`precio` = (SELECT MIN(`producto`.`precio`) FROM `tienda`.`producto` WHERE `producto`.`codigo_fabricante` = (SELECT `codigo` FROM `tienda`.`fabricante` WHERE `nombre` = 'Hewlett-Packard'));
SELECT * FROM `tienda`.`producto` WHERE `producto`.`precio` >= (SELECT MAX(`producto`.`precio`) FROM `tienda`.`producto` WHERE `producto`.`codigo_fabricante` = (SELECT `codigo` FROM `tienda`.`fabricante` WHERE `fabricante`.`nombre` = 'Lenovo')) AND `producto`.`codigo_fabricante` NOT IN (SELECT `codigo` FROM `tienda`.`fabricante` WHERE `nombre` = 'Lenovo');
SELECT * FROM `tienda`.`producto` WHERE `producto`.`precio` > (SELECT AVG(`producto`.`precio`) FROM `tienda`.`producto` WHERE `producto`.`codigo_fabricante` = (SELECT `codigo` FROM `tienda`.`fabricante` WHERE `fabricante`.`nombre` = 'Asus')) AND `producto`.`codigo_fabricante` IN (SELECT `codigo` FROM `tienda`.`fabricante` WHERE `nombre` = 'Asus');
SELECT `persona`.`apellido1`, `persona`.`apellido2`, `persona`.`nombre` FROM `universidad`.`persona` WHERE `tipo` = 'alumno' ORDER BY 1 ASC, 2 ASC, 3 ASC;
SELECT `persona`.`nombre`, `persona`.`apellido1`, `persona`.`apellido2` FROM `universidad`.`persona` WHERE `telefono` IS NULL AND `tipo` = 'alumno';
SELECT * FROM `universidad`.`persona` WHERE (`fecha_nacimiento` BETWEEN '1999-01-01' AND '1999-12-31') AND `tipo` = 'alumno';
SELECT * FROM `universidad`.`persona` WHERE `telefono` IS NULL AND `tipo` = 'profesor' AND `nif` LIKE '%K';
SELECT * FROM `universidad`.`asignatura` WHERE `id_grado` = 7 AND `cuatrimestre` = 1 AND `curso` = 3;
SELECT `persona`.`apellido1`, `persona`.`apellido2`, `persona`.`nombre`, `departamento`.`nombre` FROM `universidad`.`persona` JOIN `universidad`.`profesor` ON `persona`.`id` = `profesor`.`id_profesor` JOIN `universidad`.`departamento` ON `profesor`.`id_departamento` = `departamento`.`id` ORDER BY 1 ASC, 2 ASC, 3 ASC;
SELECT `asignatura`.`nombre`, `curso_escolar`.`anyo_inicio`, `curso_escolar`.`anyo_fin` FROM `universidad`.`alumno_se_matricula_asignatura` INNER JOIN `universidad`.`asignatura`  ON `universidad`.`asignatura`.`id` = `alumno_se_matricula_asignatura`.`id_asignatura`   INNER JOIN `universidad`.`curso_escolar` ON `asignatura`.`curso` = `curso_escolar`.`id`   WHERE `alumno_se_matricula_asignatura`.`id_alumno` = (SELECT `id` FROM `universidad`.`persona` WHERE `nif` = '26902806M');
SELECT `departamento`.`nombre` FROM `universidad`.`profesor` JOIN `universidad`.`departamento` ON `profesor`.`id_departamento` = `departamento`.`id` JOIN `universidad`.`asignatura` ON `asignatura`.`id_profesor` = `profesor`.`id_profesor` WHERE `asignatura`.`id_grado` = (SELECT `id` FROM `universidad`.`grado` WHERE `nombre` = 'Grado en Ingenieria Informática (Plan 2015)') AND `asignatura`.`id_profesor` IS NOT NULL GROUP BY 1 ;
SELECT `persona`.* FROM `universidad`.`persona` JOIN `universidad`.`alumno_se_matricula_asignatura` ON `alumno_se_matricula_asignatura`.`id_alumno` = `persona`.`id` WHERE `alumno_se_matricula_asignatura`.`id_curso_escolar` = (SELECT `id` FROM `universidad`.`curso_escolar` WHERE `anyo_inicio` = '2018' AND `anyo_fin` = '2019') GROUP BY `persona`.`id`;
