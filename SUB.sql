SHOW TABLES;

SELECT*FROM employees;
SELECT * FROM departments;


#department_id が　1と2の人を抽出する　ー＞　この場合1、2はなんやねんってなる
SELECT * FROM employees
WHERE department_id IN(1,2);
#そのためdepartments テーブルを開いて確認する必要がある

#ちなみに1、2は経営企画部と営業部です
SELECT * FROM departments WHERE name IN("経営企画部","営業部");


/*実際に指示されるときは、上記のように「employeesテーブルからdepartment_id が１、２の人を抽出して」
 * ではなく
 * 「employeesテーブルからdepartment_id が経営企画部、営業部の人を抽出して」と指示される方が現実的
 * このとき副問い合わせを利用する
 */
SELECT * FROM employees 
WHERE department_id
IN(
SELECT id FROM departments WHERE name IN("経営企画部","営業部")
);

SELECT*FROM students;
SELECT*FROM users;

SELECT*FROM students
WHERE (first_name,last_name) IN(
	SELECT first_name, last_name FROM users);
# 生徒のテーブルから　ユーザーテーブルに　苗字と名前が登録されている人のみ表示する


# 年齢が最大の人だけを表示する
SELECT MAX(age) FROM employees;
SELECT * FROM employees WHERE age = (SELECT MAX(age) FROM employees);

SELECT department_id, AVG(age) AS avg_age FROM employees GROUP BY department_id;
SELECT 
MAX(avg_age) AS "max age by departments"
FROM
(SELECT department_id, AVG(age) AS avg_age FROM employees GROUP BY department_id) AS tmp_emp;

