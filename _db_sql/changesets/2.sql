ALTER TABLE `question` ADD `allow_multipe_answer` INT NOT NULL DEFAULT '0' AFTER `is_public`;
UPDATE `example` SET type=1
