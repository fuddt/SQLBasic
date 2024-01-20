SELECT DATABASE();

DESCRIBE customers;
SELECT * FROM customers WHERE name IS NULL;
SELECT * FROM customers WHERE name IS NOT NULL;

#空白を取り出す
SELECT * FROM prefectures WHERE name = "";
SELECT * FROM prefectures WHERE name IS NULL;

SELECT NULL = NULL;
SELECT NULL IS NULL;

#BETWEEN 以上　以下
SELECT * FROM users WHERE age BETWEEN  5 AND 10;
SELECT * FROM users WHERE age NOT BETWEEN  5 AND 10;

#LIKE　％はそのあと何文字入ってもいい　_　は任意の１文字
SELECT * FROM users;
SELECT * FROM users WHERE name LIKE "村%";  -- 前方一致
SELECT * FROM users WHERE name LIKE "%郎";　-- 後方一致
SELECT * FROM users WHERE name LIKE "%ab%"; -- 中間一致
SELECT * FROM users WHERE name LIKE "村_%";　#前方一致
