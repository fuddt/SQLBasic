USE my_db;
SHOW TABLES;

DESCRIBE people;
ALTER TABLE people ADD age INT AFTER name;

INSERT INTO people VALUES(1, "john", 18, "2001-01-01");
INSERT INTO people VALUES(2, "alice", 21, "2003-01-01");
INSERT INTO people VALUES(3, "scotte", 22, "2005-01-01");
INSERT INTO people VALUES(4, "santino",30, "2008-01-01");
INSERT INTO people VALUES(5, "jill", 54, "2004-01-01");
INSERT INTO people VALUES(6, "bally", 42, "2011-01-01");
INSERT INTO people VALUES(7, "leon", 37, "2022-01-01");
INSERT INTO people VALUES(8, "leon", 37, "2022-01-01");

SELECT * FROM people;
#昇順
SELECT * FROM people ORDER BY age; 
#降順
SELECT * FROM people ORDER BY age DESC;

#name
SELECT * FROM people ORDER BY name;

#2つのカラム  同じ値の人がいた場合は次の値での並び替えを実行する
SELECT * FROM people ORDER BY birth_day, name;
SELECT * FROM people ORDER BY birth_day DESC, name;

#DISNTICT 重複を除いて表示する
-- 誕生日の重複を除いて誕生日順に表示する
SELECT DISTINCT birth_day FROM people ORDER BY birth_day;
-- 誕生日と名前の重複を除いて表示する
SELECT DISTINCT name, birth_day FROM people;

#LIMIT
SELECT id, name, age FROM people LIMIT 3;
#３行飛ばして飛ばしたとこから２行表示
SELECT * FROM people LIMIT 3,2;