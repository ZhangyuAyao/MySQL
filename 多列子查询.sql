-- 多列子查询
-- 请思考如何查询与smith的部门和岗位完全相同的所有雇员（并且不含smith本人）
-- （字段1， 字段2 ...) = （select 字段1， 字段2 from...)

-- 分析：1. 得到smith的部门和岗位
SELECT deptno, job
	FROM emp
	WHERE `ename` = 'SMITH'
	
-- 分析：2. 把上面的查询当做子查询来使用，并且使用多列子查询的语法进行匹配
SELECT * 
	FROM emp
	WHERE (deptno, job) = ( -- 语法
		SELECT deptno, job
			FROM emp
			WHERE `ename` = 'SMITH'
	) AND ename != 'SMITH'
	
-- 练习：请查询和宋江数学，语文，英语成绩完全相同的学生
SELECT * 
	FROM student
	WHERE (chinese, english, math) = (
		SELECT chinese, english, math 
			FROM student 
			WHERE `name` = '宋江'
			)
			
			
			