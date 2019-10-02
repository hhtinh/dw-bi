-- Working with Runs
--
-- Chapter 3 - Data Structures
-- Type of content: code
-- Date: 2002-1-17
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT 
   p1.ContainerId SeqBeg, p2.ContainerId SeqEnd
FROM ProductionLine p1, ProductionLine p2
WHERE 
   (p1.ContainerId < p2.ContainerId) AND
   NOT EXISTS(SELECT * FROM ProductionLine p3, ProductionLine p4 
      WHERE ( 
      p3.Purity<=p4.Purity AND 
      p4.ContainerId=p3.ContainerId-1 AND
      p3.ContainerId BETWEEN p1.ContainerId+1 AND p2.ContainerId) 
      OR (p3.ContainerId=p1.ContainerId-1 AND p3.Purity<p1.Purity) 
      OR (p3.ContainerId=p2.ContainerId+1 AND p3.Purity>p2.Purity))



