﻿CREATE TABLE customers AS 
(
SELECT te.id, te.offer, te.offerdate
  FROM test_history te
UNION
SELECT tr.id, tr.offer, tr.offerdate
  FROM train_history tr 
)