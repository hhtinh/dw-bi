-- Building Confidence Intervals
--
-- Chapter 8 - Statistics in SQL 
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT 
   AVG(Hours)-STDEV(Hours)/SQRT(COUNT(*))*MAX(p) in1,
   AVG(Hours)+STDEV(Hours)/SQRT(COUNT(*))*MAX(p) in2
FROM BulbLife, T_distribution
WHERE df=(
   SELECT 
      CASE WHEN count(*)<=29 
      THEN count(*)-1 
      ELSE -1 END FROM BulbLife) 
