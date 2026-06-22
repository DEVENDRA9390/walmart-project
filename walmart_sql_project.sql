SELECT * FROM walmart_sales.walmart;

SELECT COUNT(*) AS Total_Records
FROM walmart;

#Number of Stores
SELECT COUNT(DISTINCT Store) AS Total_Stores
FROM walmart;

#Date Range
SELECT
MIN(Date) AS Start_Date,
MAX(Date) AS End_Date
FROM walmart;

#Total Sales
SELECT
SUM(Weekly_Sales) AS Total_Sales
FROM walmart;

#Average Weekly Sales
SELECT
AVG(Weekly_Sales) AS Avg_Weekly_Sales
FROM walmart;

#Top 10 Stores by Sales
SELECT
Store,
SUM(Weekly_Sales) AS Total_Sales
FROM walmart
GROUP BY Store
ORDER BY Total_Sales DESC
LIMIT 10;

#Bottom 10 Stores by Sales
SELECT
Store,
SUM(Weekly_Sales) AS Total_Sales
FROM walmart
GROUP BY Store
ORDER BY Total_Sales ASC
LIMIT 10;

#Holiday vs Non-Holiday Sales
SELECT
Holiday_Flag,
SUM(Weekly_Sales) AS Total_Sales,
AVG(Weekly_Sales) AS Avg_Sales
FROM walmart
GROUP BY Holiday_Flag;

#Monthly Sales Trend
SELECT
MONTH(Date) AS Month_No,
SUM(Weekly_Sales) AS Total_Sales
FROM walmart
GROUP BY MONTH(Date)
ORDER BY Month_No;

#Yearly Sales Trend
SELECT
YEAR(Date) AS Year,
SUM(Weekly_Sales) AS Total_Sales
FROM walmart
GROUP BY YEAR(Date)
ORDER BY Year;

#Best Sales Month
SELECT
MONTH(Date) AS Month_No,
SUM(Weekly_Sales) AS Total_Sales
FROM walmart
GROUP BY MONTH(Date)
ORDER BY Total_Sales DESC
LIMIT 1;

#Store with Highest Weekly Sale
SELECT
Store,
MAX(Weekly_Sales) AS Highest_Sale
FROM walmart
GROUP BY Store
ORDER BY Highest_Sale DESC
LIMIT 1;

#Average Sales by Store
SELECT
Store,
AVG(Weekly_Sales) AS Avg_Sales
FROM walmart
GROUP BY Store
ORDER BY Avg_Sales DESC;

#Effect of Temperature on Sales
SELECT
ROUND(AVG(Temperature),2) AS Avg_Temp,
ROUND(AVG(Weekly_Sales),2) AS Avg_Sales
FROM walmart;

#Fuel Price Impact
SELECT
ROUND(Fuel_Price,1) AS Fuel,
AVG(Weekly_Sales) AS Avg_Sales
FROM walmart
GROUP BY ROUND(Fuel_Price,1)
ORDER BY Fuel;

#Unemployment Impact
SELECT
Unemployment,
round(avg(Weekly_Sales),2) AS Avg_Sales
FROM walmart
GROUP BY Unemployment
ORDER BY Unemployment;

#Top 5 Sales Weeks
SELECT
Date,
Store,
Weekly_Sales
FROM walmart
ORDER BY Weekly_Sales DESC
LIMIT 5;

#Rank Stores by Total Sales
SELECT
Store,
SUM(Weekly_Sales) AS Total_Sales,
RANK() OVER (
ORDER BY SUM(Weekly_Sales) DESC
) AS Store_Rank
FROM walmart
GROUP BY Store;

#Running Total Sales
SELECT
Date,
SUM(Weekly_Sales) AS Daily_Sales,
SUM(SUM(Weekly_Sales))
OVER(ORDER BY Date) AS Running_Total
FROM walmart
GROUP BY Date;

#Sales Growth Rate
SELECT
Date,
SUM(Weekly_Sales) AS Sales,
LAG(SUM(Weekly_Sales))
OVER(ORDER BY Date) AS Previous_Sales
FROM walmart
GROUP BY Date;

