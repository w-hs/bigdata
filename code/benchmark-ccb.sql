SELECT DISTINCT h.id, 1.0 AS repeatProbability
  FROM test_history h INNER JOIN offers o ON (h.offer = o.offer)
 WHERE EXISTS (
	SELECT * FROM filtered_transactions t
	 WHERE t.id = h.id
	   AND t.category = o.category
	   AND t.company = o.company
	   AND t.brand = o.brand
	)