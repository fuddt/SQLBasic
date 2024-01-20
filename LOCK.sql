SHOW DATABASES;
USE day_4_9_db;

START TRANSACTION;

SHOW TABLES;

SELECT * FROM customers;

UPDATE customers SET age = 43 WHERE id = 1;

ROLLBACK;

START TRANSACTION;
SELECT * FROM customers WHERE id = 1 FOR SHARE;# 共有ロック　share lock
SELECT * FROM customers WHERE id  = 1 FOR UPDATE;# 排他ロック　Exclusive lock