USE day_10_14_db;

-- Q1
-- 1. employeesテーブルとcustomersテーブルの両方から、それぞれidが10より小さいレコードを取り出します。
-- 
-- 両テーブルのfirst_name, last_name, ageカラムを取り出し、行方向に連結します。
-- 
-- 連結の際は、重複を削除するようにしてください。
-- 
SHOW TABLES;

SELECT * FROM employees;
SELECT * FROM customers;

SELECT first_name, last_name, age FROM employees WHERE id < 10
UNION 
SELECT first_name, last_name, age FROM customers WHERE id < 10 ;

-- ちなみに重複を削除しない場合は
SELECT first_name, last_name, age FROM employees WHERE id < 10
UNION ALL 
SELECT first_name, last_name, age FROM customers WHERE id < 10 ;


-- 2. departmentsテーブルのnameカラムが営業部の人の、月収の最大値、最小値、平均値、合計値を計算してください。
-- 
-- employeesテーブルのdepartment_idとdepartmentsテーブルのidが紐づけられ
-- 
-- salariesテーブルのemployee_idとemployeesテーブルのidが紐づけられます。
-- 
-- 月収はsalariesテーブルのpaymentカラムに格納されています

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM salaries;

-- 解法　最大値、最小値、平均値、合計値を準備する
SELECT MAX(payment), MIN(payment), AVG(payment), SUM(payment)
FROM salaries AS sa;

-- 紐付けを行う
SELECT MAX(payment), MIN(payment), AVG(payment), SUM(payment)
FROM salaries AS sa    -- 最終的に使用するテーブルを先頭とする　英文法　SVOC の流れ　
INNER JOIN employees AS emp
ON sa.employees_id = emp.id id 
INNER JOIN departments AS dt
ON emp.department_id = dt.id
WHERE dt.name = "営業部";

-- 3. classesテーブルのidが、5よりも小さいレコードとそれ以外のレコードを履修している生徒の数を計算してください。
-- 
-- classesテーブルのidとenrollmentsテーブルのclass_id、enrollmentsテーブルのstudent_idとstudents.idが紐づく
-- 
-- classesにはクラス名が格納されていて、studentsと多対多で結合される
SELECT * FROM enrollments;
SELECT * FROM students;
SELECT * FROM classes;

-- 場合分けの集計にはGROUP BY

SELECT 
CASE 
	WHEN cls.id < 5 THEN "クラス1"
	ELSE "クラス2"
END AS "クラス分類",
COUNT(std.id)
FROM classes AS cls
INNER JOIN enrollments AS enr
ON cls.id = enr.class_id
INNER JOIN students AS std 
ON enr.student_id = std.id
GROUP BY 
CASE 
	WHEN cls.id < 5 THEN "クラス1"
	ELSE "クラス2"
END; 


-- 4. ageが40より小さい全従業員で月収の平均値が7,000,000よりも大きい人の、月収の合計値と平均値を計算してください。
-- 
-- employeesテーブルのidとsalariesテーブルのemployee_idが紐づけでき、
-- salariesテーブルのpaymentに月収が格納されています

-- まず　ageが40未満の人を用意してみる
SELECT * FROM employees AS emp
WHERE emp.age < 40;

SELECT * FROM employees AS emp
WHERE emp.age < 40
INNER JOIN salaries AS sa 
ON emp.id = sa.employee_id -- employees のid と salaries のemployee_idが紐付けられる
GROUP BY emp.id -- 従業員ごとに集計


-- 欲しい情報を整理する
SELECT emp.id, SUM(sa.payment),AVG(sa.payment) -- 合計値と平均値
FROM employees AS emp
INNER JOIN salaries AS sa  
ON emp.id = sa.employee_id 
WHERE emp.age < 40
GROUP BY emp.id 
HAVING AVG(sa.payment) > 7000000; -- 集計値に対しての絞り込みはHAVING


-- 5. customer毎に、order_amountの合計値を計算してください。
-- 
-- customersテーブルとordersテーブルは、idカラムとcustomer_idカラムで紐づけができます
-- 
-- ordersテーブルのorder_amountの合計値を取得します。
-- 
-- SELECTの対象カラムに副問い合わせを用いて値を取得してください。

SELECT 
*,
(SELECT SUM(order_amount) FROM orders AS od
WHERE od.customer_id = cst.id) AS sum_order_amount
FROM customers AS cst;


-- 6. customersテーブルからlast_nameに田がつくレコード、
-- 
-- ordersテーブルからorder_dateが2020-12-01以上のレコード、
-- 
-- storesテーブルからnameが山田商店のレコード同士を連結します
-- 
-- customersとorders, ordersとitems, itemsとstoresが紐づきます。
-- 
-- first_nameとlast_nameの値を連結(CONCAT)して集計(GROUP BY)し、そのレコード数をCOUNTしてください。
SELECT
 CONCAT(customers.last_name, customers.first_name), COUNT(*)
 FROM 
 (SELECT * FROM customers WHERE last_name LIKE "%田%") AS customers
 INNER JOIN (SELECT * FROM orders WHERE order_date >= "2020-12-01") AS orders
 ON customers.id = orders.customer_id 
 INNER JOIN items 
 ON orders.item_id = items.id 
 INNER JOIN (SELECT * FROM stores WHERE name = "山田商店") AS stores 
 ON stores.id = items.store_id 
 GROUP BY CONCAT(customers.last_name, customers.first_name);




-- 7. salariesのpaymentが9,000,000よりも大きいものが存在するレコードを、employeesテーブルから取り出してください。
-- 
-- employeesテーブルとsalariesテーブルを紐づけます。
-- 
-- EXISTSとINとINNER JOIN、それぞれの方法で記載してください

