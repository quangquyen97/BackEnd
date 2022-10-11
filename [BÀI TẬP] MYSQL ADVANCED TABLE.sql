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