-- 外键演示

-- 创建 主表 my_class 班级表
CREATE TABLE my_class(
	id INT PRIMARY KEY, -- 班级编号
	`name` VARCHAR(32) NOT NULL DEFAULT '');
	
-- 创建 从表 my_stu
CREATE TABLE my_stu
	(id INT PRIMARY KEY, -- 学生编号
	`name` VARCHAR(32) NOT NULL DEFAULT '',
	class_id INT, -- 学生所在班级的编号
	-- 下面指定外键关系
	FOREIGN KEY (class_id) REFERENCES my_class(id));
	
-- 测试数据
INSERT INTO my_class 
	VALUES(100, 'java'), (200, 'web');
INSERT INTO my_class 
	VALUES(300, 'php');
	
SELECT * FROM my_class;

INSERT INTO my_stu
	VALUES(1, 'tom', 100);
INSERT INTO my_stu
	VALUES(2, 'jack', 200);
INSERT INTO my_stu
	VALUES(4, 'mary', 400); -- 这里会失败...因为400班级不存在
SELECT * FROM my_stu;

-- 一旦建立主外键的关系，数据不能随意删除了
DELETE FROM my_class 
	WHERE id = 100;