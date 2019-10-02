-- Calculating a Median
--
-- Chapter 8 - Statistics in SQL 
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT x.Hours median
FROM BulbLife x, BulbLife y
GROUP BY x.Hours
HAVING 
   SUM(CASE WHEN y.Hours <= x.Hours 
      THEN 1 ELSE 0 END)>=(COUNT(*)+1)/2 AND
   SUM(CASE WHEN y.Hours >= x.Hours 
      THEN 1 ELSE 0 END)>=(COUNT(*)/2)+1


SELECT COUNT(*) occurrences, x.Hours xhours
FROM BulbLife x, BulbLife y
GROUP BY x.Hours


SELECT 
   CASE WHEN COUNT(*)%2=1 
        THEN x.Hours 
        ELSE (x.Hours+MIN(CASE WHEN y.Hours>x.Hours 
                               THEN y.Hours 
                          END))/2.0 
   END median
FROM BulbLife x, BulbLife y
GROUP BY x.Hours
HAVING 
   SUM(CASE WHEN y.Hours <= x.Hours 
      THEN 1 ELSE 0 END)>=(count(*)+1)/2 AND
   SUM(CASE WHEN y.Hours >= x.Hours 
      THEN 1 ELSE 0 END)>=(count(*)/2)+1
