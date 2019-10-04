CREATE TABLE schema_migrations (
		version varchar(255) primary key);
CREATE TABLE 'images' (
	'id'	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'name'	VARCHAR(54) NOT NULL
);
CREATE TABLE 'technologys' (
	'id'	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'name'	VARCHAR(40) NOT NULL,
  'description'	TEXT NOT NULL,
  'image'	VARCHAR(54) NOT NULL
);
CREATE TABLE 'technologys_images' (
	'id'	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'technology_id'	INTEGER,
  'image_id'	INTEGER,
  FOREIGN KEY(`technology_id`) REFERENCES 'technologys' ( 'id' ) ON DELETE CASCADE,
  FOREIGN KEY(`image_id`) REFERENCES 'images' ( 'id' ) ON DELETE CASCADE
);
CREATE TABLE 'branch_types' (
	'id'	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'name'	VARCHAR(54) NOT NULL
);
CREATE TABLE 'dentists' (
	'id'	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'name'	VARCHAR(45) NOT NULL,
  'cop'	VARCHAR(10) NOT NULL,
  'rne'	VARCHAR(10),
  'image'	VARCHAR(54) NOT NULL
);
CREATE TABLE 'branches' (
	'id'	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'name'	VARCHAR(30) NOT NULL,
  'addrress'	VARCHAR(50) NOT NULL,
  'phone'	VARCHAR(25),
  'whatsapp'	VARCHAR(25),
  'emergency'	VARCHAR(25),
  'image'	VARCHAR(54) NOT NULL,
  'latitude' FLOAT,
  'longitude' FLOAT,
  'branch_type_id'	INTEGER,
  'director_id'	INTEGER,
  FOREIGN KEY(`branch_type_id`) REFERENCES 'branch_types' ( 'id' ) ON DELETE CASCADE,
  FOREIGN KEY(`director_id`) REFERENCES 'dentists' ( 'id' ) ON DELETE CASCADE
);
CREATE TABLE 'branches_images' (
	'id'	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'branch_id'	INTEGER,
  'image_id'	INTEGER,
  FOREIGN KEY(`branch_id`) REFERENCES 'branches' ( 'id' ) ON DELETE CASCADE,
  FOREIGN KEY(`image_id`) REFERENCES 'images' ( 'id' ) ON DELETE CASCADE
);
CREATE TABLE 'specialisms' (
	'id'	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'name'	VARCHAR(54) NOT NULL
);
-- Dbmate schema migrations
INSERT INTO schema_migrations (version) VALUES
  ('20191003022142'),
  ('20191003235853'),
  ('20191004000527'),
  ('20191004001156'),
  ('20191004012336'),
  ('20191004012429'),
  ('20191004012751'),
  ('20191004013015');
