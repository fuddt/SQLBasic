SHOW DATABASES;
USE my_db;
SELECT DATABASE();

-- STUDENTSテーブルの作成
CREATE TABLE students(
	id INT PRIMARY KEY,
	name CHAR(10)
	);

#CHAR型の末尾のスペースが削除される
INSERT INTO students VALUES(1, "ABCDEF  ")
SELECT * FROM students;

#VARCHAR型は末尾が削除されないよ
ALTER TABLE students MODIFY name VARCHAR(10);
INSERT INTO students VALUES(2, "ABCDEF  ");
SELECT*FROM students;
#name, name の文字の数を表示して確認してみる
SELECT name, CHAR_LENGTH(name) FROM students;