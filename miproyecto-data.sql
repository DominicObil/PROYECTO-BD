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

--
-- Dumping data for table `arbitro`
--

LOCK TABLES `arbitro` WRITE;
/*!40000 ALTER TABLE `arbitro` DISABLE KEYS */;
INSERT INTO `arbitro` VALUES ('AlbertoUndianoMallenco','Alberto Undiano Mallenco','España'),('AlbertoWarnken','Alberto Warnken',NULL),('AnibalTejada','Anibal Tejada',NULL),('BenitoArchundia','Benito Archundia','México'),('CarlosBatres','Carlos Batres','Guatemala'),('CarlosSimon','Carlos Simon','Brasil'),('DomingoLombardi','Domingo Lombardi',NULL),('EddyMaillet','Eddy Maillet','Seychelles'),('FranciscoMateucci','Francisco Mateucci',NULL),('FrankDeBleeckere','Frank De Bleeckere','Bélgica'),('GilbertoDeAlmeidaRigo','Gilberto de Almeida Rigo',NULL),('HectorBaldassi','Héctor Baldassi','Argentina'),('HenriChristophe','Henri Christophe',NULL),('HowardWebb','Howard Webb','Inglaterra'),('JeromeDamon','Jerome Damon','Sudáfrica'),('JohnBalway','John Balway',NULL),('JohnLangenus','John Langenus',NULL),('JorgeLarrionda','Jorge Larrionda','Uruguay'),('JoseMacias','José Macias',NULL),('KhalilAlGhamdi','Khalil Al Ghamdi','Arabia Saudita'),('KomanCoulibaly','Koman Coulibaly','Malí'),('MarcoRodríguez','Marco Rodríguez','México'),('MassimoBusacca','Massimo Busacca','Suiza'),('MichaelHester','Michael Hester','Nueva Zelanda'),('OlegarioBenquerença','Olegario Benquerença','Portugal'),('ÓscarRuiz','Óscar Ruiz','Colombia'),('PabloPozo','Pablo Pozo','Chile'),('PierluigiCollina','Pierluigi Collina','Italia'),('RavshanIrmatov','Ravshan Irmatov','Uzbekistán'),('RicardoVallarino','Ricardo Vallarino',NULL),('RobertoRosetti','Roberto Rosetti','Italia'),('StephaneLannoy','Stéphane Lannoy','Francia'),('UlisesSaucedo','Ulises Saucedo',NULL),('ViktorKassai','Viktor Kassai','Hungría'),('WolfgangStark','Wolfgang Stark','Alemania'),('YuichiNishimura','Yuichi Nishimura','Japón');
/*!40000 ALTER TABLE `arbitro` ENABLE KEYS */;
UNLOCK TABLES;
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
-- Dumping data for table `arbitro_audit`
--

