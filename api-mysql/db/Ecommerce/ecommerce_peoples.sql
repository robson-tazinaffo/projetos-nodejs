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
-- Table structure for table `peoples`
--

DROP TABLE IF EXISTS `peoples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peoples` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `nome_emit` varchar(45) NOT NULL,
  `premiacao` varchar(10) DEFAULT NULL,
  `cgc` varchar(14) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `ins_estadual` varchar(20) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nome_contato` varchar(100) DEFAULT NULL,
  `email_fatur` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cod_gr_cli` varchar(10) DEFAULT NULL,
  `nome_abrev` varchar(100) DEFAULT NULL,
  `nome_matriz` varchar(100) DEFAULT NULL,
  `cod_rep` varchar(6) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `tipo_relacionamento` char(1) DEFAULT NULL,
  `dt_atualiza_wms` varchar(26) DEFAULT NULL,
  `representante` varchar(30) DEFAULT NULL,
  `coordenador` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peoples`
--

LOCK TABLES `peoples` WRITE;
/*!40000 ALTER TABLE `peoples` DISABLE KEYS */;
INSERT INTO `peoples` (`id`, `codigo`, `nome_emit`, `premiacao`, `cgc`, `cidade`, `tipo`, `ins_estadual`, `bairro`, `cep`, `email`, `nome_contato`, `email_fatur`, `telefone`, `cod_gr_cli`, `nome_abrev`, `nome_matriz`, `cod_rep`, `estado`, `pais`, `endereco`, `tipo_relacionamento`, `dt_atualiza_wms`, `representante`, `coordenador`) VALUES (1,'C153253','SANOVO GREENPACK EMBALAGENS DO BRASIL LT','--','61585931004776','SOROCABA-SP','CLIENTE','669.138.600.118','APARECIDINHA','01808719','controladoria.sgb@sanovo.com.br',NULL,'controladoria.sgb@sanovo.com.br','15-3238-3200','40','SANOVO','SANOVO','367','SP','BRASIL','R PAULO VARCHAVTCHIK, 431','P','2021-07-22 17.29.21.000000','CAROLINI','ID1');
/*!40000 ALTER TABLE `peoples` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-22  3:03:55
