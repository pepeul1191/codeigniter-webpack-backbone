-- migrate:up

CREATE TABLE 'dentists_branches' (
	'id'	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'dentist_id'	INTEGER,
  'branche_id'	INTEGER,
  FOREIGN KEY(`dentist_id`) REFERENCES 'dentists' ( 'id' ) ON DELETE CASCADE,
  FOREIGN KEY(`branche_id`) REFERENCES 'branches' ( 'id' ) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE IF EXISTS 'dentists_branches';