-- Classifying Subsets
--
-- Chapter 2 - Sets
-- Type of content: code
-- Date: 2002-1-7
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT CourseId, StudentName, AVG(Score) Score,(
   CASE WHEN AVG(Score)>=22 THEN 'A' 
      WHEN AVG(Score)>=19 THEN 'B'
      WHEN AVG(Score)>=16 THEN 'C'
      WHEN AVG(Score)>=13 THEN 'D'
      WHEN AVG(Score)>=10 THEN 'E'
      ELSE 'F' END) Grade
FROM Students s
GROUP BY CourseId, StudentName


SELECT CourseId, StudentName, AVG(Score) Score, 'A' grade
FROM Students s
GROUP BY CourseId, StudentName
HAVING AVG(Score)<=25 and AVG(Score)>=22
UNION
SELECT CourseId, StudentName, AVG(Score) Score, 'B' grade
FROM Students s
GROUP BY CourseId, StudentName
HAVING AVG(Score)<22 and AVG(Score)>=19
UNION
SELECT CourseId, StudentName, AVG(Score) Score, 'C' grade
FROM Students s
GROUP BY CourseId, StudentName
HAVING AVG(Score)<19 and AVG(Score)>=16
UNION
SELECT CourseId, StudentName, AVG(Score) Score, 'D' grade
FROM Students s
GROUP BY CourseId, StudentName
HAVING AVG(Score)<16 and AVG(Score)>=13
UNION
SELECT CourseId, StudentName, AVG(Score) Score, 'E' grade
FROM Students s
GROUP BY CourseId, StudentName
HAVING AVG(Score)<13 and AVG(Score)>=10
UNION
SELECT CourseId, StudentName, AVG(Score) Score, 'F' grade
FROM Students s
GROUP BY CourseId, StudentName
HAVING AVG(Score)<10
