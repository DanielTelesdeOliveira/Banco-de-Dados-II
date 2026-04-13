-- MySQL Workbench Forward Engineering
-- Script gerado automaticamente pelo MySQL Workbench para criação do banco

-- Desativa temporariamente verificações para evitar erros durante a criação das tabelas
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0; -- Desativa verificação de unicidade
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0; -- Desativa validação de FK
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- Define modo SQL mais restritivo para evitar inconsistências

-- -----------------------------------------------------
-- Criação do schema (banco de dados)
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommerce`
DEFAULT CHARACTER SET utf8mb4 
COLLATE utf8mb4_0900_ai_ci;
-- Cria o banco com suporte a caracteres especiais (UTF-8 completo)

USE `ecommerce`; -- Seleciona o banco para uso

-- -----------------------------------------------------
-- Tabela Tipo_Usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tipo_Usuario` (
  `tipo_usuario_id` INT NOT NULL AUTO_INCREMENT, -- ID único do tipo
  `nome_tipo` VARCHAR(45) NULL, -- Nome do tipo (ex: cliente, vendedor)
  PRIMARY KEY (`tipo_usuario_id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela Usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT, -- ID do usuário
  `Tipo_Usuario_tipo_usuario_id` INT NOT NULL, -- FK para tipo de usuário
  `nome_completo` VARCHAR(150) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `data_cadastro` DATE NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`usuario_id`),

  -- Índice para melhorar performance da FK
  INDEX `fk_Usuario_Tipo_Usuario1_idx` (`Tipo_Usuario_tipo_usuario_id`),

  -- Relacionamento com Tipo_Usuario (1:N)
  CONSTRAINT `fk_Usuario_Tipo_Usuario1`
    FOREIGN KEY (`Tipo_Usuario_tipo_usuario_id`)
    REFERENCES `Tipo_Usuario` (`tipo_usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela Endereco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Endereco` (
  `endereco_id` INT NOT NULL AUTO_INCREMENT,
  `Usuario_usuario_id` INT NOT NULL, -- FK para usuário
  `logradouro` VARCHAR(250) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `complemento` VARCHAR(200) NOT NULL,
  `estado_uf` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,

  -- PK composta (um usuário pode ter vários endereços)
  PRIMARY KEY (`endereco_id`, `Usuario_usuario_id`),

  INDEX `fk_endereco_Usuario1_idx` (`Usuario_usuario_id`),

  CONSTRAINT `fk_endereco_Usuario1`
    FOREIGN KEY (`Usuario_usuario_id`)
    REFERENCES `Usuario` (`usuario_id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela Usuario_PF (Pessoa Física)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Usuario_PF` (
  `usuario_pf_id` INT NOT NULL AUTO_INCREMENT,
  `Usuario_usuario_id` INT NOT NULL, -- FK para usuário
  `cpf` VARCHAR(45) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  PRIMARY KEY (`usuario_pf_id`),

  INDEX `fk_Usuario_PF_Usuario1_idx` (`Usuario_usuario_id`),

  CONSTRAINT `fk_Usuario_PF_Usuario1`
    FOREIGN KEY (`Usuario_usuario_id`)
    REFERENCES `Usuario` (`usuario_id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela Usuario_PJ (Pessoa Jurídica)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Usuario_PJ` (
  `usuario_pj_id` INT NOT NULL AUTO_INCREMENT,
  `Usuario_usuario_id` INT NOT NULL,
  `razao_social` VARCHAR(200) NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  `inscricao_estadual` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`usuario_pj_id`),

  INDEX `fk_Usuario_PJ_Usuario1_idx` (`Usuario_usuario_id`),

  CONSTRAINT `fk_Usuario_PJ_Usuario1`
    FOREIGN KEY (`Usuario_usuario_id`)
    REFERENCES `Usuario` (`usuario_id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela Categoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Categoria` (
  `categoria_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT NOT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela Produto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Produto` (
  `produto_id` INT NOT NULL AUTO_INCREMENT,
  `Categoria_categoria_id` INT NOT NULL, -- FK categoria
  `preco` DECIMAL(10,2) NOT NULL,
  `ativo` TINYINT NOT NULL, -- Produto ativo/inativo
  `estoque_qtd` INT NOT NULL, -- (atenção: deveria ser INT)
  PRIMARY KEY (`produto_id`),

  INDEX `fk_Produto_Categoria1_idx` (`Categoria_categoria_id`),

  CONSTRAINT `fk_Produto_Categoria1`
    FOREIGN KEY (`Categoria_categoria_id`)
    REFERENCES `Categoria` (`categoria_id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela Anuncio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Anuncio` (
  `anuncio_id` INT NOT NULL AUTO_INCREMENT,
  `Usuario_usuario_id` INT NOT NULL, -- Quem anunciou
  `Produto_produto_id` INT NOT NULL, -- Produto anunciado
  `nome` VARCHAR(200) NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  `data` DATE NOT NULL,
  `ativo` TINYINT NOT NULL,
  PRIMARY KEY (`anuncio_id`),

  INDEX `fk_Anuncio_Usuario1_idx` (`Usuario_usuario_id`),
  INDEX `fk_Anuncio_Produto1_idx` (`Produto_produto_id`),

  -- Relacionamentos
  CONSTRAINT `fk_Anuncio_Usuario1`
    FOREIGN KEY (`Usuario_usuario_id`) REFERENCES `Usuario` (`usuario_id`),

  CONSTRAINT `fk_Anuncio_Produto1`
    FOREIGN KEY (`Produto_produto_id`) REFERENCES `Produto` (`produto_id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela Pedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedido` (
  `pedido_id` INT NOT NULL AUTO_INCREMENT,
  `Usuario_usuario_id` INT NOT NULL, -- Cliente
  `data_pedido` DATE NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `valor_total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`pedido_id`),

  INDEX `fk_Pedido_Usuario1_idx` (`Usuario_usuario_id`),

  CONSTRAINT `fk_Pedido_Usuario1`
    FOREIGN KEY (`Usuario_usuario_id`)
    REFERENCES `Usuario` (`usuario_id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela Item_Pedido (relacionamento N:N)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Item_Pedido` (
  `item_pedido_id` INT NOT NULL AUTO_INCREMENT,
  `Pedido_pedido_id` INT NOT NULL,
  `Produto_produto_id` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `preco_unitario` DECIMAL(10,2) NOT NULL,
  `observacao` TEXT NULL,
  PRIMARY KEY (`item_pedido_id`),

  -- FKs para Pedido e Produto
  CONSTRAINT `fk_Item_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_pedido_id`) REFERENCES `Pedido` (`pedido_id`),

  CONSTRAINT `fk_Item_Pedido_Produto1`
    FOREIGN KEY (`Produto_produto_id`) REFERENCES `Produto` (`produto_id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela Pagamento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pagamento` (
  `pagamento_id` INT NOT NULL AUTO_INCREMENT,
  `Pedido_pedido_id` INT NOT NULL, -- FK pedido
  `nome` VARCHAR(50) NOT NULL, -- Ex: cartão, pix
  `descricao` TEXT NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `valor_pago` DECIMAL(10,2) NOT NULL,
  `data_pagamento` DATE NOT NULL,
  PRIMARY KEY (`pagamento_id`),

  CONSTRAINT `fk_Pagamento_Pedido1`
    FOREIGN KEY (`Pedido_pedido_id`)
    REFERENCES `Pedido` (`pedido_id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela Transportadora
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Transportadora` (
  `transportadora_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cnpj` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`transportadora_id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela Entrega
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Entrega` (
  `entrega_id` INT NOT NULL AUTO_INCREMENT,
  `Transportadora_transportadora_id` INT NOT NULL,
  `Pedido_pedido_id` INT NOT NULL,
  `data_entrega` DATE NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `codigo_rastreio` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`entrega_id`),

  CONSTRAINT `fk_Entrega_Transportadora1`
    FOREIGN KEY (`Transportadora_transportadora_id`)
    REFERENCES `Transportadora` (`transportadora_id`),

  CONSTRAINT `fk_Entrega_Pedido1`
    FOREIGN KEY (`Pedido_pedido_id`)
    REFERENCES `Pedido` (`pedido_id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela Avaliacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Avaliacao` (
  `avaliacao_id` INT NOT NULL AUTO_INCREMENT,
  `Usuario_usuario_id` INT NOT NULL,
  `Produto_produto_id` INT NOT NULL,
  `nota` INT NOT NULL,
  `descricao` TEXT NOT NULL,
  PRIMARY KEY (`avaliacao_id`),

  CONSTRAINT `fk_Avaliacao_Usuario1`
    FOREIGN KEY (`Usuario_usuario_id`) REFERENCES `Usuario` (`usuario_id`),

  CONSTRAINT `fk_Avaliacao_Produto1`
    FOREIGN KEY (`Produto_produto_id`) REFERENCES `Produto` (`produto_id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela Características (dados técnicos do produto)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Características` (
  `caracteristicas_id` INT NOT NULL AUTO_INCREMENT,
  `Produto_produto_id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` LONGTEXT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NULL,
  `peso` DECIMAL(10,2) NOT NULL,
  `dimensao` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`caracteristicas_id`),

  CONSTRAINT `fk_Características_Produto1`
    FOREIGN KEY (`Produto_produto_id`)
    REFERENCES `Produto` (`produto_id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Restaura configurações originais
-- -----------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;