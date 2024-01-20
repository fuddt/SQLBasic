USE jrdb;

ALTER TABLE PreprocessedSED MODIFY 着順 TINYINT;

-- CREATE TABLE newtable AS
(
SELECT * FROM TrainingData AS td
INNER JOIN 
(SELECT PreprocessedSED.race_key AS レースキー,
着順, 
PreprocessedSED.騎手名 AS JOKEYNAME FROM PreprocessedSED)
AS ps
ON (td.race_key,td.騎手名) = (ps.レースキー,ps.JOKEYNAME))
;

SELECT * FROM JokeyWightedCourseWinRate;
SELECT * FROM TrainingData;

-- CREATE TABLE COMP AS (
SELECT * FROM newtable AS td
INNER JOIN 
(SELECT JokeyWightedCourseWinRate.race_key AS A, 
JokeyWightedCourseWinRate.年月日 AS B,
JokeyWightedCourseWinRate.着順 AS C,
JokeyWightedCourseWinRate.騎手名 AS D,
JokeyWightedCourseWinRate.JokeyWightedCourseWinRate AS JokeyRate
FROM JokeyWightedCourseWinRate) AS jw
ON (td.race_key, td.年月日, td.着順,td.騎手名) = (jw.A, jw.B, jw.D, jw.C));


