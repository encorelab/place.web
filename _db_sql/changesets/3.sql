alter table assessment_reviews add column mark_for_discussion bool default 0;
alter table assessment_reviews add column assessment_id int null after date_created;
alter table assessment_reviews add foreign key (assessment_id) references assessment(id);
