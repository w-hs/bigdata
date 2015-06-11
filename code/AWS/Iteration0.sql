INSERT OVERWRITE DIRECTORY 's3://de.whs.fdt.kaggle.acquire-valued-shoppers-challenge/output_data/iteration0/'
SELECT DISTINCT (h.id), 0.0 AS repeatProbability
FROM testhistory h;