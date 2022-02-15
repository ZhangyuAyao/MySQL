-- 外连接
-- 创建 stu
CREATE TABLE stu (
	id INT,
	`name` VARCHAR(32));
	
INSERT INTO stu VALUES(1, 'jack'),(2, 'tom'),(3, 'kity'),(4, 'nono');
SELECT * FROM stu

-- 创建exam
CREATE TABLE exam(
	id INT, 
	grade INT);
INSERT INTO exam VALUES(1, 56),(2,76),(11, 8)

-- 使用左连接（显示所有人的成绩，如果没有成绩，也要显示该人的姓名和id，成绩显示为空）
SELECT `name`, stu.`id`, grade
	FROM stu, exam
	WHERE stu.`id` = exam.`id`
	
-- 改成左外连接
SELECT `name`, stu.`id`, grade
	FROM stu LEFT JOIN exam
	ON stu.`id` = exam.`id`

-- 使用右外连接（显示所有成绩，如果没有名字匹配，显示空）
-- 即，右边的表 （exam） 和左表没有匹配的记录，也会把右表的记录显示出来
SELECT `name`, stu.`id`, grade
	FROM stu RIGHT JOIN exam
	ON stu.`id` = exam.`id`
	
-- 课堂练习
-- 列出部门名称和这些部门的员工名称和工作
-- 同时要求 显示出那些没有员工的部门名
-- 使用左外连接：
SELECT dept.dname, ename, job
	FROM dept LEFT JOIN emp
	ON dept.`deptno` = emp.`deptno`
	
-- 使用右外连接
SELECT dept.dname, ename, job
	FROM emp RIGHT JOIN dept
	ON dept.`deptno` = emp.`deptno`
	
-- 总结：
-- 在实际的开发中，我们绝大多数情况使用的是内连接
-- 外连接用得比较少