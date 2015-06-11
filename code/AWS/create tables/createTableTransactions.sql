CREATE EXTERNAL TABLE transactions (id bigint, chain bigint, debt bigint, category bigint, company bigint, brand bigint, ddate date, productsize decimal, productmeasure char(2), purchasequantity bigint, purchaseamount decimal)
row format delimited fields terminated by ','
lines terminated by '\n'
STORED as TEXTFILE
LOCATION 's3://de.whs.fdt.kaggle.acquire-valued-shoppers-challenge/input_data_orig/transactions/';