-- Extending Moving Averages
--
-- Chapter 8 - Statistics in SQL 
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT x.Id, 
   SUM(CASE WHEN y.Id=x.Id 
            THEN 0.9*y.Sales 
            ELSE 0.1*x.Sales END) exponential_average
FROM BulbSales x, BulbSales y
WHERE x.Id>=2 AND x.Id BETWEEN y.Id AND y.Id+1 
GROUP BY x.Id
ORDER BY x.Id


SELECT x.Id, 
   SUM(CASE WHEN x.Id-y.Id=0 THEN 0.28*y.Sales
            WHEN x.Id-y.Id=1 THEN 0.23*y.Sales
            WHEN x.Id-y.Id=2 THEN 0.20*y.Sales
            WHEN x.Id-y.Id=3 THEN 0.14*y.Sales
            WHEN x.Id-y.Id=4 THEN 0.10*y.Sales
            WHEN x.Id-y.Id=5 THEN 0.05*y.Sales
        END)weighted_average
FROM BulbSales x, BulbSales y
WHERE x.Id>=6 AND x.Id BETWEEN y.Id AND y.Id+6 
GROUP BY x.Id
ORDER BY x.Id
