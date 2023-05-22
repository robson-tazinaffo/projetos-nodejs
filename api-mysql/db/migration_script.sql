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

