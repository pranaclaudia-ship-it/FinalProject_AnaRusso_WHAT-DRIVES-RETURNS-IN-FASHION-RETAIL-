USE retail_fashion;
DROP TABLE IF EXISTS purchases;

-- Use the final retail_fashion df
USE retail_fashion;

-- Primary keys
ALTER TABLE brands ADD PRIMARY KEY (brand_id);
ALTER TABLE categories ADD PRIMARY KEY (category_id);
ALTER TABLE collections ADD PRIMARY KEY (collection_id);

-- product_id arrives as TEXT, and a primary key needs a fixed length
ALTER TABLE purchases MODIFY product_id VARCHAR(20) NOT NULL;
ALTER TABLE purchases ADD PRIMARY KEY (product_id);

-- Foreign keys
ALTER TABLE purchases ADD FOREIGN KEY (brand_id) REFERENCES brands(brand_id);
ALTER TABLE purchases ADD FOREIGN KEY (category_id) REFERENCES categories(category_id);
ALTER TABLE purchases ADD FOREIGN KEY (collection_id) REFERENCES collections(collection_id);

-- ============================================
-- Retail Fashion Project: business questions
-- ============================================

-- 1. Per brand
SELECT b.brand,
       COUNT(*) AS total_purchases,
       SUM(p.is_returned) AS returns,
       ROUND(AVG(p.is_returned), 3) AS return_rate
FROM purchases p
JOIN brands b ON p.brand_id = b.brand_id
GROUP BY b.brand
ORDER BY return_rate DESC;

-- 2. Per category
SELECT c.category,
       COUNT(*) AS total_purchases,
       SUM(p.is_returned) AS returns,
       ROUND(AVG(p.is_returned), 3) AS return_rate
FROM purchases p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category
ORDER BY return_rate DESC;

-- 3. Per collection
SELECT col.collection,
       COUNT(*) AS total_purchases,
       SUM(p.is_returned) AS returns,
       ROUND(AVG(p.is_returned), 3) AS return_rate
FROM purchases p
JOIN collections col ON p.collection_id = col.collection_id
GROUP BY col.collection
ORDER BY return_rate DESC;

-- 4. Return reasons by category
SELECT c.category,
       p.return_reason,
       COUNT(*) AS total_returns,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY c.category), 1) AS pct_within_category
FROM purchases p
JOIN categories c ON p.category_id = c.category_id
WHERE p.is_returned = 1
GROUP BY c.category, p.return_reason
ORDER BY c.category, total_returns DESC;

-- 5. Return reasons by collection
SELECT col.collection,
       p.return_reason,
       COUNT(*) AS total_returns,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY col.collection), 1) AS pct_within_collection
FROM purchases p
JOIN collections col ON p.collection_id = col.collection_id
WHERE p.is_returned = 1
GROUP BY col.collection, p.return_reason
ORDER BY col.collection, total_returns DESC;

-- 6. Brands vs. overall return rate
SELECT b.brand,
       ROUND(AVG(p.is_returned), 3) AS return_rate,
       ROUND(AVG(p.is_returned) - (SELECT AVG(is_returned) FROM purchases), 3) AS diff_vs_overall
FROM purchases p
JOIN brands b ON p.brand_id = b.brand_id
GROUP BY b.brand
ORDER BY diff_vs_overall DESC;

-- 7. Purchases, returns and return rate per price range
SELECT price_range,
       COUNT(*) AS total_purchases,
       SUM(is_returned) AS returns,
       ROUND(AVG(is_returned), 3) AS return_rate
FROM purchases
GROUP BY price_range
ORDER BY return_rate DESC;

-- 8. Purchases, returns and return rate per discount range
SELECT discount_range,
       COUNT(*) AS total_purchases,
       SUM(is_returned) AS returns,
       ROUND(AVG(is_returned), 3) AS return_rate
FROM purchases
GROUP BY discount_range
ORDER BY return_rate DESC;

-- 9. With discount vs. no discount
SELECT markdown_percentage > 0 AS has_discount,
       COUNT(*) AS total_purchases,
       SUM(is_returned) AS returns,
       ROUND(AVG(is_returned), 3) AS return_rate
FROM purchases
GROUP BY has_discount;

-- 10. Purchases, returns and return rate per size (products with size only)
SELECT size,
       COUNT(*) AS total_purchases,
       SUM(is_returned) AS returns,
       ROUND(AVG(is_returned), 3) AS return_rate
FROM purchases
WHERE size NOT IN ('Not applicable', 'No Info')
GROUP BY size
ORDER BY return_rate DESC;

-- 11. Purchases, returns and return rate per rating (ratings given only)
SELECT rating_stars,
       COUNT(*) AS total_purchases,
       SUM(is_returned) AS returns,
       ROUND(AVG(is_returned), 3) AS return_rate
FROM purchases
WHERE rating_stars <> 'No Info'
GROUP BY rating_stars
ORDER BY rating_stars;

-- 12. Return reasons: number and share of returns
SELECT return_reason,
       COUNT(*) AS total_returns,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS pct_of_returns
FROM purchases
WHERE is_returned = 1
GROUP BY return_reason
ORDER BY total_returns DESC;