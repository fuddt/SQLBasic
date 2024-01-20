USE day_4_9_db;
SELECT DATABASE();

SHOW TABLES;

-- IF(条件式、真の場合、偽の場合)
SELECT*, IF(birth_place = '日本','日本人','外国人') AS '国籍'FROM users;
SELECT name, age, iF(age < 20, 'child','adalt') FROM users;


-- CASE
SELECT
	*,
	CASE birth_place
	WHEN "日本" THEN "日本人"
	WHEN "Iraq" THEN "イラク人"
	ELSE "外国人"
	END AS "国籍"
FROM 
	users
WHERE id > 30;

SELECT*FROM prefectures;

SELECT 
	name,
	CASE
		WHEN name IN('香川県', "愛媛県","徳島県", "高知県") THEN "四国"
		ELSE "その他"
	END AS "地域名"
FROM
	prefectures ;

SELECT *,
	CASE 
		WHEN student_id %3 = 0 THEN test_score_1
		WHEN student_id %3 = 1 THEN test_score_2
		WHEN student_id %3 = 2 THEN test_score_3
	END AS score
FROM tests_score;

SELECT *,
	CASE
		WHEN name IN('香川県', "愛媛県","徳島県", "高知県") THEN "四国"
		ELSE "その他"
	END AS "地域名"
FROM prefectures 
ORDER BY  
	CASE
		WHEN name IN('香川県', "愛媛県","徳島県", "高知県") THEN "四国"
		ELSE "その他"
	END;

SELECT name,
	CASE 
		WHEN name = "%" THEN '判明'
		WHEN name IS NULL THEN '不明'
	END AS "判定"
FROM users;
	