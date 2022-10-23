
CREATE TABLE order(
	user_id INT,
	food_id INT,
	amount INT,
	order_code VARCHAR(255),
	arr_sub_id VARCHAR(255),
	FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (food_id) REFERENCES food(food_id)
)

-- 23 October 2022 10:23:59 AM
CREATE TABLE sub_food (
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(255),
	sub_price FLOAT,
	food_id INT ,
	FOREIGN KEY (food_id) REFERENCES food(food_id)
)


-- 23 October 2022 10:23:01 AM
CREATE TABLE food(
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	image VARCHAR(255),
	price FLOAT,
	description VARCHAR(255),
	type_id INT,
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
)

-- 23 October 2022 10:21:07 AM
CREATE TABLE food_type (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)
)

-- 23 October 2022 10:17:38 AM
CREATE TABLE like_res(
	user_id INT ,
	res_id INT,
	date_like DATETIME,
	FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
)

-- 23 October 2022 10:14:57 AM
CREATE TABLE rate_res(
	user_id INT,
	res_id INT,
	amount INT,
	date_rate DATETIME,
	FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
)


-- 23 October 2022 10:01:47 AM
CREATE TABLE restaurant(
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	image VARCHAR(255),
	description VARCHAR(255),


-- 23 October 2022 9:58:27 AM
CREATE TABLE user(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	password VARCHAR(255)
)
