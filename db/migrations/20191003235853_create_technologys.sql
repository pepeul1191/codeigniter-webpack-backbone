-- migrate:up

CREATE TABLE 'technologys' (
	'id'	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'name'	VARCHAR(40) NOT NULL,
  'description'	TEXT NOT NULL,
  'image'	VARCHAR(54) NOT NULL
);

-- migrate:down

DROP TABLE IF EXISTS 'technologys';