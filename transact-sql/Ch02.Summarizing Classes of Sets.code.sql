-- Summarizing Classes of Sets
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
   COUNT(*) NoOfPapers
FROM Students s
GROUP BY s.StudentName,
   CASE WHEN s.Score>=22 THEN 'A' 
      WHEN s.Score>=19 THEN 'B'
      WHEN s.Score>=16 THEN 'C'
      WHEN s.Score>=13 THEN 'D'
      WHEN s.Score>=10 THEN 'E'
      ELSE 'F' END
ORDER BY s.StudentName


SELECT s.StudentName,(
   CASE WHEN s.Score>=22 THEN 'A' 
      WHEN s.Score>=19 THEN 'B'
      WHEN s.Score>=16 THEN 'C'
      WHEN s.Score>=13 THEN 'D'
      WHEN s.Score>=10 THEN 'E'
      ELSE 'F' END) Grade,
   COUNT(*) NoOfPapers,
   100*count(*)/(
      SELECT count(*) FROM Students s1
      WHERE s1.StudentName=s.StudentName) Per
FROM Students s
GROUP BY s.StudentName,
   CASE WHEN s.Score>=22 THEN 'A' 
      WHEN s.Score>=19 THEN 'B'
      WHEN s.Score>=16 THEN 'C'
      WHEN s.Score>=13 THEN 'D'
      WHEN s.Score>=10 THEN 'E'
      ELSE 'F' END
ORDER BY s.StudentName
