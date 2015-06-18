CREATE TABLE totals AS
SELECT t.id, COUNT(*) AS total_count, SUM(t.purchaseamount) AS total_spent
  FROM transactions t
GROUP BY t.id
