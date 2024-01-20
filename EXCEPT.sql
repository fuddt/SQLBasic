USE day_10_14_db;
SELECT* FROM customers
UNION
SELECT*FROM customers_2;

#EXCEPT を　NOT EXISTS を使用して実現する。テーブル1にあってテーブル2にないものを表示
SELECT * FROM customers AS c1
WHERE NOT EXISTS(
	SELECT * FROM customers_2 AS c2
	WHERE
	  c1.id = c2.id AND 
	  c1.first_name = c2.first_name AND 
	  c1.last_name = c2.last_name AND 
	  c1.phone_number  = c2.phone_number AND 
	  c1.age = c2.age 
	  );
	 
--  INTERSECT 両方に存在するものを表示
SELECT * FROM customers AS c1
WHERE  EXISTS(
	SELECT * FROM customers_2 AS c2
	WHERE
	  c1.id = c2.id AND 
	  c1.first_name = c2.first_name AND 
	  c1.last_name = c2.last_name AND 
	  c1.phone_number  = c2.phone_number AND 
	  c1.age = c2.age 
	  );