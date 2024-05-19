create or replace  VIEW Vista_Arbitros AS
SELECT ArbitroID, COUNT(*) as Total_Arbitrajes 
FROM partido p
WHERE FaseID = 'GRUPOS10' AND ArbitroID is not null 
GROUP BY ArbitroID
ORDER BY Total_Arbitrajes DESC 
LIMIT 1;


create or replace  VIEW Vista_Participaciones_Selecciones AS
SELECT pais, COUNT(*) as participaciones 
FROM seleccion s 
GROUP BY pais
ORDER BY participaciones DESC 
LIMIT 1;


DELIMITER //

create FUNCTION obtenerArbitroConMenosPartidos() RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE min_partidos INT;
    DECLARE arbitro_menos VARCHAR(255);
    
    -- Obtenemos el mínimo de partidos dirigidos por un árbitro en el Mundial de 2010
    SELECT MIN(partidos) INTO min_partidos
    FROM (
        SELECT COUNT(*) AS partidos
        FROM arbitros
        WHERE mundial = 2010
        GROUP BY nombre_arbitro
    ) AS partidos_por_arbitro;

    -- Obtenemos el nombre del árbitro con el mínimo de partidos
    SELECT arbitro INTO arbitro_menos
    FROM (
        SELECT nombre_arbitro, COUNT(*) AS partidos
        FROM arbitros
        WHERE mundial = 2010
        GROUP BY nombre_arbitro
    ) AS arbitros_por_partidos
    WHERE partidos = min_partidos
    LIMIT 1;
    
    RETURN arbitro_menos;
END //

DELIMITER ;




SELECT obtenerArbitroConMenosPartidos();




DELIMITER //

CREATE FUNCTION ArbitroConMenosPartidos() RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE min_partidos INT;
    DECLARE arbitro_menos VARCHAR(255);
    
    -- Obtenemos el mínimo de partidos dirigidos por un árbitro en el Mundial de 2010
    SELECT MIN(partidos) INTO min_partidos
    FROM (
        SELECT COUNT(*) AS partidos
        FROM partido p
        WHERE p.ArbitroID IS NOT NULL 
        AND EXISTS (
            SELECT * FROM fase_eliminatoria f 
            WHERE f.FaseID = 'GRUPOS10' 
            AND p.FaseID = f.FaseID
        )
        GROUP BY p.ArbitroID
    ) AS partidos_por_arbitro;

    -- Obtenemos el nombre del árbitro con el mínimo de partidos
    SELECT p.Nombre INTO arbitro_menos
    FROM arbitro p
    WHERE EXISTS (
        SELECT * FROM (
            SELECT COUNT(*) AS partidos
            FROM partido pa
            WHERE pa.ArbitroID = p.ArbitroID
            AND pa.ArbitroID IS NOT NULL 
            AND EXISTS (
                SELECT * FROM fase_eliminatoria f 
                WHERE f.FaseID = 'GRUPOS10' 
                AND pa.FaseID = f.FaseID
            )
            GROUP BY pa.ArbitroID
        ) AS arbitros_por_partidos
        WHERE partidos = min_partidos
    )
    LIMIT 1;
    
    RETURN arbitro_menos;
END //

DELIMITER ;


SELECT ArbitroConMenosPartidos();






DELIMITER //

CREATE FUNCTION obtenerEstadioMasGrande() RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE estadio_nombre VARCHAR(255);
    
    -- Obtenemos el nombre del estadio con la capacidad máxima
    SELECT Nombre INTO estadio_nombre
    FROM estadio
    ORDER BY capacidad DESC
    LIMIT 1;
    
    RETURN estadio_nombre;
END //

DELIMITER ;


SELECT obtenerEstadioMasGrande();








DELIMITER //
CREATE PROCEDURE obtenerEstadioMasGrande(INOUT estadio_nombre VARCHAR(255), OUT capacidad_max DOUBLE)
BEGIN
    -- Variable para almacenar la capacidad máxima encontrada
    DECLARE max_capacidad DOUBLE DEFAULT 0;
    
    -- Variable temporal para almacenar el nombre del estadio con la mayor capacidad
    DECLARE temp_nombre_estadio VARCHAR(255);
    
    -- Consulta para encontrar el estadio con la mayor capacidad
    SELECT Nombre, capacidad INTO temp_nombre_estadio, max_capacidad
    FROM estadio
    ORDER BY capacidad DESC
    LIMIT 1;
    
    -- Asignar valores a los parámetros de salida
    SET estadio_nombre = temp_nombre_estadio;
    SET capacidad_max = max_capacidad;
