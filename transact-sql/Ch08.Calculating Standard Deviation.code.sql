-- Calculating Standard Deviation, Variance and Standard Error
--
-- Chapter 8 - Statistics in SQL 
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

SELECT TestPit, VAR(Hours) variance, STDEV(Hours) st_deviation
FROM BulbLife
GROUP BY TestPit


SELECT AVG(Hours) mean, STDEV(Hours)/SQRT(COUNT(*)) st_error 
FROM BulbLife
