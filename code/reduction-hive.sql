CREATE TABLE transactions_filtered AS
  SELECT t.* 
    FROM transactions t, offers o
   WHERE t.category = o.category OR t.company = o.company