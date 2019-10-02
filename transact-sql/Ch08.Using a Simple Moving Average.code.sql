-- Using a Simple Moving Average
--
-- Chapter 8 - Statistics in SQL 
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT x.Id, AVG(y.Sales) moving_average
FROM BulbSales x, BulbSales y
WHERE x.Id>=6 AND x.Id BETWEEN y.Id AND y.Id+5 
GROUP BY x.Id
ORDER BY x.Id


SELECT x.Id xid, y.Id yid, y.Sales
FROM BulbSales x, BulbSales y
WHERE x.Id>=6 AND x.Id BETWEEN y.Id AND y.Id+5 
ORDER BY x.Id
