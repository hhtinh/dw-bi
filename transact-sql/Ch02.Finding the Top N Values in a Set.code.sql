-- Finding the Top N Values in a Set
--
-- Chapter 2 - Sets
-- Type of content: code
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT  s1.StudentName, s1.CourseId, s1.TermPaper, MAX(s1.Score) Score
FROM Students s1
GROUP BY s1.CourseId, s1.StudentName, s1.TermPaper
HAVING MAX(s1.Score) IN 
   (SELECT TOP 2 s2.Score 
       FROM Students s2
       WHERE s1.CourseId=s2.CourseId AND
          s1.StudentName=s2.StudentName
    ORDER BY s2.Score DESC)
ORDER BY s1.StudentName, s1.CourseId, s1.Score DESC


SELECT  s1.StudentName,s1.CourseId, s1.TermPaper, MAX(s1.Score) Score
FROM Students s1 INNER JOIN Students s2
   ON s1.CourseId=s2.CourseId AND
      s1.StudentName=s2.StudentName
GROUP BY s1.CourseId, s1.StudentName, s1.TermPaper
HAVING SUM(CASE WHEN s1.Score <= s2.Score THEN 1 END) <= 2
ORDER BY s1.StudentName, s1.CourseId, s1.Score DESC



