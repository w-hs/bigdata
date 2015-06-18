-- Join der globlen Features zu den bereits bestehenden Test-Features
SELECT f.*, t.*
FROM test_features f
INNER JOIN totals t ON (f.id = t.id)

-- Join der globlen Features zu den bereits bestehenden Train-Features
SELECT f.*, t.*
FROM train_features f
INNER JOIN totals t ON (f.id = t.id)