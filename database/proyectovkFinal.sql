-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyectovk
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amistad`
--

DROP TABLE IF EXISTS `amistad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amistad` (
  `IdAmistad` int NOT NULL AUTO_INCREMENT,
  `IdUsuario` int NOT NULL,
  `IdAmigo` int NOT NULL,
  `estado` enum('PENDIENTE','ACEPTADO','RECHAZADO','BLOQUEADO') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'PENDIENTE',
  `fecha_aceptacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdAmistad`),
  UNIQUE KEY `unique_amigos` (`IdUsuario`,`IdAmigo`),
  KEY `fk_AMISTAD_USUARIO2` (`IdAmigo`),
  CONSTRAINT `fk_AMISTAD_USUARIO1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_AMISTAD_USUARIO2` FOREIGN KEY (`IdAmigo`) REFERENCES `usuario` (`IdUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amistad`
--

LOCK TABLES `amistad` WRITE;
/*!40000 ALTER TABLE `amistad` DISABLE KEYS */;
INSERT INTO `amistad` VALUES (1,1,2,'ACEPTADO','2025-11-23 22:15:35'),(2,3,2,'ACEPTADO','2025-11-24 12:12:52'),(3,2,1,'ACEPTADO','2025-11-24 13:15:56'),(4,2,3,'ACEPTADO','2025-11-24 13:39:45'),(5,4,2,'ACEPTADO','2025-11-24 13:46:29'),(6,2,4,'ACEPTADO','2025-11-24 22:17:25'),(7,5,2,'ACEPTADO','2025-11-25 00:47:58'),(8,2,5,'ACEPTADO','2025-11-25 00:57:41'),(9,10,2,'ACEPTADO','2025-11-25 01:02:56'),(10,8,2,'ACEPTADO','2025-11-25 01:03:18'),(11,2,10,'ACEPTADO','2025-11-25 01:03:29'),(12,2,8,'ACEPTADO','2025-11-25 01:05:32'),(13,7,2,'ACEPTADO','2025-11-25 01:10:11'),(14,2,7,'ACEPTADO','2025-11-25 01:10:32'),(15,12,2,'RECHAZADO','2025-11-25 01:11:50'),(16,9,2,'ACEPTADO','2025-11-25 08:53:40'),(17,2,9,'ACEPTADO','2025-11-25 08:54:12'),(18,2,15,'PENDIENTE','2025-11-29 20:25:13'),(20,2,6,'PENDIENTE','2025-11-29 20:35:46'),(22,5,1,'ACEPTADO','2025-11-29 20:38:05'),(23,5,3,'PENDIENTE','2025-11-29 20:38:21'),(25,2,13,'PENDIENTE','2025-11-29 20:54:35'),(26,1,5,'ACEPTADO','2025-12-02 14:16:18'),(27,4,1,'ACEPTADO','2025-12-02 14:20:22'),(28,1,4,'ACEPTADO','2025-12-02 14:20:59'),(29,10,5,'ACEPTADO','2025-12-07 12:58:01'),(30,5,10,'ACEPTADO','2025-12-07 12:58:09'),(31,6,5,'ACEPTADO','2025-12-14 10:36:53'),(32,5,6,'ACEPTADO','2025-12-14 10:37:43'),(33,2,14,'PENDIENTE','2025-12-14 11:19:04'),(34,5,7,'PENDIENTE','2025-12-14 11:25:44'),(35,16,1,'ACEPTADO','2025-12-15 14:28:53'),(36,16,2,'RECHAZADO','2025-12-15 14:48:34'),(37,5,16,'ACEPTADO','2025-12-15 15:01:38'),(38,16,5,'ACEPTADO','2025-12-15 15:02:11'),(39,2,16,'ACEPTADO','2025-12-27 17:42:21'),(40,17,2,'ACEPTADO','2026-01-01 20:46:04'),(41,2,17,'ACEPTADO','2026-01-01 20:47:10'),(42,1,16,'ACEPTADO','2026-01-04 13:07:16'),(43,18,2,'PENDIENTE','2026-01-04 13:16:22'),(44,18,1,'ACEPTADO','2026-01-04 13:23:58'),(45,1,18,'ACEPTADO','2026-01-04 13:24:11'),(46,1,20,'ACEPTADO','2026-01-04 13:47:50'),(47,20,1,'ACEPTADO','2026-01-04 14:04:01');
/*!40000 ALTER TABLE `amistad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biblioteca`
--

DROP TABLE IF EXISTS `biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biblioteca` (
  `IdBiblioteca` int NOT NULL AUTO_INCREMENT,
  `IdUsuario` int NOT NULL,
  `fechaAdquisicion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdBiblioteca`),
  UNIQUE KEY `IdUsuario` (`IdUsuario`),
  KEY `fk_BIBLIOTECA_USUARIO` (`IdUsuario`),
  CONSTRAINT `fk_BIBLIOTECA_USUARIO` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biblioteca`
--

