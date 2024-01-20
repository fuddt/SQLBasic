USE day_19_21_db;
SELECT * FROM customers;
EXPLAIN ANALYZE SELECT * FROM customers WHERE first_name="Olivia";

CREATE INDEX idx_customers_first_name ON customers(first_name);
EXPLAIN ANALYZE SELECT * FROM customers WHERE first_name="Olivia";
-- -> Index lookup on customers using idx_customers_first_name (first_name='Olivia')  (cost=176.05 rows=503) (actual time=0.436..3.028 rows=503 loops=1)



