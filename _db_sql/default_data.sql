insert into concept 
(run_id, author_id, date_modified, date_created, name) 
select 2, author_id, date_modified, date_created, name 
from concept;

