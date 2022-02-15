-- 演示mysql的事务隔离级别

-- 1. 开了两个mysql的控制台
-- 2. 查看当前mysql的隔离级别
-- mysql> select @@tx_isolation;
-- +-----------------+
-- | @@tx_isolation  |
-- +-----------------+
-- | REPEATABLE-READ |
-- +-----------------+

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED