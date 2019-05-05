-- MySQL Script generated by MySQL Workbench
-- 05/05/19 00:26:20
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sistema_inventario
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sistema_inventario
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistema_inventario` DEFAULT CHARACTER SET latin1 ;
USE `sistema_inventario` ;

-- -----------------------------------------------------
-- Table `sistema_inventario`.`cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_inventario`.`cargos` (
  `id_cargo` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `descricao` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id_cargo`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sistema_inventario`.`estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_inventario`.`estados` (
  `id_estado` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id_estado`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sistema_inventario`.`cidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_inventario`.`cidades` (
  `id_cidade` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(45) NOT NULL COMMENT '',
  `id_estado` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_cidade`)  COMMENT '',
  INDEX `fk_cidades_estados1_idx` (`id_estado` ASC)  COMMENT '',
  CONSTRAINT `fk_cidades_estados1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `sistema_inventario`.`estados` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sistema_inventario`.`pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_inventario`.`pessoas` (
  `id_pessoa` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(45) NOT NULL COMMENT '',
  `CPF` VARCHAR(15) NOT NULL COMMENT '',
  `telefone` VARCHAR(15) NOT NULL COMMENT '',
  `email` VARCHAR(45) NOT NULL COMMENT '',
  `sexo` VARCHAR(10) NOT NULL COMMENT '',
  `endereco` VARCHAR(45) NOT NULL COMMENT '',
  `id_cidade` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_pessoa`)  COMMENT '',
  INDEX `fk_pessoas_cidades1_idx` (`id_cidade` ASC)  COMMENT '',
  CONSTRAINT `fk_pessoas_cidades1`
    FOREIGN KEY (`id_cidade`)
    REFERENCES `sistema_inventario`.`cidades` (`id_cidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sistema_inventario`.`coordenadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_inventario`.`coordenadores` (
  `id_coordenador` INT(11) NOT NULL COMMENT '',
  `id_pessoa` INT(11) NOT NULL COMMENT '',
  `status` TINYINT(1) NOT NULL COMMENT '',
  `senha` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id_coordenador`)  COMMENT '',
  INDEX `fk_coordenadores_pessoas1_idx` (`id_pessoa` ASC)  COMMENT '',
  CONSTRAINT `fk_coordenadores_pessoas1`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `sistema_inventario`.`pessoas` (`id_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sistema_inventario`.`setores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_inventario`.`setores` (
  `id_setor` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `id_coordenador` INT(11) NOT NULL COMMENT '',
  `ramal_telefonico` INT(11) NOT NULL COMMENT '',
  `nome` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id_setor`)  COMMENT '',
  INDEX `fk_setores_coordenadores1_idx` (`id_coordenador` ASC)  COMMENT '',
  CONSTRAINT `fk_setores_coordenadores1`
    FOREIGN KEY (`id_coordenador`)
    REFERENCES `sistema_inventario`.`coordenadores` (`id_coordenador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sistema_inventario`.`funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_inventario`.`funcionarios` (
  `id_funcionario` INT(11) NOT NULL COMMENT '',
  `id_pessoa` INT(11) NOT NULL COMMENT '',
  `id_cargo` INT(11) NOT NULL COMMENT '',
  `horario` VARCHAR(45) NOT NULL COMMENT '',
  `status` TINYINT(1) NOT NULL COMMENT '',
  `id_setor` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_funcionario`)  COMMENT '',
  INDEX `fk_funcionarios_pessoas1_idx` (`id_pessoa` ASC)  COMMENT '',
  INDEX `fk_funcionarios_cargos1_idx` (`id_cargo` ASC)  COMMENT '',
  INDEX `fk_funcionarios_setores1_idx` (`id_setor` ASC)  COMMENT '',
  CONSTRAINT `fk_funcionarios_cargos1`
    FOREIGN KEY (`id_cargo`)
    REFERENCES `sistema_inventario`.`cargos` (`id_cargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionarios_pessoas1`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `sistema_inventario`.`pessoas` (`id_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionarios_setores1`
    FOREIGN KEY (`id_setor`)
    REFERENCES `sistema_inventario`.`setores` (`id_setor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sistema_inventario`.`emprestimos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_inventario`.`emprestimos` (
  `id_emprestimo` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `id_funcionário` INT(11) NOT NULL COMMENT '',
  `data` DATETIME NOT NULL COMMENT '',
  `data_devolucao` DATETIME NOT NULL COMMENT '',
  `observacao` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id_emprestimo`)  COMMENT '',
  INDEX `fk_emprestimos_funcionarios1_idx` (`id_funcionário` ASC)  COMMENT '',
  CONSTRAINT `fk_emprestimos_funcionarios1`
    FOREIGN KEY (`id_funcionário`)
    REFERENCES `sistema_inventario`.`funcionarios` (`id_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sistema_inventario`.`devolucoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_inventario`.`devolucoes` (
  `id_devolucao` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `id_emprestimo` INT(11) NOT NULL COMMENT '',
  `data` DATETIME NOT NULL COMMENT '',
  `observacao` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id_devolucao`)  COMMENT '',
  INDEX `fk_devolucoes_emprestimos1_idx` (`id_emprestimo` ASC)  COMMENT '',
  CONSTRAINT `fk_devolucoes_emprestimos1`
    FOREIGN KEY (`id_emprestimo`)
    REFERENCES `sistema_inventario`.`emprestimos` (`id_emprestimo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sistema_inventario`.`itens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_inventario`.`itens` (
  `id_item` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `id_setor` INT(11) NOT NULL COMMENT '',
  `matricula` VARCHAR(25) NOT NULL COMMENT '',
  `modelo` VARCHAR(45) NOT NULL COMMENT '',
  `quantidade` INT(11) NOT NULL COMMENT '',
  `localizacao` VARCHAR(100) NOT NULL COMMENT '',
  `data_aquisicao` DATETIME NOT NULL COMMENT '',
  `valor_aquisicao` INT(11) NOT NULL COMMENT '',
  `vida_util` DATETIME NOT NULL COMMENT '',
  `descricao_estado` VARCHAR(45) NOT NULL COMMENT '',
  `situacao` TINYINT(1) NOT NULL COMMENT '',
  `status` TINYINT(1) NOT NULL COMMENT '',
  PRIMARY KEY (`id_item`)  COMMENT '',
  INDEX `fk_itens_setores1_idx` (`id_setor` ASC)  COMMENT '',
  CONSTRAINT `fk_itens_setores1`
    FOREIGN KEY (`id_setor`)
    REFERENCES `sistema_inventario`.`setores` (`id_setor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sistema_inventario`.`itens_devolucoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_inventario`.`itens_devolucoes` (
  `id_devolucao` INT(11) NOT NULL COMMENT '',
  `id_item` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_devolucao`, `id_item`)  COMMENT '',
  INDEX `fk_devolucoes_has_itens_itens1_idx` (`id_item` ASC)  COMMENT '',
  INDEX `fk_devolucoes_has_itens_devolucoes1_idx` (`id_devolucao` ASC)  COMMENT '',
  CONSTRAINT `fk_devolucoes_has_itens_devolucoes1`
    FOREIGN KEY (`id_devolucao`)
    REFERENCES `sistema_inventario`.`devolucoes` (`id_devolucao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_devolucoes_has_itens_itens1`
    FOREIGN KEY (`id_item`)
    REFERENCES `sistema_inventario`.`itens` (`id_item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sistema_inventario`.`itens_emprestimos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_inventario`.`itens_emprestimos` (
  `id_emprestimo` INT(11) NOT NULL COMMENT '',
  `id_item` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id_emprestimo`, `id_item`)  COMMENT '',
  INDEX `fk_emprestimos_has_itens_itens1_idx` (`id_item` ASC)  COMMENT '',
  INDEX `fk_emprestimos_has_itens_emprestimos1_idx` (`id_emprestimo` ASC)  COMMENT '',
  CONSTRAINT `fk_emprestimos_has_itens_emprestimos1`
    FOREIGN KEY (`id_emprestimo`)
    REFERENCES `sistema_inventario`.`emprestimos` (`id_emprestimo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emprestimos_has_itens_itens1`
    FOREIGN KEY (`id_item`)
    REFERENCES `sistema_inventario`.`itens` (`id_item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
