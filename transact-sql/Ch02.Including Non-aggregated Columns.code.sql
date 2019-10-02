-- Including Non-aggregated Columns
--
-- Chapter 2 - Sets
-- Type of content: code
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick



SELECT StudentName,CourseId,
   (SELECT  MAX(TermPaper) 
      FROM Students 
      WHERE Score=MAX(s.Score)and 
         StudentName=s.StudentName and 
         CourseId=s.CourseId) TermPaper, 
   MAX(s.Score) Score
FROM Students s
GROUP BY CourseId, StudentName
