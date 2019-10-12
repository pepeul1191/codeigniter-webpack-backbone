-- migrate:up

CREATE VIEW vw_technologies_images AS
  SELECT I.id, I.name, I.url, TI.id AS technology_id 
  FROM images I
  JOIN technologys_images TI ON TI.technology_id = I.id
  LIMIT 2000

-- migrate:down

DROP VIEW IF EXISTS vw_technologies_images