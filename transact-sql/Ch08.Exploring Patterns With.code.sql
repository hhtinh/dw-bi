-- Exploring Patterns With Autocorrelation 
--
-- Chapter 8 - Statistics in SQL 
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT 
   p.i lag, STUFF( STUFF(SPACE(40),
      CAST(ROUND((COUNT(*)*SUM(x.Sales*y.Sales)-
         SUM(x.Sales)*SUM(y.Sales))/
         (SQRT(COUNT(*)*SUM(SQUARE(x.Sales))-SQUARE(SUM(x.Sales)))*
          SQRT(COUNT(*)*SUM(SQUARE(y.Sales))-SQUARE(SUM(y.Sales))))*
          20,0)+20 AS INT),1,'*'),20,1,'|') autocorrelation
FROM BulbSales x, BulbSales y, Pivot p
WHERE x.Id=y.Id-p.i AND p.i BETWEEN 1 AND 15
GROUP BY p.i
ORDER BY p.i


SELECT 
   p.i lag, 
   (COUNT(*)*SUM(x.Sales*y.Sales)-SUM(x.Sales)*SUM(y.Sales))/
      (SQRT(COUNT(*)*SUM(SQUARE(x.Sales))-SQUARE(SUM(x.Sales)))*
       SQRT(COUNT(*)*SUM(SQUARE(y.Sales))-SQUARE(SUM(y.Sales)))) 
       autocorrelation
FROM BulbSales x, BulbSales y, Pivot p
WHERE x.Id=y.Id-p.i AND p.i BETWEEN 1 AND 15
GROUP BY p.i
ORDER BY p.i
