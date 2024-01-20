# I want to check DB
SHOW DATABASES;

USE day_10_14_db;

SHOW TABLES;


SELECT * FROM classes; 
SELECT * FROM customers;
SELECT * FROM customers_2;
SELECT * FROM departments;
SELECT * FROM employees;  -- department_id , 謎のmanager_id
SELECT * FROM enrollments; -- student_id class_id
SELECT * FROM items;  -- store_id
SELECT * FROM orders; -- customer_id item_id
SELECT * FROM salaries; -- employee_id  
SELECT * FROM stores;   
SELECT * FROM students;  
SELECT * FROM users; 

-- 連結で使用するのはUNION 
-- UNION は処理速度が遅い　UNION ALL は早い　特別UNIONである必要がなければ　UNION ALL をおすすめする

SELECT * FROM classes 
UNION
SELECT * FROM departments;

# SELECT の中に　数値を入れたらどうなるか　SELECT に入れたらどうなるか 
SELECT first_name, last_name , 11 FROM users;
SELECT first_name, last_name , NULL FROM users;

#INNER JOIN ON は紐付けできたもののみを表示する　内部結合という
SELECT * FROM employees AS emp
INNER JOIN departments AS dp
ON emp.department_id = dp.id ; -- この　A = B は　B = Aでも機能する
-- プログラミングの直訳
-- * を選択します。employees から。 その際　departments の　id を元に内部結合をします。 

SELECT * FROM employees AS emp
INNER JOIN departments AS dp
ON emp.department_id = dp.id ;  

#下は　Error になります。
SELECT id,name,age FROM employees AS emp
INNER JOIN departments AS dp
ON emp.department_id = dp.id ;  
# Why ??
SELECT emp.id, dp.name, emp.age FROM employees AS emp
INNER JOIN departments AS dp
ON emp.department_id = dp.id ;  
-- テーブルを複数しようしていること、またASを使用してテーブル名を変更していることから
-- どのテーブルの.id どのテーブルの.name というような記述をしなければならない。
-- 通常のプログラミング言語と違って、上から順に処理が進んでいくわけではないことに注意が必要


-- INNER JOIN 構文のFROM〜は　どこまでがFROMの対象？？
SELECT emp.id, dp.name, emp.age 
FROM 
	employees AS emp
	INNER JOIN 
	departments AS dp
	ON 
	emp.department_id = dp.id #ここまでがFROMとなるよ
;  



-- 副問い合わせ　おそらく　集計結果を利用して　絞り込みを行うが一番使いそう
# last_nameに田が入っている人の年齢の最大値を取得する
SELECT * FROM customers;
SELECT MAX(age) FROM customers WHERE last_name LIKE "%田%"; -- ==> 最大値 OOO が取得できる
-- --> この集計結果を利用してさらに絞り込む 
SELECT * FROM customers WHERE age > (SELECT MAX(age) FROM customers WHERE last_name LIKE "%田%");

-- EXISTS 　は　IN で代用可能　：ただし　EXISTS のほうが処理が早いよ

SELECT * FROM employees as em
WHERE em.department_id  IN ( SELECT id FROM departments);
#         ||  同じ
SELECT * FROM employees as em
WHERE EXISTS(
  SELECT * FROM departments AS dt WHERE em.department_id = dt.id);


 
 
SELECT * FROM customers;
SELECT * FROM employees;

SELECT * FROM customers CROSS JOIN employees;



