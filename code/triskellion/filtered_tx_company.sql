CREATE TABLE filtered_tx_company AS
SELECT t.id, t.purchasequantity, t.purchaseamount, (h.offerdate - t.date) AS daysbefore 
 FROM filtered_transactions t 
 INNER JOIN test_history h ON (t.id = h.id)
 INNER JOIN offers o ON (h.offer = o.offer)
 WHERE o.company = t.company
