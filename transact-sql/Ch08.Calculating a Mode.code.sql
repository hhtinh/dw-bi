-- Calculating a Mode
--
-- Chapter 8 - Statistics in SQL 
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT TOP 1 COUNT(*) frequency, Hours mode 
FROM BulbLife
WHERE TestPit=1
GROUP BY hours
ORDER BY COUNT(*) DESC


SELECT Hours
FROM BulbLife
WHERE TestPit=1
GROUP BY hours


SELECT COUNT(*) frequency, Hours
FROM BulbLife
WHERE TestPit=1
GROUP BY Hours


SELECT COUNT(*) frequency, Hours mode FROM BulbLife
GROUP BY Hours
HAVING COUNT(*)>= ALL(
   SELECT COUNT(*)
   FROM BulbLife
   GROUP BY Hours)



