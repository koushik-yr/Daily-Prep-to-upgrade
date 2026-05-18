-- Databricks notebook source
-- MAGIC %md
-- MAGIC **Fact Table**

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS sales_fact (
    sale_id BIGINT GENERATED ALWAYS AS IDENTITY,
    date DATE,
    campaign_id INT,
    product_id INT,
    spends DOUBLE,
    sales DOUBLE,
    orders INT,
    clicks INT
  ) USING DELTA;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Contains numeric transaction data:**

-- COMMAND ----------

INSERT INTO sales_fact (date, campaign_id, product_id, spends, sales, orders, clicks)
  VALUES
    -- January 2026
    ('2026-01-01', 1, 3, 1500.00, 10200.00, 55, 1800),
    ('2026-01-02', 1, 2, 870.00, 4800.50, 34, 1050),
    ('2026-01-03', 2, 4, 620.00, 3100.00, 21, 750),
    ('2026-01-04', 2, 1, 490.00, 2600.00, 18, 580),
    ('2026-01-05', 3, 3, 2200.00, 16500.00, 88, 2900),
    ('2026-01-06', 3, 2, 730.00, 3900.75, 28, 920),
    ('2026-01-07', 4, 4, 540.00, 2800.00, 19, 670),
    ('2026-01-08', 4, 1, 1100.00, 6200.00, 43, 1400),
    ('2026-01-09', 5, 3, 980.00, 7100.00, 39, 1300),
    ('2026-01-10', 5, 2, 410.00, 2200.50, 16, 510),
    ('2026-01-11', 6, 4, 670.00, 3500.00, 24, 820),
    ('2026-01-12', 6, 1, 320.00, 1700.00, 12, 390),
    ('2026-01-13', 3, 3, 1850.00, 13800.00, 72, 2400),
    ('2026-01-14', 2, 2, 560.00, 3000.00, 22, 690),
    ('2026-01-15', 1, 4, 480.00, 2500.00, 17, 590),
    ('2026-01-16', 4, 3, 1700.00, 12600.00, 64, 2200),
    ('2026-01-17', 2, 1, 530.00, 2850.00, 20, 650),
    ('2026-01-18', 3, 2, 810.00, 4400.00, 31, 990),
    ('2026-01-19', 6, 3, 1950.00, 14500.00, 76, 2500),
    ('2026-01-20', 5, 4, 370.00, 1950.00, 13, 460),
    ('2026-01-21', 1, 1, 690.00, 3800.00, 27, 860),
    ('2026-01-22', 4, 2, 920.00, 5100.00, 37, 1160),
    ('2026-01-23', 3, 3, 2100.00, 15700.00, 82, 2700),
    ('2026-01-24', 2, 4, 450.00, 2350.00, 16, 560),
    ('2026-01-25', 6, 1, 380.00, 2050.00, 14, 470),
    ('2026-01-26', 5, 2, 300.00, 1600.00, 11, 370),
    ('2026-01-27', 4, 3, 1600.00, 11900.00, 61, 2100),
    ('2026-01-28', 1, 4, 510.00, 2700.00, 19, 630),
    ('2026-01-29', 3, 1, 760.00, 4200.00, 30, 950),
    ('2026-01-30', 2, 2, 640.00, 3450.00, 24, 790),
    ('2026-01-31', 6, 3, 1780.00, 13200.00, 68, 2300),
    -- February 2026
    ('2026-02-01', 7, 1, 1300.00, 7800.00, 48, 1600),
    ('2026-02-02', 7, 2, 1050.00, 5900.75, 40, 1350),
    ('2026-02-03', 3, 3, 2400.00, 18200.00, 95, 3100),
    ('2026-02-04', 3, 4, 580.00, 3000.00, 20, 710),
    ('2026-02-05', 4, 1, 890.00, 5100.00, 36, 1150),
    ('2026-02-06', 7, 3, 1950.00, 14700.00, 78, 2550),
    ('2026-02-07', 6, 2, 640.00, 3400.00, 25, 800),
    ('2026-02-08', 7, 1, 1800.00, 13500.00, 70, 2350),
    ('2026-02-09', 5, 4, 370.00, 1900.00, 13, 450),
    ('2026-02-10', 3, 2, 820.00, 4500.50, 32, 1020),
    ('2026-02-11', 4, 3, 1600.00, 11800.00, 61, 2100),
    ('2026-02-12', 6, 1, 430.00, 2300.00, 16, 530),
    ('2026-02-13', 5, 2, 300.00, 1600.00, 11, 370),
    ('2026-02-14', 7, 3, 2100.00, 15500.00, 82, 2750),
    ('2026-02-15', 7, 4, 760.00, 4100.00, 29, 950),
    ('2026-02-16', 3, 1, 910.00, 5200.00, 37, 1170),
    ('2026-02-17', 4, 2, 780.00, 4300.00, 31, 980),
    ('2026-02-18', 6, 3, 1700.00, 12700.00, 65, 2200),
    ('2026-02-19', 5, 4, 340.00, 1800.00, 12, 420),
    ('2026-02-20', 3, 1, 850.00, 4800.00, 34, 1070),
    ('2026-02-21', 7, 2, 970.00, 5400.00, 39, 1220),
    ('2026-02-22', 4, 3, 1550.00, 11500.00, 59, 2050),
    ('2026-02-23', 6, 4, 500.00, 2650.00, 18, 620),
    ('2026-02-24', 5, 1, 390.00, 2100.00, 14, 480),
    ('2026-02-25', 3, 2, 760.00, 4150.50, 30, 950),
    ('2026-02-26', 1, 3, 1450.00, 10800.00, 56, 1880),
    ('2026-02-27', 4, 4, 560.00, 2950.00, 20, 690),
    ('2026-02-28', 6, 1, 470.00, 2550.00, 17, 580),
    -- March 2026
    ('2026-03-01', 8, 2, 950.00, 5300.00, 38, 1200),
    ('2026-03-02', 8, 1, 780.00, 4400.00, 31, 980),
    ('2026-03-03', 3, 3, 2300.00, 17100.00, 90, 2980),
    ('2026-03-04', 6, 4, 510.00, 2700.00, 19, 630),
    ('2026-03-05', 4, 2, 870.00, 4900.75, 35, 1100),
    ('2026-03-06', 8, 3, 1800.00, 13500.00, 70, 2350),
    ('2026-03-07', 5, 1, 420.00, 2200.00, 15, 510),
    ('2026-03-08', 3, 4, 650.00, 3400.00, 23, 800),
    ('2026-03-09', 6, 2, 580.00, 3100.00, 22, 720),
    ('2026-03-10', 8, 1, 910.00, 5200.00, 37, 1170),
    ('2026-03-11', 4, 3, 1550.00, 11500.00, 59, 2050),
    ('2026-03-12', 3, 2, 700.00, 3800.50, 27, 880),
    ('2026-03-13', 5, 4, 340.00, 1800.00, 12, 420),
    ('2026-03-14', 8, 3, 2000.00, 15000.00, 77, 2600),
    ('2026-03-15', 6, 1, 460.00, 2500.00, 17, 570),
    ('2026-03-16', 4, 4, 590.00, 3200.00, 21, 730),
    ('2026-03-17', 3, 2, 810.00, 4500.00, 32, 1010),
    ('2026-03-18', 8, 3, 1900.00, 14200.00, 73, 2450),
    ('2026-03-19', 5, 1, 400.00, 2150.00, 14, 490),
    ('2026-03-20', 6, 2, 620.00, 3300.00, 23, 770),
    ('2026-03-21', 4, 3, 1650.00, 12300.00, 63, 2180),
    ('2026-03-22', 3, 4, 670.00, 3550.00, 24, 830),
    ('2026-03-23', 8, 1, 850.00, 4800.00, 34, 1070),
    ('2026-03-24', 5, 2, 310.00, 1650.00, 11, 380),
    ('2026-03-25', 6, 3, 1720.00, 12800.00, 66, 2250),
    ('2026-03-26', 4, 4, 610.00, 3300.00, 22, 760),
    ('2026-03-27', 3, 1, 790.00, 4400.00, 31, 990),
    ('2026-03-28', 8, 2, 880.00, 4950.00, 36, 1120),
    ('2026-03-29', 6, 3, 1800.00, 13400.00, 69, 2320),
    ('2026-03-30', 5, 4, 360.00, 1900.00, 13, 440),
    ('2026-03-31', 4, 1, 930.00, 5300.00, 38, 1190),
    -- April 2026
    ('2026-04-01', 9, 2, 1100.00, 6100.00, 42, 1380),
    ('2026-04-02', 9, 1, 840.00, 4700.00, 33, 1060),
    ('2026-04-03', 3, 3, 2500.00, 18900.00, 98, 3200),
    ('2026-04-04', 9, 4, 690.00, 3700.00, 26, 860),
    ('2026-04-05', 4, 2, 920.00, 5100.75, 37, 1160),
    ('2026-04-06', 6, 3, 1650.00, 12200.00, 63, 2180),
    ('2026-04-07', 9, 1, 1400.00, 8300.00, 52, 1750),
    ('2026-04-08', 3, 4, 600.00, 3200.00, 22, 750),
    ('2026-04-09', 8, 2, 830.00, 4600.00, 33, 1040),
    ('2026-04-10', 4, 3, 1750.00, 13100.00, 67, 2300),
    ('2026-04-11', 5, 1, 390.00, 2100.00, 14, 480),
    ('2026-04-12', 6, 4, 550.00, 2900.00, 20, 680),
    ('2026-04-13', 3, 2, 760.00, 4200.50, 30, 950),
    ('2026-04-14', 8, 3, 2150.00, 16200.00, 84, 2820),
    ('2026-04-15', 9, 4, 720.00, 3900.00, 27, 900),
    ('2026-04-16', 4, 1, 980.00, 5500.00, 40, 1250),
    ('2026-04-17', 3, 3, 2350.00, 17700.00, 92, 3050),
    ('2026-04-18', 9, 2, 1200.00, 6700.00, 46, 1500),
    ('2026-04-19', 6, 4, 580.00, 3100.00, 21, 720),
    ('2026-04-20', 8, 1, 870.00, 4900.00, 35, 1100),
    ('2026-04-21', 4, 3, 1680.00, 12500.00, 64, 2200),
    ('2026-04-22', 5, 2, 330.00, 1750.00, 12, 400),
    ('2026-04-23', 3, 4, 630.00, 3350.00, 23, 780),
    ('2026-04-24', 6, 1, 450.00, 2450.00, 16, 560),
    ('2026-04-25', 8, 3, 2050.00, 15400.00, 79, 2650),
    ('2026-04-26', 9, 2, 1150.00, 6400.00, 44, 1430),
    ('2026-04-27', 4, 4, 640.00, 3450.00, 24, 800),
    ('2026-04-28', 3, 1, 820.00, 4600.00, 33, 1030),
    ('2026-04-29', 6, 3, 1730.00, 12900.00, 66, 2260),
    ('2026-04-30', 8, 2, 900.00, 5050.00, 37, 1140);

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Dimension Tables**
-- MAGIC
-- MAGIC **Contain descriptive information:**

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS campaign_dim (
    campaign_id INT,
    campaign_name STRING,
    category STRING,
    brand STRING,
    month STRING,
    region STRING
  ) USING DELTA;

