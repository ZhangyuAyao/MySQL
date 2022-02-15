-- 查看当前会话隔离级别
SELECT @@tx_isolation

-- 查看当前系统的隔离级别
SELECT @@global.tx_isolation

-- 设置当前会话的隔离级别
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- 设置默认设置的隔离级别
SET GLOBAL TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- mysql 默认的事务隔离级别是 repeatable read，一般情况下，没有特殊要求，没有必要修改（因为该级别可以满足绝大部分项目需求）
