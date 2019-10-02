-- Comparing Two Sets for Equality
--
-- Chapter 2 - Sets
-- Type of content: code
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT so.*, COUNT(*) DupeCount, 'StudentsOct' TableName
FROM StudentsOct so
GROUP BY so.CourseId, so.StudentName, so.Score, so.TermPaper
HAVING NOT EXISTS (
      SELECT sn.*, COUNT(*)
      FROM StudentsNov sn
      GROUP BY sn.CourseId, sn.StudentName, sn.Score, sn.TermPaper
      HAVING sn.CourseId=so.CourseId AND 
         sn.TermPaper=so.TermPaper AND 
         sn.StudentName=so.StudentName AND
         COUNT(*) = COUNT(ALL so.CourseId))
UNION
SELECT sn.*, COUNT(*) DupeCount, 'StudentsNov' TableName
FROM StudentsNov sn
GROUP BY sn.CourseId, sn.StudentName, sn.Score, sn.TermPaper
HAVING NOT EXISTS (
      SELECT so.*, COUNT(*)
      FROM StudentsOct so
      GROUP BY so.CourseId, so.StudentName, so.Score, so.TermPaper
      HAVING so.CourseId=sn.CourseId AND 
         so.TermPaper=sn.TermPaper AND 
         so.StudentName=sn.StudentName AND
         COUNT(*) = COUNT(ALL sn.CourseId))


SELECT so.*, COUNT(*) dupeCount, 'StudentsOct' tableName
FROM StudentsOct so
GROUP BY so.CourseId, so.StudentName, so.Score, so.TermPaper


SELECT so.*, 'StudentsOct' TableName
FROM StudentsOct so
WHERE NOT EXISTS (
      SELECT sn.*
      FROM StudentsNov sn
      WHERE sn.CourseId=so.CourseId AND 
         sn.TermPaper=so.TermPaper AND 
         sn.StudentName=so.StudentName)
UNION
SELECT sn.*, 'StudentsNov' TableName
FROM StudentsNov sn
WHERE NOT EXISTS (
      SELECT so.*
      FROM StudentsOct so
      WHERE so.CourseId=sn.CourseId AND 
         so.TermPaper=sn.TermPaper AND 
         so.StudentName=sn.StudentName)


SELECT sn.*, COUNT(*) DupeCount, 'StudentsNov' TableName
FROM StudentsNov sn
GROUP BY sn.CourseId, sn.StudentName, sn.Score, sn.TermPaper
HAVING NOT EXISTS (
      SELECT so.*, COUNT(*)
      FROM StudentsOct so
      GROUP BY so.CourseId, so.StudentName, so.Score, so.TermPaper
      HAVING so.CourseId=sn.CourseId AND 
         so.TermPaper=sn.TermPaper AND 
         so.StudentName=sn.StudentName AND
         COUNT(*) = COUNT(ALL sn.CourseId))

