SELECT f.*, 
  CAST(b_tx_count > 0 AND co_tx_count > 0 AND ca_tx_count > 0 AS INTEGER) AS any_b_co_ca,
  CAST(b_tx_count > 0 AND ca_tx_count > 0 AS INTEGER) AS any_b_ca,
  CAST(b_tx_count > 0 AND co_tx_count > 0 AS INTEGER) AS any_b_co
  FROM test_features f
  
SELECT f.*, 
  CAST(b_tx_count > 0 AND co_tx_count > 0 AND ca_tx_count > 0 AS INTEGER) AS any_b_co_ca,
  CAST(b_tx_count > 0 AND ca_tx_count > 0 AS INTEGER) AS any_b_ca,
  CAST(b_tx_count > 0 AND co_tx_count > 0 AS INTEGER) AS any_b_co
  FROM train_features f