-- COMMAND ----------

INSERT INTO campaign_dim (campaign_id, campaign_name, category, brand, month, region)
  VALUES
    (1, 'New Year Blast', 'Electronics', 'TechZone', 'January', 'North'),
    (2, 'Winter Sale', 'Clothing', 'FashionHub', 'January', 'South'),
    (3, 'Flash Deal', 'Electronics', 'TechZone', 'All', 'East'),
    (4, 'Brand Campaign', 'Beauty', 'GlowMart', 'All', 'West'),
    (5, 'Clearance Sale', 'Clothing', 'FashionHub', 'All', 'South'),
    (6, 'Weekend Offer', 'Home & Kitchen', 'HomeNest', 'All', 'North'),
    (7, 'Valentine Special', 'Beauty', 'GlowMart', 'February', 'West'),
    (8, 'Spring Launch', 'Clothing', 'FashionHub', 'March', 'East'),
    (9, 'Easter Sale', 'Home & Kitchen', 'HomeNest', 'April', 'North');

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS product_dim (
    product_id INT,
    campaign_name STRING,
    category STRING,
    brand STRING,
    month STRING,
    region STRING
  ) USING DELTA;

-- COMMAND ----------

INSERT INTO product_dim (product_id, campaign_name, category, brand, month, region)
  VALUES
    (1, 'Glow Essentials', 'Beauty', 'GlowMart', 'All', 'West'),
    (2, 'Urban Threads', 'Clothing', 'FashionHub', 'All', 'South'),
    (3, 'SmartTech Pro', 'Electronics', 'TechZone', 'All', 'East'),
    (4, 'Casa Comforts', 'Home & Kitchen', 'HomeNest', 'All', 'North');

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS date_dim (
    date_id INT,
    date DATE,
    campaign_name STRING,
    category STRING,
    brand STRING,
    month STRING,
    region STRING
  ) USING DELTA;

