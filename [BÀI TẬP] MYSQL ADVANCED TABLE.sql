CREATE TABLE users (
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(255),
	created_at DATE
)

CREATE TABLE photos(
	id INT PRIMARY KEY AUTO_INCREMENT,
	image_url VARCHAR(255),
	user_id INT,
	created_at DATE,
	FOREIGN KEY photos(user_id) REFERENCES users(id)
)

CREATE TABLE comments(
	id INT AUTO_INCREMENT,
	comment_text VARCHAR(255),
	user_id INT,
	photo_id INT,
	created_at DATE,
	PRIMARY KEY (id,user_id,photo_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (photo_id) REFERENCES photos(id)
)


CREATE TABLE tags(
	id INT PRIMARY KEY AUTO_INCREMENT ,
	tag_name VARCHAR(255),
	created_at DATE
)

CREATE TABLE photo_tags(
	photo_id INT ,
	tag_id INT,
	PRIMARY KEY(photo_id, tag_id),
	FOREIGN KEY(photo_id) REFERENCES photos(id),
	FOREIGN KEY(tag_id) REFERENCES tags(id)
)

CREATE TABLE likes(
	photo_id INT,
	user_id INT,
	created_at DATE,
	PRIMARY KEY(photo_id,user_id),
	FOREIGN KEY(photo_id) REFERENCES photos(id),
	FOREIGN KEY(user_id) REFERENCES users(id)
)

CREATE TABLE follows(
	follower_id INT ,
	followee_id INT,
	created_at DATE,
	PRIMARY KEY(follower_id,followee_id),
	FOREIGN KEY(follower_id) REFERENCES users(id),
	FOREIGN KEY(followee_id) REFERENCES users(id)
	 
)

-- 10 October 2022 8:18:07 PM
INSERT INTO users VALUES
(0,'Quang Quyen','2020-05-12'),
(0,'Truc Nhan','2021-04-21'),
(0,'Thao Uyen','2021-01-28'),
(0,'Thanh Dao','2022-09-19'),
(0,'Gia Bao','2022-10-08'),
(0,'Gia Huy','2021-02-28'),
(0,'The Lam','2022-11-25'),
(0,'Tieu Giao','2019-05-08'),
(0,'Trieu Vy','2019-02-28');

-- 10 October 2022 8:49:52 PM
INSERT INTO comments VALUES
(0,'chao ban',2,1,'2022-10-09'),
(0,'hi ban',9,4,'2022-10-09'),
(0,'hello ban',5,8,'2022-10-09'),
(0,'khoe khong',4,3,'2022-10-09'),
(0,'lam gi roi',3,3,'2022-10-09'),
(0,'xem ne',7,6,'2022-10-09'),
(0,'dep lam',5,3,'2022-10-09'),
(0,'vui ha',8,2,'2022-10-09'),
(0,'du xuan',4,5,'2022-10-09'),
(0,'hahaa',1,9,'2022-10-09');

-- 10 October 2022 8:44:25 PM
INSERT INTO photos VALUES
(0,'url1',1,'2022-10-09'),
(0,'url2',1,'2022-02-12'),
(0,'url3',9,'2022-03-11'),
(0,'url4',8,'2022-05-14'),
(0,'url5',1,'2022-05-20'),
(0,'url6',2,'2022-05-29'),
(0,'url7',3,'2022-05-30'),
(0,'url8',5,'2022-09-01'),
(0,'url9',4,'2022-08-25');

-- 10 October 2022 8:54:42 PM
INSERT INTO tags VALUES
(0,'JohnCena','2022-09-29'),
(0,'LeeMinHo','2022-02-28'),
(0,'KimJee','2022-09-29'),
(0,'Shanghao','2022-09-29'),
(0,'Levi','2022-09-29'),
(0,'Jensen','2022-09-29'),
(0,'Faker','2022-09-29'),
(0,'Gosu','2022-09-29');

-- 10 October 2022 9:01:24 PM
INSERT INTO follows VALUES
(2,3,'2022-04-23'),
(1,4,'2022-08-12'),
(9,8,'2022-09-24'),
(6,3,'2022-02-11'),
(5,4,'2022-01-17'),
(1,2,'2022-01-13'),
(7,8,'2022-06-17'),
(8,6,'2022-10-01'),
(2,7,'2022-02-19');

-- 10 October 2022 8:59:23 PM
INSERT INTO likes VALUES
(2,3,'2022-04-23'),
(1,4,'2022-08-12'),
(9,8,'2022-09-24'),
(6,3,'2022-02-11'),
(5,4,'2022-01-17'),
(1,2,'2022-01-13'),
(7,8,'2022-06-17'),
(8,6,'2022-10-01'),
(2,7,'2022-02-19');