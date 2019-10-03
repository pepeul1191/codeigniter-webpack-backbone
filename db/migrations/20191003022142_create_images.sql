-- migrate:up

CREATE TABLE 'images' (
	'id'	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'name'	TEXT NOT NULL
);

-- migrate:down

DROP TABLE 'images'