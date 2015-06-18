CREATE TABLE filtered_tx_category AS
SELECT t.id, t.purchasequantity, t.purchaseamount, (c.offerdate - t.date) AS daysbefore 
 FROM transactions t 
 INNER JOIN customers c ON (t.id = c.id)
 INNER JOIN offers o ON (c.offer = o.offer)
 WHERE o.category = t.category

 
