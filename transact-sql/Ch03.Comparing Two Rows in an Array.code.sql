-- Comparing Two Rows in an Array 
--
-- Chapter 3 - Data Structures
-- Type of content: code
-- Date: 2002-1-17
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT p1.Line p1_Line, 'is equal to', p2.Line p2_Line
FROM ProductionFacility p1, ProductionFacility p2
WHERE p1.Purity=p2.Purity AND p1.ContainerId=p2.ContainerId AND
   p1.Line<p2.Line
GROUP BY p1.Line, p2.Line
HAVING 
   COUNT(*)=(SELECT COUNT(*) FROM ProductionFacility p3 WHERE p3.Line=p1.Line) 
   AND
   COUNT(*)=(SELECT COUNT(*) FROM ProductionFacility p4 WHERE p4.Line=p2.Line) 
