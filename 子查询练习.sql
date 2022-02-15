-- 子查询练习

-- 请思考：查找每个部门工资高于本部门平均工资的人的资料
-- 这里要用到数据查询的小技巧，把一个子查询当做一个临时表使用

-- 1. 先得到每个部门的 部门号和 对应的平均工资

SELECT deptno,AVG(sal)
	FROM emp 
	GROUP BY deptno

-- 2. 把上面的结果当做子查询。和 emp 进行多表查询
	
SELECT ename, sal, temp.avg_sal, emp.`deptno`
	FROM emp, (
		SELECT deptno,AVG(sal) AS avg_sal
		FROM emp 
		GROUP BY deptno
		) temp
	WHERE emp.sal > temp.avg_sal AND emp.deptno = temp.deptno

-- 查找每个部门工资最高的人的详细资料
-- 1. 先查询每个部门的最高工资
-- 2. 把上面得到的表当做临时表进行子查询
SELECT deptno, MAX(sal)
	FROM emp
	GROUP BY deptno
	
SELECT * 
	FROM emp, (SELECT deptno, MAX(sal) AS max_sal
			FROM emp
			GROUP BY deptno
			) temp
	WHERE emp.`sal` = temp.max_sal 
	AND emp.`deptno` = temp.deptno

-- 查询每个部门的信息(部门名，编号，地址）和人员数量

-- 1. 部门名，来自 dept表
-- 2. 各个部门的人员数量 -》构建一个零时表
SELECT * 
	FROM emp, dept
	WHERE emp.`deptno` = dept.`deptno`

-- 人员数量
SELECT COUNT(*), deptno
	FROM emp
	GROUP BY deptno
	
SELECT  dname, dept.deptno, loc, per_num AS '人数'
	FROM dept, (
		SELECT COUNT(*) AS per_num, deptno
		FROM emp
		GROUP BY deptno
	) tmp
	WHERE tmp.deptno = dept.`deptno`

-- 还有一种方法, 表.* 表示将该表所有列都显示出来
SELECT  tmp.*, dname, loc
	FROM dept, (
		SELECT COUNT(*) AS per_num, deptno
		FROM emp
		GROUP BY deptno
	) tmp
	WHERE tmp.deptno = dept.`deptno`