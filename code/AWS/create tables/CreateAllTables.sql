CREATE EXTERNAL TABLE offers (offer bigint, category bigint, quantity bigint, company bigint, offervalue double, brand bigint)
row format delimited fields terminated by ','
lines terminated by '\n'
STORED as TEXTFILE
LOCATION 's3://de.whs.fdt.kaggle.acquire-valued-shoppers-challenge/input_data_orig/offers/';

CREATE EXTERNAL TABLE test_history (id bigint, chain bigint, offer bigint, market bigint, offerdate date)
row format delimited fields terminated by ','
lines terminated by '\n'
STORED as TEXTFILE
LOCATION 's3://de.whs.fdt.kaggle.acquire-valued-shoppers-challenge/input_data_orig/testHistory/';

CREATE EXTERNAL TABLE train_history (id bigint, chain bigint, offer bigint, market bigint, repeattrips bigint, repeater char(1), offerdate date)
row format delimited fields terminated by ','
lines terminated by '\n'
STORED as TEXTFILE
LOCATION 's3://de.whs.fdt.kaggle.acquire-valued-shoppers-challenge/input_data_orig/trainHistory/';

CREATE EXTERNAL TABLE transactions (id bigint, chain bigint, debt bigint, category bigint, company bigint, brand bigint, ddate date, productsize decimal, productmeasure char(2), purchasequantity bigint, purchaseamount decimal)
row format delimited fields terminated by ','
lines terminated by '\n'
STORED as TEXTFILE
LOCATION 's3://de.whs.fdt.kaggle.acquire-valued-shoppers-challenge/input_data_orig/transactions/';