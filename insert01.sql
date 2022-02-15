#练习insert语句
CREATE TABLE `goods` (
	id INT,
	goods_name VARCHAR(10),
	price DOUBLE);
-- 添加数据
INSERT INTO `goods` (id, goods_name, price)
	VALUES(10, '华为手机', 2000);
INSERT INTO `goods` (id, goods_name, price)
	VALUES(20, '苹果手机', 3000);
SELECT * FROM `goods`;

CREATE TABLE `goods2` (
	id INT,
	goods_name VARCHAR(10),
	price DOUBLE NOT NULL DEFAULT 100);