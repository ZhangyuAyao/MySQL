#修改表的操作练习
-- 在 emp 上新增 image 列, varchar 类型（要求在resume后面）
ALTER TABLE emp
	ADD image VARCHAR(32) NOT NULL DEFAULT ' '
	AFTER RESUME
DESC emp -- 显示表结构，可以查看表的所有列
-- 修改 job 列，使其长度为60
ALTER TABLE emp
	MODIFY job VARCHAR(60) NOT NULL DEFAULT ' ' -- 非空，默认为' '
-- 删除 sex 列
ALTER TABLE emp
	DROP sex
-- 修改表名为employee
RENAME TABLE emp TO employee
-- 修改表的字符集为utf8
ALTER TABLE employee CHARACTER SET utf8
-- 列名name修改为user_name
ALTER TABLE employee
	CHANGE `name` `user_name` VARCHAR(64) NOT NULL DEFAULT ' '
DESC employee
