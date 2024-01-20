WITH t AS (SELECT DISTINCT * FROM TrainingData)
	SELECT COUNT(race_key) FROM t ;

CREATE TABLE NewTrainingData AS (SELECT DISTINCT * FROM TrainingData);
ALTER TABLE NewTrainingData  MODIFY race_key CHAR(12);
ALTER TABLE NewTrainingData  MODIFY 血統登録番号 CHAR(12);
ALTER TABLE NewTrainingData  ADD PRIMARY KEY (race_key,血統登録番号);

DESCRIBE NewTrainingData;
