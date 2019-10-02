-- Calculating a Mean
--
-- Chapter 8 - Statistics in SQL 
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT AVG(Hours) Mean 
FROM BulbLife
WHERE TestPit=1


SELECT TestPit, AVG(hours) Mean 
FROM BulbLife
GROUP BY TestPit


SELECT TestPit, AVG(hours) Mean 
FROM BulbLife
GROUP BY TestPit
HAVING COUNT(*) >= 8
