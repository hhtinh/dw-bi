-- Reporting the Size of a Set's Complement
--
-- Chapter 2 - Sets
-- Type of content: code
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

SELECT  s.StudentName, s.CourseId, 4-COUNT(TermPaper) Missing
FROM Students s
GROUP BY s.StudentName, s.CourseId
ORDER BY s.StudentName


