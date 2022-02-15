-- 表的复制
-- 为了对某个sql语句进行效率测试，我们需要海量数据时，可以使用此法为表创建海量数据

CREATE TABLE my_tab01
	( id INT,
	`name` VARCHAR(32),
	sal DOUBLE,
	job VARCHAR(32),
	deptno INT);
	
DESC my_tab01
SELECT * FROM my_tab01;

-- 演示如何自我复制
-- 1. 先把emp 表的记录复制到 my_tab01
INSERT INTO my_tab01
	(id, `name`, sal, job, deptno)
	SELECT empno, ename, sal, job, deptno
	FROM emp;
-- 2. 自我复制
INSERT INTO my_tab01
	SELECT * FROM my_tab01;
SELECT COUNT(*) FROM my_tab01

-- 如何删掉一张表的重复记录
-- 1. 先创建一张表 my_tab01
-- 2. 让 my_tab02 有重复的记录

CREATE TABLE my_tab02 LIKE emp; -- 这个语句 把emp表的结构（列），复制到my_tab02

DESC my_tab02;

INSERT INTO my_tab02
	SELECT * FROM emp

SELECT * FROM my_tab02
-- 3. 考虑如何去重
/*
	思路
	（1）先创建一张临时表 my_tmp，该表的结构和 my_tab02一致
	（2）把my_temp 的记录 通过 distinct 关键字 处理后 把记录复制到 my_temp 表
	（3）清除掉 my_tab02 记录
	（4）把my_temp 表的记录复制到 my_tab02
	（5）drop 掉临时表
*/
-- (1) 先创建一张临时表 my_temp,该表的结构和my_tab01一样
CREATE TABLE my_temp LIKE my_tab02
-- (2) 把my_tab02的记录 distinct 处理后复制到 my_temp
INSERT INTO my_temp
	SELECT DISTINCT * FROM my_tab02
SELECT * FROM my_temp
-- (3) 将my_teb02的数据全部删除
DELETE FROM my_tab02
-- （4）将my_temp 表的记录复制到my_tab02
INSERT INTO my_tab02
	SELECT * FROM my_temp
-- (5) 将my_temp临时表删除
DROP TABLE my_temp

SELECT * FROM my_tab02

