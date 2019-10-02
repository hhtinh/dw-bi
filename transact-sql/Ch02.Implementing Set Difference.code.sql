-- Implementing Set Difference 
--
-- Chapter 2 - Sets
-- Type of content: code
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT s.CourseId, s.TermPaper
FROM Students s
WHERE s.StudentName='Andrew' AND 
   NOT EXISTS(
      SELECT * FROM Students s1 
      WHERE s1.CourseId=s.CourseId AND 
         s1.TermPaper=s.TermPaper AND 
         s1.StudentName='Cindy')


SELECT s.StudentName, s.CourseId, s.TermPaper
FROM Students s
WHERE s.StudentName<>'Cindy' AND
   NOT EXISTS(
      SELECT * FROM Students s1 
      WHERE s.CourseId=s1.CourseId AND 
         s.TermPaper=s1.TermPaper AND 
         s1.StudentName='Cindy')

SELECT s.CourseId, s.TermPaper
FROM Students s
WHERE s.StudentName='Andrew' AND 
   NOT EXISTS(
      SELECT * FROM Students s1 
      WHERE s1.CourseId=s.CourseId AND 
         s1.TermPaper=s.TermPaper AND 
         s1.StudentName<>'Andrew')
