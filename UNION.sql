SHOW DATABASES;
USE day_4_9_db;

-- UNIONは重複は削除される

SELECT * FROM new_students
UNION
SELECT * FROM students;

SELECT * FROM new_students
UNION
SELECT * FROM students
ORDER BY id;

-- UNION ALL 重複を削除しない
SELECT * FROM new_students
UNION ALL
SELECT * FROM students
ORDER BY id;

-- カラムの型が一致していれば、違うカラム同士でも結合できてしまう。
SELECT id, name FROM students
UNION
SELECT age, name FROM users;