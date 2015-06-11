CREATE EXTERNAL TABLE offers (offer bigint, category bigint, quantity bigint, company bigint, offervalue double, brand bigint)
row format delimited fields terminated by ','
lines terminated by '\n'
STORED as TEXTFILE
LOCATION 's3://de.whs.fdt.kaggle.acquire-valued-shoppers-challenge/input_data_orig/offers/';