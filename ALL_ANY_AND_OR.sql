SELECT * FROM users WHERE age IN(12,24,36);
SELECT * FROM users WHERE birth_place IN("France","Italy");


SELECT * FROM receipts;
# SELECT + IN 
#customers の中で　receipts の中にデータが入っている人（＝customer_idがある人)のみ表示
SELECT * FROM customers WHERE id IN(SELECT customer_id FROM receipts);

#ALL, ANY
SELECT * FROM employees;
SELECT * FROM  users WHERE  age > ANY(SELECT age FROM employees WHERE salary > 5000000);

#AND,OR
SELECT * FROM employees WHERE age > 20 AND salary > 5000000;
#年齢が20以上で　id が　5以下　10以上で　名前に「田」が入っている人
SELECT * FROM employees WHERE age > 20 AND (id < 5 OR id > 10) AND name LIKE "%田%";

