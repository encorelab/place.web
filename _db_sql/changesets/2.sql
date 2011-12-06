insert into activity_type (run_id, author_id, name) values (1,1,'created journal entry');
ALTER TABLE `question` ADD `allow_multipe_answer` INT NOT NULL DEFAULT '0' AFTER `is_public`;
UPDATE `example` SET type=1
