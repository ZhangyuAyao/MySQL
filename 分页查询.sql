# 分页查询
-- 1. 按雇员的id号升序取出，每页显示3条，请分别显示 第1页，第2页，第3页

-- 第1页
SELECT * FROM emp
	ORDER BY empno
	LIMIT 0, 3 -- 从0开始取，取3行
	
-- 第2页
SELECT * FROM emp
	ORDER BY empno
	LIMIT 3, 3 
	
-- 第3页
SELECT * FROM emp
	ORDER BY empno
	LIMIT 6, 3 

-- 推导一个公式
SELECT * FROM emp
	ORDER BY empno
	LIMIT 每页显示记录数 * （第几页-1），每页显示记录数
	
-- 按照雇员的empno号降序取出，每页显示5条记录。请分别显示 第3页，第5页 对应的sql语句
SELECT * FROM emp
	ORDER BY empno DESC
	LIMIT 10, 5
	
SELECT * FROM emp
	ORDER BY empno DESC
	LIMIT 20, 5
	