-- Calculating Correlation 
--
-- Chapter 8 - Statistics in SQL 
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0


SELECT 
   (COUNT(*)*SUM(x.Sales*y.Sales)-SUM(x.Sales)*SUM(y.Sales))/(
   SQRT(COUNT(*)*SUM(SQUARE(x.Sales))-SQUARE(SUM(x.Sales)))*
   SQRT(COUNT(*)*SUM(SQUARE(y.Sales))-SQUARE(SUM(y.Sales)))) 
   correlation
FROM BulbSales x JOIN BulbSales y ON x.month=y.month
WHERE x.Year=1997 AND y.Year=1998 
