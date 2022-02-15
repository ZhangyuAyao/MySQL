-- 查询英语分数在80-90之间的同学
SELECT * FROM student 
	WHERE english >= 80 AND english <= 90;
SELECT * FROM student 
	WHERE english BETWEEN 80 AND 90; -- between . and .. 是 闭区间
-- 查询数学分数为89、90、91的同学
SELECT * FROM student 
	WHERE math = 89 OR math = 90 OR math = 91
SELECT * FROM student 
	WHERE math IN (89, 90, 91);
-- 查询所有姓韩的学生成绩
SELECT * FROM student 
	WHERE `name` LIKE '韩%'
-- 查询数学分 >80, 语文分 >80 的同学
SELECT * FROM student 
	WHERE math > 80 AND chinese > 80
	
-- 1. 查询语文分数在 70-80 之间的同学
SELECT * FROM student 
	WHERE chinese BETWEEN 70 AND 80;
-- 2. 查询总分为185,190,191的同学
SELECT * FROM student 
	WHERE (chinese + math + english ) IN (185,190,191);
-- 3. 查询所有姓李 或者 姓宋 的学生成绩
SELECT * FROM student 
	WHERE `name` LIKE '李%' OR `name` LIKE '宋%';
-- 4. 查询数学比语文多30分的同学
SELECT * FROM student
	WHERE (chinese - math) > 30