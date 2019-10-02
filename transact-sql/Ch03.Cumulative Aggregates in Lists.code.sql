-- Cumulative Aggregates in Lists
--
-- Chapter 3 - Data Structures
-- Type of content: code
-- Date: 2002-1-17
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT 
   p1.ContainerId, SUM(p2.Purity) Total, AVG(p2.Purity) Average 
FROM ProductionLine p1, ProductionLine p2
WHERE 
   p1.ContainerId >= p2.ContainerId
GROUP BY p1.ContainerId 


