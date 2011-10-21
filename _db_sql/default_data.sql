SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `placeweb` ;
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
  `last_login` DATETIME NULL,
  `username` VARCHAR(255) NOT NULL ,
  `password` VARCHAR(255) NULL ,
  `user_type` ENUM('STUDENT', 'TEACHER','ADMIN') NOT NULL ,
  `display_name` VARCHAR(255) NOT NULL ,
  `group_name` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_users_runs`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_users_runs` ON `placeweb`.`user` (`run_id` ASC) ;


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

CREATE INDEX `fk_template_users` ON `placeweb`.`elo_template` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`elo_template` (`run_id` ASC) ;


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
  PRIMARY KEY (`id`) ,
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

CREATE INDEX `fk_template_users` ON `placeweb`.`question` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`question` (`run_id` ASC) ;


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

CREATE INDEX `fk_template_users` ON `placeweb`.`answer` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`answer` (`run_id` ASC) ;

CREATE INDEX `fk_answers_questions1` ON `placeweb`.`answer` (`question_id` ASC) ;


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
  PRIMARY KEY (`id`) ,
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

CREATE INDEX `fk_template_users` ON `placeweb`.`example` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`example` (`run_id` ASC) ;


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

CREATE INDEX `fk_template_users` ON `placeweb`.`concept` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`concept` (`run_id` ASC) ;


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

CREATE INDEX `fk_template_users` ON `placeweb`.`answer_concept` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`answer_concept` (`run_id` ASC) ;

CREATE INDEX `fk_answer_concept_answers1` ON `placeweb`.`answer_concept` (`answer_id` ASC) ;

CREATE INDEX `fk_answer_concept_concepts1` ON `placeweb`.`answer_concept` (`concept_id` ASC) ;


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

CREATE INDEX `fk_template_users` ON `placeweb`.`example_concept` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`example_concept` (`run_id` ASC) ;

CREATE INDEX `fk_answer_concept_answers1` ON `placeweb`.`example_concept` (`example_id` ASC) ;

CREATE INDEX `fk_answer_concept_concepts1` ON `placeweb`.`example_concept` (`concept_id` ASC) ;


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

CREATE INDEX `fk_template_users` ON `placeweb`.`activity_type` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`activity_type` (`run_id` ASC) ;


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

CREATE INDEX `fk_template_users` ON `placeweb`.`activity` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`activity` (`run_id` ASC) ;

CREATE INDEX `fk_activity_activity_type1` ON `placeweb`.`activity` (`activity_type_id` ASC) ;

CREATE INDEX `fk_activities_users1` ON `placeweb`.`activity` (`activity_on_user` ASC) ;


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

CREATE INDEX `fk_template_users` ON `placeweb`.`votable` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`votable` (`run_id` ASC) ;


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

CREATE INDEX `fk_template_users` ON `placeweb`.`vote` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`vote` (`run_id` ASC) ;

CREATE INDEX `fk_votes_votable1` ON `placeweb`.`vote` (`obj_type` ASC) ;


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

CREATE INDEX `fk_template_users` ON `placeweb`.`commentable` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`commentable` (`run_id` ASC) ;


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

CREATE INDEX `fk_template_users` ON `placeweb`.`assessable` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`assessable` (`run_id` ASC) ;


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

CREATE INDEX `fk_template_users` ON `placeweb`.`comment` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`comment` (`run_id` ASC) ;

CREATE INDEX `fk_votes_votable1` ON `placeweb`.`comment` (`obj_type` ASC) ;

CREATE INDEX `fk_comments_comments1` ON `placeweb`.`comment` (`parent_id` ASC) ;


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

CREATE INDEX `fk_template_users` ON `placeweb`.`assessment` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`assessment` (`run_id` ASC) ;

CREATE INDEX `fk_votes_votable1` ON `placeweb`.`assessment` (`obj_type` ASC) ;


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

CREATE INDEX `fk_template_users` ON `placeweb`.`resolved_user_alert` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`resolved_user_alert` (`run_id` ASC) ;

CREATE INDEX `fk_user_alert_confirmed_activities1` ON `placeweb`.`resolved_user_alert` (`activity_id` ASC) ;


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

CREATE INDEX `fk_template_users` ON `placeweb`.`question_concept` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`question_concept` (`run_id` ASC) ;

CREATE INDEX `fk_question_concept_question1` ON `placeweb`.`question_concept` (`question_id` ASC) ;

