SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
DROP SCHEMA IF EXISTS `corruptos_development` ;
CREATE SCHEMA IF NOT EXISTS `corruptos_development` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `mydb` ;
USE `corruptos_development` ;

-- -----------------------------------------------------
-- Table `corruptos_development`.`ufs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`ufs` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`ufs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `sigla` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `nome` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE UNIQUE INDEX `nome_UNIQUE` ON `corruptos_development`.`ufs` (`nome` ASC) ;

CREATE UNIQUE INDEX `sigla_UNIQUE` ON `corruptos_development`.`ufs` (`sigla` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`municipios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`municipios` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`municipios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `ufs_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_municipios_ufs1`
    FOREIGN KEY (`ufs_id` )
    REFERENCES `corruptos_development`.`ufs` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5593
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `fk_municipios_ufs1_idx` ON `corruptos_development`.`municipios` (`ufs_id` ASC) ;

CREATE UNIQUE INDEX `nome_UNIQUE` ON `corruptos_development`.`municipios` (`nome` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`enderecos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`enderecos` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`enderecos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `logradouro` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `numero` INT(11) NULL DEFAULT NULL ,
  `bairro` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `cep` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `complemento` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `tipo_logradouro` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `municipios_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_enderecos_municipios1`
    FOREIGN KEY (`municipios_id` )
    REFERENCES `corruptos_development`.`municipios` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 249
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `fk_enderecos_municipios1_idx` ON `corruptos_development`.`enderecos` (`municipios_id` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`eleitors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`eleitors` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`eleitors` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `nome_mae` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `rg` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `data_nascimento` DATE NOT NULL ,
  `cpf` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `enderecos_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_eleitors_enderecos1`
    FOREIGN KEY (`enderecos_id` )
    REFERENCES `corruptos_development`.`enderecos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11969
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `fk_eleitors_enderecos1_idx` ON `corruptos_development`.`eleitors` (`enderecos_id` ASC) ;

CREATE UNIQUE INDEX `cpf_UNIQUE` ON `corruptos_development`.`eleitors` (`cpf` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`candidatos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`candidatos` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`candidatos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `nome_campanha` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `eleitors_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_candidatos_eleitors1`
    FOREIGN KEY (`eleitors_id` )
    REFERENCES `corruptos_development`.`eleitors` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1975
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `fk_candidatos_eleitors1_idx` ON `corruptos_development`.`candidatos` (`eleitors_id` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`cargos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`cargos` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`cargos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE UNIQUE INDEX `nome_UNIQUE` ON `corruptos_development`.`cargos` (`nome` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`eleicaos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`eleicaos` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`eleicaos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `ano` INT(11) NOT NULL ,
  `status` TINYINT(1) NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `data` DATE NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE UNIQUE INDEX `ano_UNIQUE` ON `corruptos_development`.`eleicaos` (`ano` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`cargo_eleicaos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`cargo_eleicaos` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`cargo_eleicaos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `vagas` INT(11) NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `cargos_id` INT(11) NOT NULL ,
  `eleicaos_id` INT(11) NOT NULL ,
  `municipios_id` INT(11) NOT NULL ,
  `ufs_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_cargo_eleicaos_cargos`
    FOREIGN KEY (`cargos_id` )
    REFERENCES `corruptos_development`.`cargos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cargo_eleicaos_eleicaos1`
    FOREIGN KEY (`eleicaos_id` )
    REFERENCES `corruptos_development`.`eleicaos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cargo_eleicaos_municipios1`
    FOREIGN KEY (`municipios_id` )
    REFERENCES `corruptos_development`.`municipios` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cargo_eleicaos_ufs1`
    FOREIGN KEY (`ufs_id` )
    REFERENCES `corruptos_development`.`ufs` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 739
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `fk_cargo_eleicaos_cargos_idx` ON `corruptos_development`.`cargo_eleicaos` (`cargos_id` ASC) ;

CREATE INDEX `fk_cargo_eleicaos_eleicaos1_idx` ON `corruptos_development`.`cargo_eleicaos` (`eleicaos_id` ASC) ;

CREATE INDEX `fk_cargo_eleicaos_municipios1_idx` ON `corruptos_development`.`cargo_eleicaos` (`municipios_id` ASC) ;

CREATE INDEX `fk_cargo_eleicaos_ufs1_idx` ON `corruptos_development`.`cargo_eleicaos` (`ufs_id` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`partidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`partidos` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`partidos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `sigla` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `numero` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 30
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE UNIQUE INDEX `nome_UNIQUE` ON `corruptos_development`.`partidos` (`nome` ASC) ;

CREATE UNIQUE INDEX `sigla_UNIQUE` ON `corruptos_development`.`partidos` (`sigla` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`candidaturas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`candidaturas` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`candidaturas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `codigo_candidato` INT(11) NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `cargo_eleicaos_id` INT(11) NOT NULL ,
  `candidatos_id` INT(11) NOT NULL ,
  `partidos_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_candidaturas_cargo_eleicaos1`
    FOREIGN KEY (`cargo_eleicaos_id` )
    REFERENCES `corruptos_development`.`cargo_eleicaos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_candidaturas_candidatos1`
    FOREIGN KEY (`candidatos_id` )
    REFERENCES `corruptos_development`.`candidatos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_candidaturas_partidos1`
    FOREIGN KEY (`partidos_id` )
    REFERENCES `corruptos_development`.`partidos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1968
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `fk_candidaturas_cargo_eleicaos1_idx` ON `corruptos_development`.`candidaturas` (`cargo_eleicaos_id` ASC) ;

CREATE INDEX `fk_candidaturas_candidatos1_idx` ON `corruptos_development`.`candidaturas` (`candidatos_id` ASC) ;

CREATE INDEX `fk_candidaturas_partidos1_idx` ON `corruptos_development`.`candidaturas` (`partidos_id` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`coligacaos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`coligacaos` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`coligacaos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `cargo_eleicaos_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_coligacaos_cargo_eleicaos1`
    FOREIGN KEY (`cargo_eleicaos_id` )
    REFERENCES `corruptos_development`.`cargo_eleicaos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `fk_coligacaos_cargo_eleicaos1_idx` ON `corruptos_development`.`coligacaos` (`cargo_eleicaos_id` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`coligacao_partidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`coligacao_partidos` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`coligacao_partidos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `coligacaos_id` INT(11) NOT NULL ,
  `partidos_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_coligacao_partidos_coligacaos1`
    FOREIGN KEY (`coligacaos_id` )
    REFERENCES `corruptos_development`.`coligacaos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_coligacao_partidos_partidos1`
    FOREIGN KEY (`partidos_id` )
    REFERENCES `corruptos_development`.`partidos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `fk_coligacao_partidos_coligacaos1_idx` ON `corruptos_development`.`coligacao_partidos` (`coligacaos_id` ASC) ;

CREATE INDEX `fk_coligacao_partidos_partidos1_idx` ON `corruptos_development`.`coligacao_partidos` (`partidos_id` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`roles` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `resource_id` INT(11) NULL DEFAULT NULL ,
  `resource_type` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `index_roles_on_name` ON `corruptos_development`.`roles` (`name` ASC) ;

CREATE INDEX `index_roles_on_name_and_resource_type_and_resource_id` ON `corruptos_development`.`roles` (`name` ASC, `resource_type` ASC, `resource_id` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`schema_migrations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`schema_migrations` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`schema_migrations` (
  `version` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE UNIQUE INDEX `unique_schema_migrations` ON `corruptos_development`.`schema_migrations` (`version` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`zonas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`zonas` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`zonas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `descricao` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `enderecos_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_zonas_enderecos1`
    FOREIGN KEY (`enderecos_id` )
    REFERENCES `corruptos_development`.`enderecos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 493
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `fk_zonas_enderecos1_idx` ON `corruptos_development`.`zonas` (`enderecos_id` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`secaos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`secaos` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`secaos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `limite_eleitores` INT(11) NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `codigo` INT(11) NOT NULL ,
  `zonas_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_secaos_zonas1`
    FOREIGN KEY (`zonas_id` )
    REFERENCES `corruptos_development`.`zonas` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1474
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `fk_secaos_zonas1_idx` ON `corruptos_development`.`secaos` (`zonas_id` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`titulos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`titulos` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`titulos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `data_emissao` DATE NOT NULL ,
  `juiz_eleitoral` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `status` TINYINT(1) NULL DEFAULT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `codigo` INT(11) NOT NULL ,
  `eleitors_id` INT(11) NOT NULL ,
  `secaos_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_titulos_eleitors1`
    FOREIGN KEY (`eleitors_id` )
    REFERENCES `corruptos_development`.`eleitors` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_titulos_secaos1`
    FOREIGN KEY (`secaos_id` )
    REFERENCES `corruptos_development`.`secaos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11970
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `fk_titulos_eleitors1_idx` ON `corruptos_development`.`titulos` (`eleitors_id` ASC) ;

CREATE INDEX `fk_titulos_secaos1_idx` ON `corruptos_development`.`titulos` (`secaos_id` ASC) ;

CREATE UNIQUE INDEX `codigo_UNIQUE` ON `corruptos_development`.`titulos` (`codigo` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`users` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL DEFAULT '' ,
  `encrypted_password` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL DEFAULT '' ,
  `reset_password_token` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `reset_password_sent_at` DATETIME NULL DEFAULT NULL ,
  `remember_created_at` DATETIME NULL DEFAULT NULL ,
  `sign_in_count` INT(11) NULL DEFAULT '0' ,
  `current_sign_in_at` DATETIME NULL DEFAULT NULL ,
  `last_sign_in_at` DATETIME NULL DEFAULT NULL ,
  `current_sign_in_ip` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `last_sign_in_ip` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `name` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE UNIQUE INDEX `index_users_on_email` ON `corruptos_development`.`users` (`email` ASC) ;

CREATE UNIQUE INDEX `index_users_on_reset_password_token` ON `corruptos_development`.`users` (`reset_password_token` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`users_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`users_roles` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`users_roles` (
  `users_id` INT(11) NOT NULL ,
  `roles_id` INT(11) NOT NULL ,
  CONSTRAINT `fk_users_roles_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `corruptos_development`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_roles_roles1`
    FOREIGN KEY (`roles_id` )
    REFERENCES `corruptos_development`.`roles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `fk_users_roles_users1_idx` ON `corruptos_development`.`users_roles` (`users_id` ASC) ;

CREATE INDEX `fk_users_roles_roles1_idx` ON `corruptos_development`.`users_roles` (`roles_id` ASC) ;


-- -----------------------------------------------------
-- Table `corruptos_development`.`votos_urnas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corruptos_development`.`votos_urnas` ;

CREATE  TABLE IF NOT EXISTS `corruptos_development`.`votos_urnas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `qtd_votos` INT(11) NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `updated_at` DATETIME NOT NULL ,
  `secaos_id` INT(11) NOT NULL ,
  `candidaturas_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_votos_urnas_secaos1`
    FOREIGN KEY (`secaos_id` )
    REFERENCES `corruptos_development`.`secaos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_votos_urnas_candidaturas1`
    FOREIGN KEY (`candidaturas_id` )
    REFERENCES `corruptos_development`.`candidaturas` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11767
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE INDEX `fk_votos_urnas_secaos1_idx` ON `corruptos_development`.`votos_urnas` (`secaos_id` ASC) ;

CREATE INDEX `fk_votos_urnas_candidaturas1_idx` ON `corruptos_development`.`votos_urnas` (`candidaturas_id` ASC) ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
