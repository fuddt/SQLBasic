SHOW DATABASES;
USE day_4_9_db;

SHOW TABLES;

SELECT * FROM users;

-- TRANSACTION の開始
START TRANSACTION;
-- UPDATE START
UPDATE users SET name = "奥山 成美" WHERE id = 1;
-- この段階では見かけ上では変更がされているが、実際のDBのデータは変更が保存されていない
-- ROLLBACK（トランザクション前に戻す）
ROLLBACK;
-- ロールバックするとトランザクション前に戻る
SELECT * FROM users;　

-- COMMIT（トランザクションをDBに反映させる）
COMMIT;
-- もう一度ROLLBACKすると変更が加えられているのが確認できる
ROLLBACK;




