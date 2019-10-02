-- Summarizing Aggregated Classes
--
-- Chapter 2 - Sets
-- Type of content: code
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT s.StudentName,(
   CASE WHEN s.Score>=22 THEN 'A' 
      WHEN s.Score>=19 THEN 'B'
      WHEN s.Score>=16 THEN 'C'
      WHEN s.Score>=13 THEN 'D'
      WHEN s.Score>=10 THEN 'E'
      ELSE 'F' END) Grade,
   COUNT(*) NoOfCourses
FROM (
   SELECT CourseId, StudentName, AVG(Score) AS Score 
   FROM Students 
   GROUP BY CourseId, StudentName) AS s
GROUP BY s.StudentName,
   CASE WHEN s.Score>=22 THEN 'A' 
      WHEN s.Score>=19 THEN 'B'
      WHEN s.Score>=16 THEN 'C'
      WHEN s.Score>=13 THEN 'D'
      WHEN s.Score>=10 THEN 'E'
      ELSE 'F' END
ORDER BY s.StudentName