-- COMMAND ----------

INSERT INTO date_dim (date_id, date, campaign_name, category, brand, month, region)
  VALUES
    (1, '2026-01-01', 'New Year Blast', 'Electronics', 'TechZone', 'January', 'North'),
    (2, '2026-02-01', 'Valentine Special', 'Beauty', 'GlowMart', 'February', 'West'),
    (3, '2026-03-01', 'Spring Launch', 'Clothing', 'FashionHub', 'March', 'East'),
    (4, '2026-04-01', 'Easter Sale', 'Home & Kitchen', 'HomeNest', 'April', 'North'),
    (5, '2026-01-15', 'Winter Sale', 'Clothing', 'FashionHub', 'January', 'South'),
    (6, '2026-02-14', 'Valentine Special', 'Beauty', 'GlowMart', 'February', 'West'),
    (7, '2026-03-15', 'Flash Deal', 'Electronics', 'TechZone', 'March', 'East'),
    (8, '2026-04-15', 'Easter Sale', 'Home & Kitchen', 'HomeNest', 'April', 'North'),
    (9, '2026-01-31', 'Brand Campaign', 'Beauty', 'GlowMart', 'January', 'West'),
    (10, '2026-02-28', 'Flash Deal', 'Electronics', 'TechZone', 'February', 'East'),
    (11, '2026-03-31', 'Weekend Offer', 'Home & Kitchen', 'HomeNest', 'March', 'North'),
    (12, '2026-04-30', 'Spring Launch', 'Clothing', 'FashionHub', 'April', 'South');

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Practical Query**
-- MAGIC
-- MAGIC **Join fact and campaign dimension**

