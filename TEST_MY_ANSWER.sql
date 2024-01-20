SHOW DATABASES;
USE day_4_9_db;
SHOW TABLES;


-- 問1
SELECT name, age FROM customers;

SELECT name, age 
FROM customers 
WHERE 
age BETWEEN 28 AND 40  
AND
name LIKE '%子'
ORDER BY age DESC
LIMIT 5;

-- Q2
SELECT * FROM receipts;
INSERT INTO receipts(id,customer_id, store_name,price) VALUES(301,100,"StoreX",10000);
-- Q3
DELETE FROM receipts WHERE id = 301;
-- Q4
DELETE FROM prefectures WHERE name = '' OR name IS NULL;

-- Q5 
SELECT id ,age FROM customers;
UPDATE customers SET age = age + 1 WHERE age BETWEEN 20 AND 50;

-- Q6
SELECT * FROM students;
SELECT ROUND(1 + RAND() * 4);
UPDATE students SET class_no = ROUND(1 + RAND() * 4) WHERE class_no = 6;

-- Q7
SELECT * FROM students WHERE class_no IN(3,4);
SELECT * FROM students
WHERE height < ALL(SELECT height + 10 FROM students WHERE class_no IN(3,4))
AND class_no=1;

-- Q8

SELECT TRIM(department) FROM employees ;
UPDATE employees SET department = TRIM(department);
SELECT * FROM employees;

-- Q9
SELECT * ,
	CASE
		WHEN salary >= 5000000 THEN salary * 0.9
		WHEN salary < 5000000 THEN salary * 1.1
	END 
FROM employees;

-- Q10
SELECT * FROM customers ;
INSERT INTO customers VALUES(101, "名無権兵衛", 0,CURDATE());

-- Q11
SHOW TABLES;
ALTER TABLE customers ADD name_length INT;
SELECT name_length FROM customers; 
UPDATE customers SET name_length = CHAR_LENGTH(name);

-- Q12
SHOW TABLES;
SELECT * FROM tests_score;
ALTER TABLE tests_score ADD score INT;
UPDATE tests_score 
SET score =  
	CASE 
		WHEN COALESCE(test_score_1, test_score_2, test_score_3) > 900 THEN FLOOR(COALESCE(test_score_1, test_score_2, test_score_3) * 1.2)
		WHEN  COALESCE(test_score_1, test_score_2, test_score_3) < 600 THEN CEILING(COALESCE(test_score_1, test_score_2, test_score_3) * 0.8)
	END;


-- Q13
SELECT * FROM employees;
SELECT department FROM employees ORDER BY department;
ALTER TABLE employees ADD department_no INT;

UPDATE employees 
SET department_no = CASE 
	WHEN department = "マーケティング部" THEN 1
	WHEN department = "研究部" THEN 2
	WHEN department = "開発部" THEN 3
	WHEN department = "総務部" THEN 4
	WHEN department = "営業部" THEN 5
	WHEN department = "経理部" THEN 6
END;

SELECT * FROM employees ORDER BY department_no;

