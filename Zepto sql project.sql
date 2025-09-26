
drop table if exists zepto;

Create table zepto(
sku_id SERIAL PRIMARY KEY,
Category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercentage NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

--data exploration

--count of rows
SELECT COUNT(*) FROM zepto;

--sample data

Select * from zepto
Limit 10;

--null values
Select * from zepto
Where name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountpercentage IS NULL
OR
availablequantity IS NULL
OR
discountedsellingprice IS NULL
OR
weightingms IS NULL
OR 
outofstock IS NULL
OR
quantity IS NULL;

--different product categories
SELECT DISTINCT category
From zepto
ORDER BY category;

--products in stock vs out of stock
SELECT outofstock, COUNT(sku_id)
From zepto
Group by outofstock;

--product names present multiple times
SELECT name, COUNT(sku_id) as "Number of SKUs"
FROM zepto
GROUP BY name
HAVING count(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;

--data cleaning

--products with price = 0
SELECT * FROM zepto
WHERE mrp = 0 OR discountedsellingprice = 0;

DELETE FROM zepto
WHERE mrp = 0

--convert paisa to rupees
UPDATE zepto
SET mrp = mrp / 100.0, 
discountedsellingprice = discountedsellingprice / 100.0;

SELECT mrp, discountedsellingprice FROM zepto

-- Q1. Find the top 10 best value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercentage
FROM zepto
ORDER BY discountPercentage DESC
LIMIT 10;

--Q2. What are the Products with High MRP but Out of Stock.
SELECT DISTINCT name, mrp
FROM zepto
WHERE outOfStock = TRUE AND mrp > 300
ORDER BY mrp DESC;

--Q3. Calculate Estimated Revenue for each category.
SELECT category,
SUM(discountedSellingPrice + availablequantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

--Q4. Find all products where MRP is greater than Rs.800 and discount is less thank 10%.
SELECT DISTINCT name, mrp, discountpercentage
FROM zepto
WHERE mrp > 800 AND discountpercentage < 10
ORDER BY mrp DESC;

--Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountpercentage), 2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

--Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightingms, discountedsellingprice,
ROUND(discountedsellingprice/weightingms, 2) AS price_per_gram
FROM zepto
WHERE weightingms >= 100
ORDER BY price_per_gram

--Q7. Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightingms,
CASE WHEN weightingms < 1000 THEN 'Low'
     WHEN weightingms < 5000 THEN 'Medium'
	 ELSE 'Bulk'
	 END AS weight_category
FROM zepto;

--Q8. What is the Total Inventory Weight Per Category
SELECT category,
SUM(weightingms * availablequantity) AS total_weight
From zepto
GROUP BY category
ORDER BY total_weight;

