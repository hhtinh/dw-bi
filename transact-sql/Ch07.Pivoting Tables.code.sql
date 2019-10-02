-- Pivoting Tables
--
-- Chapter 7 - Importing and Transforming Data
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

SELECT CompanyId, Year,
   MAX(CASE WHEN CategoryId='A' 
            THEN Dollars END) AS Assets,
   MAX(CASE WHEN CategoryId='L' 
            THEN Dollars END) AS Liabilities,
   MAX(CASE WHEN CategoryId='E' 
            THEN Dollars END) AS Equity
FROM BalanceSheets2
GROUP BY CompanyId, Year


SELECT CompanyId, Year,
   SUM(CASE WHEN CategoryId='A' 
            THEN Dollars END) AS Assets,
   SUM(CASE WHEN CategoryId='L' 
            THEN Dollars END) AS Liabilities,
   SUM(CASE WHEN CategoryId='E' 
            THEN Dollars END) AS Equity
FROM BalanceSheets2
GROUP BY CompanyId, Year
