CREATE TABLE customers AS
SELECT te.id , te.offer , te.offerdate
FROM test_history te
UNION ALL
SELECT tr.id , tr.offer , tr.offerdate
FROM train_history tr;

CREATE TABLE filtered_tx_brand AS
SELECT t.id, t.purchasequantity, t.purchaseamount, (c.offerdate - t.date) AS daysbefore 
 FROM transactions t 
 INNER JOIN customers c ON (t.id = c.id)
 INNER JOIN offers o ON (c.offer = o.offer)
 WHERE o.brand = t.brand;

 CREATE TABLE filtered_tx_category AS
SELECT t.id, t.purchasequantity, t.purchaseamount, (c.offerdate - t.date) AS daysbefore 
 FROM transactions t 
 INNER JOIN customers c ON (t.id = c.id)
 INNER JOIN offers o ON (c.offer = o.offer)
 WHERE o.category = t.category;
 
 CREATE TABLE filtered_tx_company AS
SELECT t.id, t.purchasequantity, t.purchaseamount, (h.offerdate - t.date) AS daysbefore 
 FROM transactions t 
 INNER JOIN test_history h ON (t.id = h.id)
 INNER JOIN offers o ON (h.offer = o.offer)
 WHERE o.company = t.company;

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
ON (ever.id = before180.id);

CREATE TABLE category_features AS
SELECT ever.id, ever.tx_count, ever.quantity, ever.cost,
  before30.tx_count AS tx_count_30, before30.quantity AS quantity_30, before30.cost AS cost_30,
  before60.tx_count AS tx_count_60, before60.quantity AS quantity_60, before60.cost AS cost_60,
  before90.tx_count AS tx_count_90, before90.quantity AS quantity_90, before90.cost AS cost_90,
  before180.tx_count AS tx_count_180, before180.quantity AS quantity_180, before180.cost AS cost_180
  FROM 
(SELECT id, COUNT(*) AS tx_count, SUM(purchasequantity) AS quantity, 
	SUM(purchaseamount) AS cost
  FROM filtered_tx_category
GROUP BY id
) ever
LEFT JOIN
(SELECT id, COUNT(*) AS tx_count, SUM(purchasequantity) AS quantity, 
	SUM(purchaseamount) AS cost
  FROM filtered_tx_category
 WHERE daysbefore <= 30
 GROUP BY id
) before30
ON (ever.id = before30.id)
LEFT JOIN
(SELECT id, COUNT(*) AS tx_count, SUM(purchasequantity) AS quantity, 
	SUM(purchaseamount) AS cost
  FROM filtered_tx_category
 WHERE daysbefore <= 60
 GROUP BY id
) before60
ON (ever.id = before60.id)
LEFT JOIN
(SELECT id, COUNT(*) AS tx_count, SUM(purchasequantity) AS quantity, 
	SUM(purchaseamount) AS cost
  FROM filtered_tx_category
 WHERE daysbefore <= 90
 GROUP BY id
) before90
ON (ever.id = before90.id)
LEFT JOIN 
(SELECT id, COUNT(*) AS tx_count, SUM(purchasequantity) AS quantity, 
	SUM(purchaseamount) AS cost
  FROM filtered_tx_category
 WHERE daysbefore <= 180
 GROUP BY id
) before180
ON (ever.id = before180.id);

CREATE TABLE company_features AS
SELECT ever.id, ever.tx_count, ever.quantity, ever.cost,
  before30.tx_count AS tx_count_30, before30.quantity AS quantity_30, before30.cost AS cost_30,
  before60.tx_count AS tx_count_60, before60.quantity AS quantity_60, before60.cost AS cost_60,
  before90.tx_count AS tx_count_90, before90.quantity AS quantity_90, before90.cost AS cost_90,
  before180.tx_count AS tx_count_180, before180.quantity AS quantity_180, before180.cost AS cost_180
  FROM 
(SELECT id, COUNT(*) AS tx_count, SUM(purchasequantity) AS quantity, 
	SUM(purchaseamount) AS cost
  FROM filtered_tx_company
GROUP BY id
) ever
LEFT JOIN
(SELECT id, COUNT(*) AS tx_count, SUM(purchasequantity) AS quantity, 
	SUM(purchaseamount) AS cost
  FROM filtered_tx_company
 WHERE daysbefore <= 30
 GROUP BY id
) before30
ON (ever.id = before30.id)
LEFT JOIN
(SELECT id, COUNT(*) AS tx_count, SUM(purchasequantity) AS quantity, 
	SUM(purchaseamount) AS cost
  FROM filtered_tx_company
 WHERE daysbefore <= 60
 GROUP BY id
) before60
ON (ever.id = before60.id)
LEFT JOIN
(SELECT id, COUNT(*) AS tx_count, SUM(purchasequantity) AS quantity, 
	SUM(purchaseamount) AS cost
  FROM filtered_tx_company
 WHERE daysbefore <= 90
 GROUP BY id
) before90
ON (ever.id = before90.id)
LEFT JOIN 
(SELECT id, COUNT(*) AS tx_count, SUM(purchasequantity) AS quantity, 
	SUM(purchaseamount) AS cost
  FROM filtered_tx_company
 WHERE daysbefore <= 180
 GROUP BY id
) before180
ON (ever.id = before180.id);

CREATE TABLE test_features AS
SELECT 
  h.id, 'u' AS repeater,
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
  
FROM test_history h
INNER JOIN offers o ON (h.offer = o.offer)
INNER JOIN totals t ON (h.id = t.id)
LEFT JOIN brand_features b ON (h.id = b.id)
LEFT JOIN company_features co ON (h.id = co.id)
LEFT JOIN category_features ca ON (h.id = ca.id);

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
LEFT JOIN category_features ca ON (h.id = ca.id);


INSERT OVERWRITE DIRECTORY 's3://de.whs.fdt.kaggle.acquire-valued-shoppers-challenge/output_data/iteration3/'
SELECT *
FROM test_features;