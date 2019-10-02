-- Implementing Full Intersection
--
-- Chapter 2 - Sets
-- Type of content: code
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

SELECT CourseId, TermPaper 
FROM Students
GROUP BY TermPaper, CourseId
HAVING COUNT(*)=(SELECT COUNT(DISTINCT StudentName) FROM Students)

