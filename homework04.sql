-- 1x
-- 思路：group by + having语句
SELECT COUNT(*) AS c, deptno
	FROM emp
	GROUP BY deptno
	HAVING c > 1
-- 2. 查询薪水 sal 比 smith 多的员工
-- 思路：
-- （1）先查 smith 的 sal 作为子查询
-- （2）然后其它员工的 sal 大于 smith
SELECT * 
	FROM emp
	WHERE sal > (
		SELECT sal 
		FROM emp
		WHERE ename = 'SMITH')
	
-- 3 列出受雇日期晚于其直接上级的所有员工
-- （1）先进行自连接，使用直接上级过滤得到一张带有直接上级的表
SELECT worker.ename AS '员工名', leader.ename AS '上级名'
	FROM emp AS worker, emp AS leader
	WHERE worker.mgr = leader.empno
	AND worker.hiredate > leader.hiredate
-- 4. 列出部门名称和这些部门的员工信息，同时列出那些没有员工的部门
-- 思路：1. 员工表和部门表联表查询
-- 	2. 使用右连接列出没有员工的部门
SELECT emp.ename, dept.dname, dept.deptno
	FROM emp RIGHT JOIN dept 
	ON emp.deptno = dept.deptno
	
SELECT dname, emp.*
	FROM dept LEFT JOIN emp 
	ON dept.deptno = emp.deptno

-- 5. 列出所有 'CLERK'（办事员）的姓名及其部门名称
SELECT emp.ename, dept.dname, dept.deptno
	FROM emp, dept 
	WHERE emp.deptno = dept.deptno
	AND emp.job = 'CLERK'
	
-- 6. 列出最低薪金大于1500的各种工作
-- 思路：min函数as min列
SELECT job, MIN(sal) AS min_sal
	FROM emp
	GROUP BY job
	HAVING MIN(sal) > 1500
	
-- 7. 列出在部门salses工作的员工的姓名
SELECT ename, dname
	FROM emp, dept
	WHERE emp.deptno = dept.deptno
	AND dept.dname = "SALES"
	
-- 8. 列出薪金高于公司平均薪金的所有员工
SELECT *
	FROM emp
	WHERE (sal + IFNULL(comm, 0)) > (
	SELECT AVG(sal + IFNULL(comm, 0)) FROM emp
	)

SELECT AVG(sal + IFNULL(comm, 0)) FROM emp

-- 9. 列出与SCOTT从事相同工作的所有员工
SELECT job FROM emp WHERE ename = 'SCOTT'

SELECT * FROM emp 
	WHERE job = (SELECT job FROM emp WHERE ename = 'SCOTT')
	
-- 10. 列出薪金高于在部门30工作的所有员工的薪金的员工姓名和薪金
SELECT MAX(sal) FROM emp WHERE deptno = 30

SELECT ename, sal FROM emp
	WHERE sal > (SELECT MAX(sal) FROM emp WHERE deptno = 30)

-- 11.列出在每个部门工作的员工数量、平均工资和平均服务期限
SELECT AVG(DATEDIFF(NOW(), hiredate))/365 FROM emp
	
SELECT COUNT(*), AVG(sal), 
	FORMAT(AVG(DATEDIFF(NOW(), hiredate))/365, 2)
	FROM emp
	GROUP BY deptno

-- 12. 列出所有员工的姓名、部门名称和工资
SELECT emp.ename, dept.dname, sal
	FROM emp, dept
	WHERE dept.deptno = emp.deptno
	
-- 13. 列出所有部门的详细信息和部门人数
SELECT COUNT(*), deptno FROM emp
	GROUP BY deptno
	
SELECT dept.*, count_number.c
	FROM dept, (SELECT COUNT(*) AS c, deptno FROM emp
	GROUP BY deptno) AS count_number
	WHERE dept.deptno = count_number.deptno
	
-- 14. 列出各种工作的最低工资
SELECT MIN(sal) , job
	FROM emp
	GROUP BY job
	
-- 15. 列出MANAGER（经理）的最低薪金
SELECT job, MIN(sal) FROM emp 
	GROUP BY job
	HAVING job = 'MANAGER'
	
SELECT MIN(sal), job
	FROM emp
	WHERE job = 'MANAGER'
	
-- 16. 列出所有员工的年工资，按年薪从低到高排序
SELECT ename, (sal+IFNULL(comm, 0) * 12) AS year_sal FROM emp
	ORDER BY year_sal
