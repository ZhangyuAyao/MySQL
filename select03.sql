-- select 语句
-- 查询姓名为赵云的学生成绩
SELECT * FROM student 
	WHERE `name` = '赵云'
-- 查询英语成绩大于 90 分的同学
SELECT `name` FROM student 
	WHERE english > 90;
-- 查询总分大于200分的所有同学
SELECT * FROM student 
	WHERE (chinese + english + math) > 200
-- 查询math大于60，并且id大于4的学生成绩
SELECT * FROM student 
	WHERE math > 60 AND id > 4
-- 查询英语成绩大于语文成绩的同学
SELECT * FROM student 
	WHERE english > math;
-- 查询总分大于200分 并且 数学成绩小于语文成绩 的姓赵的学生
-- 赵% 表示 名字以韩开头的就可以
SELECT * FROM student
	WHERE (chinese + english + math) > 200 AND 
	math < chinese AND `name` LIKE '赵%'
