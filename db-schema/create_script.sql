-- MySQL Script generated by MySQL Workbench
-- 11/06/16 04:43:21
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema gamescores_server
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gamescores_server
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gamescores_server` DEFAULT CHARACTER SET latin1 ;
USE `gamescores_server` ;

-- -----------------------------------------------------
-- Table `gamescores_server`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gamescores_server`.`games` (
  `game_id` INT(11) UNSIGNED NOT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `code` VARCHAR(25) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `levels` INT(11) NOT NULL DEFAULT '0',
  `creation_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`game_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `game_id_UNIQUE` ON `gamescores_server`.`games` (`game_id` ASC);

CREATE UNIQUE INDEX `code_UNIQUE` ON `gamescores_server`.`games` (`code` ASC);


-- -----------------------------------------------------
-- Table `gamescores_server`.`challenges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gamescores_server`.`challenges` (
  `challenge_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `game_id` INT(11) UNSIGNED NOT NULL,
  `challenge` TEXT NOT NULL,
  `level` INT(11) NULL DEFAULT NULL,
  `group` VARCHAR(45) NULL DEFAULT NULL,
  `` VARCHAR(45) NULL,
  PRIMARY KEY (`challenge_id`),
  CONSTRAINT `challenges_game_id_FK`
    FOREIGN KEY (`game_id`)
    REFERENCES `gamescores_server`.`games` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `challenge_id_UNIQUE` ON `gamescores_server`.`challenges` (`challenge_id` ASC);

CREATE INDEX `challenges_game_id_FK` ON `gamescores_server`.`challenges` (`game_id` ASC);


-- -----------------------------------------------------
-- Table `gamescores_server`.`scores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gamescores_server`.`scores` (
  `score_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `game_id` INT(11) UNSIGNED NOT NULL,
  `player_name` VARCHAR(25) NOT NULL,
  `value` INT(11) NOT NULL DEFAULT 0,
  `post_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`score_id`),
  CONSTRAINT `scores_game_id_FK`
    FOREIGN KEY (`game_id`)
    REFERENCES `gamescores_server`.`games` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `score_id_UNIQUE` ON `gamescores_server`.`scores` (`score_id` ASC);

CREATE INDEX `player_name_INDEX` ON `gamescores_server`.`scores` (`player_name` ASC);

CREATE INDEX `scores_game_id_FK` ON `gamescores_server`.`scores` (`game_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
