SELECT *
FROM customers
WHERE gender = 'Female';

SELECT *
FROM customers
ORDER BY full_name ASC;

-- Query 3: Revenue by product category
SELECT
    p.category,
    ROUND(SUM(oi.line_total), 2) AS revenue
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- Query 4: Average price by product category
SELECT
    category,
    ROUND(AVG(unit_price), 2) AS average_price
FROM products
GROUP BY category
ORDER BY average_price DESC;

-- Query 5: Order items with product details
SELECT
    oi.order_id,
    oi.product_id,
    p.product_name,
    p.category,
    oi.quantity,
    oi.line_total
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
LIMIT 20;


-- Query 6: Count orders for each customer
SELECT
    c.customer_id,
    c.full_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_orders DESC;

-- Query 7: RIGHT JOIN products with order items
SELECT
    oi.order_id,
    oi.product_id,
    p.category,
    oi.quantity,
    oi.line_total
FROM products p
RIGHT JOIN order_items oi
    ON p.product_id = oi.product_id;
	
	
-- Query 7: RIGHT JOIN products with order items
SELECT
    oi.order_id,
    oi.product_id,
    p.category,
    oi.quantity,
    oi.line_total
FROM products p
RIGHT JOIN order_items oi
    ON p.product_id = oi.product_id;

	

-- Query 8: Products priced above average
SELECT
    product_id,
    product_name,
    unit_price
FROM products
WHERE unit_price > (
    SELECT AVG(unit_price)
    FROM products
)
ORDER BY unit_price DESC;	




-- Query 9: Create a view for category revenue
CREATE VIEW IF NOT EXISTS category_revenue AS
SELECT
    p.category,
    ROUND(SUM(oi.line_total), 2) AS revenue
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category;



-- Query 10: Display the category revenue view
SELECT *
FROM category_revenue
ORDER BY revenue DESC;



-- Query 11: Create an index on order date
CREATE INDEX IF NOT EXISTS idx_orders_order_date
ON orders(order_date);

-- Query 12: Check query execution plan
EXPLAIN QUERY PLAN
SELECT *
FROM orders
WHERE order_date >= '2025-01-01';


-- Query 13: Find customers with missing email addresses
SELECT *
FROM customers
WHERE email IS NULL;