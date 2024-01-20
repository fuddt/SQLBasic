SHOW DATABASES;

CREATE DATABASE day_19_21_db;

USE day_19_21_db;
SHOW TABLES;

-- 統計情報の確認
SELECT * FROM mysql.innodb_table_stats WHERE database_name ="day_19_21_db";

-- 現在４７都道府県の情報が入っていることがわかる　n_rows　のとこ
SELECT * FROM prefectures;
-- ここで48番目のデータを挿入してみて　すぐに　統計情報の確認してみると　47都道府県
-- のままとなっている　⇨　これはDBはすぐにはデータが更新されないためである。
INSERT INTO prefectures VALUES("48","不明");

-- そこで手動で更新をしてみる
-- 統計情報の手動更新
ANALYZE TABLE prefectures;

DELETE FROM prefectures WHERE prefecture_code ="48" AND name = "不明";

-- SQLを実行せずに実行計画だけ表示
EXPLAIN SELECT * FROM customers;
-- type ALL となっている　⇨　フルスキャンという意味


-- SQLを実行して、実行計画を表示
EXPLAIN ANALYZE SELECT * FROM customers;
-- -> Table scan on customers  (cost=52683.48 rows=497050) (actual time=0.141..179.959 rows=500000 loops=1)¶|
-- actual time=0.141   １行当たり　0.141 m秒　ミリビョウ　⇨　0.0001秒
-- ..179.959　全体で　179ミリ秒　⇨　0.179秒

SELECT * FROM customers;
