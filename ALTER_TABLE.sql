SHOW DATABASES;
USE my_db;
SELECT DATABASE();
SHOW TABLES;

DESCRIBE users;

#テーブル名の変更　※滅多に使用しない
ALTER TABLE users RENAME TO users_table;
# カラムの削除
ALTER TABLE users_table DROP COLUMN message;
#カラムの追加
ALTER TABLE users_table ADD post_code CHAR(8);
#指定した位置のあとにカラムを追加
ALTER TABLE users_table ADD gender CHAR(1) AFTER age;
#一番先頭に追加
ALTER TABLE users_table ADD new_id INT FIRST;
#カラムの定義の変更
ALTER TABLE users_table MODIFY name VARCHAR(50);
-- カラム名の変更
ALTER TABLE users_table CHANGE COLUMN name 名前 VARCHAR(50);
-- カラムの位置の変更
ALTER TABLE users_table CHANGE COLUMN gender gender CHAR(1) AFTER post_code;
-- 主キーの削除
ALTER TABLE users_table DROP PRIMARY KEY;

