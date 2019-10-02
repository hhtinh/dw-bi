-- Printing Matrices and Arrays
--
-- Chapter 3 - Data Structures
-- Type of content: code
-- Date: 2002-1-17
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT  X, 
   MAX(CASE Y WHEN 1 THEN Value END) y1,
   MAX(CASE Y WHEN 2 THEN Value END) y2,
   MAX(CASE Y WHEN 3 THEN Value END) y3
FROM Matrices
WHERE Matrix='D'
GROUP BY X
ORDER BY X

SELECT  ContainerId, 
   MAX(CASE Line WHEN 0 THEN Purity END) Line0,
   MAX(CASE Line WHEN 1 THEN Purity END) Line1,
   MAX(CASE Line WHEN 2 THEN Purity END) Line2,
   MAX(CASE Line WHEN 3 THEN Purity END) Line3
FROM ProductionFacility
GROUP BY ContainerId
ORDER BY ContainerId

