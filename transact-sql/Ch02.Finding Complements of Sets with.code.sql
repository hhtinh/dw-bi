-- Finding Complements of Sets with Different Universes
--
-- Chapter 2 - Sets
-- Type of content: code
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT  s.StudentName, s.CourseId, f.i TermPaper
FROM Students s, Pivot f, CourseMaster c
WHERE f.i BETWEEN 1 AND c.numTermPapers 
  AND c.CourseId=s.CourseId 
GROUP BY s.StudentName, s.CourseId, f.i
HAVING NOT EXISTS(
   SELECT * FROM Students 
   WHERE CourseId=s.CourseId AND 
      StudentName=s.StudentName AND 
      TermPaper=f.i)
ORDER BY s.StudentName
