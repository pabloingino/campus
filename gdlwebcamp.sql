-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gdlwebcamp
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `gdlwebcamp`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `gdlwebcamp` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `gdlwebcamp`;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `ID_admin` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `hash_pass` varchar(60) NOT NULL,
  `nivel` int(1) NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`ID_admin`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (33,'JuanPablo','Juan Pablo','$2y$12$KltnubS.LKGLlrXXXpimheUy5Cs0R5a.nb33IexaZZWqlJCzy1qc2',0,'0000-00-00 00:00:00'),(34,'adm','Adminsitrador','$2y$12$PtuCFzirNeRah3o.tDu/7ud3Q5t3jBjRFjsrq5e1/2g8PutYys1aG',0,'2017-11-06 22:26:59'),(35,'admin','Super Adminsitrador','$2a$12$5.VTKXMVwlFGxxYiSOCBC.UYYE/QgcTfp.e0q.9YuoFDF.qrqpy7O',1,'0000-00-00 00:00:00'),(39,'pingino','Pablo Ingino','$2y$12$eu81n6QiCXE58PblsGzwT.bDhpb41PJ6kQjVaxEbDDV5XD01HLFza',0,'2018-08-24 15:19:58'),(40,'asd','asdmju','$2y$12$8YoQfrWt4qghsEjjZ6NrFuz6UsfdRcE46YJqrzD3ff211w8iviD42',0,'2018-08-24 15:25:40'),(41,'ncampagnon','Nicolas Campagnon','$2y$12$XR1E06BRGIvp0SFvIbX7/OnsQLoXtHDTsqba9VOTM14Q8TeS8Cmg6',0,'2018-08-24 18:31:36'),(42,'gbonetti','Gonzalo Bonetti','$2y$12$G9fMLghMqWNiMFmoDoJfR.E4FFumrONQ25OSzqiK/Z4mbuP.Ncuni',0,'2018-08-24 19:13:49');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_evento`
--

DROP TABLE IF EXISTS `categoria_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_evento` (
  `id_categoria` tinyint(10) NOT NULL AUTO_INCREMENT,
  `cat_evento` varchar(50) NOT NULL,
  `icono` varchar(15) NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_evento`
--

