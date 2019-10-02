-- Folding Tables
--
-- Chapter 7 - Importing and Transforming Data
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT Name, '2000' Year, Y2000 Rank FROM StudentRankings
UNION
SELECT Name, '2001', Y2001 FROM StudentRankings
UNION
SELECT Name, '2002', Y2002 FROM StudentRankings


SELECT t1.Name Name,
   (CASE WHEN t2.Id=1 THEN '2000' 
      WHEN t2.Id=2 THEN '2001' 
      WHEN t2.Id=3 THEN '2002' END) Year,
   (CASE WHEN t2.Id=1 THEN t1.Y2000 
      WHEN t2.Id=2 THEN t1.Y2001 
      WHEN t2.Id=3 THEN t1.Y2002 END) Volume
FROM StudentRankings t1, StudentRankings t2
WHERE t2.Id BETWEEN 1 AND 3 
ORDER BY Name, Year


SELECT Name Name,
   (CASE WHEN i=1 THEN '2000' 
      WHEN i=2 THEN '2001' 
      WHEN i=3 THEN '2002' END) Year,
   (CASE WHEN i=1 THEN Y2000 
      WHEN i=2 THEN Y2001 
      WHEN i=3 THEN Y2002 END) Volume
FROM StudentRankings, Pivot
WHERE i BETWEEN 1 AND 3 
ORDER BY Name, Year
