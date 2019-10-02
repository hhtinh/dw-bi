-- Working with Sequences
--
-- Chapter 3 - Data Structures
-- Type of content: code
-- Date: 2002-1-17
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT 
   p1.ContainerId SeqBeg, p2.ContainerId SeqEnd,
   p2.ContainerId-p1.ContainerId+1 SequenceSize
FROM ProductionLine p1, ProductionLine p2
WHERE 
   (p1.ContainerId < p2.ContainerId) AND
   NOT EXISTS(SELECT * FROM ProductionLine p3 
      WHERE (p3.Purity-p3.ContainerId!=p1.Purity-p1.ContainerId AND 
      p3.ContainerId BETWEEN p1.ContainerId AND p2.ContainerId) 
      OR (p3.ContainerId=p1.ContainerId-1 AND 
         p3.Purity-p3.ContainerId=p1.Purity-p1.ContainerId) 
      OR (p3.ContainerId=p2.ContainerId+1 AND 
         p3.Purity-p3.ContainerId=p1.Purity-p1.ContainerId))


SELECT 
   p1.ContainerId SeqBeg, p2.ContainerId SeqEnd,
   p2.ContainerId-p1.ContainerId+1 SequenceSize
FROM ProductionLine p1, ProductionLine p2
WHERE 
   (p1.ContainerId < p2.ContainerId) AND
   p2.ContainerId-p1.ContainerId>=2 AND
   NOT EXISTS(SELECT * FROM ProductionLine p3 
      WHERE (p3.Purity-p3.ContainerId!=p1.Purity-p1.ContainerId AND 
      p3.ContainerId BETWEEN p1.ContainerId AND p2.ContainerId) 
      OR (p3.ContainerId=p1.ContainerId-1 AND 
         p3.Purity-p3.ContainerId=p1.Purity-p1.ContainerId) 
      OR (p3.ContainerId=p2.ContainerId+1 AND 
         p3.Purity-p3.ContainerId=p1.Purity-p1.ContainerId))
