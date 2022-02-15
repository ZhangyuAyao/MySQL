-- 演示check的使用
-- mysql5.7目前还不支持 check ，只做语法校验，但不会生效

-- 测试
CREATE TABLE t23 (
	id INT PRIMARY KEY,
	`name` VARCHAR(32),
	sex VARCHAR(6) CHECK ( sex IN('man', 'women')),-- 用于检查，不对的话会报语法错误
	sal DOUBLE CHECK( sal > 1000 AND sal < 2000)
	);
	
-- 添加数据
INSERT INTO t23
	VALUES(1, 'jack', 'mid', 1);
SELECT * FROM t23