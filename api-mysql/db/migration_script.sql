-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: cardapio, ecommerce, meu_mercado, nodemysql, vakinha_burger
-- Source Schemata: cardapio, ecommerce, meu_mercado, nodemysql, vakinha_burger
-- Created: Thu May  4 19:21:07 2023
-- Workbench Version: 8.0.23
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema cardapio
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `cardapio` ;
CREATE SCHEMA IF NOT EXISTS `cardapio` ;

-- ----------------------------------------------------------------------------
-- Table cardapio.config
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cardapio`.`config` (
  `vl_entrega` DECIMAL(5,2) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table cardapio.pedido
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cardapio`.`pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `dt_pedido` DATETIME NULL DEFAULT NULL,
  `vl_subtotal` DECIMAL(9,2) NULL DEFAULT NULL,
  `vl_entrega` DECIMAL(5,2) NULL DEFAULT NULL,
  `vl_total` DECIMAL(9,2) NULL DEFAULT NULL,
  `status` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `id_usuario` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `pedido_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `cardapio`.`usuario` (`id_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table cardapio.pedido_item
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cardapio`.`pedido_item` (
  `id_item` INT NOT NULL AUTO_INCREMENT,
  `id_pedido` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `qtd` DECIMAL(9,3) NULL DEFAULT NULL,
  `vl_unitario` DECIMAL(9,2) NULL DEFAULT NULL,
  `vl_total` DECIMAL(9,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  INDEX `id_pedido` (`id_pedido` ASC) VISIBLE,
  INDEX `id_produto` (`id_produto` ASC) VISIBLE,
  CONSTRAINT `pedido_item_ibfk_1`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `cardapio`.`pedido` (`id_pedido`),
  CONSTRAINT `pedido_item_ibfk_2`
    FOREIGN KEY (`id_produto`)
    REFERENCES `cardapio`.`produto` (`id_produto`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table cardapio.produto
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cardapio`.`produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `id_categoria` INT NOT NULL,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `descricao` VARCHAR(1000) NULL DEFAULT NULL,
  `preco` DECIMAL(9,2) NULL DEFAULT NULL,
  `url_foto` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  INDEX `id_categoria` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `produto_ibfk_1`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `cardapio`.`produto_categoria` (`id_categoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table cardapio.produto_categoria
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cardapio`.`produto_categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NULL DEFAULT NULL,
  `ordem` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table cardapio.usuario
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cardapio`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `senha` VARCHAR(50) NULL DEFAULT NULL,
  `endereco` VARCHAR(100) NULL DEFAULT NULL,
  `bairro` VARCHAR(50) NULL DEFAULT NULL,
  `cidade` VARCHAR(50) NULL DEFAULT NULL,
  `uf` VARCHAR(2) NULL DEFAULT NULL,
  `cep` VARCHAR(10) NULL DEFAULT NULL,
  `dt_cadastro` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Schema ecommerce
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `ecommerce` ;
CREATE SCHEMA IF NOT EXISTS `ecommerce` ;

-- ----------------------------------------------------------------------------
-- Table ecommerce.categories
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`categories` (
  `categoryId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`categoryId`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ecommerce.config
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`config` (
  `vl_entrega` DECIMAL(5,2) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table ecommerce.orders
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`orders` (
  `orderId` INT NOT NULL AUTO_INCREMENT,
  `productId` INT NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  INDEX `productId` (`productId` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`productId`)
    REFERENCES `ecommerce`.`products` (`productId`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ecommerce.pedido
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `dt_pedido` DATETIME NULL DEFAULT NULL,
  `vl_subtotal` DECIMAL(9,2) NULL DEFAULT NULL,
  `vl_entrega` DECIMAL(5,2) NULL DEFAULT NULL,
  `vl_total` DECIMAL(9,2) NULL DEFAULT NULL,
  `status` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `id_usuario` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `pedido_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `ecommerce`.`usuario` (`id_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table ecommerce.pedido_item
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`pedido_item` (
  `id_item` INT NOT NULL AUTO_INCREMENT,
  `id_pedido` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `qtd` DECIMAL(9,3) NULL DEFAULT NULL,
  `vl_unitario` DECIMAL(9,2) NULL DEFAULT NULL,
  `vl_total` DECIMAL(9,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  INDEX `id_pedido` (`id_pedido` ASC) VISIBLE,
  INDEX `id_produto` (`id_produto` ASC) VISIBLE,
  CONSTRAINT `pedido_item_ibfk_1`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `ecommerce`.`pedido` (`id_pedido`),
  CONSTRAINT `pedido_item_ibfk_2`
    FOREIGN KEY (`id_produto`)
    REFERENCES `ecommerce`.`produto` (`id_produto`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table ecommerce.pedidos
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`pedidos` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `quantidade` SMALLINT NOT NULL,
  `id_produto` INT NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_pedidos_produtos_idx` (`id_produto` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_produtos`
    FOREIGN KEY (`id_produto`)
    REFERENCES `ecommerce`.`produtos` (`id_produto`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ecommerce.peoples
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`peoples` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(10) NOT NULL,
  `nome_emit` VARCHAR(45) NOT NULL,
  `premiacao` VARCHAR(10) NULL DEFAULT NULL,
  `cgc` VARCHAR(14) NULL DEFAULT NULL,
  `cidade` VARCHAR(100) NULL DEFAULT NULL,
  `tipo` VARCHAR(10) NULL DEFAULT NULL,
  `ins_estadual` VARCHAR(20) NULL DEFAULT NULL,
  `bairro` VARCHAR(100) NULL DEFAULT NULL,
  `cep` VARCHAR(10) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `nome_contato` VARCHAR(100) NULL DEFAULT NULL,
  `email_fatur` VARCHAR(100) NULL DEFAULT NULL,
  `telefone` VARCHAR(20) NULL DEFAULT NULL,
  `cod_gr_cli` VARCHAR(10) NULL DEFAULT NULL,
  `nome_abrev` VARCHAR(100) NULL DEFAULT NULL,
  `nome_matriz` VARCHAR(100) NULL DEFAULT NULL,
  `cod_rep` VARCHAR(6) NULL DEFAULT NULL,
  `estado` VARCHAR(2) NULL DEFAULT NULL,
  `pais` VARCHAR(30) NULL DEFAULT NULL,
  `endereco` VARCHAR(100) NULL DEFAULT NULL,
  `tipo_relacionamento` CHAR(1) NULL DEFAULT NULL,
  `dt_atualiza_wms` VARCHAR(26) NULL DEFAULT NULL,
  `representante` VARCHAR(30) NULL DEFAULT NULL,
  `coordenador` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ecommerce.product
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `image` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ecommerce.productimages
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`productimages` (
  `imageId` INT NOT NULL AUTO_INCREMENT,
  `productId` INT NULL DEFAULT NULL,
  `path` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`imageId`),
  INDEX `productId` (`productId` ASC) VISIBLE,
  CONSTRAINT `productimages_ibfk_1`
    FOREIGN KEY (`productId`)
    REFERENCES `ecommerce`.`products` (`productId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ecommerce.products
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`products` (
  `productId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` FLOAT NULL DEFAULT NULL,
  `productImage` VARCHAR(255) NULL DEFAULT NULL,
  `categoryId` INT NOT NULL,
  PRIMARY KEY (`productId`),
  INDEX `fk_product_category` (`categoryId` ASC) VISIBLE,
  CONSTRAINT `fk_product_category`
    FOREIGN KEY (`categoryId`)
    REFERENCES `ecommerce`.`categories` (`categoryId`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ecommerce.produto
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `id_categoria` INT NOT NULL,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `descricao` VARCHAR(1000) NULL DEFAULT NULL,
  `preco` DECIMAL(9,2) NULL DEFAULT NULL,
  `url_foto` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  INDEX `id_categoria` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `produto_ibfk_1`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `ecommerce`.`produto_categoria` (`id_categoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table ecommerce.produto_categoria
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`produto_categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NULL DEFAULT NULL,
  `ordem` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table ecommerce.produtos
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`produtos` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `preco` FLOAT NOT NULL,
  `imagem_produto` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id_produto`))
ENGINE = InnoDB
AUTO_INCREMENT = 38
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ecommerce.user
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ecommerce.users
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`users` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `token_mobile` VARCHAR(100) NULL DEFAULT NULL,
  `user` VARCHAR(45) NULL DEFAULT NULL,
  `username` VARCHAR(60) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `usermail` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ecommerce.usuario
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `senha` VARCHAR(50) NULL DEFAULT NULL,
  `endereco` VARCHAR(100) NULL DEFAULT NULL,
  `bairro` VARCHAR(50) NULL DEFAULT NULL,
  `cidade` VARCHAR(50) NULL DEFAULT NULL,
  `uf` VARCHAR(2) NULL DEFAULT NULL,
  `cep` VARCHAR(10) NULL DEFAULT NULL,
  `dt_cadastro` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table ecommerce.usuarios
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  UNIQUE INDEX `email_2` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Schema meu_mercado
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `meu_mercado` ;
CREATE SCHEMA IF NOT EXISTS `meu_mercado` ;

-- ----------------------------------------------------------------------------
-- Table meu_mercado.categories
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_mercado`.`categories` (
  `categoryId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`categoryId`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table meu_mercado.mercado
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_mercado`.`mercado` (
  `id_mercado` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `endereco` VARCHAR(100) NULL DEFAULT NULL,
  `bairro` VARCHAR(50) NULL DEFAULT NULL,
  `cidade` VARCHAR(50) NULL DEFAULT NULL,
  `uf` VARCHAR(2) NULL DEFAULT NULL,
  `cep` VARCHAR(10) NULL DEFAULT NULL,
  `dt_cadastro` DATETIME NULL DEFAULT NULL,
  `vl_entrega` DECIMAL(5,2) NULL DEFAULT NULL,
  `vl_compra_min` DECIMAL(9,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_mercado`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table meu_mercado.orders
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_mercado`.`orders` (
  `orderId` INT NOT NULL AUTO_INCREMENT,
  `productId` INT NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  INDEX `productId` (`productId` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`productId`)
    REFERENCES `meu_mercado`.`products` (`productId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table meu_mercado.pedido
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_mercado`.`pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `id_mercado` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `dt_pedido` DATETIME NULL DEFAULT NULL,
  `vl_subtotal` DECIMAL(9,2) NULL DEFAULT NULL,
  `vl_entrega` DECIMAL(5,2) NULL DEFAULT NULL,
  `vl_total` DECIMAL(9,2) NULL DEFAULT NULL,
  `endereco` VARCHAR(100) NULL DEFAULT NULL,
  `bairro` VARCHAR(50) NULL DEFAULT NULL,
  `cidade` VARCHAR(50) NULL DEFAULT NULL,
  `uf` VARCHAR(2) NULL DEFAULT NULL,
  `cep` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `id_mercado` (`id_mercado` ASC) VISIBLE,
  INDEX `id_usuario` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `pedido_ibfk_1`
    FOREIGN KEY (`id_mercado`)
    REFERENCES `meu_mercado`.`mercado` (`id_mercado`),
  CONSTRAINT `pedido_ibfk_2`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `meu_mercado`.`usuario` (`id_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table meu_mercado.pedido_item
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_mercado`.`pedido_item` (
  `id_item` INT NOT NULL AUTO_INCREMENT,
  `id_pedido` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `qtd` DECIMAL(9,3) NULL DEFAULT NULL,
  `vl_unitario` DECIMAL(9,2) NULL DEFAULT NULL,
  `vl_total` DECIMAL(9,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  INDEX `id_pedido` (`id_pedido` ASC) VISIBLE,
  INDEX `id_produto` (`id_produto` ASC) VISIBLE,
  CONSTRAINT `pedido_item_ibfk_1`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `meu_mercado`.`pedido` (`id_pedido`),
  CONSTRAINT `pedido_item_ibfk_2`
    FOREIGN KEY (`id_produto`)
    REFERENCES `meu_mercado`.`produto` (`id_produto`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table meu_mercado.products
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_mercado`.`products` (
  `productId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `price` FLOAT NULL DEFAULT NULL,
  `productImage` VARCHAR(255) NULL DEFAULT NULL,
  `categoryId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`productId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table meu_mercado.produto
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_mercado`.`produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `id_categoria` INT NOT NULL,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `descricao` VARCHAR(1000) NULL DEFAULT NULL,
  `unidade` VARCHAR(20) NULL DEFAULT NULL,
  `preco` DECIMAL(9,2) NULL DEFAULT NULL,
  `url_foto` VARCHAR(1000) NULL DEFAULT NULL,
  `id_mercado` INT NOT NULL,
  PRIMARY KEY (`id_produto`),
  INDEX `id_mercado` (`id_mercado` ASC) VISIBLE,
  INDEX `id_categoria` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `produto_ibfk_1`
    FOREIGN KEY (`id_mercado`)
    REFERENCES `meu_mercado`.`mercado` (`id_mercado`),
  CONSTRAINT `produto_ibfk_2`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `meu_mercado`.`produto_categoria` (`id_categoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table meu_mercado.produto_categoria
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_mercado`.`produto_categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NULL DEFAULT NULL,
  `ordem` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table meu_mercado.users
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_mercado`.`users` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table meu_mercado.usuario
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `meu_mercado`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `senha` VARCHAR(50) NULL DEFAULT NULL,
  `endereco` VARCHAR(100) NULL DEFAULT NULL,
  `bairro` VARCHAR(50) NULL DEFAULT NULL,
  `cidade` VARCHAR(50) NULL DEFAULT NULL,
  `uf` VARCHAR(2) NULL DEFAULT NULL,
  `cep` VARCHAR(10) NULL DEFAULT NULL,
  `dt_cadastro` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Schema nodemysql
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `nodemysql` ;
CREATE SCHEMA IF NOT EXISTS `nodemysql` ;

-- ----------------------------------------------------------------------------
-- Table nodemysql.books
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `nodemysql`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `pageqty` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Schema vakinha_burger
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `vakinha_burger` ;
CREATE SCHEMA IF NOT EXISTS `vakinha_burger` ;

-- ----------------------------------------------------------------------------
-- Table vakinha_burger.orders
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `vakinha_burger`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `id_transaction` TEXT NULL DEFAULT NULL,
  `cpf_cliente` VARCHAR(45) NULL DEFAULT NULL,
  `endereco_entrega` TEXT NOT NULL,
  `status_order` VARCHAR(20) NOT NULL DEFAULT 'pendente',
  PRIMARY KEY (`id`),
  INDEX `fk_order_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `vakinha_burger`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table vakinha_burger.orders_detail
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `vakinha_burger`.`orders_detail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantity` VARCHAR(45) NOT NULL,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_product_order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_orders_product_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_product_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `vakinha_burger`.`orders` (`id`),
  CONSTRAINT `fk_orders_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `vakinha_burger`.`product` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table vakinha_burger.product
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `vakinha_burger`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `image` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table vakinha_burger.user
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `vakinha_burger`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
SET FOREIGN_KEY_CHECKS = 1;
