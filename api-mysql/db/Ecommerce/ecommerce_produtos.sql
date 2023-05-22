-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `preco` float NOT NULL,
  `imagem_produto` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`id_produto`, `nome`, `preco`, `imagem_produto`) VALUES (1,'MAtrix Reloaded',45.8,NULL),(3,'A múmia',54.8,NULL),(4,'Lenovo',3500,NULL),(5,'Lenovo',3500,NULL),(6,'Lenovo',3500,NULL),(7,'Lenovo',3500,NULL),(8,'Lenovo',3500,NULL),(9,'Ventilador',300,NULL),(10,'Ventilador',300,NULL),(11,'Ventilador novo',500,NULL),(12,'Ventilador novo',500,NULL),(13,'Ventilador novo',500,NULL),(14,'Mouse',30,NULL),(15,'Mouse',30,NULL),(16,'Mouse',30,NULL),(17,'Mouse',30,'uploads\\function toString() { [native code] }_mouse.png'),(18,'Mochila',89.9,'uploads\\mochila.png'),(19,'Fone de Ouvido',133.33,'uploads\\02-03-2022_foneouvido.png'),(20,'Fone de Ouvido back',139.99,'uploads\\02-03-2022-05-35-36_foneouvido.png'),(21,'Fone de Ouvido back',139.99,'uploads\\02-03-2022-053715_foneouvido.png'),(22,'Mouse vermelho 2',55,'uploads\\03-03-2022-122431_mouse.png'),(23,'Mouse vermelho 2',55,'uploads\\03-03-2022-122634_mouse.png'),(24,'Mouse vermelho 2',55,'uploads\\03-03-2022-122634_mouse.png'),(25,'Mouse vermelho 2',55,'uploads\\03-03-2022-123252_mouse.png'),(26,'Mouse vermelho 2',55,'uploads\\03-03-2022-123425_mouse.png'),(28,'Mouse vermelho 2',55,'uploads\\03-03-2022-124036_mouse.png'),(29,'Lenovo 2',56,'uploads\\lenovo.jpg'),(30,'Mouse Vermelho 2',59.99,'uploads\\06-03-2022-030226_mouse.png'),(31,'Mouse Vermelho 2',59.99,'uploads\\06-03-2022-031709_mouse.png'),(32,'Mouse Vermelho 2',59.99,'uploads\\06-03-2022-032700mouse.png'),(33,'Mouse Vermelho 2',59.99,NULL),(34,'Produto teste com async',109.99,NULL),(35,'Produto teste com async',109.99,'uploads\\ventilador.jpg'),(36,'Produto teste path',200,'uploads\\10032022-023344foneouvido.png'),(37,'Produto teste path',200,'uploads\\10032022-023506-foneouvido.png');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-22  3:03:52
