-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arbitro`
--

DROP TABLE IF EXISTS `arbitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitro` (
  `ArbitroID` varchar(50) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Pais` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ArbitroID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_arbitro_insert` AFTER INSERT ON `arbitro` FOR EACH ROW BEGIN
  INSERT INTO arbitro_audit (ArbitroID, Nombre, Pais, action)
  VALUES (NEW.ArbitroID, NEW.Nombre, NEW.Pais, 'INSERT');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `arbitro_audit`
--

DROP TABLE IF EXISTS `arbitro_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitro_audit` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `ArbitroID` varchar(50) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Pais` varchar(100) DEFAULT NULL,
  `action` varchar(20) DEFAULT NULL,
  `action_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `edicion`
--

DROP TABLE IF EXISTS `edicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edicion` (
  `EdicionID` varchar(255) NOT NULL,
  `Anio` int DEFAULT NULL,
  `PaisAnfitrion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EdicionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrenador`
--

DROP TABLE IF EXISTS `entrenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenador` (
  `EntrenadorID` varchar(50) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `SeleccionID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EntrenadorID`),
  KEY `fk_Entrenador_Seleccion1_idx` (`SeleccionID`),
  CONSTRAINT `fk_Entrenador_Seleccion1` FOREIGN KEY (`SeleccionID`) REFERENCES `seleccion` (`SeleccionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estadio`
--

DROP TABLE IF EXISTS `estadio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadio` (
  `EstadioID` varchar(50) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `capacidad` double DEFAULT NULL,
  PRIMARY KEY (`EstadioID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fase_eliminatoria`
--

DROP TABLE IF EXISTS `fase_eliminatoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fase_eliminatoria` (
  `FaseID` varchar(50) NOT NULL,
  `EdicionID` varchar(255) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FaseID`),
  KEY `fk_Fase_Eliminatoria_Edicion1_idx` (`EdicionID`),
  CONSTRAINT `fk_Fase_Eliminatoria_Edicion1` FOREIGN KEY (`EdicionID`) REFERENCES `edicion` (`EdicionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `GrupoID` varchar(50) NOT NULL,
  `EdicionID` varchar(255) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`GrupoID`),
  KEY `fk_Grupos_Edicion1_idx` (`EdicionID`),
  CONSTRAINT `fk_Grupos_Edicion1` FOREIGN KEY (`EdicionID`) REFERENCES `edicion` (`EdicionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `JugadorID` varchar(50) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Posicion` varchar(50) DEFAULT NULL,
  `SeleccionID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`JugadorID`),
  KEY `fk_Jugador_Seleccion1_idx` (`SeleccionID`),
  CONSTRAINT `fk_Jugador_Seleccion1` FOREIGN KEY (`SeleccionID`) REFERENCES `seleccion` (`SeleccionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_jugador` BEFORE INSERT ON `jugador` FOR EACH ROW BEGIN
    -- Verificar si el nombre del jugador y la posición están presentes
    IF NEW.Nombre IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre del jugador es requerido';
    END IF;
    
    IF NEW.Posicion IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La posición del jugador es requerida';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `LogID` int NOT NULL AUTO_INCREMENT,
  `Mensaje` varchar(255) DEFAULT NULL,
  `Accion` varchar(10) DEFAULT NULL,
  `Fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido` (
  `PartidoID` varchar(50) NOT NULL,
  `FaseID` varchar(50) DEFAULT NULL,
  `GrupoID` varchar(50) DEFAULT NULL,
  `EstadioID` varchar(50) DEFAULT NULL,
  `ArbitroID` varchar(50) DEFAULT NULL,
  `RondaID` varchar(50) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `SeleccionLocalID` varchar(50) DEFAULT NULL,
  `SeleccionVisitanteID` varchar(50) DEFAULT NULL,
  `Resultado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PartidoID`),
  KEY `fk_Partido_Fase_Eliminatoria1_idx` (`FaseID`),
  KEY `fk_Partido_Grupos1_idx` (`GrupoID`),
  KEY `fk_Partido_Estadio1_idx` (`EstadioID`),
  KEY `fk_Partido_Arbitro1_idx` (`ArbitroID`),
  KEY `fk_Partido_Ronda1_idx` (`RondaID`),
  KEY `fk_Partido_Seleccion_Local_idx` (`SeleccionLocalID`),
  KEY `fk_Partido_Seleccion_Visitante_idx` (`SeleccionVisitanteID`),
  CONSTRAINT `fk_Partido_Arbitro1` FOREIGN KEY (`ArbitroID`) REFERENCES `arbitro` (`ArbitroID`),
  CONSTRAINT `fk_Partido_Estadio1` FOREIGN KEY (`EstadioID`) REFERENCES `estadio` (`EstadioID`),
  CONSTRAINT `fk_Partido_Fase_Eliminatoria1` FOREIGN KEY (`FaseID`) REFERENCES `fase_eliminatoria` (`FaseID`),
  CONSTRAINT `fk_Partido_Grupos1` FOREIGN KEY (`GrupoID`) REFERENCES `grupos` (`GrupoID`),
  CONSTRAINT `fk_Partido_Ronda1` FOREIGN KEY (`RondaID`) REFERENCES `ronda` (`RondaID`),
  CONSTRAINT `fk_Partido_Seleccion_Local` FOREIGN KEY (`SeleccionLocalID`) REFERENCES `seleccion` (`SeleccionID`),
  CONSTRAINT `fk_Partido_Seleccion_Visitante` FOREIGN KEY (`SeleccionVisitanteID`) REFERENCES `seleccion` (`SeleccionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_partido` BEFORE INSERT ON `partido` FOR EACH ROW BEGIN
    DECLARE error_message VARCHAR(255);

    -- Verificar si FaseID existe en la tabla fase_eliminatoria
    SELECT NULL INTO error_message
    FROM fase_eliminatoria
    WHERE FaseID = NEW.FaseID;

    IF error_message IS NULL THEN
        -- Verificar si GrupoID existe en la tabla grupos
        SELECT NULL INTO error_message
        FROM grupos
        WHERE GrupoID = NEW.GrupoID;
    END IF;

    IF error_message IS NULL THEN
        -- Verificar si EstadioID existe en la tabla estadio
        SELECT NULL INTO error_message
        FROM estadio
        WHERE EstadioID = NEW.EstadioID;
    END IF;

    IF error_message IS NULL THEN
        -- Verificar si ArbitroID existe en la tabla arbitro
        SELECT NULL INTO error_message
        FROM arbitro
        WHERE ArbitroID = NEW.ArbitroID;
    END IF;

    IF error_message IS NULL THEN
        -- Verificar si SeleccionLocalID existe en la tabla seleccion
        SELECT NULL INTO error_message
        FROM seleccion
        WHERE SeleccionID = NEW.SeleccionLocalID;
    END IF;

    IF error_message IS NULL THEN
        -- Verificar si SeleccionVisitanteID existe en la tabla seleccion
        SELECT NULL INTO error_message
        FROM seleccion
        WHERE SeleccionID = NEW.SeleccionVisitanteID;
    END IF;

    -- Si error_message no está vacío, se lanza una excepción
    IF error_message IS NOT NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = error_message;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `seleccion`
--

DROP TABLE IF EXISTS `seleccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seleccion` (
  `SeleccionID` varchar(50) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Pais` varchar(255) DEFAULT NULL,
  `EntrenadorID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SeleccionID`),
  KEY `fk_Seleccion_Entrenador1_idx` (`EntrenadorID`),
  CONSTRAINT `fk_Seleccion_Entrenador1` FOREIGN KEY (`EntrenadorID`) REFERENCES `entrenador` (`EntrenadorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vista_arbitros`
--

DROP TABLE IF EXISTS `vista_arbitros`;
/*!50001 DROP VIEW IF EXISTS `vista_arbitros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_arbitros` AS SELECT 
 1 AS `ArbitroID`,
 1 AS `Total_Arbitrajes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_participaciones_selecciones`
--

DROP TABLE IF EXISTS `vista_participaciones_selecciones`;
/*!50001 DROP VIEW IF EXISTS `vista_participaciones_selecciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_participaciones_selecciones` AS SELECT 
 1 AS `pais`,
 1 AS `participaciones`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `ArbitroConMenosPartidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ArbitroConMenosPartidos`() RETURNS varchar(255) CHARSET utf8mb3
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtenerEstadioMasGrande` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtenerEstadioMasGrande`() RETURNS varchar(255) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
    DECLARE estadio_nombre VARCHAR(255);
    
    -- Obtenemos el nombre del estadio con la capacidad máxima
    SELECT Nombre INTO estadio_nombre
    FROM estadio
    ORDER BY capacidad DESC
    LIMIT 1;
    
    RETURN estadio_nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarPartidoMasGoles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPartidoMasGoles`()
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarPartidoMasGoless` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPartidoMasGoless`()
BEGIN
    DECLARE max_goles INT DEFAULT 0;
    DECLARE partido_max_goles INT;

    -- Encontrar el partido con más goles
    SELECT PartidoID, SUM(SUBSTRING_INDEX(Resultado, '-', 1) + SUBSTRING_INDEX(Resultado, '-', -1)) AS total_goles
    INTO partido_max_goles, max_goles
    FROM partido
    WHERE YEAR(Fecha) = 2010
    GROUP BY PartidoID
    ORDER BY total_goles DESC
    LIMIT 1;

    -- Mostrar el partido con más goles
    SELECT *
    FROM partido
    WHERE PartidoID = partido_max_goles;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ContarParticipacionesEspaña` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ContarParticipacionesEspaña`()
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerEstadioMasGrande` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerEstadioMasGrande`(INOUT estadio_nombre VARCHAR(255), OUT capacidad_max DOUBLE)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SeleccionesMasParticipaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionesMasParticipaciones`()
BEGIN
    -- Declarar variables
    DECLARE done INT DEFAULT FALSE;
    DECLARE pais VARCHAR(255);
    DECLARE participaciones INT;
    
    -- Declarar cursor para seleccionar las participaciones de cada país
    DECLARE cur CURSOR FOR 
        SELECT Pais, COUNT(*) AS Participaciones
        FROM seleccion_partido
        GROUP BY Pais
        ORDER BY Participaciones DESC;
        
    -- Manejador para el final del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Abrir el cursor
    OPEN cur;

    -- Inicializar contador
    SET participaciones = 0;
    
    -- Leer los resultados del cursor
    read_loop: LOOP
        -- Obtener los valores del cursor en las variables correspondientes
        FETCH cur INTO pais, participaciones;
        -- Si no hay más filas, salir del bucle
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Mostrar el resultado
        SELECT pais, participaciones;
    END LOOP;

    -- Cerrar el cursor
    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SeleccionesMasParticipacioness` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionesMasParticipacioness`()
BEGIN
    -- Declarar variables
    DECLARE done INT DEFAULT FALSE;
    DECLARE pais VARCHAR(255);
    DECLARE participaciones INT;
    
    -- Declarar cursor para seleccionar las participaciones de cada país
    DECLARE cur CURSOR FOR 
        SELECT Pais, COUNT(*) AS Participaciones
        FROM partido
        GROUP BY Pais
        ORDER BY Participaciones DESC;
        
    -- Manejador para el final del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Abrir el cursor
    OPEN cur;

    -- Inicializar contador
    SET participaciones = 0;
    
    -- Leer los resultados del cursor
    read_loop: LOOP
        -- Obtener los valores del cursor en las variables correspondientes
        FETCH cur INTO pais, participaciones;
        -- Si no hay más filas, salir del bucle
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Mostrar el resultado
        SELECT pais, participaciones;
    END LOOP;

    -- Cerrar el cursor
    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_arbitros`
--

/*!50001 DROP VIEW IF EXISTS `vista_arbitros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_arbitros` AS select `p`.`ArbitroID` AS `ArbitroID`,count(0) AS `Total_Arbitrajes` from `partido` `p` where ((`p`.`FaseID` = 'GRUPOS10') and (`p`.`ArbitroID` is not null)) group by `p`.`ArbitroID` order by `Total_Arbitrajes` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_participaciones_selecciones`
--

/*!50001 DROP VIEW IF EXISTS `vista_participaciones_selecciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_participaciones_selecciones` AS select `s`.`Pais` AS `pais`,count(0) AS `participaciones` from `seleccion` `s` group by `s`.`Pais` order by `participaciones` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19 13:24:17
