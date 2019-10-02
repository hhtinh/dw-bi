-- Aggregating Aggregates
--
-- Chapter 2 - Sets
-- Type of content: code
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT CourseId, MAX(l.s) Best ,MIN(l.s) Worst, 
   MAX(l.s)-MIN(l.s) Spread 
FROM (
   SELECT CourseId, AVG(Score) AS s 
   FROM Students 
   GROUP BY CourseId, StudentName) AS l
GROUP BY CourseId

