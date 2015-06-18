INSERT OVERWRITE DIRECTORY 's3://de.whs.fdt.kaggle.acquire-valued-shoppers-challenge/output_data/iteration1/'
SELECT DISTINCT h.id , 1.0 AS repeatProbability
FROM test_history h INNER JOIN offers o ON (h. offer = o. offer )
INNER JOIN transactions t ON (t.id = h.id)
WHERE t. category = o. category