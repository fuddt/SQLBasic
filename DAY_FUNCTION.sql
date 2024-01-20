SELECT 1 + 1;

SELECT name, age , age + 3 FROM users LIMIT 10;

SELECT birth_day , birth_day + 10 FROM users;

SELECT * FROM employees ;

SELECT department, name, salary, salary * 1.1 AS salary_next_year FROM employees;

#文字列の連結
SELECT CONCAT(department,"-----", name) FROM employees;

#日付の関数
SELECT NOW();
SELECT NOW(), name, age FROM users;
SELECT CURDATE();
SELECT DATE_FORMAT(NOW(), "%Y/%m");

#文字列関数
SELECT LENGTH('ABC');
SELECT LENGTH('あいう');
SELECT name, LENGTH(name) FROM users;

SELECT CHAR_LENGTH('ABC');
SELECT CHAR_LENGTH('あいう');
SELECT name, CHAR_LENGTH(name) FROM users;

SELECT LTRIM("  ABC");
SELECT RTRIM("ABC ");
SELECT TRIM("  ABC   ");

#　TRIM をした文字数と元の文字数が変化するものだけを表示する
SELECT name, CHAR_LENGTH(name) AS name_length 
FROM employees 
WHERE CHAR_LENGTH(name) != CHAR_LENGTH(TRIM(name));

#UPDATEして空白を削除したものにする
UPDATE employees 
SET name=TRIM(name)
WHERE CHAR_LENGTH(name) <> CHAR_LENGTH(TRIM(name));

#REPLACE
SELECT REPLACE('I LIKE AN APPLE','APPLE','LEMON');

SELECT REPLACE(name, 'Mrs','Ms') FROM users WHERE name LIKE 'Mrs%';
UPDATE users SET name = REPLACE(name, 'Mrs', 'Ms') WHERE name LIKE 'Mrs%';
SELECT * FROM users;

#UPPER , LOWER
SELECT UPPER('apple');
SELECT LOWER('APPLE');

#SUBSTRING,SUBSTR
SELECT SUBSTRING(name, 2 , 3), name FROM employees; 
SELECT * FROM employees WHERE SUBSTR(name, 2,1) ='田';