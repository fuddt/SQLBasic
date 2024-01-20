SELECT * FROM customers WHERE NAME IS NULL;

-- COUNT
SELECT COUNT(*) FROM customers; -- データが何行入っているか
SELECT COUNT(name) FROM customers; -- NULLはカウントしない
SELECT COUNT(name) FROM customers WHERE id > 80;

-- MAX,MIN
SELECT MAX(age), MIN(age) FROM users WHERE birth_place = "日本";
SELECT MAX(birth_day), MIN(birth_day) FROM users;

-- SUM
SELECT SUM(salary) FROM employees;
SELECT AVG(salary) FROM employees;
-- AVGはNULLをカウントしないので注意が必要

-- GROUP BY   ageを元にカウントをする。＝＞年齢別の誕生日の最新、最古を表示
SELECT age, COUNT(*), MAX(birth_day), MIN(birth_day) 
FROM users 
WHERE birth_place = "日本"
GROUP BY age
ORDER BY age;

SELECT department, SUM(salary), AVG(salary), MIN(salary) FROM employees
GROUP BY department ;

-- HAVING GROUP BYで集計したものに対して絞り込みを使用する
SELECT department, AVG(salary) FROM employees
GROUP BY department HAVING AVG(salary) > 4000000;



