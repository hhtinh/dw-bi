-- Finding Regions
--
-- Chapter 3 - Data Structures
-- Type of content: code
-- Date: 2002-1-17
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT DISTINCT p1.ContainerID
FROM ProductionLine p1, ProductionLine p2
WHERE
   p1.Purity=100 AND p2.Purity=100 AND
   abs(p1.ContainerId-p2.ContainerId)=1
