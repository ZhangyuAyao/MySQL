CREATE DATABASE shop_db;

CREATE TABLE goods (
	goods_id INT PRIMARY KEY,
	goods_name VARCHAR(64) NOT NULL DEFAULT '',
	unitprice DECIMAL(10,2) NOT NULL DEFAULT 0,
	CHECK (unitprice BETWEEN 1.0 AND 9999.99),
	category INT NOT NULL DEFAULT 0,
	provider VARCHAR(64) NOT NULL DEFAULT '');

CREATE TABLE customer(
	customer_id INT PRIMARY KEY,
	`name` VARCHAR(64) NOT NULL DEFAULT '',
	address VARCHAR(64) NOT NULL DEFAULT '' ,
	email VARCHAR(64) UNIQUE NOT NULL,
	-- sex varchar(1) check (sex in ('男','女')),
	sex ENUM('男','女') NOT NULL, -- 这里使用枚举类型，是生效的
	card_id INT);
	
CREATE TABLE purchase(
	order_id INT UNSIGNED PRIMARY KEY,
	customer_id INT NOT NULL DEFAULT 0,
	goods_id INT NOT NULL DEFAULT 0, 
	nums INT NOT NULL DEFAULT 0,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(goods_id) REFERENCES goods(goods_id)
	);
	
DROP TABLE goods,customer
DESC goods;
DESC customer;
DESC purchase;




