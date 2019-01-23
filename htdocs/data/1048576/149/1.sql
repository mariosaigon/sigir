-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: enafop
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `cargo` varchar(256) DEFAULT NULL,
  `funciones` varchar(1500) DEFAULT NULL,
  `institucion` varchar(100) DEFAULT NULL,
  `anoinicio` varchar(30) DEFAULT NULL,
  `anofin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `cargos_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,3,'Consultor','Diseño de programas, proigramar....','UPM','2016','2018'),(2,3,'Asesor','asesorare, charlas...','INNODEV','2009','2016'),(7,12,'Consultor','fsdfsd','SBA','2014','2012'),(8,12,'Albañil','gfdgdfhfghj','INNODEV','2004','2013'),(9,12,'Arquitecto','jghjuiiyiyui','MINSAL','2007','2005'),(10,13,'cargo 1','dsjakldjsla','INNODEV','2014','2017'),(11,18,'Cantante','cantar bien','MARN','2015-01-31','2018-01-02'),(12,18,'Consultor it','gdfgdfgdfgdfgdf','HTC','2018-01-01','2017-01-01'),(13,18,'Jefe RRHH','fgdfgdfgdfgdf','SONY','2018-05-11','2017-08-28'),(14,26,'Pelotero','anotar goles de los buenos','Real Madrid F:C','2011-05-31','2018-01-18'),(15,26,'entrenadorazo','mejor equipo del mundo','PSG','1980-10-14','2014-07-12'),(17,26,'jefe cuadrila','suplantar a los mejors','CGP','2000-07-05','2017-10-04'),(19,26,'Jefe rrhh','muchas cosas','tertert','2018-01-17','2018-01-17'),(23,26,'gdfg','gfdgdf','FC tenerife','2017-12-31','2017-12-31'),(25,35,'contabilidad','gastos e ingresos','pollo campero','2009-03-05','2009-02-04'),(26,35,'monitoreo y evaluacion','recoger datos','chemonics interntational','2010-01-01','2016-03-31'),(27,35,'ert','rgtreterte','UPM','2018-01-01','2018-01-10'),(28,35,'cualquier cosa','jjjjjj','ssssssssssssssss','2018-01-26','2018-01-26'),(29,36,'Consultor','hacer diseños y analisis de riesgos','I+D','2015-02-05','2018-01-05'),(30,36,'Profesor','dar clases a niños problemáticos','escuelita del pueblo','2017-05-18','2016-02-02'),(31,39,'guerrero','pelear por elpaís','ejérciro','2018-01-01','2018-02-10'),(32,40,'cargo1','trabajar duro','mi oficina','2010-02-05','2018-01-10'),(33,30,'carho1','trabajar','campo','2017-09-25','2018-01-18'),(34,41,'Directora Ejecutiva','coordinar ENAFOP','ENAFOP','2018-01-01','2018-01-31'),(35,41,'Taxista','carrerear','propia','2017-12-22','2017-11-01'),(36,44,'Analista/Programador','Creación de Sistemas de Facturación','Infosys','2014-01-01','2015-02-25'),(37,44,'Analista/Programador','Creación de Scotia en Línea','Scotiabank El Salvador','2018-02-04','2015-08-13'),(38,45,'Trabajo1','Funciones1','Institucion1','2010-02-02','2018-02-05');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartas`
--

DROP TABLE IF EXISTS `cartas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `idcarta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  KEY `idcarta` (`idcarta`),
  CONSTRAINT `cartas_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cartas_ibfk_2` FOREIGN KEY (`idcarta`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartas`
--

