-- OFF
SHOW VARIABLES WHERE variable_name = "autocommit";
SET AUTOCOMMIT = 0; 

-- ON
SHOW VARIABLES WHERE variable_name = "autocommit";
SET AUTOCOMMIT = 1; 