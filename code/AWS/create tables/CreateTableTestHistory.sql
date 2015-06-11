CREATE EXTERNAL TABLE test_history (id bigint, chain bigint, offer bigint, market bigint, offerdate date)
row format delimited fields terminated by ','
lines terminated by '\n'
STORED as TEXTFILE
LOCATION 's3://de.whs.fdt.kaggle.acquire-valued-shoppers-challenge/input_data_orig/testHistory/';