LOCK TABLES `cartas` WRITE;
/*!40000 ALTER TABLE `cartas` DISABLE KEYS */;
INSERT INTO `cartas` VALUES (1,3,181),(3,13,203),(4,18,214),(5,20,216),(10,26,245),(11,35,260),(13,36,276),(14,38,283),(15,39,285),(16,30,292),(17,44,305),(18,45,311);
/*!40000 ALTER TABLE `cartas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (18,3),(11,12),(17,13),(16,15),(15,16),(12,17),(10,18),(9,20),(13,26),(14,27),(19,28),(20,29),(27,30),(21,35),(22,36),(23,37),(24,38),(25,39),(26,40),(28,41),(29,44),(30,45);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_log`
--

DROP TABLE IF EXISTS `chat_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idchat` int(11) DEFAULT NULL,
  `idescritor` int(11) DEFAULT NULL,
  `mensaje` varchar(2900) DEFAULT NULL,
  `fecha` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idchat` (`idchat`),
  CONSTRAINT `chat_log_ibfk_1` FOREIGN KEY (`idchat`) REFERENCES `chat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_log`
--

LOCK TABLES `chat_log` WRITE;
/*!40000 ALTER TABLE `chat_log` DISABLE KEYS */;
INSERT INTO `chat_log` VALUES (6,9,1,'dasda','24-01-2018 18:40'),(7,9,1,'mensajito','24-01-2018 18:42'),(8,9,20,'hello','24-01-2018 18:47'),(9,10,1,'hay errores en su postulación','24-01-2018 18:50'),(10,9,1,'cuales son mis errores','24-01-2018 18:56'),(11,9,1,'hjhj','24-01-2018 18:56'),(12,9,1,'dlñkñlkdañ','24-01-2018 21:27'),(13,9,1,'dasdagfds','24-01-2018 21:31'),(14,9,1,'dasdagfdsff','24-01-2018 21:31'),(15,9,1,'12312','24-01-2018 21:31'),(16,9,1,'fds','24-01-2018 21:32'),(17,9,1,'dasdas1231','24-01-2018 21:38'),(18,9,20,'cual es pues','24-01-2018 21:39'),(19,9,20,'?=?¿?','24-01-2018 21:40'),(20,9,20,'me llamo david','24-01-2018 21:40'),(21,9,1,'dasdfdfsdfsdfs','24-01-2018 21:42'),(22,21,1,'le falta algo','30-01-2018 18:08'),(23,21,35,'qué cosa me falta?','30-01-2018 18:12'),(24,21,1,'muchas cosas','31-01-2018 01:45'),(25,22,1,'creo que faltan cosas','31-01-2018 02:26'),(26,22,1,'como cuales','31-01-2018 02:27'),(27,22,36,'vaya, ya corregi, puede ver los cambios q hice en el historial','31-01-2018 02:34'),(28,22,1,'bueno, a pues solicite nueva revision','31-01-2018 02:34'),(29,20,1,'hello','31-01-2018 02:56'),(30,24,1,'le faltan cosas no tío?','31-01-2018 03:04'),(31,24,38,'como cuales chaval?','31-01-2018 03:05'),(32,25,1,'heeey','31-01-2018 03:10'),(33,27,1,'como leva','31-01-2018 10:20'),(34,29,1,'Duda 1','04-02-2018 14:12'),(35,29,44,'','04-02-2018 14:16'),(36,29,44,'','04-02-2018 14:16'),(37,29,44,'Ya aclare su duda','04-02-2018 14:17'),(38,30,1,'Consulta1','05-02-2018 10:01'),(39,28,1,'consulta 2','05-02-2018 10:02'),(40,30,45,'Consulta hecha','05-02-2018 10:05'),(41,28,1,'','05-02-2018 10:04'),(42,30,45,'','05-02-2018 10:05');
/*!40000 ALTER TABLE `chat_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conocimientos_adicionales`
--

DROP TABLE IF EXISTS `conocimientos_adicionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conocimientos_adicionales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `conocimientos` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `conocimientos_adicionales_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conocimientos_adicionales`
--

LOCK TABLES `conocimientos_adicionales` WRITE;
/*!40000 ALTER TABLE `conocimientos_adicionales` DISABLE KEYS */;
/*!40000 ALTER TABLE `conocimientos_adicionales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosgenerales`
--

DROP TABLE IF EXISTS `datosgenerales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datosgenerales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `nombre` varchar(256) DEFAULT NULL,
  `correo` varchar(256) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `tipodocumento` varchar(50) DEFAULT NULL,
  `numerodocumento` varchar(50) DEFAULT NULL,
  `nit` varchar(30) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `municipio` varchar(65) DEFAULT NULL,
  `publico` tinyint(1) DEFAULT NULL,
  `genero` enum('Masculino','Femenino','Otro') DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `datosgenerales_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosgenerales`
--

LOCK TABLES `datosgenerales` WRITE;
/*!40000 ALTER TABLE `datosgenerales` DISABLE KEYS */;
INSERT INTO `datosgenerales` VALUES (1,3,'José Mario López Leiva','marioleiva2011@gmail.com','El Salvador','DUI','608572791','1213131-3131-131-','2222-6767','San Salvador','San Marcos',0,'Masculino',23),(18,12,'Mario J García','marioleiva2011@gmail.com','El Salvador','DUI','4124121-1','nuevaaagfgf','2224-4543','Chalatenango','\"Arcatao\"',1,'Femenino',28),(20,13,'Juan perez','juan@juan.com','El Salvador','DUI','432423232-2','342342342-1','2334-4567','Chalatenango','\"Chalatenango\"',1,'Femenino',99),(22,15,'JONAS','marioleiva2011@gmail.com','El Salvador','Pasaporte','452341-1','31231121-2','3232-3232','Chalatenango','La Laguna',0,'Masculino',31),(23,16,'JOSE MARIA PEREZ','marioleiva2011@gmail.com','El Salvador','DUI','31231231-1','31231231-1','2212332321','Cabañas','\"Guacotecti\"',0,'Masculino',55),(24,17,'MARITO RIVERA Y BRAVO','maria@yahoo.es','Alemania','Pasaporte','13231231-1','31231321-1','323232321','','',1,'Masculino',23),(25,18,'Tito Mira','marioleiva2011@gmail.com','El Salvador','DUI','3123121321-1','3123121-1','232312231','Cabañas','\"Jutiapa\"',1,'Otro',78),(26,20,'David Guetta','manolo@google.com','Alemania','Pasaporte','3123131-1','','+34 877987987','','',1,'Masculino',60),(27,26,'Zinedine Zidane','marioleiva2011@gmail.com','El Salvador','Pasaporte','412341311-1','3123131-1',' 33 454545787','Cuscatlán','San José Guayabal',1,'Otro',18),(28,27,'Aniceto Molina','marioleiva2011@gmail.com','El Salvador','DUI','3123131-1','4124141-1','22187878','Ahuachapán','\"Atiquizaya\"',1,'Masculino',45),(29,28,'Titi Henry','marioleiva2011@gmail.com','Antillas Neerlandesas','Pasaporte','04878255-2','6666666-1',' 34 4132411241','','',1,'Femenino',18),(30,29,'Diego Maradona','marioleiva2011@gmail.com','Afganistán','Pasaporte','4124141-1','75688765-1','225559989','','',1,'Otro',56),(31,35,'WWWWWW XXXXXXXX','slskdkdik@midominio.com','El Salvador','DUI','00703852-9','0511-010271-101-3','25237102','La Libertad','\"Antiguo',1,'Otro',18),(32,35,'WWWWWW XXXXXXXX','slskdkdik@midominio.com','El Salvador','DUI','00703852-9','0511-010271-101-3','25237102','La Libertad','',1,'Otro',18),(33,35,'SL','marioleiva2011@gmail.com','Afganistán','Carné de residencia','42341234141','1111-111111-111-1','2223454545','','',1,'Masculino',45),(34,35,'fdsafsd','marioleiva2011@gmail.com','Afganistán','Pasaporte','3132131231-1','1121-132323-123-1','31231231231','','',1,'Masculino',55),(35,35,'fdsafsd','marioleiva2011@gmail.com','Afganistán','Pasaporte','3132131231-1','1121-132323-123-1','31231231231','','',1,'Masculino',55),(36,35,'fdsafsd','marioleiva2011@gmail.com','Afganistán','Pasaporte','3132131231-1','1121-132323-123-1','31231231231','','',1,'Masculino',55),(37,35,'fsdfsdfs','marioleiva2011@gmail.com','Afganistán','DUI','1321312','1121-132323-123-1','2131313131','','',1,'Masculino',34),(38,36,'Manuel Manuelez','marioleiva2011@gmail.com','El Salvador','DUI','312313232-1','1234-212121-212-1','2223-0000','Ahuachapán','San Pedro Puxtla',1,'Masculino',87),(39,37,'Rafa Rafales','marioleiva2011@gmail.com','El Salvador','DUI','132131131-1','','22133123','Cuscatlán','\"Candelaria\"',1,'Masculino',43),(40,38,'Aniceto Porsisoca','marioleiva2011@gmail.com','Albania','Pasaporte','13213131-1','','+98 2312313-1213','','',1,'Masculino',100),(41,39,'Alvar Fañez','marioleiva2011@gmail.com','El Salvador','DUI','31312313-1','1231-131313-131-1','21313131','Cabañas','\"Ilobasco\"',0,'Otro',33),(42,40,'Jose Martinez','marioleiva2011@gmail.com','Andorra','DUI','31313131-1','','23132131','','',1,'Masculino',43),(43,30,'Nombrecito Bonito','marioleiva2011@gmail.com','El Salvador','Carné de residencia','42134234242-2','','22222323','Cabañas','\"Jutiapa\"',1,'Masculino',56),(44,41,'Aurora Cubías','acubias@presidencia.gob.sv','El Salvador','DUI','00707614-1','0614-031271-127-1','25115086','San Salvador','\"Mejicanos\"',1,'Femenino',46),(45,44,'Brenda Magally García Rivera','bgarcia@presidencia.gob.sv','El Salvador','DUI','038687307','0614-010188-137-5','22489244','San Salvador','\"Mejicanos\"',1,'Femenino',30),(46,45,'Perfil de prueba','bmllyg@gmail.com','Albania','Pasaporte','A03868730','','25115007','','',1,'Femenino',23);
/*!40000 ALTER TABLE `datosgenerales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Ahuachapán'),(2,'Cabañas'),(3,'Chalatenango'),(4,'Cuscatlán'),(5,'La Libertad'),(6,'La Paz'),(7,'La Unión'),(8,'Morazán'),(9,'San Miguel'),(10,'San Salvador'),(11,'San Vicente'),(12,'Santa Ana'),(13,'Sonsonate'),(14,'Usulután');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencia_formacion`
--

DROP TABLE IF EXISTS `experiencia_formacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiencia_formacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `taller` varchar(365) DEFAULT NULL,
  `totalhoras` int(11) DEFAULT NULL,
  `fechainicio` varchar(32) DEFAULT NULL,
  `fechafin` varchar(32) DEFAULT NULL,
  `modalidad` varchar(35) DEFAULT NULL,
  `institucion` varchar(300) DEFAULT NULL,
  `idatestado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  KEY `idatestado` (`idatestado`),
  CONSTRAINT `experiencia_formacion_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `experiencia_formacion_ibfk_2` FOREIGN KEY (`idatestado`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencia_formacion`
--

LOCK TABLES `experiencia_formacion` WRITE;
/*!40000 ALTER TABLE `experiencia_formacion` DISABLE KEYS */;
INSERT INTO `experiencia_formacion` VALUES (1,3,'TALLER A',333,'1951-05-16','1999-02-17','En línea','DPK',178),(3,16,'TALLERCITO',45,'2016-06-29','2018-01-30','Presencial','FUSADES',207),(4,18,'tallerazo',23,'2018-01-02','2018-01-24','En línea','ISSSS',212),(6,26,'taller como ser mejor pesona',456,'2018-01-02','2018-01-31','Presencial','insaforp',237),(8,3,'Taller b',56,'2018-01-01','2018-01-16','Semipresencial','innodev',251),(9,3,'Clases de refuerzo',500,'2015-01-28','2018-01-16','Semipresencial','Universidad de Chalatenango',252),(10,36,'taller de pintura',45,'2018-01-24','2018-02-09','Semipresencial','FUNDASAL',266),(11,36,'taller de pintacaritas',77,'2018-01-25','2018-02-03','Presencial','FUSAL',267),(12,36,'motivacionales',1,'2018-01-02','2018-01-03','Presencial','hotel fiesta',274),(13,37,'pequeño taller',34,'2018-01-01','2018-01-02','En línea','mi casa',277),(14,40,'taller grande',213,'2009-03-05','2018-01-17','Semipresencial','fusate',290),(15,41,'Participación ciudadana',3,'2018-01-01','2018-01-26','Presencial','bbb',300),(16,45,'Taller1sdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsd',50,'2018-01-01','2018-02-05','Semipresencial','UJMD',309);
/*!40000 ALTER TABLE `experiencia_formacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulacion` int(11) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `fecha` varchar(150) DEFAULT NULL,
  `comentario` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulacion` (`idpostulacion`),
  CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`idpostulacion`) REFERENCES `postulaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` VALUES (1,1,'rechazado','2018-01-13 22:58:06','Lo estoy rechazando porque es una prueba jiji'),(2,1,'aprobado','2018-01-13 23:36:39','Postulante fue aprobado después de estar en evaluación'),(4,4,'aprobado','2018-01-14 20:54:29','Postulante fue aprobado después de estar en evaluación'),(5,4,'aprobado','2018-01-15 07:34:24','Cambios realizados en la sección datos generales'),(6,4,'aprobado','2018-01-15 07:35:05','Cambios realizados en la sección datos generales'),(7,4,'aprobado','2018-01-15 07:36:24','Cambios realizados en la sección datos generales'),(9,6,'postulado','2018-01-15 10:31:19','Cambios realizados en la sección datos generales'),(10,6,'rechazado','2018-01-15 10:40:18','no me parece'),(13,14,'revisado','2018-01-24 15:41:02','Postulante solicitó una nueva revisión, habiendo supuestamente corregido las carencias indicadas en su postulación, después de estar en evaluación'),(14,15,'aprobado','2018-01-24 16:56:28','Postulante fue aprobado después de estar en evaluación'),(15,13,'aprobado','2018-01-24 16:57:32','Postulante fue aprobado después de estar en evaluación'),(16,12,'rechazado','2018-01-24 16:58:09','no'),(17,12,'aprobado','2018-01-24 16:59:20','Postulante fue aprobado después de estar en evaluación'),(18,16,'aprobado','2018-01-24 17:02:28','Postulante fue aprobado después de estar en evaluación'),(19,10,'aprobado','2018-01-24 17:04:36','Postulante fue aprobado después de estar en evaluación'),(20,6,'aprobado','2018-01-24 17:05:55','Postulante fue aprobado después de estar en evaluación'),(21,11,'aprobado','2018-01-24 17:07:38','Postulante fue aprobado después de estar en evaluación'),(22,14,'rechazado','2018-01-24 17:08:54','no me llegó'),(23,17,'postulado','2018-01-28 17:48:25','Cambios realizados en la sección datos generales'),(24,17,'postulado','2018-01-28 17:50:09','Cambios realizados en la sección datos generales'),(25,17,'postulado','2018-01-28 18:19:53','Cambios realizados en la sección datos generales'),(26,17,'postulado','2018-01-28 18:24:10','Cambios realizados en la sección datos generales'),(27,17,'postulado','2018-01-28 18:24:18','Cambios realizados en la sección datos generales'),(28,17,'postulado','2018-01-28 18:24:28','Cambios realizados en la sección datos generales'),(29,17,'postulado','2018-01-28 18:24:46','Cambios realizados en la sección datos generales'),(30,17,'postulado','2018-01-28 18:29:34','Cambios realizados en la sección datos generales'),(31,17,'postulado','2018-01-28 18:29:57','Cambios realizados en la sección datos generales'),(32,17,'postulado','2018-01-28 18:30:38','Cambios realizados en la sección datos generales'),(33,17,'postulado','2018-01-28 18:31:03','Cambios realizados en la sección datos generales'),(34,17,'postulado','2018-01-28 18:32:58','Cambios realizados en la sección datos generales'),(35,17,'postulado','2018-01-28 18:35:15','Cambios realizados en la sección datos generales'),(36,17,'postulado','2018-01-28 19:43:44','Cambios realizados en la sección datos generales'),(37,17,'postulado','2018-01-28 19:44:21','Cambios realizados en la sección datos generales'),(38,17,'postulado','2018-01-28 19:44:47','Cambios realizados en la sección datos generales'),(39,17,'postulado','2018-01-28 19:45:31','Cambios realizados en la sección datos generales'),(40,17,'postulado','2018-01-28 19:46:27','Cambios realizados en la sección datos generales'),(41,17,'postulado','2018-01-28 19:48:34','Cambios realizados en la sección datos generales'),(42,17,'postulado','2018-01-28 19:50:14','Cambios realizados en la sección datos generales'),(43,17,'postulado','2018-01-28 19:50:37','Cambios realizados en la sección datos generales'),(44,17,'postulado','2018-01-28 19:59:06','Cambios realizados en la sección datos generales'),(45,17,'postulado','2018-01-28 20:00:42','Cambios realizados en la sección datos generales'),(46,17,'postulado','2018-01-28 20:10:30','Cambios realizados en la sección datos generales'),(47,17,'postulado','2018-01-28 20:12:11','Cambios realizados en la sección datos generales'),(48,17,'postulado','2018-01-28 20:14:30','Cambios realizados en la sección datos generales'),(49,17,'postulado','2018-01-28 20:25:15','Cambios realizados en la sección datos generales'),(50,17,'postulado','2018-01-28 20:25:56','Cambios realizados en la sección datos generales'),(51,17,'postulado','2018-01-28 20:26:32','Cambios realizados en la sección datos generales'),(52,17,'postulado','2018-01-28 20:26:40','Cambios realizados en la sección datos generales'),(53,17,'postulado','2018-01-28 20:26:52','Cambios realizados en la sección datos generales'),(54,17,'postulado','2018-01-28 20:28:03','Cambios realizados en la sección datos generales'),(55,17,'postulado','2018-01-28 20:28:49','Cambios realizados en la sección datos generales'),(56,17,'postulado','2018-01-28 20:33:00','Cambios realizados en la sección datos generales'),(57,17,'postulado','2018-01-28 20:34:16','Cambios realizados en la sección datos generales'),(58,17,'postulado','2018-01-28 20:34:30','Cambios realizados en la sección datos generales'),(59,17,'postulado','2018-01-28 20:35:00','Cambios realizados en la sección datos generales'),(60,17,'postulado','2018-01-28 20:35:16','Cambios realizados en la sección datos generales'),(61,17,'postulado','2018-01-28 20:36:12','Cambios realizados en la sección datos generales'),(62,17,'postulado','2018-01-28 20:53:11','Cambios realizados en la sección datos generales'),(63,17,'postulado','2018-01-28 20:53:37','Cambios realizados en la sección datos generales'),(64,17,'postulado','2018-01-28 20:53:51','Cambios realizados en la sección datos generales'),(65,17,'postulado','2018-01-28 20:54:03','Cambios realizados en la sección datos generales'),(66,17,'postulado','2018-01-28 20:54:20','Cambios realizados en la sección datos generales'),(67,17,'postulado','2018-01-28 20:54:37','Cambios realizados en la sección datos generales'),(68,17,'postulado','2018-01-28 20:54:56','Cambios realizados en la sección datos generales'),(69,17,'postulado','2018-01-28 20:56:05','Cambios realizados en la sección datos generales'),(70,17,'postulado','2018-01-28 20:57:07','Cambios realizados en la sección datos generales'),(71,17,'postulado','2018-01-28 20:57:15','Cambios realizados en la sección datos generales'),(72,15,'aprobado','2018-01-29 15:01:27','Cambios realizados en la sección de formación académica'),(73,15,'aprobado','2018-01-29 15:02:03','Cambios realizados en la sección de formación académica'),(74,15,'aprobado','2018-01-29 15:07:53','Cambios realizados en la sección de formación académica (estudios de posgrado se añadió )'),(75,15,'aprobado','2018-01-29 15:08:33','Cambios realizados en la sección de formación académica (estudios de posgrado se añadió )'),(76,15,'aprobado','2018-01-29 15:12:08','Cambios realizados en la sección de formación académica (otros estudios se editó )'),(77,15,'aprobado','2018-01-29 15:16:43','Cambios realizados en la sección de formación académica (estudios de posgrado se editó super lioc)'),(78,15,'aprobado','2018-01-29 15:18:58','Cambios realizados en la sección de formación académica (estudios de grado se editó Lic en nutrición)'),(79,15,'aprobado','2018-01-29 15:19:21','Cambios realizados en la sección de formación académica (estudios de grado se editó 2001)'),(80,15,'aprobado','2018-01-29 15:22:17','Cambios realizados en la sección de formación académica (estudios de posgrado se editó super lic)'),(81,15,'aprobado','2018-01-29 15:27:21','Cambios realizados en la sección de formación académica (otros estudios se editó Peluquero2)'),(82,15,'aprobado','2018-01-29 15:30:33','Cambios realizados en la sección de formación académica (otros estudios se editó Peluquero23)'),(83,15,'aprobado','2018-01-29 15:30:40','Cambios realizados en la sección de formación académica (estudios de posgrado se editó doctor en letras2)'),(84,15,'aprobado','2018-01-29 15:30:53','Cambios realizados en la sección de formación académica (estudios de grado se editó Nombreeee)'),(85,15,'aprobado','2018-01-29 15:30:59','Cambios realizados en la sección de formación académica (otros estudios se editó Otrora)'),(86,15,'aprobado','2018-01-29 15:31:11','Cambios realizados en la sección de formación académica (estudios de posgrado se editó Doctoradote)'),(87,15,'aprobado','2018-01-29 15:31:16','Cambios realizados en la sección de formación académica (estudios de grado se editó Licenciadote)'),(88,15,'aprobado','2018-01-29 15:31:30','Cambios realizados en la sección de formación académica (estudios de grado se editó 2009)'),(89,15,'aprobado','2018-01-29 15:31:40','Cambios realizados en la sección de formación académica (otros estudios se editó 2004)'),(90,15,'aprobado','2018-01-29 15:33:36','Cambios realizados en la sección de formación académica (otros estudios se editó valvidieso salon58)'),(91,15,'aprobado','2018-01-29 15:33:47','Cambios realizados en la sección de experiencia laboral'),(92,15,'aprobado','2018-01-29 15:36:25','Cambios realizados en la sección de formación académica (estudios de grado se editó Universidad de la Frontera)'),(93,15,'aprobado','2018-01-29 15:38:59','Cambios realizados en la sección de experiencia laboral'),(94,15,'aprobado','2018-01-29 16:01:32','Cambios realizados en la sección de experiencia laboral'),(95,15,'aprobado','2018-01-29 17:23:31','Cambios realizados en la sección de formación académica (otros estudios se editó valvidieso salon)'),(96,15,'aprobado','2018-01-29 18:02:06','Se eliminó una entrada de la sección estudios de cargo'),(97,15,'aprobado','2018-01-29 18:02:07','Se eliminó una entrada de la sección experiencia laborals'),(98,15,'aprobado','2018-01-29 18:03:31','Se eliminó una entrada de la sección estudios de cargo'),(99,15,'aprobado','2018-01-29 18:03:31','Se eliminó una entrada de la sección experiencia laboralal'),(100,15,'aprobado','2018-01-29 18:04:27','Se eliminó una entrada de la sección experiencia laboralal'),(101,15,'aprobado','2018-01-29 18:04:51','Se eliminó una entrada de la sección estudios de grado'),(102,15,'aprobado','2018-01-29 18:05:21','Cambios realizados en la sección de experiencia laboral'),(103,15,'aprobado','2018-01-29 18:05:43','Se eliminó una entrada de la sección experiencia laboral'),(104,15,'aprobado','2018-01-29 18:07:53','Se eliminó una entrada de la sección experiencia laboral'),(105,15,'aprobado','2018-01-30 01:35:27','Cambios realizados en la sección de formación académica (otros estudios se editó Otro)'),(106,15,'aprobado','2018-01-30 01:40:01','Cambios realizados en la sección de formación académica (estudios de grado se editó 2)'),(107,15,'aprobado','2018-01-30 01:41:06','Cambios realizados en la sección de formación académica (estudios de grado se editó Bachiller)'),(108,15,'aprobado','2018-01-30 01:42:43','Cambios realizados en la sección de formación académica (estudios de posgrado se editó Doctorado)'),(109,15,'aprobado','2018-01-30 01:43:03','Cambios realizados en la sección de formación académica (estudios de posgrado se editó Máster)'),(110,15,'aprobado','2018-01-30 01:43:11','Cambios realizados en la sección de formación académica (estudios de posgrado se editó Otro)'),(111,15,'aprobado','2018-01-30 01:43:17','Cambios realizados en la sección de formación académica (estudios de posgrado se editó Máster)'),(112,15,'aprobado','2018-01-30 01:43:28','Cambios realizados en la sección de formación académica (estudios de grado se editó Ingeniero)'),(113,15,'aprobado','2018-01-30 01:48:33','Cambios realizados en la sección de formación académica (otros estudios se editó 2009)'),(114,15,'aprobado','2018-01-30 01:49:15','Cambios realizados en la sección de formación académica (estudios de grado se editó 2008)'),(115,15,'aprobado','2018-01-30 01:49:19','Cambios realizados en la sección de formación académica (estudios de grado se editó 2005)'),(116,15,'aprobado','2018-01-30 01:49:26','Cambios realizados en la sección de formación académica (estudios de posgrado se editó 2016)'),(117,15,'aprobado','2018-01-30 02:03:37','Cambios realizados en la sección de práctica de docencia, modificado Aguila fc'),(118,15,'aprobado','2018-01-30 02:04:20','Cambios realizados en la sección de práctica de docencia, modificado materia a Clases de fútbolazo'),(119,15,'aprobado','2018-01-30 02:04:35','Cambios realizados en la sección de práctica de docencia, modificado modalidad a Presencial'),(120,15,'aprobado','2018-01-30 02:05:02','Se eliminó una entrada en la sección práctica de la docencia - materias impartidas'),(121,15,'aprobado','2018-01-30 02:38:46','Cambios realizados en la sección de práctica de docencia, modificado institucion a externado san jose'),(122,15,'aprobado','2018-01-30 02:39:06','Cambios realizados en la sección de práctica de docencia, modificado modalidad a Presencial'),(123,15,'aprobado','2018-01-30 02:55:32','Se eliminó una entrada en la sección experiencia en formación y capacitación'),(124,15,'aprobado','2018-01-30 03:12:38','Añadido una nueva(s) experiencia(s) en formación y capacitación'),(125,15,'aprobado','2018-01-30 03:15:18','Añadido una nueva(s) experiencia(s) en experiencia en impartición de docencia'),(126,15,'aprobado','2018-01-30 03:15:54','Cambios realizados en la sección de práctica de docencia, modificado institucion a liceo salvadoreño2'),(127,15,'aprobado','2018-01-30 03:22:03','Cambios realizados en la sección de experiencia en formación  y capacitación, modificado totalhoras a 36'),(128,15,'aprobado','2018-01-30 03:22:15','Cambios realizados en la sección de experiencia en formación  y capacitación, modificado modalidad a En línea'),(129,15,'aprobado','2018-01-30 03:27:58','Se eliminó una entrada en la sección experiencia en formación y capacitación'),(130,15,'aprobado','2018-01-30 04:17:03','Añadido un nuevo documento adjunto (motivaciones o referencias personales)'),(131,15,'aprobado','2018-01-30 04:24:04','Añadido un nuevo documento adjunto (motivaciones o referencias personales)'),(132,15,'aprobado','2018-01-30 04:26:32','Añadido un nuevo documento adjunto (motivaciones o referencias personales)'),(133,15,'aprobado','2018-01-30 04:26:53','Añadido un nuevo documento adjunto (motivaciones o referencias personales)'),(134,15,'aprobado','2018-01-30 04:44:46','Se eliminó especialización en tema de la administración pública temas_enfoque'),(135,15,'aprobado','2018-01-30 05:01:03','Se eliminó especialización en tema de la administración pública temas_etica'),(136,15,'aprobado','2018-01-30 05:09:20','Añadido(s) un nuevo(s) tema(s) de la administración pública que maneja'),(137,15,'aprobado','2018-01-30 05:13:16','Añadido(s) un nuevo(s) tema(s) de la administración pública que maneja'),(138,15,'aprobado','2018-01-30 05:13:27','Añadido(s) un nuevo(s) tema(s) de la administración pública que maneja'),(139,15,'aprobado','2018-01-30 05:13:58','Añadido(s) un nuevo(s) tema(s) de la administración pública que maneja'),(140,15,'aprobado','2018-01-30 09:59:19','Añadida(s) una nuevo(s) metodologías(s) que maneja'),(141,15,'aprobado','2018-01-30 10:03:33','Se eliminó experiencia de la metodología metodologias_disenocartas'),(142,15,'aprobado','2018-01-30 10:12:17','Cambios realizados en la sección de formación académica (estudios de grado se editó ingeniero electricista)'),(143,15,'aprobado','2018-01-30 10:17:36','Cambios realizados en la sección de otros datos'),(144,15,'aprobado','2018-01-30 10:18:35','Cambios realizados en la sección de otros datos'),(145,15,'aprobado','2018-01-30 10:19:50','Cambios realizados en la sección de otros datos'),(146,15,'aprobado','2018-01-30 10:31:01','Cambios realizados en la sección datos generales'),(147,15,'aprobado','2018-01-30 10:31:13','Cambios realizados en la sección datos generales'),(148,15,'aprobado','2018-01-30 10:33:31','Cambios realizados en la sección de experiencia laboral'),(149,15,'aprobado','2018-01-30 10:33:41','Cambios realizados en la sección de experiencia en formación  y capacitación, modificado totalhoras a 456'),(150,15,'aprobado','2018-01-30 10:51:29','Cambios realizados en la sección de otros datos'),(151,15,'aprobado','2018-01-30 10:51:42','Cambios realizados en la sección de otros datos'),(152,15,'aprobado','2018-01-30 10:51:50','Cambios realizados en la sección de otros datos'),(153,15,'aprobado','2018-01-30 12:06:55','Cambió escala del idioma en categoría hablado a 4'),(154,15,'aprobado','2018-01-30 12:06:55','Cambió escala del idioma en categoría hablado a 0'),(155,15,'aprobado','2018-01-30 12:07:11','Cambió escala del idioma en categoría hablado a 4'),(156,15,'aprobado','2018-01-30 12:07:30','Cambió escala del idioma en categoría hablado a 3'),(157,15,'aprobado','2018-01-30 12:10:51','Cambió escala del idioma en categoría hablado a 1'),(158,15,'aprobado','2018-01-30 12:11:35','Cambió escala del idioma en categoría hablado a 4'),(159,15,'aprobado','2018-01-30 12:11:38','Cambió escala del idioma en categoría escuchado a 3'),(160,15,'aprobado','2018-01-30 13:32:45','Añadido un nuevo(s) idioma(s) en la sección idiomas dominados'),(161,15,'aprobado','2018-01-30 13:33:03','Cambió escala del idioma en categoría escuchado a 0'),(162,15,'aprobado','2018-01-30 13:33:05','Cambió escala del idioma en categoría escuchado a 5'),(163,15,'aprobado','2018-01-30 13:33:08','Cambió escala del idioma en categoría escuchado a 5'),(164,15,'aprobado','2018-01-30 13:33:13','Cambió escala del idioma en categoría hablado a 0'),(165,15,'aprobado','2018-01-30 13:33:16','Cambió escala del idioma en categoría hablado a 3'),(166,15,'aprobado','2018-01-30 13:33:46','Cambios realizados en la sección datos generales'),(167,1,'aprobado','2018-01-30 13:36:29','Cambios realizados en la sección datos generales'),(168,1,'aprobado','2018-01-30 13:39:04','Añadido una nueva(s) experiencia(s) en formación y capacitación'),(169,1,'aprobado','2018-01-30 13:47:48','Añadido un nuevo(s) idioma(s) en la sección idiomas dominados'),(170,13,'aprobado','2018-01-30 13:52:01','Cambios realizados en la sección de experiencia laboral'),(171,1,'aprobado','2018-01-30 14:29:04','Añadido una nueva(s) experiencia(s) en formación y capacitación'),(172,17,'aprobado','2018-01-30 14:52:20','Postulante fue aprobado después de estar en evaluación'),(173,19,'postulado','2018-01-30 18:07:18','Se eliminó una entrada de la sección experiencia laboral'),(174,19,'postulado','2018-01-31 01:47:06','Añadido un nuevo(s) idioma(s) en la sección idiomas dominados'),(175,19,'revisado','2018-01-31 01:47:27','Postulante solicitó una nueva revisión, habiendo supuestamente corregido las carencias indicadas en su postulación, después de estar en evaluación'),(176,19,'aprobado','2018-01-31 01:47:59','Postulante fue aprobado después de estar en evaluación'),(177,20,'postulado','2018-01-31 02:19:33','Cambios realizados en la sección datos generales'),(178,20,'postulado','2018-01-31 02:19:52','Cambios realizados en la sección de experiencia laboral'),(179,20,'postulado','2018-01-31 02:24:46','Cambió escala del idioma en categoría hablado a 5'),(180,20,'postulado','2018-01-31 02:25:54','Cambios realizados en la sección de formación académica (otros estudios se editó tecnico en neveras y refris)'),(181,20,'postulado','2018-01-31 02:26:09','Cambios realizados en la sección datos generales'),(182,20,'postulado','2018-01-31 02:28:43','Se eliminó especialización en tema de la administración pública temas_planificacion'),(183,20,'postulado','2018-01-31 02:29:01','Añadido(s) un nuevo(s) tema(s) de la administración pública que maneja'),(184,20,'postulado','2018-01-31 02:32:03','Añadido una nueva(s) experiencia(s) en experiencia en impartición de docencia'),(185,20,'postulado','2018-01-31 02:32:09','Cambios realizados en la sección de práctica de docencia, modificado materia a OPV avanzado'),(186,20,'postulado','2018-01-31 02:32:23','Cambios realizados en la sección de experiencia en formación  y capacitación, modificado totalhoras a 77'),(187,20,'postulado','2018-01-31 02:32:56','Añadido una nueva(s) experiencia(s) en formación y capacitación'),(188,20,'postulado','2018-01-31 02:33:02','Se eliminó experiencia de la metodología metodologias_disenocartas'),(189,20,'postulado','2018-01-31 02:33:27','Añadida(s) una nuevo(s) metodologías(s) que maneja'),(190,20,'postulado','2018-01-31 02:33:34','Cambios realizados en la sección de otros datos'),(191,20,'postulado','2018-01-31 02:33:38','Cambió escala del idioma en categoría hablado a 3'),(192,20,'revisado','2018-01-31 02:35:23','Postulante solicitó una nueva revisión, habiendo supuestamente corregido las carencias indicadas en su postulación, después de estar en evaluación'),(193,20,'aprobado','2018-01-31 02:36:02','Postulante fue aprobado después de estar en evaluación'),(194,21,'rechazado','2018-01-31 02:55:08','su postulación está bien pobre, ni me molesto en pedir que la corrija'),(195,21,'rechazado','2018-01-31 02:55:52','Añadida(s) una nuevo(s) metodologías(s) que maneja'),(196,20,'aprobado','2018-01-31 02:58:20','Cambios realizados en la sección de práctica de docencia, modificado institucion a externado san martin3'),(197,20,'aprobado','2018-01-31 02:58:24','Cambios realizados en la sección de práctica de docencia, modificado modalidad a En línea'),(198,18,'rechazado','2018-01-31 03:00:09','nop'),(199,22,'postulado','2018-01-31 03:04:25','Cambió escala del idioma en categoría escrito a 4'),(200,22,'revisado','2018-01-31 03:05:50','Postulante solicitó una nueva revisión, habiendo supuestamente corregido las carencias indicadas en su postulación, después de estar en evaluación'),(201,24,'postulado','2018-01-31 03:44:42','Añadido una nueva(s) experiencia(s) en formación y capacitación'),(202,25,'rechazado','2018-01-31 10:20:22','no me gusto'),(203,25,'rechazado','2018-01-31 10:22:58','Añadido una nueva(s) experiencia(s) en experiencia en impartición de docencia'),(204,17,'aprobado','2018-01-31 10:25:41','Añadido(s) un nuevo(s) tema(s) de la administración pública que maneja'),(205,23,'postulado','2018-01-31 10:36:53','Añadida(s) una nuevo(s) metodologías(s) que maneja'),(206,1,'aprobado','2018-01-31 10:55:46','Añadido(s) un nuevo(s) tema(s) de la administración pública que maneja'),(207,23,'postulado','2018-01-31 11:00:49','Añadido una nueva(s) experiencia(s) en experiencia en impartición de docencia'),(208,10,'aprobado','2018-01-31 11:02:58','Añadido(s) un nuevo(s) tema(s) de la administración pública que maneja'),(209,10,'aprobado','2018-01-31 11:09:15','Cambios realizados en la sección datos generales'),(210,26,'postulado','2018-02-02 16:52:16','Se eliminó especialización en tema de la administración pública temas_abierto'),(211,27,'aprobado','2018-02-04 14:30:18','Postulante fue aprobado después de estar en evaluación'),(212,26,'postulado','2018-02-05 09:34:42','Se eliminó especialización en tema de la administración pública temas_etica'),(213,26,'postulado','2018-02-05 09:34:44','Se eliminó especialización en tema de la administración pública temas_etica'),(214,26,'postulado','2018-02-05 09:34:45','Se eliminó especialización en tema de la administración pública temas_gobierno'),(215,26,'postulado','2018-02-05 09:34:46','Se eliminó especialización en tema de la administración pública temas_planificacion'),(216,26,'rechazado','2018-02-05 10:03:31','no puede'),(217,28,'rechazado','2018-02-05 10:11:34','Este es el motivo del rechazo'),(218,21,'rechazado','2018-02-09 15:24:25','Añadido un nuevo(s) idioma(s) en la sección idiomas dominados'),(219,21,'rechazado','2018-02-09 15:24:30','Cambió escala del idioma en categoría hablado a 3');
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idiomas`
--

DROP TABLE IF EXISTS `idiomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idiomas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `idioma` varchar(256) DEFAULT NULL,
  `hablado` int(11) DEFAULT NULL,
  `escuchado` int(11) DEFAULT NULL,
  `escrito` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `idiomas_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idiomas`
--

LOCK TABLES `idiomas` WRITE;
/*!40000 ALTER TABLE `idiomas` DISABLE KEYS */;
INSERT INTO `idiomas` VALUES (1,20,'Frances',2,1,0),(2,20,'italiano',2,3,1),(3,20,'inglés',3,5,1),(4,26,'Francés',4,3,5),(5,26,'Español',3,4,3),(6,26,'Inglés',1,4,4),(7,27,'flamenco',0,4,0),(8,29,'Inglés',4,0,3),(9,26,'flamenco',0,5,0),(10,26,'nahuatl',3,0,0),(11,3,'Inglés',5,5,4),(12,3,'Francés',3,3,3),(13,3,'Español',5,5,5),(14,35,'español',3,1,3),(15,36,'hindi',5,4,5),(16,36,'mandarin',3,3,1),(17,38,'islandés',2,2,4),(18,39,'spanish',2,3,2),(19,40,'spanglish',2,2,5),(20,30,'ruso',2,2,3),(21,44,'Inglés',4,4,4),(22,44,'Italiano',2,2,2),(23,45,'Ingles',3,2,1),(24,37,'english',3,3,4);
/*!40000 ALTER TABLE `idiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias_docencia`
--

DROP TABLE IF EXISTS `materias_docencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materias_docencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `materia` varchar(256) DEFAULT NULL,
  `institucion` varchar(500) DEFAULT NULL,
  `anoinicio` varchar(32) DEFAULT NULL,
  `anofin` varchar(32) DEFAULT NULL,
  `modalidad` varchar(30) DEFAULT NULL,
  `idatestado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  KEY `idatestado` (`idatestado`),
  CONSTRAINT `materias_docencia_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materias_docencia_ibfk_2` FOREIGN KEY (`idatestado`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias_docencia`
--

LOCK TABLES `materias_docencia` WRITE;
/*!40000 ALTER TABLE `materias_docencia` DISABLE KEYS */;
INSERT INTO `materias_docencia` VALUES (1,3,'CIENCIAS','institucion_impartida','2015','2016','Semipresencial',176),(2,3,'MATE','institucion_impartida','2002','2006','Presencial',177),(3,12,'DFWEQWQ','WQEWRWE','2017','2017','Presencial',196),(4,13,'ESTUDIOS SOCIALES','CE ESCOLAR EL GUAYMANGO','2012','2017','Presencial',201),(5,18,'LENGUAJE','Concha Viuda','2017-09-25','2018-01-11','Presencial',210),(6,18,'opv','República de Brasil C.E','2015-02-06','2017-06-26','Semipresencial',211),(8,28,'Fisica cuántica','DON Bosco','2013-01-01','2018-01-15','Semipresencial',222),(9,26,'ciencias y medio ambiente','externado san jose','2018-01-08','2018-01-26','Presencial',236),(10,26,'logica matemática','liceo salvadoreño2','2016-02-04','2018-01-04','En línea',239),(11,36,'OPV avanzado','Mártires de Almoloya','2015-12-31','2018-01-19','Presencial',265),(12,36,'ciencias','externado san martin3','2018-01-02','2018-01-18','En línea',273),(13,38,'comedia','mi parque','2018-01-07','2018-01-20','Semipresencial',281),(14,40,'clases de refuerzo de mate','mis cheros','2018-01-01','2018-01-24','Presencial',287),(15,30,'materia nueva','universidad','2018-01-02','2018-02-10','Presencial',293),(16,39,'a','das','2018-01-02','2018-01-18','Semipresencial',295),(17,41,'no','no','2018-01-01','2018-01-31','Presencial',299),(18,45,'Materia1','UCA','2010-02-01','2018-02-05','Presencial',308);
/*!40000 ALTER TABLE `materias_docencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodologias_disenocartas`
--

DROP TABLE IF EXISTS `metodologias_disenocartas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodologias_disenocartas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `experiencia` varchar(3000) DEFAULT NULL,
  `idatestado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  KEY `idatestado` (`idatestado`),
  CONSTRAINT `metodologias_disenocartas_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `metodologias_disenocartas_ibfk_2` FOREIGN KEY (`idatestado`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodologias_disenocartas`
--

LOCK TABLES `metodologias_disenocartas` WRITE;
/*!40000 ALTER TABLE `metodologias_disenocartas` DISABLE KEYS */;
INSERT INTO `metodologias_disenocartas` VALUES (1,3,'CARTA DIDACTIA ETICA PUBLICA',179),(2,3,'CARTA DIDÁCTICA CURSO TRANSPARENCIA IAIP',180),(3,13,'MANEJO DE CARTAS DIDACTIAS',202),(5,26,'carta didáctica enafop online',250),(6,36,'carta curso online iaip',268);
/*!40000 ALTER TABLE `metodologias_disenocartas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodologias_elaboracion`
--

DROP TABLE IF EXISTS `metodologias_elaboracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodologias_elaboracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `experiencia` varchar(3000) DEFAULT NULL,
  `idatestado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  KEY `idatestado` (`idatestado`),
  CONSTRAINT `metodologias_elaboracion_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `metodologias_elaboracion_ibfk_2` FOREIGN KEY (`idatestado`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodologias_elaboracion`
--

LOCK TABLES `metodologias_elaboracion` WRITE;
/*!40000 ALTER TABLE `metodologias_elaboracion` DISABLE KEYS */;
INSERT INTO `metodologias_elaboracion` VALUES (1,12,'GDFHG',197),(2,12,'EWRE',198),(3,12,'UTYUT',199),(4,37,'ya aprendi :)',278);
/*!40000 ALTER TABLE `metodologias_elaboracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodologias_evaluacion`
--

DROP TABLE IF EXISTS `metodologias_evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodologias_evaluacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `experiencia` varchar(3000) DEFAULT NULL,
  `idatestado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  KEY `idatestado` (`idatestado`),
  CONSTRAINT `metodologias_evaluacion_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `metodologias_evaluacion_ibfk_2` FOREIGN KEY (`idatestado`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodologias_evaluacion`
--

LOCK TABLES `metodologias_evaluacion` WRITE;
/*!40000 ALTER TABLE `metodologias_evaluacion` DISABLE KEYS */;
INSERT INTO `metodologias_evaluacion` VALUES (1,40,'evaluar bien',288);
/*!40000 ALTER TABLE `metodologias_evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodologias_facilitacion`
--

DROP TABLE IF EXISTS `metodologias_facilitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodologias_facilitacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `experiencia` varchar(3000) DEFAULT NULL,
  `idatestado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  KEY `idatestado` (`idatestado`),
  CONSTRAINT `metodologias_facilitacion_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `metodologias_facilitacion_ibfk_2` FOREIGN KEY (`idatestado`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodologias_facilitacion`
--

LOCK TABLES `metodologias_facilitacion` WRITE;
/*!40000 ALTER TABLE `metodologias_facilitacion` DISABLE KEYS */;
INSERT INTO `metodologias_facilitacion` VALUES (1,18,'he facilitado varios talleres',213),(2,26,'Taller de como ser buen entrenador',220),(3,38,'taller de comedia',282);
/*!40000 ALTER TABLE `metodologias_facilitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodologias_linea`
--

DROP TABLE IF EXISTS `metodologias_linea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodologias_linea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `experiencia` varchar(3000) DEFAULT NULL,
  `idatestado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  KEY `idatestado` (`idatestado`),
  CONSTRAINT `metodologias_linea_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `metodologias_linea_ibfk_2` FOREIGN KEY (`idatestado`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodologias_linea`
--

LOCK TABLES `metodologias_linea` WRITE;
/*!40000 ALTER TABLE `metodologias_linea` DISABLE KEYS */;
/*!40000 ALTER TABLE `metodologias_linea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodologias_participativa`
--

DROP TABLE IF EXISTS `metodologias_participativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodologias_participativa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `experiencia` varchar(3000) DEFAULT NULL,
  `idatestado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  KEY `idatestado` (`idatestado`),
  CONSTRAINT `metodologias_participativa_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `metodologias_participativa_ibfk_2` FOREIGN KEY (`idatestado`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodologias_participativa`
--

LOCK TABLES `metodologias_participativa` WRITE;
/*!40000 ALTER TABLE `metodologias_participativa` DISABLE KEYS */;
INSERT INTO `metodologias_participativa` VALUES (1,36,'holis',275);
/*!40000 ALTER TABLE `metodologias_participativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodologias_programas`
--

DROP TABLE IF EXISTS `metodologias_programas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodologias_programas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `experiencia` varchar(3000) DEFAULT NULL,
  `idatestado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  KEY `idatestado` (`idatestado`),
  CONSTRAINT `metodologias_programas_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `metodologias_programas_ibfk_2` FOREIGN KEY (`idatestado`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodologias_programas`
--

LOCK TABLES `metodologias_programas` WRITE;
/*!40000 ALTER TABLE `metodologias_programas` DISABLE KEYS */;
INSERT INTO `metodologias_programas` VALUES (1,39,'proyecto 1',294),(2,44,'Texto de prueba de programas de formacion y capacitacion',304),(3,45,'asdas',310);
/*!40000 ALTER TABLE `metodologias_programas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipios` (
  `id` int(11) NOT NULL,
  `idepartamento` int(11) DEFAULT NULL,
  `municipio` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idepartamento` (`idepartamento`),
  CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`idepartamento`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES (1,1,'Ahuachapán'),(2,1,'Jujutla'),(3,1,'Atiquizaya'),(4,1,'Concepción de Ataco'),(5,1,'El Refugio'),(6,1,'Guaymango'),(7,1,'Apaneca'),(8,1,'San Francisco Menéndez'),(9,1,'San Lorenzo'),(10,1,'San Pedro Puxtla'),(11,1,'Tacuba'),(12,1,'Turín'),(13,2,'Cinquera'),(14,2,'Villa Dolores'),(15,2,'Guacotecti'),(16,2,'Ilobasco'),(17,2,'Jutiapa'),(18,2,'San Isidro'),(19,2,'Sensuntepeque'),(20,2,'Ciudad de Tejutepeque'),(21,2,'Victoria'),(22,3,'Agua Caliente'),(23,3,'Arcatao'),(24,3,'Azacualpa'),(25,3,'Chalatenango'),(26,3,'Citalá'),(27,3,'Comalapa'),(28,3,'Concepción Quezaltepeque'),(29,3,'Dulce Nombre de María'),(30,3,'El Carrizal'),(31,3,'El Paraíso'),(32,3,'La Laguna'),(33,3,'La Palma'),(34,3,'La Reina'),(35,3,'Las Vueltas'),(36,3,'Nombre de Jesús'),(37,3,'Nueva Concepción'),(38,3,'Nueva Trinidad'),(39,3,'Ojos de Agua'),(40,3,'Potonico'),(41,3,'San Antonio de la Cruz'),(42,3,'San Antonio Los Ranchos'),(43,3,'San Fernando'),(44,3,'San Francisco Lempa'),(45,3,'San Francisco Morazán'),(46,3,'San Ignacio'),(47,3,'San Isidro Labrador'),(48,3,'San José Cancasque'),(49,3,'San José Las Flores'),(50,3,'San Luis del Carmen'),(51,3,'San Miguel de Mercedes'),(52,3,'San Rafael'),(53,3,'Santa Rita'),(54,3,'Tejutla'),(55,4,'Candelaria'),(56,4,'Cojutepeque'),(57,4,'El Carmen'),(58,4,'El Rosario'),(59,4,'Monte San Juan'),(60,4,'Oratorio de Concepción'),(61,4,'San Bartolomé Perulapía'),(62,4,'San Cristóbal'),(63,4,'San José Guayabal'),(64,4,'San Pedro Perulapán'),(65,4,'San Rafael Cedros'),(66,4,'San Ramón'),(67,4,'Santa Cruz Analquito'),(68,4,'Santa Cruz Michapa'),(69,4,'Suchitoto'),(70,4,'Tenancingo'),(71,5,'Antiguo Cuscatlán'),(72,5,'Chiltiupán'),(73,5,'Ciudad Arce'),(74,5,'Colón'),(75,5,'Comasagua'),(76,5,'Huizúcar'),(77,5,'Jayaque'),(78,5,'Jicalapa'),(79,5,'La Libertad'),(80,5,'Nueva San Salvador'),(81,5,'Nuevo Cuscatlán'),(82,5,'Opico'),(83,5,'Quezaltepeque'),(84,5,'Sacacoyo'),(85,5,'San José Villanueva'),(86,5,'San Matías'),(87,5,'San Pablo Tacachico'),(88,5,'Talnique'),(89,5,'Tamanique'),(90,5,'Teotepeque'),(91,5,'Tepecoyo'),(92,5,'Zaragoza'),(93,6,'Cuyultitán'),(94,6,'El Rosario'),(95,6,'Jerusalén'),(96,6,'Mercedes La Ceiba'),(97,6,'Olocuilta'),(98,6,'Paraíso de Osorio'),(99,6,'San Antonio Masahuat'),(100,6,'San Emigdio'),(101,6,'San Francisco Chinameca'),(102,6,'San Juan Nonualco'),(103,6,'San Juan Talpa'),(104,6,'San Juan Tepezontes'),(105,6,'San Luis La Herradura'),(106,6,'San Luis Talpa'),(107,6,'San Miguel Tepezontes'),(108,6,'San Pedro Masahuat'),(109,6,'San Pedro Nonualco'),(110,6,'San Rafael Obrajuelo'),(111,6,'Santa María Ostuma'),(112,6,'Santiago Nonualco'),(113,6,'Tapalhuaca'),(114,6,'Zacatecoluca'),(115,7,'Anamorós'),(116,7,'Bolívar'),(117,7,'Concepción de Oriente'),(118,7,'Conchagua'),(119,7,'El Carmen'),(120,7,'El Sauce'),(121,7,'Intipucá'),(122,7,'La Unión'),(123,7,'Lislique'),(124,7,'Meanguera del Golfo'),(125,7,'Nueva Esparta'),(126,7,'Pasaquina'),(127,7,'Polorós'),(128,7,'San Alejo'),(129,7,'San José'),(130,7,'Santa Rosa de Lima'),(131,7,'Yayantique'),(132,7,'Yucuayquín'),(133,8,'Arambala'),(134,8,'Cacaopera'),(135,8,'Chilanga'),(136,8,'Corinto'),(137,8,'Delicias de Concepción'),(138,8,'El Divisadero'),(139,8,'El Rosario'),(140,8,'Gualococti'),(141,8,'Guatajiagua'),(142,8,'Joateca'),(143,8,'Jocoaitique'),(144,8,'Jocoro'),(145,8,'Lolotiquillo'),(146,8,'Meanguera'),(147,8,'Osicala'),(148,8,'Perquín'),(149,8,'San Carlos'),(150,8,'San Fernando'),(151,8,'San Francisco Gotera'),(152,8,'San Isidro'),(153,8,'San Simón'),(154,8,'Sensembra'),(155,8,'Sociedad'),(156,8,'Torola'),(157,8,'Yamabal'),(158,8,'Yoloaiquín'),(159,9,'Carolina'),(160,9,'Chapeltique'),(161,9,'Chinameca'),(162,9,'Chirilagua'),(163,9,'Ciudad Barrios'),(164,9,'Comacarán'),(165,9,'El Tránsito'),(166,9,'Lolotique'),(167,9,'Moncagua'),(168,9,'Nueva Guadalupe'),(169,9,'Nuevo Edén de San Juan'),(170,9,'Quelepa'),(171,9,'San Antonio'),(172,9,'San Gerardo'),(173,9,'San Jorge'),(174,9,'San Luis de la Reina'),(175,9,'San Miguel'),(176,9,'San Rafael'),(177,9,'Sesori'),(178,9,'Uluazapa'),(179,10,'Aguilares'),(180,10,'Apopa'),(181,10,'Ayutuxtepeque'),(182,10,'Cuscatancingo'),(183,10,'Delgado'),(184,10,'El Paisnal'),(185,10,'Guazapa'),(186,10,'Ilopango'),(187,10,'Mejicanos'),(188,10,'Nejapa'),(189,10,'Panchimalco'),(190,10,'Rosario de Mora'),(191,10,'San Marcos'),(192,10,'San Martín'),(193,10,'San Salvador'),(194,10,'Santiago Texacuangos'),(195,10,'Santo Tomás'),(196,10,'Soyapango'),(197,10,'Tonacatepeque'),(198,11,'Apastepeque'),(199,11,'Guadalupe'),(200,11,'San Cayetano Istepeque'),(201,11,'San Esteban Catarina'),(202,11,'San Ildefonso'),(203,11,'San Lorenzo'),(204,11,'San Sebastián'),(205,11,'Santa Clara'),(206,11,'Santo Domingo'),(207,11,'San Vicente'),(208,11,'Tecoluca'),(209,11,'Tepetitán'),(210,11,'Verapaz'),(211,12,'Candelaria de la Frontera'),(212,12,'Chalchuapa'),(213,12,'Coatepeque'),(214,12,'El Congo'),(215,12,'El Porvenir'),(216,12,'Masahuat'),(217,12,'Metapán'),(218,12,'San Antonio Pajonal'),(219,12,'San Sebastián Salitrillo'),(220,12,'Santa Ana'),(221,12,'Santa Rosa Guachipilín'),(222,12,'Santiago de la Frontera'),(223,12,'Texistepeque'),(224,13,'Acajutla'),(225,13,'Armenia'),(226,13,'Caluco'),(227,13,'Cuisnahuat'),(228,13,'Izalco'),(229,13,'Juayúa'),(230,13,'Nahuizalco'),(231,13,'Nahulingo'),(232,13,'Salcoatitán'),(233,13,'San Antonio del Monte'),(234,13,'San Julián'),(235,13,'Santa Catarina Masahuat'),(236,13,'Santa Isabel Ishuatán'),(237,13,'Santo Domingo'),(238,13,'Sonsonate'),(239,13,'Sonzacate'),(240,14,'Alegría'),(241,14,'Berlín'),(242,14,'California'),(243,14,'Concepción Batres'),(244,14,'El Triunfo'),(245,14,'Ereguayquín'),(246,14,'Estanzuelas'),(247,14,'Jiquilisco'),(248,14,'Jucuapa'),(249,14,'Jucuarán'),(250,14,'Mercedes Umaña'),(251,14,'Nueva Granada'),(252,14,'Ozatlán'),(253,14,'Puerto El Triunfo'),(254,14,'San Agustín'),(255,14,'San Buenaventura'),(256,14,'San Dionisio'),(257,14,'San Francisco Javier'),(258,14,'Santa Elena'),(259,14,'Santa María'),(260,14,'Santiago de María'),(261,14,'Tecapán'),(262,14,'Usulután');
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otros`
--

DROP TABLE IF EXISTS `otros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `ingles` varchar(5) DEFAULT NULL,
  `prezi` varchar(5) DEFAULT NULL,
  `relevante` varchar(3500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `otros_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otros`
--

LOCK TABLES `otros` WRITE;
/*!40000 ALTER TABLE `otros` DISABLE KEYS */;
INSERT INTO `otros` VALUES (1,3,'si','si','SOY BUEN CANDIDATO'),(15,12,'si','si',':)'),(17,13,'si','si','SOY BUEN CANDIDATO'),(18,14,'no','no','holas'),(19,15,'no','no',''),(20,15,'no','no',''),(21,15,'no','no',''),(22,16,'si','no','doy buenos talleres'),(23,17,'si','si','fsdfg'),(24,18,'si','si','holas :=)'),(25,20,'si','no',''),(26,26,'si','no','SOy el mejor para el puesto, esta vez muy mejorado'),(27,27,'si','no','el tigre sabanero'),(28,28,'no','si','Holaaaaaa'),(29,29,'si','no',''),(30,35,'no','si','312rwe'),(31,36,'si','no','creo, que soy el mejor candidato del mundo'),(32,37,'no','si','ya se que mi postulacion es bien pobre'),(33,38,'si','si','jiji'),(34,39,'si','si','helllow'),(35,40,'si','si',''),(36,30,'si','si',''),(37,41,'no','no',''),(38,44,'si','si','Información relevante aclaratoria.'),(39,45,'si','si','info aclaratoria');
/*!40000 ALTER TABLE `otros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulaciones`
--

DROP TABLE IF EXISTS `postulaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postulaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` enum('aprobado','postulado','rechazado','revisado') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `postulaciones_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulaciones`
--

LOCK TABLES `postulaciones` WRITE;
/*!40000 ALTER TABLE `postulaciones` DISABLE KEYS */;
INSERT INTO `postulaciones` VALUES (1,3,'2018-01-14 05:36:39','aprobado'),(4,12,'2018-01-15 02:54:29','aprobado'),(6,13,'2018-01-24 23:05:55','aprobado'),(10,15,'2018-01-24 23:04:36','aprobado'),(11,16,'2018-01-24 23:07:38','aprobado'),(12,17,'2018-01-24 22:59:20','aprobado'),(13,18,'2018-01-24 22:57:32','aprobado'),(14,20,'2018-01-24 23:08:54','rechazado'),(15,26,'2018-01-24 22:56:28','aprobado'),(16,27,'2018-01-24 23:02:28','aprobado'),(17,28,'2018-01-30 20:52:20','aprobado'),(18,29,'2018-01-31 09:00:09','rechazado'),(19,35,'2018-01-31 07:47:59','aprobado'),(20,36,'2018-01-31 08:36:02','aprobado'),(21,37,'2018-01-31 08:55:08','rechazado'),(22,38,'2018-01-31 09:05:50','revisado'),(23,39,'2018-01-31 09:08:43','postulado'),(24,40,'2018-01-31 09:41:37','postulado'),(25,30,'2018-01-31 16:20:22','rechazado'),(26,41,'2018-02-05 16:03:31','rechazado'),(27,44,'2018-02-04 20:30:18','aprobado'),(28,45,'2018-02-05 16:11:34','rechazado');
/*!40000 ALTER TABLE `postulaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencias_personales`
--

DROP TABLE IF EXISTS `referencias_personales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referencias_personales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `idreferencias` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  KEY `idreferencias` (`idreferencias`),
  CONSTRAINT `referencias_personales_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `referencias_personales_ibfk_2` FOREIGN KEY (`idreferencias`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencias_personales`
--

LOCK TABLES `referencias_personales` WRITE;
/*!40000 ALTER TABLE `referencias_personales` DISABLE KEYS */;
INSERT INTO `referencias_personales` VALUES (1,3,182),(3,16,208),(4,18,215),(5,28,223),(6,29,225),(10,26,247),(11,35,261),(12,36,271),(13,40,289),(14,44,306),(15,45,312);
/*!40000 ALTER TABLE `referencias_personales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblACLs`
--

DROP TABLE IF EXISTS `tblACLs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblACLs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target` int(11) NOT NULL DEFAULT '0',
  `targetType` tinyint(4) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '-1',
  `groupID` int(11) NOT NULL DEFAULT '-1',
  `mode` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblACLs`
--

LOCK TABLES `tblACLs` WRITE;
/*!40000 ALTER TABLE `tblACLs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblACLs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblAttributeDefinitions`
--

DROP TABLE IF EXISTS `tblAttributeDefinitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblAttributeDefinitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `objtype` tinyint(4) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `multiple` tinyint(4) NOT NULL DEFAULT '0',
  `minvalues` int(11) NOT NULL DEFAULT '0',
  `maxvalues` int(11) NOT NULL DEFAULT '0',
  `valueset` text,
  `regex` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblAttributeDefinitions`
--

LOCK TABLES `tblAttributeDefinitions` WRITE;
/*!40000 ALTER TABLE `tblAttributeDefinitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblAttributeDefinitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCategory`
--

DROP TABLE IF EXISTS `tblCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCategory`
--

LOCK TABLES `tblCategory` WRITE;
/*!40000 ALTER TABLE `tblCategory` DISABLE KEYS */;
INSERT INTO `tblCategory` VALUES (1,''),(2,''),(3,'Práctica docencia'),(4,'Experiencia en formación'),(5,'Manejo de metodologías');
/*!40000 ALTER TABLE `tblCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDocumentApproveLog`
--

DROP TABLE IF EXISTS `tblDocumentApproveLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDocumentApproveLog` (
  `approveLogID` int(11) NOT NULL AUTO_INCREMENT,
  `approveID` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`approveLogID`),
  KEY `tblDocumentApproveLog_approve` (`approveID`),
  KEY `tblDocumentApproveLog_user` (`userID`),
  CONSTRAINT `tblDocumentApproveLog_approve` FOREIGN KEY (`approveID`) REFERENCES `tblDocumentApprovers` (`approveID`) ON DELETE CASCADE,
  CONSTRAINT `tblDocumentApproveLog_user` FOREIGN KEY (`userID`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDocumentApproveLog`
--

LOCK TABLES `tblDocumentApproveLog` WRITE;
/*!40000 ALTER TABLE `tblDocumentApproveLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblDocumentApproveLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDocumentApprovers`
--

DROP TABLE IF EXISTS `tblDocumentApprovers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDocumentApprovers` (
  `approveID` int(11) NOT NULL AUTO_INCREMENT,
  `documentID` int(11) NOT NULL DEFAULT '0',
  `version` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `required` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`approveID`),
  UNIQUE KEY `documentID` (`documentID`,`version`,`type`,`required`),
  CONSTRAINT `tblDocumentApprovers_document` FOREIGN KEY (`documentID`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDocumentApprovers`
--

LOCK TABLES `tblDocumentApprovers` WRITE;
/*!40000 ALTER TABLE `tblDocumentApprovers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblDocumentApprovers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDocumentAttributes`
--

DROP TABLE IF EXISTS `tblDocumentAttributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDocumentAttributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document` int(11) DEFAULT NULL,
  `attrdef` int(11) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `document` (`document`,`attrdef`),
  KEY `tblDocumentAttributes_attrdef` (`attrdef`),
  CONSTRAINT `tblDocumentAttributes_attrdef` FOREIGN KEY (`attrdef`) REFERENCES `tblAttributeDefinitions` (`id`),
  CONSTRAINT `tblDocumentAttributes_document` FOREIGN KEY (`document`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDocumentAttributes`
--

LOCK TABLES `tblDocumentAttributes` WRITE;
/*!40000 ALTER TABLE `tblDocumentAttributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblDocumentAttributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDocumentCategory`
--

DROP TABLE IF EXISTS `tblDocumentCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDocumentCategory` (
  `categoryID` int(11) NOT NULL DEFAULT '0',
  `documentID` int(11) NOT NULL DEFAULT '0',
  KEY `tblDocumentCategory_category` (`categoryID`),
  KEY `tblDocumentCategory_document` (`documentID`),
  CONSTRAINT `tblDocumentCategory_category` FOREIGN KEY (`categoryID`) REFERENCES `tblCategory` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblDocumentCategory_document` FOREIGN KEY (`documentID`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDocumentCategory`
--

LOCK TABLES `tblDocumentCategory` WRITE;
/*!40000 ALTER TABLE `tblDocumentCategory` DISABLE KEYS */;
INSERT INTO `tblDocumentCategory` VALUES (3,131),(3,132),(4,133),(4,134),(5,135),(5,136),(5,137),(3,140),(4,141),(5,142),(3,157),(4,158),(4,159),(5,160),(5,161),(5,162),(3,176),(3,177),(4,178),(5,179),(5,180),(4,189),(5,190),(5,191),(3,196),(5,197),(5,198),(5,199),(3,201),(5,202),(3,205),(3,206),(4,207),(3,210),(3,211),(4,212),(5,213),(3,218),(4,219),(5,220),(3,222),(3,236),(4,237),(4,238),(3,239),(5,249),(5,250),(4,251),(4,252),(3,265),(4,266),(4,267),(5,268),(5,269),(3,273),(4,274),(5,275),(4,277),(5,278),(3,281),(5,282),(3,287),(5,288),(4,290),(3,293),(5,294),(3,295),(3,299),(4,300),(5,304),(3,308),(4,309),(5,310);
/*!40000 ALTER TABLE `tblDocumentCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDocumentContent`
--

DROP TABLE IF EXISTS `tblDocumentContent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDocumentContent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document` int(11) NOT NULL DEFAULT '0',
  `version` smallint(5) unsigned NOT NULL,
  `comment` text,
  `date` int(12) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dir` varchar(255) NOT NULL DEFAULT '',
  `orgFileName` varchar(150) NOT NULL DEFAULT '',
  `fileType` varchar(10) NOT NULL DEFAULT '',
  `mimeType` varchar(100) NOT NULL DEFAULT '',
  `fileSize` bigint(20) DEFAULT NULL,
  `checksum` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `document` (`document`,`version`),
  CONSTRAINT `tblDocumentContent_document` FOREIGN KEY (`document`) REFERENCES `tblDocuments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDocumentContent`
--

LOCK TABLES `tblDocumentContent` WRITE;
/*!40000 ALTER TABLE `tblDocumentContent` DISABLE KEYS */;
INSERT INTO `tblDocumentContent` VALUES (107,131,1,'',1515737105,3,'131/','reducido.csv','.csv','application/octet-stream',1368269,'1db87980adb7dda8dc8e2bcd93399e3a'),(108,132,1,'',1515737106,3,'132/','BUSQUEDA_publica.html','.html','text/html',112759,'ad4b4a056a5273633b2a9d11c4a55e50'),(109,133,1,'',1515737106,3,'133/','Hydrangeas.jpg','.jpg','image/jpeg',595284,'bdf3bf1da3405725be763540d6601144'),(110,134,1,'',1515737106,3,'134/','Tulips.jpg','.jpg','image/jpeg',620888,'fafa5efeaf3cbe3b23b2748d13e629a1'),(111,135,1,'',1515737106,3,'135/','Chrysanthemum.jpg','.jpg','image/jpeg',879394,'076e3caed758a1c18c91a0e9cae3368f'),(112,136,1,'',1515737106,3,'136/','Lighthouse.jpg','.jpg','image/jpeg',561276,'8969288f4245120e7c3870287cce0ff3'),(113,137,1,'',1515737106,3,'137/','Tulips.jpg','.jpg','image/jpeg',620888,'fafa5efeaf3cbe3b23b2748d13e629a1'),(114,138,1,'',1515737106,3,'138/','Desert.jpg','.jpg','image/jpeg',845941,'ba45c8f60456a672e003a875e469d0eb'),(115,139,1,'',1515737106,3,'139/','1.txt','.txt','text/plain',1989,'6cd187f251caa3dc08bb6f2736e1e488'),(116,140,1,'',1515771617,3,'140/','queryCargopestana2.sql','.sql','application/octet-stream',250,'a042c0f3d0095ecdb39bc8f6838e4007'),(117,141,1,'',1515771617,3,'141/','pestana7.sql','.sql','application/octet-stream',2500,'d51d039d17a578f46d54bcf82284d882'),(118,142,1,'',1515771618,3,'142/','pestana8.sql','.sql','application/octet-stream',266,'0ab9675112b10ab70286fad84127a4a2'),(119,143,1,'',1515771618,3,'143/','pestana9.sql','.sql','application/octet-stream',635,'7bc1d2e395534e9415c2cf533081807a'),(120,144,1,'',1515771618,3,'144/','pestana6.sql','.sql','application/octet-stream',480,'294a619c4e6c7e8978061e241a391020'),(121,146,1,'',1515792635,3,'146/','marc-guellerin-151177 (1).jpg','.jpg','image/jpeg',1377457,'ee50e24ddf1b117d760af92729ee28e0'),(122,147,1,'',1515792635,3,'147/','marc-guellerin-151177 (1).jpg','.jpg','image/jpeg',1377457,'ee50e24ddf1b117d760af92729ee28e0'),(123,148,1,'',1515792635,3,'148/','reducido.csv','.csv','application/octet-stream',1368269,'1db87980adb7dda8dc8e2bcd93399e3a'),(124,149,1,'',1515792635,3,'149/','reducido.csv','.csv','application/octet-stream',1368269,'1db87980adb7dda8dc8e2bcd93399e3a'),(125,150,1,'',1515792635,3,'150/','BUSQUEDA_publica.html','.html','text/html',112759,'ad4b4a056a5273633b2a9d11c4a55e50'),(126,151,1,'',1515792635,3,'151/','BUSQUEDA_publica.html','.html','text/html',112759,'ad4b4a056a5273633b2a9d11c4a55e50'),(127,152,1,'',1515857069,3,'152/','marc-guellerin-151177 (1).jpg','.jpg','image/jpeg',1377457,'ee50e24ddf1b117d760af92729ee28e0'),(128,153,1,'',1515857069,3,'153/','reducido.csv','.csv','application/octet-stream',1368269,'1db87980adb7dda8dc8e2bcd93399e3a'),(129,154,1,'',1515857069,3,'154/','Hydrangeas.jpg','.jpg','image/jpeg',595284,'bdf3bf1da3405725be763540d6601144'),(130,155,1,'',1515857069,3,'155/','Koala.jpg','.jpg','image/jpeg',780831,'2b04df3ecc1d94afddff082d139c6f15'),(131,156,1,'',1515857069,3,'156/','Penguins.jpg','.jpg','image/jpeg',777835,'9d377b10ce778c4938b3c7e2c63a229a'),(132,157,1,'',1515857069,3,'157/','Tulips.jpg','.jpg','image/jpeg',620888,'fafa5efeaf3cbe3b23b2748d13e629a1'),(133,158,1,'',1515857069,3,'158/','CREAR_Postulacion.html','.html','text/html',111099,'12f9fd43ae7dac163cea52109a0db0f7'),(134,159,1,'',1515857069,3,'159/','indice_Banco Central de Reserva_14-12-2017 14_50_00.xlsx','.xlsx','application/octet-stream',16305,'c13b8642a63688b3f33a44cee2822c44'),(135,160,1,'',1515857069,3,'160/','EVALUAR_postulacion.html','.html','text/html',206748,'fc44bc6eddcb310a066614129e6e5a57'),(136,161,1,'',1515857069,3,'161/','class.PaginaBlanco.php','.php','application/octet-stream',2649,'d112c456edb9467f3d18fc090004b722'),(137,162,1,'',1515857069,3,'162/','SIPOC_ENAFOP.jpg','.jpg','image/jpeg',65548,'6f1e7ed4bc710e756b81ed8e14a8c64b'),(138,170,1,'',1515879624,3,'170/','Chrysanthemum.jpg','.jpg','image/jpeg',879394,'076e3caed758a1c18c91a0e9cae3368f'),(139,171,1,'',1515879624,3,'171/','Desert.jpg','.jpg','image/jpeg',845941,'ba45c8f60456a672e003a875e469d0eb'),(140,172,1,'',1515879715,3,'172/','Chrysanthemum.jpg','.jpg','image/jpeg',879394,'076e3caed758a1c18c91a0e9cae3368f'),(141,173,1,'',1515879715,3,'173/','Desert.jpg','.jpg','image/jpeg',845941,'ba45c8f60456a672e003a875e469d0eb'),(142,174,1,'',1515880231,3,'174/','Desert.jpg','.jpg','image/jpeg',845941,'ba45c8f60456a672e003a875e469d0eb'),(143,175,1,'',1515880231,3,'175/','Jellyfish.jpg','.jpg','image/jpeg',775702,'5a44c7ba5bbe4ec867233d67e4806848'),(144,176,1,'',1515880231,3,'176/','Chrysanthemum.jpg','.jpg','image/jpeg',879394,'076e3caed758a1c18c91a0e9cae3368f'),(145,177,1,'',1515880232,3,'177/','Lighthouse.jpg','.jpg','image/jpeg',561276,'8969288f4245120e7c3870287cce0ff3'),(146,178,1,'',1515880232,3,'178/','Lighthouse.jpg','.jpg','image/jpeg',561276,'8969288f4245120e7c3870287cce0ff3'),(147,179,1,'',1515880232,3,'179/','Koala.jpg','.jpg','image/jpeg',780831,'2b04df3ecc1d94afddff082d139c6f15'),(148,180,1,'',1515880232,3,'180/','Jellyfish.jpg','.jpg','image/jpeg',775702,'5a44c7ba5bbe4ec867233d67e4806848'),(149,181,1,'',1515880232,3,'181/','1.txt','.txt','text/plain',1989,'6cd187f251caa3dc08bb6f2736e1e488'),(150,182,1,'',1515880232,3,'182/','paises.csv','.csv','application/octet-stream',13938,'7b6758c6d2bb65d63fd8e0d848a64eae'),(151,186,1,'',1515982200,1,'186/','DEPARTAMENTOS.txt','.txt','text/plain',15242,'88844cd71f049f9696e96411de75f813'),(152,187,1,'',1515983529,1,'187/','pestana7.sql','.sql','application/octet-stream',2500,'d51d039d17a578f46d54bcf82284d882'),(153,188,1,'',1515983529,1,'188/','pestana2.sql','.sql','application/octet-stream',430,'809b215b5e99673b4ae040e8d3ca5a27'),(154,189,1,'',1515983529,1,'189/','DEPARTAMENTOS.txt','.txt','text/plain',15242,'88844cd71f049f9696e96411de75f813'),(155,190,1,'',1515983529,1,'190/','reducido.csv','.csv','application/octet-stream',1368269,'1db87980adb7dda8dc8e2bcd93399e3a'),(156,191,1,'',1515983529,1,'191/','marc-guellerin-151177 (1).jpg','.jpg','image/jpeg',1377457,'ee50e24ddf1b117d760af92729ee28e0'),(157,192,1,'',1515983529,1,'192/','Desert.jpg','.jpg','image/jpeg',845941,'ba45c8f60456a672e003a875e469d0eb'),(158,193,1,'',1515984174,12,'193/','Desert.jpg','.jpg','image/jpeg',845941,'ba45c8f60456a672e003a875e469d0eb'),(159,194,1,'',1515984174,12,'194/','Lighthouse.jpg','.jpg','image/jpeg',561276,'8969288f4245120e7c3870287cce0ff3'),(160,195,1,'',1515984174,12,'195/','Tulips.jpg','.jpg','image/jpeg',620888,'fafa5efeaf3cbe3b23b2748d13e629a1'),(161,196,1,'',1515984174,12,'196/','Hydrangeas.jpg','.jpg','image/jpeg',595284,'bdf3bf1da3405725be763540d6601144'),(162,197,1,'',1515984174,12,'197/','Hydrangeas.jpg','.jpg','image/jpeg',595284,'bdf3bf1da3405725be763540d6601144'),(163,198,1,'',1515984174,12,'198/','Jellyfish.jpg','.jpg','image/jpeg',775702,'5a44c7ba5bbe4ec867233d67e4806848'),(164,199,1,'',1515984174,12,'199/','Koala.jpg','.jpg','image/jpeg',780831,'2b04df3ecc1d94afddff082d139c6f15'),(165,193,2,'pasa de desert a crisantemo',1515986885,12,'193/','Chrysanthemum.jpg','.jpg','image/jpeg',879394,'076e3caed758a1c18c91a0e9cae3368f'),(166,200,1,'',1516033654,13,'200/','logoesa2.png','.png','image/png',135543,'9e44455bd5c9c2f6b1cdc2c5368be5bf'),(167,201,1,'',1516033654,13,'201/','usuario.png','.png','image/png',3777,'1794718b3fb54269dfc2f7fcf712e281'),(168,202,1,'',1516033654,13,'202/','logo-enafop.png','.png','image/png',31819,'b07dba2d3541bbfe64835777d95b9cf8'),(169,203,1,'',1516033654,13,'203/','documents.png','.png','image/png',4695,'03b053b8b69e2ecc959067aad685ab93'),(170,204,1,'',1516640467,16,'204/','pantone1.png','.png','image/png',52874,'a0b973af931785d42a8c02e19be27a32'),(171,205,1,'',1516640467,16,'205/','pantone2.png','.png','image/png',49456,'8e17f88cdaf96a83537ad4159305fe0e'),(172,206,1,'',1516640467,16,'206/','logoStpp.png','.png','image/png',215888,'cbed2ec02e3639353b66db528d0c7d30'),(173,207,1,'',1516640467,16,'207/','logoesa2.png','.png','image/png',135543,'9e44455bd5c9c2f6b1cdc2c5368be5bf'),(174,208,1,'',1516640467,16,'208/','logo-enafop.png','.png','image/png',31819,'b07dba2d3541bbfe64835777d95b9cf8'),(175,209,1,'',1516643571,18,'209/','logoesa2.png','.png','image/png',135543,'9e44455bd5c9c2f6b1cdc2c5368be5bf'),(176,210,1,'',1516643571,18,'210/','pantone1.png','.png','image/png',52874,'a0b973af931785d42a8c02e19be27a32'),(177,211,1,'',1516643571,18,'211/','pantone2.png','.png','image/png',49456,'8e17f88cdaf96a83537ad4159305fe0e'),(178,212,1,'',1516643571,18,'212/','favicon.ico','.ico','image/x-icon',1150,'4cc3dd58deffbfa2e4b6eddce3bb0eac'),(179,213,1,'',1516643571,18,'213/','CREAR_Postulacion.html','.html','text/html',111099,'12f9fd43ae7dac163cea52109a0db0f7'),(180,214,1,'',1516643571,18,'214/','Recruitement-Module-Quick-Guide.pdf','.pdf','application/pdf',325458,'f0a27d94e58aeb5662c2385a53f7a94f'),(181,215,1,'',1516643571,18,'215/','64ab9c22ec81f5e0c893804c82e38400.ico.zip','.zip','application/x-zip-compressed',152844,'9a7f3584db57e0d48b9acc88dec12f28'),(182,216,1,'',1516660163,20,'216/','Jellyfish.jpg','.jpg','image/jpeg',775702,'5a44c7ba5bbe4ec867233d67e4806848'),(183,217,1,'',1516833274,26,'217/','Hydrangeas.jpg','.jpg','image/jpeg',595284,'bdf3bf1da3405725be763540d6601144'),(184,218,1,'',1516833274,26,'218/','Desert.jpg','.jpg','image/jpeg',845941,'ba45c8f60456a672e003a875e469d0eb'),(185,219,1,'',1516833274,26,'219/','Tulips.jpg','.jpg','image/jpeg',620888,'fafa5efeaf3cbe3b23b2748d13e629a1'),(186,220,1,'',1516833274,26,'220/','favicon.ico','.ico','image/x-icon',1150,'4cc3dd58deffbfa2e4b6eddce3bb0eac'),(188,222,1,'',1516921924,28,'222/','Lighthouse.jpg','.jpg','image/jpeg',561276,'8969288f4245120e7c3870287cce0ff3'),(189,223,1,'',1516921924,28,'223/','Chrysanthemum.jpg','.jpg','image/jpeg',879394,'076e3caed758a1c18c91a0e9cae3368f'),(190,224,1,'',1516922189,29,'224/','Hydrangeas.jpg','.jpg','image/jpeg',595284,'bdf3bf1da3405725be763540d6601144'),(191,225,1,'',1516922189,29,'225/','Chrysanthemum.jpg','.jpg','image/jpeg',879394,'076e3caed758a1c18c91a0e9cae3368f'),(192,217,2,'nuevo fichero',1517235126,26,'217/','Lighthouse.jpg','.jpg','image/jpeg',561276,'8969288f4245120e7c3870287cce0ff3'),(193,226,1,'',1517238274,26,'226/','Desert.jpg','.jpg','image/jpeg',845941,'ba45c8f60456a672e003a875e469d0eb'),(194,227,1,'',1517238453,26,'227/','Chrysanthemum.jpg','.jpg','image/jpeg',879394,'076e3caed758a1c18c91a0e9cae3368f'),(195,228,1,'',1517244136,26,'228/','Chrysanthemum.jpg','.jpg','image/jpeg',879394,'076e3caed758a1c18c91a0e9cae3368f'),(196,229,1,'',1517246563,26,'229/','Desert.jpg','.jpg','image/jpeg',845941,'ba45c8f60456a672e003a875e469d0eb'),(197,230,1,'',1517246563,26,'230/','Desert.jpg','.jpg','image/jpeg',845941,'ba45c8f60456a672e003a875e469d0eb'),(198,231,1,'',1517246563,26,'231/','Penguins.jpg','.jpg','image/jpeg',777835,'9d377b10ce778c4938b3c7e2c63a229a'),(199,232,1,'',1517247084,26,'232/','Lighthouse.jpg','.jpg','image/jpeg',561276,'8969288f4245120e7c3870287cce0ff3'),(200,233,1,'',1517247084,26,'233/','Lighthouse.jpg','.jpg','image/jpeg',561276,'8969288f4245120e7c3870287cce0ff3'),(201,234,1,'',1517247416,26,'234/','Chrysanthemum.jpg','.jpg','image/jpeg',879394,'076e3caed758a1c18c91a0e9cae3368f'),(202,235,1,'',1517247416,26,'235/','Koala.jpg','.jpg','image/jpeg',780831,'2b04df3ecc1d94afddff082d139c6f15'),(203,231,2,'das',1517262079,26,'231/','Desert.jpg','.jpg','image/jpeg',845941,'ba45c8f60456a672e003a875e469d0eb'),(204,234,2,'bnuevo file :)',1517262551,26,'234/','funcion validar_dui.txt','.txt','text/plain',2815,'916c5cfa6cc0513e820323fe64623dcb'),(205,235,2,'nuevaaa',1517262693,26,'235/','favicon.ico','.ico','image/x-icon',1150,'4cc3dd58deffbfa2e4b6eddce3bb0eac'),(206,230,2,'segunda version',1517262831,26,'230/','bootstrap-editable-v1.1.4.zip','.zip','application/x-zip-compressed',171679,'78fa6cca1415d59ca3848ca212ba89aa'),(207,229,2,'',1517271574,26,'229/','tablas_problemasjuridicos.sql','.sql','application/octet-stream',454,'ef6c0c78b0667b4518b5c2869a478fea'),(208,236,1,'',1517301505,26,'236/','marc-guellerin-151177 (1).jpg','.jpg','image/jpeg',1377457,'ee50e24ddf1b117d760af92729ee28e0'),(209,236,2,'mejoré',1517301782,26,'236/','Escudo ES.jpg','.jpg','image/jpeg',1531153,'ebf3d0daa9ce48528abb203c45069709'),(210,237,1,'',1517303223,26,'237/','reducido.csv','.csv','application/octet-stream',1368269,'1db87980adb7dda8dc8e2bcd93399e3a'),(211,238,1,'',1517303558,26,'238/','BUSQUEDA_publica.html','.html','text/html',112759,'ad4b4a056a5273633b2a9d11c4a55e50'),(212,239,1,'',1517303718,26,'239/','Chrysanthemum.jpg','.jpg','image/jpeg',879394,'076e3caed758a1c18c91a0e9cae3368f'),(218,245,1,'',1517307921,26,'245/','CREAR_Postulacion.html','.html','text/html',111099,'12f9fd43ae7dac163cea52109a0db0f7'),(220,247,1,'',1517308013,26,'247/','poshytip-1.2.zip','.zip','application/x-zip-compressed',194341,'9582c7888d04e7dd71a8dda162a62c5f'),(221,249,1,'',1517327959,26,'249/','CREAR_Postulacion.html','.html','text/html',111099,'12f9fd43ae7dac163cea52109a0db0f7'),(222,250,1,'',1517327959,26,'250/','tablas_problemasjuridicos.sql','.sql','application/octet-stream',454,'ef6c0c78b0667b4518b5c2869a478fea'),(223,251,1,'',1517341144,3,'251/','tablas_problemasjuridicos.sql','.sql','application/octet-stream',454,'ef6c0c78b0667b4518b5c2869a478fea'),(224,252,1,'',1517344144,3,'252/','ProVersionDowngradeBackup.reg','.reg','application/octet-stream',7298,'7a660a34eca597d6f29e218fc544fa69'),(231,259,1,'',1517357134,35,'259/','609425.jpg','.jpg','image/jpeg',336638,'7d4a603a8007a5014b7d994addad9bf0'),(232,260,1,'',1517357134,35,'260/','29760.jpg','.jpg','image/jpeg',1157609,'73cbb8b918cac10aa9e3a6050dce0a97'),(233,261,1,'',1517357134,35,'261/','554529.jpg','.jpg','image/jpeg',1291391,'d77bec07ae6b49c8193fc02f08819722'),(234,262,1,'',1517386738,36,'262/','462410.jpg','.jpg','image/jpeg',1099838,'e463af4372f595c99727d73a950aa0eb'),(235,263,1,'',1517386738,36,'263/','245776.jpg','.jpg','image/jpeg',514215,'647a5480870190bc451aedc3833aa0e5'),(236,264,1,'',1517386738,36,'264/','598614.jpg','.jpg','image/jpeg',6182177,'e474c49b79389adc456e273919dcf48a'),(237,265,1,'',1517386738,36,'265/','3220.jpg','.jpg','image/jpeg',911155,'d753bd32d083ac58fc28251d3f889fd8'),(238,266,1,'',1517386738,36,'266/','462410.jpg','.jpg','image/jpeg',1099838,'e463af4372f595c99727d73a950aa0eb'),(239,267,1,'',1517386738,36,'267/','3mugtiwhu0u-woodrow-walden.jpg','.jpg','image/jpeg',3826428,'39f4e80694ebdb2ee405a5c8860576c0'),(240,268,1,'',1517386738,36,'268/','554529.jpg','.jpg','image/jpeg',1291391,'d77bec07ae6b49c8193fc02f08819722'),(241,269,1,'',1517386738,36,'269/','africa-1170055_1280.jpg','.jpg','image/jpeg',112796,'0f1a21d100f20ea1f33791f352469c58'),(243,271,1,'',1517386738,36,'271/','dan-grinwis-396674.jpg','.jpg','image/jpeg',1600631,'047cb735a2e3ee8856cf12e50357633e'),(244,272,1,'',1517386847,36,'272/','245776.jpg','.jpg','image/jpeg',514215,'647a5480870190bc451aedc3833aa0e5'),(245,273,1,'',1517387523,36,'273/','635942.jpg','.jpg','image/jpeg',9685008,'8bb3322c79329b7be8330d8a1f555134'),(246,274,1,'',1517387576,36,'274/','solo2.sql','.sql','application/octet-stream',5205,'1683ce3a010b060a9d21c7664dff8a1b'),(247,275,1,'',1517387607,36,'275/','ciertasTablas.sql','.sql','application/octet-stream',36422,'dccdd009ff7ff464dcd9369583cc891c'),(248,276,1,'',1517387639,36,'276/','ciertasTablas.sql','.sql','application/octet-stream',36422,'dccdd009ff7ff464dcd9369583cc891c'),(249,277,1,'',1517388860,37,'277/','ciertasTablas.sql','.sql','application/octet-stream',36422,'dccdd009ff7ff464dcd9369583cc891c'),(250,278,1,'',1517388952,37,'278/','class.Bootstrap.php','.php','application/octet-stream',169316,'8e3ca5594ff9d2db54c90a0650e22631'),(251,279,1,'',1517389161,29,'279/','subirProblema.php','.php','application/octet-stream',3324,'277ebd265964dc2fc83e49b2cbf150c3'),(252,280,1,'',1517389402,38,'280/','subirProblema.php','.php','application/octet-stream',3324,'277ebd265964dc2fc83e49b2cbf150c3'),(253,281,1,'',1517389402,38,'281/','eliminarProblema.php','.php','application/octet-stream',1821,'d3c66b1d60fc538cabef82e920dd4581'),(254,282,1,'',1517389402,38,'282/','eliminarProblema.php','.php','application/octet-stream',1821,'d3c66b1d60fc538cabef82e920dd4581'),(255,283,1,'',1517389402,38,'283/','eliminarProblema.php','.php','application/octet-stream',1821,'d3c66b1d60fc538cabef82e920dd4581'),(256,284,1,'',1517389459,38,'284/','class.Bootstrap.php','.php','application/octet-stream',170932,'55b1141b6b963c2241a829e48e99ec01'),(257,285,1,'',1517389723,39,'285/','eliminarProblema.php','.php','application/octet-stream',1821,'d3c66b1d60fc538cabef82e920dd4581'),(258,278,2,'nueaaa',1517391185,37,'278/','subirProblema.php','.php','application/octet-stream',3324,'277ebd265964dc2fc83e49b2cbf150c3'),(259,286,1,'',1517391697,40,'286/','out.GestionProblemasJuridicos.php','.php','application/octet-stream',3224,'53750a5c54ea9bd85918151d843ab875'),(260,287,1,'',1517391697,40,'287/','eliminarProblema.php','.php','application/octet-stream',1821,'d3c66b1d60fc538cabef82e920dd4581'),(261,288,1,'',1517391697,40,'288/','class.Bootstrap.php','.php','application/octet-stream',170932,'55b1141b6b963c2241a829e48e99ec01'),(262,289,1,'',1517391697,40,'289/','135-D-2013 (1).txt','.txt','text/plain',19038,'9ae8d9d22a0a8b6f24a37b544d0d0df3'),(263,290,1,'',1517391882,40,'290/','out.EliminarResolucion.php','.php','application/octet-stream',3132,'c93c27d6dec3d693b8202c9f5be531f0'),(264,291,1,'',1517415585,30,'291/','3.xlsx','.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',6945,'ebc99030b5f3204ee243b5ecdf829d90'),(265,292,1,'',1517415585,30,'292/','ciertasTablas.sql','.sql','application/octet-stream',36422,'dccdd009ff7ff464dcd9369583cc891c'),(266,293,1,'',1517415778,30,'293/','Gruntfile.js','.js','application/javascript',4267,'52ab16852c028dd443b341a202708d43'),(267,294,1,'',1517416613,39,'294/','changelog.md','.md','application/octet-stream',44412,'82a6a78f58322d911ed55a44defc0c82'),(268,295,1,'',1517418049,39,'295/','LICENSE.md','.md','application/octet-stream',1095,'f683602956cb1dbd6269076b875f7aba'),(269,296,1,'',1517435890,41,'296/','CURRICULUM Alejandra Garay.docx','.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document',82485,'5bdc3402c498c876188482a1c2509032'),(270,297,1,'',1517435890,41,'297/','DUI Alejandra Garay.pdf','.pdf','application/pdf',175949,'a57916d6d65cca6f143f058c9a1bb068'),(271,298,1,'',1517435890,41,'298/','DUI Alejandra Garay.pdf','.pdf','application/pdf',175949,'a57916d6d65cca6f143f058c9a1bb068'),(272,299,1,'',1517435890,41,'299/','DUI Alejandra Garay.pdf','.pdf','application/pdf',175949,'a57916d6d65cca6f143f058c9a1bb068'),(273,300,1,'',1517435890,41,'300/','CURRICULUM Alejandra Garay.docx','.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document',82485,'5bdc3402c498c876188482a1c2509032'),(274,301,1,'',1517773478,44,'301/','Membrete SETEPLAN CAPRES - Público.docx','.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document',52050,'3c327fa41e8a0e969e1e964a2c56bf13'),(275,302,1,'',1517773478,44,'302/','SETEPLAN PPT.pptx','.pptx','application/vnd.openxmlformats-officedocument.presentationml.presentation',424086,'e1129601006ca40880bc0b5de53fd28a'),(276,303,1,'',1517773478,44,'303/','SETEPLAN PPT_EXTENDIDA.pptx','.pptx','application/vnd.openxmlformats-officedocument.presentationml.presentation',402867,'ecf02df9256ea440a29934c91847edb1'),(277,304,1,'',1517773479,44,'304/','OYM PROBLEMA.docx','.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document',18708,'27fdec577b9b19c38da6bdeb38facacf'),(278,305,1,'',1517773479,44,'305/','politicas.docx','.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document',27176,'2e8e6e3dfaf1befbe8b8582cb8defefe'),(279,306,1,'',1517773479,44,'306/','T1,U3.docx','.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document',64843,'a111c80338c33508fdd8fd00b9a89f17'),(280,307,1,'',1517845549,45,'307/','alma.png','.png','image/png',51664,'f763260ebfa88438b1730644cf0506a0'),(281,308,1,'',1517845549,45,'308/','alma.png','.png','image/png',51664,'f763260ebfa88438b1730644cf0506a0'),(282,309,1,'',1517845549,45,'309/','alma.png','.png','image/png',51664,'f763260ebfa88438b1730644cf0506a0'),(283,310,1,'',1517845549,45,'310/','alma.png','.png','image/png',51664,'f763260ebfa88438b1730644cf0506a0'),(284,311,1,'',1517845549,45,'311/','alma.png','.png','image/png',51664,'f763260ebfa88438b1730644cf0506a0'),(285,312,1,'',1517845549,45,'312/','alma.png','.png','image/png',51664,'f763260ebfa88438b1730644cf0506a0');
/*!40000 ALTER TABLE `tblDocumentContent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDocumentContentAttributes`
--

DROP TABLE IF EXISTS `tblDocumentContentAttributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDocumentContentAttributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` int(11) DEFAULT NULL,
  `attrdef` int(11) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content` (`content`,`attrdef`),
  KEY `tblDocumentContentAttributes_attrdef` (`attrdef`),
  CONSTRAINT `tblDocumentContentAttributes_attrdef` FOREIGN KEY (`attrdef`) REFERENCES `tblAttributeDefinitions` (`id`),
  CONSTRAINT `tblDocumentContentAttributes_document` FOREIGN KEY (`content`) REFERENCES `tblDocumentContent` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDocumentContentAttributes`
--

LOCK TABLES `tblDocumentContentAttributes` WRITE;
/*!40000 ALTER TABLE `tblDocumentContentAttributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblDocumentContentAttributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDocumentFiles`
--

DROP TABLE IF EXISTS `tblDocumentFiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDocumentFiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `comment` text,
  `name` varchar(150) DEFAULT NULL,
  `date` int(12) DEFAULT NULL,
  `dir` varchar(255) NOT NULL DEFAULT '',
  `orgFileName` varchar(150) NOT NULL DEFAULT '',
  `fileType` varchar(10) NOT NULL DEFAULT '',
  `mimeType` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `tblDocumentFiles_document` (`document`),
  KEY `tblDocumentFiles_user` (`userID`),
  CONSTRAINT `tblDocumentFiles_document` FOREIGN KEY (`document`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblDocumentFiles_user` FOREIGN KEY (`userID`) REFERENCES `tblUsers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDocumentFiles`
--

LOCK TABLES `tblDocumentFiles` WRITE;
/*!40000 ALTER TABLE `tblDocumentFiles` DISABLE KEYS */;
INSERT INTO `tblDocumentFiles` VALUES (1,236,26,'holi','adjunto a esto',1517301808,'236/','marc-guellerin-151177 (1).jpg','.jpg','image/jpeg'),(2,289,1,'sadfda','sdfas',1517847706,'289/','alma.png','.png','image/png'),(3,289,1,'sadfda','sdfas',1517847710,'289/','alma.png','.png','image/png');
/*!40000 ALTER TABLE `tblDocumentFiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDocumentLinks`
--

DROP TABLE IF EXISTS `tblDocumentLinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDocumentLinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document` int(11) NOT NULL DEFAULT '0',
  `target` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `public` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tblDocumentLinks_document` (`document`),
  KEY `tblDocumentLinks_target` (`target`),
  KEY `tblDocumentLinks_user` (`userID`),
  CONSTRAINT `tblDocumentLinks_document` FOREIGN KEY (`document`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblDocumentLinks_target` FOREIGN KEY (`target`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblDocumentLinks_user` FOREIGN KEY (`userID`) REFERENCES `tblUsers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDocumentLinks`
--

LOCK TABLES `tblDocumentLinks` WRITE;
/*!40000 ALTER TABLE `tblDocumentLinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblDocumentLinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDocumentLocks`
--

DROP TABLE IF EXISTS `tblDocumentLocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDocumentLocks` (
  `document` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`document`),
  KEY `tblDocumentLocks_user` (`userID`),
  CONSTRAINT `tblDocumentLocks_document` FOREIGN KEY (`document`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblDocumentLocks_user` FOREIGN KEY (`userID`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDocumentLocks`
--

LOCK TABLES `tblDocumentLocks` WRITE;
/*!40000 ALTER TABLE `tblDocumentLocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblDocumentLocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDocumentReviewLog`
--

DROP TABLE IF EXISTS `tblDocumentReviewLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDocumentReviewLog` (
  `reviewLogID` int(11) NOT NULL AUTO_INCREMENT,
  `reviewID` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reviewLogID`),
  KEY `tblDocumentReviewLog_review` (`reviewID`),
  KEY `tblDocumentReviewLog_user` (`userID`),
  CONSTRAINT `tblDocumentReviewLog_review` FOREIGN KEY (`reviewID`) REFERENCES `tblDocumentReviewers` (`reviewID`) ON DELETE CASCADE,
  CONSTRAINT `tblDocumentReviewLog_user` FOREIGN KEY (`userID`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDocumentReviewLog`
--

LOCK TABLES `tblDocumentReviewLog` WRITE;
/*!40000 ALTER TABLE `tblDocumentReviewLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblDocumentReviewLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDocumentReviewers`
--

DROP TABLE IF EXISTS `tblDocumentReviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDocumentReviewers` (
  `reviewID` int(11) NOT NULL AUTO_INCREMENT,
  `documentID` int(11) NOT NULL DEFAULT '0',
  `version` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `required` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reviewID`),
  UNIQUE KEY `documentID` (`documentID`,`version`,`type`,`required`),
  CONSTRAINT `tblDocumentReviewers_document` FOREIGN KEY (`documentID`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDocumentReviewers`
--

LOCK TABLES `tblDocumentReviewers` WRITE;
/*!40000 ALTER TABLE `tblDocumentReviewers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblDocumentReviewers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDocumentStatus`
--

DROP TABLE IF EXISTS `tblDocumentStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDocumentStatus` (
  `statusID` int(11) NOT NULL AUTO_INCREMENT,
  `documentID` int(11) NOT NULL DEFAULT '0',
  `version` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`statusID`),
  UNIQUE KEY `documentID` (`documentID`,`version`),
  CONSTRAINT `tblDocumentstatus_document` FOREIGN KEY (`documentID`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDocumentStatus`
--

LOCK TABLES `tblDocumentStatus` WRITE;
/*!40000 ALTER TABLE `tblDocumentStatus` DISABLE KEYS */;
INSERT INTO `tblDocumentStatus` VALUES (107,131,1),(108,132,1),(109,133,1),(110,134,1),(111,135,1),(112,136,1),(113,137,1),(114,138,1),(115,139,1),(116,140,1),(117,141,1),(118,142,1),(119,143,1),(120,144,1),(121,146,1),(122,147,1),(123,148,1),(124,149,1),(125,150,1),(126,151,1),(127,152,1),(128,153,1),(129,154,1),(130,155,1),(131,156,1),(132,157,1),(133,158,1),(134,159,1),(135,160,1),(136,161,1),(137,162,1),(138,170,1),(139,171,1),(140,172,1),(141,173,1),(142,174,1),(143,175,1),(144,176,1),(145,177,1),(146,178,1),(147,179,1),(148,180,1),(149,181,1),(150,182,1),(151,186,1),(152,187,1),(153,188,1),(154,189,1),(155,190,1),(156,191,1),(157,192,1),(158,193,1),(165,193,2),(159,194,1),(160,195,1),(161,196,1),(162,197,1),(163,198,1),(164,199,1),(166,200,1),(167,201,1),(168,202,1),(169,203,1),(170,204,1),(171,205,1),(172,206,1),(173,207,1),(174,208,1),(175,209,1),(176,210,1),(177,211,1),(178,212,1),(179,213,1),(180,214,1),(181,215,1),(182,216,1),(183,217,1),(192,217,2),(184,218,1),(185,219,1),(186,220,1),(188,222,1),(189,223,1),(190,224,1),(191,225,1),(193,226,1),(194,227,1),(195,228,1),(196,229,1),(207,229,2),(197,230,1),(206,230,2),(198,231,1),(203,231,2),(199,232,1),(200,233,1),(201,234,1),(204,234,2),(202,235,1),(205,235,2),(208,236,1),(209,236,2),(210,237,1),(211,238,1),(212,239,1),(218,245,1),(220,247,1),(221,249,1),(222,250,1),(223,251,1),(224,252,1),(225,259,1),(226,260,1),(227,261,1),(228,262,1),(229,263,1),(230,264,1),(231,265,1),(232,266,1),(233,267,1),(234,268,1),(235,269,1),(237,271,1),(238,272,1),(239,273,1),(240,274,1),(241,275,1),(242,276,1),(243,277,1),(244,278,1),(252,278,2),(245,279,1),(246,280,1),(247,281,1),(248,282,1),(249,283,1),(250,284,1),(251,285,1),(253,286,1),(254,287,1),(255,288,1),(256,289,1),(257,290,1),(258,291,1),(259,292,1),(260,293,1),(261,294,1),(262,295,1),(263,296,1),(264,297,1),(265,298,1),(266,299,1),(267,300,1),(268,301,1),(269,302,1),(270,303,1),(271,304,1),(272,305,1),(273,306,1),(274,307,1),(275,308,1),(276,309,1),(277,310,1),(278,311,1),(279,312,1);
/*!40000 ALTER TABLE `tblDocumentStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDocumentStatusLog`
--

DROP TABLE IF EXISTS `tblDocumentStatusLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDocumentStatusLog` (
  `statusLogID` int(11) NOT NULL AUTO_INCREMENT,
  `statusID` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`statusLogID`),
  KEY `statusID` (`statusID`),
  KEY `tblDocumentstatusLog_user` (`userID`),
  CONSTRAINT `tblDocumentstatusLog_status` FOREIGN KEY (`statusID`) REFERENCES `tblDocumentStatus` (`statusID`) ON DELETE CASCADE,
  CONSTRAINT `tblDocumentstatusLog_user` FOREIGN KEY (`userID`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDocumentStatusLog`
--

LOCK TABLES `tblDocumentStatusLog` WRITE;
/*!40000 ALTER TABLE `tblDocumentStatusLog` DISABLE KEYS */;
INSERT INTO `tblDocumentStatusLog` VALUES (107,107,2,'New document content submitted','2018-01-12 00:05:05',3),(108,108,2,'New document content submitted','2018-01-12 00:05:06',3),(109,109,2,'New document content submitted','2018-01-12 00:05:06',3),(110,110,2,'New document content submitted','2018-01-12 00:05:06',3),(111,111,2,'New document content submitted','2018-01-12 00:05:06',3),(112,112,2,'New document content submitted','2018-01-12 00:05:06',3),(113,113,2,'New document content submitted','2018-01-12 00:05:06',3),(114,114,2,'New document content submitted','2018-01-12 00:05:06',3),(115,115,2,'New document content submitted','2018-01-12 00:05:06',3),(116,116,2,'New document content submitted','2018-01-12 09:40:17',3),(117,117,2,'New document content submitted','2018-01-12 09:40:17',3),(118,118,2,'New document content submitted','2018-01-12 09:40:18',3),(119,119,2,'New document content submitted','2018-01-12 09:40:18',3),(120,120,2,'New document content submitted','2018-01-12 09:40:18',3),(121,121,2,'New document content submitted','2018-01-12 15:30:35',3),(122,122,2,'New document content submitted','2018-01-12 15:30:35',3),(123,123,2,'New document content submitted','2018-01-12 15:30:35',3),(124,124,2,'New document content submitted','2018-01-12 15:30:35',3),(125,125,2,'New document content submitted','2018-01-12 15:30:35',3),(126,126,2,'New document content submitted','2018-01-12 15:30:35',3),(127,127,2,'New document content submitted','2018-01-13 09:24:29',3),(128,128,2,'New document content submitted','2018-01-13 09:24:29',3),(129,129,2,'New document content submitted','2018-01-13 09:24:29',3),(130,130,2,'New document content submitted','2018-01-13 09:24:29',3),(131,131,2,'New document content submitted','2018-01-13 09:24:29',3),(132,132,2,'New document content submitted','2018-01-13 09:24:29',3),(133,133,2,'New document content submitted','2018-01-13 09:24:29',3),(134,134,2,'New document content submitted','2018-01-13 09:24:29',3),(135,135,2,'New document content submitted','2018-01-13 09:24:29',3),(136,136,2,'New document content submitted','2018-01-13 09:24:29',3),(137,137,2,'New document content submitted','2018-01-13 09:24:29',3),(138,138,2,'New document content submitted','2018-01-13 15:40:24',3),(139,139,2,'New document content submitted','2018-01-13 15:40:24',3),(140,140,2,'New document content submitted','2018-01-13 15:41:55',3),(141,141,2,'New document content submitted','2018-01-13 15:41:55',3),(142,142,2,'New document content submitted','2018-01-13 15:50:31',3),(143,143,2,'New document content submitted','2018-01-13 15:50:31',3),(144,144,2,'New document content submitted','2018-01-13 15:50:31',3),(145,145,2,'New document content submitted','2018-01-13 15:50:32',3),(146,146,2,'New document content submitted','2018-01-13 15:50:32',3),(147,147,2,'New document content submitted','2018-01-13 15:50:32',3),(148,148,2,'New document content submitted','2018-01-13 15:50:32',3),(149,149,2,'New document content submitted','2018-01-13 15:50:32',3),(150,150,2,'New document content submitted','2018-01-13 15:50:32',3),(158,158,2,'New document content submitted','2018-01-14 20:42:54',12),(159,159,2,'New document content submitted','2018-01-14 20:42:54',12),(160,160,2,'New document content submitted','2018-01-14 20:42:54',12),(161,161,2,'New document content submitted','2018-01-14 20:42:54',12),(162,162,2,'New document content submitted','2018-01-14 20:42:54',12),(163,163,2,'New document content submitted','2018-01-14 20:42:54',12),(164,164,2,'New document content submitted','2018-01-14 20:42:54',12),(165,165,2,'New document content submitted','2018-01-14 21:28:05',12),(166,165,-3,'','2018-01-14 21:28:05',12),(167,166,2,'New document content submitted','2018-01-15 10:27:34',13),(168,167,2,'New document content submitted','2018-01-15 10:27:34',13),(169,168,2,'New document content submitted','2018-01-15 10:27:34',13),(170,169,2,'New document content submitted','2018-01-15 10:27:34',13),(171,170,2,'New document content submitted','2018-01-22 11:01:07',16),(172,171,2,'New document content submitted','2018-01-22 11:01:07',16),(173,172,2,'New document content submitted','2018-01-22 11:01:07',16),(174,173,2,'New document content submitted','2018-01-22 11:01:07',16),(175,174,2,'New document content submitted','2018-01-22 11:01:07',16),(176,175,2,'New document content submitted','2018-01-22 11:52:51',18),(177,176,2,'New document content submitted','2018-01-22 11:52:51',18),(178,177,2,'New document content submitted','2018-01-22 11:52:51',18),(179,178,2,'New document content submitted','2018-01-22 11:52:51',18),(180,179,2,'New document content submitted','2018-01-22 11:52:51',18),(181,180,2,'New document content submitted','2018-01-22 11:52:51',18),(182,181,2,'New document content submitted','2018-01-22 11:52:51',18),(183,182,2,'New document content submitted','2018-01-22 16:29:23',20),(184,183,2,'New document content submitted','2018-01-24 16:34:34',26),(185,184,2,'New document content submitted','2018-01-24 16:34:34',26),(186,185,2,'New document content submitted','2018-01-24 16:34:34',26),(187,186,2,'New document content submitted','2018-01-24 16:34:34',26),(189,188,2,'New document content submitted','2018-01-25 17:12:04',28),(190,189,2,'New document content submitted','2018-01-25 17:12:04',28),(191,190,2,'New document content submitted','2018-01-25 17:16:29',29),(192,191,2,'New document content submitted','2018-01-25 17:16:29',29),(193,192,2,'New document content submitted','2018-01-29 08:12:06',26),(194,192,-3,'','2018-01-29 08:12:06',26),(195,193,2,'New document content submitted','2018-01-29 09:04:34',26),(196,194,2,'New document content submitted','2018-01-29 09:07:33',26),(197,195,2,'New document content submitted','2018-01-29 10:42:16',26),(198,196,2,'New document content submitted','2018-01-29 11:22:43',26),(199,197,2,'New document content submitted','2018-01-29 11:22:43',26),(200,198,2,'New document content submitted','2018-01-29 11:22:43',26),(201,199,2,'New document content submitted','2018-01-29 11:31:24',26),(202,200,2,'New document content submitted','2018-01-29 11:31:24',26),(203,201,2,'New document content submitted','2018-01-29 11:36:56',26),(204,202,2,'New document content submitted','2018-01-29 11:36:56',26),(205,203,2,'New document content submitted','2018-01-29 15:41:19',26),(206,203,-3,'','2018-01-29 15:41:19',26),(207,204,2,'New document content submitted','2018-01-29 15:49:11',26),(208,204,-3,'','2018-01-29 15:49:11',26),(209,205,2,'New document content submitted','2018-01-29 15:51:33',26),(210,205,-3,'','2018-01-29 15:51:33',26),(211,206,2,'New document content submitted','2018-01-29 15:53:51',26),(212,207,2,'New document content submitted','2018-01-29 18:19:34',26),(213,208,2,'New document content submitted','2018-01-30 02:38:25',26),(214,209,2,'New document content submitted','2018-01-30 02:43:02',26),(215,210,2,'New document content submitted','2018-01-30 03:07:03',26),(216,211,2,'New document content submitted','2018-01-30 03:12:38',26),(217,212,2,'New document content submitted','2018-01-30 03:15:18',26),(223,218,2,'New document content submitted','2018-01-30 04:25:21',26),(225,220,2,'New document content submitted','2018-01-30 04:26:53',26),(226,221,2,'New document content submitted','2018-01-30 09:59:19',26),(227,222,2,'New document content submitted','2018-01-30 09:59:19',26),(228,223,2,'New document content submitted','2018-01-30 13:39:04',3),(229,224,2,'New document content submitted','2018-01-30 14:29:04',3),(230,225,2,'New document content submitted','2018-01-30 18:05:34',35),(231,226,2,'New document content submitted','2018-01-30 18:05:34',35),(232,227,2,'New document content submitted','2018-01-30 18:05:34',35),(233,228,2,'New document content submitted','2018-01-31 02:18:58',36),(234,229,2,'New document content submitted','2018-01-31 02:18:58',36),(235,230,2,'New document content submitted','2018-01-31 02:18:58',36),(236,231,2,'New document content submitted','2018-01-31 02:18:58',36),(237,232,2,'New document content submitted','2018-01-31 02:18:58',36),(238,233,2,'New document content submitted','2018-01-31 02:18:58',36),(239,234,2,'New document content submitted','2018-01-31 02:18:58',36),(240,235,2,'New document content submitted','2018-01-31 02:18:58',36),(242,237,2,'New document content submitted','2018-01-31 02:18:58',36),(243,238,2,'New document content submitted','2018-01-31 02:20:47',36),(244,239,2,'New document content submitted','2018-01-31 02:32:03',36),(245,240,2,'New document content submitted','2018-01-31 02:32:56',36),(246,241,2,'New document content submitted','2018-01-31 02:33:27',36),(247,242,2,'New document content submitted','2018-01-31 02:33:59',36),(248,243,2,'New document content submitted','2018-01-31 02:54:20',37),(249,244,2,'New document content submitted','2018-01-31 02:55:52',37),(250,245,2,'New document content submitted','2018-01-31 02:59:21',29),(251,246,2,'New document content submitted','2018-01-31 03:03:22',38),(252,247,2,'New document content submitted','2018-01-31 03:03:22',38),(253,248,2,'New document content submitted','2018-01-31 03:03:22',38),(254,249,2,'New document content submitted','2018-01-31 03:03:22',38),(255,250,2,'New document content submitted','2018-01-31 03:04:19',38),(256,251,2,'New document content submitted','2018-01-31 03:08:43',39),(257,252,2,'New document content submitted','2018-01-31 03:33:05',37),(258,253,2,'New document content submitted','2018-01-31 03:41:37',40),(259,254,2,'New document content submitted','2018-01-31 03:41:37',40),(260,255,2,'New document content submitted','2018-01-31 03:41:37',40),(261,256,2,'New document content submitted','2018-01-31 03:41:37',40),(262,257,2,'New document content submitted','2018-01-31 03:44:42',40),(263,258,2,'New document content submitted','2018-01-31 10:19:45',30),(264,259,2,'New document content submitted','2018-01-31 10:19:45',30),(265,260,2,'New document content submitted','2018-01-31 10:22:58',30),(266,261,2,'New document content submitted','2018-01-31 10:36:53',39),(267,262,2,'New document content submitted','2018-01-31 11:00:49',39),(268,263,2,'New document content submitted','2018-01-31 15:58:10',41),(269,264,2,'New document content submitted','2018-01-31 15:58:10',41),(270,265,2,'New document content submitted','2018-01-31 15:58:10',41),(271,266,2,'New document content submitted','2018-01-31 15:58:10',41),(272,267,2,'New document content submitted','2018-01-31 15:58:10',41),(273,268,2,'New document content submitted','2018-02-04 13:44:38',44),(274,269,2,'New document content submitted','2018-02-04 13:44:38',44),(275,270,2,'New document content submitted','2018-02-04 13:44:38',44),(276,271,2,'New document content submitted','2018-02-04 13:44:39',44),(277,272,2,'New document content submitted','2018-02-04 13:44:39',44),(278,273,2,'New document content submitted','2018-02-04 13:44:39',44),(279,274,2,'New document content submitted','2018-02-05 09:45:49',45),(280,275,2,'New document content submitted','2018-02-05 09:45:49',45),(281,276,2,'New document content submitted','2018-02-05 09:45:49',45),(282,277,2,'New document content submitted','2018-02-05 09:45:49',45),(283,278,2,'New document content submitted','2018-02-05 09:45:49',45),(284,279,2,'New document content submitted','2018-02-05 09:45:49',45);
/*!40000 ALTER TABLE `tblDocumentStatusLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblDocuments`
--

DROP TABLE IF EXISTS `tblDocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblDocuments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `comment` text,
  `date` int(12) DEFAULT NULL,
  `expires` int(12) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `folder` int(11) DEFAULT NULL,
  `folderList` text NOT NULL,
  `inheritAccess` tinyint(1) NOT NULL DEFAULT '1',
  `defaultAccess` tinyint(4) NOT NULL DEFAULT '0',
  `locked` int(11) NOT NULL DEFAULT '-1',
  `keywords` text NOT NULL,
  `sequence` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tblDocuments_folder` (`folder`),
  KEY `tblDocuments_owner` (`owner`),
  CONSTRAINT `tblDocuments_folder` FOREIGN KEY (`folder`) REFERENCES `tblFolders` (`id`),
  CONSTRAINT `tblDocuments_owner` FOREIGN KEY (`owner`) REFERENCES `tblUsers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblDocuments`
--

LOCK TABLES `tblDocuments` WRITE;
/*!40000 ALTER TABLE `tblDocuments` DISABLE KEYS */;
INSERT INTO `tblDocuments` VALUES (131,'reducido.csv','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1515737105,0,3,3,':1:2:3:',1,2,-1,'',1),(132,'BUSQUEDA_publica.html','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1515737105,0,3,3,':1:2:3:',1,2,-1,'',1),(133,'Hydrangeas.jpg','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1515737106,0,3,4,':1:2:4:',1,2,-1,'',1),(134,'Tulips.jpg','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1515737106,0,3,4,':1:2:4:',1,2,-1,'',1),(135,'Chrysanthemum.jpg','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1515737106,0,3,5,':1:2:5:',1,2,-1,'',1),(136,'Lighthouse.jpg','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1515737106,0,3,5,':1:2:5:',1,2,-1,'',1),(137,'Tulips.jpg','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1515737106,0,3,5,':1:2:5:',1,2,-1,'',1),(138,'Desert.jpg','Este es un documento anexo subido por el postulante',1515737106,0,3,6,':1:2:6:',1,2,-1,'',1),(139,'1.txt','Este es un documento anexo subido por el postulante',1515737106,0,3,6,':1:2:6:',1,2,-1,'',1),(140,'queryCargopestana2.sql','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1515771617,0,3,3,':1:2:3:',1,2,-1,'',1),(141,'pestana7.sql','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1515771617,0,3,4,':1:2:4:',1,2,-1,'',1),(142,'pestana8.sql','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1515771618,0,3,5,':1:2:5:',1,2,-1,'',1),(143,'pestana9.sql','Este es un documento anexo subido por el postulante',1515771618,0,3,6,':1:2:6:',1,2,-1,'',1),(144,'pestana6.sql','Este es un documento anexo subido por el postulante',1515771618,0,3,6,':1:2:6:',1,2,-1,'',1),(146,'marc-guellerin-151177 (1).jpg','Este es un atestado sobre la formación del postulante',1515792635,0,3,6,':1:2:6:',1,2,-1,'',1),(147,'marc-guellerin-151177 (1).jpg','Este es un atestado sobre la formación del postulante',1515792635,0,3,6,':1:2:6:',1,2,-1,'',1),(148,'reducido.csv','Este es un atestado sobre la formación del postulante',1515792635,0,3,6,':1:2:6:',1,2,-1,'',1),(149,'reducido.csv','Este es un atestado sobre la formación del postulante',1515792635,0,3,6,':1:2:6:',1,2,-1,'',1),(150,'BUSQUEDA_publica.html','Este es un atestado sobre la formación del postulante',1515792635,0,3,6,':1:2:6:',1,2,-1,'',1),(151,'BUSQUEDA_publica.html','Este es un atestado sobre la formación del postulante',1515792635,0,3,6,':1:2:6:',1,2,-1,'',1),(152,'marc-guellerin-151177 (1).jpg','Este es un atestado sobre la formación del postulante',1515857069,0,3,6,':1:2:6:',1,2,-1,'',1),(153,'reducido.csv','Este es un atestado sobre la formación del postulante',1515857069,0,3,6,':1:2:6:',1,2,-1,'',1),(154,'Hydrangeas.jpg','Este es un atestado sobre la formación del postulante',1515857069,0,3,6,':1:2:6:',1,2,-1,'',1),(155,'Koala.jpg','Este es un atestado sobre la formación del postulante',1515857069,0,3,6,':1:2:6:',1,2,-1,'',1),(156,'Penguins.jpg','Este es un atestado sobre la formación del postulante',1515857069,0,3,6,':1:2:6:',1,2,-1,'',1),(157,'Tulips.jpg','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1515857069,0,3,3,':1:2:3:',1,2,-1,'',1),(158,'CREAR_Postulacion.html','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1515857069,0,3,4,':1:2:4:',1,2,-1,'',1),(159,'indice_Banco Central de Reserva_14-12-2017 14_50_00.xlsx','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1515857069,0,3,4,':1:2:4:',1,2,-1,'',1),(160,'EVALUAR_postulacion.html','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1515857069,0,3,5,':1:2:5:',1,2,-1,'',1),(161,'class.PaginaBlanco.php','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1515857069,0,3,5,':1:2:5:',1,2,-1,'',1),(162,'SIPOC_ENAFOP.jpg','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1515857069,0,3,5,':1:2:5:',1,2,-1,'',1),(170,'Chrysanthemum.jpg','Este es un documento anexo subido por el postulante',1515879624,0,3,6,':1:2:6:',1,2,-1,'',1),(171,'Desert.jpg','Este es un documento anexo subido por el postulante',1515879624,0,3,6,':1:2:6:',1,2,-1,'',1),(172,'Chrysanthemum.jpg','Este es un documento anexo subido por el postulante',1515879715,0,3,6,':1:2:6:',1,2,-1,'',1),(173,'Desert.jpg','Este es un documento anexo subido por el postulante',1515879715,0,3,6,':1:2:6:',1,2,-1,'',1),(174,'Desert.jpg','Este es un atestado sobre la formación del postulante',1515880231,0,3,6,':1:2:6:',1,2,-1,'',1),(175,'Jellyfish.jpg','Este es un atestado sobre la formación del postulante',1515880231,0,3,6,':1:2:6:',1,2,-1,'',1),(176,'Chrysanthemum.jpg','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1515880231,0,3,3,':1:2:3:',1,2,-1,'',1),(177,'Lighthouse.jpg','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1515880232,0,3,3,':1:2:3:',1,2,-1,'',1),(178,'Lighthouse.jpg','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1515880232,0,3,4,':1:2:4:',1,2,-1,'',1),(179,'Koala.jpg','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1515880232,0,3,5,':1:2:5:',1,2,-1,'',1),(180,'Jellyfish.jpg','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1515880232,0,3,5,':1:2:5:',1,2,-1,'',1),(181,'1.txt','Este es un documento anexo subido por el postulante',1515880232,0,3,6,':1:2:6:',1,2,-1,'',1),(182,'paises.csv','Este es un documento anexo subido por el postulante',1515880232,0,3,6,':1:2:6:',1,2,-1,'',1),(186,'DEPARTAMENTOS.txt','Este es un documento anexo subido por el postulante',1515982200,0,1,56,':1:52:56:',1,2,-1,'',1),(187,'pestana7.sql','Este es un atestado sobre la formación del postulante',1515983529,0,1,61,':1:57:61:',1,2,-1,'',1),(188,'pestana2.sql','Este es un atestado sobre la formación del postulante',1515983529,0,1,61,':1:57:61:',1,2,-1,'',1),(189,'DEPARTAMENTOS.txt','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1515983529,0,1,59,':1:57:59:',1,2,-1,'',1),(190,'reducido.csv','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1515983529,0,1,60,':1:57:60:',1,2,-1,'',1),(191,'marc-guellerin-151177 (1).jpg','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1515983529,0,1,60,':1:57:60:',1,2,-1,'',1),(192,'Desert.jpg','Este es un documento anexo subido por el postulante',1515983529,0,1,61,':1:57:61:',1,2,-1,'',1),(193,'Desert.jpg','Este es un atestado sobre la formación del postulante',1515984174,943916400,12,66,':1:62:66:',1,2,-1,'',1),(194,'Lighthouse.jpg','Este es un atestado sobre la formación del postulante',1515984174,0,12,66,':1:62:66:',1,2,-1,'',1),(195,'Tulips.jpg','Este es un atestado sobre la formación del postulante',1515984174,0,12,66,':1:62:66:',1,2,-1,'',1),(196,'Hydrangeas.jpg','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1515984174,0,12,63,':1:62:63:',1,2,-1,'',1),(197,'Hydrangeas.jpg','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1515984174,0,12,65,':1:62:65:',1,2,-1,'',1),(198,'Jellyfish.jpg','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1515984174,0,12,65,':1:62:65:',1,2,-1,'',1),(199,'Koala.jpg','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1515984174,0,12,65,':1:62:65:',1,2,-1,'',1),(200,'logoesa2.png','Este es un atestado sobre la formación del postulante',1516033654,0,13,71,':1:67:71:',1,2,-1,'',1),(201,'usuario.png','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1516033654,0,13,68,':1:67:68:',1,2,-1,'',1),(202,'logo-enafop.png','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1516033654,0,13,70,':1:67:70:',1,2,-1,'',1),(203,'documents.png','Este es un documento anexo subido por el postulante',1516033654,0,13,71,':1:67:71:',1,2,-1,'',1),(204,'pantone1.png','Este es un atestado sobre la formación del postulante',1516640467,0,16,86,':1:82:86:',1,2,-1,'',1),(205,'pantone2.png','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1516640467,0,16,83,':1:82:83:',1,2,-1,'',1),(206,'logoStpp.png','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1516640467,0,16,83,':1:82:83:',1,2,-1,'',1),(207,'logoesa2.png','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1516640467,0,16,84,':1:82:84:',1,2,-1,'',1),(208,'logo-enafop.png','Este es un documento anexo subido por el postulante',1516640467,0,16,86,':1:82:86:',1,2,-1,'',1),(209,'logoesa2.png','Este es un atestado sobre la formación del postulante',1516643571,0,18,96,':1:92:96:',1,2,-1,'',1),(210,'pantone1.png','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1516643571,0,18,93,':1:92:93:',1,2,-1,'',1),(211,'pantone2.png','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1516643571,0,18,93,':1:92:93:',1,2,-1,'',1),(212,'favicon.ico','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1516643571,0,18,94,':1:92:94:',1,2,-1,'',1),(213,'CREAR_Postulacion.html','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1516643571,0,18,95,':1:92:95:',1,2,-1,'',1),(214,'Recruitement-Module-Quick-Guide.pdf','Este es un documento anexo subido por el postulante',1516643571,0,18,96,':1:92:96:',1,2,-1,'',1),(215,'64ab9c22ec81f5e0c893804c82e38400.ico.zip','Este es un documento anexo subido por el postulante',1516643571,0,18,96,':1:92:96:',1,2,-1,'',1),(216,'Jellyfish.jpg','Este es un documento anexo subido por el postulante',1516660163,0,20,106,':1:102:106:',1,2,-1,'',1),(217,'Hydrangeas.jpg','Este es un atestado sobre la formación del postulante',1516833274,943916400,26,141,':1:137:141:',1,2,-1,'',1),(218,'Desert.jpg','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1516833274,0,26,138,':1:137:138:',1,2,-1,'',1),(219,'Tulips.jpg','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1516833274,0,26,139,':1:137:139:',1,2,-1,'',1),(220,'favicon.ico','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1516833274,0,26,140,':1:137:140:',1,2,-1,'',1),(222,'Lighthouse.jpg','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1516921924,0,28,148,':1:147:148:',1,2,-1,'',1),(223,'Chrysanthemum.jpg','Este es un documento anexo subido por el postulante',1516921924,0,28,151,':1:147:151:',1,2,-1,'',1),(224,'Hydrangeas.jpg','Este es un atestado sobre la formación del postulante',1516922189,0,29,156,':1:152:156:',1,2,-1,'',1),(225,'Chrysanthemum.jpg','Este es un documento anexo subido por el postulante',1516922189,0,29,156,':1:152:156:',1,2,-1,'',1),(226,'Desert.jpg','Este es un atestado sobre la formación del postulante',1517238274,0,26,141,':1:137:141:',1,2,-1,'',1),(227,'Chrysanthemum.jpg','Este es un atestado sobre la formación del postulante',1517238453,0,26,141,':1:137:141:',1,2,-1,'',1),(228,'Chrysanthemum.jpg','Este es un atestado sobre la formación del postulante',1517244136,0,26,141,':1:137:141:',1,2,-1,'',1),(229,'Desert.jpg','Este es un atestado sobre la formación del postulante',1517246563,0,26,141,':1:137:141:',1,2,-1,'',1),(230,'Desert.jpg','Este es un atestado sobre la formación del postulante',1517246563,0,26,141,':1:137:141:',1,2,-1,'',1),(231,'Penguins.jpg','Este es un atestado sobre la formación del postulante',1517246563,943916400,26,141,':1:137:141:',1,2,-1,'',1),(232,'Lighthouse.jpg','Este es un atestado sobre la formación del postulante',1517247084,0,26,141,':1:137:141:',1,2,-1,'',1),(233,'Lighthouse.jpg','Este es un atestado sobre la formación del postulante',1517247084,0,26,141,':1:137:141:',1,2,-1,'',1),(234,'Chrysanthemum.jpg','Este es un atestado sobre la formación del postulante',1517247416,-221560834,26,141,':1:137:141:',1,2,-1,'',1),(235,'Koala.jpg','Este es un atestado sobre la formación del postulante',1517247416,-861604096,26,141,':1:137:141:',1,2,-1,'',1),(236,'marc-guellerin-151177 (1).jpg','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1517301505,0,26,138,':1:137:138:',1,2,-1,'',1),(237,'reducido.csv','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1517303223,0,26,139,':1:137:139:',1,2,-1,'',1),(238,'BUSQUEDA_publica.html','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1517303558,0,26,139,':1:137:139:',1,2,-1,'',1),(239,'Chrysanthemum.jpg','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1517303718,0,26,138,':1:137:138:',1,2,-1,'',1),(245,'CREAR_Postulacion.html','Este es un documento anexo subido por el postulante',1517307921,0,26,141,':1:137:141:',1,2,-1,'',1),(247,'poshytip-1.2.zip','Este es un documento anexo subido por el postulante',1517308013,0,26,141,':1:137:141:',1,2,-1,'',1),(249,'CREAR_Postulacion.html','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1517327959,0,26,140,':1:137:140:',1,2,-1,'',1),(250,'tablas_problemasjuridicos.sql','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1517327959,0,26,140,':1:137:140:',1,2,-1,'',1),(251,'tablas_problemasjuridicos.sql','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1517341144,0,3,4,':1:2:4:',1,2,-1,'',1),(252,'ProVersionDowngradeBackup.reg','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1517344144,0,3,4,':1:2:4:',1,2,-1,'',1),(259,'609425.jpg','Este es un atestado sobre la formación del postulante',1517357134,0,35,191,':1:187:191:',1,2,-1,'',1),(260,'29760.jpg','Este es un documento anexo subido por el postulante',1517357134,0,35,191,':1:187:191:',1,2,-1,'',1),(261,'554529.jpg','Este es un documento anexo subido por el postulante',1517357134,0,35,191,':1:187:191:',1,2,-1,'',1),(262,'462410.jpg','Este es un atestado sobre la formación del postulante',1517386738,0,36,196,':1:192:196:',1,2,-1,'',1),(263,'245776.jpg','Este es un atestado sobre la formación del postulante',1517386738,0,36,196,':1:192:196:',1,2,-1,'',1),(264,'598614.jpg','Este es un atestado sobre la formación del postulante',1517386738,0,36,196,':1:192:196:',1,2,-1,'',1),(265,'3220.jpg','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1517386738,0,36,193,':1:192:193:',1,2,-1,'',1),(266,'462410.jpg','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1517386738,0,36,194,':1:192:194:',1,2,-1,'',1),(267,'3mugtiwhu0u-woodrow-walden.jpg','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1517386738,0,36,194,':1:192:194:',1,2,-1,'',1),(268,'554529.jpg','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1517386738,0,36,195,':1:192:195:',1,2,-1,'',1),(269,'africa-1170055_1280.jpg','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1517386738,0,36,195,':1:192:195:',1,2,-1,'',1),(271,'dan-grinwis-396674.jpg','Este es un documento anexo subido por el postulante',1517386738,0,36,196,':1:192:196:',1,2,-1,'',1),(272,'245776.jpg','Este es un atestado sobre la formación del postulante',1517386847,0,36,196,':1:192:196:',1,2,-1,'',1),(273,'635942.jpg','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1517387523,0,36,193,':1:192:193:',1,2,-1,'',1),(274,'solo2.sql','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1517387576,0,36,194,':1:192:194:',1,2,-1,'',1),(275,'ciertasTablas.sql','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1517387607,0,36,195,':1:192:195:',1,2,-1,'',1),(276,'ciertasTablas.sql','Este es un documento anexo subido por el postulante',1517387639,0,36,196,':1:192:196:',1,2,-1,'',1),(277,'ciertasTablas.sql','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1517388860,0,37,199,':1:197:199:',1,2,-1,'',1),(278,'class.Bootstrap.php','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1517388952,2147483647,37,200,':1:197:200:',1,2,-1,'',1),(279,'subirProblema.php','Este es un atestado sobre la formación del postulante',1517389161,0,29,156,':1:152:156:',1,2,-1,'',1),(280,'subirProblema.php','Este es un atestado sobre la formación del postulante',1517389402,0,38,206,':1:202:206:',1,2,-1,'',1),(281,'eliminarProblema.php','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1517389402,0,38,203,':1:202:203:',1,2,-1,'',1),(282,'eliminarProblema.php','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1517389402,0,38,205,':1:202:205:',1,2,-1,'',1),(283,'eliminarProblema.php','Este es un documento anexo subido por el postulante',1517389402,0,38,206,':1:202:206:',1,2,-1,'',1),(284,'class.Bootstrap.php','Este es un atestado sobre la formación del postulante',1517389459,0,38,206,':1:202:206:',1,2,-1,'',1),(285,'eliminarProblema.php','Este es un documento anexo subido por el postulante',1517389723,0,39,211,':1:207:211:',1,2,-1,'',1),(286,'out.GestionProblemasJuridicos.php','Este es un atestado sobre la formación del postulante',1517391697,0,40,216,':1:212:216:',1,2,-1,'',1),(287,'eliminarProblema.php','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1517391697,0,40,213,':1:212:213:',1,2,-1,'',1),(288,'class.Bootstrap.php','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1517391697,0,40,215,':1:212:215:',1,2,-1,'',1),(289,'135-D-2013 (1).txt','Este es un documento anexo subido por el postulante',1517391697,0,40,216,':1:212:216:',1,2,-1,'',1),(290,'out.EliminarResolucion.php','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1517391882,0,40,214,':1:212:214:',1,2,-1,'',1),(291,'3.xlsx','Este es un atestado sobre la formación del postulante',1517415585,0,30,161,':1:157:161:',1,2,-1,'',1),(292,'ciertasTablas.sql','Este es un documento anexo subido por el postulante',1517415585,0,30,161,':1:157:161:',1,2,-1,'',1),(293,'Gruntfile.js','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1517415778,0,30,158,':1:157:158:',1,2,-1,'',1),(294,'changelog.md','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1517416613,0,39,210,':1:207:210:',1,2,-1,'',1),(295,'LICENSE.md','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1517418049,0,39,208,':1:207:208:',1,2,-1,'',1),(296,'CURRICULUM Alejandra Garay.docx','Este es un atestado sobre la formación del postulante',1517435890,0,41,221,':1:217:221:',1,2,-1,'',1),(297,'DUI Alejandra Garay.pdf','Este es un atestado sobre la formación del postulante',1517435890,0,41,221,':1:217:221:',1,2,-1,'',1),(298,'DUI Alejandra Garay.pdf','Este es un atestado sobre la formación del postulante',1517435890,0,41,221,':1:217:221:',1,2,-1,'',1),(299,'DUI Alejandra Garay.pdf','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1517435890,0,41,218,':1:217:218:',1,2,-1,'',1),(300,'CURRICULUM Alejandra Garay.docx','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1517435890,0,41,219,':1:217:219:',1,2,-1,'',1),(301,'Membrete SETEPLAN CAPRES - Público.docx','Este es un atestado sobre la formación del postulante',1517773478,0,44,236,':1:232:236:',1,2,-1,'',1),(302,'SETEPLAN PPT.pptx','Este es un atestado sobre la formación del postulante',1517773478,0,44,236,':1:232:236:',1,2,-1,'',1),(303,'SETEPLAN PPT_EXTENDIDA.pptx','Este es un atestado sobre la formación del postulante',1517773478,0,44,236,':1:232:236:',1,2,-1,'',1),(304,'OYM PROBLEMA.docx','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1517773479,0,44,235,':1:232:235:',1,2,-1,'',1),(305,'politicas.docx','Este es un documento anexo subido por el postulante',1517773479,0,44,236,':1:232:236:',1,2,-1,'',1),(306,'T1,U3.docx','Este es un documento anexo subido por el postulante',1517773479,0,44,236,':1:232:236:',1,2,-1,'',1),(307,'alma.png','Este es un atestado sobre la formación del postulante',1517845549,0,45,241,':1:237:241:',1,2,-1,'',1),(308,'alma.png','Este es un atestado sobre la experiencia en impartición de docencia del postulante',1517845549,0,45,238,':1:237:238:',1,2,-1,'',1),(309,'alma.png','Este es un atestado sobre la experiencia en formación y capacitación del postulante',1517845549,0,45,239,':1:237:239:',1,2,-1,'',1),(310,'alma.png','Este es un atestado sobre la experiencia en manejo de metodologías del postulante',1517845549,0,45,240,':1:237:240:',1,2,-1,'',1),(311,'alma.png','Este es un documento anexo subido por el postulante',1517845549,0,45,241,':1:237:241:',1,2,-1,'',1),(312,'alma.png','Este es un documento anexo subido por el postulante',1517845549,0,45,241,':1:237:241:',1,2,-1,'',1);
/*!40000 ALTER TABLE `tblDocuments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblEvents`
--

DROP TABLE IF EXISTS `tblEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblEvents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `comment` text,
  `start` int(12) DEFAULT NULL,
  `stop` int(12) DEFAULT NULL,
  `date` int(12) DEFAULT NULL,
  `userID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblEvents`
--

LOCK TABLES `tblEvents` WRITE;
/*!40000 ALTER TABLE `tblEvents` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblEvents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblFolderAttributes`
--

DROP TABLE IF EXISTS `tblFolderAttributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblFolderAttributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder` int(11) DEFAULT NULL,
  `attrdef` int(11) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `folder` (`folder`,`attrdef`),
  KEY `tblFolderAttributes_attrdef` (`attrdef`),
  CONSTRAINT `tblFolderAttributes_attrdef` FOREIGN KEY (`attrdef`) REFERENCES `tblAttributeDefinitions` (`id`),
  CONSTRAINT `tblFolderAttributes_folder` FOREIGN KEY (`folder`) REFERENCES `tblFolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblFolderAttributes`
--

LOCK TABLES `tblFolderAttributes` WRITE;
/*!40000 ALTER TABLE `tblFolderAttributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblFolderAttributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblFolders`
--

DROP TABLE IF EXISTS `tblFolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblFolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `folderList` text NOT NULL,
  `comment` text,
  `date` int(12) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `inheritAccess` tinyint(1) NOT NULL DEFAULT '1',
  `defaultAccess` tinyint(4) NOT NULL DEFAULT '0',
  `sequence` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `tblFolders_owner` (`owner`),
  CONSTRAINT `tblFolders_owner` FOREIGN KEY (`owner`) REFERENCES `tblUsers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblFolders`
--

LOCK TABLES `tblFolders` WRITE;
/*!40000 ALTER TABLE `tblFolders` DISABLE KEYS */;
INSERT INTO `tblFolders` VALUES (1,'DMS',0,'','DMS root',1512746962,1,0,2,0),(2,'Jose Mario',1,':1:','Carpeta del aplicante José Mario López Leiva',1512753190,1,0,3,1),(3,'Atestados práctica docencia',2,':1:2:','En esta carpeta se almacenan los documentos adjuntos subidos en el formulario en la sección \"Práctica de la docencia\"',1515686847,1,0,3,1),(4,'Atestados experiencia en formación',2,':1:2:','En esta carpeta se almacenen los documentos adjuntos subidos en el formulario de la sección \"Experiencia en formación\"',1515686886,1,1,2,2),(5,'Atestados manejo de metodologías',2,':1:2:','Aquí se guardan los atestados de esta sección del formulario',1515686935,1,1,2,3),(6,'Documentos adjuntos',2,':1:2:','Aquí se almacenan la carta de motivación de postulante y las referencias personales',1515687075,1,1,2,4),(7,'Pepito Pérez',1,':1:','Carpeta de Pepito Pérez',1515968261,1,1,2,1),(8,'Atestados práctica docencia',7,':1:7:','Carpeta de  atestados de Pepito Pérez',1515968261,1,1,2,1),(9,'Atestados experiencia en formación',7,':1:7:','Carpeta de  atestados de formación de Pepito Pérez',1515968261,1,1,2,1),(10,'Atestados manejo de metodologías',7,':1:7:','Carpeta de  atestados de manejos de metodologías de Pepito Pérez',1515968261,1,1,2,1),(11,'Documentos adjuntos',7,':1:7:','Carpeta de  atestados de Pepito Pérez',1515968261,1,1,2,1),(12,'Juanito Machuca',1,':1:','Carpeta de Juanito Machuca',1515969864,1,1,2,1),(13,'Atestados práctica docencia',12,':1:12:','Carpeta de  atestados de Juanito Machuca',1515969864,1,1,2,1),(14,'Atestados experiencia en formación',12,':1:12:','Carpeta de  atestados de formación de Juanito Machuca',1515969864,1,1,2,1),(15,'Atestados manejo de metodologías',12,':1:12:','Carpeta de  atestados de manejos de metodologías de Juanito Machuca',1515969864,1,1,2,1),(16,'Documentos adjuntos',12,':1:12:','Carpeta de  atestados de Juanito Machuca',1515969864,1,1,2,1),(17,'Maria Martinez',1,':1:','Carpeta de Maria Martinez',1515969974,1,1,2,1),(18,'Atestados práctica docencia',17,':1:17:','Carpeta de  atestados de Maria Martinez',1515969974,1,1,2,1),(19,'Atestados experiencia en formación',17,':1:17:','Carpeta de  atestados de formación de Maria Martinez',1515969974,1,1,2,1),(20,'Atestados manejo de metodologías',17,':1:17:','Carpeta de  atestados de manejos de metodologías de Maria Martinez',1515969974,1,1,2,1),(21,'Documentos adjuntos',17,':1:17:','Carpeta de  atestados de Maria Martinez',1515969974,1,1,2,1),(22,'Jose José',1,':1:','Carpeta de Jose José',1515970040,1,1,2,1),(23,'Atestados práctica docencia',22,':1:22:','Carpeta de  atestados de Jose José',1515970040,1,1,2,1),(24,'Atestados experiencia en formación',22,':1:22:','Carpeta de  atestados de formación de Jose José',1515970040,1,1,2,1),(25,'Atestados manejo de metodologías',22,':1:22:','Carpeta de  atestados de manejos de metodologías de Jose José',1515970040,1,1,2,1),(26,'Documentos adjuntos',22,':1:22:','Carpeta de  atestados de Jose José',1515970040,1,1,2,1),(27,'',1,':1:','Carpeta de ',1515970737,1,1,2,1),(28,'Atestados práctica docencia',27,':1:27:','Carpeta de  atestados de ',1515970737,1,1,2,1),(29,'Atestados experiencia en formación',27,':1:27:','Carpeta de  atestados de formación de ',1515970737,1,1,2,1),(30,'Atestados manejo de metodologías',27,':1:27:','Carpeta de  atestados de manejos de metodologías de ',1515970737,1,1,2,1),(31,'Documentos adjuntos',27,':1:27:','Carpeta de  atestados de ',1515970737,1,1,2,1),(32,'',1,':1:','Carpeta de ',1515970791,1,1,2,1),(33,'Atestados práctica docencia',32,':1:32:','Carpeta de  atestados de ',1515970791,1,1,2,1),(34,'Atestados experiencia en formación',32,':1:32:','Carpeta de  atestados de formación de ',1515970791,1,1,2,1),(35,'Atestados manejo de metodologías',32,':1:32:','Carpeta de  atestados de manejos de metodologías de ',1515970791,1,1,2,1),(36,'Documentos adjuntos',32,':1:32:','Carpeta de  atestados de ',1515970791,1,1,2,1),(37,'',1,':1:','Carpeta de ',1515970797,1,1,2,1),(38,'Atestados práctica docencia',37,':1:37:','Carpeta de  atestados de ',1515970797,1,1,2,1),(39,'Atestados experiencia en formación',37,':1:37:','Carpeta de  atestados de formación de ',1515970797,1,1,2,1),(40,'Atestados manejo de metodologías',37,':1:37:','Carpeta de  atestados de manejos de metodologías de ',1515970797,1,1,2,1),(41,'Documentos adjuntos',37,':1:37:','Carpeta de  atestados de ',1515970797,1,1,2,1),(42,'',1,':1:','Carpeta de ',1515970804,1,1,2,1),(43,'Atestados práctica docencia',42,':1:42:','Carpeta de  atestados de ',1515970804,1,1,2,1),(44,'Atestados experiencia en formación',42,':1:42:','Carpeta de  atestados de formación de ',1515970804,1,1,2,1),(45,'Atestados manejo de metodologías',42,':1:42:','Carpeta de  atestados de manejos de metodologías de ',1515970804,1,1,2,1),(46,'Documentos adjuntos',42,':1:42:','Carpeta de  atestados de ',1515970804,1,1,2,1),(47,'Manolo Pachangón',1,':1:','Carpeta de Manolo Pachangón',1515981022,1,1,2,1),(48,'Atestados práctica docencia',47,':1:47:','Carpeta de  atestados de Manolo Pachangón',1515981022,1,1,3,1),(49,'Atestados experiencia en formación',47,':1:47:','Carpeta de  atestados de formación de Manolo Pachangón',1515981022,1,1,3,1),(50,'Atestados manejo de metodologías',47,':1:47:','Carpeta de  atestados de manejos de metodologías de Manolo Pachangón',1515981022,1,1,3,1),(51,'Documentos adjuntos',47,':1:47:','Carpeta de  atestados de Manolo Pachangón',1515981022,1,1,3,1),(52,'Cristiano Ronaldo',1,':1:','Carpeta de Cristiano Ronaldo',1515981651,1,1,2,1),(53,'Atestados práctica docencia',52,':1:52:','Carpeta de  atestados de Cristiano Ronaldo',1515981651,1,0,3,1),(54,'Atestados experiencia en formación',52,':1:52:','Carpeta de  atestados de formación de Cristiano Ronaldo',1515981651,1,0,3,1),(55,'Atestados manejo de metodologías',52,':1:52:','Carpeta de  atestados de manejos de metodologías de Cristiano Ronaldo',1515981651,1,0,3,1),(56,'Documentos adjuntos',52,':1:52:','Carpeta de  atestados de Cristiano Ronaldo',1515981651,1,0,3,1),(57,'René Pérez',1,':1:','Carpeta de René Pérez',1515983344,1,1,2,1),(58,'Atestados práctica docencia',57,':1:57:','Carpeta de  atestados de René Pérez',1515983344,1,0,3,1),(59,'Atestados experiencia en formación',57,':1:57:','Carpeta de  atestados de formación de René Pérez',1515983344,1,0,3,1),(60,'Atestados manejo de metodologías',57,':1:57:','Carpeta de  atestados de manejos de metodologías de René Pérez',1515983344,1,0,3,1),(61,'Documentos adjuntos',57,':1:57:','Carpeta de  atestados de René Pérez',1515983344,1,0,3,1),(62,'Mario García',1,':1:','Carpeta de Mario García',1515983926,1,1,2,1),(63,'Atestados práctica docencia',62,':1:62:','Carpeta de  atestados de Mario García',1515983926,1,0,3,1),(64,'Atestados experiencia en formación',62,':1:62:','Carpeta de  atestados de formación de Mario García',1515983926,1,0,3,1),(65,'Atestados manejo de metodologías',62,':1:62:','Carpeta de  atestados de manejos de metodologías de Mario García',1515983926,1,0,3,1),(66,'Documentos adjuntos',62,':1:62:','Carpeta de  atestados de Mario García',1515983926,1,0,3,1),(67,'Juan Pérez',1,':1:','Carpeta de Juan Pérez',1516033065,1,1,2,1),(68,'Atestados práctica docencia',67,':1:67:','Carpeta de  atestados de Juan Pérez',1516033065,1,0,3,1),(69,'Atestados experiencia en formación',67,':1:67:','Carpeta de  atestados de formación de Juan Pérez',1516033065,1,0,3,1),(70,'Atestados manejo de metodologías',67,':1:67:','Carpeta de  atestados de manejos de metodologías de Juan Pérez',1516033065,1,0,3,1),(71,'Documentos adjuntos',67,':1:67:','Carpeta de  atestados de Juan Pérez',1516033065,1,0,3,1),(72,'Maria Rosa',1,':1:','Carpeta de Maria Rosa',1516308874,1,1,2,1),(73,'Atestados práctica docencia',72,':1:72:','Carpeta de  atestados de Maria Rosa',1516308874,1,0,3,1),(74,'Atestados experiencia en formación',72,':1:72:','Carpeta de  atestados de formación de Maria Rosa',1516308874,1,0,3,1),(75,'Atestados manejo de metodologías',72,':1:72:','Carpeta de  atestados de manejos de metodologías de Maria Rosa',1516308874,1,0,3,1),(76,'Documentos adjuntos',72,':1:72:','Carpeta de  atestados de Maria Rosa',1516308874,1,0,3,1),(77,'Juanito Dos',1,':1:','Carpeta de Juanito Dos',1516312821,1,1,2,1),(78,'Atestados práctica docencia',77,':1:77:','Carpeta de  atestados de Juanito Dos',1516312821,1,0,3,1),(79,'Atestados experiencia en formación',77,':1:77:','Carpeta de  atestados de formación de Juanito Dos',1516312821,1,0,3,1),(80,'Atestados manejo de metodologías',77,':1:77:','Carpeta de  atestados de manejos de metodologías de Juanito Dos',1516312821,1,0,3,1),(81,'Documentos adjuntos',77,':1:77:','Carpeta de  atestados de Juanito Dos',1516312821,1,0,3,1),(82,'JOSE MARIA',1,':1:','Carpeta de JOSE MARIA',1516640187,1,1,2,1),(83,'Atestados práctica docencia',82,':1:82:','Carpeta de  atestados de JOSE MARIA',1516640187,1,0,3,1),(84,'Atestados experiencia en formación',82,':1:82:','Carpeta de  atestados de formación de JOSE MARIA',1516640187,1,0,3,1),(85,'Atestados manejo de metodologías',82,':1:82:','Carpeta de  atestados de manejos de metodologías de JOSE MARIA',1516640187,1,0,3,1),(86,'Documentos adjuntos',82,':1:82:','Carpeta de  atestados de JOSE MARIA',1516640187,1,0,3,1),(87,'MARITO RIVERA',1,':1:','Carpeta de MARITO RIVERA',1516640819,1,1,2,1),(88,'Atestados práctica docencia',87,':1:87:','Carpeta de  atestados de MARITO RIVERA',1516640819,1,0,3,1),(89,'Atestados experiencia en formación',87,':1:87:','Carpeta de  atestados de formación de MARITO RIVERA',1516640819,1,0,3,1),(90,'Atestados manejo de metodologías',87,':1:87:','Carpeta de  atestados de manejos de metodologías de MARITO RIVERA',1516640819,1,0,3,1),(91,'Documentos adjuntos',87,':1:87:','Carpeta de  atestados de MARITO RIVERA',1516640819,1,0,3,1),(92,'Tito Mira',1,':1:','Carpeta de Tito Mira',1516643288,1,1,2,1),(93,'Atestados práctica docencia',92,':1:92:','Carpeta de  atestados de Tito Mira',1516643288,1,0,3,1),(94,'Atestados experiencia en formación',92,':1:92:','Carpeta de  atestados de formación de Tito Mira',1516643288,1,0,3,1),(95,'Atestados manejo de metodologías',92,':1:92:','Carpeta de  atestados de manejos de metodologías de Tito Mira',1516643288,1,0,3,1),(96,'Documentos adjuntos',92,':1:92:','Carpeta de  atestados de Tito Mira',1516643288,1,0,3,1),(97,'Charlie Brown',1,':1:','Carpeta de Charlie Brown',1516659709,1,1,2,1),(98,'Atestados práctica docencia',97,':1:97:','Carpeta de  atestados de Charlie Brown',1516659709,1,0,3,1),(99,'Atestados experiencia en formación',97,':1:97:','Carpeta de  atestados de formación de Charlie Brown',1516659709,1,0,3,1),(100,'Atestados manejo de metodologías',97,':1:97:','Carpeta de  atestados de manejos de metodologías de Charlie Brown',1516659709,1,0,3,1),(101,'Documentos adjuntos',97,':1:97:','Carpeta de  atestados de Charlie Brown',1516659709,1,0,3,1),(102,'David Guetta',1,':1:','Carpeta de David Guetta',1516660086,1,1,2,1),(103,'Atestados práctica docencia',102,':1:102:','Carpeta de  atestados de David Guetta',1516660086,1,0,3,1),(104,'Atestados experiencia en formación',102,':1:102:','Carpeta de  atestados de formación de David Guetta',1516660086,1,0,3,1),(105,'Atestados manejo de metodologías',102,':1:102:','Carpeta de  atestados de manejos de metodologías de David Guetta',1516660086,1,0,3,1),(106,'Documentos adjuntos',102,':1:102:','Carpeta de  atestados de David Guetta',1516660086,1,0,3,1),(107,'Maria del Carmen García',1,':1:','Carpeta de Maria del Carmen García',1516724733,1,1,2,1),(108,'Atestados práctica docencia',107,':1:107:','Carpeta de  atestados de Maria del Carmen García',1516724733,1,0,3,1),(109,'Atestados experiencia en formación',107,':1:107:','Carpeta de  atestados de formación de Maria del Carmen García',1516724733,1,0,3,1),(110,'Atestados manejo de metodologías',107,':1:107:','Carpeta de  atestados de manejos de metodologías de Maria del Carmen García',1516724733,1,0,3,1),(111,'Documentos adjuntos',107,':1:107:','Carpeta de  atestados de Maria del Carmen García',1516724733,1,0,3,1),(112,'Maria del Carmen García',1,':1:','Carpeta de Maria del Carmen García',1516725054,1,1,2,1),(113,'Atestados práctica docencia',112,':1:112:','Carpeta de  atestados de Maria del Carmen García',1516725054,1,0,3,1),(114,'Atestados experiencia en formación',112,':1:112:','Carpeta de  atestados de formación de Maria del Carmen García',1516725054,1,0,3,1),(115,'Atestados manejo de metodologías',112,':1:112:','Carpeta de  atestados de manejos de metodologías de Maria del Carmen García',1516725054,1,0,3,1),(116,'Documentos adjuntos',112,':1:112:','Carpeta de  atestados de Maria del Carmen García',1516725054,1,0,3,1),(117,'Maria del Carmen García312',1,':1:','Carpeta de Maria del Carmen García312',1516725083,1,1,2,1),(118,'Atestados práctica docencia',117,':1:117:','Carpeta de  atestados de Maria del Carmen García312',1516725083,1,0,3,1),(119,'Atestados experiencia en formación',117,':1:117:','Carpeta de  atestados de formación de Maria del Carmen García312',1516725083,1,0,3,1),(120,'Atestados manejo de metodologías',117,':1:117:','Carpeta de  atestados de manejos de metodologías de Maria del Carmen García312',1516725083,1,0,3,1),(121,'Documentos adjuntos',117,':1:117:','Carpeta de  atestados de Maria del Carmen García312',1516725083,1,0,3,1),(122,'Maria del Carmen García3123',1,':1:','Carpeta de Maria del Carmen García3123',1516726095,1,1,2,1),(123,'Atestados práctica docencia',122,':1:122:','Carpeta de  atestados de Maria del Carmen García3123',1516726095,1,0,3,1),(124,'Atestados experiencia en formación',122,':1:122:','Carpeta de  atestados de formación de Maria del Carmen García3123',1516726095,1,0,3,1),(125,'Atestados manejo de metodologías',122,':1:122:','Carpeta de  atestados de manejos de metodologías de Maria del Carmen García3123',1516726095,1,0,3,1),(126,'Documentos adjuntos',122,':1:122:','Carpeta de  atestados de Maria del Carmen García3123',1516726095,1,0,3,1),(127,'',1,':1:','Carpeta de ',1516784119,1,1,2,1),(128,'Atestados práctica docencia',127,':1:127:','Carpeta de  atestados de ',1516784119,1,0,3,1),(129,'Atestados experiencia en formación',127,':1:127:','Carpeta de  atestados de formación de ',1516784119,1,0,3,1),(130,'Atestados manejo de metodologías',127,':1:127:','Carpeta de  atestados de manejos de metodologías de ',1516784119,1,0,3,1),(131,'Documentos adjuntos',127,':1:127:','Carpeta de  atestados de ',1516784119,1,0,3,1),(132,'Mario Leiva',1,':1:','Carpeta de Mario Leiva',1516784354,1,1,2,1),(133,'Atestados práctica docencia',132,':1:132:','Carpeta de  atestados de Mario Leiva',1516784354,1,0,3,1),(134,'Atestados experiencia en formación',132,':1:132:','Carpeta de  atestados de formación de Mario Leiva',1516784354,1,0,3,1),(135,'Atestados manejo de metodologías',132,':1:132:','Carpeta de  atestados de manejos de metodologías de Mario Leiva',1516784354,1,0,3,1),(136,'Documentos adjuntos',132,':1:132:','Carpeta de  atestados de Mario Leiva',1516784354,1,0,3,1),(137,'Zinedine Zidane',1,':1:','Carpeta de Zinedine Zidane',1516833057,1,1,2,1),(138,'Atestados práctica docencia',137,':1:137:','Carpeta de  atestados de Zinedine Zidane',1516833057,1,0,3,1),(139,'Atestados experiencia en formación',137,':1:137:','Carpeta de  atestados de formación de Zinedine Zidane',1516833057,1,0,3,1),(140,'Atestados manejo de metodologías',137,':1:137:','Carpeta de  atestados de manejos de metodologías de Zinedine Zidane',1516833057,1,0,3,1),(141,'Documentos adjuntos',137,':1:137:','Carpeta de  atestados de Zinedine Zidane',1516833057,1,0,3,1),(142,'Aniceto Molina',1,':1:','Carpeta de Aniceto Molina',1516834834,1,1,2,1),(143,'Atestados práctica docencia',142,':1:142:','Carpeta de  atestados de Aniceto Molina',1516834834,1,0,3,1),(144,'Atestados experiencia en formación',142,':1:142:','Carpeta de  atestados de formación de Aniceto Molina',1516834834,1,0,3,1),(145,'Atestados manejo de metodologías',142,':1:142:','Carpeta de  atestados de manejos de metodologías de Aniceto Molina',1516834834,1,0,3,1),(146,'Documentos adjuntos',142,':1:142:','Carpeta de  atestados de Aniceto Molina',1516834834,1,0,3,1),(147,'Thierry Henry',1,':1:','Carpeta de Thierry Henry',1516921649,1,1,2,1),(148,'Atestados práctica docencia',147,':1:147:','Carpeta de  atestados de Thierry Henry',1516921649,1,0,3,1),(149,'Atestados experiencia en formación',147,':1:147:','Carpeta de  atestados de formación de Thierry Henry',1516921649,1,0,3,1),(150,'Atestados manejo de metodologías',147,':1:147:','Carpeta de  atestados de manejos de metodologías de Thierry Henry',1516921649,1,0,3,1),(151,'Documentos adjuntos',147,':1:147:','Carpeta de  atestados de Thierry Henry',1516921649,1,0,3,1),(152,'Diego Maradona',1,':1:','Carpeta de Diego Maradona',1516922113,1,1,2,1),(153,'Atestados práctica docencia',152,':1:152:','Carpeta de  atestados de Diego Maradona',1516922113,1,0,3,1),(154,'Atestados experiencia en formación',152,':1:152:','Carpeta de  atestados de formación de Diego Maradona',1516922113,1,0,3,1),(155,'Atestados manejo de metodologías',152,':1:152:','Carpeta de  atestados de manejos de metodologías de Diego Maradona',1516922113,1,0,3,1),(156,'Documentos adjuntos',152,':1:152:','Carpeta de  atestados de Diego Maradona',1516922113,1,0,3,1),(157,'Manuel Antonio Godinez',1,':1:','Carpeta de Manuel Antonio Godinez',1517340888,1,1,2,1),(158,'Atestados práctica docencia',157,':1:157:','Carpeta de  atestados de Manuel Antonio Godinez',1517340888,1,0,3,1),(159,'Atestados experiencia en formación',157,':1:157:','Carpeta de  atestados de formación de Manuel Antonio Godinez',1517340888,1,0,3,1),(160,'Atestados manejo de metodologías',157,':1:157:','Carpeta de  atestados de manejos de metodologías de Manuel Antonio Godinez',1517340888,1,0,3,1),(161,'Documentos adjuntos',157,':1:157:','Carpeta de  atestados de Manuel Antonio Godinez',1517340888,1,0,3,1),(162,'José M López ',1,':1:','Carpeta de José M López ',1517351763,1,1,2,1),(163,'Atestados práctica docencia',162,':1:162:','Carpeta de  atestados de José M López ',1517351763,1,0,3,1),(164,'Atestados experiencia en formación',162,':1:162:','Carpeta de  atestados de formación de José M López ',1517351763,1,0,3,1),(165,'Atestados manejo de metodologías',162,':1:162:','Carpeta de  atestados de manejos de metodologías de José M López ',1517351763,1,0,3,1),(166,'Documentos adjuntos',162,':1:162:','Carpeta de  atestados de José M López ',1517351763,1,0,3,1),(167,'José M López ',1,':1:','Carpeta de José M López ',1517351858,1,1,2,1),(168,'Atestados práctica docencia',167,':1:167:','Carpeta de  atestados de José M López ',1517351858,1,0,3,1),(169,'Atestados experiencia en formación',167,':1:167:','Carpeta de  atestados de formación de José M López ',1517351858,1,0,3,1),(170,'Atestados manejo de metodologías',167,':1:167:','Carpeta de  atestados de manejos de metodologías de José M López ',1517351858,1,0,3,1),(171,'Documentos adjuntos',167,':1:167:','Carpeta de  atestados de José M López ',1517351858,1,0,3,1),(172,'José M López ',1,':1:','Carpeta de José M López ',1517352411,1,1,2,1),(173,'Atestados práctica docencia',172,':1:172:','Carpeta de  atestados de José M López ',1517352411,1,0,3,1),(174,'Atestados experiencia en formación',172,':1:172:','Carpeta de  atestados de formación de José M López ',1517352411,1,0,3,1),(175,'Atestados manejo de metodologías',172,':1:172:','Carpeta de  atestados de manejos de metodologías de José M López ',1517352411,1,0,3,1),(176,'Documentos adjuntos',172,':1:172:','Carpeta de  atestados de José M López ',1517352411,1,0,3,1),(177,'Juan Antonio Perez',1,':1:','Carpeta de Juan Antonio Perez',1517352609,1,1,2,1),(178,'Atestados práctica docencia',177,':1:177:','Carpeta de  atestados de Juan Antonio Perez',1517352609,1,0,3,1),(179,'Atestados experiencia en formación',177,':1:177:','Carpeta de  atestados de formación de Juan Antonio Perez',1517352609,1,0,3,1),(180,'Atestados manejo de metodologías',177,':1:177:','Carpeta de  atestados de manejos de metodologías de Juan Antonio Perez',1517352609,1,0,3,1),(181,'Documentos adjuntos',177,':1:177:','Carpeta de  atestados de Juan Antonio Perez',1517352609,1,0,3,1),(182,'Juanita Martinez',1,':1:','Carpeta de Juanita Martinez',1517353448,1,1,2,1),(183,'Atestados práctica docencia',182,':1:182:','Carpeta de  atestados de Juanita Martinez',1517353448,1,0,3,1),(184,'Atestados experiencia en formación',182,':1:182:','Carpeta de  atestados de formación de Juanita Martinez',1517353448,1,0,3,1),(185,'Atestados manejo de metodologías',182,':1:182:','Carpeta de  atestados de manejos de metodologías de Juanita Martinez',1517353448,1,0,3,1),(186,'Documentos adjuntos',182,':1:182:','Carpeta de  atestados de Juanita Martinez',1517353448,1,0,3,1),(187,'wwwwwwww ddddddddddd',1,':1:','Carpeta de wwwwwwww ddddddddddd',1517353647,1,1,2,1),(188,'Atestados práctica docencia',187,':1:187:','Carpeta de  atestados de wwwwwwww ddddddddddd',1517353647,1,0,3,1),(189,'Atestados experiencia en formación',187,':1:187:','Carpeta de  atestados de formación de wwwwwwww ddddddddddd',1517353647,1,0,3,1),(190,'Atestados manejo de metodologías',187,':1:187:','Carpeta de  atestados de manejos de metodologías de wwwwwwww ddddddddddd',1517353648,1,0,3,1),(191,'Documentos adjuntos',187,':1:187:','Carpeta de  atestados de wwwwwwww ddddddddddd',1517353648,1,0,3,1),(192,'Manuel Manuelez',1,':1:','Carpeta de Manuel Manuelez',1517385598,1,1,2,1),(193,'Atestados práctica docencia',192,':1:192:','Carpeta de  atestados de Manuel Manuelez',1517385598,1,0,3,1),(194,'Atestados experiencia en formación',192,':1:192:','Carpeta de  atestados de formación de Manuel Manuelez',1517385598,1,0,3,1),(195,'Atestados manejo de metodologías',192,':1:192:','Carpeta de  atestados de manejos de metodologías de Manuel Manuelez',1517385598,1,0,3,1),(196,'Documentos adjuntos',192,':1:192:','Carpeta de  atestados de Manuel Manuelez',1517385598,1,0,3,1),(197,'Rafa Rafales',1,':1:','Carpeta de Rafa Rafales',1517388758,1,1,2,1),(198,'Atestados práctica docencia',197,':1:197:','Carpeta de  atestados de Rafa Rafales',1517388758,1,0,3,1),(199,'Atestados experiencia en formación',197,':1:197:','Carpeta de  atestados de formación de Rafa Rafales',1517388758,1,0,3,1),(200,'Atestados manejo de metodologías',197,':1:197:','Carpeta de  atestados de manejos de metodologías de Rafa Rafales',1517388758,1,0,3,1),(201,'Documentos adjuntos',197,':1:197:','Carpeta de  atestados de Rafa Rafales',1517388758,1,0,3,1),(202,'Aniceto Porsisoca',1,':1:','Carpeta de Aniceto Porsisoca',1517389254,1,1,2,1),(203,'Atestados práctica docencia',202,':1:202:','Carpeta de  atestados de Aniceto Porsisoca',1517389254,1,0,3,1),(204,'Atestados experiencia en formación',202,':1:202:','Carpeta de  atestados de formación de Aniceto Porsisoca',1517389254,1,0,3,1),(205,'Atestados manejo de metodologías',202,':1:202:','Carpeta de  atestados de manejos de metodologías de Aniceto Porsisoca',1517389254,1,0,3,1),(206,'Documentos adjuntos',202,':1:202:','Carpeta de  atestados de Aniceto Porsisoca',1517389254,1,0,3,1),(207,'Alvar Fañez',1,':1:','Carpeta de Alvar Fañez',1517389606,1,1,2,1),(208,'Atestados práctica docencia',207,':1:207:','Carpeta de  atestados de Alvar Fañez',1517389606,1,0,3,1),(209,'Atestados experiencia en formación',207,':1:207:','Carpeta de  atestados de formación de Alvar Fañez',1517389606,1,0,3,1),(210,'Atestados manejo de metodologías',207,':1:207:','Carpeta de  atestados de manejos de metodologías de Alvar Fañez',1517389606,1,0,3,1),(211,'Documentos adjuntos',207,':1:207:','Carpeta de  atestados de Alvar Fañez',1517389606,1,0,3,1),(212,'José Martinez Gonzales',1,':1:','Carpeta de José Martinez Gonzales',1517391512,1,1,2,1),(213,'Atestados práctica docencia',212,':1:212:','Carpeta de  atestados de José Martinez Gonzales',1517391512,1,0,3,1),(214,'Atestados experiencia en formación',212,':1:212:','Carpeta de  atestados de formación de José Martinez Gonzales',1517391512,1,0,3,1),(215,'Atestados manejo de metodologías',212,':1:212:','Carpeta de  atestados de manejos de metodologías de José Martinez Gonzales',1517391512,1,0,3,1),(216,'Documentos adjuntos',212,':1:212:','Carpeta de  atestados de José Martinez Gonzales',1517391512,1,0,3,1),(217,'Aurora Cubías',1,':1:','Carpeta de Aurora Cubías',1517435166,1,1,2,1),(218,'Atestados práctica docencia',217,':1:217:','Carpeta de  atestados de Aurora Cubías',1517435166,1,0,3,1),(219,'Atestados experiencia en formación',217,':1:217:','Carpeta de  atestados de formación de Aurora Cubías',1517435166,1,0,3,1),(220,'Atestados manejo de metodologías',217,':1:217:','Carpeta de  atestados de manejos de metodologías de Aurora Cubías',1517435166,1,0,3,1),(221,'Documentos adjuntos',217,':1:217:','Carpeta de  atestados de Aurora Cubías',1517435166,1,0,3,1),(222,'Eduardo Barrientos',1,':1:','Carpeta de Eduardo Barrientos',1517443627,1,1,2,1),(223,'Atestados práctica docencia',222,':1:222:','Carpeta de  atestados de Eduardo Barrientos',1517443627,1,0,3,1),(224,'Atestados experiencia en formación',222,':1:222:','Carpeta de  atestados de formación de Eduardo Barrientos',1517443627,1,0,3,1),(225,'Atestados manejo de metodologías',222,':1:222:','Carpeta de  atestados de manejos de metodologías de Eduardo Barrientos',1517443627,1,0,3,1),(226,'Documentos adjuntos',222,':1:222:','Carpeta de  atestados de Eduardo Barrientos',1517443627,1,0,3,1),(227,'marito',1,':1:','Carpeta de marito',1517500257,1,1,2,1),(228,'Atestados práctica docencia',227,':1:227:','Carpeta de  atestados de marito',1517500257,1,0,3,1),(229,'Atestados experiencia en formación',227,':1:227:','Carpeta de  atestados de formación de marito',1517500257,1,0,3,1),(230,'Atestados manejo de metodologías',227,':1:227:','Carpeta de  atestados de manejos de metodologías de marito',1517500257,1,0,3,1),(231,'Documentos adjuntos',227,':1:227:','Carpeta de  atestados de marito',1517500257,1,0,3,1),(232,'Brenda Magally García Rivera',1,':1:','Carpeta de Brenda Magally García Rivera',1517506610,1,1,2,1),(233,'Atestados práctica docencia',232,':1:232:','Carpeta de  atestados de Brenda Magally García Rivera',1517506610,1,0,3,1),(234,'Atestados experiencia en formación',232,':1:232:','Carpeta de  atestados de formación de Brenda Magally García Rivera',1517506610,1,0,3,1),(235,'Atestados manejo de metodologías',232,':1:232:','Carpeta de  atestados de manejos de metodologías de Brenda Magally García Rivera',1517506610,1,0,3,1),(236,'Documentos adjuntos',232,':1:232:','Carpeta de  atestados de Brenda Magally García Rivera',1517506610,1,0,3,1),(237,'Perfil de prueba',1,':1:','Carpeta de Perfil de prueba',1517843570,1,1,2,1),(238,'Atestados práctica docencia',237,':1:237:','Carpeta de  atestados de Perfil de prueba',1517843570,1,0,3,1),(239,'Atestados experiencia en formación',237,':1:237:','Carpeta de  atestados de formación de Perfil de prueba',1517843570,1,0,3,1),(240,'Atestados manejo de metodologías',237,':1:237:','Carpeta de  atestados de manejos de metodologías de Perfil de prueba',1517843570,1,0,3,1),(241,'Documentos adjuntos',237,':1:237:','Carpeta de  atestados de Perfil de prueba',1517843570,1,0,3,1),(242,'carlos bertrand',1,':1:','Carpeta de carlos bertrand',1517932706,1,1,2,1),(243,'Atestados práctica docencia',242,':1:242:','Carpeta de  atestados de carlos bertrand',1517932706,1,0,3,1),(244,'Atestados experiencia en formación',242,':1:242:','Carpeta de  atestados de formación de carlos bertrand',1517932706,1,0,3,1),(245,'Atestados manejo de metodologías',242,':1:242:','Carpeta de  atestados de manejos de metodologías de carlos bertrand',1517932706,1,0,3,1),(246,'Documentos adjuntos',242,':1:242:','Carpeta de  atestados de carlos bertrand',1517932706,1,0,3,1),(247,'Jose Manolito Manoloz',1,':1:','Carpeta de Jose Manolito Manoloz',1518465201,1,1,2,1),(248,'Atestados práctica docencia',247,':1:247:','Carpeta de  atestados de Jose Manolito Manoloz',1518465201,1,0,3,1),(249,'Atestados experiencia en formación',247,':1:247:','Carpeta de  atestados de formación de Jose Manolito Manoloz',1518465201,1,0,3,1),(250,'Atestados manejo de metodologías',247,':1:247:','Carpeta de  atestados de manejos de metodologías de Jose Manolito Manoloz',1518465201,1,0,3,1),(251,'Documentos adjuntos',247,':1:247:','Carpeta de  atestados de Jose Manolito Manoloz',1518465201,1,0,3,1),(252,'Manuel Antonio Godinez2',1,':1:','Carpeta de Manuel Antonio Godinez2',1518465322,1,1,2,1),(253,'Atestados práctica docencia',252,':1:252:','Carpeta de  atestados de Manuel Antonio Godinez2',1518465322,1,0,3,1),(254,'Atestados experiencia en formación',252,':1:252:','Carpeta de  atestados de formación de Manuel Antonio Godinez2',1518465322,1,0,3,1),(255,'Atestados manejo de metodologías',252,':1:252:','Carpeta de  atestados de manejos de metodologías de Manuel Antonio Godinez2',1518465322,1,0,3,1),(256,'Documentos adjuntos',252,':1:252:','Carpeta de  atestados de Manuel Antonio Godinez2',1518465322,1,0,3,1),(257,'juanito :)',1,':1:','Carpeta de juanito :)',1518465789,1,1,2,1),(258,'Atestados práctica docencia',257,':1:257:','Carpeta de  atestados de juanito :)',1518465789,1,0,3,1),(259,'Atestados experiencia en formación',257,':1:257:','Carpeta de  atestados de formación de juanito :)',1518465789,1,0,3,1),(260,'Atestados manejo de metodologías',257,':1:257:','Carpeta de  atestados de manejos de metodologías de juanito :)',1518465789,1,0,3,1),(261,'Documentos adjuntos',257,':1:257:','Carpeta de  atestados de juanito :)',1518465789,1,0,3,1),(262,'juanito :)',1,':1:','Carpeta de juanito :)',1518466093,1,1,2,1),(263,'Atestados práctica docencia',262,':1:262:','Carpeta de  atestados de juanito :)',1518466093,1,0,3,1),(264,'Atestados experiencia en formación',262,':1:262:','Carpeta de  atestados de formación de juanito :)',1518466093,1,0,3,1),(265,'Atestados manejo de metodologías',262,':1:262:','Carpeta de  atestados de manejos de metodologías de juanito :)',1518466093,1,0,3,1),(266,'Documentos adjuntos',262,':1:262:','Carpeta de  atestados de juanito :)',1518466093,1,0,3,1),(267,'manolito fiestero',1,':1:','Carpeta de manolito fiestero',1518467016,1,1,2,1),(268,'Atestados práctica docencia',267,':1:267:','Carpeta de  atestados de manolito fiestero',1518467016,1,0,3,1),(269,'Atestados experiencia en formación',267,':1:267:','Carpeta de  atestados de formación de manolito fiestero',1518467016,1,0,3,1),(270,'Atestados manejo de metodologías',267,':1:267:','Carpeta de  atestados de manejos de metodologías de manolito fiestero',1518467016,1,0,3,1),(271,'Documentos adjuntos',267,':1:267:','Carpeta de  atestados de manolito fiestero',1518467016,1,0,3,1);
/*!40000 ALTER TABLE `tblFolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblGroupMembers`
--

DROP TABLE IF EXISTS `tblGroupMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblGroupMembers` (
  `groupID` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `manager` smallint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `groupID` (`groupID`,`userID`),
  KEY `tblGroupMembers_user` (`userID`),
  CONSTRAINT `tblGroupMembers_group` FOREIGN KEY (`groupID`) REFERENCES `tblGroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblGroupMembers_user` FOREIGN KEY (`userID`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblGroupMembers`
--

LOCK TABLES `tblGroupMembers` WRITE;
/*!40000 ALTER TABLE `tblGroupMembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblGroupMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblGroups`
--

DROP TABLE IF EXISTS `tblGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblGroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblGroups`
--

LOCK TABLES `tblGroups` WRITE;
/*!40000 ALTER TABLE `tblGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblKeywordCategories`
--

DROP TABLE IF EXISTS `tblKeywordCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblKeywordCategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `owner` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblKeywordCategories`
--

LOCK TABLES `tblKeywordCategories` WRITE;
/*!40000 ALTER TABLE `tblKeywordCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblKeywordCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblKeywords`
--

DROP TABLE IF EXISTS `tblKeywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblKeywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL DEFAULT '0',
  `keywords` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tblKeywords_category` (`category`),
  CONSTRAINT `tblKeywords_category` FOREIGN KEY (`category`) REFERENCES `tblKeywordCategories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblKeywords`
--

LOCK TABLES `tblKeywords` WRITE;
/*!40000 ALTER TABLE `tblKeywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblKeywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblMandatoryApprovers`
--

DROP TABLE IF EXISTS `tblMandatoryApprovers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblMandatoryApprovers` (
  `userID` int(11) NOT NULL DEFAULT '0',
  `approverUserID` int(11) NOT NULL DEFAULT '0',
  `approverGroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`,`approverUserID`,`approverGroupID`),
  CONSTRAINT `tblMandatoryApprovers_user` FOREIGN KEY (`userID`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMandatoryApprovers`
--

LOCK TABLES `tblMandatoryApprovers` WRITE;
/*!40000 ALTER TABLE `tblMandatoryApprovers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblMandatoryApprovers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblMandatoryReviewers`
--

DROP TABLE IF EXISTS `tblMandatoryReviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblMandatoryReviewers` (
  `userID` int(11) NOT NULL DEFAULT '0',
  `reviewerUserID` int(11) NOT NULL DEFAULT '0',
  `reviewerGroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`,`reviewerUserID`,`reviewerGroupID`),
  CONSTRAINT `tblMandatoryReviewers_user` FOREIGN KEY (`userID`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMandatoryReviewers`
--

LOCK TABLES `tblMandatoryReviewers` WRITE;
/*!40000 ALTER TABLE `tblMandatoryReviewers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblMandatoryReviewers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblNotify`
--

DROP TABLE IF EXISTS `tblNotify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblNotify` (
  `target` int(11) NOT NULL DEFAULT '0',
  `targetType` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '-1',
  `groupID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`target`,`targetType`,`userID`,`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblNotify`
--

LOCK TABLES `tblNotify` WRITE;
/*!40000 ALTER TABLE `tblNotify` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblNotify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblSessions`
--

DROP TABLE IF EXISTS `tblSessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblSessions` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `userID` int(11) NOT NULL DEFAULT '0',
  `lastAccess` int(11) NOT NULL DEFAULT '0',
  `theme` varchar(30) NOT NULL DEFAULT '',
  `language` varchar(30) NOT NULL DEFAULT '',
  `clipboard` text,
  `su` int(11) DEFAULT NULL,
  `splashmsg` text,
  PRIMARY KEY (`id`),
  KEY `tblSessions_user` (`userID`),
  CONSTRAINT `tblSessions_user` FOREIGN KEY (`userID`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblSessions`
--

LOCK TABLES `tblSessions` WRITE;
/*!40000 ALTER TABLE `tblSessions` DISABLE KEYS */;
INSERT INTO `tblSessions` VALUES ('511b9fc38c8e845dd02fd231e77f1252',1,1517868952,'multisis-lte','es_ES',NULL,0,NULL),('a6727b73fa4ffde4ce9233b686b9a35b',1,1517954495,'multisis-lte','es_ES',NULL,0,NULL),('b5c48ddbc959ae32f759a150e1983b7a',1,1518022617,'multisis-lte','es_ES',NULL,0,NULL),('bc5daa4cf4d645f181530570c61b3769',1,1517862100,'multisis-lte','es_ES',NULL,0,NULL),('d2207f1b5b5f041775f4740878754c4f',1,1518025792,'multisis-lte','es_ES',NULL,44,'');
/*!40000 ALTER TABLE `tblSessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUserImages`
--

DROP TABLE IF EXISTS `tblUserImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUserImages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL DEFAULT '0',
  `image` blob NOT NULL,
  `mimeType` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `tblUserImages_user` (`userID`),
  CONSTRAINT `tblUserImages_user` FOREIGN KEY (`userID`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUserImages`
--

LOCK TABLES `tblUserImages` WRITE;
/*!40000 ALTER TABLE `tblUserImages` DISABLE KEYS */;
INSERT INTO `tblUserImages` VALUES (1,3,'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','image/jpeg'),(2,18,'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','image/jpeg'),(3,20,'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','image/jpeg'),(4,1,'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','image/jpeg'),(5,17,'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','image/jpeg'),(6,26,'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','image/jpeg'),(7,35,'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','image/jpeg'),(8,36,'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','image/jpeg'),(9,15,'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','image/jpeg'),(10,44,'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','image/jpeg');
/*!40000 ALTER TABLE `tblUserImages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUserPasswordHistory`
--

DROP TABLE IF EXISTS `tblUserPasswordHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUserPasswordHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL DEFAULT '0',
  `pwd` varchar(50) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tblUserPasswordHistory_user` (`userID`),
  CONSTRAINT `tblUserPasswordHistory_user` FOREIGN KEY (`userID`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUserPasswordHistory`
--

LOCK TABLES `tblUserPasswordHistory` WRITE;
/*!40000 ALTER TABLE `tblUserPasswordHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblUserPasswordHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUserPasswordRequest`
--

DROP TABLE IF EXISTS `tblUserPasswordRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUserPasswordRequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(50) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tblUserPasswordRequest_user` (`userID`),
  CONSTRAINT `tblUserPasswordRequest_user` FOREIGN KEY (`userID`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUserPasswordRequest`
--

LOCK TABLES `tblUserPasswordRequest` WRITE;
/*!40000 ALTER TABLE `tblUserPasswordRequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblUserPasswordRequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUsers`
--

DROP TABLE IF EXISTS `tblUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUsers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `language` varchar(32) NOT NULL,
  `theme` varchar(32) NOT NULL,
  `comment` text NOT NULL,
  `role` smallint(1) NOT NULL DEFAULT '0',
  `hidden` smallint(1) NOT NULL DEFAULT '0',
  `pwdExpiration` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `loginfailures` tinyint(4) NOT NULL DEFAULT '0',
  `disabled` smallint(1) NOT NULL DEFAULT '0',
  `quota` bigint(20) DEFAULT NULL,
  `homefolder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `tblUsers_homefolder` (`homefolder`),
  CONSTRAINT `tblUsers_homefolder` FOREIGN KEY (`homefolder`) REFERENCES `tblFolders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUsers`
--

LOCK TABLES `tblUsers` WRITE;
/*!40000 ALTER TABLE `tblUsers` DISABLE KEYS */;
INSERT INTO `tblUsers` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','Admin ENAFOP','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario administrador de SIGDENAFOP',1,0,'0000-00-00 00:00:00',0,0,0,NULL),(2,'guest',NULL,'Guest User',NULL,'es_ES','multisis-lte','',2,0,'0000-00-00 00:00:00',0,0,0,NULL),(3,'aspirante1','091808fcfe95ad6473dec65aedd05e90','José Mario López Leiva','marioleiva2011@gmail.com','es_ES','multisis-lte','',0,0,'0000-00-00 00:00:00',0,0,0,2),(5,'juanito','091808fcfe95ad6473dec65aedd05e90','Juanito Machuca','j@yahoo.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,1),(12,'aspirante5','091808fcfe95ad6473dec65aedd05e90','Mario García','mario@mario.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,62),(13,'aspirante6','091808fcfe95ad6473dec65aedd05e90','Juan Pérez','aspirante@google.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,67),(14,'aspirante7','091808fcfe95ad6473dec65aedd05e90','Maria Rosa','maria@yahoo.es','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,72),(15,'aspirante8','091808fcfe95ad6473dec65aedd05e90','Juanito Dos','aspirante8@enafop.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,77),(16,'aspirante9','091808fcfe95ad6473dec65aedd05e90','Chema Pérez','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,82),(17,'aspirante10','091808fcfe95ad6473dec65aedd05e90','MARITO RIVERA','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,87),(18,'aspirante11','091808fcfe95ad6473dec65aedd05e90','Tito Mira','tito@google.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,92),(19,'aspirante12','091808fcfe95ad6473dec65aedd05e90','Charlie Brown','j@yahoo.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,97),(20,'aspirante13','091808fcfe95ad6473dec65aedd05e90','David Guetta','mlopez@inno-dev.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,102),(21,'aspirante14','091808fcfe95ad6473dec65aedd05e90','Maria del Carmen García','aspirante14@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,107),(22,'aspirante15','091808fcfe95ad6473dec65aedd05e90','Maria del Carmen García312','aspirante15@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,117),(23,'aspirante16','091808fcfe95ad6473dec65aedd05e90','Maria del Carmen García3123','aspirante16@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,122),(25,'aspirante17','091808fcfe95ad6473dec65aedd05e90','Mario Leiva','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,132),(26,'aspirante18','091808fcfe95ad6473dec65aedd05e90','Zinedine Zidane','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,137),(27,'aspirante19','091808fcfe95ad6473dec65aedd05e90','Aniceto Molina','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,142),(28,'aspirante20','091808fcfe95ad6473dec65aedd05e90','Thierry Henry','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,147),(29,'aspirante21','091808fcfe95ad6473dec65aedd05e90','Diego Maradona','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,152),(30,'aspirante22','091808fcfe95ad6473dec65aedd05e90','Manuel Antonio Godinez','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,157),(31,'aspirante23','091808fcfe95ad6473dec65aedd05e90','José M López ','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,1),(32,'aspirante24','091808fcfe95ad6473dec65aedd05e90','José M López ','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,172),(33,'aspirante26','091808fcfe95ad6473dec65aedd05e90','Juan Antonio Perez','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,177),(34,'aspirante27','091808fcfe95ad6473dec65aedd05e90','Juanita Martinez','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,182),(35,'CualquierCosa','8163d0491a15e1877077365bb634fd9e','Silvia','mlopez@inno-dev.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,187),(36,'aspirante30','091808fcfe95ad6473dec65aedd05e90','Manuel Manuelez','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,192),(37,'aspirante31','091808fcfe95ad6473dec65aedd05e90','Rafa Rafales','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,197),(38,'aspirante32','091808fcfe95ad6473dec65aedd05e90','Aniceto Porsisoca','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,202),(39,'aspirante33','091808fcfe95ad6473dec65aedd05e90','Alvar Fañez','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,207),(40,'jose.martinez','091808fcfe95ad6473dec65aedd05e90','José Martinez Gonzales','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,212),(41,'Aurora Cubías','6c8adc15c10cf3a98327ecb9f5d19c7d','Aurora Cubías','acubias@presidencia.gob.sv','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,217),(42,'jebarrientos','b7626fe60f276ad29fbeefca8cb99336','Eduardo Barrientos','jebarrientos@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,222),(43,'marito','091808fcfe95ad6473dec65aedd05e90','marito','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,227),(44,'bmllyg','fcea920f7412b5da7be0cf42b8c93759','Brenda Magally García Rivera','bgarcia@presidencia.gob.sv','es_ES','multisis-lte','- Especialista Informático\r\nUsuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,232),(45,'Prueba1','fcea920f7412b5da7be0cf42b8c93759','Perfil de prueba','bmllyg@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,237),(46,'aspirante34','091808fcfe95ad6473dec65aedd05e90','carlos bertrand','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,242),(47,'aspirante35','091808fcfe95ad6473dec65aedd05e90','juanito :)','marioleiva2011@gmail.com','es_ES','multisis-lte','Usuario para poder hacer uso del sistema de gestión de docentes de la ENAFOP como postulante',0,0,'0000-00-00 00:00:00',0,0,0,1);
/*!40000 ALTER TABLE `tblUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblVersion`
--

DROP TABLE IF EXISTS `tblVersion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblVersion` (
  `date` datetime DEFAULT NULL,
  `major` smallint(6) DEFAULT NULL,
  `minor` smallint(6) DEFAULT NULL,
  `subminor` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblVersion`
--

LOCK TABLES `tblVersion` WRITE;
/*!40000 ALTER TABLE `tblVersion` DISABLE KEYS */;
INSERT INTO `tblVersion` VALUES ('2017-12-08 09:29:22',5,0,0),('2017-12-08 09:49:16',5,0,0);
/*!40000 ALTER TABLE `tblVersion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblWorkflowActions`
--

DROP TABLE IF EXISTS `tblWorkflowActions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblWorkflowActions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblWorkflowActions`
--

LOCK TABLES `tblWorkflowActions` WRITE;
/*!40000 ALTER TABLE `tblWorkflowActions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblWorkflowActions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblWorkflowDocumentContent`
--

DROP TABLE IF EXISTS `tblWorkflowDocumentContent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblWorkflowDocumentContent` (
  `parentworkflow` int(11) DEFAULT '0',
  `workflow` int(11) DEFAULT NULL,
  `document` int(11) DEFAULT NULL,
  `version` smallint(5) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `tblWorkflowDocument_document` (`document`),
  KEY `tblWorkflowDocument_workflow` (`workflow`),
  KEY `tblWorkflowDocument_state` (`state`),
  CONSTRAINT `tblWorkflowDocument_document` FOREIGN KEY (`document`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblWorkflowDocument_state` FOREIGN KEY (`state`) REFERENCES `tblWorkflowstates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblWorkflowDocument_workflow` FOREIGN KEY (`workflow`) REFERENCES `tblWorkflows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblWorkflowDocumentContent`
--

LOCK TABLES `tblWorkflowDocumentContent` WRITE;
/*!40000 ALTER TABLE `tblWorkflowDocumentContent` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblWorkflowDocumentContent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblWorkflowLog`
--

DROP TABLE IF EXISTS `tblWorkflowLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblWorkflowLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document` int(11) DEFAULT NULL,
  `version` smallint(5) DEFAULT NULL,
  `workflow` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `transition` int(11) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `tblWorkflowLog_document` (`document`),
  KEY `tblWorkflowLog_workflow` (`workflow`),
  KEY `tblWorkflowLog_userid` (`userid`),
  KEY `tblWorkflowLog_transition` (`transition`),
  CONSTRAINT `tblWorkflowLog_document` FOREIGN KEY (`document`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblWorkflowLog_transition` FOREIGN KEY (`transition`) REFERENCES `tblWorkflowTransitions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblWorkflowLog_userid` FOREIGN KEY (`userid`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblWorkflowLog_workflow` FOREIGN KEY (`workflow`) REFERENCES `tblWorkflows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblWorkflowLog`
--

LOCK TABLES `tblWorkflowLog` WRITE;
/*!40000 ALTER TABLE `tblWorkflowLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblWorkflowLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblWorkflowMandatoryWorkflow`
--

DROP TABLE IF EXISTS `tblWorkflowMandatoryWorkflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblWorkflowMandatoryWorkflow` (
  `userid` int(11) DEFAULT NULL,
  `workflow` int(11) DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`,`workflow`),
  KEY `tblWorkflowMandatoryWorkflow_workflow` (`workflow`),
  CONSTRAINT `tblWorkflowMandatoryWorkflow_userid` FOREIGN KEY (`userid`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblWorkflowMandatoryWorkflow_workflow` FOREIGN KEY (`workflow`) REFERENCES `tblWorkflows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblWorkflowMandatoryWorkflow`
--

LOCK TABLES `tblWorkflowMandatoryWorkflow` WRITE;
/*!40000 ALTER TABLE `tblWorkflowMandatoryWorkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblWorkflowMandatoryWorkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblWorkflowTransitionGroups`
--

DROP TABLE IF EXISTS `tblWorkflowTransitionGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblWorkflowTransitionGroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transition` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  `minusers` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tblWorkflowTransitionGroups_transition` (`transition`),
  KEY `tblWorkflowTransitionGroups_groupid` (`groupid`),
  CONSTRAINT `tblWorkflowTransitionGroups_groupid` FOREIGN KEY (`groupid`) REFERENCES `tblGroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblWorkflowTransitionGroups_transition` FOREIGN KEY (`transition`) REFERENCES `tblWorkflowTransitions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblWorkflowTransitionGroups`
--

LOCK TABLES `tblWorkflowTransitionGroups` WRITE;
/*!40000 ALTER TABLE `tblWorkflowTransitionGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblWorkflowTransitionGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblWorkflowTransitionUsers`
--

DROP TABLE IF EXISTS `tblWorkflowTransitionUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblWorkflowTransitionUsers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transition` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tblWorkflowTransitionUsers_transition` (`transition`),
  KEY `tblWorkflowTransitionUsers_userid` (`userid`),
  CONSTRAINT `tblWorkflowTransitionUsers_transition` FOREIGN KEY (`transition`) REFERENCES `tblWorkflowTransitions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblWorkflowTransitionUsers_userid` FOREIGN KEY (`userid`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblWorkflowTransitionUsers`
--

LOCK TABLES `tblWorkflowTransitionUsers` WRITE;
/*!40000 ALTER TABLE `tblWorkflowTransitionUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblWorkflowTransitionUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblWorkflowTransitions`
--

DROP TABLE IF EXISTS `tblWorkflowTransitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblWorkflowTransitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `nextstate` int(11) DEFAULT NULL,
  `maxtime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tblWorkflowTransitions_workflow` (`workflow`),
  KEY `tblWorkflowTransitions_state` (`state`),
  KEY `tblWorkflowTransitions_action` (`action`),
  KEY `tblWorkflowTransitions_nextstate` (`nextstate`),
  CONSTRAINT `tblWorkflowTransitions_action` FOREIGN KEY (`action`) REFERENCES `tblWorkflowActions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblWorkflowTransitions_nextstate` FOREIGN KEY (`nextstate`) REFERENCES `tblWorkflowstates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblWorkflowTransitions_state` FOREIGN KEY (`state`) REFERENCES `tblWorkflowstates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tblWorkflowTransitions_workflow` FOREIGN KEY (`workflow`) REFERENCES `tblWorkflows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblWorkflowTransitions`
--

LOCK TABLES `tblWorkflowTransitions` WRITE;
/*!40000 ALTER TABLE `tblWorkflowTransitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblWorkflowTransitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblWorkflows`
--

DROP TABLE IF EXISTS `tblWorkflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblWorkflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `initstate` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tblWorkflow_initstate` (`initstate`),
  CONSTRAINT `tblWorkflow_initstate` FOREIGN KEY (`initstate`) REFERENCES `tblWorkflowstates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblWorkflows`
--

LOCK TABLES `tblWorkflows` WRITE;
/*!40000 ALTER TABLE `tblWorkflows` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblWorkflows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblWorkflowstates`
--

DROP TABLE IF EXISTS `tblWorkflowstates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblWorkflowstates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `visibility` smallint(5) DEFAULT '0',
  `maxtime` int(11) DEFAULT '0',
  `precondfunc` text,
  `documentstatus` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblWorkflowstates`
--

LOCK TABLES `tblWorkflowstates` WRITE;
/*!40000 ALTER TABLE `tblWorkflowstates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblWorkflowstates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas_abierto`
--

DROP TABLE IF EXISTS `temas_abierto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas_abierto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `nombretema` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `temas_abierto_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas_abierto`
--

LOCK TABLES `temas_abierto` WRITE;
/*!40000 ALTER TABLE `temas_abierto` DISABLE KEYS */;
INSERT INTO `temas_abierto` VALUES (1,12,'Buen gobierno'),(2,12,'Gobierno abierto'),(3,16,'Buen gobierno'),(4,18,'Gobierno abierto'),(5,36,'Buen gobierno'),(6,30,'Participación Ciudadana'),(8,44,'Participación Ciudadana');
/*!40000 ALTER TABLE `temas_abierto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas_calidad`
--

DROP TABLE IF EXISTS `temas_calidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas_calidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `nombretema` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `temas_calidad_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas_calidad`
--

LOCK TABLES `temas_calidad` WRITE;
/*!40000 ALTER TABLE `temas_calidad` DISABLE KEYS */;
INSERT INTO `temas_calidad` VALUES (1,3,'Estrategias de gestión de calidad'),(2,3,'Estrategia de atención e inclusión de voz del usuario'),(3,18,'Estrategias de gestión de calidad'),(4,27,'Trámites de servicios públicos'),(5,44,'Trámites de servicios públicos');
/*!40000 ALTER TABLE `temas_calidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas_capacitacion`
--

DROP TABLE IF EXISTS `temas_capacitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas_capacitacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `nombretema` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `temas_capacitacion_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas_capacitacion`
--

LOCK TABLES `temas_capacitacion` WRITE;
/*!40000 ALTER TABLE `temas_capacitacion` DISABLE KEYS */;
INSERT INTO `temas_capacitacion` VALUES (1,3,'Metodologías de aprendizaje para adultos'),(2,3,'Relación entre capacitación y procesos organizacionales'),(3,3,'Técnicas participativas'),(6,16,'Metodologías de aprendizaje para adultos'),(7,36,'Metodologías de aprendizaje para adultos'),(8,44,'Relación entre capacitación y procesos organizacionales');
/*!40000 ALTER TABLE `temas_capacitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas_electronico`
--

DROP TABLE IF EXISTS `temas_electronico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas_electronico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `nombretema` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `temas_electronico_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas_electronico`
--

LOCK TABLES `temas_electronico` WRITE;
/*!40000 ALTER TABLE `temas_electronico` DISABLE KEYS */;
INSERT INTO `temas_electronico` VALUES (1,16,'Arquitectura de la información'),(2,18,'Liderazgo en tecnologías de la información y las comunicaciones'),(3,27,'Ciber seguridad'),(4,26,'Ciber seguridad'),(5,36,'Firma electrónica'),(6,36,'Diseño de servicios'),(7,39,'Diseño de proyectos de innovación'),(8,40,'Datos abiertos'),(9,28,'Arquitectura de la información'),(10,44,'Datos abiertos'),(11,44,'Protección de datos personales'),(12,45,'Ciber seguridad');
/*!40000 ALTER TABLE `temas_electronico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas_enfoque`
--

DROP TABLE IF EXISTS `temas_enfoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas_enfoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `nombretema` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `temas_enfoque_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas_enfoque`
--

LOCK TABLES `temas_enfoque` WRITE;
/*!40000 ALTER TABLE `temas_enfoque` DISABLE KEYS */;
INSERT INTO `temas_enfoque` VALUES (1,16,'Igualdad e Inclusión en las Políticas Públicas'),(2,15,'Formulación, implementación y evaluación de políticas o programas públicos con enfoque de género'),(3,15,'Diversidad sexual'),(4,44,'Igualdad e Inclusión en las Políticas Públicas'),(5,44,'Formulación, implementación y evaluación de políticas o programas públicos con enfoque de género'),(6,44,'Diversidad sexual'),(7,44,'Mecanismos de Protección de los Derechos Humanos');
/*!40000 ALTER TABLE `temas_enfoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas_etica`
--

DROP TABLE IF EXISTS `temas_etica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas_etica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `nombretema` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `temas_etica_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas_etica`
--

LOCK TABLES `temas_etica` WRITE;
/*!40000 ALTER TABLE `temas_etica` DISABLE KEYS */;
INSERT INTO `temas_etica` VALUES (8,12,'Transparencia pública'),(9,13,'Ética en la gestión pública'),(10,13,'Acceso a información'),(11,18,'Ética en la gestión pública'),(12,26,'Ética en la gestión pública'),(13,26,'Transparencia pública'),(14,37,'Ética en la gestión pública'),(16,44,'Transparencia pública'),(17,45,'Transparencia pública'),(18,45,'Acceso a información'),(19,45,'Rendición de cuentas');
/*!40000 ALTER TABLE `temas_etica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas_gerencia`
--

DROP TABLE IF EXISTS `temas_gerencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas_gerencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `nombretema` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `temas_gerencia_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas_gerencia`
--

LOCK TABLES `temas_gerencia` WRITE;
/*!40000 ALTER TABLE `temas_gerencia` DISABLE KEYS */;
INSERT INTO `temas_gerencia` VALUES (1,3,'Diseño, gestión y evaluación de políticas y/o programas públicos'),(2,28,'Trabajo en equipo'),(3,36,'Liderazgo'),(4,44,'Trabajo en equipo'),(5,44,'Gestión del Cambio');
/*!40000 ALTER TABLE `temas_gerencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas_gobierno`
--

DROP TABLE IF EXISTS `temas_gobierno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas_gobierno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `nombretema` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `temas_gobierno_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas_gobierno`
--

LOCK TABLES `temas_gobierno` WRITE;
/*!40000 ALTER TABLE `temas_gobierno` DISABLE KEYS */;
INSERT INTO `temas_gobierno` VALUES (1,16,'Desconcentración de funciones'),(2,16,'Territorialización de la inversión pública'),(4,44,'Planificación territorial'),(5,44,'Territorialización de políticas públicas'),(6,44,'Descentralización de competencias');
/*!40000 ALTER TABLE `temas_gobierno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas_planificacion`
--

DROP TABLE IF EXISTS `temas_planificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas_planificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `nombretema` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `temas_planificacion_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas_planificacion`
--

LOCK TABLES `temas_planificacion` WRITE;
/*!40000 ALTER TABLE `temas_planificacion` DISABLE KEYS */;
INSERT INTO `temas_planificacion` VALUES (1,16,'Planificación Estratégica'),(2,16,'Formulación y evaluación de proyectos de inversión pública'),(3,16,'Presupuesto orientado por resultados'),(4,36,'Planificación operativa'),(6,3,'Planificación operativa'),(8,44,'Formulación y evaluación de proyectos de inversión pública');
/*!40000 ALTER TABLE `temas_planificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas_relaciones`
--

DROP TABLE IF EXISTS `temas_relaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas_relaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `nombretema` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `temas_relaciones_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas_relaciones`
--

LOCK TABLES `temas_relaciones` WRITE;
/*!40000 ALTER TABLE `temas_relaciones` DISABLE KEYS */;
INSERT INTO `temas_relaciones` VALUES (1,13,'Derecho sustantivo de las relaciones laborales'),(2,16,'Negociación como proceso'),(3,26,'Derecho colectivo en el sector público'),(4,26,'Negociación como proceso'),(5,38,'Derecho sustantivo de las relaciones laborales'),(6,38,'Derecho colectivo en el sector público'),(7,38,'Transformación de conflictos y negociación'),(8,44,'Derecho colectivo en el sector público');
/*!40000 ALTER TABLE `temas_relaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas_talento`
--

DROP TABLE IF EXISTS `temas_talento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas_talento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `nombretema` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  CONSTRAINT `temas_talento_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas_talento`
--

LOCK TABLES `temas_talento` WRITE;
/*!40000 ALTER TABLE `temas_talento` DISABLE KEYS */;
INSERT INTO `temas_talento` VALUES (1,12,'Integración del talento humano'),(2,44,'Planeación estratégica del talento humano'),(3,44,'Integración del talento humano'),(4,44,'Gestión del desarrollo profesional'),(5,44,'Entrevista de incidentes críticos'),(6,44,'Planes de carrera'),(7,44,'Mapas de competencia'),(8,44,'Inteligencia emocional y desarrollo de la calidad humana');
/*!40000 ALTER TABLE `temas_talento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulos_grado`
--

DROP TABLE IF EXISTS `titulos_grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulos_grado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `nombretitulo` varchar(140) DEFAULT NULL,
  `ano` varchar(4) DEFAULT NULL,
  `institucion` varchar(400) DEFAULT NULL,
  `idatestado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  KEY `idatestado` (`idatestado`),
  CONSTRAINT `titulos_grado_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `titulos_grado_ibfk_2` FOREIGN KEY (`idatestado`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulos_grado`
--

LOCK TABLES `titulos_grado` WRITE;
/*!40000 ALTER TABLE `titulos_grado` DISABLE KEYS */;
INSERT INTO `titulos_grado` VALUES (1,3,'Ingeniero','ingeniero informático','2017','ETSIINF',174),(2,12,'Doctor','medico','2011','UGB',193),(3,13,'Licenciado','LIC EN LETRAS','2013','UES',200),(4,16,'Bachiller','INGENIERO EN EDIFICIOS','2012','DON BOSCO',204),(5,26,'Bachiller','Experto en fútbol','2008','La sorbonne',217),(7,26,'Doctor','Doctorrazo','2005','NACIONAL',227),(8,26,'Ingeniero','ingeniero electricista','2014','Universidad de la Frontera',229),(9,35,'Bachiller','231321','2017','3123d',259),(10,36,'Ingeniero','ingeniero electrónico','2011','UGB',262),(11,38,'Licenciado','licenciado en carros','2016','Universidad de la Vida',280),(12,40,'Bachiller','br de la república','2014','república de brasil',286),(13,30,'Ingeniero','ingeniero de caminos','2009','san benito',291),(14,41,'Licenciado','Relaciones Internacionales','2008','XXXX',296),(15,44,'Licenciado','Ciencias de la Computación','2011','Universidad Centroamericana \"José Simeón Cañas\" (UCA)',301),(16,45,'Bachiller','Industrial','2008','UCA',307);
/*!40000 ALTER TABLE `titulos_grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulos_otros`
--

DROP TABLE IF EXISTS `titulos_otros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulos_otros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `nombretitulo` varchar(140) DEFAULT NULL,
  `ano` varchar(4) DEFAULT NULL,
  `institucion` varchar(400) DEFAULT NULL,
  `idatestado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  KEY `idatestado` (`idatestado`),
  CONSTRAINT `titulos_otros_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `titulos_otros_ibfk_2` FOREIGN KEY (`idatestado`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulos_otros`
--

LOCK TABLES `titulos_otros` WRITE;
/*!40000 ALTER TABLE `titulos_otros` DISABLE KEYS */;
INSERT INTO `titulos_otros` VALUES (3,12,'Otro','master','2010','UES',195),(4,29,'Otro','Doctorado en futbol','2000','BOCA',224),(5,26,'Otro','Estilista','2004','hair and makeup',234),(6,26,'Otro','Peluquero23','2009','valvidieso salon',235),(7,36,'Otro','técnico en redes informáticas','2004','UTEC',264),(8,36,'Otro','tecnico en neveras y refris','2018','don bosco',272),(9,41,'Otro','ACCESO A INFORMACIÓN','2007','trust',298),(10,44,'Otro','Estadística y Análisis de Datos','2017','Universidad de Harbin',303);
/*!40000 ALTER TABLE `titulos_otros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulos_posgrado`
--

DROP TABLE IF EXISTS `titulos_posgrado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulos_posgrado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idpostulante` int(11) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `nombretitulo` varchar(140) DEFAULT NULL,
  `ano` varchar(4) DEFAULT NULL,
  `institucion` varchar(400) DEFAULT NULL,
  `idatestado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpostulante` (`idpostulante`),
  KEY `idatestado` (`idatestado`),
  CONSTRAINT `titulos_posgrado_ibfk_1` FOREIGN KEY (`idpostulante`) REFERENCES `tblUsers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `titulos_posgrado_ibfk_2` FOREIGN KEY (`idatestado`) REFERENCES `tblDocuments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulos_posgrado`
--

LOCK TABLES `titulos_posgrado` WRITE;
/*!40000 ALTER TABLE `titulos_posgrado` DISABLE KEYS */;
INSERT INTO `titulos_posgrado` VALUES (1,3,'Máster','MASTER EN IT','2010','UPV',175),(2,12,'Doctorado','ingeniero','2001','UCA',194),(3,18,'Doctorado','Doctorísimo','2002','UVAMEXICO',209),(4,26,'Máster','super lic','2016','utadeo',228),(6,26,'Otro','doctor en letras2','2002','UNICOLOMBIAn',233),(7,36,'Doctorado','dr. en letras','2017','UES',263),(8,29,'Doctorado','dr en futbol','2000','boca juniors',279),(9,38,'Máster','máster en risa','2018','uvap',284),(10,41,'Doctorado','Transparencia','2011','SSTA',297),(11,44,'Otro','Finanzas para no financieros','2013','UCA',302);
/*!40000 ALTER TABLE `titulos_posgrado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-12 14:28:00
