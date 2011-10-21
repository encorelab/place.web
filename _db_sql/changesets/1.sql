alter table user add column last_login datetime null after date_created;
alter table example add column is_published bool not null default 0;
alter table example add column is_public bool not null default 0;