CREATE INDEX `fk_question_concept_concepts1` ON `placeweb`.`question_concept` (`concept_id` ASC) ;


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
  `log` TEXT NULL ,
  `i1` INT NULL ,
  `i2` INT NULL ,
  `t1` VARCHAR(255) NULL ,
  `t2` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_template_users5100`
    FOREIGN KEY (`author_id` )
    REFERENCES `placeweb`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs15100`
    FOREIGN KEY (`run_id` )
    REFERENCES `placeweb`.`run` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_template_users` ON `placeweb`.`assessment_reviews` (`author_id` ASC) ;

CREATE INDEX `fk_template_runs` ON `placeweb`.`assessment_reviews` (`run_id` ASC) ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `placeweb`.`run`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `placeweb`;
INSERT INTO `placeweb`.`run` (`id`, `name`) VALUES ('1', 'SPH3UE-03');
INSERT INTO `placeweb`.`run` (`id`, `name`) VALUES ('2', 'SPH3UE-04');

COMMIT;

-- -----------------------------------------------------
-- Data for table `placeweb`.`user`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `placeweb`;
INSERT INTO `placeweb`.`user` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `username`, `password`, `user_type`, `display_name`, `group_name`) VALUES ('1', '1', NULL, NULL, NULL, 'admin', NULL, 'ADMIN', 'Admin', NULL);
INSERT INTO `placeweb`.`user` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `username`, `password`, `user_type`, `display_name`, `group_name`) VALUES ('2', '1', NULL, NULL, NULL, 'teacher', NULL, 'TEACHER', 'Admin', NULL);
INSERT INTO `placeweb`.`user` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `username`, `password`, `user_type`, `display_name`, `group_name`) VALUES ('3', '1', NULL, NULL, NULL, 'student1', NULL, 'STUDENT', 'Student', NULL);
INSERT INTO `placeweb`.`user` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `username`, `password`, `user_type`, `display_name`, `group_name`) VALUES ('4', '1', NULL, NULL, NULL, 'student2', NULL, 'STUDENT', 'Student', NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `placeweb`.`concept`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `placeweb`;
INSERT INTO `placeweb`.`concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('1', '1', '1', NULL, NULL, 'Vectors');
INSERT INTO `placeweb`.`concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('2', '1', '1', NULL, NULL, 'Newton 1st Law');
INSERT INTO `placeweb`.`concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('3', '1', '1', NULL, NULL, 'Newton 2nd Law');
INSERT INTO `placeweb`.`concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('4', '1', '1', NULL, NULL, 'Newton 3rd Law');
INSERT INTO `placeweb`.`concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('5', '1', '1', NULL, NULL, 'Acceleration');
INSERT INTO `placeweb`.`concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('6', '1', '1', NULL, NULL, 'Uniform Motion');
INSERT INTO `placeweb`.`concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('7', '1', '1', NULL, NULL, 'Kinetic Friction');
INSERT INTO `placeweb`.`concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('8', '1', '1', NULL, NULL, 'Static Friction');
INSERT INTO `placeweb`.`concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('9', '1', '1', NULL, NULL, 'Fnet = 0');
INSERT INTO `placeweb`.`concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('10', '1', '1', NULL, NULL, 'Fnet = constant (non-zero)');
INSERT INTO `placeweb`.`concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('11', '1', '1', NULL, NULL, 'Fnet = non-constant');
INSERT INTO `placeweb`.`concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('12', '1', '1', NULL, NULL, 'Kinetic Energy');
INSERT INTO `placeweb`.`concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('13', '1', '1', NULL, NULL, 'Potential Energy');
INSERT INTO `placeweb`.`concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('14', '1', '1', NULL, NULL, 'Conservation of Energy');

COMMIT;

-- -----------------------------------------------------
-- Data for table `placeweb`.`activity_type`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `placeweb`;
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('1', '1', '1', NULL, NULL, 'voted on comment');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('2', '1', '1', NULL, NULL, 'voted on answer');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('3', '1', '1', NULL, NULL, 'voted on answer concept');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('4', '1', '1', NULL, NULL, 'voted on example concept');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('5', '1', '1', NULL, NULL, 'commented on comment');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('6', '1', '1', NULL, NULL, 'commented on answer');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('7', '1', '1', NULL, NULL, 'commented on example');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('8', '1', '1', NULL, NULL, 'assessed comment');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('9', '1', '1', NULL, NULL, 'assessed example');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('10', '1', '1', NULL, NULL, 'assessed answer');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('11', '1', '1', NULL, NULL, 'example created');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('12', '1', '1', NULL, NULL, 'question created');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('13', '1', '1', NULL, NULL, 'answered question');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('14', '1', '1', '', NULL, 'voted on question_concept');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('15', '1', '1', '', '', 'voted on example question');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('16', '1', '1', NULL, NULL, 'tagged a concept with a question');
INSERT INTO `placeweb`.`activity_type` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES ('17', '1', '1', NULL, NULL, 'tagged a concept with an example');

COMMIT;

-- -----------------------------------------------------
-- Data for table `placeweb`.`votable`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `placeweb`;
INSERT INTO `placeweb`.`votable` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `object`) VALUES ('1', '1', '1', NULL, NULL, 'comments');
INSERT INTO `placeweb`.`votable` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `object`) VALUES ('2', '1', '1', NULL, NULL, 'answers');
INSERT INTO `placeweb`.`votable` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `object`) VALUES ('3', '1', '1', NULL, NULL, 'answer_concept');
INSERT INTO `placeweb`.`votable` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `object`) VALUES ('4', '1', '1', NULL, NULL, 'example_concept');
INSERT INTO `placeweb`.`votable` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `object`) VALUES ('5', '1', '1', NULL, NULL, 'question_concept');

COMMIT;

-- -----------------------------------------------------
-- Data for table `placeweb`.`commentable`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `placeweb`;
INSERT INTO `placeweb`.`commentable` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `object`) VALUES ('1', '1', '1', NULL, NULL, 'comments');
INSERT INTO `placeweb`.`commentable` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `object`) VALUES ('2', '1', '1', NULL, NULL, 'answers');
INSERT INTO `placeweb`.`commentable` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `object`) VALUES ('3', '1', '1', NULL, NULL, 'examples');

COMMIT;

-- -----------------------------------------------------
-- Data for table `placeweb`.`assessable`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `placeweb`;
INSERT INTO `placeweb`.`assessable` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `object`) VALUES ('1', '1', '1', NULL, NULL, 'comments');
INSERT INTO `placeweb`.`assessable` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `object`) VALUES ('2', '1', '1', NULL, NULL, 'answers');
INSERT INTO `placeweb`.`assessable` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `object`) VALUES ('3', '1', '1', NULL, NULL, 'examples');

COMMIT;

insert into `placeweb`.`concept`
(run_id, author_id, date_modified, date_created, name) 
select 2, author_id, date_modified, date_created, name 
from `placeweb`.`concept`;

COMMIT;