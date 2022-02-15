-- 2. homework02
DESC hsp_db02.dept;
DESC hsp_db02.emp;
SELECT * FROM emp

-- 3.(1)
SELECT dname FROM dept;

-- 3.(2)
SELECT ename, (sal+IFNULL(comm, 0))*13 AS '年收入' FROM emp;

-- 4.(1)
SELECT ename, sal 
	FROM emp
	WHERE sal > 2850;
	
-- 4.(2)
SELECT ename, sal 
	FROM emp
	WHERE (sal < 1500 OR sal > 2850);
	
-- 4.(3)
SELECT ename, deptno 
	FROM emp
	WHERE empno = 7566;

-- 4.(4)
SELECT ename, sal, deptno
	FROM emp
	WHERE (deptno = 10 OR deptno = 30)
	AND sal > 1500;

-- 4.(5)
SELECT ename, job FROM emp
	WHERE (mgr IS NULL);


-- 5.(1)
SELECT * 
	FROM emp
	WHERE (hiredate > '1990-02-01' AND hiredate < '1995-02-01')
	ORDER BY hiredate
-- 日期要使用单引号''括起来
	
-- 5.(2)
SELECT ename, sal, comm
	FROM emp
	ORDER BY sal ASC
