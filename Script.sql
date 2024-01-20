SHOW DATABASES;#データベースの一覧表示
CREATE DATABASE my_db;#DataBaseの作成

#DBの削除
DROP DATABASE my_db;

#performance_schema　を利用
USE performance_schema;
#利用中のDBの表示
SELECT DATABASE ();

USE my_db;