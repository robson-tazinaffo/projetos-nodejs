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
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `preco` decimal(9,2) DEFAULT NULL,
  `url_foto` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `produto_categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`id_produto`, `id_categoria`, `nome`, `descricao`, `preco`, `url_foto`) VALUES (1,1,'X-Salada Picanha','Pão,hamburguer de picanha 150 g,queijo prato, alface, tomate, maionese hamburguinho.',33.80,'https://static-images.ifood.com.br/image/upload/t_medium/pratos/95f6be76-f09e-4d21-bdb6-4420b94e95cc/201910151403_Rgiv_h.jpg'),(2,1,'Cheese Steak','Rosbife 120g, cheddar e cebola frita, servido no pão de queijo.',35.00,'https://static-images.ifood.com.br/image/upload/t_medium/pratos/6662320c-1cf1-4deb-8c58-e749526bd34e/201801051234_25999151.jpg'),(3,1,'X-Burguer','Pão, hambúrguer de carne angus e queijo prato.',21.70,'https://static-images.ifood.com.br/image/upload/t_medium/pratos/95f6be76-f09e-4d21-bdb6-4420b94e95cc/201909201848_bUJH_.jpeg'),(4,2,'X-Egg','Pão, hambúrguer de carne angus, queijo prato e ovo.',24.90,'https://static-images.ifood.com.br/image/upload/t_medium/pratos/95f6be76-f09e-4d21-bdb6-4420b94e95cc/201909201848_tn67_.jpeg'),(5,2,'X-Bacon','Pão, hambúrguer de carne angus, queijo prato e bacon.',27.90,'https://static-images.ifood.com.br/image/upload/t_medium/pratos/95f6be76-f09e-4d21-bdb6-4420b94e95cc/201909201848_BLHp_.jpeg'),(6,2,'X-Filé Frango','Pão, filet de frango e queijo prato.',25.60,'https://static-images.ifood.com.br/image/upload/t_medium/pratos/afeef31a-10d0-4e4e-b9cc-1fc0d13a690b/202107241944_1DU7_i.jpg'),(7,2,'X-Cebola Maionese','Pão, hambúrguer de 150g (angus), queijo prato, cebola frita e maionese artesanal.',28.90,'https://static-images.ifood.com.br/image/upload/t_medium/pratos/afeef31a-10d0-4e4e-b9cc-1fc0d13a690b/202106212018_G2V5_i.jpg'),(8,3,'Hot Dog Tradicional','Pão de Hot Dog, 1 Salsicha, Ketchup, Maionese, Mostarda e Batata Palha',14.50,'https://static-images.ifood.com.br/image/upload/t_medium/pratos/900a5bab-f13e-4b24-9d5d-ed7b7c3d02d6/202202251323_TGR8_i.jpg'),(9,3,'Hot Dog Soja','Salsicha de soja, requeijão, oregano, cheddar, vinagrete, milho, maionese, batata palha, pure e parmesão (vegetariano ou vegano)',28.00,'https://static-images.ifood.com.br/image/upload/t_medium/pratos/f83739c1-9ab8-4ce0-a0a0-8891ef7d1441/202010162138_2GDU_.jpeg'),(10,3,'Hot Dogão','Quatro salsichas, requeijão, oregano, cheddar, vinagrete, milho, maionese, batata palha, pure e parmesão',31.00,'https://static-images.ifood.com.br/image/upload/t_medium/pratos/f83739c1-9ab8-4ce0-a0a0-8891ef7d1441/202203041656_VIM7_i.jpg'),(11,4,'Coca-Cola Lata','Refrigerante Coca-Cola lata 350ml',6.00,'https://static-images.ifood.com.br/image/upload/t_medium/pratos/49e47d63-261c-40e3-8aaa-c7394c8bd52d/202106101838_7X5C_i.jpg'),(12,4,'Água mineral','Água mineral 330ml',4.00,'https://static-images.ifood.com.br/image/upload/t_medium/pratos/49e47d63-261c-40e3-8aaa-c7394c8bd52d/202110051245_8FA8_i.jpg'),(13,4,'Schweppes','Schweppes citrus 350ml',6.00,'https://static-images.ifood.com.br/image/upload/t_medium/pratos/02802197-f7f6-4024-886d-140ba81e4d71/202007181050_7sIi_.jfif'),(14,4,'Sprite Lemon','Sprite Lemon fresh 500ml',8.90,'https://static-images.ifood.com.br/image/upload/t_medium/pratos/02802197-f7f6-4024-886d-140ba81e4d71/202006061837_0mL7_4.jpg');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-22  3:04:00
