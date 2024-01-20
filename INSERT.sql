USE my_db;
SELECT DATABASE();

CREATE TABLE people(
	id INT PRIMARY KEY,
	name VARCHAR(50),
	birth_day DATE DEFAULT "1990-01-01"
);


#何も指定しないで値を挿入
INSERT INTO people VALUES(1, "Taro", "2001-01-01");

SELECT * FROM people;
#カラムを指定しての挿入
INSERT INTO people(id, name) VALUES(2, "jiro");
-- birth_day を入力していないので、DEFAULTの値が挿入されます

#シングルクォートの中にシングルクォートを入れたいときは''二重にする。ダブルクォートでも同様
INSERT INTO people(id, name) VALUES(3,'jiro''s son');


