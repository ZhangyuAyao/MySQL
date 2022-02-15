-- 统计 mysql 的统计函数的使用
-- 统计一个班级共有多少学生
SELECT COUNT(*) FROM student;
-- 统计数学成绩大于90的学生有多少个？
SELECT COUNT(*) FROM student 
	WHERE math > 90
-- 统计总分大于250的人数有多少？
SELECT COUNT(*) FROM student 
	WHERE (math + english + chinese) > 250
-- count(*) 和 count(列) 的区别
-- 解释：count(*) 返回满足条件的记录的行数
-- count(列)：统计满足条件的某列有多少个，但是会排除 为null
CREATE TABLE t15 (
	NAME VARCHAR(20));