-- Comparing a Set with its Universe
--
-- Chapter 2 - Sets
-- Type of content: code
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT s.StudentName, s.CourseId,
    CASE WHEN COUNT(*)=MAX(c.numTermPapers) 
       THEN 'All submitted'
       ELSE CONVERT(VARCHAR(8),MAX(c.numTermPapers)-COUNT(*))+' missing'
    END status
FROM Students s JOIN CourseMaster c
   ON s.CourseId=c.CourseId
GROUP BY s.StudentName, s.CourseId
ORDER BY s.StudentName, s.CourseId