END //

DELIMITER ;


CALL obtenerEstadioMasGrande(@nombre_estadio, @capacidad_maxima);

-- Ahora puedes utilizar las variables @nombre_estadio y @capacidad_maxima para acceder a los resultados obtenidos.
SELECT @nombre_estadio, @capacidad_maxima;





DELIMITER //

CREATE PROCEDURE BuscarPartidoMasGoles()
BEGIN
    DECLARE partido_actual VARCHAR(50);
    DECLARE max_goles INT DEFAULT 0;
    DECLARE partido_max_goles VARCHAR(50);

    -- Cursor para recorrer los partidos
    DECLARE cur_partidos CURSOR FOR
        SELECT PartidoID
        FROM partido
        WHERE YEAR(Fecha) = 2010;

    -- Manejador de errores
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET partido_actual = NULL;

    OPEN cur_partidos;

    leer_partidos: LOOP
        FETCH cur_partidos INTO partido_actual;
        IF partido_actual IS NULL THEN
            LEAVE leer_partidos;
        END IF;

        -- Calcular los goles en el partido actual
        SET max_goles = (
            SELECT SUM(SUBSTRING_INDEX(Resultado, '-', 1) + SUBSTRING_INDEX(Resultado, '-', -1))
            FROM partido
            WHERE PartidoID = partido_actual
        );

        -- Actualizar el máximo de goles si es necesario
        IF max_goles > max_goles THEN
            SET max_goles = max_goles;
            SET partido_max_goles = partido_actual;
        END IF;
    END LOOP;

    CLOSE cur_partidos;

    -- Mostrar el partido con más goles
    SELECT *
    FROM partido
    WHERE PartidoID = partido_max_goles;

END //

DELIMITER ;





DELIMITER //

CREATE PROCEDURE ContarParticipacionesEspaña()
BEGIN
    DECLARE contador INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE paisSeleccionado VARCHAR(255);
    
    DECLARE cur CURSOR FOR 
        SELECT Pais FROM seleccion;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    SET contador = 0;
    
    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO paisSeleccionado;
        IF done THEN
            LEAVE read_loop;
        END IF;

        IF paisSeleccionado = 'España' THEN
            SET contador = contador + 1;
        END IF;
    END LOOP;

    CLOSE cur;

    SELECT contador AS participaciones;
END //

DELIMITER ;


CALL ContarParticipacionesEspaña();
use mydb;

CREATE TABLE IF NOT EXISTS arbitro_audit (
  audit_id INT AUTO_INCREMENT PRIMARY KEY,
  ArbitroID VARCHAR(50),
  Nombre VARCHAR(50),
  Pais VARCHAR(100),
  action VARCHAR(20),
  action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



DELIMITER //

CREATE TRIGGER after_arbitro_insert
AFTER INSERT ON arbitro
FOR EACH ROW
BEGIN
  INSERT INTO arbitro_audit (ArbitroID, Nombre, Pais, action)
  VALUES (NEW.ArbitroID, NEW.Nombre, NEW.Pais, 'INSERT');
END//

DELIMITER ;

INSERT INTO arbitro (ArbitroID, Nombre, Pais) 
VALUES ('PierluigiCollina', 'Pierluigi Collina', 'Italia');














DELIMITER //

CREATE TRIGGER before_insert_jugador
BEFORE INSERT ON jugador
FOR EACH ROW
BEGIN
    -- Verificar si el nombre del jugador y la posición están presentes
    IF NEW.Nombre IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre del jugador es requerido';
    END IF;
    
    IF NEW.Posicion IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La posición del jugador es requerida';
    END IF;
END;
//

DELIMITER ;


-- Intento de inserción con un nombre de jugador nulo
INSERT INTO jugador (JugadorID, Nombre, Posicion, SeleccionID) 
VALUES ('ARQ1ARG20', NULL, 'Portero', 'ARG');




-- Inserción exitosa de un jugador con nombre y posición válidos
INSERT INTO jugador (JugadorID, Nombre, Posicion, SeleccionID) 
VALUES ('ARQ1ARG20', 'Sergio Romero', 'Portero', 'ARG');


