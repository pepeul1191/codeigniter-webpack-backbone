-- migrate:up

CREATE VIEW vw_dentists_branches AS
  SELECT DB.id, DB.dentist_id AS dentist_id, B.id AS branch_id, (T.name || ', ' || B.name || ', ' || B.address) AS branch_name 
  FROM branches B
  JOIN branch_types T ON T.id = B.branch_type_id 
  JOIN dentists_branches DB ON DB.branch_id = B.id 
  WHERE dentist_id = 27 
  LIMIT 2000

-- migrate:down

DROP VIEW IF EXISTS vw_dentists_branches;