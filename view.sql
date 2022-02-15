-- 视图的使用
-- 创建一个视图 emp_view01, 只能查询emp表（empno、ename、job和deptno）信息

-- 创建视图
CREATE VIEW emp_view01
	AS
	SELECT empno, ename, job, deptno FROM emp;
	
-- 查看视图
DESC emp_view01

SELECT * FROM emp_view01;
SELECT empno, job FROM emp_view01

-- 查看创建视图的指令
SHOW CREATE VIEW emp_view01;
-- 删除视图
DROP VIEW emp_view01;

-- 1. 修改视图，会影响到基表
UPDATE emp_view01
	SET job = 'MANAGER'
	WHERE empno = 7369
	
SELECT * FROM emp; -- 查询基表



SELECT * FROM emp_view01

-- 2. 修改基本表，会影响到视图

UPDATE emp
	SET job = 'SALESMAN'
	WHERE empno = 7369
	
-- 3. 视图中可以再使用视图，比如从emp_view01 视图中，选出empno 和 ename做出新视图
DESC emp_view01

CREATE VIEW emp_view02
	AS
	SELECT empno, ename FROM emp_view01

SELECT * FROM emp_view02
