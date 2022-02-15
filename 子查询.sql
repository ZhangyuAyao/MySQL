-- 子查询的演示
-- 请思考：如何显示与SMITH同一部门的所有员工？
/*
	1. 先查询到 SMITH的部门号得到
	2. 把上面的select 语句当做一个子查询来使用
*/
SELECT deptno
	FROM emp
	WHERE ename = 'SMITH'
-- 下面的答案：
SELECT *
	FROM emp
	WHERE deptno = (
		SELECT deptno
		FROM emp
		WHERE ename = 'SMITH'
	)
	
-- 多行子查询
-- 课堂练习：如何查询和部门10的工作相同的雇员的
-- 名字、岗位、工资、部门号，但是不含10号部门自己的雇员

/*
	1. 查询到10号部门有哪些工作岗位
	2. 把上面查询的结果当做子查询使用
*/
SELECT DISTINCT job
	FROM emp
	WHERE deptno = 10;
	
-- 下面语句完整
SELECT ename, job, sal, deptno
	FROM emp
	WHERE job IN (
		SELECT DISTINCT job
		FROM emp
		WHERE deptno = 10
	) AND deptno != 10

-- 查询ecshop中各个类别中，价格最高的商品
-- 查询 商品表
-- 先得到 各个类别中，价格最高的商品 max + group by  cat_id, 当做临时表
-- 可以将子查询当做一张临时表使用

SELECT goods_id, cat_id, goods_name, shop_price
	FROM ecs_goods
	GROUP BY cat_id

SELECT  goods_id, cat_id, goods_name, shop_price
	FROM ( -- temp表取到各商品分类的最高价格
		SELECT cat_id, MAX(shop_price) AS max_price
		FROM ecs_goods
		GROUP BY cat_id
	) temp, ecs_goods -- 这里是多表查询，得到笛卡尔表
	WHERE temp.cat_id = ecs_goods.cat_id 
	AND temp.max_price = ecs_goods.shop_price -- 添加条件筛选出最高的价格







-- 零时表，得到各商品的最高价格
SELECT cat_id, MAX(shop_price) 
	FROM ecs_goods
	GROUP BY cat_id
	
SELECT * 
	FROM (
		SELECT cat_id, MAX(shop_price) AS max_price
		FROM ecs_goods
		GROUP BY cat_id
	) temp, ecs_goods
	WHERE temp.cat_id = ecs_goods.cat_id
	AND temp.max_price = ecs_goods.price