LOCK TABLES `arbitro_audit` WRITE;
/*!40000 ALTER TABLE `arbitro_audit` DISABLE KEYS */;
INSERT INTO `arbitro_audit` VALUES (1,'PierluigiCollina','Pierluigi Collina','Italia','INSERT','2024-05-18 20:29:26');
/*!40000 ALTER TABLE `arbitro_audit` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `edicion`
--

LOCK TABLES `edicion` WRITE;
/*!40000 ALTER TABLE `edicion` DISABLE KEYS */;
INSERT INTO `edicion` VALUES ('WM1930',1930,'Uruguay'),('WM1934',1934,'Italia'),('WM1938',1938,'Francia'),('WM1950',1950,'Brasil'),('WM1954',1954,'Suiza'),('WM1958',1958,'Suecia'),('WM1962',1962,'Chile'),('WM1966',1966,'Inglaterra'),('WM1970',1970,'México'),('WM1974',1974,'Alemania Federal'),('WM1978',1978,'Argentina'),('WM1982',1982,'España'),('WM1986',1986,'México'),('WM1990',1990,'Italia'),('WM1994',1994,'Estados Unidos'),('WM1998',1998,'Francia'),('WM2002',2002,'Corea del Sur y Japón'),('WM2006',2006,'Alemania'),('WM2010',2010,'Sudáfrica'),('WM2014',2014,'Brasil'),('WM2018',2018,'Rusia'),('WM2022',2022,'Catar');
/*!40000 ALTER TABLE `edicion` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `entrenador`
--

LOCK TABLES `entrenador` WRITE;
/*!40000 ALTER TABLE `entrenador` DISABLE KEYS */;
INSERT INTO `entrenador` VALUES ('ALE74','Georg Buschner','ALE74'),('ARAB18','Juan Antonio Pizzi','ARAB18'),('ARAB94','Jorge Solari','ARAB94'),('ARAB98','Otto Rehhagel','ARAB98'),('ARG10','Diego Maradona','ARG10'),('ARG14','Alejandro Sabella','ARG14'),('ARG18','Jorge Sampaoli','ARG18'),('ARG58','Guillermo Stábile','ARG58'),('ARG62','Juan Carlos Lorenzo','ARG62'),('ARG66','Juan Carlos Lorenzo','ARG66'),('ARG74','Vladislao Cap','ARG74'),('ARG78','César Luis Menotti','ARG78'),('ARG82','César Luis Menotti','ARG82'),('ARG86','Carlos Bilardo','ARG86'),('ARG90','Carlos Bilardo','ARG90'),('ARG94','Alfio Basile','ARG94'),('ARG98','Daniel Passarella','ARG98'),('AUST10','Pim Verbeek','AUST10'),('AUST14','Ange Postecoglou','AUST14'),('AUST18','Bert van Marwijk','AUST18'),('AUT54','Walter Nausch','AUT54'),('AUT58','Karl Argauer','AUT58'),('AUT74','Rale Rasic','AUT74'),('AUT78','Helmut Senekowitsch','AUT78'),('AUT82','Georg Schmidt','AUT82'),('AUT90','Josef Hickersberger','AUT90'),('AUT98','Herbert Prohaska','AUT98'),('BEL14','Marc Wilmots','BEL14'),('BEL18','Roberto Martínez','BEL18'),('BEL54','Doug Livingstone','BEL54'),('BEL82','Guy Thys','BEL82'),('BEL86','Guy Thys','BEL86'),('BEL90','Guy Thys','BEL90'),('BEL94','Paul Van Himst','BEL94'),('BEL98','Georges Leekens','BEL98'),('BOL50','Bolivia','BOL50'),('BOL94','Xabier Azkargorta','BOL94'),('BRA10','Dunga','BRA10'),('BRA14','Luiz Felipe Scolari','BRA14'),('BRA18','Tite','BRA18'),('BRA50','Flávio Costa','BRA50'),('BRA54','Zezé Moreira','BRA54'),('BRA58','Vicente Feola','BRA58'),('BRA62','Aymoré Moreira','BRA62'),('BRA66','Vicente Feola','BRA66'),('BRA74','Mário Zagallo','BRA74'),('BRA78','Cláudio Coutinho','BRA78'),('BRA82','Tele Santana','BRA82'),('BRA86','Telê Santana','BRA86'),('BRA90','Sebastião Lazaroni','BRA90'),('BRA94','Carlos Alberto Parreira','BRA94'),('BRA98','Mário Zagallo','BRA98'),('BUL62','Pavel Sadyrin','BUL62'),('BUL66','Rudolf Vytlačil','BUL66'),('BUL74','Aleksandar Markov','BUL74'),('BUL86','Stoycho Mladenov','BUL86'),('BUL94','Dimitar Penev','BUL94'),('BUL98','Hristo Bonev','BUL98'),('BYH14','Safet Sušić','BYH14'),('CAM10','Paul Le Guen','CAM10'),('CAM14','Volker Finke','CAM14'),('CAM82','Karl-Heinz Weigang','CAM82'),('CAM90','Valeri Nepomniachi','CAM90'),('CAM94','Henri Michel','CAM94'),('CAM98','Claude Le Roy','CAM98'),('CAN86','Tony Waiters','CAN86'),('CHI10','Marcelo Bielsa','CHI10'),('CHI14','Jorge Sampaoli','CHI14'),('CHI50','Arturo Bucciardi','CHI50'),('CHI62','Fernando Riera','CHI62'),('CHI66','Luis Álamos','CHI66'),('CHI74','Luis Álamos','CHI74'),('CHI82','Luis Santibáñez','CHI82'),('CHI98','Nelson Acosta','CHI98'),('COL14','José Pékerman','COL14'),('COL18','José Pékerman','COL18'),('COL62','Adolfo Pedernera','COL62'),('COL90','Francisco Maturana','COL90'),('COL94','Francisco Maturana','COL94'),('COL98','Hernán Darío Gómez','COL98'),('COSTM10','Sven-Göran Eriksson','COSTM10'),('COSTM14','Sabri Lamouchi','COSTM14'),('COSTR14','Jorge Luis Pinto','COSTR14'),('COSTR18','Óscar Ramírez','COSTR18'),('COSTR90','Bora Milutinović','COSTR90'),('CRO14','Niko Kovač','CRO14'),('CRO18','Zlatko Dalić','CRO18'),('CRO98','Miroslav Blažević','CRO98'),('CZE54','Karel Kolský','CZE54'),('CZE58','Karel Kolský','CZE58'),('CZE62','Rudolf Vytlačil','CZE62'),('CZE82','Jozef Vengloš','CZE82'),('CZE90','Jozef Vengloš','CZE90'),('DEU10','Joachim Löw','DEU10'),('DEU14','Joachim Löw','DEU14'),('DEU18','Joachim Löw','DEU18'),('DEU54','Sepp Herberger','DEU54'),('DEU58','Sepp Herberger','DEU58'),('DEU62','Sepp Herberger','DEU62'),('DEU66','Helmut Schön','DEU66'),('DEU74','Helmut Schön','DEU74'),('DEU78','Helmut Schön','DEU78'),('DEU82','Jupp Derwall','DEU82'),('DEU86','Franz Beckenbauer','DEU86'),('DEU90','Franz Beckenbauer','DEU90'),('DEU94','Berti Vogts','DEU94'),('DEU98','Berti Vogts','DEU98'),('DIN10','Morten Olsen','DIN10'),('DIN18','Åge Hareide','DIN18'),('DIN86','Sepp Piontek','DIN86'),('DIN98','Bo Johansson','DIN98'),('DZ10','Rabah Saâdane','DZ10'),('DZ14','Vahid Halilhodžić','DZ14'),('DZ82','Mahieddine Khalef','DZ82'),('DZ86','Rabah Saâdane','DZ86'),('ECU14','Reinaldo Rueda','ECU14'),('EGY18','Héctor Cúper','EGY18'),('EGY90','Mahmoud El-Gohary','EGY90'),('EMA90','Carlos Queiroz','EMA90'),('ENTA','Amadeo García','ESP'),('ENTB','Boško Simonović','YUG'),('ENTBG','Bob Glendenning','NLD'),('ENTDG','David Gould','USA'),('ENTFA','Felipe Pascucci','ARG'),('ENTG','Francisco Olazar','ARG'),('ENTHA','Hugo Meisl','AUT'),('ENTHG','Hector Goetinck','BEL'),('ENTHM','Heini Müller','SUI'),('ENTJM','James McCrae','EGY'),('ENTJR','Josef Uridil','ROU'),('ENTJS','József Nagy','SWE'),('ENTKC','Karel Petru','CHE'),('ENTLV','Luiz Vinhaes','BRA'),('ENTO','Robert Millar','USA'),('ENTOD','Otto Nerz','DEU'),('ENTON','Ödön Nádas','HUN'),('ENTSF','Sid Kimpton','FRA'),('ENTT','Alberto Suppici','URU'),('ENTVI','Vittorio Pozzo','ITA'),('ESA82','Mauricio Rodríguez','ESA82'),('ESP10','Vicente del Bosque','ESP10'),('ESP14','Vicente del Bosque','ESP14'),('ESP18','Fernando Hierro (interino)','ESP18'),('ESP50','Guillermo Eizaguirre','ESP50'),('ESP62','José Villalonga','ESP62'),('ESP66','José Villalonga','ESP66'),('ESP78','László Kubala','ESP78'),('ESP82','José Santamaría','ESP82'),('ESP86','Miguel Muñoz','ESP86'),('ESP90','Luis Suárez','ESP90'),('ESP94','Javier Clemente','ESP94'),('ESP98','Javier Clemente','ESP98'),('FRA10','Raymond Domenech','FRA10'),('FRA14','Didier Deschamps','FRA14'),('FRA18','Didier Deschamps','FRA18'),('FRA54','Pierre Pibarot','FRA54'),('FRA58','Albert Batteux','FRA58'),('FRA66','Henri Guérin','FRA66'),('FRA78','Michel Hidalgo','FRA78'),('FRA82','Michel Hidalgo','FRA82'),('FRA86','Henri Michel','FRA86'),('FRA98','Aimé Jacquet','FRA98'),('GHA10','Milovan Rajevac','GHA10'),('GHA14','James Kwesi Appiah','GHA14'),('GRE10','Otto Rehhagel','GRE10'),('GRE14','Fernando Santos','GRE14'),('GRE94','Alketas Panagoulias','GRE94'),('HAI74','Antoine Tassy','HAI74'),('HON10','Reinaldo Rueda','HON10'),('HON14','Luis Fernando Suárez','HON14'),('HON82','Chelato Uclés','HON82'),('HUN54','Gusztáv Sebes','HUN54'),('HUN58','Gusztáv Sebes','HUN58'),('HUN62','Lajos Baróti','HUN62'),('HUN66','Lajos Baróti','HUN66'),('HUN82','Kálmán Mészöly','HUN82'),('HUN86','György Mezey','HUN86'),('HUNG78','Lajos Baróti','HUNG78'),('ING10','Fabio Capello','ING10'),('ING14','Roy Hodgson','ING14'),('ING18','Gareth Southgate','ING18'),('ING50','Walter Winterbottom','ING50'),('ING54','Walter Winterbottom','ING54'),('ING58','Walter Winterbottom','ING58'),('ING62','Walter Winterbottom','ING62'),('ING66','Alf Ramsey','ING66'),('ING82','Ron Greenwood','ING82'),('ING86','Sir Bobby Robson','ING86'),('ING90','Bobby Robson','ING90'),('ING98','Glenn Hoddle','ING98'),('IRA14','Carlos Queiroz','IRA14'),('IRA18','Carlos Queiroz','IRA18'),('IRA78','Carlos Queiroz','IRA78'),('IRA98','Jalal Talebi','IRA98'),('IRK86','Evaristo de Macedo','IRK86'),('IRL90','Jack Charlton','IRL90'),('IRL94','Jack Charlton','IRL94'),('IRLN58','Peter Doherty','IRLN58'),('IRLN82','Billy Bingham','IRLN82'),('IRLN86','Billy Bingham','IRLN86'),('ISL18','Heimir Hallgrímsson','ISL18'),('ITA10','Marcello Lippi','ITA10'),('ITA14','Cesare Prandelli','ITA14'),('ITA50','Ferruccio Novo','ITA50'),('ITA54','Lajos Czeizler','ITA54'),('ITA62','Giovanni Ferrari','ITA62'),('ITA66','Edmondo Fabbri','ITA66'),('ITA74','Ferruccio Valcareggi','ITA74'),('ITA78','Enzo Bearzot','ITA78'),('ITA82','Enzo Bearzot','ITA82'),('ITA86','Enzo Bearzot','ITA86'),('ITA90','Azeglio Vicini','ITA90'),('ITA94','Arrigo Sacchi','ITA94'),('ITA98','Cesare Maldini','ITA98'),('JAM98','René Simões','JAM98'),('JAP10','Takeshi Okada','JAP10'),('JAP14','Alberto Zaccheroni','JAP14'),('JAP18','Akira Nishino','JAP18'),('JAP98','Takeshi Okada','JAP98'),('KOR10','Huh Jung-moo','KOR10'),('KOR14','Hong Myung-bo','KOR14'),('KOR18','Shin Tae-yong','KOR18'),('KOR54','Kim Yong-sik','KOR54'),('KOR86','Choi Eun-taek','KOR86'),('KOR90','Park Jong-hwan','KOR90'),('KOR94','Kim Ho','KOR94'),('KOR98','Cha Bum-kun','KOR98'),('KORN10','Kim Jong-hun','KORN10'),('KORN66','Myong Rye Hong','KORN66'),('KUW82','Carlos Alberto Parreira','KUW82'),('MARR18','Hervé Renard','MARR18'),('MARR86','José Faria','MARR86'),('MARR94','Abdellah Blinda','MARR94'),('MARR98','Henri Michel','MARR98'),('MEX10','Javier Aguirre','MEX10'),('MEX14','Miguel Herrera','MEX14'),('MEX18','Juan Carlos Osorio','MEX18'),('MEX50','México','MEX50'),('MEX54','Antonio López Herranz','MEX54'),('MEX58','Antonio López Herranz','MEX58'),('MEX62','Ignacio Trelles','MEX62'),('MEX66','Ignacio Trelles','MEX66'),('MEX78','José Antonio Roca','MEX78'),('MEX86','Bora Milutinović','MEX86'),('MEX94','Miguel Mejía Barón','MEX94'),('MEX98','Manuel Lapuente','MEX98'),('NIG10','Lars Lagerbäck','NIG10'),('NIG14','Stephen Keshi','NIG14'),('NIG18','Gernot Rohr','NIG18'),('NIG94','Clemens Westerhof','NIG94'),('NIG98','Bora Milutinović','NIF98'),('NLD10','Bert van Marwijk','NLD10'),('NLD14','Louis van Gaal','NLD14'),('NLD74','Rinus Michels','NLD74'),('NLD78','Ernst Happel','NLD78'),('NLD90','Leo Beenhakker','NLD90'),('NLD94','Dick Advocaat','NLD94'),('NLD98','Guus Hiddink','NLD98'),('NOR94','Egil Olsen','NOR94'),('NOR98','Egil Olsen','NOR98'),('NZ10','Ricki Herbert','NZ10'),('NZ82','John Adshead','NZ82'),('PAN18','Hernán Darío Gómez','PAN18'),('PER18','Ricardo Gareca','PER18'),('PER78','Marcos Calderón','PER78'),('PER82','Tim','PER82'),('POL18','Adam Nawałka','POL18'),('POL74','Kazimierz Górski','POL74'),('POL78','Jacek Gmoch','POL78'),('POL82','Antoni Piechniczek','POL82'),('POL86','Antoni Piechniczek','POL86'),('POR10','Carlos Queiroz','POR10'),('POR14','Paulo Bento','POR14'),('POR18','Fernando Santos','POR18'),('POR66','Otto Glória','POR66'),('POR86','José Torres','POR86'),('PRY10','Gerardo Martino','PRY10'),('PRY50','Paraguay',NULL),('PRY58','Aurelio González','PRY58'),('PRY86','Cayetano Ré','PRY86'),('PRY98','Paulo César Carpegiani','PRY98'),('ROU90','Mircea Lucescu','ROU90'),('ROU94','Anghel Iordănescu','ROU94'),('ROU98','Anghel Iordănescu','ROU98'),('RUS14','Fabio Capello','RUS14'),('RUS18','Stanislav Cherchésov','RUS18'),('RUS58','Gavriil Kachalin','RUS58'),('RUS62','Gavriil Kachalin','RUS62'),('RUS66','Nikolai Morozov','RUS66'),('RUS82','Konstantin Beskov','RUS82'),('RUS86','Valery Lobanovsky','RUS86'),('RUS90','Valery Lobanovsky','RUS90'),('RUS94','Pavel Sadyrin','RUS94'),('SCO54','Andy Beattie','SCO54'),('SCO58','Dawson Walker','SCO58'),('SCO74','Willie Ormond','SCO74'),('SCO78','Ally MacLeod','SCO78'),('SCO82','Alex Ferguson','SCO82'),('SCO86','Alex Ferguson','SCO86'),('SCO90','Andy Roxburgh','SCO90'),('SCO98','Craig Brown','SCO98'),('SEN18','Aliou Cissé','SEN18'),('SER10','Radomir Antić','SER10'),('SER18','Mladen Krstajić','SER18'),('SLO10','Matjaž Kek','SLO10'),('SUD10','Carlos Alberto Parreira','SUD10'),('SUD98','Philippe Troussier','SUD98'),('SUI10','Ottmar Hitzfeld','SUI10'),('SUI14','Ottmar Hitzfeld','SUI14'),('SUI18','Vladimir Petković','SUI18'),('SUI50','Franco Andreoli','SUI50'),('SUI54','Karl Rappan','SUI54'),('SUI62','Karl Rappan','SUI62'),('SUI66','Louis Maurer','SUI66'),('SUI94','Roy Hodgson','SUI94'),('SVK10','Vladimír Weiss','SVK10'),('SWE18','Janne Andersson','SWE18'),('SWE50','George Raynor','SWE50'),('SWE58','Nils Simonsson','SWE58'),('SWE74','Georg Ericson','SWE74'),('SWE78','Georg Ericson','SWE78'),('SWE90','Olle Nordin','SWE90'),('SWE94','Tommy Svensson','SWE94'),('TUN18','Nabil Maâloul','TUN18'),('TUN78','Abdelmajid Chetali','TUN78'),('TUN98','Henryk Kasperczak','TUN98'),('TUR54','Sandro Puppo','TUR54'),('URU10','Óscar Tabárez','URU10'),('URU14','Óscar Tabárez','URU14'),('URU18','Óscar Tabárez','URU18'),('URU50','Juan López Fontana','URU50'),('URU54','Juan López Fontana','URU54'),('URU62','Juan Carlos Corazzo','URU62'),('URU66','Ondino Viera','URU66'),('URU74','Omar Borrás','URU74'),('URU86','Omar Borrás','URU86'),('URU90','Óscar Tabárez','URU90'),('USA10','Bob Bradley','USA10'),('USA14','Jurgen Klinsmann','USA14'),('USA50','Estados Unidos','USA50'),('USA90','Bob Gansler','USA90'),('USA94','Bora Milutinović','USA94'),('USA98','Steve Sampson','USA98'),('WAL58','Jimmy Murphy','WAL58'),('YUG50','Milorad Arsenijević','YUG50'),('YUG54','Aleksandar Tirnanić','YUG54'),('YUG58','Aleksandar Tirnanić','YUG58'),('YUG62','Ljubomir Lovrić','YUG62'),('YUG74','Miljan Miljanić','YUG74'),('YUG82','Miljan Miljanić','YUG82'),('YUG90','Ivica Osim','YUG90'),('YUG98','Slobodan Santrač','YUG98'),('ZAI74','Blagoje Vidinić','ZAI74');
/*!40000 ALTER TABLE `entrenador` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `estadio`
--

LOCK TABLES `estadio` WRITE;
/*!40000 ALTER TABLE `estadio` DISABLE KEYS */;
INSERT INTO `estadio` VALUES ('Allianz Arena','Allianz Arena','Múnich',75000),('AOL Arena','AOL Arena','Hamburgo',57000),('Arena Corinthians','Arena Corinthians','São Paulo',49000),('Arena da Amazônia','Arena da Amazônia','Manaos',44000),('Arena da Baixada','Arena da Baixada','Curitiba',48000),('Arena Fonte Nova','Arena Fonte Nova','Salvador',42000),('Arena Pantanal','Arena Pantanal','Cuiabá',39000),('Arena Pernambuco','Arena Pernambuco','Recife',46000),('Arosvallen','Arosvallen','Västerås',10000),('AWD-Arena','AWD-Arena','Hannover',49000),('Ayresome Park','Ayresome Park','Middlesbrough',35000),('Balaídos','Balaídos','Vigo',31000),('Camp Nou','Camp Nou','Barcelona',99000),('Chateau Carreras','Chateau Carreras','Córdoba',57000),('Citrus Bowl','Citrus Bowl','Orlando, Florida',65000),('Commerzbank-Arena','Commerzbank-Arena','Fráncfort del Meno',51000),('Cordiviola','Cordiviola','Rosario',42000),('Cotton Bowl','Cotton Bowl','Dallas, Texas',92000),('Ekaterimburgo Arena','Ekaterimburgo Arena','Ekaterimburgo',35000),('El Fortín de Liniers','El Fortín de Liniers','Buenos Aires',49000),('El Monumental','El Monumental','Buenos Aires',70000),('Estadio 974','Estadio 974','Doha',40000),('Estadio Áhmad bin Ali','Estadio Áhmad bin Ali','Al Wakrah',45000),('Estadio Al Bayt','Estadio Al Bayt','Jor',48000),('Estadio Al Janoub','Estadio Al Janoub','Al Wakrah',42000),('Estadio Al Thumama','Estadio Al Thumama','Doha',51000),('Estadio Artemio Franchi','Estadio Artemio Franchi','Florencia',47000),('Estadio Artemio Franchi (Florencia)','Estadio Artemio Franchi (Florencia)','Florencia',47000),('Estadio Asiad','Estadio Asiad','Busan',48000),('Estadio Azteca','Estadio Azteca','Ciudad de México',87000),('Estadio Beira-Rio','Estadio Beira-Rio','Porto Alegre',50000),('Estadio Benito Villamarín','Estadio Benito Villamarín','Sevilla',63000),('Estadio Carlos Dittborn','Estadio Carlos Dittborn','Arica',20000),('Estadio Carlos Tartiere','Estadio Carlos Tartiere','Oviedo',30000),('Estadio Castelão','Estadio Castelão','Fortaleza',64000),('Estadio Centenario','Estadio Centenario','Montevideo',60000),('Estadio Chapou','Estadio Chapou','Toulouse',35000),('Estadio Ciudad de la Educación','Estadio Ciudad de la Educación','Rayán',45000),('Estadio Cuauhtémoc','Estadio Cuauhtémoc','Puebla',45000),('Estadio das Dunas','Estadio das Dunas','Natal',42000),('Estadio de Daegu','Estadio de Daegu','Daegu',67000),('Estadio de Francia','Estadio de Francia','Saint-Denis',80000),('Estadio de Kaliningrado','Estadio de Kaliningrado','Kaliningrado',35000),('Estadio de Kashima','Estadio de Kashima','Kashima',42000),('Estadio de la Beaujoire','Stade Louis-Fonteneau','Nantes',38000),('Estadio de la Braden Copper Co.','Estadio de la Braden Copper Co.','Rancagua',16000),('Estadio de la Meinau','Estadio de la Meinau','Estrasburgo',27000),('Estadio de las Alas','Estadio de las Alas','Kobe',42000),('Estadio de Lusail','Estadio de Lusail','Lusail',80000),('Estadio de Miyagi','Estadio de Miyagi','Miyagi',49000),('Estadio de Niigata','Estadio de Niigata','Niigata',42000),('Estadio de Nizhni Nóvgorod','Estadio de Nizhni Nóvgorod','Nizhni Nóvgorod',45000),('Estadio de Riazor','Estadio de Riazor','La Coruña',34000),('Estadio de Saitama','Estadio de Saitama','Saitama',63000),('Estadio de San Petersburgo','Estadio de San Petersburgo','San Petersburgo',67000),('Estadio delle Alpi','Estadio delle Alpi','Turín',70000),('Estadio Durival de Britto e Silva','Estadio Durival de Britto e Silva','Curitiba',20000),('Estadio Ecopa','Estadio Ecopa','Shizuoka',50000),('Estadio El Molinón','Estadio El Molinón','Gijón',30000),('Estadio Ellis Park','Estadio Ellis Park','Johannesburgo',62000),('Estadio Eucaliptos','Estadio Eucaliptos','Porto Alegre',25000),('Estadio Fisht','Estadio Fisht','Sochi',47000),('Estadio Fort Carré','Estadio Fort Carré','Antibes',12000),('Estadio Free State','Estadio Free State','Bloemfontein',48000),('Estadio Friuli','Estadio Friuli','Udine',41000),('Estadio Geoffroy-Guichard','Estadio Geoffroy-Guichard','Saint-Étienne',42000),('Estadio Giuseppe Grezar','Estadio Giuseppe Grezar','Trieste',32000),('Estadio Giuseppe Meazza','Estadio Giuseppe Meazza','Milán',80000),('Estadio Gran Parque Central','Estadio Gran Parque Central','Montevideo',30000),('Estadio Green Point','Estadio Green Point','Ciudad del Cabo',55000),('Estadio Ilha do Retiro','Estadio Ilha do Retiro','Recife',35000),('Estadio Independência','Estadio Independência','Belo Horizonte',23000),('Estadio Internacional','Estadio Internacional','Yokohama',72000),('Estadio Internacional Khalifa','Estadio Internacional Khalifa','Doha',68000),('Estadio Jalisco','Estadio Jalisco','Guadalajara',56000),('Estadio Järnvallen','Estadio Järnvallen','Sandviken',8000),('Estadio José Rico Pérez','Estadio José Rico Pérez','Alicante',30000),('Estadio La Bombonera','Estadio La Bombonera','Toluca',48000),('Estadio La Corregidora','Estadio La Corregidora','Querétaro',45000),('Estadio La Favorita','Estadio La Favorita','Palermo',37000),('Estadio La Romareda','Estadio La Romareda','Zaragoza',34000),('Estadio La Rosaleda','Estadio La Rosaleda','Málaga',30000),('Estadio Loftus Versfeld','Estadio Loftus Versfeld','Pretoria',51000),('Estadio Luigi Ferraris','Estadio Luigi Ferraris','Génova',36000),('Estadio Luis Casanova','Estadio Luis Casanova','Valencia',50000),('Estadio Luis Gutiérrez Dosal','Estadio Luis Gutiérrez Dosal','Toluca',40000),('Estadio Luzhniki','Estadio Luzhniki','Moscú',81000),('Estadio Maracaná','Estadio Maracaná','Río de Janeiro',78000),('Estadio Marcantonio Bentegodi','Estadio Marcantonio Bentegodi','Verona',40000),('Estadio Mbombela','Estadio Mbombela','Nelspruit',81000),('Estadio Mineirão','Estadio Mineirão','Belo Horizonte',78000),('Estadio Moses Mabhida','Estadio Moses Mabhida','Durban',40000),('Estadio Mundialista de Daejeon','Mundialista de Daejeon','Daejeon',40000),('Estadio Mundialista de Gwangju','Mundialista de Gwangju','Gwangju',62000),('Estadio Mundialista de Jeju','Mundialista de Jeju','Seogwipo',54000),('Estadio Mundialista de Jeonju','Mundialista de Jeonju','Jeonju',40000),('Estadio Mundialista de Seúl','Mundialista de Seúl','Seúl',49000),('Estadio Mundialista de Suwon','Mundialista de Suwon','Suwon',44000),('Estadio Mundialista de Ulsan','Mundialista de Ulsan','Ulsan',44000),('Estadio Munhak','Estadio Munhak','Incheon',67000),('Estadio Nacional','Estadio Nacional','Brasilia',80000),('Estadio Nacional de Chile','Estadio Nacional de Chile','Santiago',43000),('Estadio Nacional del Partido Nacional Fascista','Estadio Nacional del Partido Nacional Fascista','Roma',75000),('Estadio Nagai','Estadio Nagai','Osaka',55000),('Estadio Nelson Mandela Bay','Estadio Nelson Mandela Bay','Puerto Elizabeth',10000),('Estadio Neza 86','Estadio Neza 86','Nezahualcóyotl',20000),('Estadio Nou Camp','Estadio Nou Camp','León',50000),('Estadio Olímpico','Estadio Olímpico','Roma',79000),('Estadio Olímpico de Turín','Estadio Olímpico de Turín','Turín',75000),('Estadio Pacaembú','Estadio Pacaembú','São Paulo',75000),('Estadio Partenopeo','Estadio Partenopeo','Avellino',75000),('Estadio Peter Mokaba','Estadio Peter Mokaba','Polokwane',25000),('Estadio Pocitos','Estadio Pocitos','Montevideo',68000),('Estadio Ramón Sánchez Pizjuán','Estadio Ramón Sánchez Pizjuán','Sevilla',75000),('Estadio Råsunda','Estadio Råsunda','Solna',75000),('Estadio Renato Dall\'Ara','Estadio Renato Dall\'Ara','Bolonia',75000),('Estadio Rhein Energie','Estadio Rhein Energie','Colonia',75000),('Estadio Royal Bafokeng','Estadio Royal Bafokeng','Rustenburg',75000),('Estadio San Nicola','Estadio San Nicola','Bari',75000),('Estadio San Paolo','Estadio San Paolo','Nápoles',75000),('Estadio San Siro/Estadio Giuseppe Meazza','Estadio San Siro/Estadio Giuseppe Meazza','Milán',75000),('Estadio Sant\'Elia','Estadio Sant\'Elia','Cagliari',75000),('Estadio Santiago Bernabéu','Estadio Santiago Bernabéu','Madrid',75000),('Estadio Sarriá','Estadio Sarriá','Barcelona',75000),('Estadio Sausalito','Estadio Sausalito','Viña del Mar',75000),('Estadio Sergio León Chávez','Estadio Sergio León Chávez','Irapuato',75000),('Estadio Soccer City','Estadio Soccer City','Johannesburgo',75000),('Estadio Tecnológico','Estadio Tecnológico','Monterrey',75000),('Estadio Tres de Marzo','Estadio Tres de Marzo','Zapopan',75000),('Estadio Universitario','Estadio Universitario','San Nicolás de los Garza',75000),('Estadio Vélodrome','Estadio Vélodrome','Marsella',75000),('Estadio Vélodrome Municipal','Estadio Vélodrome Municipal','Reims',75000),('Estadio Vicente Calderón','Estadio Vicente Calderón','Madrid',75000),('Estadio Victor Boucquey','Estadio Victor Boucquey','Lille',75000),('Eyravallen','Eyravallen','Örebro',75000),('Foxboro Stadium','Foxboro Stadium','Foxborough, Massachusetts (Área de Boston)',75000),('Frankenstadion','Frankenstadion','Núremberg',75000),('Fritz-Walter-Stadion','Fritz-Walter-Stadion','Kaiserslautern',75000),('Giants Stadium','Giants Stadium','East Rutherford, Nueva Jersey (Área de Nueva York)',75000),('Gigante de Arroyito','Gigante de Arroyito','Rosario',75000),('Goodison Park','Goodison Park','Liverpool',75000),('Gottlieb-Daimler-Stadion','Gottlieb-Daimler-Stadion','Stuttgart',75000),('Hardturm-Stadion','Hardturm-Stadion','Zürich',75000),('Hillsborough','Hillsborough','Sheffield',75000),('Iddrotsparken','Iddrotsparken','Norrköping',75000),('Kazán Arena','Kazán Arena','Kazán',75000),('Malmö Stadion','Malmö Stadion','Malmö',75000),('Mordovia Arena','Mordovia Arena','Saransk',75000),('Mundialista','Mundialista','Mar del Plata',75000),('Neckarstadion','Neckarstadion','Stuttgart',75000),('Niedersachsenstadion','Niedersachsenstadion','Hanover',75000),('Nuevo Estadio','Nuevo Estadio','Elche',75000),('Nuevo José Zorrilla','Nuevo José Zorrilla','Valladolid',75000),('Nya Ullevi','Nya Ullevi','Gotemburgo',75000),('Ōita Bank Dome','Ōita Bank Dome','Ōita',75000),('Old Trafford','Old Trafford','Mánchester',75000),('Olímpico de Berlín','Olímpico de Berlín','Berlín Occidental',75000),('Olímpico de Múnich','Olímpico de Múnich','Múnich',75000),('Olímpico Universitario','Olímpico Universitario','Ciudad de México',75000),('Olympiastadion','Olympiastadion','Helsingborg',75000),('Örjans Vall','Örjans Vall','Halmstad',75000),('Otkrytie Arena','Otkrytie Arena','San Petersburgo',75000),('Parc Lescure','Parc Lescure','Burdeos',75000),('Parkstadion','Parkstadion','Gelsenkirchen',75000),('Parque de los Príncipes','Parque de los Príncipes','París',75000),('Pontiac Silverdome','Pontiac Silverdome','Pontiac, Míchigan (Área de Detroit)',75000),('Rheinstadion','Rheinstadion','Düsseldorf',75000),('Rimnersvallen','Rimnersvallen','Uddevalla',75000),('Robert F. Kennedy Memorial Stadium','Robert F. Kennedy Memorial Stadium','Washington, D.C.',75000),('Roker Park','Roker Park','Sunderland',75000),('Rose Bowl','Rose Bowl','Pasadena, California (Área de Los Ángeles)',75000),('Rostov Arena','Rostov Arena','Rostov del Don',75000),('Ryavallen','Ryavallen','Borås',75000),('Samara Arena','Samara Arena','Samara',75000),('San Mamés','San Mamés','Bilbao',75000),('San Martin','San Martin','Mendoza',75000),('Sapporo Dome','Sapporo Dome','Sapporo',75000),('Signal Iduna Park','Signal Iduna Park','Dortmund',75000),('Soldier Field','Soldier Field','Chicago, Illinois',75000),('St. Jakob Stadium','St. Jakob Stadium','Basilea',75000),('Stade de la Cavée Verte','Stade de la Cavée Verte','El Havre',75000),('Stade de la Mosson','Stade de la Mosson','Montpellier',75000),('Stade de Toulouse','Stadium Municipal','Toulouse',75000),('Stade des Charmilles','Stade des Charmilles','Ginebra',75000),('Stade Félix Bollaert','Stade Félix Bollaert','Lens',75000),('Stade Gerland','Stade Gerland','Lyon',75000),('Stade Olympique de Colombes','Stade Olympique de Colombes','París',75000),('Stade Olympique de la Pontaise','Stade Olympique de la Pontaise','Lausanne',75000),('Stade Vélodrome','Stade Vélodrome','Marsella',75000),('Stadio di Cornaredo','Stadio di Cornaredo','Lugano',75000),('Stanford Stadium','Stanford Stadium','Stanford, California (Área de San Francisco)',75000),('Tunavallen','Tunavallen','Eskilstuna',75000),('Veltins-Arena','Veltins-Arena','Gelsenkirchen',75000),('Villa Park','Villa Park','Birmingham',75000),('Volgogrado Arena','Volgogrado Arena','Volgogrado',75000),('Volksparkstadion','Volksparkstadion','Hamburgo',75000),('Waldstadion','Waldstadion','Fráncfort',75000),('Wankdorf Stadium','Wankdorf Stadium','Berna',75000),('Wembley','Wembley','Londres',75000),('Westfalenstadion','Westfalenstadion','Dortmund',75000),('White City','White City','Londres',75000),('Zentralstadion','Zentralstadion','Leipzig',75000);
/*!40000 ALTER TABLE `estadio` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `fase_eliminatoria`
--

LOCK TABLES `fase_eliminatoria` WRITE;
/*!40000 ALTER TABLE `fase_eliminatoria` DISABLE KEYS */;
INSERT INTO `fase_eliminatoria` VALUES ('3erPUESTO10','WM2010','Tercer lugar'),('CUAR10','WM2010','Cuartos de Final'),('CUAR34','WM1934','Cuartos de final'),('FINAL','URU1930','Final'),('FINAL10','WM2010','Final'),('FINAL34','WM1934','Final'),('GRUPOS','URU1930','Fase de Grupos'),('GRUPOS10','WM2010','Fase de Grupos'),('OCT10','WM2010','Octavos de Final'),('OCT34','WM1934','Octavos de final'),('SEMI10','WM2010','Semifinales'),('SEMI34','WM1934','Semifinales'),('SEMIFINAL','URU1930','Semifinales');
/*!40000 ALTER TABLE `fase_eliminatoria` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES ('A1','WM1930','Grupo A'),('A10','WM1974','Grupo A'),('A11','WM1978','Grupo A'),('A12','WM1982','Grupo A'),('A13','WM1986','Grupo A'),('A14','WM1990','Grupo A'),('A15','WM1994','Grupo A'),('A16','WM1998','Grupo A'),('A17','WM2002','Grupo A'),('A18','WM2006','Grupo A'),('A19','WM2010','Grupo A'),('A2','WM2018','Grupo A'),('A20','WM2014','Grupo A'),('A4','WM1950','Grupo A'),('A5','WM1954','Grupo A'),('A6','WM1958','Grupo A'),('A7','WM1962','Grupo A'),('A8','WM1966','Grupo A'),('A9','WM1970','Grupo A'),('B1','WM1930','Grupo B'),('B10','WM1974','Grupo B'),('B11','WM1978','Grupo B'),('B12','WM1982','Grupo B'),('B13','WM1986','Grupo B'),('B14','WM1990','Grupo B'),('B15','WM1994','Grupo B'),('B16','WM1998','Grupo B'),('B17','WM2002','Grupo B'),('B18','WM2006','Grupo B'),('B19','WM2010','Grupo B'),('B2','WM2018','Grupo B'),('B20','WM2014','Grupo B'),('B4','WM1950','Grupo B'),('B5','WM1954','Grupo B'),('B6','WM1958','Grupo B'),('B7','WM1962','Grupo B'),('B8','WM1966','Grupo B'),('B9','WM1970','Grupo B'),('C1','WM1930','Grupo C'),('C10','WM1974','Grupo C'),('C11','WM1978','Grupo C'),('C12','WM1982','Grupo C'),('C13','WM1986','Grupo C'),('C14','WM1990','Grupo C'),('C15','WM1994','Grupo C'),('C16','WM1998','Grupo C'),('C17','WM2002','Grupo C'),('C18','WM2006','Grupo C'),('C19','WM2010','Grupo C'),('C2','WM2018','Grupo C'),('C20','WM2014','Grupo C'),('C4','WM1950','Grupo C'),('C5','WM1954','Grupo C'),('C6','WM1958','Grupo C'),('C7','WM1962','Grupo C'),('C8','WM1966','Grupo C'),('C9','WM1970','Grupo C'),('D1','WM1930','Grupo D'),('D10','WM1974','Grupo D'),('D11','WM1978','Grupo D'),('D12','WM1982','Grupo D'),('D13','WM1986','Grupo D'),('D14','WM1990','Grupo D'),('D15','WM1994','Grupo D'),('D16','WM1998','Grupo D'),('D17','WM2002','Grupo D'),('D18','WM2006','Grupo D'),('D19','WM2010','Grupo D'),('D2','WM2018','Grupo D'),('D20','WM2014','Grupo D'),('D4','WM1950','Grupo D'),('D5','WM1954','Grupo D'),('D6','WM1958','Grupo D'),('D7','WM1962','Grupo D'),('D8','WM1966','Grupo D'),('D9','WM1970','Grupo D'),('E10','WM1974','Grupo E'),('E11','WM1978','Grupo E'),('E12','WM1982','Grupo E'),('E13','WM1986','Grupo E'),('E14','WM1990','Grupo E'),('E15','WM1994','Grupo E'),('E16','WM1998','Grupo E'),('E17','WM2002','Grupo E'),('E18','WM2006','Grupo E'),('E19','WM2010','Grupo E'),('E20','WM2014','Grupo E'),('E4','WM1950','Grupo E'),('F10','WM1974','Grupo F'),('F11','WM1978','Grupo F'),('F12','WM1982','Grupo F'),('F13','WM1986','Grupo F'),('F14','WM1990','Grupo F'),('F15','WM1994','Grupo F'),('F16','WM1998','Grupo F'),('F17','WM2002','Grupo F'),('F18','WM2006','Grupo F'),('F19','WM2010','Grupo F'),('F20','WM2014','Grupo F'),('G12','WM1982','Grupo G'),('G16','WM1998','Grupo G'),('G17','WM2002','Grupo G'),('G18','WM2006','Grupo G'),('G19','WM2010','Grupo G'),('G20','WM2014','Grupo G'),('H12','WM1982','Grupo H'),('H16','WM1998','Grupo H'),('H17','WM2002','Grupo H'),('H18','WM2006','Grupo H'),('H19','WM2010','Grupo H'),('H20','WM2014','Grupo H'),('I12','WM1982','Grupo I'),('J12','WM1982','Grupo J');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES ('ARQ1ARG10','Diego Pozo','Arquero','ARG10'),('ARQ1ARG20','Sergio Romero','Portero','ARG'),('ARQ1ARG30','Angel Bossio','Arquero','ARG'),('ARQ1AUST10','Mark Schwarzer','Arquero','AUST10'),('ARQ1BEL30','Arnold Badjou','Arquero','BEL'),('ARQ1BOL30','Jesus Bermudez','Arquero','BOL'),('ARQ1BRA10','Julio Cesar','Arquero','BRA10'),('ARQ1BRA30','Velloso','Arquero','BRA'),('ARQ1CAM10','Idriss Kameni','Arquero','CAM10'),('ARQ1CHI10','Claudio Bravo','Arquero','CHI10'),('ARQ1CHI30','Roberto Cortes','Arquero','CHI'),('ARQ1COSTM10','Boubacar Barry','Arquero','COSTM10'),('ARQ1DEU10','Manuel Neuer','Arquero','DEU10'),('ARQ1DEU34','Fritz Buchloh','Arquero','DEU34'),('ARQ1DIN10','Thomas Sorensen','Arquero','DIN10'),('ARQ1DZ10','Lounes Gaouaoui','Arquero','DZ10'),('ARQ1ESP10','Iker Casillas','Arquero','ESP10'),('ARQ1FRA10','Hugo Lloris','Arquero','FRA10'),('ARQ1FRA30','Alex Thepot','Arquero','FRA'),('ARQ1GHA10','Daniel Agyei','Arquero','GHA10'),('ARQ1GRE10','Konstantinos Chalkias','Arquero','GRE10'),('ARQ1HON10','Ricardo Canales','Arquero','HON10'),('ARQ1ING10','David James','Arquero','ING10'),('ARQ1ITA10','Gianluigi Buffon','Arquero','ITA10'),('ARQ1JAP10','Seigo Narazaki','Arquero','JAP10'),('ARQ1KOR10','Woon Jae Lee','Arquero','KOR10'),('ARQ1MEX10','Oscar Perez','Arquero','MEX10'),('ARQ1MEX30','Isidoro Sota','Arquero','MEX'),('ARQ1NIG10','Vincent Enyeama','Arquero','NIG10'),('ARQ1NLD10','Maarten Stekelenburg','Arquero','NLD10'),('ARQ1NZ10','Mark Paston','Arquero','NZ10'),('ARQ1PER30','Juan Valdivieso','Arquero','PER'),('ARQ1POR10','Eduardo','Arquero','POR10'),('ARQ1PRY10','Justo Villar','Arquero','PRY10'),('ARQ1PRY30','Pedro Benitez','Arquero','PRY'),('ARQ1ROU30','Ion Lapusneanu','Arquero','ROU'),('ARQ1SER10','Vladimir Stojkovic','Arquero','SER10'),('ARQ1SLO10','Samir Handanovic','Arquero','SLO10'),('ARQ1SUD10','Moneeb Josephs','Arquero','SUD10'),('ARQ1SUI10','Diego Benaglio','Arquero','SUI10'),('ARQ1SVK10','Jan Mucha','Arquero','SVK10'),('ARQ1URU10','Fernando Muslera','Arquero','URU10'),('ARQ1URU30','Enrique Ballestrero','Arquero','URU'),('ARQ1USA10','Tim Howard','Arquero','USA10'),('ARQ1USA30','Jimmy Douglas','Arquero','USA'),('ARQ1YUG30','Milovan Jaksic','Arquero','YUG'),('ARQ2ARG10','Mariano Andujar','Arquero','ARG10'),('ARQ2ARG30','Juan Botasso','Arquero','ARG'),('ARQ2AUST10','Adam Federici','Arquero','AUST10'),('ARQ2BEL30','Jean De Bie','Arquero','BEL'),('ARQ2BOL30','Miguel Murillo','Arquero','BOL'),('ARQ2BRA10','Gomes','Arquero','BRA10'),('ARQ2BRA30','Joel','Arquero','BRA'),('ARQ2CAM10','Souleymanou Hamidou','Arquero','CAM10'),('ARQ2CHI10','Miguel Pinto','Arquero','CHI10'),('ARQ2CHI30','Cesar Espinoza','Arquero','CHI'),('ARQ2COSTM10','Aristide Zogbo','Arquero','COSTM10'),('ARQ2DEU10','Tim Wiese','Arquero','DEU10'),('ARQ2DEU34','Hans Jakob','Portero','DEU34'),('ARQ2DIN10','Stephan Andersen','Arquero','DIN10'),('ARQ2DZ10','Faouzi Chaouchi','Arquero','DZ10'),('ARQ2ESP10','Victor Valdes','Arquero','ESP10'),('ARQ2FRA10','Steve Mandanda','Arquero','FRA10'),('ARQ2FRA30','Andre Tassin','Arquero','FRA'),('ARQ2GHA10','Stephen Ahorlu','Arquero','GHA10'),('ARQ2GRE10','Alexandros Tzorvas','Arquero','GRE10'),('ARQ2HON10','Noel Valladares','Arquero','HON10'),('ARQ2ING10','Robert Green','Arquero','ING10'),('ARQ2ITA10','Federico Marchetti','Arquero','ITA10'),('ARQ2JAP10','Eiji Kawashima','Arquero','JAP10'),('ARQ2KOR10','Sung Ryong Jung','Arquero','KOR10'),('ARQ2MEX10','Guillermo Ochoa','Arquero','MEX10'),('ARQ2MEX30','Oscar Bonfiglio','Arquero','MEX'),('ARQ2NIG10','Austin Ejide','Arquero','NIG10'),('ARQ2NLD10','Michel Vorm','Arquero','NLD10'),('ARQ2NZ10','Glen Moss','Arquero','NZ10'),('ARQ2PER30','Jorge Pardon','Arquero','PER'),('ARQ2POR10','Beto','Arquero','POR10'),('ARQ2PRY10','Diego Barreto','Arquero','PRY10'),('ARQ2PRY30','Modesto Denis','Arquero','PRY'),('ARQ2ROU30','Samuel Zauber','Arquero','ROU'),('ARQ2SER10','Bojan Isailovic','Arquero','SER10'),('ARQ2SLO10','Jasmin Handanovic','Arquero','SLO10'),('ARQ2SUD10','Itumeleng Khune','Arquero','SUD10'),('ARQ2SUI10','Marco Woelfli','Arquero','SUI10'),('ARQ2SVK10','Dusan Pernis','Arquero','SVK10'),('ARQ2URU10','Juan Castillo','Arquero','URU10'),('ARQ2URU30','Miguel Cappuccini','Arquero','URU'),('ARQ2USA10','Brad Guzan','Arquero','USA10'),('ARQ2YUG30','Milan Stojanovic','Arquero','YUG'),('ARQ3ARG10','Sergio Romero','Arquero','ARG10'),('ARQ3AUST10','Brad Jones','Arquero','AUST10'),('ARQ3BRA10','Doni','Arquero','BRA10'),('ARQ3CAM10','Guy Ndy','Arquero','CAM10'),('ARQ3CHI10','Luis Marin','Arquero','CHI10'),('ARQ3COSTM10','Daniel Yeboah','Arquero','COSTM10'),('ARQ3DEU10','Hans-Joerg Butt','Arquero','DEU10'),('ARQ3DIN10','Jesper Christiansen','Arquero','DIN10'),('ARQ3DZ10','Rais M\'Bolhi','Arquero','DZ10'),('ARQ3ESP10','Pepe Reina','Arquero','ESP10'),('ARQ3FRA10','Cedric Carrasso','Arquero','FRA10'),('ARQ3GHA10','Richard Kingson','Arquero','GHA10'),('ARQ3GRE10','Michail Sifakis','Arquero','GRE10'),('ARQ3HON10','Donis Escober','Arquero','HON10'),('ARQ3ING10','Joe Hart','Arquero','ING10'),('ARQ3ITA10','Morgan De Sanctis','Arquero','ITA10'),('ARQ3JAP10','Yoshikatsu Kawaguchi','Arquero','JAP10'),('ARQ3KOR10','Young Kwang Kim','Arquero','KOR10'),('ARQ3MEX10','Luis Michel','Arquero','MEX10'),('ARQ3NIG10','Dele Aiyenugba','Arquero','NIG10'),('ARQ3NLD10','Sander Boschker','Arquero','NLD10'),('ARQ3NZ10','James Bannatyne','Arquero','NZ10'),('ARQ3POR10','Daniel Fernandes','Arquero','POR10'),('ARQ3PRY10','Aldo Bobadilla','Arquero','PRY10'),('ARQ3SER10','Andjelko Djuricic','Arquero','SER10'),('ARQ3SLO10','Aleksander Seliga','Arquero','SLO10'),('ARQ3SUD10','Shu-Aib Walters','Arquero','SUD10'),('ARQ3SUI10','Johnny Leoni','Arquero','SUI10'),('ARQ3SVK10','Dusan Kuciak','Arquero','SVK10'),('ARQ3URU10','Martin Silva','Arquero','URU10'),('ARQ3USA10','Marcus Hahnemann','Arquero','USA10'),('DEF10GRE10','Stelios Malezas','Defensor','GRE10'),('DEF1ARG10','Martin Demichelis','Defensor','ARG10'),('DEF1ARG30','Adolfo Zumelzu','Defensor','ARG'),('DEF1AUST10','Lucas Neill','Defensor','AUST10'),('DEF1BEL30','Henri De Deken','Defensor','BEL'),('DEF1BOL30','Luis Reyes Penaranda','Defensor','BOL'),('DEF1BRA10','Maicon','Defensor','BRA10'),('DEF1BRA30','Ze Luis','Defensor','BRA'),('DEF1CAM10','Benoit Assou-Ekotto','Defensor','CAM10'),('DEF1CHI10','Ismael Fuentes','Defensor','CHI10'),('DEF1CHI30','Ernesto Chaparro','Defensor','CHI'),('DEF1COSTM10','Brou Angoua','Defensor','COSTM10'),('DEF1DEU10','Arne Friedrich','Defensor','DEU10'),('DEF1DEU34','Willibald Kreß','Portero','DEU34'),('DEF1DIN10','Simon Kjaer','Defensor','DIN10'),('DEF1DZ10','Madjid Bougherra','Defensor','DZ10'),('DEF1ESP10','Raul Albiol','Defensor','ESP10'),('DEF1FRA10','Bakari Sagna','Defensor','FRA10'),('DEF1FRA30','Nouma Andoire','Defensor','FRA'),('DEF1GHA10','Hans Sarpei','Defensor','GHA10'),('DEF1GRE10','Giourkas Seitaridis','Defensor','GRE10'),('DEF1HON10','Osman Chavez','Defensor','HON10'),('DEF1ING10','Glen Johnson','Defensor','ING10'),('DEF1ITA10','Christian Maggio','Defensor','ITA10'),('DEF1JAP10','Yuichi Komano','Defensor','JAP10'),('DEF1KOR10','Beom Seok Oh','Defensor','KOR10'),('DEF1MEX10','Francisco Rodriguez','Defensor','MEX10'),('DEF1MEX30','Manuel Rosas','Defensor','MEX'),('DEF1NIG10','Joseph Yobo','Defensor','NIG10'),('DEF1NLD10','Gregory Van Der Wiel','Defensor','NLD10'),('DEF1NZ10','Ben Sigmund','Defensor','NZ10'),('DEF1PER30','Alberto Soria','Defensor','PER'),('DEF1POR10','Bruno Alves','Defensor','POR10'),('DEF1PRY10','Dario Veron','Defensor','PRY10'),('DEF1PRY30','Quiterio Olmedo','Defensor','PRY'),('DEF1ROU30','Rudolf Buerger','Defensor','ROU'),('DEF1SER10','Antonio Rukavina','Defensor','SER10'),('DEF1SLO10','Miso Brecko','Defensor','SLO10'),('DEF1SUD10','Siboniso Gaxa','Defensor','SUD10'),('DEF1SUI10','Stephan Lichtsteiner','Defensor','SUI10'),('DEF1SVK10','Peter Pekarik','Defensor','SVK10'),('DEF1URU10','Diego Lugano','Defensor','URU10'),('DEF1URU30','Domingo Tejera','Defensor','URU'),('DEF1USA10','Jonathan Spector','Defensor','USA10'),('DEF1USA30','Alexander Wood','Defensor','USA'),('DEF1YUG30','Dragomir Tosic','Defensor','YUG'),('DEF2ARG10','Clemente Rodriguez','Defensor','ARG10'),('DEF2ARG30','Fernando Paternoster','Defensor','ARG'),('DEF2AUST10','Craig Moore','Defensor','AUST10'),('DEF2BEL30','Nikolaas Hoydonckx','Defensor','BEL'),('DEF2BOL30','Casiano Chavarria','Defensor','BOL'),('DEF2BRA10','Lucio','Defensor','BRA10'),('DEF2BRA30','Brilhante','Defensor','BRA'),('DEF2CAM10','Nicolas Nkoulou','Defensor','CAM10'),('DEF2CHI10','Waldo Ponce','Defensor','CHI10'),('DEF2CHI30','Victor Morales','Defensor','CHI'),('DEF2COSTM10','Arthur Boka','Defensor','COSTM10'),('DEF2DEU10','Dennis Aogo','Defensor','DEU10'),('DEF2DEU34','Willy Busch','Defensor','DEU34'),('DEF2DIN10','Daniel Agger','Defensor','DIN10'),('DEF2DZ10','Nadir Belhadj','Defensor','DZ10'),('DEF2ESP10','Gerard Piqué','Defensor','ESP10'),('DEF2FRA10','Eric Abidal','Defensor','FRA10'),('DEF2FRA30','Marcel Capelle','Defensor','FRA'),('DEF2GHA10','John Pantsil','Defensor','GHA10'),('DEF2GRE10','Christos Patsatzoglou','Defensor','GRE10'),('DEF2HON10','Maynor Figueroa','Defensor','HON10'),('DEF2ING10','Ashley Cole','Defensor','ING10'),('DEF2ITA10','Domenico Criscito','Defensor','ITA10'),('DEF2JAP10','Marcus Tulio Tanaka','Defensor','JAP10'),('DEF2KOR10','Hyung Il Kim','Defensor','KOR10'),('DEF2MEX10','Carlos Salcido','Defensor','MEX10'),('DEF2MEX30','Francisco Garza Gutierrez','Defensor','MEX'),('DEF2NIG10','Taye Taiwo','Defensor','NIG10'),('DEF2NLD10','John Heitinga','Defensor','NLD10'),('DEF2NZ10','Tony Lochhead','Defensor','NZ10'),('DEF2PER30','Mario De Las Casas','Defensor','PER'),('DEF2POR10','Paulo Ferreira','Defensor','POR10'),('DEF2PRY10','Claudio Morel','Defensor','PRY10'),('DEF2PRY30','Jose Leon Miracca','Defensor','PRY'),('DEF2ROU30','Iosif Czako','Defensor','ROU'),('DEF2SER10','Aleksandar Kolarov','Defensor','SER10'),('DEF2SLO10','Elvedin Dzinic','Defensor','SLO10'),('DEF2SUD10','Tsepo Masilela','Defensor','SUD10'),('DEF2SUI10','Ludovic Magnin','Defensor','SUI10'),('DEF2SVK10','Martin Skrtel','Defensor','SVK10'),('DEF2URU10','Diego Godin','Defensor','URU10'),('DEF2URU30','Emilio Recoba','Defensor','URU'),('DEF2USA10','Carlos Bocanegra','Defensor','USA10'),('DEF2USA30','Frank Vaughn','Defensor','USA'),('DEF2YUG30','Milutin Ivkovic','Defensor','YUG'),('DEF3ARG10','Nicolas Burdisso','Defensor','ARG10'),('DEF3ARG30','Rodolfo Orlandini','Defensor','ARG'),('DEF3AUST10','Michael Beauchamp','Defensor','AUST10'),('DEF3BEL30','Theodore Nouwens','Defensor','BEL'),('DEF3BOL30','Segundo Durandal','Defensor','BOL'),('DEF3BRA10','Juan','Defensor','BRA10'),('DEF3BRA30','Italia','Defensor','BRA'),('DEF3CAM10','Rigobert Song','Defensor','CAM10'),('DEF3CHI10','Mauricio Isla','Defensor','CHI10'),('DEF3CHI30','Ulises Poirier','Defensor','CHI'),('DEF3COSTM10','Kolo Toure','Defensor','COSTM10'),('DEF3DEU10','Serdar Tasci','Defensor','DEU10'),('DEF3DEU34','Sigmund Haringer','Defensor','DEU34'),('DEF3DIN10','Lars Jacobsen','Defensor','DIN10'),('DEF3DZ10','Anther Yahia','Defensor','DZ10'),('DEF3ESP10','Carlos Marchena','Defensor','ESP10'),('DEF3FRA10','Anthony Reveillere','Defensor','FRA10'),('DEF3FRA30','Etienne Mattler','Defensor','FRA'),('DEF3GHA10','John Mensah','Defensor','GHA10'),('DEF3GRE10','Nikos Spiropoulos','Defensor','GRE10'),('DEF3HON10','Johnny Palacios','Defensor','HON10'),('DEF3ING10','Rio Ferdinand','Defensor','ING10'),('DEF3ITA10','Giorgio Chiellini','Defensor','ITA10'),('DEF3JAP10','Yuto Nagatomo','Defensor','JAP10'),('DEF3KOR10','Yong Hyung Cho','Defensor','KOR10'),('DEF3MEX10','Rafael Marquez','Defensor','MEX10'),('DEF3MEX30','Rafael Garza Gutierrez','Defensor','MEX'),('DEF3NIG10','Rabiu Afolabi','Defensor','NIG10'),('DEF3NLD10','Joris Mathijsen','Defensor','NLD10'),('DEF3NZ10','Winston Reid','Defensor','NZ10'),('DEF3PER30','Arturo Fernandez','Defensor','PER'),('DEF3POR10','Rolando','Defensor','POR10'),('DEF3PRY10','Denis Caniza','Defensor','PRY10'),('DEF3PRY30','Salvador Flores','Defensor','PRY'),('DEF3ROU30','Adalbert Steiner','Defensor','ROU'),('DEF3SER10','Nemanja Vidic','Defensor','SER10'),('DEF3SLO10','Marko Suler','Defensor','SLO10'),('DEF3SUD10','Aaron Mokoena','Defensor','SUD10'),('DEF3SUI10','Philippe Senderos','Defensor','SUI10'),('DEF3SVK10','Marek Cech','Defensor','SVK10'),('DEF3URU10','Jorge Fucile','Defensor','URU10'),('DEF3URU30','Ernesto Mascheroni','Defensor','URU'),('DEF3USA10','Oguchi Onyewu','Defensor','USA10'),('DEF3USA30','Ralph Tracey','Defensor','USA'),('DEF3YUG30','Dragan Mihajlovic','Defensor','YUG'),('DEF4ARG10','Gabriel Heinze','Defensor','ARG10'),('DEF4ARG30','Ramon Muttis','Defensor','ARG'),('DEF4AUST10','Luke Wilkshire','Defensor','AUST10'),('DEF4BRA10','Michel Bastos','Defensor','BRA10'),('DEF4CAM10','Sebastien Bassong','Defensor','CAM10'),('DEF4CHI10','Pablo Contreras','Defensor','CHI10'),('DEF4CHI30','Guillermo Riveros','Defensor','CHI'),('DEF4COSTM10','Steve Gohouri','Defensor','COSTM10'),('DEF4DEU10','Holger Badstuber','Defensor','DEU10'),('DEF4DEU34','Paul Janes','Defensor','DEU34'),('DEF4DIN10','Per Kroldrup','Defensor','DIN10'),('DEF4DZ10','Rafik Halliche','Defensor','DZ10'),('DEF4ESP10','Carles Puyol','Defensor','ESP10'),('DEF4FRA10','William Gallas','Defensor','FRA10'),('DEF4GHA10','Samuel Inkoom','Defensor','GHA10'),('DEF4GRE10','Vangelis Moras','Defensor','GRE10'),('DEF4HON10','Victor Bernardez','Defensor','HON10'),('DEF4ING10','John Terry','Defensor','ING10'),('DEF4ITA10','Fabio Cannavaro','Defensor','ITA10'),('DEF4JAP10','Atsuto Uchida','Defensor','JAP10'),('DEF4KOR10','Young Pyo Lee','Defensor','KOR10'),('DEF4MEX10','Ricardo Osorio','Defensor','MEX10'),('DEF4NIG10','Danny Shittu','Defensor','NIG10'),('DEF4NLD10','Giovanni Van Bronckhorst','Defensor','NLD10'),('DEF4NZ10','Ivan Vicelich','Defensor','NZ10'),('DEF4PER30','Antonio Maquilon','Defensor','PER'),('DEF4POR10','Duda','Defensor','POR10'),('DEF4PRY10','Julio Cesar Caceres','Defensor','PRY10'),('DEF4PRY30','Eustaquio Chamorro','Defensor','PRY'),('DEF4ROU30','Emerich Vogl','Defensor','ROU'),('DEF4SER10','Branislav Ivanovic','Defensor','SER10'),('DEF4SLO10','Bostjan Cesar','Defensor','SLO10'),('DEF4SUD10','Anele Ngcongca','Defensor','SUD10'),('DEF4SUI10','Steve Von Bergen','Defensor','SUI10'),('DEF4SVK10','Radoslav Zabavnik','Defensor','SVK10'),('DEF4URU10','Mauricio Victorino','Defensor','URU10'),('DEF4URU30','Jose Nasazzi','Defensor','URU'),('DEF4USA10','Steve Cherundolo','Defensor','USA10'),('DEF4USA30','George Moorhouse','Defensor','USA'),('DEF4YUG30','Ljubisa Stefanovic','Defensor','YUG'),('DEF5ARG10','Ariel Garce','Defensor','ARG10'),('DEF5ARG30','Jose Della Torre','Defensor','ARG'),('DEF5AUST10','Scott Chipperfield','Defensor','AUST10'),('DEF5BRA10','Dani Alves','Defensor','BRA10'),('DEF5CAM10','Geremi','Defensor','CAM10'),('DEF5CHI10','Gary Medel','Defensor','CHI10'),('DEF5COSTM10','Siaka Tiene','Defensor','COSTM10'),('DEF5DEU10','Philipp Lahm','Defensor','DEU10'),('DEF5DEU34','Reinhold Münzenberg','Defensor','DEU34'),('DEF5DIN10','Simon Poulsen','Defensor','DIN10'),('DEF5DZ10','Habib Bellaid','Defensor','DZ10'),('DEF5ESP10','Joan Capdevila','Defensor','ESP10'),('DEF5FRA10','Marc Planus','Defensor','FRA10'),('DEF5GHA10','Jonathan Mensah','Defensor','GHA10'),('DEF5GRE10','Avraam Papadopoulos','Defensor','GRE10'),('DEF5HON10','Oscar Boniek Garcia','Defensor','HON10'),('DEF5ING10','Stephen Warnock','Defensor','ING10'),('DEF5ITA10','Salvatore Bocchetti','Defensor','ITA10'),('DEF5JAP10','Daiki Iwamasa','Defensor','JAP10'),('DEF5KOR10','Jung Soo Lee','Defensor','KOR10'),('DEF5MEX10','Paul Aguilar','Defensor','MEX10'),('DEF5NIG10','Chidi Odiah','Defensor','NIG10'),('DEF5NLD10','Khalid Boulahrouz','Defensor','NLD10'),('DEF5NZ10','Ryan Nelsen','Defensor','NZ10'),('DEF5POR10','Ricardo Carvalho','Defensor','POR10'),('DEF5PRY10','Paulo Da Silva','Defensor','PRY10'),('DEF5SER10','Aleksandar Lukovic','Defensor','SER10'),('DEF5SLO10','Branko Ilic','Defensor','SLO10'),('DEF5SUD10','Matthew Booth','Defensor','SUD10'),('DEF5SUI10','Stephane Grichting','Defensor','SUI10'),('DEF5SVK10','Jan Durica','Defensor','SVK10'),('DEF5URU10','Maximiliano Pereira','Defensor','URU10'),('DEF5USA10','Jonathan Bornstein','Defensor','USA10'),('DEF6ARG10','Walter Samuel','Defensor','ARG10'),('DEF6ARG30','Alberto Chividini','Defensor','ARG'),('DEF6AUST10','Mark Milligan','Defensor','AUST10'),('DEF6BRA10','Luisao','Defensor','BRA10'),('DEF6CAM10','Gaetan Bong','Defensor','CAM10'),('DEF6CHI10','Gonzalo Jara','Defensor','CHI10'),('DEF6COSTM10','Guy Demel','Defensor','COSTM10'),('DEF6DEU10','Per Mertesacker','Defensor','DEU10'),('DEF6DEU34','Hans Schwartz','Defensor','DEU34'),('DEF6DIN10','Patrick Mtiliga','Defensor','DIN10'),('DEF6DZ10','Abdelkader Laifaoui','Defensor','DZ10'),('DEF6ESP10','Sergio Ramos','Defensor','ESP10'),('DEF6FRA10','Patrice Evra','Defensor','FRA10'),('DEF6GHA10','Isaac Vorsah','Defensor','GHA10'),('DEF6GRE10','Loukas Vyntra','Defensor','GRE10'),('DEF6HON10','Mauricio Sabillon','Defensor','HON10'),('DEF6ING10','Matt Upson','Defensor','ING10'),('DEF6ITA10','Gianluca Zambrotta','Defensor','ITA10'),('DEF6JAP10','Yasuyuki Konno','Defensor','JAP10'),('DEF6KOR10','Dong Jin Kim','Defensor','KOR10'),('DEF6MEX10','Hector Moreno','Defensor','MEX10'),('DEF6NIG10','Uwa Echiejile','Defensor','NIG10'),('DEF6NLD10','Andre Ooijer','Defensor','NLD10'),('DEF6NZ10','Andy Boyens','Defensor','NZ10'),('DEF6POR10','Miguel','Defensor','POR10'),('DEF6PRY10','Aureliano Torres','Defensor','PRY10'),('DEF6SER10','Ivan Obradovic','Defensor','SER10'),('DEF6SLO10','Bojan Jokic','Defensor','SLO10'),('DEF6SUD10','Lucas Thwala','Defensor','SUD10'),('DEF6SUI10','Reto Ziegler','Defensor','SUI10'),('DEF6SVK10','Kornel Salata','Defensor','SVK10'),('DEF6URU10','Andres Scotti','Defensor','URU10'),('DEF6USA10','Jay Demerit','Defensor','USA10'),('DEF7ARG10','Nicolas Otamendi','Defensor','ARG10'),('DEF7AUST10','David Carney','Defensor','AUST10'),('DEF7BRA10','Thiago Silva','Defensor','BRA10'),('DEF7CAM10','Aurelien Chedjou','Defensor','CAM10'),('DEF7COSTM10','Emmanuel Eboue','Defensor','COSTM10'),('DEF7DEU10','Jérôme Boateng','Defensor','DEU10'),('DEF7DEU34','Paul Zielinski','Defensor','DEU34'),('DEF7DZ10','Carl Medjani','Defensor','DZ10'),('DEF7ESP10','Alvaro Arbeloa','Defensor','ESP10'),('DEF7FRA10','Sebastien Squillaci','Defensor','FRA10'),('DEF7GHA10','Ibrahim Ayew','Defensor','GHA10'),('DEF7GRE10','Vasileios Torosidis','Defensor','GRE10'),('DEF7HON10','Emilio Izaguirre','Defensor','HON10'),('DEF7ING10','Jamie Carragher','Defensor','ING10'),('DEF7ITA10','Leonardo Bonucci','Defensor','ITA10'),('DEF7JAP10','Yuji Nakazawa','Defensor','JAP10'),('DEF7KOR10','Du Ri Cha','Defensor','KOR10'),('DEF7MEX10','Efrain Juarez','Defensor','MEX10'),('DEF7NIG10','Dele Adeleye','Defensor','NIG10'),('DEF7NLD10','Edson Braafheid','Defensor','NLD10'),('DEF7NZ10','Tommy Smith','Defensor','NZ10'),('DEF7POR10','Ricardo Costa','Defensor','POR10'),('DEF7PRY10','Antolin Alcaraz','Defensor','PRY10'),('DEF7SER10','Neven Subotic','Defensor','SER10'),('DEF7SLO10','Suad Filekovic','Defensor','SLO10'),('DEF7SUD10','Bongani Khumalo','Defensor','SUD10'),('DEF7SUI10','Mario Eggimann','Defensor','SUI10'),('DEF7SVK10','Martin Petras','Defensor','SVK10'),('DEF7URU10','Martin Caceres','Defensor','URU10'),('DEF7USA10','Clarence Goodson','Defensor','USA10'),('DEF8BRA10','Gilberto Melo','Defensor','BRA10'),('DEF8CAM10','Stephane Mbia','Defensor','CAM10'),('DEF8COSTM10','Souleymane Bamba','Defensor','COSTM10'),('DEF8DZ10','Djamel Mesbah','Defensor','DZ10'),('DEF8FRA10','Gael Clichy','Defensor','FRA10'),('DEF8GHA10','Lee Addy','Defensor','GHA10'),('DEF8GRE10','Sotirios Kyrgiakos','Defensor','GRE10'),('DEF8HON10','Sergio Mendoza','Defensor','HON10'),('DEF8ING10','Ledley King','Defensor','ING10'),('DEF8KOR10','Min Soo Kang','Defensor','KOR10'),('DEF8MEX10','Jonny Magallon','Defensor','MEX10'),('DEF8POR10','Fabio Coentrao','Defensor','POR10'),('DEF8SLO10','Matej Mavric','Defensor','SLO10'),('DEF8SUD10','Siyabonga Sangweni','Defensor','SUD10'),('DEF9GRE10','Sokratis Papastathopoulos','Defensor','GRE10'),('DEL10ARG30','Atilio Demaria','Delantero','ARG'),('DEL10BRA10','Robinho','Delantero','BRA10'),('DEL10BRA30','Benedicto','Delantero','BRA'),('DEL10CAM10','Pierre Webo','Delantero','CAM10'),('DEL10PER30','Alejandro Villanueva','Delantero','PER'),('DEL10PRY30','Jacinto Villalba','Delantero','PRY'),('DEL10URU30','Juan Anselmo','Delantero','URU'),('DEL11BRA10','Nilmar','Delantero','BRA10'),('DEL11BRA30','Araken','Delantero','BRA'),('DEL11CAM10','Mohamadou Idrissou','Delantero','CAM10'),('DEL12BRA10','Grafite','Delantero','BRA10'),('DEL12CAM10','Vincent Aboubakar','Delantero','CAM10'),('DEL1ARG10','Gonzalo Higuain','Delantero','ARG10'),('DEL1ARG30','Roberto Cerro','Delantero','ARG'),('DEL1AUST10','Joshua Kennedy','Delantero','AUST10'),('DEL1BEL30','Bernard Voorhoof','Delantero','BEL'),('DEL1BOL30','Eduardo Reyes Ortiz','Delantero','BOL'),('DEL1BRA30','Doca','Delantero','BRA'),('DEL1CHI10','Alexis Sanchez','Delantero','CHI10'),('DEL1CHI30','Eberardo Villalobos','Delantero','CHI'),('DEL1COSTM10','Seydou Doumbia','Delantero','COSTM10'),('DEL1DEU10','Stefan Kiessling','Delantero','DEU10'),('DEL1DEU34','Eugen Dienert','Delantero','DEU34'),('DEL1DIN10','Jesper Gronkjaer','Delantero','DIN10'),('DEL1DZ10','Abdelkader Ghezzal','Delantero','DZ10'),('DEL1ESP10','David Villa','Delantero','ESP10'),('DEL1FRA10','Franck Ribery','Delantero','FRA10'),('DEL1FRA30','Lucien Laurent','Delantero','FRA'),('DEL1GHA10','Asamoah Gyan','Delantero','GHA10'),('DEL1GRE10','Georgios Samaras','Delantero','GRE10'),('DEL1HON10','Carlos Pavon','Delantero','HON10'),('DEL1ING10','Peter Crouch','Delantero','ING10'),('DEL1ITA10','Vincenzo Iaquinta','Delantero','ITA10'),('DEL1JAP10','Shinji Okazaki','Delantero','JAP10'),('DEL1KOR10','Jung Hwan Ahn','Delantero','KOR10'),('DEL1MEX10','Pablo Barrera','Delantero','MEX10'),('DEL1MEX30','Hilario Lopez','Delantero','MEX'),('DEL1NIG10','John Utaka','Delantero','NIG10'),('DEL1NLD10','Dirk Kuyt','Delantero','NLD10'),('DEL1NZ10','Shane Smeltz','Delantero','NZ10'),('DEL1PER30','Jorge Gongora','Delantero','PER'),('DEL1POR10','Cristiano Ronaldo','Delantero','POR10'),('DEL1PRY10','Oscar Cardozo','Delantero','PRY10'),('DEL1PRY30','Diogenes Dominguez','Delantero','PRY'),('DEL1ROU30','Stefan Barbu','Delantero','ROU'),('DEL1SER10','Danko Lazovic','Delantero','SER10'),('DEL1SLO10','Nejc Pecnik','Delantero','SLO10'),('DEL1SUD10','Katlego Mphela','Delantero','SUD10'),('DEL1SUI10','Alexander Frei','Delantero','SUI10'),('DEL1SVK10','Stanislav Sestak','Delantero','SVK10'),('DEL1URU10','Edinson Cavani','Delantero','URU10'),('DEL1URU30','Santos Urdinaran','Delantero','URU'),('DEL1USA10','Herculez Gomez','Delantero','USA10'),('DEL1USA30','Bert Patenaude','Delantero','USA'),('DEL1YUG30','Djordje Vujadinovic','Delantero','YUG'),('DEL2ARG10','Lionel Messi','Delantero','ARG10'),('DEL2ARG30','Francisco Varallo','Delantero','ARG'),('DEL2AUST10','Harry Kewell','Delantero','AUST10'),('DEL2BEL30','Louis Versyp','Delantero','BEL'),('DEL2BOL30','Jose Noya','Delantero','BOL'),('DEL2BRA30','Manoelzinho','Delantero','BRA'),('DEL2CHI10','Humberto Suazo','Delantero','CHI10'),('DEL2CHI30','Carlos Vidal','Delantero','CHI'),('DEL2COSTM10','Salomon Kalou','Delantero','COSTM10'),('DEL2DEU10','Lukas Podolski','Delantero','DEU10'),('DEL2DEU34','Matthias Heidemann','Delantero','DEU34'),('DEL2DIN10','Jon Dahl Tomasson','Delantero','DIN10'),('DEL2DZ10','Rafik Saifi','Delantero','DZ10'),('DEL2ESP10','Fernando Torres','Delantero','ESP10'),('DEL2FRA10','Djibril Cisse','Delantero','FRA10'),('DEL2FRA30','Ernest Liberati','Delantero','FRA'),('DEL2GHA10','Prince Tagoe','Delantero','GHA10'),('DEL2GRE10','Angelos Charisteas','Delantero','GRE10'),('DEL2HON10','Jerry Palacios','Delantero','HON10'),('DEL2ING10','Wayne Rooney','Delantero','ING10'),('DEL2ITA10','Antonio Di Natale','Delantero','ITA10'),('DEL2JAP10','Keiji Tamada','Delantero','JAP10'),('DEL2KOR10','Chu Young Park','Delantero','KOR10'),('DEL2MEX10','Guillermo Franco','Delantero','MEX10'),('DEL2MEX30','Dioniso Mejia','Delantero','MEX'),('DEL2NIG10','Yakubu Aiyegbeni','Delantero','NIG10'),('DEL2NLD10','Robin Van Persie','Delantero','NLD10'),('DEL2NZ10','Chris Killen','Delantero','NZ10'),('DEL2PER30','Jose Maria Lavalle','Delantero','PER'),('DEL2POR10','Liedson','Delantero','POR10'),('DEL2PRY10','Roque Santa Cruz','Delantero','PRY10'),('DEL2PRY30','Cayetano Carreras Sagueir','Delantero','PRY'),('DEL2ROU30','Adalbert Desu','Delantero','ROU'),('DEL2SER10','Marko Pantelic','Delantero','SER10'),('DEL2SLO10','Zlatan Ljubijankic','Delantero','SLO10'),('DEL2SUD10','Bernard Parker','Delantero','SUD10'),('DEL2SUI10','Blaise Nkufo','Delantero','SUI10'),('DEL2SVK10','Robert Vittek','Delantero','SVK10'),('DEL2URU10','Luis Suarez','Delantero','URU10'),('DEL2URU30','Hector Scarone','Delantero','URU'),('DEL2USA10','Edson Buddle','Delantero','USA10'),('DEL2USA30','Bart Mcghee','Delantero','USA'),('DEL2YUG30','Aleksandar Tirnanic','Delantero','YUG'),('DEL3ARG10','Carlos Tevez','Delantero','ARG10'),('DEL3ARG30','Guillermo Stabile','Delantero','ARG'),('DEL3AUST10','Brett Holman','Delantero','AUST10'),('DEL3BEL30','Andre Saeys','Delantero','BEL'),('DEL3BOL30','Rafael Mendez','Delantero','BOL'),('DEL3BRA30','Moderato','Delantero','BRA'),('DEL3CHI10','Mark Gonzalez','Delantero','CHI10'),('DEL3CHI30','Guillermo Subiabre','Delantero','CHI'),('DEL3COSTM10','Gervinho','Delantero','COSTM10'),('DEL3DEU10','Miroslav Klose','Delantero','DEU10'),('DEL3DEU34','Stanislaus Kobierski','Delantero','DEU34'),('DEL3DIN10','Nicklas Bendtner','Delantero','DIN10'),('DEL3DZ10','Rafik Djebbour','Delantero','DZ10'),('DEL3ESP10','Juan Mata','Delantero','ESP10'),('DEL3FRA10','Sidney Govou','Delantero','FRA10'),('DEL3FRA30','Andre Maschinot','Delantero','FRA'),('DEL3GHA10','Matthew Amoah','Delantero','GHA10'),('DEL3GRE10','Dimitrios Salpingidis','Delantero','GRE10'),('DEL3HON10','David Suazo','Delantero','HON10'),('DEL3ING10','Jermain Defoe','Delantero','ING10'),('DEL3ITA10','Alberto Gilardino','Delantero','ITA10'),('DEL3JAP10','Kisho Yano','Delantero','JAP10'),('DEL3KOR10','Seung Yeoul Lee','Delantero','KOR10'),('DEL3MEX10','Cuauhtemoc Blanco','Delantero','MEX10'),('DEL3MEX30','Felipe Olivares','Delantero','MEX'),('DEL3NIG10','Obafemi Martins','Delantero','NIG10'),('DEL3NLD10','Arjen Robben','Delantero','NLD10'),('DEL3NZ10','Rory Fallon','Delantero','NZ10'),('DEL3PER30','Julio Lores','Delantero','PER'),('DEL3POR10','Danny','Delantero','POR10'),('DEL3PRY10','Edgar Benitez','Delantero','PRY10'),('DEL3PRY30','Aurelio Gonzalez','Delantero','PRY'),('DEL3ROU30','Nicolae Kovacs','Delantero','ROU'),('DEL3SER10','Nikola Zigic','Delantero','SER10'),('DEL3SLO10','Milivoje Novakovic','Delantero','SLO10'),('DEL3SUD10','Siyabonga Nomvethe','Delantero','SUD10'),('DEL3SUI10','Albert Bunjaku','Delantero','SUI10'),('DEL3SVK10','Filip Holosko','Delantero','SVK10'),('DEL3URU10','Diego Forlan','Delantero','URU10'),('DEL3URU30','Zoilo Saldombide','Delantero','URU'),('DEL3USA10','Jozy Altidore','Delantero','USA10'),('DEL3USA30','Billy Gonsalves','Delantero','USA'),('DEL3YUG30','Branislav Sekulic','Delantero','YUG'),('DEL4ARG10','Sergio Agüero','Delantero','ARG10'),('DEL4ARG30','Carlos Spadaro','Delantero','ARG'),('DEL4AUST10','Nikita Rukavytsya','Delantero','AUST10'),('DEL4BEL30','Jacques Moeschal','Delantero','BEL'),('DEL4BOL30','Gumercindo Gomez','Delantero','BOL'),('DEL4BRA30','Nilo','Delantero','BRA'),('DEL4CHI10','Jean Beausejour','Delantero','CHI10'),('DEL4CHI30','Carlos Schneeberger','Delantero','CHI'),('DEL4COSTM10','Didier Drogba','Delantero','COSTM10'),('DEL4DEU10','Cacau','Delantero','DEU10'),('DEL4DEU34','Rudolf Noack','Delantero','DEU34'),('DEL4DIN10','Mikkel Beckmann','Delantero','DIN10'),('DEL4ESP10','Pedro','Delantero','ESP10'),('DEL4FRA10','Andre Pierre Gignac','Delantero','FRA10'),('DEL4FRA30','Marcel Langiller','Delantero','FRA'),('DEL4GHA10','Dominic Adiyiah','Delantero','GHA10'),('DEL4GRE10','Theofanis Gekas','Delantero','GRE10'),('DEL4HON10','George Welcome','Delantero','HON10'),('DEL4ING10','Emile Heskey','Delantero','ING10'),('DEL4ITA10','Fabio Quagliarella','Delantero','ITA10'),('DEL4JAP10','Yoshito Okubo','Delantero','JAP10'),('DEL4KOR10','Dong Gook Lee','Delantero','KOR10'),('DEL4MEX10','Carlos Vela','Delantero','MEX10'),('DEL4MEX30','Luis Perez','Delantero','MEX'),('DEL4NIG10','Brown Ideye','Delantero','NIG10'),('DEL4NLD10','Eljero Elia','Delantero','NLD10'),('DEL4NZ10','Chris Wood','Delantero','NZ10'),('DEL4PER30','Demetrio Neyra','Delantero','PER'),('DEL4POR10','Simao','Delantero','POR10'),('DEL4PRY10','Nelson Valdez','Delantero','PRY10'),('DEL4PRY30','Delfin Benitez Caceres','Delantero','PRY'),('DEL4ROU30','Constantin Stanciu','Delantero','ROU'),('DEL4SER10','Dragan Mrdja','Delantero','SER10'),('DEL4SLO10','Zlatko Dedic','Delantero','SLO10'),('DEL4SUI10','Eren Derdiyok','Delantero','SUI10'),('DEL4SVK10','Martin Jakubko','Delantero','SVK10'),('DEL4URU10','Sebastian Abreu','Delantero','URU10'),('DEL4URU30','Pedro Petrone','Delantero','URU'),('DEL4USA10','Robbie Findley','Delantero','USA10'),('DEL4USA30','Jim Gentle','Delantero','USA'),('DEL4YUG30','Vlastimir Petkovic','Delantero','YUG'),('DEL5ARG10','Martin Palermo','Delantero','ARG10'),('DEL5ARG30','Alejandro Scopelli','Delantero','ARG'),('DEL5AUST10','Richard Garcia','Delantero','AUST10'),('DEL5BEL30','Gerard Delbeke','Delantero','BEL'),('DEL5BOL30','Rene Fernandez','Delantero','BOL'),('DEL5BRA30','Carvalho Leite','Delantero','BRA'),('DEL5CHI10','Fabian Orellana','Delantero','CHI10'),('DEL5CHI30','Tomas Ojeda','Delantero','CHI'),('DEL5COSTM10','Aruna Dindane','Delantero','COSTM10'),('DEL5DEU10','Mario Gomez','Delantero','DEU10'),('DEL5DEU34','Otto Siffling','Delantero','DEU34'),('DEL5DIN10','Soren Larsen','Delantero','DIN10'),('DEL5ESP10','Fernando Llorente','Delantero','ESP10'),('DEL5FRA10','Thierry Henry','Delantero','FRA10'),('DEL5FRA30','Edmond Delfour','Delantero','FRA'),('DEL5GHA10','Quincy Owusu-Abeyie','Delantero','GHA10'),('DEL5GRE10','Pantelis Kapetanos','Delantero','GRE10'),('DEL5HON10','Roger Espinoza','Delantero','HON10'),('DEL5ITA10','Giampaolo Pazzini','Delantero','ITA10'),('DEL5JAP10','Takayuki Morimoto','Delantero','JAP10'),('DEL5MEX10','Javier Hernandez','Delantero','MEX10'),('DEL5MEX30','Roberto Gayon','Delantero','MEX'),('DEL5NIG10','Peter Odemwingie','Delantero','NIG10'),('DEL5NLD10','Ryan Babel','Delantero','NLD10'),('DEL5NZ10','Jeremy Brockie','Delantero','NZ10'),('DEL5PER30','Lizardo Nue Rodriguez','Delantero','PER'),('DEL5POR10','Hugo Almeida','Delantero','POR10'),('DEL5PRY10','Lucas Barrios','Delantero','PRY10'),('DEL5PRY30','Lino Nessi','Delantero','PRY'),('DEL5ROU30','Ilile Subaseanu','Delantero','ROU'),('DEL5SLO10','Tim Matavz','Delantero','SLO10'),('DEL5SVK10','Erik Jendrisek','Delantero','SVK10'),('DEL5URU10','Sebastian Fernandez','Delantero','URU10'),('DEL5URU30','Victoriano Iriarte','Delantero','URU'),('DEL5USA30','Tom Florie','Delantero','USA'),('DEL5YUG30','Dragutin Najdanovic','Delantero','YUG'),('DEL6ARG10','Diego Milito','Delantero','ARG10'),('DEL6ARG30','Carlos Peucelle','Delantero','ARG'),('DEL6AUST10','Mark Bresciano','Delantero','AUST10'),('DEL6BEL30','Fernand Adams','Delantero','BEL'),('DEL6BOL30','Jose Bustamante','Delantero','BOL'),('DEL6BRA30','Poly','Delantero','BRA'),('DEL6CHI10','Esteban Paredes','Delantero','CHI10'),('DEL6CHI30','Horacio Munoz','Delantero','CHI'),('DEL6COSTM10','Kader Keita','Delantero','COSTM10'),('DEL6DEU34','Sepp Streb','Delantero','DEU34'),('DEL6DIN10','Dennis Rommedahl','Delantero','DIN10'),('DEL6ESP10','Jesus Navas','Delantero','ESP10'),('DEL6FRA10','Mathieu Valbuena','Delantero','FRA10'),('DEL6FRA30','Emile Veinante','Delantero','FRA'),('DEL6GHA10','Kevin Prince Boateng','Delantero','GHA10'),('DEL6HON10','Walter Martinez','Delantero','HON10'),('DEL6MEX10','Giovani dos Santos','Delantero','MEX10'),('DEL6MEX30','Jesus Castro','Delantero','MEX'),('DEL6NIG10','Victor Obinna','Delantero','NIG10'),('DEL6NLD10','Klaas Jan Huntelaar','Delantero','NLD10'),('DEL6PER30','Pablo Pacheco','Delantero','PER'),('DEL6PRY10','Rodolfo Gamarra','Delantero','PRY10'),('DEL6PRY30','Amadeo Ortega','Delantero','PRY'),('DEL6ROU30','Rudolf Wetzer','Delantero','ROU'),('DEL6URU30','Pablo Dorado','Delantero','URU'),('DEL6USA30','Jim Brown','Delantero','USA'),('DEL6YUG30','Blagoje Marjanovic','Delantero','YUG'),('DEL7ARG30','Natalio Perinetti','Delantero','ARG'),('DEL7AUST10','Tim Cahill','Delantero','AUST10'),('DEL7BOL30','Mario Alborta','Delantero','BOL'),('DEL7BRA30','Preguinho','Delantero','BRA'),('DEL7CAM10','Samuel Eto\'o','Delantero','CAM10'),('DEL7CHI30','Arturo Coddou','Delantero','CHI'),('DEL7DEU34','Fritz Szepan','Delantero','DEU34'),('DEL7FRA10','Nicolas Anelka','Delantero','FRA10'),('DEL7MEX10','Adolfo Bautista','Delantero','MEX10'),('DEL7MEX30','Jose Ruiz','Delantero','MEX'),('DEL7NIG10','Chinedu Ogbuke Obasi','Delantero','NIG10'),('DEL7PER30','Jorge Sarmiento','Delantero','PER'),('DEL7PRY30','Bernabe Rivera','Delantero','PRY'),('DEL7URU30','Pedro Cea','Delantero','URU'),('DEL7USA30','Andrew Auld','Delantero','USA'),('DEL7YUG30','Branislav Hrnjicek','Delantero','YUG'),('DEL8ARG30','Manuel Ferreira','Delantero','ARG'),('DEL8BRA30','Russinho','Delantero','BRA'),('DEL8CAM10','Achille Emana','Delantero','CAM10'),('DEL8CHI30','Guillermo Arellano','Delantero','CHI'),('DEL8MEX10','Alberto Medina','Delantero','MEX10'),('DEL8MEX30','Juan Carreno','Delantero','MEX'),('DEL8PER30','Luis Souza','Delantero','PER'),('DEL8PRY30','Gerardo Romero','Delantero','PRY'),('DEL8URU30','Hector Castro','Delantero','URU'),('DEL8YUG30','Ivica Bek','Delantero','YUG'),('DEL9ARG30','Mario Evaristo','Delantero','ARG'),('DEL9BRA10','Luis Fabiano','Delantero','BRA10'),('DEL9BRA30','Teophilo','Delantero','BRA'),('DEL9CAM10','Eric Maxim Choupo Moting','Delantero','CAM10'),('DEL9CHI30','Juan Aguilera','Delantero','CHI'),('DEL9PER30','Carlos Cilloniz','Delantero','PER'),('DEL9PRY30','Luis Vargas Pena','Delantero','PRY'),('DEL9URU30','Juan Carlos Calvo','Delantero','URU'),('DELDEU34','Edmund Conen','Delantero','DEU34'),('MED1ARG10','Mario Bolatti','Mediocampista','ARG10'),('MED1ARG30','Juan Evaristo','Mediocampista','ARG'),('MED1AUST10','Jason Culina','Mediocampista','AUST10'),('MED1BEL30','Pierre Braine','Mediocampista','BEL'),('MED1BOL30','Renato Sainz','Mediocampista','BOL'),('MED1BRA10','Felipe Melo','Mediocampista','BRA10'),('MED1BRA30','Pamplona','Mediocampista','BRA'),('MED1CAM10','Alexandre Song','Mediocampista','CAM10'),('MED1CHI10','Carlos Carmona','Mediocampista','CHI10'),('MED1CHI30','Casimiro Torres','Mediocampista','CHI'),('MED1COSTM10','Didier Zokora','Mediocampista','COSTM10'),('MED1DEU10','Marcell Jansen','Mediocampista','DEU10'),('MED1DEU34','Ernst Albrecht','Mediocampista','DEU34'),('MED1DIN10','Christian Poulsen','Mediocampista','DIN10'),('MED1DZ10','Yazid Mansouri','Mediocampista','DZ10'),('MED1ESP10','Andrés Iniesta','Mediocampista','ESP10'),('MED1FRA10','Yoann Gourcuff','Mediocampista','FRA10'),('MED1FRA30','Alex Villaplane','Mediocampista','FRA'),('MED1GHA10','Anthony Annan','Mediocampista','GHA10'),('MED1GRE10','Alexandros Tziolis','Mediocampista','GRE10'),('MED1HON10','Hendry Thomas','Mediocampista','HON10'),('MED1ING10','Steven Gerrard','Mediocampista','ING10'),('MED1ITA10','Daniele De Rossi','Mediocampista','ITA10'),('MED1JAP10','Yuki Abe','Mediocampista','JAP10'),('MED1KOR10','Nam Il Kim','Mediocampista','KOR10'),('MED1MEX10','Gerardo Torrado','Mediocampista','MEX10'),('MED1MEX30','Alfredo Sanchez','Mediocampista','MEX'),('MED1NIG10','Nwankwo Kanu','Mediocampista','NIG10'),('MED1NLD10','Mark Van Bommel','Mediocampista','NLD10'),('MED1NZ10','Simon Elliott','Mediocampista','NZ10'),('MED1PER30','Juan Alfonso Valle','Mediocampista','PER'),('MED1POR10','Pedro Mendes','Mediocampista','POR10'),('MED1PRY10','Carlos Bonet','Mediocampista','PRY10'),('MED1PRY30','Tranquilino Garcete','Mediocampista','PRY'),('MED1ROU30','Alfred Eisenbeisser','Mediocampista','ROU'),('MED1SER10','Gojko Kacar','Mediocampista','SER10'),('MED1SLO10','Robert Koren','Mediocampista','SLO10'),('MED1SUD10','MacBeth Sibaya','Mediocampista','SUD10'),('MED1SUI10','Benjamin Huggel','Mediocampista','SUI10'),('MED1SVK10','Zdenko Strba','Mediocampista','SVK10'),('MED1URU10','Walter Gargano','Mediocampista','URU10'),('MED1URU30','Jose Andrade','Mediocampista','URU'),('MED1USA10','Michael Bradley','Mediocampista','USA10'),('MED1USA30','Mike Bookie','Mediocampista','USA'),('MED1YUG30','Milorad Arsenijevic','Mediocampista','YUG'),('MED2ARG10','Angel Di Maria','Mediocampista','ARG10'),('MED2ARG30','Pedro Suarez','Mediocampista','ARG'),('MED2AUST10','Brett Emerton','Mediocampista','AUST10'),('MED2BEL30','Alexis Chantraine','Mediocampista','BEL'),('MED2BOL30','Jorge Argote','Mediocampista','BOL'),('MED2BRA10','Elano','Mediocampista','BRA10'),('MED2BRA30','Oscarino','Mediocampista','BRA'),('MED2CAM10','Landry N\'Guémo','Mediocampista','CAM10'),('MED2CHI10','Arturo Vidal','Mediocampista','CHI10'),('MED2CHI30','Arturo Torres','Mediocampista','CHI'),('MED2COSTM10','Ismael Tiote','Mediocampista','COSTM10'),('MED2DEU10','Sami Khedira','Mediocampista','DEU10'),('MED2DEU34','Jakob Bender','Mediocampista','DEU34'),('MED2DIN10','William Kvist','Mediocampista','DIN10'),('MED2DZ10','Ryad Boudebouz','Mediocampista','DZ10'),('MED2ESP10','Xavi','Mediocampista','ESP10'),('MED2FRA10','Jeremy Toulalan','Mediocampista','FRA10'),('MED2FRA30','Marcel Pinel','Mediocampista','FRA'),('MED2GHA10','Derek Boateng','Mediocampista','GHA10'),('MED2GRE10','Georgios Karagounis','Mediocampista','GRE10'),('MED2HON10','Ramon Nunez','Mediocampista','HON10'),('MED2ING10','Aaron Lennon','Mediocampista','ING10'),('MED2ITA10','Simone Pepe','Mediocampista','ITA10'),('MED2JAP10','Yasuhito Endo','Mediocampista','JAP10'),('MED2KOR10','Bo Kyung Kim','Mediocampista','KOR10'),('MED2MEX10','Israel Castro','Mediocampista','MEX10'),('MED2MEX30','Felipe Rosas','Mediocampista','MEX'),('MED2NIG10','Kalu Uche','Mediocampista','NIG10'),('MED2NLD10','Nigel De Jong','Mediocampista','NLD10'),('MED2NZ10','Tim Brown','Mediocampista','NZ10'),('MED2PER30','Julio Quintana','Mediocampista','PER'),('MED2POR10','Miguel Veloso','Mediocampista','POR10'),('MED2PRY10','Edgar Barreto','Mediocampista','PRY10'),('MED2PRY30','Diego Florentin','Mediocampista','PRY'),('MED2ROU30','Ladislau Raffinski','Mediocampista','ROU'),('MED2SER10','Zoran Tosic','Mediocampista','SER10'),('MED2SLO10','Valter Birsa','Mediocampista','SLO10'),('MED2SUD10','Lance Davids','Mediocampista','SUD10'),('MED2SUI10','Tranquillo Barnetta','Mediocampista','SUI10'),('MED2SVK10','Vladimir Weiss','Mediocampista','SVK10'),('MED2URU10','Sebastian Eguren','Mediocampista','URU10'),('MED2URU30','Carlos Riolfo','Mediocampista','URU'),('MED2USA10','DaMarcus Beasley','Mediocampista','USA10'),('MED2USA30','Phil Slone','Mediocampista','USA'),('MED2YUG30','Momcilo Djokic','Mediocampista','YUG'),('MED3ARG10','Juan Veron','Mediocampista','ARG10'),('MED3ARG30','Luis Monti','Mediocampista','ARG'),('MED3AUST10','Vince Grella','Mediocampista','AUST10'),('MED3BEL30','Jean De Clerq','Mediocampista','BEL'),('MED3BOL30','Jorge Balderrama','Mediocampista','BOL'),('MED3BRA10','Gilberto Silva','Mediocampista','BRA10'),('MED3BRA30','Ivan Mariz','Mediocampista','BRA'),('MED3CAM10','Jean Makoun','Mediocampista','CAM10'),('MED3CHI10','Jorge Valdivia','Mediocampista','CHI10'),('MED3CHI30','Humberto Elgueta','Mediocampista','CHI'),('MED3COSTM10','Jean Jacques Gosso','Mediocampista','COSTM10'),('MED3DEU10','Bastian Schweinsteiger','Mediocampista','DEU10'),('MED3DEU34','Rudi Gramlich','Mediocampista','DEU34'),('MED3DIN10','Daniel Jensen','Mediocampista','DIN10'),('MED3DZ10','Medhi Lacen','Mediocampista','DZ10'),('MED3ESP10','Cesc Fabregas','Mediocampista','ESP10'),('MED3FRA10','Florent Malouda','Mediocampista','FRA10'),('MED3FRA30','Jean Laurent','Mediocampista','FRA'),('MED3GHA10','Stephen Appiah','Mediocampista','GHA10'),('MED3GRE10','Sotiris Ninis','Mediocampista','GRE10'),('MED3HON10','Wilson Palacios','Mediocampista','HON10'),('MED3ING10','Frank Lampard','Mediocampista','ING10'),('MED3ITA10','Gennaro Gattuso','Mediocampista','ITA10'),('MED3JAP10','Daisuke Matsui','Mediocampista','JAP10'),('MED3KOR10','Ji Sung Park','Mediocampista','KOR10'),('MED3MEX10','Andres Guardado','Mediocampista','MEX10'),('MED3MEX30','Raimundo Rodriguez','Mediocampista','MEX'),('MED3NIG10','Yussuf Ayila','Mediocampista','NIG10'),('MED3NLD10','Wesley Sneijder','Mediocampista','NLD10'),('MED3NZ10','Leo Bertos','Mediocampista','NZ10'),('MED3PER30','Domingo Garcia','Mediocampista','PER'),('MED3POR10','Pepe','Mediocampista','POR10'),('MED3PRY10','Jonathan Santana','Mediocampista','PRY10'),('MED3PRY30','Romildo Etcheverry','Mediocampista','PRY'),('MED3ROU30','Corneliu Robe','Mediocampista','ROU'),('MED3SER10','Dejan Stankovic','Mediocampista','SER10'),('MED3SLO10','Rene Krhin','Mediocampista','SLO10'),('MED3SUD10','Siphiwe Tshabalala','Mediocampista','SUD10'),('MED3SUI10','Gokhan Inler','Mediocampista','SUI10'),('MED3SVK10','Jan Kozak','Mediocampista','SVK10'),('MED3URU10','Alvaro Pereira','Mediocampista','URU10'),('MED3URU30','Lorenzo Fernandez','Mediocampista','URU'),('MED3USA10','Clint Dempsey','Mediocampista','USA10'),('MED3USA30','Jimmy Gallagher','Mediocampista','USA'),('MED3YUG30','Teofilo Spasojevic','Mediocampista','YUG'),('MED4ARG10','Javier Mascherano','Mediocampista','ARG10'),('MED4ARG30','Edmundo Piaggio','Mediocampista','ARG'),('MED4AUST10','Mile Jedinak','Mediocampista','AUST10'),('MED4BEL30','Jan Diddens','Mediocampista','BEL'),('MED4BOL30','Miguel Brito','Mediocampista','BOL'),('MED4BRA10','Kaká','Mediocampista','BRA10'),('MED4BRA30','Hermogenes','Mediocampista','BRA'),('MED4CAM10','Eyong Enoh','Mediocampista','CAM10'),('MED4CHI10','Marco Estrada','Mediocampista','CHI10'),('MED4CHI30','Guillermo Saavedra','Mediocampista','CHI'),('MED4COSTM10','Romaric','Mediocampista','COSTM10'),('MED4DEU10','Mesut Ozil','Mediocampista','DEU10'),('MED4DEU34','Karl Hohmann','Mediocampista','DEU34'),('MED4DIN10','Martin Jorgensen','Mediocampista','DIN10'),('MED4DZ10','Karim Matmour','Mediocampista','DZ10'),('MED4ESP10','Xabi Alonso','Mediocampista','ESP10'),('MED4FRA10','Alou Diarra','Mediocampista','FRA10'),('MED4FRA30','Celestin Delmer','Mediocampista','FRA'),('MED4GHA10','Sulley Muntari','Mediocampista','GHA10'),('MED4GRE10','Konstantinos Katsouranis','Mediocampista','GRE10'),('MED4HON10','Edgar Alvarez','Mediocampista','HON10'),('MED4ING10','Joe Cole','Mediocampista','ING10'),('MED4ITA10','Claudio Marchisio','Mediocampista','ITA10'),('MED4JAP10','Shunsuke Nakamura','Mediocampista','JAP10'),('MED4KOR10','Jung Woo Kim','Mediocampista','KOR10'),('MED4MEX10','Jorge Torres','Mediocampista','MEX10'),('MED4MEX30','Efrain Amezcua','Mediocampista','MEX'),('MED4NIG10','Sani Kaita','Mediocampista','NIG10'),('MED4NLD10','Demy De Zeeuw','Mediocampista','NLD10'),('MED4NZ10','Andy Barron','Mediocampista','NZ10'),('MED4PER30','Placido Galindo','Mediocampista','PER'),('MED4POR10','Raul Meireles','Mediocampista','POR10'),('MED4PRY10','Enrique Vera','Mediocampista','PRY10'),('MED4PRY30','Eusebio Diaz','Mediocampista','PRY'),('MED4SER10','Nenad Milijas','Mediocampista','SER10'),('MED4SLO10','Andraz Kirm','Mediocampista','SLO10'),('MED4SUD10','Steven Pienaar','Mediocampista','SUD10'),('MED4SUI10','Valon Behrami','Mediocampista','SUI10'),('MED4SVK10','Marek Sapara','Mediocampista','SVK10'),('MED4URU10','Nicolas Lodeiro','Mediocampista','URU10'),('MED4URU30','Alvaro Gestido','Mediocampista','URU'),('MED4USA10','Landon Donovan','Mediocampista','USA10'),('MED4USA30','Arnie Oliver','Mediocampista','USA'),('MED5ARG10','Jonas Gutierrez','Mediocampista','ARG10'),('MED5AUST10','Carl Valeri','Mediocampista','AUST10'),('MED5BEL30','Auguste Hellemans','Mediocampista','BEL'),('MED5BOL30','Diogenes Lara','Mediocampista','BOL'),('MED5BRA10','Josue','Mediocampista','BRA10'),('MED5BRA30','Fortes','Mediocampista','BRA'),('MED5CAM10','Georges Mandjeck','Mediocampista','CAM10'),('MED5CHI10','Matias Fernandez','Mediocampista','CHI10'),('MED5COSTM10','Emmanuel Kone','Mediocampista','COSTM10'),('MED5DEU10','Thomas Müller','Mediocampista','DEU10'),('MED5DEU34','Ernst Lehner','Mediocampista','DEU34'),('MED5DIN10','Thomas Kahlenberg','Mediocampista','DIN10'),('MED5DZ10','Karim Ziani','Mediocampista','DZ10'),('MED5ESP10','Sergio Busquets','Mediocampista','ESP10'),('MED5FRA10','Abou Diaby','Mediocampista','FRA10'),('MED5FRA30','Augustin Chantrel','Mediocampista','FRA'),('MED5GHA10','Andre Ayew','Mediocampista','GHA10'),('MED5GRE10','Athanasios Prittas','Mediocampista','GRE10'),('MED5HON10','Danilo Turcios','Mediocampista','HON10'),('MED5ING10','Gareth Barry','Mediocampista','ING10'),('MED5ITA10','Mauro Camoranesi','Mediocampista','ITA10'),('MED5JAP10','Kengo Nakamura','Mediocampista','JAP10'),('MED5KOR10','Jae Sung Kim','Mediocampista','KOR10'),('MED5NIG10','Lukman Haruna','Mediocampista','NIG10'),('MED5NLD10','Stijn Schaars','Mediocampista','NLD10'),('MED5NZ10','Michael Mcglinchey','Mediocampista','NZ10'),('MED5PER30','Alberto Denegri','Mediocampista','PER'),('MED5POR10','Ruben Amorim','Mediocampista','POR10'),('MED5PRY10','Victor Caceres','Mediocampista','PRY10'),('MED5PRY30','Santiago Benitez','Mediocampista','PRY'),('MED5SER10','Milan Jovanovic','Mediocampista','SER10'),('MED5SLO10','Aleksandar Radosavljevic','Mediocampista','SLO10'),('MED5SUD10','Teko Modise','Mediocampista','SUD10'),('MED5SUI10','Marco Padalino','Mediocampista','SUI10'),('MED5SVK10','Miroslav Stoch','Mediocampista','SVK10'),('MED5URU10','Diego Perez','Mediocampista','URU10'),('MED5URU30','Conduelo Piriz','Mediocampista','URU'),('MED5USA10','Stuart Holden','Mediocampista','USA10'),('MED6ARG10','Maxi Rodriguez','Mediocampista','ARG10'),('MED6AUST10','Dario Vidosic','Mediocampista','AUST10'),('MED6BRA10','Ramires','Mediocampista','BRA10'),('MED6BRA30','Fernando Giudicelli','Mediocampista','BRA'),('MED6CAM10','Joel Matip','Mediocampista','CAM10'),('MED6CHI10','Gonzalo Fierro','Mediocampista','CHI10'),('MED6COSTM10','Yaya Toure','Mediocampista','COSTM10'),('MED6DEU10','Piotr Trochowski','Mediocampista','DEU10'),('MED6DIN10','Jakob Poulsen','Mediocampista','DIN10'),('MED6DZ10','Adlane Guedioura','Mediocampista','DZ10'),('MED6ESP10','Javi Martinez','Mediocampista','ESP10'),('MED6GHA10','Kwadwo Asamoah','Mediocampista','GHA10'),('MED6HON10','Amado Guevara','Mediocampista','HON10'),('MED6ING10','James Milner','Mediocampista','ING10'),('MED6ITA10','Angelo Palombo','Mediocampista','ITA10'),('MED6JAP10','Makoto Hasebe','Mediocampista','JAP10'),('MED6KOR10','Sung-yueng Ki','Mediocampista','KOR10'),('MED6NIG10','Dickson Etuhu','Mediocampista','NIG10'),('MED6NLD10','Ibrahim Afellay','Mediocampista','NLD10'),('MED6NZ10','Aaron Clapham','Mediocampista','NZ10'),('MED6PER30','Eduardo Astengo','Mediocampista','PER'),('MED6POR10','Tiago','Mediocampista','POR10'),('MED6PRY10','Cristian Riveros','Mediocampista','PRY10'),('MED6PRY30','Francisco Aguirre','Mediocampista','PRY'),('MED6SER10','Milos Krasic','Mediocampista','SER10'),('MED6SLO10','Andrej Komac','Mediocampista','SLO10'),('MED6SUD10','Reneilwe Letsholonyane','Mediocampista','SUD10'),('MED6SUI10','Hakan Yakin','Mediocampista','SUI10'),('MED6SVK10','Marek Hamsik','Mediocampista','SVK10'),('MED6URU10','Egidio Arevalo','Mediocampista','URU10'),('MED6URU30','Angel Melogno','Mediocampista','URU'),('MED6USA10','Ricardo Clark','Mediocampista','USA10'),('MED7ARG10','Javier Pastore','Mediocampista','ARG10'),('MED7BRA10','Julio Baptista','Mediocampista','BRA10'),('MED7BRA30','Fausto','Mediocampista','BRA'),('MED7CHI10','Rodrigo Millar','Mediocampista','CHI10'),('MED7DEU10','Toni Kroos','Mediocampista','DEU10'),('MED7DIN10','Thomas Enevoldsen','Mediocampista','DIN10'),('MED7DZ10','Hassan Yebda','Mediocampista','DZ10'),('MED7ESP10','David Silva','Mediocampista','ESP10'),('MED7ING10','Shaun Wright-Phillips','Mediocampista','ING10'),('MED7ITA10','Andrea Pirlo','Mediocampista','ITA10'),('MED7JAP10','Keisuke Honda','Mediocampista','JAP10'),('MED7KOR10','Chung-yong Lee','Mediocampista','KOR10'),('MED7NLD10','Rafael Van Der Vaart','Mediocampista','NLD10'),('MED7NZ10','Dave Mulligan','Mediocampista','NZ10'),('MED7POR10','Deco','Mediocampista','POR10'),('MED7PRY10','Nestor Ortigoza','Mediocampista','PRY10'),('MED7SER10','Milos Ninkovic','Mediocampista','SER10'),('MED7SLO10','Dalibor Stevanovic','Mediocampista','SLO10'),('MED7SUD10','Kagisho Dikgacoi','Mediocampista','SUD10'),('MED7SUI10','Gelson Fernandes','Mediocampista','SUI10'),('MED7SVK10','Juraj Kucka','Mediocampista','SVK10'),('MED7URU10','Ignacio Gonzalez','Mediocampista','URU10'),('MED7USA10','Francisco Torres','Mediocampista','USA10'),('MED8BRA10','Kleberson','Mediocampista','BRA10'),('MED8BRA30','Benvenutto','Mediocampista','BRA'),('MED8CHI10','Rodrigo Tello','Mediocampista','CHI10'),('MED8DEU10','Marko Marin','Mediocampista','DEU10'),('MED8DZ10','Foued Kadir','Mediocampista','DZ10'),('MED8ING10','Michael Carrick','Mediocampista','ING10'),('MED8ITA10','Riccardo Montolivo','Mediocampista','ITA10'),('MED8JAP10','Junichi Inamoto','Mediocampista','JAP10'),('MED8KOR10','Ki Hun Yeom','Mediocampista','KOR10'),('MED8NZ10','Jeremy Christie','Mediocampista','NZ10'),('MED8SER10','Radosav Petrovic','Mediocampista','SER10'),('MED8SUD10','Surprise Moriri','Mediocampista','SUD10'),('MED8SUI10','Pirmin Schwegler','Mediocampista','SUI10'),('MED8SVK10','Kamil Kopunek','Mediocampista','SVK10'),('MED8URU10','Alvaro Fernandez','Mediocampista','URU10'),('MED8USA10','Maurice Edu','Mediocampista','USA10'),('MED9DZ10','Djamal Abdoun','Mediocampista','DZ10'),('MED9SER10','Zdravko Kuzmanovic','Mediocampista','SER10'),('MED9SUD10','Thanduyise Khuboni','Mediocampista','SUD10'),('MED9SUI10','Xherdan Shaqiri','Mediocampista','SUI10'),('MED9USA10','Benny Feilhaber','Mediocampista','USA10');
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;
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
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` VALUES ('ITA341','OCT34',NULL,'Estadio Giuseppe Meazza',NULL,NULL,'1934-05-27','SUI34','NLD34','3 - 2'),('ITA3410','CUAR34',NULL,'Estadio Renato Dall\'Ara',NULL,NULL,'1934-05-31','AUT34','HUN34','2 - 1'),('ITA3411','CUAR34',NULL,'Estadio Artemio Franchi (Florencia)',NULL,NULL,'1934-05-31','ITA34','ESP34','1 - 1 (0 - 0) '),('ITA3412','CUAR34',NULL,'Estadio Giuseppe Grezar',NULL,NULL,'1934-05-31','DEU34','SWE34','2 - 1'),('ITA3413','CUAR34',NULL,'Estadio Artemio Franchi (Florencia)',NULL,NULL,'1934-06-01','ITA34','ESP34','1 - 0'),('ITA3414','SEMI34',NULL,'Estadio Nacional del Partido Nacional Fascista',NULL,NULL,'1934-06-03','CZE34','DEU34','3 - 1'),('ITA3415','SEMI34',NULL,'Estadio Giuseppe Grezar',NULL,NULL,'1934-06-03','ITA34','AUT34','1 - 0'),('ITA3416','SEMI34',NULL,'Estadio Partenopeo',NULL,NULL,'1934-06-07','AUT34','DEU34','2 - 3'),('ITA3417','FINAL34',NULL,'Estadio Nacional del Partido Nacional Fascista',NULL,NULL,'1934-06-10','ITA34','CZE34','2 - 1 (1 - 0) '),('ITA342','OCT34',NULL,'Estadio Renato Dall\'Ara',NULL,NULL,'1934-05-27','SWE34','ARG34','3 - 2'),('ITA343','OCT34',NULL,'Estadio Nacional del Partido Nacional Fascista',NULL,NULL,'1934-05-27','ITA34','USA34','7 - 1'),('ITA344','OCT34',NULL,'Estadio Partenopeo',NULL,NULL,'1934-05-27','HUN34','EGY34','4 - 2'),('ITA345','OCT34',NULL,'Estadio Luigi Ferraris',NULL,NULL,'1934-05-27','ESP34','BRA34','3 - 1'),('ITA346','OCT34',NULL,'Estadio Giuseppe Grezar',NULL,NULL,'1934-05-27','CZE34','ROU34','2 - 1'),('ITA347','OCT34',NULL,'Estadio Olímpico de Turín',NULL,NULL,'1934-05-27','AUT34','FRA34','3 - 2 (2 - 1) '),('ITA348','OCT34',NULL,'Estadio Artemio Franchi (Florencia)',NULL,NULL,'1934-05-27','DEU34','BEL34','5 - 2'),('ITA349','CUAR34',NULL,'Estadio Olímpico de Turín',NULL,NULL,'1934-05-31','CZE34','SUI34','3 - 2'),('SUD101','GRUPOS10','A19',NULL,'RavshanIrmatov',NULL,'2010-06-11','SUD10','MEX10','1 - 1'),('SUD1010','GRUPOS10','E19',NULL,'YuichiNishimura',NULL,'2010-06-14','JAP10','CAM10','1 - 0'),('SUD1011','GRUPOS10','F19',NULL,NULL,NULL,'2010-06-14','ITA10','PRY10','1 - 1'),('SUD1012','GRUPOS10','F19',NULL,NULL,NULL,'2010-06-15','NZ10','SVK10','1 - 1'),('SUD1013','GRUPOS10','G19',NULL,NULL,NULL,'2010-06-15','COSTM10','POR10','0 - 0'),('SUD1014','GRUPOS10','G19',NULL,NULL,NULL,'2010-06-15','BRA10','KORN10','2 - 1'),('SUD1015','GRUPOS10','H19',NULL,'RavshanIrmatov',NULL,'2010-06-16','HON10','CHI10','0 - 1'),('SUD1016','GRUPOS10','H19',NULL,NULL,NULL,'2010-06-16','ESP10','SUI10','0 - 1'),('SUD1017','GRUPOS10','A19',NULL,'MassimoBusacca',NULL,'2010-06-17','SUD10','URU10','0 - 3'),('SUD1018','GRUPOS10','A19',NULL,'KhalilAlGhamdi',NULL,'2010-06-17','FRA10','MEX10','0 - 2'),('SUD1019','GRUPOS10','B19',NULL,'ÓscarRuiz',NULL,'2010-06-17','GRE10','NIG10','2 - 1'),('SUD102','GRUPOS10','A19',NULL,'YuichiNishimura',NULL,'2010-06-11','URU10','FRA10','0 - 0'),('SUD1020','GRUPOS10','B19',NULL,'FrankDeBleeckere',NULL,'2010-06-17','ARG10','KOR10','4 - 1'),('SUD1021','GRUPOS10','D19',NULL,NULL,NULL,'2010-06-18','DEU10','SER10','0 - 1'),('SUD1022','GRUPOS10','C19',NULL,NULL,NULL,'2010-06-18','SLO10','USA10','2 - 2'),('SUD1023','GRUPOS10','C19',NULL,NULL,NULL,'2010-06-18','ING10','DZ10','0 - 0'),('SUD1024','GRUPOS10','D19',NULL,NULL,NULL,'2010-06-19','GHA10','AUST10','1 - 1'),('SUD1025','GRUPOS10','E19',NULL,NULL,NULL,'2010-06-19','NLD10','JAP10','1 - 0'),('SUD1026','GRUPOS10','E19',NULL,NULL,NULL,'2010-06-19','CAM10','DIN10','1 - 2'),('SUD1027','GRUPOS10','F19',NULL,NULL,NULL,'2010-06-20','SVK10','PRY10','0 - 2'),('SUD1028','GRUPOS10','F19',NULL,'RavshanIrmatov',NULL,'2010-06-20','ITA10','NZ10','1 - 1'),('SUD1029','GRUPOS10','G19',NULL,NULL,NULL,'2010-06-20','BRA10','COSTM10','3 - 1'),('SUD103','GRUPOS10','B19',NULL,'WolfgangStark',NULL,'2010-06-12','ARG10','NIG10','1 - 0'),('SUD1030','GRUPOS10','G19',NULL,NULL,NULL,'2010-06-21','POR10','KORN10','7 - 0'),('SUD1031','GRUPOS10','H19',NULL,NULL,NULL,'2010-06-21','CHI10','SUI10','1 - 0'),('SUD1032','GRUPOS10','H19',NULL,NULL,NULL,'2010-06-21','ESP10','HON10','2 - 0'),('SUD1033','GRUPOS10','A19',NULL,'ViktorKassai',NULL,'2010-06-22','MEX10','URU10','0 - 1'),('SUD1034','GRUPOS10','A19',NULL,'ÓscarRuiz',NULL,'2010-06-22','FRA10','SUD10','1 - 2'),('SUD1035','GRUPOS10','B19',NULL,'OlegarioBenquerença',NULL,'2010-06-22','NIG10','KOR10','2 - 2'),('SUD1036','GRUPOS10','B19',NULL,'RavshanIrmatov',NULL,'2010-06-22','GRE10','ARG10','0 - 2'),('SUD1037','GRUPOS10','C19',NULL,'RavshanIrmatov',NULL,'2010-06-23','SLO10','ING10','0 - 1'),('SUD1038','GRUPOS10','C19',NULL,NULL,NULL,'2010-06-23','USA10','DZ10','1 - 0'),('SUD1039','GRUPOS10','D19',NULL,NULL,NULL,'2010-06-23','GHA10','DEU10','0 - 1'),('SUD104','GRUPOS10','B19',NULL,'MichaelHester',NULL,'2010-06-12','KOR10','GRE10','2 - 0'),('SUD1040','GRUPOS10','D19',NULL,NULL,NULL,'2010-06-23','AUST10','SER10','2 - 1'),('SUD1041','GRUPOS10','F19',NULL,NULL,NULL,'2010-06-24','SVK10','ITA10','3 - 2'),('SUD1042','GRUPOS10','F19',NULL,'RavshanIrmatov',NULL,'2010-06-24','PRY10','NZ10','0 - 0'),('SUD1043','GRUPOS10','E19',NULL,NULL,NULL,'2010-06-24','DIN10','JAP10','1 - 3'),('SUD1044','GRUPOS10','E19',NULL,NULL,NULL,'2010-06-24','CAM10','NLD10','1 - 2'),('SUD1045','GRUPOS10','G19',NULL,NULL,NULL,'2010-06-25','POR10','BRA10','0 - 0'),('SUD1046','GRUPOS10','G19',NULL,'RavshanIrmatov',NULL,'2010-06-25','KORN10','COSTM10','0 - 3'),('SUD1047','GRUPOS10','H19',NULL,NULL,NULL,'2010-06-25','CHI10','ESP10','1 - 2'),('SUD1048','GRUPOS10','H19',NULL,NULL,NULL,'2010-06-25','SUI10','HON10','0 - 0'),('SUD1049','OCT10',NULL,NULL,NULL,NULL,'2010-06-26','URU10','KOR10','2 - 1'),('SUD105','GRUPOS10','C19',NULL,'CarlosSimon',NULL,'2010-06-12','ING10','USA10','1 - 1'),('SUD1050','OCT10',NULL,NULL,NULL,NULL,'2010-06-26','USA10','GHA10','1 - 2'),('SUD1051','OCT10',NULL,NULL,NULL,NULL,'2010-06-27','DEU10','ING10','4 - 1'),('SUD1052','OCT10',NULL,NULL,NULL,NULL,'2010-06-27','ARG10','MEX10','3 - 1'),('SUD1053','OCT10',NULL,NULL,NULL,NULL,'2010-06-28','NLD10','SVK10','2 - 1'),('SUD1054','OCT10',NULL,NULL,NULL,NULL,'2010-06-28','BRA10','CHI10','3 - 0'),('SUD1055','OCT10',NULL,NULL,NULL,NULL,'2010-06-29','PRY10','JAP10','0 - 0'),('SUD1056','OCT10',NULL,NULL,NULL,NULL,'2010-06-29','ESP10','POR10','1 - 0'),('SUD1057','CUAR10',NULL,NULL,NULL,NULL,'2010-07-02','NLD10','BRA10','2 - 1'),('SUD1058','CUAR10',NULL,NULL,NULL,NULL,'2010-07-02','URU10','GHA10','1 - 1 (0 - 0) en tiempo extra 4 - 2 por penales'),('SUD1059','CUAR10',NULL,NULL,NULL,NULL,'2010-07-03','ARG10','DEU10','0 - 4'),('SUD106','GRUPOS10','C19',NULL,NULL,NULL,'2010-06-13','DZ10','SLO10','0 - 1'),('SUD1060','CUAR10',NULL,NULL,NULL,NULL,'2010-07-03','PRY10','ESP10','0 - 1'),('SUD1061','SEMI10',NULL,NULL,NULL,NULL,'2010-07-06','URU10','NLD10','2 - 3'),('SUD1062','SEMI10',NULL,NULL,NULL,NULL,'2010-07-07','DEU10','ESP10','0 - 1'),('SUD1063','3erPUESTO10',NULL,NULL,NULL,NULL,'2010-07-10','URU10','DEU10','2 - 3'),('SUD1064','FINAL10',NULL,NULL,'HowardWebb',NULL,'2010-07-11','NLD10','ESP10','0 - 1 (0 - 1) en tiempo extra'),('SUD107','GRUPOS10','D19',NULL,NULL,NULL,'2010-06-13','DEU10','AUST10','4 - 0'),('SUD108','GRUPOS10','D19',NULL,NULL,NULL,'2010-06-13','SER10','GHA10','0 - 1'),('SUD109','GRUPOS10','E19',NULL,NULL,NULL,'2010-06-14','NLD10','DIN10','2 - 0'),('URU301','GRUPOS','Grupo D','Estadio Pocitos',NULL,NULL,'1930-07-13','USA','BEL',NULL),('URU3010','GRUPOS','Grupo A','Estadio Parque Central',NULL,NULL,'1930-07-19','ARG','MEX',NULL),('URU3011','GRUPOS','Grupo A','Estadio Parque Central',NULL,NULL,'1930-07-19','CHI','FRA',NULL),('URU3012','GRUPOS','Grupo D','Estadio Parque Central',NULL,NULL,'1930-07-20','PAR','BEL',NULL),('URU3013','GRUPOS','Grupo B','Estadio Parque Central',NULL,NULL,'1930-07-21','BRA','BOL',NULL),('URU3014','GRUPOS','Grupo C','Estadio Centenario',NULL,NULL,'1930-07-21','URU','ROU',NULL),('URU3015','GRUPOS','Grupo A','Estadio Centenario',NULL,NULL,'1930-07-22','ARG','CHI',NULL),('URU3016','SEMIFINAL',NULL,'Estadio Centenario',NULL,NULL,'1930-07-26','ARG','USA',NULL),('URU3017','SEMIFINAL',NULL,'Estadio Centenario',NULL,NULL,'1930-07-27','URU','YUG',NULL),('URU3018','FINAL',NULL,'Estadio Centenario',NULL,NULL,'1930-07-30','ARG','URU',NULL),('URU302','GRUPOS','Grupo A','Estadio Parque Central',NULL,NULL,'1930-07-13','FRA','MEX',NULL),('URU303','GRUPOS','Grupo B','Estadio Parque Central',NULL,NULL,'1930-07-14','YUG','BRA',NULL),('URU304','GRUPOS','Grupo C','Estadio Gran Parque Central',NULL,NULL,'1930-07-14','ROU','PER',NULL),('URU305','GRUPOS','Grupo A','Estadio Parque Central',NULL,NULL,'1930-07-15','ARG','FRA',NULL),('URU306','GRUPOS','Grupo A','Estadio Parque Central',NULL,NULL,'1930-07-16','CHI','MEX',NULL),('URU307','GRUPOS','Grupo D','Estadio Pocitos',NULL,NULL,'1930-07-17','USA','PAR',NULL),('URU308','GRUPOS','Grupo B','Estadio Parque Central',NULL,NULL,'1930-07-17','YUG','BOL',NULL),('URU309','GRUPOS','Grupo C','Estadio Gran Parque Central',NULL,NULL,'1930-07-18','URU','PER',NULL);
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;
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
-- Dumping data for table `seleccion`
--

LOCK TABLES `seleccion` WRITE;
/*!40000 ALTER TABLE `seleccion` DISABLE KEYS */;
INSERT INTO `seleccion` VALUES ('ALE74','Alemania Democrática','Alemania Democrática',NULL),('ANG06','Angola','Angola',NULL),('ARAB02','Arabia Saudita','Arabia Saudita',NULL),('ARAB06','Arabia Saudita','Arabia Saudita',NULL),('ARAB18','Arabia Saudita','Arabia Saudita',NULL),('ARAB94','Arabia Saudita','Arabia Saudita',NULL),('ARAB98','Arabia Saudita','Arabia Saudita',NULL),('ARG','Argentina','Argentina','ARG1'),('ARG02','Argentina','Argentina',NULL),('ARG06','Argentina','Argentina',NULL),('ARG10','Argentina','Argentina',NULL),('ARG14','Argentina','Argentina',NULL),('ARG18','Argentina','Argentina',NULL),('ARG34','Argentina','Argentina','ENTFA'),('ARG58','Argentina','Argentina',NULL),('ARG62','Argentina','Argentina',NULL),('ARG66','Argentina','Argentina',NULL),('ARG74','Argentina','Argentina',NULL),('ARG78','Argentina','Argentina',NULL),('ARG82','Argentina','Argentina',NULL),('ARG86','Argentina','Argentina',NULL),('ARG90','Argentina','Argentina',NULL),('ARG94','Argentina','Argentina',NULL),('ARG98','Argentina','Argentina',NULL),('AUST06','Australia','Australia',NULL),('AUST10','Australia','Australia',NULL),('AUST14','Australia','Australia',NULL),('AUST18','Australia','Australia',NULL),('AUT','Austria','Austria',NULL),('AUT34','Austria','Austria','ENTHA'),('AUT54','Austria','Austria',NULL),('AUT58','Austria','Austria',NULL),('AUT74','Australia','Australia',NULL),('AUT78','Austria','Austria',NULL),('AUT82','Austria','Austria',NULL),('AUT90','Austria','Austria',NULL),('AUT98','Austria','Austria',NULL),('BEL','Bélgica','Bélgica',NULL),('BEL02','Bélgica','Bélgica',NULL),('BEL14','Bélgica','Bélgica',NULL),('BEL18','Bélgica','Bélgica',NULL),('BEL34','Bélgica','Bélgica','ENTHG'),('BEL54','Bélgica','Bélgica',NULL),('BEL82','Bélgica','Bélgica',NULL),('BEL86','Bélgica','Bélgica',NULL),('BEL90','Bélgica','Bélgica',NULL),('BEL94','Bélgica','Bélgica',NULL),('BEL98','Bélgica','Bélgica',NULL),('BOL','Bolivia','Bolivia',NULL),('BOL50','Bolivia','Bolivia',NULL),('BOL94','Bolivia','Bolivia',NULL),('BRA','Brasil','Brasil',NULL),('BRA02','Brasil','Brasil',NULL),('BRA06','Brasil','Brasil',NULL),('BRA10','Brasil','Brasil',NULL),('BRA14','Brasil','Brasil',NULL),('BRA18','Brasil','Brasil',NULL),('BRA34','Brasil','Brasil','ENTLV'),('BRA50','Brasil','Brasil',NULL),('BRA54','Brasil','Brasil',NULL),('BRA58','Brasil','Brasil',NULL),('BRA62','Brasil','Brasil',NULL),('BRA66','Brasil','Brasil',NULL),('BRA74','Brasil','Brasil',NULL),('BRA78','Brasil','Brasil',NULL),('BRA82','Brasil','Brasil',NULL),('BRA86','Brasil','Brasil',NULL),('BRA90','Brasil','Brasil',NULL),('BRA94','Brasil','Brasil',NULL),('BRA98','Brasil','Brasil',NULL),('BUL62','Bulgaria','Bulgaria',NULL),('BUL66','Bulgaria','Bulgaria',NULL),('BUL74','Bulgaria','Bulgaria',NULL),('BUL86','Bulgaria','Bulgaria',NULL),('BUL94','Bulgaria','Bulgaria',NULL),('BUL98','Bulgaria','Bulgaria',NULL),('BYH14','Bosnia y Herzegovina','Bosnia y Herzegovina',NULL),('CAM02','Camerún','Camerún',NULL),('CAM10','Camerún','Camerún',NULL),('CAM14','Camerún','Camerún',NULL),('CAM82','Camerún','Camerún',NULL),('CAM90','Camerún','Camerún',NULL),('CAM94','Camerún','Camerún',NULL),('CAM98','Camerún','Camerún',NULL),('CAN86','Canadá','Canadá',NULL),('CHE','Suiza','Suiza',NULL),('CHI','Chile','Chile',NULL),('CHI10','Chile','Chile',NULL),('CHI14','Chile','Chile',NULL),('CHI50','Chile','Chile',NULL),('CHI62','Chile','Chile',NULL),('CHI66','Chile','Chile',NULL),('CHI74','Chile','Chile',NULL),('CHI82','Chile','Chile',NULL),('CHI98','Chile','Chile',NULL),('CHIN02','China (República Popular)','China (República Popular)',NULL),('COL14','Colombia','Colombia',NULL),('COL18','Colombia','Colombia',NULL),('COL62','Colombia','Colombia',NULL),('COL90','Colombia','Colombia',NULL),('COL94','Colombia','Colombia',NULL),('COL98','Colombia','Colombia',NULL),('COSTM06','Costa de Marfil','Costa de Marfil',NULL),('COSTM10','Costa de Marfil','Costa de Marfil',NULL),('COSTM14','Costa de Marfil','Costa de Marfil',NULL),('COSTR02','Costa Rica','Costa Rica',NULL),('COSTR06','Costa Rica','Costa Rica',NULL),('COSTR14','Costa Rica','Costa Rica',NULL),('COSTR18','Costa Rica','Costa Rica',NULL),('COSTR90','Costa Rica','Costa Rica',NULL),('CRO02','Croacia','Croacia',NULL),('CRO06','Croacia','Croacia',NULL),('CRO14','Croacia','Croacia',NULL),('CRO18','Croacia','Croacia',NULL),('CRO98','Croacia','Croacia',NULL),('CZE','Checoslovaquia','Checoslovaquia',NULL),('CZE06','República Checa','República Checa',NULL),('CZE34','Checoslovaquia','Checoslovaquia','ENTKC'),('CZE54','Checoslovaquia','Checoslovaquia',NULL),('CZE58','Checoslovaquia','Checoslovaquia',NULL),('CZE62','Checoslovaquia','Checoslovaquia',NULL),('CZE82','Checoslovaquia','Checoslovaquia',NULL),('CZE90','Checoslovaquia','Checoslovaquia',NULL),('DEU','Alemania','Alemania',NULL),('DEU02','Alemania','Alemania',NULL),('DEU06','Alemania','Alemania',NULL),('DEU10','Alemania','Alemania',NULL),('DEU14','Alemania','Alemania',NULL),('DEU18','Alemania','Alemania',NULL),('DEU34','Alemania','Alemania','ENTOD'),('DEU54','Alemania Federal','Alemania Federal',NULL),('DEU58','Alemania Federal','Alemania Federal',NULL),('DEU62','Alemania Federal','Alemania Federal',NULL),('DEU66','Alemania Federal','Alemania Federal',NULL),('DEU70','Alemania Federal','Alemania Federal',NULL),('DEU74','Alemania Federal','Alemania Federal',NULL),('DEU78','Alemania Federal','Alemania Federal',NULL),('DEU82','Alemania Federal','Alemania Federal',NULL),('DEU86','Alemania Federal','Alemania Federal',NULL),('DEU90','Alemania Federal','Alemania Federal',NULL),('DEU94','Alemania','Alemania',NULL),('DEU98','Alemania','Alemania',NULL),('DIN02','Dinamarca','Dinamarca',NULL),('DIN10','Dinamarca','Dinamarca',NULL),('DIN18','Dinamarca','Dinamarca',NULL),('DIN86','Dinamarca','Dinamarca',NULL),('DIN98','Dinamarca','Dinamarca',NULL),('DZ10','Argelia','Argelia',NULL),('DZ14','Argelia','Argelia',NULL),('DZ82','Argelia','Argelia',NULL),('DZ86','Argelia','Argelia',NULL),('ECU02','Ecuador','Ecuador',NULL),('ECU06','Ecuador','Ecuador',NULL),('ECU14','Ecuador','Ecuador',NULL),('EGY','Egipto','Egipto',NULL),('EGY18','Egipto','Egipto',NULL),('EGY34','Egipto','Egipto','ENTJM'),('EGY90','Egipto','Egipto',NULL),('EMA90','Emiratos Árabes Unidos','Emiratos Árabes Unidos',NULL),('ESA82','El Salvador','El Salvador',NULL),('ESP','España','España',NULL),('ESP02','España','España',NULL),('ESP06','España','España',NULL),('ESP10','España','España',NULL),('ESP14','España','España',NULL),('ESP18','España','España',NULL),('ESP34','España','España','ENTA'),('ESP50','España','España',NULL),('ESP62','España','España',NULL),('ESP66','España','España',NULL),('ESP78','España','España',NULL),('ESP82','España','España',NULL),('ESP86','España','España',NULL),('ESP90','España','España',NULL),('ESP94','España','España',NULL),('ESP98','España','España',NULL),('FRA','Francia','Francia',NULL),('FRA02','Francia','Francia',NULL),('FRA06','Francia','Francia',NULL),('FRA10','Francia','Francia',NULL),('FRA14','Francia','Francia',NULL),('FRA18','Francia','Francia',NULL),('FRA34','Francia','Francia','ENTSF'),('FRA54','Francia','Francia',NULL),('FRA58','Francia','Francia',NULL),('FRA66','Francia','Francia',NULL),('FRA78','Francia','Francia',NULL),('FRA82','Francia','Francia',NULL),('FRA86','Francia','Francia',NULL),('FRA98','Francia','Francia',NULL),('GHA06','Ghana','Ghana',NULL),('GHA10','Ghana','Ghana',NULL),('GHA14','Ghana','Ghana',NULL),('GRE10','Grecia','Grecia',NULL),('GRE14','Grecia','Grecia',NULL),('GRE94','Grecia','Grecia',NULL),('HAI74','Haití','Haití',NULL),('HON10','Honduras','Honduras',NULL),('HON14','Honduras','Honduras',NULL),('HON82','Honduras','Honduras',NULL),('HUN','Hungría','Hungría',NULL),('HUN34','Hungría','Hungría','ENTON'),('HUN54','Hungría','Hungría',NULL),('HUN58','Hungría','Hungría',NULL),('HUN62','Hungría','Hungría',NULL),('HUN66','Hungría','Hungría',NULL),('HUN82','Hungría','Hungría',NULL),('HUN86','Hungría','Hungría',NULL),('HUNG78','Hungría','Hungría',NULL),('ING02','Inglaterra','Inglaterra',NULL),('ING06','Inglaterra','Inglaterra',NULL),('ING10','Inglaterra','Inglaterra',NULL),('ING14','Inglaterra','Inglaterra',NULL),('ING18','Inglaterra','Inglaterra',NULL),('ING50','Inglaterra','Inglaterra',NULL),('ING54','Inglaterra','Inglaterra',NULL),('ING58','Inglaterra','Inglaterra',NULL),('ING62','Inglaterra','Inglaterra',NULL),('ING66','Inglaterra','Inglaterra',NULL),('ING82','Inglaterra','Inglaterra',NULL),('ING86','Inglaterra','Inglaterra',NULL),('ING90','Inglaterra','Inglaterra',NULL),('ING98','Inglaterra','Inglaterra',NULL),('IRA06','Irán','Irán',NULL),('IRA14','Irán','Irán',NULL),('IRA18','Irán','Irán',NULL),('IRA78','Irán','Irán',NULL),('IRA98','Irán','Irán',NULL),('IRK86','Irak','Irak',NULL),('IRL02','Irlanda','Irlanda',NULL),('IRL90','Irlanda','Irlanda',NULL),('IRL94','Irlanda','Irlanda',NULL),('IRLN58','Irlanda del Norte','Irlanda del Norte',NULL),('IRLN82','Irlanda del Norte','Irlanda del Norte',NULL),('IRLN86','Irlanda del Norte','Irlanda del Norte',NULL),('ISL18','Islandia','Islandia',NULL),('ITA','Italia','Italia',NULL),('ITA02','Italia','Italia',NULL),('ITA06','Italia','Italia',NULL),('ITA10','Italia','Italia',NULL),('ITA14','Italia','Italia',NULL),('ITA34','Italia','Italia','ENTVI'),('ITA50','Italia','Italia',NULL),('ITA54','Italia','Italia',NULL),('ITA62','Italia','Italia',NULL),('ITA66','Italia','Italia',NULL),('ITA74','Italia','Italia',NULL),('ITA78','Italia','Italia',NULL),('ITA82','Italia','Italia',NULL),('ITA86','Italia','Italia',NULL),('ITA90','Italia','Italia',NULL),('ITA94','Italia','Italia',NULL),('ITA98','Italia','Italia',NULL),('JAM98','Jamaica','Jamaica',NULL),('JAP02','Japón','Japón',NULL),('JAP06','Japón','Japón',NULL),('JAP10','Japón','Japón',NULL),('JAP14','Japón','Japón',NULL),('JAP18','Japón','Japón',NULL),('JAP98','Japón','Japón',NULL),('KOR02','Corea del Sur','Corea del Sur',NULL),('KOR06','Corea del Sur','Corea del Sur',NULL),('KOR10','Corea del Sur','Corea del Sur',NULL),('KOR14','Corea del Sur','Corea del Sur',NULL),('KOR18','Corea del Sur','Corea del Sur',NULL),('KOR54','Corea del Sur','Corea del Sur',NULL),('KOR86','Corea del Sur','Corea del Sur',NULL),('KOR90','Corea del Sur','Corea del Sur',NULL),('KOR94','Corea del Sur','Corea del Sur',NULL),('KOR98','Corea del Sur','Corea del Sur',NULL),('KORN10','Corea del Norte','Corea del Norte',NULL),('KORN66','Corea del Norte','Corea del Norte',NULL),('KUW82','Kuwait','Kuwait',NULL),('MARR18','Marruecos','Marruecos',NULL),('MARR86','Marruecos','Marruecos',NULL),('MARR94','Marruecos','Marruecos',NULL),('MARR98','Marruecos','Marruecos',NULL),('MEX','México','México',NULL),('MEX02','México','México',NULL),('MEX06','México','México',NULL),('MEX10','México','México',NULL),('MEX14','México','México',NULL),('MEX18','México','México',NULL),('MEX50','México','México',NULL),('MEX54','México','México',NULL),('MEX58','México','México',NULL),('MEX62','México','México',NULL),('MEX66','México','México',NULL),('MEX78','México','México',NULL),('MEX86','México','México',NULL),('MEX94','México','México',NULL),('MEX98','México','México',NULL),('NIF98','Nigeria','Nigeria',NULL),('NIG02','Nigeria','Nigeria',NULL),('NIG10','Nigeria','Nigeria',NULL),('NIG14','Nigeria','Nigeria',NULL),('NIG18','Nigeria','Nigeria',NULL),('NIG94','Nigeria','Nigeria',NULL),('NLD','Holanda','Países Bajos',NULL),('NLD06','Países Bajos','Países Bajos',NULL),('NLD10','Países Bajos','Países Bajos',NULL),('NLD14','Países Bajos','Países Bajos',NULL),('NLD34','Holanda','Holanda','ENTBG'),('NLD74','Países Bajos','Países Bajos',NULL),('NLD78','Países Bajos','Países Bajos',NULL),('NLD90','Países Bajos','Países Bajos',NULL),('NLD94','Países Bajos','Países Bajos',NULL),('NLD98','Países Bajos','Países Bajos',NULL),('NOR94','Noruega','Noruega',NULL),('NOR98','Noruega','Noruega',NULL),('NZ10','Nueva Zelanda','Nueva Zelanda',NULL),('NZ82','Nueva Zelanda','Nueva Zelanda',NULL),('PAN18','Panamá','Panamá',NULL),('PER','Perú','Perú',NULL),('PER18','Perú','Perú',NULL),('PER78','Perú','Perú',NULL),('PER82','Perú','Perú',NULL),('POL02','Polonia','Polonia',NULL),('POL06','Polonia','Polonia',NULL),('POL18','Polonia','Polonia',NULL),('POL74','Polonia','Polonia',NULL),('POL78','Polonia','Polonia',NULL),('POL82','Polonia','Polonia',NULL),('POL86','Polonia','Polonia',NULL),('POR02','Portugal','Portugal',NULL),('POR06','Portugal','Portugal',NULL),('POR10','Portugal','Portugal',NULL),('POR14','Portugal','Portugal',NULL),('POR18','Portugal','Portugal',NULL),('POR66','Portugal','Portugal',NULL),('POR86','Portugal','Portugal',NULL),('PRY','Paraguay','Paraguay',NULL),('PRY02','Paraguay','Paraguay',NULL),('PRY06','Paraguay','Paraguay',NULL),('PRY10','Paraguay','Paraguay',NULL),('PRY50','Paraguay','Paraguay',NULL),('PRY58','Paraguay','Paraguay',NULL),('PRY86','Paraguay','Paraguay',NULL),('PRY98','Paraguay','Paraguay',NULL),('ROU','Rumania','Rumania',NULL),('ROU34','Rumania','Rumania','ENTJR'),('ROU90','Rumania','Rumania',NULL),('ROU94','Rumania','Rumania',NULL),('ROU98','Rumania','Rumania',NULL),('RUS02','Rusia','Rusia',NULL),('RUS14','Rusia','Rusia',NULL),('RUS18','Rusia','Rusia',NULL),('RUS58','Unión Soviética','Unión Soviética',NULL),('RUS62','Unión Soviética','Unión Soviética',NULL),('RUS66','Unión Soviética','Unión Soviética',NULL),('RUS82','Unión Soviética','Unión Soviética',NULL),('RUS86','Unión Soviética','Unión Soviética',NULL),('RUS90','Unión Soviética','Unión Soviética',NULL),('RUS94','Rusia','Rusia',NULL),('SCO54','Escocia','Escocia',NULL),('SCO58','Escocia','Escocia',NULL),('SCO74','Escocia','Escocia',NULL),('SCO78','Escocia','Escocia',NULL),('SCO82','Escocia','Escocia',NULL),('SCO86','Escocia','Escocia',NULL),('SCO90','Escocia','Escocia',NULL),('SCO98','Escocia','Escocia',NULL),('SEN02','Senegal','Senegal',NULL),('SEN18','Senegal','Senegal',NULL),('SER10','Serbia','Serbia',NULL),('SER18','Serbia','Serbia',NULL),('SERM06','Serbia y Montenegro','Serbia y Montenegro',NULL),('SLO02','Eslovenia','Eslovenia',NULL),('SLO10','Eslovenia','Eslovenia',NULL),('SUD02','Sudáfrica','Sudáfrica',NULL),('SUD10','Sudáfrica','Sudáfrica',NULL),('SUD98','Sudáfrica','Sudáfrica',NULL),('SUI06','Suiza','Suiza',NULL),('SUI10','Suiza','Suiza',NULL),('SUI14','Suiza','Suiza',NULL),('SUI18','Suiza','Suiza',NULL),('SUI34','Suiza','Suiza','ENTHM'),('SUI50','Suiza','Suiza',NULL),('SUI54','Suiza','Suiza',NULL),('SUI62','Suiza','Suiza',NULL),('SUI66','Suiza','Suiza',NULL),('SUI94','Suiza','Suiza',NULL),('SVK10','Eslovaquia','Eslovaquia',NULL),('SWE','Suecia','Suecia',NULL),('SWE02','Suecia','Suecia',NULL),('SWE06','Suecia','Suecia',NULL),('SWE18','Suecia','Suecia',NULL),('SWE34','Suecia','Suecia','ENTJS'),('SWE50','Suecia','Suecia',NULL),('SWE58','Suecia','Suecia',NULL),('SWE74','Suecia','Suecia',NULL),('SWE78','Suecia','Suecia',NULL),('SWE90','Suecia','Suecia',NULL),('SWE94','Suecia','Suecia',NULL),('TOG06','Togo','Togo',NULL),('TUN02','Túnez','Túnez',NULL),('TUN06','Túnez','Túnez',NULL),('TUN18','Túnez','Túnez',NULL),('TUN78','Túnez','Túnez',NULL),('TUN98','Túnez','Túnez',NULL),('TUR02','Turquía','Turquía',NULL),('TUR54','Turquía','Turquía',NULL),('TYT06','Trinidad y Tobago','Trinidad y Tobago',NULL),('UCR06','Ucrania','Ucrania',NULL),('URU','Uruguay','Uruguay','URU1'),('URU02','Uruguay','Uruguay',NULL),('URU10','Uruguay','Uruguay','URU10'),('URU14','Uruguay','Uruguay','URU14'),('URU18','Uruguay','Uruguay','URU18'),('URU50','Uruguay','Uruguay','URU50'),('URU54','Uruguay','Uruguay','URU54'),('URU62','Uruguay','Uruguay','URU62'),('URU66','Uruguay','Uruguay','URU66'),('URU74','Uruguay','Uruguay','URU74'),('URU86','Uruguay','Uruguay','URU86'),('URU90','Uruguay','Uruguay','URU90'),('USA','Estados Unidos','Estados Unidos','USA1'),('USA02','Estados Unidos','Estados Unidos',NULL),('USA06','Estados Unidos','Estados Unidos',NULL),('USA10','Estados Unidos','Estados Unidos',NULL),('USA14','Estados Unidos','Estados Unidos',NULL),('USA34','Estados Unidos','Estados Unidos','ENTDG'),('USA50','Estados Unidos','Estados Unidos',NULL),('USA90','Estados Unidos','Estados Unidos',NULL),('USA94','Estados Unidos','Estados Unidos',NULL),('USA98','Estados Unidos','Estados Unidos',NULL),('WAL58','Gales','Gales',NULL),('YUG','Yugoslavia','Yugoslavia','YUG1'),('YUG50','Yugoslavia','Yugoslavia',NULL),('YUG54','Yugoslavia','Yugoslavia',NULL),('YUG58','Yugoslavia','Yugoslavia',NULL),('YUG62','Yugoslavia','Yugoslavia',NULL),('YUG74','Yugoslavia','Yugoslavia',NULL),('YUG82','Yugoslavia','Yugoslavia',NULL),('YUG90','Yugoslavia','Yugoslavia',NULL),('YUG98','República Federal de Yugoslavia','República Federal de Yugoslavia',NULL),('ZAI74','Zaire','Zaire',NULL);
/*!40000 ALTER TABLE `seleccion` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2024-05-19 13:27:13
