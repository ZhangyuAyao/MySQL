-- homework03
-- 1. 
DESC emp
DESC dept
SELECT ename
	FROM emp, dept
	WHERE emp.deptno = dept.deptno
	
-- 2
SELECT ename, empno, deptno
	FROM emp
	WHERE job = 'CLERK'
	
-- 3
SELECT ename, comm, sal
	FROM emp
	WHERE IFNULL(comm, 0) > sal

-- 4
SELECT ename
	FROM emp
	WHERE IFNULL(comm, 0) > (sal*0.6)
	
-- 5
SELECT * 
	FROM emp
	WHERE (deptno = 10 AND job = 'MANAGER')
	OR (deptno = 20 AND job = 'CLERK')
	
-- 6
SELECT * 
	FROM emp
	WHERE (deptno = 10 AND job = 'MANAGER')
	OR (deptno = 20 AND job = 'CLERK')
	OR (deptno <> 10 AND deptno <> 20 AND job NOT IN('MANAGER','CLERK') AND comm >= 100)

-- 7
SELECT DISTINCT job
		FROM emp
		WHERE comm IS NOT NULL
-- 8
SELECT ename, comm
	FROM emp
	WHERE comm IS NULL OR IFNULL(comm, 0) < 100
	
-- 9. 找出个月倒数第3天受雇的所有员工
-- 老韩提示：LAST_DAY(日期)，可以返回该日期所在月份的最后一天
SELECT LAST_DAY('2011-11-11')

SELECT * 
	FROM emp
	WHERE LAST_DAY(hiredate) - hiredate = 3
	
-- 10 
SELECT * 
	FROM emp
	WHERE DATE_ADD(hiredate, INTERVAL 12 YEAR) < NOW()

-- 11
SELECT CONCAT(LCASE(SUBSTRING(ename, 1, 1)), SUBSTRING(ename, 2))
	FROM emp

-- 12
SELECT * 
	FROM emp
	WHERE LENGTH(ename) = 5
