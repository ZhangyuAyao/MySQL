-- unique的使用

CREATE TABLE t21
	(id INT UNIQUE, -- 表示 id 列是不可以重复的
	`name` VARCHAR(32),
	email VARCHAR(32)
	);
	
INSERT INTO t21
	VALUES(1, 'jack', 'jack@sohu.com');
	
INSERT INTO t21
	VALUES(1, 'tom', 'tom@sohu.com');

-- unique使用细节
-- 1. 如果没有指定 not null， 则 unique 字段可以有多个null
-- 如果一个列（字段），是 unique not null 使用效果类似 primary key
INSERT INTO t21
	VALUES(NULL, 'tom', 'tom@sohu.com');
SELECT * FROM t21

-- 2. 一张表可以有多个 unique 字段
CREATE TABLE t22
	(id INT UNIQUE, -- 表示 id 列是不可以重复的
	`name` VARCHAR(32) UNIQUE, -- 表示 name 列是不可以重复的
	email VARCHAR(32)
	);	

INSERT INTO t21
	VALUES(NULL, 'tom', 'tom@sohu.com');

