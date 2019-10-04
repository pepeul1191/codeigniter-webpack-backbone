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
-- Dbmate schema migrations
INSERT INTO schema_migrations (version) VALUES
  ('20191003022142'),
  ('20191003235853');
