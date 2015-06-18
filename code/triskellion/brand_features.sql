CREATE TABLE brand_features AS
SELECT ever.id, ever.tx_count, ever.quantity, ever.cost,
  before30.tx_count AS tx_count_30, before30.quantity AS quantity_30, before30.cost AS cost_30,
  before60.tx_count AS tx_count_60, before60.quantity AS quantity_60, before60.cost AS cost_60,
  before90.tx_count AS tx_count_90, before90.quantity AS quantity_90, before90.cost AS cost_90,
  before180.tx_count AS tx_count_180, before180.quantity AS quantity_180, before180.cost AS cost_180
  FROM 
(SELECT id, COUNT(*) AS tx_count, SUM(purchasequantity) AS quantity, 
	SUM(purchaseamount) AS cost
  FROM filtered_tx_brand
GROUP BY id
) ever
LEFT JOIN
(SELECT id, COUNT(*) AS tx_count, SUM(purchasequantity) AS quantity, 
	SUM(purchaseamount) AS cost
  FROM filtered_tx_brand
 WHERE daysbefore <= 30
 GROUP BY id
) before30
ON (ever.id = before30.id)
LEFT JOIN
(SELECT id, COUNT(*) AS tx_count, SUM(purchasequantity) AS quantity, 
	SUM(purchaseamount) AS cost
  FROM filtered_tx_brand
 WHERE daysbefore <= 60
 GROUP BY id
) before60
ON (ever.id = before60.id)
LEFT JOIN
(SELECT id, COUNT(*) AS tx_count, SUM(purchasequantity) AS quantity, 
	SUM(purchaseamount) AS cost
  FROM filtered_tx_brand
 WHERE daysbefore <= 90
 GROUP BY id
) before90
ON (ever.id = before90.id)
LEFT JOIN 
(SELECT id, COUNT(*) AS tx_count, SUM(purchasequantity) AS quantity, 
	SUM(purchaseamount) AS cost
  FROM filtered_tx_brand
 WHERE daysbefore <= 180
 GROUP BY id
) before180
ON (ever.id = before180.id)