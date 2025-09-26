# Zepto-Inventory-data-analysis

## Project Description
This project analyzes product-level data from Zepto, a quick-commerce platform. The dataset includes product details such as categories, pricing, discounts, availability, and weights. Using SQL, the project performs data exploration, cleaning, and business analysis to extract insights about pricing strategies, stock management, and revenue optimization.

## Project Overview

 - Domain: Quick Commerce / Retail Analytics

 - Tools: PostgreSQL (SQL queries for exploration, cleaning, insights)

### Goal

 - Clean the dataset to remove errors/inconsistencies.

 - Explore discount patterns and stock levels.

 - Generate insights for pricing, inventory, and category-level revenue.

 - Provide recommendations for business growth.

## Dataset Overview
The dataset was sourced from [Kaggle](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv) and was originally scraped from Zepto’s official product listings. It mimics what you’d typically encounter in a real-world e-commerce inventory system.

Each row represents a unique SKU (Stock Keeping Unit) for a product. Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility – exactly how real catalog data looks.

  - sku_id: Unique product identifier.

  - category: Product category (e.g., grocery, dairy, beverages).

  - name: Product name.

  - mrp: Maximum Retail Price (MRP).

  - discountPercentage: Discount percentage offered.

  - availableQuantity: Number of units available.

  - discountedSellingPrice: Price after discount.

  - weightInGms: Product weight in grams.

  - outOfStock: Boolean flag (True = out of stock).

  - quantity: Sales or inventory-related field.

## Project Workflow

### 1. Database & Table Creation

 - Created table zepto with columns for product, price, stock, and discounts.

 - Defined sku_id as a primary key.

### 2. Data Import

 - Imported raw CSV dataset into the zepto table.

### 3. Data Exploration

 - Checked row count, null values, duplicate products.

 - Identified categories, stock availability, and discount distribution.

 - Example queries:

  - Products in stock vs. out of stock.

  - Categories with maximum SKUs.

  - Products repeated multiple times.

### 4. Data Cleaning

 - Removed rows with price = 0.

 - Converted paisa → rupees for MRP and selling price.

 - Deduplicated product names where applicable.

### 5. Business Insights

 - Top 10 products by discount percentage.

 - High MRP products frequently out of stock → lost sales.

 - Categories ranked by estimated revenue.

 - Premium products (MRP > ₹800, discount <10%) targeting niche customers.

 - Top 5 categories offering highest average discount.

 - Price-per-gram analysis to identify best value items.

 - Segmentation into Low, Medium, Bulk based on weight.

 - Inventory weight per category for supply chain efficiency.

## Key Insights

### 1. Discount Strategy

 - Top 10 products offer the highest discounts, helping identify value-for-money deals.

 - Certain categories consistently provide higher average discounts, making them attractive for price-sensitive customers.

### 2. Stock Management

 - High MRP products (above ₹300) are frequently out of stock, potentially leading to missed revenue opportunities.

### 3. Revenue Contribution

 - Categories differ significantly in terms of total estimated revenue, influenced by both price and available stock.

### 4. Premium Product Analysis

 - Products with MRP above ₹800 but discounts below 10% target premium customers who are less discount-sensitive.

### 5. Weight & Value Analysis

 - Price per gram calculations show the most cost-effective items for customers.

 - Products can be segmented into Low (<1kg), Medium (<5kg), and Bulk (≥5kg) categories for operational efficiency.

### 6. Inventory Weight

 - Some categories carry a disproportionately higher total inventory weight, impacting logistics and warehousing.

## Conclusion

The SQL analysis highlights how discount strategies, stock availability, and category-level performance affect overall revenue. While aggressive discounts attract customers, frequent stock-outs of high-value products negatively impact revenue potential. Additionally, understanding price per gram and inventory weight distribution helps in making better procurement and logistics decisions.

