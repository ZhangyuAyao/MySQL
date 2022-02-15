#创建表的课堂练习
CREATE TABLE `emp` (
	Id INT,
	`name` VARCHAR(32),
	sex CHAR(1),
	birthday DATE,
	entry_date DATE,
	job VARCHAR(32),
	salary DOUBLE,
	`resume` TEXT) CHARSET utf8 COLLATE utf8_bin ENGINE INNODB
	
-- 添加一条
INSERT INTO `emp`
	VALUES(100, '小妖怪', '男', '2000-11-11', '2010-11-10 11:11:11', 
	'巡山的', 3000, '大王叫我来巡山');
	
SELECT * FROM `emp`;

ALTER TABLE `emp`
ADD (image VARCHAR(32));

ALTER TABLE `emp`
MODIFY (job VARCHAR(60));

ALTER TABLE `emp`
DROP (sex);

RENAME TABLE `emp` TO employee;

ALTER TABLE `employee` CHARACTER SET gbk;

DROP TABLE employee