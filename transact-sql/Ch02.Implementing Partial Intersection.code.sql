-- Implementing Partial Intersection
--
-- Chapter 2 - Sets
-- Type of content: code
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick

SELECT CourseId, TermPaper, COUNT(*) NumStudents
FROM Students
GROUP BY TermPaper, CourseId
ORDER BY  COUNT(*) DESC


SELECT CourseId, TermPaper, COUNT(*) NumStudents
FROM Students
GROUP BY TermPaper, CourseId
HAVING COUNT(*) >= 2
ORDER BY COUNT(*) DESC


SELECT CourseId, TermPaper
FROM Students
WHERE StudentName IN ('Andrew','Cindy')
GROUP BY TermPaper, CourseId
HAVING COUNT(*) >= 2
ORDER BY  COUNT(*) DESC