LOCK TABLES `categoria_evento` WRITE;
/*!40000 ALTER TABLE `categoria_evento` DISABLE KEYS */;
INSERT INTO `categoria_evento` VALUES (1,'Seminario','fa-university','0000-00-00 00:00:00'),(2,'Conferencia','fa-address-book','2017-11-06 17:50:04'),(3,'Talleres','fa-code','0000-00-00 00:00:00'),(5,'Mentoria','fa-align-center','2017-11-06 18:30:41');
/*!40000 ALTER TABLE `categoria_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventos` (
  `evento_id` tinyint(10) NOT NULL AUTO_INCREMENT,
  `nombre_evento` varchar(60) NOT NULL,
  `fecha_evento` date NOT NULL,
  `hora_evento` varchar(10) NOT NULL,
  `id_cat_evento` tinyint(10) NOT NULL,
  `id_inv` tinyint(4) NOT NULL,
  `clave` varchar(10) NOT NULL,
  PRIMARY KEY (`evento_id`),
  KEY `id_cat_evento` (`id_cat_evento`),
  KEY `id_inv` (`id_inv`),
  CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`id_cat_evento`) REFERENCES `categoria_evento` (`id_categoria`),
  CONSTRAINT `eventos_ibfk_2` FOREIGN KEY (`id_inv`) REFERENCES `invitados` (`invitado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (4,'HTML5 y CSS3','2016-12-09','02:00 PM',3,3,'taller_01'),(6,'WordPress','2016-12-09','19:00:00',3,5,'taller_13'),(7,'Como ser freelancer','2016-12-09','10:00:00',2,6,'conf_01'),(8,'Tecnologías del Futuro PHP','2016-12-09','05:00 PM',2,3,'conf_02'),(9,'Seguridad en la Web','2016-12-09','07:00 PM',2,2,'conf_03'),(10,'Diseño UI y UX para móviles','2016-12-09','10:00:00',1,6,'sem_01'),(11,'Angular 5','2016-12-10','10:00 AM',3,3,'taller_02'),(12,'PHP y MySQL','2016-12-10','12:00:00',3,2,'taller_03'),(13,'JavaScript Avanzado','2016-12-10','14:00:00',3,3,'taller_04'),(14,'SEO en Google','2016-12-10','17:00:00',3,4,'taller_05'),(15,'De Photoshop a HTML5 y CSS3','2016-12-10','19:00:00',3,5,'taller_06'),(16,'PHP Intermedio y Avanzado','2016-12-10','21:00:00',3,6,'taller_07'),(17,'Como crear una tienda online que venda millones en pocos día','2016-12-10','10:00:00',2,6,'conf_04'),(18,'Los mejores lugares para encontrar trabajo','2016-12-10','17:00:00',2,1,'conf_05'),(19,'Pasos para crear un negocio rentable ','2016-12-10','19:00:00',2,2,'conf_06'),(20,'Aprende a Programar en una mañana','2016-12-10','10:00:00',1,3,'sem_02'),(21,'Diseño UI y UX para móviles','2016-12-10','17:00:00',1,5,'sem_03'),(22,'Laravel','2016-12-11','10:00:00',3,1,'taller_08'),(23,'Crea tu propia API','2016-12-11','12:00:00',3,2,'taller_09'),(24,'JavaScript y jQuery','2016-12-11','14:00:00',3,3,'taller_10'),(25,'Creando Plantillas para WordPress','2016-12-11','17:00:00',3,4,'taller_11'),(26,'Tiendas Virtuales en Magento','2016-12-11','19:00:00',3,5,'taller_12'),(30,'Creando una App en Android en una mañana','2016-12-11','10:00:00',1,4,'sem_04'),(31,'Creando una App en iOS en una tarde','2016-12-11','17:00:00',1,1,'sem_05'),(32,'Flexbox para principiantes','2016-12-10','11:00:00',2,4,'conf_07');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitados`
--

DROP TABLE IF EXISTS `invitados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitados` (
  `invitado_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre_invitado` varchar(30) NOT NULL,
  `apellido_invitado` varchar(30) NOT NULL,
  `descripcion` text NOT NULL,
  `url_imagen` varchar(50) NOT NULL,
  `editado` datetime NOT NULL,
  PRIMARY KEY (`invitado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitados`
--

LOCK TABLES `invitados` WRITE;
/*!40000 ALTER TABLE `invitados` DISABLE KEYS */;
INSERT INTO `invitados` VALUES (1,'Rafael ','Bautista','Praesent rutrum efficitur pharetra. Vivamus scelerisque pretium velit, id tempor turpis pulvinar et. Ut bibendum finibus massa non molestie.','invitado1.jpg','0000-00-00 00:00:00'),(2,'Shari','Herrera','Curabitur urna metus, placerat gravida lacus ut, lacinia congue orci. Maecenas luctus mi at ex blandit vehicula. Morbi porttitor tempus euismod.','invitado2.jpg','0000-00-00 00:00:00'),(3,'Tito','Sanchez','placerat gravida lacus ut, lacinia congue orci. Maecenas luctus mi at ex blandit vehicula. Morbi porttitor tempus euismod.','invitado3.jpg','0000-00-00 00:00:00'),(4,'Susana','Rivera','Praesent rutrum efficitur pharetra. Vivamus scelerisque pretium velit, id tempor turpis pulvinar et. Ut bibendum finibus','invitado4.jpg','0000-00-00 00:00:00'),(5,'Harold','Garcia','placerat gravida lacus ut, lacinia congue orci. Maecenas luctus mi at ex blandit vehicula. Morbi porttitor tempus euismod.','invitado5.jpg','0000-00-00 00:00:00'),(6,'Susan','Sanchez','Praesent rutrum efficitur pharetra. Vivamus scelerisque pretium velit, id tempor turpis pulvinar et. Ut bibendum finibus massa non molestie. Curabitur urna metus, placerat gravida lacus ut, lacinia congue orci. Maecenas luctus mi at ex blandit vehicula. Morbi porttitor tempus euismod.','invitado6.jpg','0000-00-00 00:00:00'),(9,'Juan Pablo','De la torre','Mi Biografia!!','invitado1.jpg','2017-11-10 14:52:45');
/*!40000 ALTER TABLE `invitados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regalos`
--

DROP TABLE IF EXISTS `regalos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regalos` (
  `ID_regalo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_regalo` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_regalo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regalos`
--

LOCK TABLES `regalos` WRITE;
/*!40000 ALTER TABLE `regalos` DISABLE KEYS */;
INSERT INTO `regalos` VALUES (1,'Pulsera'),(2,'Etiquetas'),(3,'Plumas');
/*!40000 ALTER TABLE `regalos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrados`
--

DROP TABLE IF EXISTS `registrados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registrados` (
  `ID_Registrado` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_registrado` varchar(50) NOT NULL,
  `apellido_registrado` varchar(50) NOT NULL,
  `email_registrado` varchar(100) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `pases_articulos` longtext NOT NULL,
  `talleres_registrados` longtext NOT NULL,
  `regalo` int(11) NOT NULL,
  `total_pagado` varchar(50) NOT NULL,
  `pagado` int(1) NOT NULL,
  PRIMARY KEY (`ID_Registrado`),
  KEY `regalo` (`regalo`),
  CONSTRAINT `registrados_ibfk_1` FOREIGN KEY (`regalo`) REFERENCES `regalos` (`ID_regalo`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrados`
--

LOCK TABLES `registrados` WRITE;
/*!40000 ALTER TABLE `registrados` DISABLE KEYS */;
INSERT INTO `registrados` VALUES (1,'Juan Pablo','De la torre','blackmaxgdl18@hotmail.com','2016-11-13 07:02:07','{\"un_dia\":2,\"pase_completo\":1,\"camisas\":2,\"etiquetas\":4}','{\"eventos\":[\"taller_01\",\"taller_02\",\"taller_03\",\"taller_04\",\"conf_04\",\"conf_05\",\"taller_12\",\"taller_13\",\"taller_14\"]}',1,'136.6',0),(8,'Pablo','De la torre','blackmaxgdl18@hotmail.com','2016-11-13 07:15:59','{\"un_dia\":1,\"camisas\":1,\"etiquetas\":2}','{\"eventos\":[\"taller_01\",\"taller_02\",\"taller_03\",\"taller_04\",\"taller_05\"]}',2,'43.3',0),(10,'Juan','De la torre','blackmaxgdl18@hotmail.com','2017-01-15 06:30:22','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":2}','{\"eventos\":[\"taller_01\",\"taller_02\"]}',1,'43.3',0),(11,'Juan','De la torre','blackmaxgdl18@hotmail.com','2017-01-15 06:30:49','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":2}','{\"eventos\":[\"taller_01\",\"taller_02\"]}',1,'43.3',0),(12,'Juan','De la torre','blackmaxgdl18@hotmail.com','2017-01-15 06:33:44','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":2}','{\"eventos\":[\"taller_01\",\"taller_02\"]}',1,'43.3',0),(13,'Juan','De la torre','blackmaxgdl18@hotmail.com','2017-01-15 06:34:07','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":2}','{\"eventos\":[\"taller_01\",\"taller_02\"]}',1,'43.3',0),(14,'Juan','De la torre','blackmaxgdl18@hotmail.com','2017-01-15 06:36:28','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":2}','{\"eventos\":[\"taller_01\",\"taller_02\"]}',1,'43.3',0),(15,'Juan','De la torre','blackmaxgdl18@hotmail.com','2017-01-15 06:41:07','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":2}','{\"eventos\":[\"taller_01\",\"taller_02\"]}',1,'43.3',0),(16,'Juan','De la torre','blackmaxgdl18@hotmail.com','2017-01-15 06:45:49','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":2}','{\"eventos\":[\"taller_01\",\"taller_02\"]}',1,'43.3',0),(17,'Juan','De la torre','blackmaxgdl18@hotmail.com','2017-01-15 06:46:55','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":2}','{\"eventos\":[\"taller_01\",\"taller_02\"]}',1,'43.3',0),(18,'Juan','De la torre','blackmaxgdl18@hotmail.com','2017-01-15 06:48:16','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":2}','{\"eventos\":[\"taller_01\",\"taller_02\"]}',1,'43.3',0),(19,'Juan','De la torre','blackmaxgdl18@hotmail.com','2017-01-15 06:48:21','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":2}','{\"eventos\":[\"taller_01\",\"taller_02\"]}',1,'43.3',0),(20,'Juan','De la torre','blackmaxgdl18@hotmail.com','2017-01-15 06:49:29','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":2}','{\"eventos\":[\"taller_01\",\"taller_02\"]}',1,'43.3',0),(21,'Juan','De la torre','blackmaxgdl18@hotmail.com','2017-01-15 06:49:50','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":2}','{\"eventos\":[\"taller_01\",\"taller_02\"]}',1,'43.3',0),(22,'Juan','De la torre','blackmaxgdl18@hotmail.com','2017-01-15 06:50:07','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":2}','{\"eventos\":[\"taller_01\",\"taller_02\"]}',1,'43.3',0),(23,'Juan','De la torre','blackmaxgdl18@hotmail.com','2017-01-15 06:50:53','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":2}','{\"eventos\":[\"taller_01\",\"taller_02\"]}',1,'43.3',0),(24,'Juan Pablo De la','Valdez','blackmaxgdl18@hotmail.com','2017-01-15 06:55:24','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":3,\"etiquetas\":3}','{\"eventos\":[\"taller_01\",\"taller_02\",\"taller_03\",\"taller_07\",\"taller_08\",\"taller_09\",\"taller_12\",\"conf_07\"]}',2,'298.9',1),(25,'Juan Pablo','De la torre','jpdelatorrevaldez@gmail.com','2017-01-17 05:33:31','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":2,\"etiquetas\":5}','{\"eventos\":[\"taller_01\",\"taller_02\",\"taller_03\",\"taller_04\",\"taller_05\",\"taller_06\",\"taller_07\",\"taller_11\",\"taller_12\",\"taller_13\",\"taller_14\",\"taller_15\"]}',3,'243.6',1),(26,'','','','2017-11-12 19:37:32','{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":1}','{\"eventos\":[\"22\",\"23\"]}',2,'61.3',1),(27,'Juan Pablo','De la torre','blackmaxxgdl18@hotmail.com','2017-11-12 19:37:32','{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"1\"},\"pase_2dias\":{\"cantidad\":\"1\"},\"camisas\":2,\"etiquetas\":1}','{\"eventos\":[\"8\",\"9\",\"7\",\"4\",\"6\",\"23\",\"24\"]}',1,'145.6',1);
/*!40000 ALTER TABLE `registrados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-25 18:07:28
