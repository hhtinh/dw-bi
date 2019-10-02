-- Joining Arrays With Tables
--
-- Chapter 7 - Importing and Transforming Data
-- Type of content: code
-- Date: 2002-1-27
-- Version: 1.0
--
-- Authors: Ales Spetic, Jonathan Gennick


SELECT t.StudentId,p.Name 
FROM StudentThesis t JOIN Professors p
ON 
   t.Member1=p.Id OR 
   t.Member2=p.Id OR 
   t.Member3=p.Id


SELECT t.StudentId, s.StudentName, p.Name 
FROM StudentThesis t JOIN Professors p 
   ON(t.Member1=p.Id OR 
      t.Member2=p.Id OR 
      t.Member3=p.Id)
   JOIN Students s
   ON t.StudentId=s.StudentId


SELECT m.StudentId, p.Name
FROM
(SELECT t.StudentId StudentId,
      (CASE WHEN f.i=1 THEN t.Member1
            WHEN f.i=2 THEN t.Member2
            WHEN f.i=3 THEN t.Member3 END) Member
FROM StudentThesis t JOIN Pivot f
      ON f.i BETWEEN 1 AND 3) m 
   JOIN Professors p
      ON m.Member = p.Id