-- COMMAND ----------

SELECT
  c.campaign_name,
  SUM(f.spends) AS total_spends,
  SUM(f.sales) AS total_sales
FROM
  sales_fact f
    LEFT JOIN campaign_dim c
      ON f.campaign_id = c.campaign_id
GROUP BY
  c.campaign_name;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC **Day 2 Practice**

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 1. Join sales_fact with product_dim

-- COMMAND ----------

select
  p.product_id,
  sum(f.sales) as total_sales,
  sum(f.spends) as total_spends
from
  sales_fact f
    left join product_dim p
      on f.product_id = p.product_id
group by
  p.product_id;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 2. Find total sales by category

-- COMMAND ----------

select
  c.category,
  sum(f.sales) as total_sales
from
  sales_fact f
    left join campaign_dim c
      on f.campaign_id = c.campaign_id
group by
  c.category;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 3. Find total spends by campaign_name

-- COMMAND ----------

select
  c.campaign_name,
  sum(f.spends) as total_spends
from
  sales_fact f
    left join campaign_dim c
      on f.campaign_id = c.campaign_id
group by
  c.campaign_name;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 4. Find products with  sales > 10000 using LEFT JOIN

-- COMMAND ----------

select
  p.product_id,
  sum(f.sales) as no_sales
from
  sales_fact f
    left join product_dim p
      on f.product_id = p.product_id
group by
  p.product_id
having
  sum(f.sales) > 10000;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 5. Explain INNER JOIN vs LEFT JOIN

-- COMMAND ----------

-- MAGIC %md
-- MAGIC INNER JOIN :
-- MAGIC Returns only rows that have a match in both tables.

-- COMMAND ----------

SELECT
  f.date,
  f.sales,
  c.campaign_name
FROM
  sales_fact f
    INNER JOIN campaign_dim c
      ON f.campaign_id = c.campaign_id;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Only returns rows where campaign_id exists in both sales_fact and campaign_dim. If a fact row has a campaign_id that doesn't exist in campaign_dim, it gets excluded.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC LEFT JOIN :
-- MAGIC Returns all rows from the left table, and matched rows from the right. If no match, right side returns NULL.

-- COMMAND ----------

SELECT f.date, f.sales, c.campaign_name
FROM sales_fact f
LEFT JOIN campaign_dim c ON f.campaign_id = c.campaign_id;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Returns all rows from sales_fact even if campaign_id has no match in campaign_dim. Missing campaign info shows as NULL.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC | Scenario | Join to Use |
-- MAGIC |---|---|
-- MAGIC | Sales report — only show valid campaigns | `INNER JOIN` |
-- MAGIC | Audit — find facts with missing campaign mapping | `LEFT JOIN` |
-- MAGIC | Dashboard — show all dates even if no sales | `LEFT JOIN` on `date_dim` |
-- MAGIC | Clean analytics on matched data only | `INNER JOIN` |

-- COMMAND ----------


