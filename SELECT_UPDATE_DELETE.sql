SHOW TABLES;

#全レコードの取得
SELECT * FROM people;

SELECT id FROM people;
SELECT name, id, birth_day, name FROM people;

#カラム名を変更して表示したいとき
SELECT id AS "番号", name AS '名前' FROM people;

#WHERE句
SELECT * FROM people WHERE name = 'Taro';
SELECT * FROM people WHERE id >= 1;

#UPDATE句
-- UPDATEを使用する際は必ずWHEREで条件を絞り込む。そうしないと対象のカラムの値が全て変更されてしまう。

#NONE WHERE
UPDATE people SET birth_day = "1989-12-28";
SELECT*FROM people;

#USE WHERE  id が２の人の名前をTaro　誕生日を2000-01-01
UPDATE people SET name = 'Taro', birth_day = '2000-01-01' WHERE id =2;

#DELETE
DELETE FROM people WHERE id = 3;
