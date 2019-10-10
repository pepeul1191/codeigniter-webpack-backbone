-- migrate:up

INSERT INTO branch_types (id, name) VALUES
  (1, 'LIMA'),
  (2, 'PROVINICA');

-- migrate:down

TRUNCATE branch_types;