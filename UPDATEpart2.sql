USE day_10_14_db;
SHOW TABLES;

SELECT * FROM employees;

UPDATE epmployees SET age = age + 1 WHERE id = 1;

SELECT *FROM employees AS emp
WHERE 
emp.department_id = (SELECT id FROM departments WHERE name = "営業部");