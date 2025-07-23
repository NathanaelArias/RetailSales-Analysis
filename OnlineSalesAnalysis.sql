
-- Project: Online Sales Analysis
-- Author: Nathan Arias
-- Date: July 2025
-- Description: Cleaning and Data Analysis with Online Retail.csv from Kaggle


-- I created a database and named it RetailSalesAnalysis
--Secondly I imported the csv. file downloaded from kaggle and proceeded to start.


USE RetailSalesAnalytics

--DATA CLEANING PROCESS

-- Delete rows with invalid quantity or unit price
DELETE FROM [dbo].[Online Retail]
WHERE Quantity <= 0 OR UnitPrice <= 0;

--Change to upper to avoid duplicates.
UPDATE OnlineRetail
SET Description = UPPER(Description);


--Deleting spaces that could affect the interpratation of the rows.
UPDATE OnlineRetail
SET Description = LTRIM(RTRIM(Description));


--Created a new column with Total Sales
ALTER TABLE [dbo].[Online Retail]
ADD TotalAmount DECIMAL(10,2);

UPDATE OnlineRetail
SET TotalAmount = Quantity * UnitPrice;


--Verify possible outliers.
SELECT *
FROM [dbo].[Online Retail]
WHERE UnitPrice > 10000 OR Quantity > 1000;



-- Project: Online Sales Analysis
-- Author: Nathan Arias
-- Date: July 2025
-- Description: Data Analysis with Online Retail.csv from Kaggle

-- EDA Exploratory Data Analysis

--Most popular(sold) products.
SELECT Description, SUM(Quantity) AS TotalUnitsSold
FROM [dbo].[Online Retail]
GROUP BY Description
ORDER BY TotalUnitsSold DESC;


--Products with more Revenue
SELECT Description, SUM(Quantity * UnitPrice) AS Revenue
FROM [dbo].[Online Retail]
GROUP BY Description
ORDER BY Revenue DESC;


--Which countries have purchased more products? 
--Show the top 3 countries.
SELECT Country, SUM(Quantity * UnitPrice) AS CountryRevenue
FROM[dbo].[Online Retail] 
GROUP BY Country
ORDER BY CountryRevenue DESC;


SELECT TOP 3 Country, SUM(Quantity * UnitPrice) AS CountryRevenue
FROM [dbo].[Online Retail]
GROUP BY Country
ORDER BY CountryRevenue DESC



--Top Customers
SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalSpent
FROM [dbo].[Online Retail]
GROUP BY CustomerID
ORDER BY TotalSpent DESC;



--What are the best months of the year?
SELECT DATENAME(MONTH, InvoiceDate) AS Month, 
       SUM(Quantity * UnitPrice) AS MonthlyRevenue
FROM [dbo].[Online Retail]
GROUP BY DATENAME(MONTH, InvoiceDate)
ORDER BY MonthlyRevenue DESC;


SELECT 
    FORMAT(InvoiceDate, 'yyyy-MM') AS Month,
    SUM(TotalAmount) AS MonthlyRevenue
FROM [dbo].[Online Retail]
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM')
ORDER BY Month;



--What is the best day of the week?
SELECT DATENAME(WEEKDAY, InvoiceDate) AS DayName,
       COUNT(*) AS Transactions
FROM [dbo].[Online Retail]
GROUP BY DATENAME(WEEKDAY, InvoiceDate)
ORDER BY Transactions DESC;