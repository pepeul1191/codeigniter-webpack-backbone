CREATE TABLE schema_migrations (version varchar(255) primary key);
CREATE TABLE 'technologies' (
	'id'	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'name'	VARCHAR(40) NOT NULL,
  'description'	TEXT NOT NULL,
  'image'	VARCHAR(54) NOT NULL
);
CREATE TABLE 'technologies_images' (
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
  'address'	VARCHAR(50) NOT NULL,
  'phone'	VARCHAR(25),
  'whatsapp'	VARCHAR(25),
  'emergency'	VARCHAR(25),
  'image'	VARCHAR(54) NOT NULL,
  'latitude' FLOAT,
  'longitude' FLOAT,
  'branch_type_id'	INTEGER,
  'director_id'	INTEGER,
  FOREIGN KEY(`branch_type_id`) REFERENCES 'branch_types' ( 'id' ) ON DELETE CASCADE
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
	'name'	VARCHAR(30) NOT NULL
);
CREATE TABLE 'dentists_specialisms' (
	'id'	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'dentist_id'	INTEGER,
  'specialism_id'	INTEGER,
  FOREIGN KEY(`dentist_id`) REFERENCES 'dentists' ( 'id' ) ON DELETE CASCADE,
  FOREIGN KEY(`specialism_id`) REFERENCES 'specialisms' ( 'id' ) ON DELETE CASCADE
);
CREATE TABLE 'dentists_branches' (
	'id'	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'dentist_id'	INTEGER,
  'branch_id'	INTEGER,
  FOREIGN KEY(`dentist_id`) REFERENCES 'dentists' ( 'id' ) ON DELETE CASCADE,
  FOREIGN KEY(`branch_id`) REFERENCES 'branches' ( 'id' ) ON DELETE CASCADE
);
CREATE VIEW vw_technologies_images AS
  SELECT I.id, I.alt, I.url, TI.technology_id AS technology_id
  FROM images I
  JOIN technologies_images TI ON TI.image_id = I.id
  LIMIT 2000;
CREATE VIEW vw_branches_types AS
  SELECT B.id, (T.name || ', ' || B.name || ', ' || B.address) AS name
  FROM branches B
  JOIN branch_types T ON T.id = B.branch_type_id
  LIMIT 2000;
CREATE TABLE "images" (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`alt`	VARCHAR(45) NOT NULL,
	`url`	VARCHAR(54) NOT NULL
);
CREATE VIEW vw_dentists_branches AS
  SELECT DB.id, B.id AS branch_id, (T.name || ', ' || B.name || ', ' || B.address) AS branch_name, DB.dentist_id AS dentist_id, (D.name || ', ' || D.cop || ', ' || D.rne) AS dentist_name
  FROM branches B
  JOIN branch_types T ON T.id = B.branch_type_id
  JOIN dentists_branches DB ON DB.branch_id = B.id
  JOIN dentists D ON DB.dentist_id = D.id
  LIMIT 2000;
CREATE VIEW vw_branches_images AS
  SELECT I.id, I.alt, I.url, B.branch_id AS branch_id
  FROM images I
  JOIN branches_images B ON B.image_id = I.id
  LIMIT 2000;
CREATE VIEW vw_branches_directors AS
  SELECT B.id,	B.name, B.address, B.phone, B.whatsapp, B.emergency, B.image, B.latitude, B.longitude, B.branch_type_id, B.director_id, (D.name || ', ' || D.cop || ', ' || D.rne) AS director_name
  FROM branches B
  JOIN dentists D ON B.director_id = D.id
  LIMIT 2000;
CREATE VIEW vw_dentists_branches_specialisms AS
	SELECT branch_types_id, branch_id, branch_name, dentist_id, dentist_name, cop, rne, image, specialism_id, specialism_name FROM
	(
		SELECT DB.id, T.id AS branch_types_id , B.id AS branch_id,  B.name AS branch_name, DB.dentist_id AS dentist_id, D.name AS dentist_name , D. cop, D.rne, D.image
		FROM branches B
		JOIN branch_types T ON T.id = B.branch_type_id
		JOIN dentists_branches DB ON DB.branch_id = B.id
		JOIN dentists D ON DB.dentist_id = D.id
		LIMIT 2000
	) T
	LEFT JOIN (
		SELECT DS.dentist_id AS p_dentist_id, (D.name || ', ' || D.cop || ', ' || D.rne) AS p_dentist_name , SP.id AS specialism_id, SP.name AS specialism_name
		FROM specialisms SP
		JOIN dentists_specialisms DS ON DS.specialism_id = SP.id
		JOIN dentists D ON DS.dentist_id = D.id
		LIMIT 2000
	) P
	ON T.dentist_id = P.p_dentist_id;
-- Dbmate schema migrations
INSERT INTO schema_migrations (version) VALUES
  ('20191003022142'),
  ('20191003235853'),
  ('20191004000527'),
  ('20191004001156'),
  ('20191004012336'),
  ('20191004012429'),
  ('20191004012751'),
  ('20191004013015'),
  ('20191004013242'),
  ('20191004013421'),
  ('20191010202820'),
  ('20191010231913'),
  ('20191012192521'),
  ('20191017231747'),
  ('20191017232547'),
  ('20191017232821'),
  ('20191017232941'),
  ('20191018020837'),
  ('20191018025153'),
  ('20191018224914'),
  ('20191018225908'),
  ('20191102030733');
