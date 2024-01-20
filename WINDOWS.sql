USE day_10_14_db;
SHOW TABLES;

-- WINDOWS
SELECT * ,AVG(age)OVER(),COUNT(*)OVER()
FROM employees;

-- PARTITION BY :分割してその中で集計する
SELECT * ,AVG(age)OVER(PARTITION BY department_id) AS avg_age
FROM employees;

-- ORDER BY
SELECT *, COUNT(*)OVER(ORDER BY age) AS tmp_count
FROM employees;

-- 使用例として　日別進捗　の計算がわかりやすい
SELECT
*, SUM(order_price)OVER(ORDER BY order_date)  AS "日別売上進捗" FROM orders;

-- salesテーブルの合計値の７日間の平均を求める
-- まず日付ごとの合計値を求める
-- ７日間平均を求める
SELECT * FROM orders ORDER BY order_date;
SELECT * , SUM(order_price * order_amount)
OVER(ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
FROM orders ;

WITH daily_summary AS(
SELECT 
	order_date, SUM(order_price * order_amount) AS sale
FROM
	orders
GROUP BY order_date
)
SELECT 
  * ,
  AVG(sale)OVER(ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) -- 現在の行から六日前までの平均 => ７日間の平均
 FROM 
 	daily_summary;