#下準備として　副問い合わせようのコードを準備しとく
SELECT *FROM salaries WHERE payment > 9000000;

# IN のやり方
SELECT * FROM employees
 WHERE id  # id で絞り込み　どんな？〜 副問い合わせで　表示した　employee_id に含まれるもののみ
 IN(SELECT employee_id FROM salaries WHERE payment > 9000000);

SELECT 
* 
FROM
	employees AS em
	INNER JOIN salaries AS sa 
	ON em.id = sa.employee_id  
WHERE payment > 9000000;
#　もしくは 重複削除と表示は employees テーブルののみにする
SELECT 
 DISTINCT em.*
FROM
	employees AS em
	INNER JOIN salaries AS sa 
	ON em.id = sa.employee_id  
WHERE payment > 9000000;


SELECT * FROM employees AS em 
WHERE EXISTS( SELECT * FROM salaries AS sa
	WHERE  sa.payment > 9000000 AND em.id = sa.employee_id );


8. employeesテーブルから、salariesテーブルと紐づけのできないレコードを取り出してください。

EXISTSとINとLEFT JOIN、それぞれの方法で記載してください





-- 9. employeesテーブルとcustomersテーブルのage同士を比較します
-- 
-- customersテーブルの最小age, 平均age, 最大ageとemployeesテーブルのageを比較して、
-- 
-- employeesテーブルのageが、最小age未満のものは最小未満、最小age以上で平均age未満のものは平均未満、
-- 
-- 平均age以上で最大age未満のものは最大未満、それ以外はその他と表示します
-- 
-- WITH句を用いて記述します

SELECT age FROM employees;
SELECT age FROM customers;

SELECT MIN(age) AS cs_min, AVG(age) AS cs_avg, MAX(age) AS cs_max FROM customers;
WITH cs_values AS (SELECT MIN(age) AS cs_min, AVG(age) AS cs_avg, MAX(age) AS cs_max FROM customers)
SELECT * FROM cs_values;


WITH cs_values AS (SELECT MIN(age) AS cs_min, AVG(age) AS cs_avg, MAX(age) AS cs_max FROM customers)
SELECT 
*,
	CASE 
		WHEN age < cs.cs_min THEN "最小未満"
		WHEN age >= cs.cs_min AND age < cs.cs_avg THEN "平均未満"
		WHEN age >= cs.cs_avg AND age < cs.cs_max THEN "最大未満"
		ELSE "その他"
	END AS "Extract"
FROM 
	employees AS em
	CROSS JOIN cs_values AS cs;

SELECT * FROM employees;





-- 10. customersテーブルからageが50よりも大きいレコードを取り出して、ordersテーブルと連結します。
-- 
-- customersテーブルのidに対して、ordersテーブルのorder_amount*order_priceのorder_date毎の合計値。
-- 
-- 合計値の7日間平均値、合計値の15日平均値、合計値の30日平均値を計算します。
-- 
-- 7日間平均、15日平均値、30日平均値が計算できない区間(対象よりも前の日付のデータが十分にない区間)は、空白を表示してください。
SELECT * FROM customers WHERE age > 50;
SELECT * FROM orders;

SELECT order_date,SUM(order_amount * order_price) AS TOTAL FROM orders AS od
INNER JOIN (SELECT * FROM customers WHERE age > 50) AS age_50 
ON age_50.id = od.customer_id
GROUP BY od.order_date ORDER BY order_date;

SELECT order_date,SUM(order_amount * order_price)OVER(PARTITION BY order_date) FROM orders AS od
INNER JOIN (SELECT * FROM customers WHERE age > 50) AS age_50 
ON age_50.id = od.customer_id;


SELECT *,
AVG(TOTAL)OVER(ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW ) AS "7日平均"
FROM
	(SELECT order_date,SUM(order_amount * order_price) AS "合計値" FROM orders AS od
	INNER JOIN (SELECT * FROM customers WHERE age > 50) AS age_50 
	ON age_50.id = od.customer_id
	GROUP BY od.order_date );


WITH daily_summary AS(SELECT od.id,order_date,SUM(order_amount * order_price) AS sale FROM orders AS od
	INNER JOIN (SELECT * FROM customers WHERE age > 50) AS age_50 
	ON age_50.id = od.customer_id
	GROUP BY od.id,od.order_date)
SELECT *,
AVG(sale)OVER(ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW ) AS "7日平均",
AVG(sale)OVER(ORDER BY order_date ROWS BETWEEN 14 PRECEDING AND CURRENT ROW ) AS "15日平均",
AVG(sale)OVER(ORDER BY order_date ROWS BETWEEN 29 PRECEDING AND CURRENT ROW ) AS "30日平均"
FROM daily_summary ORDER BY id;


WITH daily_summary AS(SELECT order_date,SUM(order_amount * order_price) AS sale FROM orders AS od
	INNER JOIN (SELECT * FROM customers WHERE age > 50) AS age_50 
	ON age_50.id = od.customer_id
	GROUP BY od.order_date )
SELECT *,
AVG(sale)OVER(ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW ) AS "7日平均",
AVG(sale)OVER(ORDER BY order_date ROWS BETWEEN 14 PRECEDING AND CURRENT ROW ) AS "15日平均",
AVG(sale)OVER(ORDER BY order_date ROWS BETWEEN 29 PRECEDING AND CURRENT ROW ) AS "29日平均"
FROM daily_summary;

WITH age50cs AS ( SELECT * FROM customers WHERE age > 50),
cs_orders AS (SELECT a5.id, od.order_date, SUM(order_amount * order_price) AS sum_amount FROM age50cs AS a5 
							INNER JOIN  orders AS od
							ON a5.id = od.customer_id
							GROUP BY a5.id, od.order_date)
SELECT * FROM cs_orders;









