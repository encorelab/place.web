SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `placeweb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `placeweb` ;

-- -----------------------------------------------------
-- Table `placeweb`.`run`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`run` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`run` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`user` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `last_login` DATETIME NULL ,
  `username` VARCHAR(255) NOT NULL ,
  `password` VARCHAR(255) NULL ,
  `user_type` ENUM('STUDENT', 'TEACHER','ADMIN') NOT NULL ,
  `display_name` VARCHAR(255) NOT NULL ,
  `group_name` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_users_runs` (`run_id` ASC) ,
  CONSTRAINT `fk_users_runs`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`elo_template`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`elo_template` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`elo_template` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  CONSTRAINT `fk_template_users`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs1`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`question` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`question` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `name` VARCHAR(255) NULL ,
  `type` ENUM('MC', 'LONG') NOT NULL DEFAULT 'MC' ,
  `content` TEXT NULL ,
  `media_content` TEXT NULL ,
  `media_path` VARCHAR(255) NULL ,
  `media_type` VARCHAR(255) NULL ,
  `choices` INT NULL ,
  `status` INT NULL DEFAULT 0 ,
  `is_published` INT NOT NULL DEFAULT 0 ,
  `is_public` INT NOT NULL DEFAULT 0 ,
  `allow_multipe_answer` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  CONSTRAINT `fk_template_users0`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs10`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`answer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`answer` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`answer` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `name` VARCHAR(255) NULL ,
  `content` TEXT NULL ,
  `question_id` INT NULL ,
  `mc_chocie` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  INDEX `fk_answers_questions1` (`question_id` ASC) ,
  CONSTRAINT `fk_template_users1`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs11`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answers_questions1`
    FOREIGN KEY (`question_id` )
    REFERENCES `placeweb`.`question` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`example`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`example` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`example` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `name` VARCHAR(255) NULL ,
  `content` TEXT NULL ,
  `media_content` TEXT NULL ,
  `media_path` VARCHAR(255) NULL ,
  `media_type` VARCHAR(255) NULL ,
  `type` INT NULL ,
  `is_published` TINYINT(1)  NOT NULL DEFAULT 0 ,
  `is_public` TINYINT(1)  NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  CONSTRAINT `fk_template_users2`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs12`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`concept`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`concept` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`concept` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `name` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  CONSTRAINT `fk_template_users20`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs120`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`answer_concept`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`answer_concept` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`answer_concept` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `answer_id` INT NOT NULL ,
  `concept_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  INDEX `fk_answer_concept_answers1` (`answer_id` ASC) ,
  INDEX `fk_answer_concept_concepts1` (`concept_id` ASC) ,
  CONSTRAINT `fk_template_users200`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs1200`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_concept_answers1`
    FOREIGN KEY (`answer_id` )
    REFERENCES `placeweb`.`answer` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_concept_concepts1`
    FOREIGN KEY (`concept_id` )
    REFERENCES `placeweb`.`concept` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`example_concept`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`example_concept` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`example_concept` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `example_id` INT NOT NULL ,
  `concept_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  INDEX `fk_answer_concept_answers1` (`example_id` ASC) ,
  INDEX `fk_answer_concept_concepts1` (`concept_id` ASC) ,
  CONSTRAINT `fk_template_users2000`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs12000`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_concept_answers10`
    FOREIGN KEY (`example_id` )
    REFERENCES `placeweb`.`example` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_concept_concepts10`
    FOREIGN KEY (`concept_id` )
    REFERENCES `placeweb`.`concept` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`activity_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`activity_type` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`activity_type` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `name` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  CONSTRAINT `fk_template_users3`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs13`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`activity` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`activity` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `activity_type_id` INT NOT NULL ,
  `activity_on_user` INT NULL ,
  `i1` INT NULL ,
  `i2` INT NULL ,
  `i3` INT NULL ,
  `i4` INT NULL ,
  `i5` INT NULL ,
  `s1` VARCHAR(255) NULL ,
  `s2` VARCHAR(255) NULL ,
  `s3` VARCHAR(255) NULL ,
  `t1` TEXT NULL ,
  `t2` TEXT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  INDEX `fk_activity_activity_type1` (`activity_type_id` ASC) ,
  INDEX `fk_activities_users1` (`activity_on_user` ASC) ,
  CONSTRAINT `fk_template_users4`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs14`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_activity_type1`
    FOREIGN KEY (`activity_type_id` )
    REFERENCES `placeweb`.`activity_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activities_users1`
    FOREIGN KEY (`activity_on_user` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`votable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`votable` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`votable` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `object` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  CONSTRAINT `fk_template_users50`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs150`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`vote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`vote` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`vote` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `obj_id` INT NOT NULL ,
  `obj_type` INT NOT NULL ,
  `vote_value` DOUBLE NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  INDEX `fk_votes_votable1` (`obj_type` ASC) ,
  CONSTRAINT `fk_template_users5`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs15`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_votes_votable1`
    FOREIGN KEY (`obj_type` )
    REFERENCES `placeweb`.`votable` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`commentable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`commentable` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`commentable` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `object` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  CONSTRAINT `fk_template_users500`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs1500`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`assessable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`assessable` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`assessable` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `object` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  CONSTRAINT `fk_template_users5000`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs15000`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`comment` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `obj_id` INT NOT NULL ,
  `obj_type` INT NOT NULL ,
  `content` TEXT NULL ,
  `parent_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  INDEX `fk_votes_votable1` (`obj_type` ASC) ,
  INDEX `fk_comments_comments1` (`parent_id` ASC) ,
  CONSTRAINT `fk_template_users51`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs151`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_votes_votable10`
    FOREIGN KEY (`obj_type` )
    REFERENCES `placeweb`.`commentable` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_comments1`
    FOREIGN KEY (`parent_id` )
    REFERENCES `placeweb`.`comment` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`assessment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`assessment` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`assessment` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `obj_id` INT NOT NULL ,
  `obj_type` INT NOT NULL ,
  `mark` DOUBLE NULL ,
  `assessment_review_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  INDEX `fk_votes_votable1` (`obj_type` ASC) ,
  CONSTRAINT `fk_template_users510`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs1510`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_votes_votable100`
    FOREIGN KEY (`obj_type` )
    REFERENCES `placeweb`.`assessable` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`resolved_user_alert`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`resolved_user_alert` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`resolved_user_alert` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `activity_id` INT NOT NULL ,
  `response` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  INDEX `fk_user_alert_confirmed_activities1` (`activity_id` ASC) ,
  CONSTRAINT `fk_template_users6`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs16`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_alert_confirmed_activities1`
    FOREIGN KEY (`activity_id` )
    REFERENCES `placeweb`.`activity` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`question_concept`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`question_concept` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`question_concept` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `question_id` INT NOT NULL ,
  `concept_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  INDEX `fk_question_concept_question1` (`question_id` ASC) ,
  INDEX `fk_question_concept_concepts1` (`concept_id` ASC) ,
  CONSTRAINT `fk_template_users20000`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs120000`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_concept_answers100`
    FOREIGN KEY (`question_id` )
    REFERENCES `placeweb`.`question` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_concept_concepts100`
    FOREIGN KEY (`concept_id` )
    REFERENCES `placeweb`.`concept` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`assessment_reviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`assessment_reviews` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`assessment_reviews` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `assessment_id` INT NULL ,
  `log` TEXT NULL ,
  `i1` INT NULL ,
  `i2` INT NULL ,
  `t1` VARCHAR(255) NULL ,
  `t2` VARCHAR(255) NULL ,
  `mark_for_discussion` TINYINT(1)  NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  INDEX `fk_assessment_reviews_assessment1` (`assessment_id` ASC) ,
  CONSTRAINT `fk_template_users5100`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs15100`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assessment_reviews_assessment1`
    FOREIGN KEY (`assessment_id` )
    REFERENCES `placeweb`.`assessment` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`collectable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`collectable` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`collectable` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `object` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  CONSTRAINT `fk_template_users501`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs1501`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`collection`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`collection` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`collection` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP ,
  `date_created` TIMESTAMP NULL ,
  `obj_type` INT NOT NULL ,
  `name` VARCHAR(100) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_template_users` (`author_id` ASC) ,
  INDEX `fk_template_runs` (`run_id` ASC) ,
  INDEX `fk_votes_votable1` (`obj_type` ASC) ,
  CONSTRAINT `fk_template_users52`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs152`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_votes_votable11`
    FOREIGN KEY (`obj_type` )
    REFERENCES `placeweb`.`votable` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `placeweb`.`collection_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `placeweb`.`collection_item` ;

CREATE  TABLE IF NOT EXISTS `placeweb`.`collection_item` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `run_id` INT NOT NULL ,
  `author_id` INT NOT NULL ,
  `date_modified` TIMESTAMP NULL ,
  `date_created` TIMESTAMP NULL ,
  `obj_id` INT NOT NULL ,
  `collection_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_collection_item_collection1` (`collection_id` ASC) ,
  CONSTRAINT `fk_collection_item_collection1`
    FOREIGN KEY (`collection_id` )
    REFERENCES `placeweb`.`collection` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
