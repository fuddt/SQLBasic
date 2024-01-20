CREATE DATABASE day_15_18_db;

USE day_15_18_db;

#DEFAULT
CREATE TABLE users(
	id INT PRIMARY KEY,
	first_name VARCHAR(255),
	last_name VARCHAR(255) DEFAULT '' NOT NULL
	
);

INSERT INTO users(id) VALUES(1);
SELECT * FROM users;


#CHECK
CREATE TABLE customers (
	id INT PRIMARY KEY,
	name VARCHAR(255),
	age INT CHECK(age >= 20)
);

#入れられない
INSERT INTO customers VALUES(2,'Taro',19);

#複数
CREATE TABLE customers_2 (
	id INT PRIMARY KEY,
	name VARCHAR(255),
	age INT ,
	CONSTRAINT chk_customers CHECK ((age > 20) AND name = "Taro")
);
#名前がTaroじゃないから入れられない
INSERT INTO customers_2 VALUES(1,"tanaka",25);






