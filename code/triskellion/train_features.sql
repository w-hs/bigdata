CREATE TABLE train_features AS
SELECT 
  h.id, h.repeater,
  o.quantity AS o_quantity, o.offervalue,
  t.total_count, t.total_spent,
  
  b.tx_count AS b_tx_count, b.quantity AS b_quantity, b.cost AS b_cost,
  b.tx_count_30 AS b_tx_count_30, b.quantity_30 AS b_quantity_30, b.cost_30 AS b_cost_30,
  b.tx_count_60 AS b_tx_count_60, b.quantity_60 AS b_quantity_60, b.cost_60 AS b_cost_60,
  b.tx_count_90 AS b_tx_count_90, b.quantity_90 AS b_quantity_90, b.cost_90 AS b_cost_90,
  b.tx_count_180 AS b_tx_count_180, b.quantity_180 AS b_quantity_180, b.cost_180 AS b_cost_180,
  
  co.tx_count AS co_tx_count, co.quantity AS co_quantity, co.cost AS co_cost,
  co.tx_count_30 AS co_tx_count_30, co.quantity_30 AS co_quantity_30, co.cost_30 AS co_cost_30,
  co.tx_count_60 AS co_tx_count_60, co.quantity_60 AS co_quantity_60, co.cost_60 AS co_cost_60,
  co.tx_count_90 AS co_tx_count_90, co.quantity_90 AS co_quantity_90, co.cost_90 AS co_cost_90,
  co.tx_count_180 AS co_tx_count_180, co.quantity_180 AS co_quantity_180, co.cost_180 AS co_cost_180,

  ca.tx_count AS ca_tx_count, ca.quantity AS ca_quantity, ca.cost AS ca_cost,
  ca.tx_count_30 AS ca_tx_count_30, ca.quantity_30 AS ca_quantity_30, ca.cost_30 AS ca_cost_30,
  ca.tx_count_60 AS ca_tx_count_60, ca.quantity_60 AS ca_quantity_60, ca.cost_60 AS ca_cost_60,
  ca.tx_count_90 AS ca_tx_count_90, ca.quantity_90 AS ca_quantity_90, ca.cost_90 AS ca_cost_90,
  ca.tx_count_180 AS ca_tx_count_180, ca.quantity_180 AS ca_quantity_180, ca.cost_180 AS ca_cost_180
  
FROM train_history h
INNER JOIN offers o ON (h.offer = o.offer)
INNER JOIN totals t ON (h.id = t.id)
LEFT JOIN brand_features b ON (h.id = b.id)
LEFT JOIN company_features co ON (h.id = co.id)
LEFT JOIN category_features ca ON (h.id = ca.id)