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
-- Dbmate schema migrations
INSERT INTO schema_migrations (version) VALUES
  ('20191003022142'),
  ('20191003235853'),
  ('20191004000527'),
  ('20191004001156');