LOCK TABLES `biblioteca` WRITE;
/*!40000 ALTER TABLE `biblioteca` DISABLE KEYS */;
INSERT INTO `biblioteca` VALUES (1,1,'2025-11-23 15:05:57'),(2,2,'2025-11-23 15:07:17'),(3,3,'2025-11-24 12:12:22'),(4,4,'2025-11-24 13:45:52'),(5,5,'2025-11-25 00:45:17'),(6,6,'2025-11-25 01:02:42'),(7,7,'2025-11-25 01:02:42'),(8,8,'2025-11-25 01:02:42'),(9,9,'2025-11-25 01:02:42'),(10,10,'2025-11-25 01:02:42'),(11,11,'2025-11-25 01:02:42'),(12,12,'2025-11-25 01:02:42'),(13,13,'2025-11-25 01:02:42'),(14,14,'2025-11-25 01:02:42'),(15,15,'2025-11-25 01:02:42'),(16,16,'2025-12-15 11:33:14'),(17,17,'2026-01-01 20:44:54'),(18,18,'2026-01-04 13:16:01'),(19,19,'2026-01-04 13:45:03'),(20,20,'2026-01-04 13:47:22');
/*!40000 ALTER TABLE `biblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `IdCarrito` int NOT NULL AUTO_INCREMENT,
  `IdUsuario` int NOT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IdCarrito`),
  UNIQUE KEY `IdUsuario` (`IdUsuario`),
  KEY `fk_CARRITO_USUARIO` (`IdUsuario`),
  CONSTRAINT `fk_CARRITO_USUARIO` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (1,1,'2025-11-23 15:05:57'),(2,2,'2025-11-23 15:07:17'),(3,3,'2025-11-24 12:12:22'),(4,4,'2025-11-24 13:45:52'),(5,5,'2025-11-25 00:45:17'),(6,6,'2025-11-25 01:02:42'),(7,7,'2025-11-25 01:02:42'),(8,8,'2025-11-25 01:02:42'),(9,9,'2025-11-25 01:02:42'),(10,10,'2025-11-25 01:02:42'),(11,11,'2025-11-25 01:02:42'),(12,12,'2025-11-25 01:02:42'),(13,13,'2025-11-25 01:02:42'),(14,14,'2025-11-25 01:02:42'),(15,15,'2025-11-25 01:02:42'),(16,16,'2025-12-15 11:33:14'),(17,17,'2026-01-01 20:44:54'),(18,18,'2026-01-04 13:16:01'),(19,19,'2026-01-04 13:45:03'),(20,20,'2026-01-04 13:47:22');
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `IdCategoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `abreviatura` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Acción','ACC'),(2,'Aventura','ADV'),(3,'RPG','RPG'),(4,'Estrategia','EST'),(5,'Shooter','SHT'),(6,'Indie','IND'),(7,'Deportes','DEP'),(8,'Simulación','SIM'),(9,'Carreras','CAR'),(10,'Mundo Abierto','MAP'),(11,'Supervivencia','SUR'),(12,'Horror','HOR'),(13,'Puzzle','PUZ'),(14,'Casual','CAS'),(15,'Plataformas','PLT');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `IdCompra` int NOT NULL AUTO_INCREMENT,
  `IdUsuario` int NOT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) NOT NULL,
  `metodo_pago` enum('Billetera','Tarjeta') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Billetera',
  PRIMARY KEY (`IdCompra`),
  KEY `fk_COMPRA_USUARIO` (`IdUsuario`),
  CONSTRAINT `fk_COMPRA_USUARIO` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,'2025-11-23 16:55:08',342.00,'Billetera'),(2,1,'2025-11-23 17:19:56',228.00,'Billetera'),(3,1,'2025-11-23 17:21:13',152.00,'Billetera'),(4,2,'2025-11-23 17:22:28',0.00,'Billetera'),(5,4,'2025-12-02 14:15:12',0.00,'Billetera'),(6,2,'2025-12-07 19:52:18',152.00,'Billetera'),(7,2,'2025-12-07 19:56:47',152.00,'Billetera'),(8,5,'2025-12-07 21:10:23',100.00,'Tarjeta'),(9,2,'2025-12-08 21:26:28',228.00,'Billetera'),(10,2,'2025-12-14 08:35:22',418.00,'Billetera'),(11,2,'2025-12-14 08:55:31',0.00,'Tarjeta'),(12,2,'2025-12-14 08:56:32',228.00,'Tarjeta'),(13,2,'2025-12-14 08:57:17',152.00,'Tarjeta'),(14,2,'2025-12-14 09:09:02',228.00,'Tarjeta'),(15,2,'2025-12-14 09:15:55',0.00,'Tarjeta'),(16,2,'2025-12-14 09:47:34',0.00,'Tarjeta'),(17,5,'2025-12-14 10:37:26',0.00,'Billetera'),(18,16,'2025-12-15 15:04:18',0.00,'Tarjeta'),(19,16,'2025-12-15 15:04:47',0.00,'Tarjeta'),(20,2,'2025-12-27 17:40:02',114.00,'Tarjeta'),(21,16,'2025-12-29 22:43:11',646.00,'Tarjeta'),(22,2,'2026-01-01 20:43:10',418.00,'Tarjeta'),(23,18,'2026-01-04 13:21:45',228.00,'Tarjeta'),(24,18,'2026-01-04 13:23:00',228.00,'Tarjeta'),(25,18,'2026-01-04 13:23:22',114.00,'Tarjeta'),(26,1,'2026-01-04 14:53:01',228.00,'Billetera'),(27,1,'2026-01-04 14:59:26',190.00,'Billetera'),(28,1,'2026-01-04 16:51:18',304.00,'Tarjeta'),(29,20,'2026-01-04 17:03:21',0.00,'Tarjeta'),(30,1,'2026-01-04 17:47:31',1064.00,'Tarjeta'),(31,1,'2026-01-04 17:48:04',228.00,'Billetera'),(32,1,'2026-01-04 17:50:10',152.00,'Tarjeta'),(33,1,'2026-01-04 17:53:12',152.00,'Tarjeta'),(34,1,'2026-01-04 17:54:20',228.00,'Tarjeta'),(35,1,'2026-01-04 17:56:01',76.00,'Tarjeta'),(36,1,'2026-01-04 17:57:13',38.00,'Tarjeta');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creador`
--

DROP TABLE IF EXISTS `creador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creador` (
  `IdCreador` int NOT NULL AUTO_INCREMENT,
  `desarrollador` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nacionalidad` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`IdCreador`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creador`
--

LOCK TABLES `creador` WRITE;
/*!40000 ALTER TABLE `creador` DISABLE KEYS */;
INSERT INTO `creador` VALUES (1,'Valve','Estados Unidos'),(2,'CD Projekt Red','Polonia'),(3,'Ubisoft','Francia'),(4,'Bethesda','Estados Unidos'),(5,'Rockstar Games','Estados Unidos'),(6,'Electronic Arts','Estados Unidos'),(7,'FromSoftware','Japón'),(8,'Capcom','Japón'),(9,'SEGA','Japón'),(10,'Square Enix','Japón'),(11,'CD Projekt Vancouver','Canadá'),(12,'id Software','Estados Unidos'),(13,'Bungie','Estados Unidos'),(14,'Blizzard','Estados Unidos'),(15,'2K Games','Estados Unidos'),(16,'Activision','Estados Unidos'),(17,'IO Interactive','Dinamarca'),(18,'Paradox Interactive','Suecia'),(19,'Larian Studios','Bélgica'),(20,'Croteam','Croacia'),(21,'Mojang','Suecia'),(22,'Ironmace','Corea'),(23,'Konami','Japón'),(24,'Bandai Namco','Japón'),(25,'Techland','Polonia'),(26,'Facepunch Studios','Reino Unido'),(27,'Hello Games','Reino Unido'),(28,'Klei Entertainment','Canadá'),(29,'Obsidian Entertainment','Estados Unidos'),(30,'Nintendo','Japón'),(31,'Remedy Entertainment','Finlandia'),(32,'Crytek','Alemania'),(33,'Playdead','Dinamarca'),(34,'Coffee Stain','Suecia'),(35,'Oxide Games','Estados Unidos'),(36,'505 Games','Italia'),(37,'Devolver Digital','Estados Unidos'),(38,'TinyBuild','Estados Unidos'),(39,'Fntastic','Rusia'),(40,'Endnight Games','Canadá'),(41,'Relic Entertainment','Canadá'),(42,'Criterion Games','Reino Unido'),(43,'Microsoft Studios','Estados Unidos'),(44,'Riot Games','Estados Unidos'),(45,'PlayStation Studios','Japón'),(46,'Telltale Games','Estados Unidos'),(47,'Warner Bros Games','Estados Unidos'),(48,'Skydance Interactive','Estados Unidos'),(49,'Red Hook Studios','Canadá'),(50,'Gearbox Software','Estados Unidos');
/*!40000 ALTER TABLE `creador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_biblioteca`
--

DROP TABLE IF EXISTS `detalle_biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_biblioteca` (
  `idDetBiblioteca` int NOT NULL AUTO_INCREMENT,
  `idVideojuego` int NOT NULL,
  `idBiblioteca` int NOT NULL,
  PRIMARY KEY (`idDetBiblioteca`),
  KEY `fk_detalle_biblioteca_videojuego1_idx` (`idVideojuego`),
  KEY `fk_detalle_biblioteca_biblioteca1_idx` (`idBiblioteca`),
  CONSTRAINT `fk_detalle_biblioteca_biblioteca1` FOREIGN KEY (`idBiblioteca`) REFERENCES `biblioteca` (`IdBiblioteca`),
  CONSTRAINT `fk_detalle_biblioteca_videojuego1` FOREIGN KEY (`idVideojuego`) REFERENCES `videojuego` (`idVideojuego`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_biblioteca`
--

LOCK TABLES `detalle_biblioteca` WRITE;
/*!40000 ALTER TABLE `detalle_biblioteca` DISABLE KEYS */;
INSERT INTO `detalle_biblioteca` VALUES (1,3,1),(2,8,1),(4,5,1),(5,7,1),(6,1,2),(7,2,2),(9,1,4),(10,2,4),(12,4,2),(13,7,2),(14,5,2),(15,3,2),(16,6,2),(18,19,2),(19,22,2),(20,15,2),(21,11,2),(22,1,16),(23,2,16),(24,8,2),(25,17,16),(26,3,16),(27,22,16),(28,13,2),(29,17,2),(31,1,18),(32,3,18),(34,5,18),(35,8,18),(36,15,1),(37,25,1),(38,1,1),(39,17,1),(40,11,1),(41,21,1),(42,16,1),(43,2,20),(44,2,1),(45,6,1),(46,18,1),(47,19,1),(48,35,1),(49,36,1),(50,37,1),(51,39,1),(52,38,1),(59,26,1),(60,4,1),(61,34,1),(62,30,1),(63,29,1),(64,41,1);
/*!40000 ALTER TABLE `detalle_biblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_carrito`
--

DROP TABLE IF EXISTS `detalle_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_carrito` (
  `IdDetCarrito` int NOT NULL AUTO_INCREMENT,
  `IdCarrito` int NOT NULL,
  `IdVideojuego` int NOT NULL,
  PRIMARY KEY (`IdDetCarrito`),
  KEY `fk_DETALLE_CARRITO_CARRITO` (`IdCarrito`),
  KEY `fk_DETALLE_CARRITO_VIDEOJUEGO` (`IdVideojuego`),
  CONSTRAINT `fk_DETALLE_CARRITO_CARRITO` FOREIGN KEY (`IdCarrito`) REFERENCES `carrito` (`IdCarrito`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DETALLE_CARRITO_VIDEOJUEGO` FOREIGN KEY (`IdVideojuego`) REFERENCES `videojuego` (`idVideojuego`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_carrito`
--

LOCK TABLES `detalle_carrito` WRITE;
/*!40000 ALTER TABLE `detalle_carrito` DISABLE KEYS */;
INSERT INTO `detalle_carrito` VALUES (75,18,2),(77,20,4);
/*!40000 ALTER TABLE `detalle_carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `IdDetCompra` int NOT NULL AUTO_INCREMENT,
  `IdCompra` int NOT NULL,
  `IdVideojuego` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IdDetCompra`),
  KEY `fk_DETALLE_COMPRA_COMPRA` (`IdCompra`),
  KEY `fk_DETALLE_COMPRA_VIDEOJUEGO` (`IdVideojuego`),
  CONSTRAINT `fk_DETALLE_COMPRA_COMPRA` FOREIGN KEY (`IdCompra`) REFERENCES `compra` (`IdCompra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DETALLE_COMPRA_VIDEOJUEGO` FOREIGN KEY (`IdVideojuego`) REFERENCES `videojuego` (`idVideojuego`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (1,1,3,228.00),(2,1,8,114.00),(4,2,5,228.00),(5,3,7,152.00),(6,4,1,0.00),(7,4,2,0.00),(9,5,1,0.00),(10,5,2,0.00),(12,6,4,152.00),(13,7,7,152.00),(14,9,5,228.00),(15,10,3,228.00),(16,10,6,190.00),(18,11,19,0.00),(19,12,22,228.00),(20,13,15,152.00),(21,14,11,228.00),(22,18,1,0.00),(23,19,2,0.00),(24,20,8,114.00),(25,21,17,190.00),(26,21,3,228.00),(27,21,22,228.00),(28,22,13,228.00),(29,22,17,190.00),(31,23,1,0.00),(32,23,3,228.00),(34,24,5,228.00),(35,25,8,114.00),(36,26,15,152.00),(37,26,25,76.00),(38,26,1,0.00),(39,27,17,190.00),(40,28,11,228.00),(41,28,21,0.00),(42,28,16,76.00),(43,29,2,0.00),(44,30,2,0.00),(45,30,6,190.00),(46,30,18,152.00),(47,30,19,0.00),(48,30,35,38.00),(49,30,36,152.00),(50,30,37,228.00),(51,30,39,152.00),(52,30,38,152.00),(59,31,26,228.00),(60,32,4,152.00),(61,33,34,152.00),(62,34,30,228.00),(63,35,29,76.00),(64,36,41,38.00);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta` (
  `idTarjeta` int NOT NULL AUTO_INCREMENT,
  `numeroTarjeta` varchar(255) NOT NULL,
  `titular` varchar(100) NOT NULL,
  `fechaVencimiento` varchar(10) NOT NULL,
  `ultimos4` varchar(4) NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idTarjeta`),
  KEY `fk_tarjeta_usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_tarjeta_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`IdUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
INSERT INTO `tarjeta` VALUES (2,'1515151515151515','carlos adadssd','2/2026','1515',2),(3,'1515151515151515','kiarita uwu','1/2025','1515',16),(4,'6545313846131351515','David Abanto','2/2026','1515',18),(5,'8526459778523688213','klissman solano','5/2028','8213',1),(6,'2333334444444444444','asdsad asdasd','--/----','4444',20);
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `IdUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nombre_completo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `saldo` decimal(10,2) DEFAULT '0.00',
  `rol` enum('ADMIN','USUARIO') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'USUARIO',
  `estado` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'ACTIVO',
  `descripcion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `localidad` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pais` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `avatar` varchar(100) DEFAULT 'default.jpg',
  PRIMARY KEY (`IdUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'SCKlissman','2025-11-23 20:05:57','65ccd4e3f43819a147c34ffc35420122','Mark Klissman Solano Cajas','msolanocajas@gmail.com',474.00,'USUARIO','ACTIVO','hola',NULL,'lima','Perú','avatar3.jpg'),(2,'Naive10','2025-11-23 20:07:17','ccee5504c9d889922b101124e9e43b71','Carlos Andre Ramirez Cachique','tepsulospu@necub.com',225.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'avatar6.jpg'),(3,'max','2025-11-24 17:12:22','d1696816bc1a7afe92f1c8787ac222c3','MaxRios','max@email.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(4,'andre','2025-11-24 18:45:52','dd573120e473c889140e34e817895495','andrevasques','andre@email.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(5,'kiara','2025-11-25 05:45:17','e35bbb75f9cfb5d6bafbc4454c722b02','kira','kra@email.com',15.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'avatar3.jpg'),(6,'jtorres','2025-11-25 06:02:42','32250170a0dca92d53ec9624f336ca24','Juan Torres','juan.torres@example.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(7,'mlopez','2025-11-25 06:02:42','b984fe77863037ddeb9be2ad7dfb246e','María López','maria.lopez@example.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(8,'cgarcia','2025-11-25 06:02:42','2cb42f8734ea607eefed3b70af13bbd3','Carlos García','carlos.garcia@example.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(9,'arodriguez','2025-11-25 06:02:42','fc0eb7dfd906fe6eed8be6a3fb7c4bf7','Ana Rodríguez','ana.rodriguez@example.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(10,'psalinas','2025-11-25 06:02:42','d6b0ab7f1c8ab8f514db9a6d85de160a','Pedro Salinas','pedro.salinas@example.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(11,'kramirez','2025-11-25 06:02:42','aa2a117edb7d2b52611d7b1795f936d3','Karla Ramírez','karla.ramirez@example.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(12,'fjimenez','2025-11-25 06:02:42','5af964bd996a62cb5d04f2b72157d156','Francisco Jiménez','francisco.jimenez@example.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(13,'lquintero','2025-11-25 06:02:42','df3a98fa83e2980ee1f2f233f8bfb8d2','Lucía Quintero','lucia.quintero@example.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(14,'rmedina','2025-11-25 06:02:42','4fa052d6a51f9a5d3f08da7c2e19ac02','Roberto Medina','roberto.medina@example.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(15,'dcastillo','2025-11-25 06:02:42','69116862ec7e59874a9d3de1c9c2f948','Daniela Castillo','daniela.castillo@example.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(16,'Naive','2025-12-15 16:33:14','37038d43fe39c4fb7553bf982e3ff755','CARLOS RAMIREZ','hola@email.com',1000.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(17,'Nayu10','2026-01-02 01:44:54','ccee5504c9d889922b101124e9e43b71','BAYUMI GONZALES','nayu@gmail.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(18,'david','2026-01-04 18:16:01','55fc5b709962876903785fd64a6961e5','sdf sdf','david@gmail.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(19,'anthony','2026-01-04 18:45:03','74bf0167beaaf267fc1211dc3b42bb93','anthony sandoval','anthony@gmail.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'default.jpg'),(20,'usuario1','2026-01-04 18:47:22','0e7af1c75730aa1184fa928dae1bdf8e','asd asd','asd@gmail.com',0.00,'USUARIO','ACTIVO',NULL,NULL,NULL,NULL,'avatar2.jpg');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_videojuego_estado`
--

DROP TABLE IF EXISTS `usuario_videojuego_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_videojuego_estado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `IdUsuario` int NOT NULL,
  `idVideojuego` int NOT NULL,
  `estado` enum('Disponible','Carrito','Biblioteca') DEFAULT 'Disponible',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uve_unique` (`IdUsuario`,`idVideojuego`),
  KEY `fk_usuario_videojuego_estado_videojuego1_idx` (`idVideojuego`),
  KEY `fk_usuario_videojuego_estado_usuario1_idx` (`IdUsuario`),
  CONSTRAINT `fk_usuario_videojuego_estado_usuario1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`),
  CONSTRAINT `fk_usuario_videojuego_estado_videojuego1` FOREIGN KEY (`idVideojuego`) REFERENCES `videojuego` (`idVideojuego`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_videojuego_estado`
--

LOCK TABLES `usuario_videojuego_estado` WRITE;
/*!40000 ALTER TABLE `usuario_videojuego_estado` DISABLE KEYS */;
INSERT INTO `usuario_videojuego_estado` VALUES (1,1,1,'Biblioteca'),(2,1,2,'Biblioteca'),(3,1,3,'Biblioteca'),(4,2,2,'Biblioteca'),(5,1,8,'Biblioteca'),(6,2,1,'Biblioteca'),(9,1,5,'Biblioteca'),(10,1,7,'Biblioteca'),(11,2,4,'Biblioteca'),(12,2,5,'Biblioteca'),(13,2,6,'Biblioteca'),(14,4,1,'Biblioteca'),(15,4,2,'Biblioteca'),(16,2,3,'Biblioteca'),(17,2,7,'Biblioteca'),(21,2,19,'Biblioteca'),(22,2,22,'Biblioteca'),(23,2,15,'Biblioteca'),(24,2,11,'Biblioteca'),(25,16,1,'Biblioteca'),(27,16,2,'Biblioteca'),(28,16,3,'Biblioteca'),(29,16,4,'Disponible'),(30,16,5,'Disponible'),(31,16,6,'Disponible'),(32,16,7,'Disponible'),(37,16,17,'Biblioteca'),(39,2,8,'Biblioteca'),(40,16,22,'Biblioteca'),(41,2,13,'Biblioteca'),(42,2,17,'Biblioteca'),(43,1,16,'Biblioteca'),(44,1,15,'Biblioteca'),(45,18,1,'Biblioteca'),(46,18,3,'Biblioteca'),(47,18,5,'Biblioteca'),(48,18,8,'Biblioteca'),(49,18,9,'Disponible'),(50,1,25,'Biblioteca'),(52,1,17,'Biblioteca'),(53,1,14,'Disponible'),(54,1,24,'Disponible'),(55,1,11,'Biblioteca'),(56,1,26,'Biblioteca'),(57,1,49,'Disponible'),(58,1,9,'Disponible'),(59,1,22,'Disponible'),(60,1,81,'Disponible'),(63,1,19,'Biblioteca'),(66,1,23,'Disponible'),(67,1,30,'Biblioteca'),(68,1,4,'Biblioteca'),(72,1,21,'Biblioteca'),(75,18,2,'Carrito'),(76,20,2,'Biblioteca'),(77,20,4,'Carrito'),(78,1,13,'Disponible'),(80,1,31,'Disponible'),(82,1,41,'Biblioteca'),(84,1,29,'Biblioteca'),(85,1,38,'Biblioteca'),(86,1,6,'Biblioteca'),(89,1,18,'Biblioteca'),(91,1,35,'Biblioteca'),(92,1,36,'Biblioteca'),(93,1,37,'Biblioteca'),(94,1,39,'Biblioteca'),(98,1,34,'Biblioteca');
/*!40000 ALTER TABLE `usuario_videojuego_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videojuego`
--

DROP TABLE IF EXISTS `videojuego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videojuego` (
  `idVideojuego` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IdCreador` int NOT NULL,
  `IdCategoria` int NOT NULL,
  `fecha_registro` date DEFAULT (curdate()),
  PRIMARY KEY (`idVideojuego`),
  KEY `fk_VIDEOJUEGO_CREADOR` (`IdCreador`),
  KEY `fk_VIDEOJUEGO_CATEGORIA` (`IdCategoria`),
  CONSTRAINT `fk_VIDEOJUEGO_CATEGORIA` FOREIGN KEY (`IdCategoria`) REFERENCES `categorias` (`IdCategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_VIDEOJUEGO_CREADOR` FOREIGN KEY (`IdCreador`) REFERENCES `creador` (`IdCreador`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videojuego`
--

LOCK TABLES `videojuego` WRITE;
/*!40000 ALTER TABLE `videojuego` DISABLE KEYS */;
INSERT INTO `videojuego` VALUES (1,'Counter-Strike 2',0.00,'Shooter táctico multijugador.',1,5,'2025-11-21'),(2,'Dota 2',0.00,'MOBA competitivo de Valve.',1,4,'2025-11-21'),(3,'Cyberpunk 2077',228.00,'RPG futurista de mundo abierto.',2,3,'2025-11-21'),(4,'The Witcher 3',152.00,'RPG de fantasía aclamado por la crítica.',2,3,'2025-11-21'),(5,'Assassin\'s Creed Valhalla',228.00,'Aventura vikinga de mundo abierto.',3,10,'2025-11-21'),(6,'Far Cry 5',190.00,'Shooter de mundo abierto.',3,5,'2025-11-21'),(7,'Skyrim',152.00,'RPG épico en mundo abierto.',4,3,'2025-11-21'),(8,'Fallout 4',114.00,'RPG postapocalíptico.',4,3,'2025-11-21'),(9,'GTA V',114.00,'Acción en mundo abierto.',5,10,'2025-11-21'),(10,'Red Dead Redemption 2',228.00,'Western de mundo abierto.',5,10,'2025-11-21'),(11,'FIFA 23',228.00,'Simulación de fútbol.',6,7,'2025-11-21'),(12,'Dark Souls III',228.00,'RPG de acción altamente desafiante.',7,3,'2025-11-21'),(13,'Elden Ring',228.00,'Mundo abierto desafiante.',7,3,'2025-11-21'),(14,'Resident Evil 4 Remake',228.00,'Survival horror clásico renovado.',8,12,'2025-11-21'),(15,'Monster Hunter World',152.00,'Acción cooperativa de cacería.',8,1,'2025-11-21'),(16,'Yakuza 0',76.00,'Acción y aventura en Japón.',9,1,'2025-11-21'),(17,'Final Fantasy XV',190.00,'RPG de fantasía moderna.',10,3,'2025-11-21'),(18,'DOOM Eternal',152.00,'Shooter frenético.',12,5,'2025-11-21'),(19,'Destiny 2',0.00,'Shooter Looter MMO.',13,5,'2025-11-21'),(20,'StarCraft II',0.00,'Estrategia en tiempo real.',14,4,'2025-11-21'),(21,'Overwatch 2',0.00,'Shooter por equipos con héroes.',14,5,'2025-11-21'),(22,'NBA 2K23',228.00,'Simulación de baloncesto.',15,7,'2025-11-21'),(23,'Call of Duty: Modern Warfare II',266.00,'Shooter militar en primera persona.',16,5,'2025-11-21'),(24,'Hitman 3',190.00,'Infiltración y sigilo con mundos abiertos.',17,1,'2025-11-21'),(25,'Cities: Skylines',76.00,'Simulador avanzado de construcción de ciudades.',18,8,'2025-11-21'),(26,'Baldur\'s Gate 3',228.00,'RPG basado en D&D, muy aclamado.',19,3,'2025-11-21'),(27,'Serious Sam 4',152.00,'Shooter frenético contra hordas.',20,5,'2025-11-21'),(28,'Minecraft',114.00,'Construcción y supervivencia sandbox.',21,11,'2025-11-21'),(29,'Dark and Darker',76.00,'Dungeon crawler PvPvE.',22,1,'2025-11-21'),(30,'Silent Hill 2 (Remake)',228.00,'Horror psicológico clásico renovado.',23,12,'2025-11-21'),(31,'Tekken 8',228.00,'Juego de lucha 3D.',24,1,'2025-11-21'),(32,'Dying Light',114.00,'Parkour y zombis en mundo abierto.',25,11,'2025-11-21'),(33,'Rust',114.00,'Supervivencia multijugador extrema.',26,11,'2025-11-21'),(34,'No Man\'s Sky',152.00,'Exploración espacial casi infinita.',27,10,'2025-11-21'),(35,'Don\'t Starve',38.00,'Supervivencia con estilo único.',28,11,'2025-11-21'),(36,'The Outer Worlds',152.00,'RPG espacial narrativo.',29,3,'2025-11-21'),(37,'Super Mario Odyssey',228.00,'Aventura de plataformas en mundo abierto.',30,15,'2025-11-21'),(38,'Control',152.00,'Acción sobrenatural en mundos surrealistas.',31,1,'2025-11-21'),(39,'Crysis Remastered',152.00,'Shooter futurista con gráficos avanzados.',32,5,'2025-11-21'),(40,'Inside',38.00,'Plataformas y puzzle con narrativa sombría.',33,15,'2025-11-21'),(41,'Goat Simulator',38.00,'Simulación caótica y humorística.',34,14,'2025-11-21'),(42,'Ashes of the Singularity',152.00,'Estrategia masiva de ciencia ficción.',35,4,'2025-11-21'),(43,'Death Stranding',190.00,'Aventura cinemática en un mundo desolado.',36,10,'2025-11-21'),(44,'Enter the Gungeon',38.00,'Bullet-hell rogue-like frenético.',37,6,'2025-11-21'),(45,'Hello Neighbor',38.00,'Sigilo y horror con IA impredecible.',38,12,'2025-11-21'),(46,'The Day Before',152.00,'Survival MMO en mundo abierto.',39,11,'2025-11-21'),(47,'Sons of the Forest',114.00,'Supervivencia intensa en un bosque hostil.',40,11,'2025-11-21'),(48,'Company of Heroes 3',228.00,'Estrategia táctica ambientada en la guerra.',41,4,'2025-11-21'),(49,'Need for Speed Heat',152.00,'Carreras callejeras con personalización.',42,9,'2025-11-21'),(50,'Halo Infinite',152.00,'Shooter futurista icónico.',43,5,'2025-11-21'),(51,'Valorant',0.00,'Shooter táctico basado en héroes.',44,5,'2025-11-21'),(52,'The Last of Us Part I',266.00,'Aventura narrativa postapocalíptica.',45,10,'2025-11-21'),(53,'The Walking Dead: The Final Season',114.00,'Aventura gráfica de decisiones.',46,2,'2025-11-21'),(54,'Hogwarts Legacy',228.00,'Aventura mágica en el universo Harry Potter.',47,10,'2025-11-21'),(55,'The Walking Dead: Saints & Sinners',152.00,'Terror en VR con mucha inmersión.',48,12,'2025-11-21'),(56,'Darkest Dungeon',76.00,'RPG táctico de mazmorras con estrés.',49,3,'2025-11-21'),(57,'Borderlands 3',152.00,'Shooter-looter cooperativo en mundo caótico.',50,5,'2025-11-21'),(58,'Forza Horizon 5',228.00,'Carreras de mundo abierto.',43,9,'2025-11-21'),(59,'Age of Empires IV',228.00,'Estrategia clásica renovada.',43,4,'2025-11-21'),(60,'Starfield',266.00,'RPG espacial de mundo abierto.',4,3,'2025-11-21'),(81,'Satisfactory',65.00,'Construcción y automatización en mundo abierto alienígena.',41,8,'2025-11-21');
/*!40000 ALTER TABLE `videojuego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'proyectovk'
--
/*!50003 DROP PROCEDURE IF EXISTS `new_modificarAvatar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_modificarAvatar`(
	in p_id int,
    in p_avatar varchar(100)
)
BEGIN
	update usuario set avatar = p_avatar where idUsuario = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_aceptarSolicitud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_aceptarSolicitud`(
in v_idAmistad int
)
BEGIN

    DECLARE v_emisor INT;  
    DECLARE v_receptor INT; 

    
    SELECT idUsuario, idAmigo
    INTO v_emisor, v_receptor
    FROM AMISTAD
    WHERE idAmistad = v_idAmistad
      AND estado = 'PENDIENTE';

    
    UPDATE AMISTAD
    SET estado = 'ACEPTADO'
    WHERE idAmistad = v_idAmistad;

    
    INSERT INTO AMISTAD (IdUsuario, IdAmigo, estado)
    SELECT v_receptor, v_emisor, 'ACEPTADO'
    FROM DUAL
    WHERE NOT EXISTS (
        SELECT 1 FROM AMISTAD
        WHERE idUsuario = v_receptor
          AND idAmigo = v_emisor
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_añadirCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_añadirCarrito`(
	in p_idVideojuego int,
    in p_idUsuario int
)
BEGIN
	declare v_idCarrito int;
   
    SELECT idCarrito 
    INTO v_idCarrito
    FROM carrito
    WHERE idUsuario = p_idUsuario;
    
    
    INSERT INTO usuario_videojuego_estado (idUsuario, idVideojuego, estado)
	VALUES (p_idUsuario, p_idVideojuego, 'Carrito')
	ON DUPLICATE KEY UPDATE estado = 'Carrito';
    
	insert into detalle_carrito (IdCarrito,IdVideojuego) values(v_idCarrito,p_idVideojuego);
    
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_autenticarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_autenticarUsuario`(

IN p_usuario VARCHAR(50),
    IN p_password VARCHAR(255)
)
BEGIN
SELECT 
        IdUsuario,
        nombre_usuario,
		fecha_creacion,
        nombre_completo,
        email,
		saldo,
        rol,
        estado,
        descripcion,
        pais,
        localidad,
        avatar
    FROM usuario
    WHERE nombre_usuario = p_usuario
    AND password = MD5(p_password)
    AND estado = 'ACTIVO';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_buscarPorNombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscarPorNombre`(
	in p_nombre varchar(50),
    in p_idUsuario int
)
BEGIN
	select 
		vj.idVideojuego,
		nombre,
        precio,
        cre.desarrollador as desarrollador,
        cat.nombre_categoria as categoria,
        IFNULL(uve.estado, 'Disponible') AS estado,
        
        descripcion
    from videojuego vj
    inner join creador cre on cre.IdCreador = vj.IdCreador
    inner join  categorias cat on cat.IdCategoria = vj.IdCategoria
    left join usuario_videojuego_estado uve ON vj.idVideoJuego = uve.idVideojuego
    AND uve.IdUsuario = p_idUsuario
    where nombre LIKE concat('%',p_nombre,'%'); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cambiarPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cambiarPassword`(
 IN p_idusuario INT,
    IN p_passwordNueva VARCHAR(255)
)
BEGIN
-- Validar que el usuario existe
    IF NOT EXISTS (SELECT 1 FROM usuario WHERE IdUsuario = p_idusuario) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no existe';
    END IF;
    
    UPDATE usuario
    SET password = MD5(p_passwordNueva)
    WHERE IdUsuario = p_idusuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_carritoBiblioteca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carritoBiblioteca`(
	IN p_idUsuario INT
)
BEGIN
    DECLARE v_idCarrito INT;
    DECLARE v_idBiblioteca INT;

    -- obtner ids de carrito y biblioteca
    SELECT IdCarrito INTO v_idCarrito 
    FROM carrito 
    WHERE IdUsuario = p_idUsuario;

    SELECT IdBiblioteca INTO v_idBiblioteca
    FROM biblioteca
    WHERE IdUsuario = p_idUsuario;

    -- insertar juegos del carrito en la biblioteca 
    INSERT INTO detalle_biblioteca (idVideojuego, idBiblioteca)
    SELECT dc.IdVideojuego, v_idBiblioteca
    FROM detalle_carrito dc
    WHERE dc.IdCarrito = v_idCarrito
    -- esto evita que se duplique 
    AND NOT EXISTS (
        SELECT 1 FROM detalle_biblioteca db
        WHERE db.idVideojuego = dc.IdVideojuego
        AND db.idBiblioteca = v_idBiblioteca
    );

    -- actualizar estado en la tienda
    UPDATE usuario_videojuego_estado
    SET estado = 'Biblioteca'
    WHERE IdUsuario = p_idUsuario
      AND estado = 'Carrito';

    -- vaciar tabla detalle-carrito
    DELETE FROM detalle_carrito
    WHERE IdCarrito = v_idCarrito;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_categoriaFavorita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoriaFavorita`(
in v_idUsuario int
)
BEGIN
SELECT
c.nombre_categoria as CATEGORIA,
COUNT(*) as CANTIDAD
FROM DETALLE_BIBLIOTECA de INNER JOIN BIBLIOTECA b
on de.idBiblioteca=b.IdBiblioteca 
INNER JOIN VIDEOJUEGO v on de.idVideojuego=v.idVideojuego
INNER JOIN CATEGORIAS c on v.IdCategoria=c.IdCategoria
where b.IdUsuario=v_idUsuario
group by c.nombre_categoria 
order by CANTIDAD DESC
limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_contarAmigos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_contarAmigos`(
in v_idUsuario int
)
BEGIN
SELECT
count(*) AS total

FROM AMISTAD where IdUsuario=v_idUsuario and estado='ACEPTADO';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_contarVideojuegos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_contarVideojuegos`(
in v_idUsuario int
)
BEGIN
SELECT
count(*) as CANTIDAD
FROM DETALLE_BIBLIOTECA de
INNER JOIN BIBLIOTECA b on de.idBiblioteca=b.IdBiblioteca
where b.IdUsuario=v_idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminarJuegoCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarJuegoCarrito`(
	in p_idVideojuego int,
    in p_idUsuario int
)
BEGIN
	declare v_idCarrito int;
    
    SELECT idCarrito 
    INTO v_idCarrito
    FROM carrito
    WHERE idUsuario = p_idUsuario;

	update usuario_videojuego_estado
	set estado = 'Disponible'
	where idUsuario = p_idUsuario and idVideojuego = p_idVideojuego;

	delete from detalle_carrito
    where IdCarrito = v_idCarrito
      and IdVideojuego = p_idVideojuego;
    
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarUsuario`(
	IN p_IdUsuario INT
)
BEGIN
 IF NOT EXISTS (SELECT 1 FROM usuario WHERE IdUsuario = p_IdUsuario) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no existe';
    END IF;
    
    -- No permitir eliminar si es el único admin
    IF (SELECT rol FROM usuario WHERE IdUsuario = p_IdUsuario) = 'ADMIN' 
       AND (SELECT COUNT(*) FROM usuario WHERE rol = 'ADMIN' AND estado = 'ACTIVO') = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar el único administrador activo';
    END IF;
    
    DELETE FROM usuario
    WHERE IdUsuario = p_IdUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_enviarSolicitud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_enviarSolicitud`(
    IN p_idUsuario INT,
    IN p_idAmigo INT
)
BEGIN
    
    -- 1. No permitir enviarse solicitud a sí mismo
    IF p_idUsuario = p_idAmigo THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No puedes enviarte una solicitud a ti mismo';
    END IF;

    -- 2. Validar SI YA EXISTE cualquier relación PENDIENTE entre ambos (en ambos sentidos)
    IF EXISTS (
        SELECT 1 FROM AMISTAD
        WHERE (
            (idUsuario = p_idUsuario AND idAmigo = p_idAmigo)
            OR
            (idUsuario = p_idAmigo AND idAmigo = p_idUsuario)
        )
        AND estado = 'pendiente'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe una solicitud pendiente entre ambos';
    END IF;

    -- 3. Validar SI YA SON AMIGOS (en ambos sentidos)
    IF EXISTS (
        SELECT 1 FROM AMISTAD
        WHERE (
            (idUsuario = p_idUsuario AND idAmigo = p_idAmigo)
            OR
            (idUsuario = p_idAmigo AND idAmigo = p_idUsuario)
        )
        AND estado = 'aceptado'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya son amigos';
    END IF;

    -- 4. Insertar nueva solicitud
    INSERT INTO AMISTAD (idUsuario, idAmigo, estado)
    VALUES (p_idUsuario, p_idAmigo, 'pendiente');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_filtrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filtrar`(
	in p_idUsuario int,
	in p_categoria varchar(45),
	in p_precio_min decimal(17,2),
	in p_precio_max decimal(17,2),
	in p_creador varchar(45)
)
BEGIN
	select 
		vj.IdVideojuego,
		nombre,
        precio,
        cre.desarrollador as desarrollador,
        cat.nombre_categoria as categoria,
        IFNULL(uve.estado, 'Disponible') AS estado,
        descripcion
    from videojuego vj
    inner join creador cre on cre.IdCreador = vj.IdCreador
    inner join  categorias cat on cat.IdCategoria = vj.IdCategoria
    left join usuario_videojuego_estado uve ON vj.idVideoJuego = uve.idVideojuego
    AND uve.IdUsuario = p_idUsuario
    where 
		-- FILTRO POR CATEGORIA (NULL = no filtrar)
        (p_categoria IS NULL OR p_categoria = '' OR cat.nombre_categoria LIKE CONCAT('%', p_categoria, '%'))

        -- FILTRO POR PRECIO MÍNIMO
        AND (p_precio_min IS NULL OR vj.precio >= p_precio_min)

        -- FILTRO POR PRECIO MÁXIMO
        AND (p_precio_max IS NULL OR vj.precio <= p_precio_max)

        -- FILTRO POR CREADOR
        AND (p_creador IS NULL OR p_creador = '' OR cre.desarrollador LIKE CONCAT('%', p_creador, '%'))

    ORDER BY vj.IdVideojuego ASC;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_guardarTarjeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_guardarTarjeta`(
 in p_numeroTarjeta varchar(255),
 in p_titular varchar(100),
in p_vencimiento varchar(10),
in p_idUsuario int
)
BEGIN
declare ult4 varchar(10);

set ult4=RIGHT(p_numeroTarjeta,4);
INSERT INTO TARJETA(numeroTarjeta,titular,fechaVencimiento,ultimos4,idUsuario)
VALUES(
p_numeroTarjeta,p_titular,p_vencimiento,ult4,p_idUsuario);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarUsuario`(	IN p_nombreUsuario VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_nombreCompleto VARCHAR(100),
    IN p_email VARCHAR(100)
   
   

)
BEGIN
	DECLARE idU int;
 IF EXISTS (SELECT 1 FROM usuario WHERE nombre_usuario = p_nombreUsuario) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre de usuario ya existe';
    END IF;
    
   
    IF p_email IS NOT NULL AND EXISTS (SELECT 1 FROM usuario WHERE email = p_email) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El email ya está registrado';
    END IF;
    
    INSERT INTO usuario (nombre_usuario, password, nombre_completo, email, estado)
    VALUES (p_nombreUsuario, MD5(p_password), p_nombreCompleto, p_email, 'ACTIVO');
   SET  idU=LAST_INSERT_ID();
    
    INSERT INTO CARRITO(IdUsuario) values(idU);
    INSERT INTO BIBLIOTECA(IdUsuario) values(idU);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_juegos_amigos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_juegos_amigos`(
in v_idUsuario int
)
BEGIN
SELECT
u.nombre_usuario AS AMIGO,
COUNT(de.idDetBiblioteca) AS CANTIDAD
FROM AMISTAD a INNER JOIN USUARIO u 
on a.IdAmigo=u.IdUsuario
INNER JOIN BIBLIOTECA b on u.IdUsuario=b.IdUsuario
INNER JOIN DETALLE_BIBLIOTECA de on b.IdBiblioteca=de.idBiblioteca
WHERE a.IdUsuario=v_idUsuario AND a.estado = 'ACEPTADO'
group by u.IdUsuario,u.nombre_usuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ListarAmigos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ListarAmigos`(
    IN v_idUsuario INT
)
BEGIN
    SELECT DISTINCT
        IF(a.idUsuario = v_idUsuario, u2.idUsuario, u1.idUsuario) AS idAmigo,
        IF(a.idUsuario = v_idUsuario, u2.nombre_usuario, u1.nombre_usuario) AS amigo,
        IF(a.idUsuario = v_idUsuario, u2.avatar, u1.avatar) AS avatar
    FROM AMISTAD a
    INNER JOIN Usuario u1 ON a.idUsuario = u1.idUsuario
    INNER JOIN Usuario u2 ON a.idAmigo = u2.idUsuario
    WHERE a.estado = 'ACEPTADO'
      AND (a.idUsuario = v_idUsuario OR a.idAmigo = v_idUsuario);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ListarBiblioteca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ListarBiblioteca`(
in p_idUsuario int
)
BEGIN
SELECT
d.idDetBiblioteca as ID,
v.nombre as Nombre,
v.descripcion as Descripcion,
c.desarrollador as Desarrollador,
ct.nombre_categoria as Categoria

FROM detalle_biblioteca d 
inner join videojuego v on d.idVideojuego=v.idVideojuego
inner join creador c on v.idCreador=c.idCreador
inner join categorias ct on v.IdCategoria=ct.IdCategoria
inner join biblioteca bi on d.idBiblioteca=bi.idBiblioteca

where bi.idUsuario=p_idUsuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listarCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarCarrito`(
	in p_idUsuario int
)
BEGIN
	declare v_idCarrito int;
    SELECT idCarrito 
    INTO v_idCarrito
    FROM carrito
    WHERE idUsuario = p_idUsuario;

	select 
		vj.idVideojuego as id,
        vj.nombre as nombre,
        vj.precio as precio,
        vj.descripcion as descripcion,
        cre.desarrollador as desarrollador,
        cat.nombre_categoria as categoria
    from detalle_carrito dc
    inner join videojuego vj on vj.idVideojuego = dc.IdVideojuego
    inner join creador cre on cre.IdCreador = vj.IdCreador
    inner join categorias cat on cat.IdCategoria = vj.IdCategoria
    where IdCarrito = v_idCarrito;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ListarCategorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ListarCategorias`()
BEGIN
SELECT
c.IdCategoria,
c.nombre_categoria,
c.abreviatura
FROM CATEGORIAS c
order by nombre_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listarCreador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarCreador`()
BEGIN
	select * from creador order by desarrollador;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ListarSolicitudes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ListarSolicitudes`(
in v_idUsuario int
)
BEGIN
SELECT 
        a.idAmistad as ID,
        u.nombre_usuario AS Remitente,
        u.avatar as avatar
    FROM AMISTAD a
    INNER JOIN Usuario u ON a.idUsuario = u.idUsuario
    WHERE a.idAmigo = v_idUsuario
      AND a.estado = 'PENDIENTE';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ListarUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ListarUsuarios`()
BEGIN
select
		IdUsuario,
        nombre_usuario,
        nombre_completo,
        email,
        rol,
        saldo,
        estado,
        fecha_creacion
        from usuario
	order by nombre_completo asc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listarVideoJuegos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarVideoJuegos`(
	IN p_idUsuario INT
)
BEGIN
	select 
		vj.idVideojuego,
		nombre,
        precio,
        cre.desarrollador as desarrollador,
        cat.nombre_categoria as categoria,
        IFNULL(uve.estado, 'Disponible') AS estado,
        
        descripcion
    from videojuego vj
    inner join creador cre on cre.IdCreador = vj.IdCreador
    inner join  categorias cat on cat.IdCategoria = vj.IdCategoria
    left join usuario_videojuego_estado uve ON vj.idVideoJuego = uve.idVideojuego
    AND uve.IdUsuario = p_idUsuario
    order by vj.idVideojuego asc;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_modificarPerfil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modificarPerfil`(
	in p_idUsuario int,
    in p_nombreUsuario varchar(50),
    in p_pais varchar(45),
    in p_estado varchar(45),
    in p_descripcion varchar(500)
)
BEGIN
	UPDATE usuario
    SET 
        nombre_usuario = p_nombreUsuario,
        pais = p_pais,
        descripcion = p_descripcion,
        localidad = p_estado
    WHERE IdUsuario = p_idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_modificarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modificarUsuario`(
 IN p_idusuario INT,
    IN p_nombreUsuario VARCHAR(50),
    IN p_nombreCompleto VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_rol VARCHAR(20),
    IN p_estado VARCHAR(20))
BEGIN
 IF NOT EXISTS (SELECT 1 FROM usuario WHERE IdUsuario = p_idusuario) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no existe';
    END IF;
    
    -- Verificar si el nombre de usuario ya está siendo usado por otro usuario
    IF EXISTS (
        SELECT 1 FROM usuario
        WHERE nombre_usuario = p_nombreUsuario 
        AND IdUsuario != p_idusuario
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre de usuario ya existe';
    END IF;
    
    -- Verificar si el email ya está siendo usado por otro usuario
    IF p_email IS NOT NULL AND EXISTS (
        SELECT 1 FROM usuario
        WHERE email = p_email 
        AND IdUsuario != p_idusuario
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El email ya está registrado';
    END IF;
    
    UPDATE usuario
    SET 
        nombre_usuario = p_nombreUsuario,
        nombre_completo = p_nombreCompleto,
        email = p_email,
        rol = p_rol,
        estado = p_estado
    WHERE IdUsuario = p_idusuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtenerTarjeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerTarjeta`(
in p_idUsuario int
)
BEGIN
SELECT
        idTarjeta,
        titular as titular,
        ultimos4,
        fechaVencimiento
FROM TARJETA where idUsuario=p_idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtenerUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerUsuario`(
IN p_idusuario INT
)
BEGIN
SELECT 
        IdUsuario AS ID,
        nombre_usuario as nombre,
        nombre_completo as nombreReal,
        email,
        saldo,
        rol,
        estado,
        fecha_creacion,
        descripcion,
        pais,
        localidad,
        avatar
    FROM usuario
    WHERE IdUsuario = p_idusuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtenerUsuarioporNombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerUsuarioporNombre`(
in v_nombre varchar(50)
)
BEGIN
SELECT
u.idUsuario as ID,
u.nombre_usuario as Nombre
FROM USUARIO u where u.nombre_usuario=v_nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_recargarSaldo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_recargarSaldo`(
in p_idusuario int,
in p_saldo decimal(10,2)
)
BEGIN
UPDATE USUARIO set saldo=saldo+p_saldo
 where IdUsuario=p_idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rechazarSolicitud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rechazarSolicitud`(
    IN v_idAmistad INT
)
BEGIN
    DECLARE v_estadoActual VARCHAR(20);

   
    SELECT estado INTO v_estadoActual
    FROM AMISTAD
    WHERE idAmistad = v_idAmistad
    LIMIT 1;

    IF v_estadoActual IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La solicitud no existe.';
    END IF;

    
    IF v_estadoActual <> 'PENDIENTE' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Solo se pueden rechazar solicitudes pendientes.';
    END IF;

    
    UPDATE AMISTAD
    SET estado = 'RECHAZADO'
    WHERE idAmistad = v_idAmistad;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrarCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrarCompra`(
    IN p_idUsuario INT,
    IN p_metodoPago VARCHAR(20),
    IN p_total DECIMAL(10,2)
)
BEGIN
    DECLARE v_idCompra INT;
    DECLARE v_idCarrito INT;

    -- obtener carrito
    SELECT IdCarrito INTO v_idCarrito
    FROM carrito
    WHERE IdUsuario = p_idUsuario;

    -- si el pago es billetera, restar saldo
    IF p_metodoPago = 'Billetera' THEN
        UPDATE usuario
        SET saldo = saldo - p_total
        WHERE idUsuario = p_idUsuario;
    END IF;

    -- registrar compra
    INSERT INTO compra(IdUsuario, total, metodo_pago)
    VALUES (p_idUsuario, p_total, p_metodoPago);

    SET v_idCompra = LAST_INSERT_ID();

    -- registrar detalle de compra
    INSERT INTO detalle_compra (IdCompra, IdVideojuego, precio)
    SELECT v_idCompra, vj.idVideojuego, vj.precio
    FROM detalle_carrito dc
    INNER JOIN videojuego vj ON vj.idVideojuego = dc.IdVideojuego
    WHERE dc.IdCarrito = v_idCarrito;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_saldoAcumulado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saldoAcumulado`(
in v_idUsuario int
)
BEGIN
SELECT
COALESCE(SUM(c.total), 0) AS TOTAL
FROM COMPRA c where idUsuario=v_idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_videojuegos_por_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_videojuegos_por_categoria`(
in v_idUsuario int
)
BEGIN
SELECT
c.nombre_categoria as CATEGORIA,
COUNT(*) as CANTIDAD
FROM DETALLE_BIBLIOTECA de INNER JOIN BIBLIOTECA b
on de.idBiblioteca=b.IdBiblioteca 
INNER JOIN VIDEOJUEGO v on de.idVideojuego=v.idVideojuego
INNER JOIN CATEGORIAS c on v.IdCategoria=c.IdCategoria
where b.IdUsuario=v_idUsuario
group by c.nombre_categoria 
order by CANTIDAD ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-04 17:57:59
